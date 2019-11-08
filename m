Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD37F513A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 17:35:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD2A6FA03;
	Fri,  8 Nov 2019 16:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508E46F9FC;
 Fri,  8 Nov 2019 16:34:59 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q70so6820742wme.1;
 Fri, 08 Nov 2019 08:34:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IdiR2KXB5KOv1vRWAi9zbSMhjMQO3TugKSv7PhltGHo=;
 b=k6CEOgvb2srLnU+q4+IZ3qm39X5vcw2GWtIDLa+YP6d6X6QFurpFOb8fTP1Foc29VA
 kSvHzb795nGPSRJ9XA5lVB2YZu56Fezcl2k/Z+ykAGKaEHdZzMT/D2Je0zXXIF2j4Kck
 NBF72+xdNHJwr6Gug+XQFTWHRR3QSRJ3y4cp/shAufm+4lRvd/Wwm2LeI0kHOTXM3UAU
 iqmed3sF3mI5CwOY2Ph8UedwHMAj/IcWVzALH3ubiqTB2NuHrYQU2JOSDUl0RHy7+oEI
 zmaoynMe85Pl04KeuEyqN2PTzWmOVvcbhstjf1qB5jWwCUUHKdIiXNuMQaWhg5UROHcf
 JqHA==
X-Gm-Message-State: APjAAAXHY7tby1qEWFLi/hBFTG+gVxvSF1HNgaFHZ84ysAvtuyQshowQ
 eX9KLMjvBbTdBhm5ddf49G11G26rmde292WgsU0=
X-Google-Smtp-Source: APXvYqy79GaOiYFhmmdQPjwdGH/T4YJb7x2vCs27cZMUUrGqW4IIX1akQO5yVBzR1MBUYXToBBj0vgVl4kAlOJl4yXY=
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr9004173wmi.141.1573230897685; 
 Fri, 08 Nov 2019 08:34:57 -0800 (PST)
MIME-Version: 1.0
References: <20191108162945.180624-1-colin.king@canonical.com>
In-Reply-To: <20191108162945.180624-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Nov 2019 11:34:45 -0500
Message-ID: <CADnq5_NC1znSqvSUDkABAkb9VwAF9F1qdZ+JdRQZLMwoptjsDg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: remove redundant variable status
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=IdiR2KXB5KOv1vRWAi9zbSMhjMQO3TugKSv7PhltGHo=;
 b=FPdcyNPg3AHLlfW9P7emzQuQyIQgLbYD3jPmeXWi9VWB8W7Bd0blQ0eAy3u4laIYAP
 GfNV6rJMFtkXEJO4hYO/eMXN92Kbi0+TrbNdmlMRu78mu875Z6TLOvVU1esvQHXn2iiN
 rWHrHL4/j6ei3ZR2kDb1BvgVDiqc244PPRdTdt/2j//R5W6K4DVvQbo1N4Z1Tm9jMxt7
 wXrmGGP28Qccm2hj4Rf3SgmEYNZ43TZ5lZfY2Be/GN+NkrkOxujdCE1NMenaamTC9rWe
 76gTWwx3AIfz+qLAI1uoHqjH7PaiZnDa5fE1jRvr1Wyub2sRt8aBx1oFyuyTJBVt/b2y
 tUeA==
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgOCwgMjAxOSBhdCAxMToyOSBBTSBDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNh
bm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdA
Y2Fub25pY2FsLmNvbT4KPgo+IFZhcmlhYmxlIHN0YXR1cyBpcyByZWR1bmRhbnQsIGl0IGlzIGJl
aW5nIGluaXRpYWxpemVkIHdpdGggYSB2YWx1ZQo+IHRoYXQgaXMgb3Zlci13cml0dGVuIGxhdGVy
IGFuZCB0aGlzIGlzIGJlaW5nIHJldHVybmVkIGltbWVkaWF0ZWx5Cj4gYWZ0ZXIgdGhlIGFzc2ln
bm1lbnQuICBDbGVhbiB1cCB0aGUgY29kZSBieSByZW1vdmluZyBzdGF0dXMgYW5kCj4ganVzdCBy
ZXR1cm5pbmcgdGhlIHZhbHVlIHJldHVybmVkIGZyb20gdGhlIGNhbGwgdG8gZnVuY3Rpb24KPiBk
Yy0+aHdzcy5kbWRhdGFfc3RhdHVzX2RvbmUuCj4KPiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiVW51
c2VkIHZhbHVlIikKPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPgoKQXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3N0cmVhbS5jIHwgNCArLS0tCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19zdHJlYW0uYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3N0cmVhbS5jCj4gaW5kZXggMzcxZDQ5
ZTliNzQ1Li44OGE4NGJmYWVhNmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kY19zdHJlYW0uYwo+IEBAIC01NjUsNyArNTY1LDYgQEAgYm9vbCBkY19z
dHJlYW1fZ2V0X3NjYW5vdXRwb3MoY29uc3Qgc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFt
LAo+Cj4gIGJvb2wgZGNfc3RyZWFtX2RtZGF0YV9zdGF0dXNfZG9uZShzdHJ1Y3QgZGMgKmRjLCBz
dHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpzdHJlYW0pCj4gIHsKPiAtICAgICAgIGJvb2wgc3RhdHVz
ID0gdHJ1ZTsKPiAgICAgICAgIHN0cnVjdCBwaXBlX2N0eCAqcGlwZSA9IE5VTEw7Cj4gICAgICAg
ICBpbnQgaTsKPgo+IEBAIC01ODEsOCArNTgwLDcgQEAgYm9vbCBkY19zdHJlYW1fZG1kYXRhX3N0
YXR1c19kb25lKHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKnN0cmVhbSkK
PiAgICAgICAgIGlmIChpID09IE1BWF9QSVBFUykKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHRy
dWU7Cj4KPiAtICAgICAgIHN0YXR1cyA9IGRjLT5od3NzLmRtZGF0YV9zdGF0dXNfZG9uZShwaXBl
KTsKPiAtICAgICAgIHJldHVybiBzdGF0dXM7Cj4gKyAgICAgICByZXR1cm4gZGMtPmh3c3MuZG1k
YXRhX3N0YXR1c19kb25lKHBpcGUpOwo+ICB9Cj4KPiAgYm9vbCBkY19zdHJlYW1fc2V0X2R5bmFt
aWNfbWV0YWRhdGEoc3RydWN0IGRjICpkYywKPiAtLQo+IDIuMjAuMQo+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
