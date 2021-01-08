Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2422EF936
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61E16E8CA;
	Fri,  8 Jan 2021 20:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D1C6E8CA;
 Fri,  8 Jan 2021 20:31:53 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id d189so12709361oig.11;
 Fri, 08 Jan 2021 12:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WOWvGccuA9CfphlY28N4bX1uXEPqXzSI/PRFbkID3nU=;
 b=DaiussA/9wHvPipkNTC0AFsJjBQp/JDFSjazIpukka2pKxkkWTZllNnMNgTPceeXje
 hKnl9Kgz3EMVYRAueTqv3uC/OBi3W6PhfY/XAK1R6XI0BXrlKOpsfqAF2ZdBsWvm4UUk
 f8udo/1e/hFlb5P/j4NvcNgufZeK0o4fSRVw+gGBvd22t55A+bOvmCtTj0A8qQbRf9wZ
 Ry7UM8Rtk/rNw2iFPYATox94gB9KUBm8F7nkkWz6uP9WdkthwE0LZQPp9jTSXqmCROA5
 hvPswPCO2/Wa6O+qyvarEA6IVcKuKBLxBJ6wrl6ck3Yl+01dZ4ij1uRwjS/Ot3VtT3Xb
 pwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WOWvGccuA9CfphlY28N4bX1uXEPqXzSI/PRFbkID3nU=;
 b=gZJC33wa87NG6sdF6jmE0B5D602f+SeV9FEjq3f92vn8cnjcP7Zt0/0naW3ikw96K8
 3sabWHGCUylfsanyig3J2yxE+2bBIQ1iGeJhrZ+tFo1ulpgjiY+rUQ//oaN5BjJXv+ON
 wSre5ilvrzU/wflZKG+OUVtM6Dh9mLHKKu1sAENIYRLRTGuDTYThHAmiXIpM/re7hS5e
 pu6fUstB4/EnpsqeC1VRs4Ifl2PUdOirDco8lXg6JpVFKYvXXO9X82N13UeuOnhg/BlF
 0yrddqMKYO/3hTABU/3tOzRQPTmQI1IuQXQTO1g4Y5lKJ/gAklCW8QbJyuYaDxL2pTBf
 2exA==
X-Gm-Message-State: AOAM533B13zG3x+bmVWbnUJeLgji0G1h8vLbMB6EBAscvWj5B7QP7LqG
 F3naveiJ8DIWzf9bVaomTQwUErqH7HKNFcvSCic=
X-Google-Smtp-Source: ABdhPJyD9/zbc4Uufjw1vw5XaOQE/ALgK3ZSZ4xRYX0adlNEEVoHhBHo5HKaAAYVKb5sI7A0VRrZB57WwsEm2b20HNs=
X-Received: by 2002:a54:4083:: with SMTP id i3mr3402827oii.120.1610137913376; 
 Fri, 08 Jan 2021 12:31:53 -0800 (PST)
MIME-Version: 1.0
References: <20210108201457.3078600-1-lee.jones@linaro.org>
 <20210108201457.3078600-6-lee.jones@linaro.org>
In-Reply-To: <20210108201457.3078600-6-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Jan 2021 15:31:42 -0500
Message-ID: <CADnq5_M91oJ4sOJCWs1s390mRAMMd=mpOZKowvDAupzrqPZORg@mail.gmail.com>
Subject: Re: [PATCH 05/40] drm/amd/amdgpu/vega20_ih: Add missing descriptions
 for 'ih' and fix spelling error
To: Lee Jones <lee.jones@linaro.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, Feifei Xu <Feifei.Xu@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gOCwgMjAyMSBhdCAzOjE1IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTIwX2loLmM6Mzc4
OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdpaCcgbm90IGRlc2NyaWJl
ZCBpbiAndmVnYTIwX2loX2dldF93cHRyJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92
ZWdhMjBfaWguYzo0MjE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2lo
JyBub3QgZGVzY3JpYmVkIGluICd2ZWdhMjBfaWhfaXJxX3JlYXJtJwo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS92ZWdhMjBfaWguYzo0NDc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRl
ciBvciBtZW1iZXIgJ2loJyBub3QgZGVzY3JpYmVkIGluICd2ZWdhMjBfaWhfc2V0X3JwdHInCj4K
PiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hy
aXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4gQ2M6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4KPiBDYzogRmVp
ZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYt
Ynk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoK
QWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmVnYTIwX2loLmMgfCA1
ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMjBfaWguYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2EyMF9paC5jCj4gaW5kZXggNDIwMzJjYTM4
MGNjZi4uNWEzYzg2N2Q1ODgxMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS92ZWdhMjBfaWguYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZlZ2Ey
MF9paC5jCj4gQEAgLTg4LDcgKzg4LDcgQEAgc3RhdGljIHZvaWQgdmVnYTIwX2loX2luaXRfcmVn
aXN0ZXJfb2Zmc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgKiB2ZWdhMjBfaWhf
dG9nZ2xlX3JpbmdfaW50ZXJydXB0cyAtIHRvZ2dsZSB0aGUgaW50ZXJydXB0IHJpbmcgYnVmZmVy
Cj4gICAqCj4gICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBvaW50ZXIKPiAtICogQGloOiBhbWRn
cHVfaWhfcmluZyBwb2ludGV0Cj4gKyAqIEBpaDogYW1kZ3B1X2loX3JpbmcgcG9pbnRlcgo+ICAg
KiBAZW5hYmxlOiB0cnVlIC0gZW5hYmxlIHRoZSBpbnRlcnJ1cHRzLCBmYWxzZSAtIGRpc2FibGUg
dGhlIGludGVycnVwdHMKPiAgICoKPiAgICogVG9nZ2xlIHRoZSBpbnRlcnJ1cHQgcmluZyBidWZm
ZXIgKFZFR0EyMCkKPiBAQCAtMzY3LDYgKzM2Nyw3IEBAIHN0YXRpYyB2b2lkIHZlZ2EyMF9paF9p
cnFfZGlzYWJsZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgICogdmVnYTIwX2loX2dl
dF93cHRyIC0gZ2V0IHRoZSBJSCByaW5nIGJ1ZmZlciB3cHRyCj4gICAqCj4gICAqIEBhZGV2OiBh
bWRncHVfZGV2aWNlIHBvaW50ZXIKPiArICogQGloOiBhbWRncHVfaWhfcmluZyBwb2ludGVyCj4g
ICAqCj4gICAqIEdldCB0aGUgSUggcmluZyBidWZmZXIgd3B0ciBmcm9tIGVpdGhlciB0aGUgcmVn
aXN0ZXIKPiAgICogb3IgdGhlIHdyaXRlYmFjayBtZW1vcnkgYnVmZmVyIChWRUdBMjApLiAgQWxz
byBjaGVjayBmb3IKPiBAQCAtNDE0LDYgKzQxNSw3IEBAIHN0YXRpYyB1MzIgdmVnYTIwX2loX2dl
dF93cHRyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgKiB2ZWdhMjBfaWhfaXJxX3Jl
YXJtIC0gcmVhcm0gSVJRIGlmIGxvc3QKPiAgICoKPiAgICogQGFkZXY6IGFtZGdwdV9kZXZpY2Ug
cG9pbnRlcgo+ICsgKiBAaWg6IGFtZGdwdV9paF9yaW5nIHBvaW50ZXIKPiAgICoKPiAgICovCj4g
IHN0YXRpYyB2b2lkIHZlZ2EyMF9paF9pcnFfcmVhcm0oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsCj4gQEAgLTQzOSw2ICs0NDEsNyBAQCBzdGF0aWMgdm9pZCB2ZWdhMjBfaWhfaXJxX3JlYXJt
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgKiB2ZWdhMjBfaWhfc2V0X3JwdHIgLSBz
ZXQgdGhlIElIIHJpbmcgYnVmZmVyIHJwdHIKPiAgICoKPiAgICogQGFkZXY6IGFtZGdwdV9kZXZp
Y2UgcG9pbnRlcgo+ICsgKiBAaWg6IGFtZGdwdV9paF9yaW5nIHBvaW50ZXIKPiAgICoKPiAgICog
U2V0IHRoZSBJSCByaW5nIGJ1ZmZlciBycHRyLgo+ICAgKi8KPiAtLQo+IDIuMjUuMQo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
