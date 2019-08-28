Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCFEA0B3D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 22:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC18A89EA3;
	Wed, 28 Aug 2019 20:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36EE89EA3;
 Wed, 28 Aug 2019 20:22:46 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z11so1100594wrt.4;
 Wed, 28 Aug 2019 13:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6rlm3R9L31UMomxrlFOwVVVZSymKjbTtVK1aqgSIKFM=;
 b=DwwpK291rPv8YKMw1UG8UPbL5qZgOT7rr09xi2ZtU60aVB69mVf46rFPs6xmTglLMx
 1kmsSTvjwll2MHTOc7hUc+Uydx1ooimO+PMoM9VImLDaXgDU6F3lToXeBhUnoTLJKIjZ
 OhALsXRnUY18ByexokA4Q1vPEDbU2lrTWuj6Z+VdHT8LQuiqbSDgmKhQ9xHr2gBKZZnR
 Xp92+fGF2AayegJW2tdgeToA5yVvLnHM8vvkYqf8czjJNloXJ8L3rlRwaEZTmDHO46PJ
 Y8WKDuPikq1sX0QJw2dQ5XkZGgfWKI50XRwsSYj2wtjei0ajqaw0EznSkcO7AIpxqdUT
 /buQ==
X-Gm-Message-State: APjAAAVHCpl0BEl8XEbUfsRYUc/YlrKl9vGRcaZ8iSvjEswRW7v8fywr
 W5SEAEZGCosRi3Ke2Vk2cB0AnH+AQyApXrn9/C8=
X-Google-Smtp-Source: APXvYqx3Hk6tfezxwz6nW4vC+zq0hWpTJ5T7ZaSiWspCWdldWC95GZ7Yhmi3OyJc83DtXnWPgc44uhGLyHCo8DD8Fgs=
X-Received: by 2002:a5d:4ecb:: with SMTP id s11mr6818012wrv.323.1567023765434; 
 Wed, 28 Aug 2019 13:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190828102729.7435a532@endymion>
In-Reply-To: <20190828102729.7435a532@endymion>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Aug 2019 16:22:33 -0400
Message-ID: <CADnq5_OB7o-uH6gywqsx-QhwNp720LRrYxy7KLt7ShrDBScuGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: hide voltage and power sensors on SI and
 KV parts
To: Jean Delvare <jdelvare@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6rlm3R9L31UMomxrlFOwVVVZSymKjbTtVK1aqgSIKFM=;
 b=Q99u++DITCMcySPvygYx7NpxGi6mRSOf7wDMU+lrCchPu710KJzxxAdqWFkbrkUjme
 PvXEiouHkC2KA4tE85QZYG241kDXfpf92msfzZOp3JleNxRjg5jzbP7rztBLf+eou7d+
 0oakfoA9T72ZjYjxwW2MpAID7D4DxqZq47fM1YkPFGJFWyeHxHUh0KArycPnE8x8uBga
 LXliryocw8AkvvUBOBwAxZj9+yl4PpLukcel+aDTp5SseHWEs8g+V9QIsXDnQuZ51bvh
 el9HOHB7JSCui3NzHuX0lEy6bC/gOY+AoFyK9ccACdNHDnwfMmV7IJyKj3VOX9ifAPvf
 hIfw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgNDozMiBBTSBKZWFuIERlbHZhcmUgPGpkZWx2YXJlQHN1
c2UuZGU+IHdyb3RlOgo+Cj4gVGhlIGRyaXZlciBkb2VzIG5vdCBzdXBwb3J0IHRoZXNlIHNlbnNv
cnMgeWV0IGFuZCB0aGVyZSBpcyBubyBwb2ludCBpbgo+IGNyZWF0aW5nIHN5c2ZzIGF0dHJpYnV0
ZXMgd2hpY2ggd2lsbCBhbHdheXMgcmV0dXJuIGFuIGVycm9yLgo+Cj4gU2lnbmVkLW9mZi1ieTog
SmVhbiBEZWx2YXJlIDxqZGVsdmFyZUBzdXNlLmRlPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgo+IENjOiAiRGF2aWQgKENodW5NaW5nKSBaaG91IiA8RGF2aWQxLlpo
b3VAYW1kLmNvbT4KPiAtLS0KPiBUaGlzIHdvcmtzIGZvciBtZSBob3dldmVyIEkgY291bGRuJ3Qg
c2VlbiBhbnkgb3RoZXIgcGxhY2UgaW4gdGhlIGRyaXZlcgo+IHdoZXJlIGFkZXYtPmZhbWlseSBp
cyB0ZXN0ZWQgZGlyZWN0bHkgbGlrZSB0aGF0LCBzbyBJJ20gbm90IHN1cmUgaWYKPiB0aGlzIGlz
IHRoZSByaWdodCB3YXkgdG8gcGVyZm9ybSB0aGUgdGVzdD8KClRoYXQncyBmaW5lLiAgQXBwbGll
ZC4gIFRoYW5rcyEKCkFsZXgKCj4KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3BtLmMgfCAgIDEwICsrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Cj4gLS0tIGxpbnV4LTUuMi5vcmlnL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9wbS5jICAgICAgIDIwMTktMDgtMjggMDk6Mzg6MTEuMjQ1Mzc2NTM5
ICswMjAwCj4gKysrIGxpbnV4LTUuMi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cG0uYyAgICAyMDE5LTA4LTI4IDA5OjU4OjU5Ljg5NjMxNDk0OCArMDIwMAo+IEBAIC0yMTUwLDcg
KzIxNTAsOSBAQCBzdGF0aWMgdW1vZGVfdCBod21vbl9hdHRyaWJ1dGVzX3Zpc2libGUoCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgZWZmZWN0aXZlX21vZGUgJj0gflNfSVdVU1I7Cj4gICAgICAg
ICB9Cj4KPiAtICAgICAgIGlmICgoYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVKSAmJgo+ICsgICAg
ICAgaWYgKCgoYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVKSB8fAo+ICsgICAgICAgICAgICBhZGV2
LT5mYW1pbHkgPT0gQU1ER1BVX0ZBTUlMWV9TSSB8fCAgICAgICAgLyogbm90IGltcGxlbWVudGVk
IHlldCAqLwo+ICsgICAgICAgICAgICBhZGV2LT5mYW1pbHkgPT0gQU1ER1BVX0ZBTUlMWV9LVikg
JiYgICAgICAgLyogbm90IGltcGxlbWVudGVkIHlldCAqLwo+ICAgICAgICAgICAgIChhdHRyID09
ICZzZW5zb3JfZGV2X2F0dHJfcG93ZXIxX2F2ZXJhZ2UuZGV2X2F0dHIuYXR0ciB8fAo+ICAgICAg
ICAgICAgICBhdHRyID09ICZzZW5zb3JfZGV2X2F0dHJfcG93ZXIxX2NhcF9tYXguZGV2X2F0dHIu
YXR0ciB8fAo+ICAgICAgICAgICAgICBhdHRyID09ICZzZW5zb3JfZGV2X2F0dHJfcG93ZXIxX2Nh
cF9taW4uZGV2X2F0dHIuYXR0cnx8Cj4gQEAgLTIxNzQsNiArMjE3NiwxMiBAQCBzdGF0aWMgdW1v
ZGVfdCBod21vbl9hdHRyaWJ1dGVzX3Zpc2libGUoCj4gICAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIDA7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIGlmICgoYWRldi0+ZmFtaWx5ID09IEFN
REdQVV9GQU1JTFlfU0kgfHwgICAgICAgIC8qIG5vdCBpbXBsZW1lbnRlZCB5ZXQgKi8KPiArICAg
ICAgICAgICAgYWRldi0+ZmFtaWx5ID09IEFNREdQVV9GQU1JTFlfS1YpICYmICAgICAgIC8qIG5v
dCBpbXBsZW1lbnRlZCB5ZXQgKi8KPiArICAgICAgICAgICAoYXR0ciA9PSAmc2Vuc29yX2Rldl9h
dHRyX2luMF9pbnB1dC5kZXZfYXR0ci5hdHRyIHx8Cj4gKyAgICAgICAgICAgIGF0dHIgPT0gJnNl
bnNvcl9kZXZfYXR0cl9pbjBfbGFiZWwuZGV2X2F0dHIuYXR0cikpCj4gKyAgICAgICAgICAgICAg
IHJldHVybiAwOwo+ICsKPiAgICAgICAgIC8qIG9ubHkgQVBVcyBoYXZlIHZkZG5iICovCj4gICAg
ICAgICBpZiAoIShhZGV2LT5mbGFncyAmIEFNRF9JU19BUFUpICYmCj4gICAgICAgICAgICAgKGF0
dHIgPT0gJnNlbnNvcl9kZXZfYXR0cl9pbjFfaW5wdXQuZGV2X2F0dHIuYXR0ciB8fAo+Cj4KPiAt
LQo+IEplYW4gRGVsdmFyZQo+IFNVU0UgTDMgU3VwcG9ydAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
