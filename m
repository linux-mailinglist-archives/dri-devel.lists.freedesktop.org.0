Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8B62AE3A8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 23:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187FE89167;
	Tue, 10 Nov 2020 22:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E445D89067;
 Tue, 10 Nov 2020 22:50:15 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a65so4834972wme.1;
 Tue, 10 Nov 2020 14:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BddpXWM57oMSeuVH0GiCGkmNr8YUMWASKDEXAi/F4Ik=;
 b=L5zynW/A8fxFU6d77a5ySvH/zy/gQQ03BiPxTKVFS0BkRGdTjlZU1ny3qgCTVODHrk
 Tc3pEvR9O+kugkYPplUoNDeeefZR3hPV4lcG4Jwx8o1akwlC7c6oIWH+bZptJcecyu1l
 Fjq8w3jC8ModVcuglp4i103Ic56YXgcHSZAMzV5arGidxapkUSYBeCRGICkB1Xgf0B+b
 J1CN5MXVwquoolNXwAhW8Cbx+3vLwXnchxkai6yYY0W2cb+MgfBbUhzgKNhs+0+sK6c/
 6Fs2P/PGRXjUZCR5IbJzw9L3QgtUQxmTg5KHsRMKthXM548Wv16tUUc1TUBw28NLaQbP
 k22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BddpXWM57oMSeuVH0GiCGkmNr8YUMWASKDEXAi/F4Ik=;
 b=o9nfuMsOnPqy8GomSfQgf3XQoqq7F9QDPnA0v9koeQFoLGkdDiFHJPgt4E1HaUXJp5
 53y56fit2ixQ+MsA22jw0ATwBII/jDKNRQ9RQrseOB4Ds2pTlew9LH8r90FPjF+FJJPB
 r41cTQgeg9wJXFKKEScu019pxwENLf+jQw999ox19yZ9sipAjBbv6QA/krQOJmU4jOOQ
 MSvHamLOCFS6Ad3iPkTOGNBkiqfF7k2trSIs4jzBrNVwCHO2HXrTZ3lWC0KXz6z8FFcp
 BGVsmNZk5+0PfkJBBu3/Oq4fuwcSyjhy3VHzo3yn+ariCBeSxDcVsGDKMH23WACyDOv3
 ISiA==
X-Gm-Message-State: AOAM5335pmrpS0jUWWCmU9AKW4yVpEQRnuebNP7nfqtOujIkzUbHW2q/
 mtXHFyBoVBxLP0G4xP2+vOA0Fe7D+IsHwfmzsQo=
X-Google-Smtp-Source: ABdhPJxo+X4jxV+bBVFzVi6yl51daBDZgI3j6cR4TkxJYsINm8BjEk0lHQgnEei9W0LNO6y946QRic5xwYgIBRaf4gs=
X-Received: by 2002:a1c:80cb:: with SMTP id b194mr368273wmd.73.1605048614642; 
 Tue, 10 Nov 2020 14:50:14 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org>
 <20201110193112.988999-3-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-3-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 17:50:03 -0500
Message-ID: <CADnq5_MOF00Fy0yALwrb+G77+Bxfa27Bzg5M6SEPzgqzJP=cnA@mail.gmail.com>
Subject: Re: [PATCH 02/30] drm/radeon/evergreen: Remove set but unused
 variable 'mc_shared_chmap'
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

T24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgMjozMSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuLmM6IEluIGZ1
bmN0aW9uIOKAmGV2ZXJncmVlbl9ncHVfaW5pdOKAmToKPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9ldmVyZ3JlZW4uYzozMTM1OjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmG1jX3NoYXJlZF9jaG1h
cOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+Cj4gQ2M6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+
IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KCkFwcGxpZWQuICBUaGFua3MhCgpBbGV4CgoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9ldmVyZ3JlZW4uYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vZXZlcmdyZWVuLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5j
Cj4gaW5kZXggYzlhOWE4Nzk1OWY5ZS4uZWZiMTljNDQ1ZTQ4ZiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9ldmVyZ3JlZW4uYwo+IEBAIC0zMTM1LDcgKzMxMzUsNyBAQCBzdGF0aWMgaW50IGV2ZXJn
cmVlbl9jcF9yZXN1bWUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCj4gIHN0YXRpYyB2b2lk
IGV2ZXJncmVlbl9ncHVfaW5pdChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldikKPiAgewo+ICAg
ICAgICAgdTMyIGdiX2FkZHJfY29uZmlnOwo+IC0gICAgICAgdTMyIG1jX3NoYXJlZF9jaG1hcCwg
bWNfYXJiX3JhbWNmZzsKPiArICAgICAgIHUzMiBtY19hcmJfcmFtY2ZnOwo+ICAgICAgICAgdTMy
IHN4X2RlYnVnXzE7Cj4gICAgICAgICB1MzIgc214X2RjX2N0bDA7Cj4gICAgICAgICB1MzIgc3Ff
Y29uZmlnOwo+IEBAIC0zMzk5LDcgKzMzOTksNyBAQCBzdGF0aWMgdm9pZCBldmVyZ3JlZW5fZ3B1
X2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCj4KPiAgICAgICAgIGV2ZXJncmVlbl9m
aXhfcGNpX21heF9yZWFkX3JlcV9zaXplKHJkZXYpOwo+Cj4gLSAgICAgICBtY19zaGFyZWRfY2ht
YXAgPSBSUkVHMzIoTUNfU0hBUkVEX0NITUFQKTsKPiArICAgICAgIFJSRUczMihNQ19TSEFSRURf
Q0hNQVApOwo+ICAgICAgICAgaWYgKChyZGV2LT5mYW1pbHkgPT0gQ0hJUF9QQUxNKSB8fAo+ICAg
ICAgICAgICAgIChyZGV2LT5mYW1pbHkgPT0gQ0hJUF9TVU1PKSB8fAo+ICAgICAgICAgICAgIChy
ZGV2LT5mYW1pbHkgPT0gQ0hJUF9TVU1PMikpCj4gLS0KPiAyLjI1LjEKPgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcg
bGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
