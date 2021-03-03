Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C008E32B8EA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 16:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17AA6E0EB;
	Wed,  3 Mar 2021 15:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711796E0EB;
 Wed,  3 Mar 2021 15:23:08 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id g8so20245739otk.4;
 Wed, 03 Mar 2021 07:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=03LVkMkDFQRNhHiuk8kPbyos2+C08G21+Pb9aPcNsbI=;
 b=Ma16FxV6movCHSVnqY0o/p4pFQN26Dy2vfqYj+aUKdbCcXC+pvYF1IvC4H1SFt0eRC
 ZcwnmPLn0PQ8t6fOFcwbdkA3Df5Sk6WzomDYbjMbgKauPVzNKswvHRPitdqefiuuRBHH
 k+S3oHfjgqhiaxhotzeEgxTue5Hgs+MukBV7K+zM0kVU9aEFVzAK5HdVX3Bq10096DBB
 u+g/INhCcIeLl6DvOejFyStWY2EQpgPCPHAsvQFvrP4sXl2YhJt+naZGv6A4JYYVuzoM
 F1vS40QKMvDt9+ow4t4RzvZ0wzKg7kQL8GO+Agy1ejtvVqgukD2uqogtcDShSr+Oiolx
 3FlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=03LVkMkDFQRNhHiuk8kPbyos2+C08G21+Pb9aPcNsbI=;
 b=M8o6RBzVXZonKjX0qgtsw7FMf7YwX8nzg0bWu5U/4mAnERtNmN/CWFnmiW1eOz17zY
 FTz91c+jNW1v37EHS5JaIz4UthgI0VsUyA6Q4DAl/shNuIWV7t4yf4L1TPS/R99+F4Ub
 BxmNYlVXjh+15PY/uPatqiQ5VchS4uMjjbO0cM6GgmQIrKZCWCl+yyWTI+qSkSaM1mWI
 RIEsQJmlhav1o24/1tE3DdZXvdubcwP3SFLTmKvyZHUP1oyE/yl6qj/dNfmlQIkDct9S
 CYHTjmaRbOKVC9Yj5Zdoe7IXhWVqNGJ0nOpbciymLcTBI1BLsMX8tBP9dNH7Qxb6Gjwf
 F0yQ==
X-Gm-Message-State: AOAM530pM7mIvAh+9igIkt8ZvEIarrqz4xIR0v7roqJlHB0m4VKJVdFT
 R22wmDujgV7cpN2Yda587ryvf7y4jJHu0ALi854=
X-Google-Smtp-Source: ABdhPJyvcIB0lg9d4EmsJpSurkNzxjIde6sw+k4XQp+cf3DJ0qN1rBdINSKS5rlxIp3psa2ri4PkN4RsXQY3xu1y9JM=
X-Received: by 2002:a9d:760a:: with SMTP id k10mr22906018otl.23.1614784987261; 
 Wed, 03 Mar 2021 07:23:07 -0800 (PST)
MIME-Version: 1.0
References: <20210303134319.3160762-1-lee.jones@linaro.org>
 <20210303134319.3160762-8-lee.jones@linaro.org>
In-Reply-To: <20210303134319.3160762-8-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 3 Mar 2021 10:22:56 -0500
Message-ID: <CADnq5_O6-Cc3qkO3+qPoSH+M_35f+HgBWDy_Pjuz4fzPuctA_A@mail.gmail.com>
Subject: Re: [PATCH 07/53] drm/amd/display/dc/bios/command_table: Remove
 unused variable and associated comment
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMywgMjAyMSBhdCA4OjQzIEFNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9i
aW9zL2NvbW1hbmRfdGFibGUuYzogSW4gZnVuY3Rpb24g4oCYYWRqdXN0X2Rpc3BsYXlfcGxsX3Yy
4oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2Jpb3MvY29t
bWFuZF90YWJsZS5jOjE0NjI6MTE6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhwaXhlbF9j
bG9ja18xMEtIel9pbuKAmSBbLVd1bnVzZWQtdmFyaWFibGVdCj4KPiBDYzogSGFycnkgV2VudGxh
bmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQu
Y29tPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KPiBDYzogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiBDYzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+
CgpTYW1lIGNvbW1lbnQgYXMgcGF0Y2ggNC4KCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9jb21tYW5kX3RhYmxlLmMgfCA0IC0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2Jpb3MvY29tbWFuZF90YWJsZS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2Jpb3MvY29tbWFuZF90YWJsZS5jCj4gaW5kZXggOWQzYmMzYTA3MzgyMS4u
ZTg3OWNlYjBjNDllZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvYmlvcy9jb21tYW5kX3RhYmxlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvYmlvcy9jb21tYW5kX3RhYmxlLmMKPiBAQCAtMTUxOCwxMCArMTUxOCw2IEBAIHN0YXRp
YyBlbnVtIGJwX3Jlc3VsdCBhZGp1c3RfZGlzcGxheV9wbGxfdjIoCj4gIHsKPiAgICAgICAgIGVu
dW0gYnBfcmVzdWx0IHJlc3VsdCA9IEJQX1JFU1VMVF9GQUlMVVJFOwo+Cj4gLSAgICAgICAvKiBX
ZSBuZWVkIHRvIGNvbnZlcnQgZnJvbSBLSHogdW5pdHMgaW50byAxMEtIeiB1bml0cyBhbmQgdGhl
biBjb252ZXJ0Cj4gLSAgICAgICAgKiBvdXRwdXQgcGl4ZWwgY2xvY2sgYmFjayAxMEtIei0tPktI
eiAqLwo+IC0gICAgICAgdWludDMyX3QgcGl4ZWxfY2xvY2tfMTBLSHpfaW4gPSBicF9wYXJhbXMt
PnBpeGVsX2Nsb2NrIC8gMTA7Cj4gLQo+ICAgICAgICAgYnAtPmNtZF9oZWxwZXItPmVuY29kZXJf
aWRfdG9fYXRvbSgKPiAgICAgICAgICAgICAgICAgZGFsX2dyYXBoaWNzX29iamVjdF9pZF9nZXRf
ZW5jb2Rlcl9pZChicF9wYXJhbXMtPmVuY29kZXJfb2JqZWN0X2lkKSk7Cj4gICAgICAgICBicC0+
Y21kX2hlbHBlci0+ZW5jb2Rlcl9tb2RlX2JwX3RvX2F0b20oYnBfcGFyYW1zLT5zaWduYWxfdHlw
ZSwgZmFsc2UpOwo+IC0tCj4gMi4yNy4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
