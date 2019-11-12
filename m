Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E86F94C0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 16:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA7689259;
	Tue, 12 Nov 2019 15:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C2D89487;
 Tue, 12 Nov 2019 15:52:54 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r10so19124210wrx.3;
 Tue, 12 Nov 2019 07:52:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KlI/w4iGgmfxEIzjQGA0tOMY3tGzHSo0L7rc1WR4Tww=;
 b=EniiqkqajOrqW43Tgas4miSh19AYX8tVFwHoctGNMh6h1pIXgLuI+PRFVpq1qgTkS7
 NLjJc+gjKmQKtDjvfy0Mtg2/VoZqxoNGabeexnevUwqN0GPtSuXkqzsCAOqnLBbFgevJ
 7Ig1XJsmY4LmfjUUltlHqZGiPencZB0EI0PI5SyhtQ/rHQQpPpISkknObszmsRhq5B1z
 xUix9QmMJyos9M5CuKxZNIUJ0KMNlZPozeklB6csQUDDVFeEgVGFw3w7RY06b2XGZZwo
 C/q8+iE030AWp4ikJpl7NBfRsI3geFl9NEO939wDoIcRgCbESLqKP8Y89tTdXPOTxR47
 dx+Q==
X-Gm-Message-State: APjAAAWv+Xz0IknVeW56oEu5hP6uVgCaDNBEOmbD1lH5QD9PCSgdk4NV
 aiftz+I7Xh6YoXDwSgNWsSwuVP4D6/BAwc1wvCw=
X-Google-Smtp-Source: APXvYqyR51zNVFTxc2XNo24rGAzDgHRLqcTcjPjLyL0l3uVC46ncoQjb2rfwmQfKNuaS/+Pq9thzuxvlUF9ZNE0wh4I=
X-Received: by 2002:adf:9d87:: with SMTP id p7mr25597794wre.11.1573573972656; 
 Tue, 12 Nov 2019 07:52:52 -0800 (PST)
MIME-Version: 1.0
References: <20191109093538.23964-1-yuehaibing@huawei.com>
 <20191112021050.13128-1-yuehaibing@huawei.com>
In-Reply-To: <20191112021050.13128-1-yuehaibing@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Nov 2019 10:52:40 -0500
Message-ID: <CADnq5_Mj5vHSrXq-tkwoRQ+fejfosSnRpia54MpsTddvKzothA@mail.gmail.com>
Subject: Re: [PATCH v2 -next] drm/amd/display: remove set but not used
 variable 'bpc'
To: YueHaibing <yuehaibing@huawei.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=KlI/w4iGgmfxEIzjQGA0tOMY3tGzHSo0L7rc1WR4Tww=;
 b=OF0C4tIdXYsl972TNJBl4pbhsNz/CCpB9n3zKmIKIeN4Agp0gIi0Mv93g/oEwmXfkt
 yVNReAZorkkGUdzT4gksywjD3mO+XCdyVKKoNVSkEsyeqKHGwbYmmOMZ5sezTcgpN/iH
 MFdtx75mctG3r6cEeQQcA0p6CAdnq5YDK16GMNrMoW/IUYAB29zgVz2Idm/toCecmgtu
 EFOBTG8Niyhk6shHZg7yvfC0VkYAhz8nfhViYAFaXuYDBZT4eCdt5fM8RL9d5QzUYYHY
 pU3eBwzub0BbvGGC23BM5QR9Iv/Ga6NsTscO0mHHNMhQILQapZsMm+GS9sXY37x2TQJN
 AlrA==
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Zhan Liu <Zhan.Liu@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMzoxMyBBTSBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1
YXdlaS5jb20+IHdyb3RlOgo+Cj4gRml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxl
JyB3YXJuaW5nOgo+Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9j
b3JlL2RjX2xpbmsuYzogSW4gZnVuY3Rpb24gZ2V0X3Bibl9mcm9tX3RpbWluZzoKPiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jOjIzNjQ6MTE6
IHdhcm5pbmc6Cj4gIHZhcmlhYmxlIGJwYyBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQt
c2V0LXZhcmlhYmxlXQo+Cj4gSXQgaXMgbm90IHVzZWQgc2luY2UgY29tbWl0IGU0OWY2OTM2M2Fk
ZiAoImRybS9hbWQvZGlzcGxheTogdXNlCj4gcHJvcGVyIGZvcm11bGEgdG8gY2FsY3VsYXRlIGJh
bmR3aWR0aCBmcm9tIHRpbWluZyIpLCB0aGlzIGFsc28KPiByZW1vdmUgZ2V0X2NvbG9yX2RlcHRo
KCksIHdoaWNoIGlzIG9ubHkgdXNlZCBoZXJlLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXVlSGFpYmlu
ZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgoKQXBwbGllZC4gIFRoYW5rcyEKCkFsZXgKCj4gLS0t
Cj4gdjI6IGFsc28gcmVtb3ZlIHVudXNlZCBnZXRfY29sb3JfZGVwdGgoKQo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgfCAxNSAtLS0tLS0tLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYwo+IGluZGV4IGJkYzhiZTMuLjFi
ZTQyNzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUv
ZGNfbGluay5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNf
bGluay5jCj4gQEAgLTI2MzgsMjggKzI2MzgsMTMgQEAgc3RhdGljIHN0cnVjdCBmaXhlZDMxXzMy
IGdldF9wYm5fcGVyX3Nsb3Qoc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtKQo+ICAgICAg
ICAgcmV0dXJuIGRjX2ZpeHB0X2Rpdl9pbnQobWJ5dGVzX3Blcl9zZWMsIDU0KTsKPiAgfQo+Cj4g
LXN0YXRpYyBpbnQgZ2V0X2NvbG9yX2RlcHRoKGVudW0gZGNfY29sb3JfZGVwdGggY29sb3JfZGVw
dGgpCj4gLXsKPiAtICAgICAgIHN3aXRjaCAoY29sb3JfZGVwdGgpIHsKPiAtICAgICAgIGNhc2Ug
Q09MT1JfREVQVEhfNjY2OiByZXR1cm4gNjsKPiAtICAgICAgIGNhc2UgQ09MT1JfREVQVEhfODg4
OiByZXR1cm4gODsKPiAtICAgICAgIGNhc2UgQ09MT1JfREVQVEhfMTAxMDEwOiByZXR1cm4gMTA7
Cj4gLSAgICAgICBjYXNlIENPTE9SX0RFUFRIXzEyMTIxMjogcmV0dXJuIDEyOwo+IC0gICAgICAg
Y2FzZSBDT0xPUl9ERVBUSF8xNDE0MTQ6IHJldHVybiAxNDsKPiAtICAgICAgIGNhc2UgQ09MT1Jf
REVQVEhfMTYxNjE2OiByZXR1cm4gMTY7Cj4gLSAgICAgICBkZWZhdWx0OiByZXR1cm4gMDsKPiAt
ICAgICAgIH0KPiAtfQo+IC0KPiAgc3RhdGljIHN0cnVjdCBmaXhlZDMxXzMyIGdldF9wYm5fZnJv
bV90aW1pbmcoc3RydWN0IHBpcGVfY3R4ICpwaXBlX2N0eCkKPiAgewo+IC0gICAgICAgdWludDMy
X3QgYnBjOwo+ICAgICAgICAgdWludDY0X3Qga2JwczsKPiAgICAgICAgIHN0cnVjdCBmaXhlZDMx
XzMyIHBlYWtfa2JwczsKPiAgICAgICAgIHVpbnQzMl90IG51bWVyYXRvcjsKPiAgICAgICAgIHVp
bnQzMl90IGRlbm9taW5hdG9yOwo+Cj4gLSAgICAgICBicGMgPSBnZXRfY29sb3JfZGVwdGgocGlw
ZV9jdHgtPnN0cmVhbV9yZXMucGl4X2Nsa19wYXJhbXMuY29sb3JfZGVwdGgpOwo+ICAgICAgICAg
a2JwcyA9IGRjX2JhbmR3aWR0aF9pbl9rYnBzX2Zyb21fdGltaW5nKCZwaXBlX2N0eC0+c3RyZWFt
LT50aW1pbmcpOwo+Cj4gICAgICAgICAvKgo+IC0tCj4gMi43LjQKPgo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
