Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F902B1E9B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 16:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDF86E51B;
	Fri, 13 Nov 2020 15:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85226E51B;
 Fri, 13 Nov 2020 15:27:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k2so10369732wrx.2;
 Fri, 13 Nov 2020 07:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yxHsF+KemCYkb6AEPL2z/e19oUNusseMU7Gcvc/FfJ4=;
 b=eSiE5xwUbwEotdWdSzSCyuIt9amSHoyu9DOpwLgNXMMZh94m1n/0JxqJ8UkU4bZDsF
 YYa8eNuXZUYHW67i1OPfvcIPR4LdnTJ/aL6TrCtdVJHjgEj6lWSkAOIVBhLUrQQ4s6t1
 zXoSDFS3rYAm97nwNOsQSRNWW+8IwfbBXQMDHakJDX243TVRpWDV0ugbqoUW7u4tXcOX
 9ULWE7fYNmaau80ZAn9XBbc4uNOprp2pPql76OoBbkA4CStbbThIpEPRIDE1a6yvHeCW
 f0Pg0bZJv+DIiITlQmncNeTFXAwCsfMWMhTQCGj2ZeLzUz/062ZF20zS949XUnxokf5y
 eTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yxHsF+KemCYkb6AEPL2z/e19oUNusseMU7Gcvc/FfJ4=;
 b=L5K2lylq2tiCerAxjtHyqI+v43yZNW7RfPtzwM7LZST2BeU5aPV5XDXRND039wDwU6
 rqm7jpQoBnMhrQj6UkltPwCKcRu8cPK1xO3tVIQ1SC/ihJIqLmmrtLSYE3z0Gu5e+jwk
 eb3YE1uNMEl7jP70xXQb0YDp0PNbU7NZNKGZTOR5fGZ3Gq6eKjGoZuZ1jrSUI4/sJ8sR
 pY+P1ELVR6sFPwv9D7+41KmDsmL6xJXw41s5CcgUAnkaYuepW81zgF38vcMtS+V3yERp
 LMCeCHTRENjgjnifmeDhGgp9OSBAPTkD2QZgwLGJ9Q7KpvxlrJXtA4Uze/b4c7X1S59o
 1mwg==
X-Gm-Message-State: AOAM532nqYobfA1nZN1NYEJ/DiUX4bRkImWB2lb6QTOu21z8EukUL6lV
 LaMlKRzVRAqUuVaHsEpYDLRyCQRfpODphaGdWVE=
X-Google-Smtp-Source: ABdhPJzfJSnTs25NUi0XwRgIqaVNtK+qdLfhBSC2A1tVepq+Caq0ZEAWFJQJJWjUHUYeF7Cm6Bs+M/GD5SFhedhk1eI=
X-Received: by 2002:adf:e551:: with SMTP id z17mr4197640wrm.374.1605281259590; 
 Fri, 13 Nov 2020 07:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-3-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-3-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 10:27:28 -0500
Message-ID: <CADnq5_Nn+a-idC__uZtw=XHjac9mRX1Wwustphf6zZS188DQWA@mail.gmail.com>
Subject: Re: [PATCH 02/40] drm/amd/display/dc/core/dc_link_dp: Move
 DP_VGA_LVDS_CONVERTER_ID_{2, 3} to where they're used
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

T24gRnJpLCBOb3YgMTMsIDIwMjAgYXQgODo0OSBBTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2ggZml4ZXMgPjIwMCB3YXJuaW5ncy4KPgo+IEZp
eGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgo+Cj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvaW5jbHVkZS9kZGNfc2VydmljZV90eXBl
cy5oOjEyMzoyMjogd2FybmluZzog4oCYRFBfVkdBX0xWRFNfQ09OVkVSVEVSX0lEXzPigJkgZGVm
aW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgMTIzIHwgc3Rh
dGljIGNvbnN0IHVpbnQ4X3QgRFBfVkdBX0xWRFNfQ09OVkVSVEVSX0lEXzNbXSA9ICJkbm9tbEEi
Owo+ICB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL2Rpc3BsYXkvaW5jbHVkZS9kZGNfc2VydmljZV90eXBlcy5oOjEyMToyMjogd2Fy
bmluZzog4oCYRFBfVkdBX0xWRFNfQ09OVkVSVEVSX0lEXzLigJkgZGVmaW5lZCBidXQgbm90IHVz
ZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgMTIxIHwgc3RhdGljIGNvbnN0IHVpbnQ4
X3QgRFBfVkdBX0xWRFNfQ09OVkVSVEVSX0lEXzJbXSA9ICJzaXZhclQiOwo+Cj4gTkI6IFJlcGVh
dGVkIH4xMDAgdGltZXMgLSBzbmlwcGVkIGZvciBicmV2aXR5Cj4KPiBDYzogSGFycnkgV2VudGxh
bmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+Cj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQu
Y29tPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBm
ZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkLiAgdGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jICAgICAgICB8IDUg
KysrKysKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2luY2x1ZGUvZGRjX3NlcnZpY2Vf
dHlwZXMuaCB8IDQgLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kY19saW5rX2RwLmMKPiBpbmRleCA2YzYwYzFmZGViZGMxLi5mMjAyM2QyYjUzMjM0IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAu
Ywo+IEBAIC0xNSw2ICsxNSwxMSBAQAo+ICAjaW5jbHVkZSAiZGNfZG11Yl9zcnYuaCIKPiAgI2lu
Y2x1ZGUgImRjZS9kbXViX2h3X2xvY2tfbWdyLmgiCj4KPiArLypUcmF2aXMqLwo+ICtzdGF0aWMg
Y29uc3QgdWludDhfdCBEUF9WR0FfTFZEU19DT05WRVJURVJfSURfMltdID0gInNpdmFyVCI7Cj4g
Ky8qTnV0bWVnKi8KPiArc3RhdGljIGNvbnN0IHVpbnQ4X3QgRFBfVkdBX0xWRFNfQ09OVkVSVEVS
X0lEXzNbXSA9ICJkbm9tbEEiOwo+ICsKPiAgI2RlZmluZSBEQ19MT0dHRVIgXAo+ICAgICAgICAg
bGluay0+Y3R4LT5sb2dnZXIKPiAgI2RlZmluZSBEQ19UUkFDRV9MRVZFTF9NRVNTQUdFKC4uLikg
LyogZG8gbm90aGluZyAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvaW5jbHVkZS9kZGNfc2VydmljZV90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2luY2x1ZGUvZGRjX3NlcnZpY2VfdHlwZXMuaAo+IGluZGV4IGM5YmU4OTljZDI1Y2QuLmI0
NTNjZTVhOWJmZGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2lu
Y2x1ZGUvZGRjX3NlcnZpY2VfdHlwZXMuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9pbmNsdWRlL2RkY19zZXJ2aWNlX3R5cGVzLmgKPiBAQCAtMTE3LDEwICsxMTcsNiBAQCBz
dHJ1Y3QgYXZfc3luY19kYXRhIHsKPiAgICAgICAgIHVpbnQ4X3QgYXVkX2RlbF9pbnMzOy8qIERQ
Q0QgMDAwMkRoICovCj4gIH07Cj4KPiAtLypUcmF2aXMqLwo+IC1zdGF0aWMgY29uc3QgdWludDhf
dCBEUF9WR0FfTFZEU19DT05WRVJURVJfSURfMltdID0gInNpdmFyVCI7Cj4gLS8qTnV0bWVnKi8K
PiAtc3RhdGljIGNvbnN0IHVpbnQ4X3QgRFBfVkdBX0xWRFNfQ09OVkVSVEVSX0lEXzNbXSA9ICJk
bm9tbEEiOwo+ICAvKkRQIHRvIER1YWwgbGluayBEVkkgY29udmVydGVyKi8KPiAgc3RhdGljIGNv
bnN0IHVpbnQ4X3QgRFBfRFZJX0NPTlZFUlRFUl9JRF80W10gPSAibTJEVklhIjsKPiAgc3RhdGlj
IGNvbnN0IHVpbnQ4X3QgRFBfRFZJX0NPTlZFUlRFUl9JRF81W10gPSAiMzM5M04yIjsKPiAtLQo+
IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
