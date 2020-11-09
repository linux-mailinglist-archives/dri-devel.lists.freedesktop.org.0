Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A05AA2AC573
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 20:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4393892DE;
	Mon,  9 Nov 2020 19:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBE9892E0;
 Mon,  9 Nov 2020 19:50:48 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o15so2256069wru.6;
 Mon, 09 Nov 2020 11:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7UsYe46mocZoiCW+LF/Ym4Xr19zPlHHTun9MNgIDCa8=;
 b=bybJ1v3lnBrzYGFpKlM8KIAAxeZO8q1Oj7X8NR+yivBgB3ixHhbgfh46GvZw5Y0dw7
 R8ihdHrEF3VsPyVSczQs4CAjGr4WkHKZ60Pv8DXtW66G6KXcT58C2irteDqxc1Aqh/wl
 Yol11CKM3Qe9MlcKppFvLjC7pfs38gbMYpfl+awnoULIWf33EGa7hXtfpRZFnDPWu7pj
 C5ncll0eVyXlN4yFDmpfth2nkGZgRUMJkpmUWxVXdyADslDIR/lPs7tx+/0qTbI4sGVu
 9kCyUxOI1uqm1Mot8d942RRhA8Kr54/1FWeghNbwxFPc3IivlhHE6lWhFgATSgYK9V2D
 UnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7UsYe46mocZoiCW+LF/Ym4Xr19zPlHHTun9MNgIDCa8=;
 b=jgMrqRialgrVgXkddZfhTB+3HoScBcsnN9x0iBeYdiW8oZoRGFiGQYuHiCQOvcFmOq
 QQBNZP19pvQQqouKr9aQzblzTLmOimRPuQxsP801Mk1IbjRdBFn8AVwo4675yuR+Cur8
 qrH1sh91+Zl6+qwQ+hAKUQD2sW8a5JTTymG38HTbLn5KBkH/p0qBou1qj5DJVoLhQ8oC
 TYYcQ5KA20obrBPLzrmFVmHkxqFlIoI6+lTHg5IVIl8JzKHZPbtyDU6+NtJEBppHVvq4
 n1uezh60G2JsPaTmVclxpeCom3e7WT+mz2Zq3YTXQNQzxeKXxrHrZmehb7a0PGiZUuZG
 FNwA==
X-Gm-Message-State: AOAM533vudunyQoSMgupfZK4a/QP9+Ypplb1lhk99mNqwETwkL99pfAt
 58kBjeeHEdQ5dVt73/Lb9EpawrbfGEUKIeRsFFNlFh+WykA=
X-Google-Smtp-Source: ABdhPJy4DoOooRT9xNcJhrIB9gh/ZyN3Y3XCDpxRFi0KiF8dwateu7LjMMrJAFMH6yt7UiqG83IN4HHaYGrXoQHc54I=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr21010982wrn.124.1604951446950; 
 Mon, 09 Nov 2020 11:50:46 -0800 (PST)
MIME-Version: 1.0
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-18-lee.jones@linaro.org>
In-Reply-To: <20201106214949.2042120-18-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 9 Nov 2020 14:50:35 -0500
Message-ID: <CADnq5_Nys7igVo3sgzK0D4hnm=RHMrEM7Xty80jGROu_sy5svA@mail.gmail.com>
Subject: Re: [PATCH 17/19] drm/radeon/radeon_kms: Fix misnaming of
 'radeon_info_ioctl's dev param
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

T24gRnJpLCBOb3YgNiwgMjAyMCBhdCA0OjUwIFBNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmM6MjI2OiB3
YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdkZXYnIG5vdCBkZXNjcmliZWQg
aW4gJ3JhZGVvbl9pbmZvX2lvY3RsJwo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9r
bXMuYzoyMjY6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ3JkZXYnIGRlc2Ny
aXB0aW9uIGluICdyYWRlb25faW5mb19pb2N0bCcKPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4g
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ttcy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2ttcy5jCj4gaW5kZXggMGQ4ZmJhYmZmY2VhZC4uMjFjMjA2Nzk1YzM2NCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2ttcy5jCj4gQEAgLTIxMyw3ICsyMTMsNyBAQCBzdGF0aWMg
dm9pZCByYWRlb25fc2V0X2ZpbHBfcmlnaHRzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIC8q
Kgo+ICAgKiByYWRlb25faW5mb19pb2N0bCAtIGFuc3dlciBhIGRldmljZSBzcGVjaWZpYyByZXF1
ZXN0Lgo+ICAgKgo+IC0gKiBAcmRldjogcmFkZW9uIGRldmljZSBwb2ludGVyCj4gKyAqIEBkZXY6
IHJhZGVvbiBkZXZpY2UgcG9pbnRlcgoKVGhpcyBzaG91bGQgYmU6CisgKiBAZGV2OiBkcm0gZGV2
aWNlIHBvaW50ZXIKCkFsZXgKCj4gICAqIEBkYXRhOiByZXF1ZXN0IG9iamVjdAo+ICAgKiBAZmls
cDogZHJtIGZpbHAKPiAgICoKPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
