Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 405DF100D11
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 21:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE176E82B;
	Mon, 18 Nov 2019 20:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C56426E82A;
 Mon, 18 Nov 2019 20:24:28 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a15so21087929wrf.9;
 Mon, 18 Nov 2019 12:24:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1TP0OA6qAUarvzHjPaXa1q3NuiVFGsPfLMvD1RhmmCY=;
 b=npqtpQh4y2ohQYH67kHatDItQPKOQphCY/GuwLO42P9xQRAcumcMQXapG+eMhw76Jh
 t7dVsQDKOX4ijwgRCWqTyVSEP6H/rOyttHRu2Rx3Pvt34YRVQIcUmEMvon4AVC5VH9Lr
 1IVr9oRj6o8kdXZg82IHnvp+XnBiCzv93MKWEZm9oiN2/BODjEeISgKBSaH5/1G9DN5s
 ypuybyoDqTyl3Me19wta1DWm80xU8VnfB4h6T/qkGMKCb09lDrUzNX5iUYlpWBVQQuFf
 LqXHOMlzg3cd9FNDsepo1u/AFaGRaH8cPmRB/0hQoITh2Z21Yaage8fdPMpt1uUd0ZAE
 j+gg==
X-Gm-Message-State: APjAAAUjHSsk22VtoVNoKJ0uMkgEwe3+JaZoRMYIwvBwOPVdb2HREuda
 UcGC1D5VHPRalig433UFVbFQKZrNcOtWMYcp1F0=
X-Google-Smtp-Source: APXvYqyWKIvojuyIkn9PhBUmCnA+BIbkZlyEb9tBgjPQlLDHLHnK6Mn8Li8qCQVenOtWz4sjXqxHztqmgocAHdd4TPs=
X-Received: by 2002:adf:e444:: with SMTP id t4mr9612725wrm.50.1574108667374;
 Mon, 18 Nov 2019 12:24:27 -0800 (PST)
MIME-Version: 1.0
References: <1573875799-83572-1-git-send-email-chenwandun@huawei.com>
 <1574064214-109525-1-git-send-email-chenwandun@huawei.com>
 <MN2PR12MB3344BBBA7F72F9625D71329EE44D0@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344BBBA7F72F9625D71329EE44D0@MN2PR12MB3344.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Nov 2019 15:24:13 -0500
Message-ID: <CADnq5_OYLYxwDsiqmDn0tJqrvdHc119LOGPSLuG=g2ShL4_oFQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/powerplay: return errno code to caller when
 error occur
To: "Quan, Evan" <Evan.Quan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1TP0OA6qAUarvzHjPaXa1q3NuiVFGsPfLMvD1RhmmCY=;
 b=AbkzR/HkTUrIdzHZR1Hn4Mw0IXd15Hbl8V3PLYisq2ODU1nwdZ9uSlzIdR1VbZ/LVG
 HgSmQcT3uDM15WcvVJ+/UPy8zZ8sqsKYQs1dPR8elnvEZ2/yawvQDqIplgLUwg5b+oGa
 H++5CFDB8Djm1Oc6rX/BFY8LBBI30stVNS2SlIqCR/i8IkVg/dVGsYkHSG0QLv0bapcx
 nTYMmGaRPh/IgaZV/xxDLCpY+UaOBCh+EXc3uH9vNLOIPhmREpWZ0SiXc7k5rZizpiqI
 nDekWyJeZWZzxhrZpPwBm7kCnvWIrZ+IZ3OX9xfuaAALOtAo7RwMA4Xam3lhhvu4AMrV
 TC9Q==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Chen Wandun <chenwandun@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCk9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDM6MTUgQU0g
UXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+IHdyb3RlOgo+Cj4gUmV2aWV3ZWQtYnk6IEV2
YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Cj4KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tCj4gPiBGcm9tOiBDaGVuIFdhbmR1biA8Y2hlbndhbmR1bkBodWF3ZWkuY29tPgo+ID4gU2Vu
dDogTW9uZGF5LCBOb3ZlbWJlciAxOCwgMjAxOSA0OjA0IFBNCj4gPiBUbzogUXVhbiwgRXZhbiA8
RXZhbi5RdWFuQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIKPiA+IDxBbGV4YW5kZXIuRGV1
Y2hlckBhbWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LQo+ID4g
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
ID4gQ2M6IGNoZW53YW5kdW5AaHVhd2VpLmNvbQo+ID4gU3ViamVjdDogW1BBVENIIHYyXSBkcm0v
YW1kL3Bvd2VycGxheTogcmV0dXJuIGVycm5vIGNvZGUgdG8gY2FsbGVyIHdoZW4KPiA+IGVycm9y
IG9jY3VyCj4gPgo+ID4gcmV0dXJuIGVycm5vIGNvZGUgdG8gY2FsbGVyIHdoZW4gZXJyb3Igb2Nj
dXIsIGFuZCBtZWFud2hpbGUgcmVtb3ZlIGdjYyAnLQo+ID4gV3VudXNlZC1idXQtc2V0LXZhcmlh
YmxlJyB3YXJuaW5nLgo+ID4KPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2Vy
cGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmM6IEluCj4gPiBmdW5jdGlvbiB2ZWdhbV9wb3B1bGF0
ZV9zbWNfYm9vdF9sZXZlbDoKPiA+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3Bvd2Vy
cGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmM6MTM2NDoKPiA+IDY6IHdhcm5pbmc6IHZhcmlhYmxl
IHJlc3VsdCBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IENoZW4gV2FuZHVuIDxjaGVud2FuZHVuQGh1YXdlaS5jb20+Cj4g
PiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211
bWdyLmMgfCA1ICsrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVn
YW1fc211bWdyLmMKPiA+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3Zl
Z2FtX3NtdW1nci5jCj4gPiBpbmRleCAyMDY4ZWIwLi41MDg5NmU5IDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1nci5jCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmMK
PiA+IEBAIC0xMzcxLDExICsxMzcxLDE2IEBAIHN0YXRpYyBpbnQgdmVnYW1fcG9wdWxhdGVfc21j
X2Jvb3RfbGV2ZWwoc3RydWN0Cj4gPiBwcF9od21nciAqaHdtZ3IsCj4gPiAgICAgICByZXN1bHQg
PSBwaG1fZmluZF9ib290X2xldmVsKCYoZGF0YS0+ZHBtX3RhYmxlLnNjbGtfdGFibGUpLAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgIGRhdGEtPnZiaW9zX2Jvb3Rfc3RhdGUuc2Nsa19ib290dXBf
dmFsdWUsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgKHVpbnQzMl90ICopJih0YWJsZS0+R3Jh
cGhpY3NCb290TGV2ZWwpKTsKPiA+ICsgICAgIGlmIChyZXN1bHQpCj4gPiArICAgICAgICAgICAg
IHJldHVybiByZXN1bHQ7Cj4gPgo+ID4gICAgICAgcmVzdWx0ID0gcGhtX2ZpbmRfYm9vdF9sZXZl
bCgmKGRhdGEtPmRwbV90YWJsZS5tY2xrX3RhYmxlKSwKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICBkYXRhLT52Ymlvc19ib290X3N0YXRlLm1jbGtfYm9vdHVwX3ZhbHVlLAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICh1aW50MzJfdCAqKSYodGFibGUtPk1lbW9yeUJvb3RMZXZlbCkpOwo+ID4K
PiA+ICsgICAgIGlmIChyZXN1bHQpCj4gPiArICAgICAgICAgICAgIHJldHVybiByZXN1bHQ7Cj4g
PiArCj4gPiAgICAgICB0YWJsZS0+Qm9vdFZkZGMgID0gZGF0YS0+dmJpb3NfYm9vdF9zdGF0ZS52
ZGRjX2Jvb3R1cF92YWx1ZSAqCj4gPiAgICAgICAgICAgICAgICAgICAgICAgVk9MVEFHRV9TQ0FM
RTsKPiA+ICAgICAgIHRhYmxlLT5Cb290VmRkY2kgPSBkYXRhLT52Ymlvc19ib290X3N0YXRlLnZk
ZGNpX2Jvb3R1cF92YWx1ZSAqCj4gPiAtLQo+ID4gMi43LjQKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
