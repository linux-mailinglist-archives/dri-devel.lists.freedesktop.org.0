Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B7C2AE299
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 23:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CFE89CE2;
	Tue, 10 Nov 2020 22:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7231B89CD4;
 Tue, 10 Nov 2020 22:09:58 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so3051622wrt.4;
 Tue, 10 Nov 2020 14:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YcAOS59prb8VFAixQsta0ytgU5jtgd3crgL2WI0lqHU=;
 b=kUOTnCoLAeRSmj0UAOAE3+x2hPe/pDX+HPK7mpEEd9IDCAcZFkmJZOQhHgqvYPgXUc
 IlSEjlANGEGWeeYj96Euc12mtNhmrKnraPANYRx+MCzRIXS1IvrH0EUUp3yLtwoRn6cl
 UYrnyT43isSnVbWjXwWIwYvexHUJwlUlZwRp/oJvJHsdhQJ004txOeefHQZ7DL6DsJFF
 oB2lORCdBLNERQX3xWfQhTbd3T/cKNsqEqhPfibVli/J44Bqy9teCuxyEfAvw/dUgCaq
 GcEZMk13pOvzoKszmKYGacw+47l1rlLVD2lTqt/BjjfzeeM9obi97YZxxQI4FQjihPS0
 C0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YcAOS59prb8VFAixQsta0ytgU5jtgd3crgL2WI0lqHU=;
 b=V7lxz9RfFDWoJ/m9EzP89rcSUkO9Hr/FOmglzDIoO9pGZeGZOomrz/gfs0HjMqIvU2
 HuMHC7uvMER5aRE6JVFSTf9EhM9T/gDxWAj3uK5+G2Edes+/ULG9Ut35eeNJHzN2oo0u
 qXhuLnr2r/wpx5QJyOKa32n4z4OMLVrhDBssHVHPfZA3JzoBGO9P8qS3Wcf9KGbKrMsU
 FqfSxv8EJhpMpL4nNDontMzreEAfnYD4KqbgCYRJOxC2FEtoB1NwYSycSIsthD9I/zId
 FV6G6p4mUYXQ/ekNmkVUsXSRYyaQJnfukumJU1T3A20xw2NMa5+7svCeQEerEpk0Wwo7
 oj8w==
X-Gm-Message-State: AOAM5334QvZCIFOnru4gS3NFP8UVzAY+ktJ1/nSw4E9dTcTkUmlwj6Lz
 dsXbDktK7eZ6lh/t7fdXbEyBw1HglZpXWP8LlWo=
X-Google-Smtp-Source: ABdhPJzYq8S8HxJ8eUtKIYm1d5SwL0ef0M3FjeAuSs+qo8BL/c4huOEldmmpwCCzireXzEYfm4tAWkHJxsxcP323JV8=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr27789872wrn.124.1605046197171; 
 Tue, 10 Nov 2020 14:09:57 -0800 (PST)
MIME-Version: 1.0
References: <20201109211855.3340030-1-lee.jones@linaro.org>
 <20201109211855.3340030-8-lee.jones@linaro.org>
In-Reply-To: <20201109211855.3340030-8-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 17:09:46 -0500
Message-ID: <CADnq5_Py-VzeGQMzzGZAO=9OqeniBiXT8625YRcTjVe+bRSNSw@mail.gmail.com>
Subject: Re: [PATCH 07/20] drm/radeon/radeon_display: Remove unused variable
 'mod'
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
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 report to <xorg-driver-ati@lists.x.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgOSwgMjAyMCBhdCA0OjE5IFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jOiBJ
biBmdW5jdGlvbiDigJhyYWRlb25fZGl24oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9kaXNwbGF5LmM6MTA5NDoxMTogd2FybmluZzogdmFyaWFibGUg4oCYbW9k4oCZIHNldCBi
dXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4KPiBDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IFN1bWl0
IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IHJlcG9ydCB0byA8eG9yZy1k
cml2ZXItYXRpQGxpc3RzLngub3JnPgo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGxpbnV4LW1lZGlh
QHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcKPiBT
aWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKQXBwbGllZC4g
IFRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rp
c3BsYXkuYyB8IDQgKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
ZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jCj4gaW5k
ZXggYmQ2MGYxNmZkMGQ3OC4uNzhmY2VlZGZkOTI1NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9kaXNwbGF5LmMKPiBAQCAtMTA5MSwxMSArMTA5MSw5IEBAIHZvaWQgcmFkZW9u
X2NvbXB1dGVfcGxsX2F2aXZvKHN0cnVjdCByYWRlb25fcGxsICpwbGwsCj4gIC8qIHByZS1hdml2
byAqLwo+ICBzdGF0aWMgaW5saW5lIHVpbnQzMl90IHJhZGVvbl9kaXYodWludDY0X3QgbiwgdWlu
dDMyX3QgZCkKPiAgewo+IC0gICAgICAgdWludDY0X3QgbW9kOwo+IC0KPiAgICAgICAgIG4gKz0g
ZCAvIDI7Cj4KPiAtICAgICAgIG1vZCA9IGRvX2RpdihuLCBkKTsKPiArICAgICAgIGRvX2Rpdihu
LCBkKTsKPiAgICAgICAgIHJldHVybiBuOwo+ICB9Cj4KPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
