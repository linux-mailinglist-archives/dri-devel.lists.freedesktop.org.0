Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB322C908C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 23:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F333189C03;
	Mon, 30 Nov 2020 22:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0832889C03;
 Mon, 30 Nov 2020 22:06:07 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id h19so12933635otr.1;
 Mon, 30 Nov 2020 14:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N/BIAB+3qaydOQmoAXD2gYvBOx6Hxgrc3oXWqX3KTcg=;
 b=K4GFcuyqiqNLgzZn1T9c7dVwGqRrf81Ejc8vwiv/XeZebx0GQvClkwaz0pSsH7xlZf
 47gpRlsceR9ApLRbAdEPX5Pfx07iWxJu5s+k9+RMyfkvWW2eO/dWLxtlsyuexPDMRo3O
 7exviW3VDrMCTO/BpOw0y9HgY38LxwIdnG0jUIVNxPoeuvgmjXZ8SnL7Q8IOgeHNsCZ0
 +0w5p4Rog9XdO/cLLtqaaqmEHy+R1ioyfZ8o5+mhyADABfSKdvKRbeyukgA4MC+FYrvt
 FZrtwYVoFiECHmQUbQK6U0cn6xO7PuJUZbKfF3qn/qPI6Ee9jJ29V7vhGVVHv7/r14Zs
 Bkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N/BIAB+3qaydOQmoAXD2gYvBOx6Hxgrc3oXWqX3KTcg=;
 b=W4Fanc6caGWRXq+6VKkDpU+lWfUV3tenBOptfDRzKG6bWxWijIp3IckKUeHikMdeIM
 75+6ThSyMILH3zNfzi9aAB8CEqFvlHaGcmylh+pJ+AZ5uqDT9LFdKr82ujy8xzzlAqgH
 qWqilYCVh5hieMwchD9k63XV7rNx7JinkN7+u0VSbW0XvN8Ar8aZ6N1f1jgz1kkjyQ1r
 XopV9WdFVXThM9KPp38X3SKZSCzVAr3/GdK9zliaaT+Tz3uv02CYLcd4qFyyWKZkQCuI
 4+2qd52J3Mgiz81R0kCuMDgpzAFiyR0KOoESCe4dqwlgdmW9gs9GWCxJaTdN5FcNsqHw
 5Dxw==
X-Gm-Message-State: AOAM533p+AV88a+/I8kDpQ0mLp1/9761ydoXOIKoPO5MODJwAc+oGAoG
 K+0mSlJX83KeeLYFV8sYFof6lWrYFM4tvrqTw6A=
X-Google-Smtp-Source: ABdhPJwuPIsDL9DXJHpXHCnbIsXVARz81MaHdcJyq4L4DNNB9V7lwiXnANIWQAHVF826sQiE5wIib6N8gYCeaM/LcjE=
X-Received: by 2002:a05:6830:22e4:: with SMTP id
 t4mr18947140otc.23.1606773966389; 
 Mon, 30 Nov 2020 14:06:06 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-5-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-5-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:05:54 -0500
Message-ID: <CADnq5_MW7y7XZJMYni-sU1hEKfvS+XVMFLWT88xbKwEQWsL2jQ@mail.gmail.com>
Subject: Re: [PATCH 04/40] drm/amd/amdgpu/iceland_ih: Add missing function
 param descriptions for 'ih' and 'entry'
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2ljZWxhbmRfaWguYzox
OTE6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2loJyBub3QgZGVzY3Jp
YmVkIGluICdpY2VsYW5kX2loX2dldF93cHRyJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9pY2VsYW5kX2loLmM6MjIzOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVy
ICdpaCcgbm90IGRlc2NyaWJlZCBpbiAnaWNlbGFuZF9paF9kZWNvZGVfaXYnCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2ljZWxhbmRfaWguYzoyMjM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ2VudHJ5JyBub3QgZGVzY3JpYmVkIGluICdpY2VsYW5kX2loX2Rl
Y29kZV9pdicKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvaWNlbGFuZF9paC5jOjI1Mzog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnaWgnIG5vdCBkZXNjcmliZWQg
aW4gJ2ljZWxhbmRfaWhfc2V0X3JwdHInCj4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4gIFRoYW5r
cyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2ljZWxhbmRfaWgu
YyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvaWNlbGFuZF9paC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvaWNlbGFuZF9paC5jCj4gaW5kZXggYTEzZGQ5YTUxMTQ5YS4uMzdk
OGI2Y2E0ZGFiOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9pY2Vs
YW5kX2loLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9pY2VsYW5kX2loLmMK
PiBAQCAtMTc5LDYgKzE3OSw3IEBAIHN0YXRpYyB2b2lkIGljZWxhbmRfaWhfaXJxX2Rpc2FibGUo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAqIGljZWxhbmRfaWhfZ2V0X3dwdHIgLSBn
ZXQgdGhlIElIIHJpbmcgYnVmZmVyIHdwdHIKPiAgICoKPiAgICogQGFkZXY6IGFtZGdwdV9kZXZp
Y2UgcG9pbnRlcgo+ICsgKiBAaWg6IElIIHJpbmcgYnVmZmVyIHRvIGZldGNoIHdwdHIKPiAgICoK
PiAgICogR2V0IHRoZSBJSCByaW5nIGJ1ZmZlciB3cHRyIGZyb20gZWl0aGVyIHRoZSByZWdpc3Rl
cgo+ICAgKiBvciB0aGUgd3JpdGViYWNrIG1lbW9yeSBidWZmZXIgKFZJKS4gIEFsc28gY2hlY2sg
Zm9yCj4gQEAgLTIxMyw2ICsyMTQsOCBAQCBzdGF0aWMgdTMyIGljZWxhbmRfaWhfZ2V0X3dwdHIo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAqIGljZWxhbmRfaWhfZGVjb2RlX2l2IC0g
ZGVjb2RlIGFuIGludGVycnVwdCB2ZWN0b3IKPiAgICoKPiAgICogQGFkZXY6IGFtZGdwdV9kZXZp
Y2UgcG9pbnRlcgo+ICsgKiBAaWg6IElIIHJpbmcgYnVmZmVyIHRvIGRlY29kZQo+ICsgKiBAZW50
cnk6IElWIGVudHJ5IHRvIHBsYWNlIGRlY29kZWQgaW5mb3JtYXRpb24gaW50bwo+ICAgKgo+ICAg
KiBEZWNvZGVzIHRoZSBpbnRlcnJ1cHQgdmVjdG9yIGF0IHRoZSBjdXJyZW50IHJwdHIKPiAgICog
cG9zaXRpb24gYW5kIGFsc28gYWR2YW5jZSB0aGUgcG9zaXRpb24uCj4gQEAgLTI0NSw2ICsyNDgs
NyBAQCBzdGF0aWMgdm9pZCBpY2VsYW5kX2loX2RlY29kZV9pdihzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKPiAgICogaWNlbGFuZF9paF9zZXRfcnB0ciAtIHNldCB0aGUgSUggcmluZyBidWZm
ZXIgcnB0cgo+ICAgKgo+ICAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gKyAqIEBp
aDogSUggcmluZyBidWZmZXIgdG8gc2V0IHJwdHIKPiAgICoKPiAgICogU2V0IHRoZSBJSCByaW5n
IGJ1ZmZlciBycHRyLgo+ICAgKi8KPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
