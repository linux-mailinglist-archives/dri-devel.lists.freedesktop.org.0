Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FF32C2CF2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 17:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A499A6E45E;
	Tue, 24 Nov 2020 16:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319726E435;
 Tue, 24 Nov 2020 16:30:16 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p22so2931288wmg.3;
 Tue, 24 Nov 2020 08:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G8IAtlr5m1gYnRAMobJiAIZSerjuCkgbFe4M5d9hPSg=;
 b=iOHS4wBfvNCggF1/tVIhDzsNrlETd0MbF+Jb7aCaUudrbcubXA/pNWjtFNvNYRqZ3r
 x8c4do+a7c2KzFNV/uELb3ag5z0UXboovCaP3iM9MK7FmyhQHcnhFiqQ+Pb6NLTaE1ay
 eHaIC6FOof1qwNxYouhJvJzjoPIviiCPKUQjY6f44VKJ1g3UA3p235BrAq7Z9cKompVZ
 vB8/y0IV++mlsADdnU9iQwGrwHIwtCTMx+Q65CZbJEp5oZIPJx6AM6cyj+V04IUSC7Rc
 6W48HQEb7kAcBQfmsfEy3669pUlL3MAzlaOCQk4lAtoey9uFLsi5n488mi+qJfWiXgS2
 N8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G8IAtlr5m1gYnRAMobJiAIZSerjuCkgbFe4M5d9hPSg=;
 b=T77jEWflUaqdWRiNchjzbt7IYB2tLPRNcxLs4jAnGF5VOeEU1x/5GQzY6whJ5nqx28
 B4WOG32bDjcRU4maP5NScH5sqVGcx1HcCyAiU8NcdyuoEwFTKuF1QBqk+eeSVFfSgkp0
 NeZeh/wwGrXCcWFsaKwFIv5NYuRuoGrJ9X2JMQzMPm0HpJtq6n6k2Ol6YqHkWVc94KNj
 NWpwjLRryrGVZboV2i0263JEjvsDA96O5xV8KW2Ihlq/U29gAhGHQd5Vtq2mmm/3XxO3
 yiekgKizVZ6Y8IwQgqvEQvrQ438N5o8R8pXkG5YBYOgrMzT/jbI9RGtShNm+G9CoaUzY
 vK1A==
X-Gm-Message-State: AOAM532lRTAG4FfEhhWbLTsbzOcFVvt9Iy4q1VIBDHg2QPEovdv92ctK
 v3+eYlIUcGPm19zgedCRqYb67De4zt4V03a4+fo=
X-Google-Smtp-Source: ABdhPJx8GcGOsSIBYK5cUimv6QWYaz7yYoCPmjQWAfTMLBeTCkWj3w0W1q3MnGgjxOgTL5xbim7VpqeTT61jbjsEX1U=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr5340007wmi.70.1606235414853; 
 Tue, 24 Nov 2020 08:30:14 -0800 (PST)
MIME-Version: 1.0
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-41-lee.jones@linaro.org>
In-Reply-To: <20201123111919.233376-41-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Nov 2020 11:30:03 -0500
Message-ID: <CADnq5_OwhSqyfv-vybWM4R-NuNXdT=tF-Af75utcSDRmHBj9DQ@mail.gmail.com>
Subject: Re: [PATCH 40/40] drm/amd/amdgpu/gmc_v9_0: Suppy some missing
 function doc descriptions
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

T24gTW9uLCBOb3YgMjMsIDIwMjAgYXQgNjoyMSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmM6Mzgy
OjIzOiB3YXJuaW5nOiDigJhlY2NfdW1jX21jdW1jX3N0YXR1c19hZGRyc+KAmSBkZWZpbmVkIGJ1
dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjlfMC5jOjcyMDogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9y
IG1lbWJlciAndm1odWInIG5vdCBkZXNjcmliZWQgaW4gJ2dtY192OV8wX2ZsdXNoX2dwdV90bGIn
Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmM6ODM2OiB3YXJuaW5nOiBG
dW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdmbHVzaF90eXBlJyBub3QgZGVzY3JpYmVkIGlu
ICdnbWNfdjlfMF9mbHVzaF9ncHVfdGxiX3Bhc2lkJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjlfMC5jOjgzNjogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJl
ciAnYWxsX2h1Yicgbm90IGRlc2NyaWJlZCBpbiAnZ21jX3Y5XzBfZmx1c2hfZ3B1X3RsYl9wYXNp
ZCcKPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkIHdpdGggbWlub3IgY2hhbmdlcy4gIFRoYW5rcyEK
CkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCAz
ICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMKPiBpbmRleCBmYmVlNDNiNGJhNjRkLi5hODM3NDNhYjNlOGJi
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCj4gQEAgLTY3NSw2ICs2
NzUsNyBAQCBzdGF0aWMgYm9vbCBnbWNfdjlfMF9nZXRfYXRjX3ZtaWRfcGFzaWRfbWFwcGluZ19p
bmZvKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgKgo+ICAgKiBAYWRldjogYW1kZ3B1
X2RldmljZSBwb2ludGVyCj4gICAqIEB2bWlkOiB2bSBpbnN0YW5jZSB0byBmbHVzaAo+ICsgKiBA
dm1odWI6IHZtaHViIHR5cGUKPiAgICogQGZsdXNoX3R5cGU6IHRoZSBmbHVzaCB0eXBlCj4gICAq
Cj4gICAqIEZsdXNoIHRoZSBUTEIgZm9yIHRoZSByZXF1ZXN0ZWQgcGFnZSB0YWJsZSB1c2luZyBj
ZXJ0YWluIHR5cGUuCj4gQEAgLTc5MSw2ICs3OTIsOCBAQCBzdGF0aWMgdm9pZCBnbWNfdjlfMF9m
bHVzaF9ncHVfdGxiKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50MzJfdCB2bWlkLAo+
ICAgKgo+ICAgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyCj4gICAqIEBwYXNpZDogcGFz
aWQgdG8gYmUgZmx1c2gKPiArICogQGZsdXNoX3R5cGU6IHRoZSBmbHVzaCB0eXBlCj4gKyAqIEBh
bGxfaHViOiBVc2VkIHdpdGggUEFDS0VUM19JTlZBTElEQVRFX1RMQlNfQUxMX0hVQigpCj4gICAq
Cj4gICAqIEZsdXNoIHRoZSBUTEIgZm9yIHRoZSByZXF1ZXN0ZWQgcGFzaWQuCj4gICAqLwo+IC0t
Cj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
