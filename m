Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AAF2812BE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 14:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFD26E12D;
	Fri,  2 Oct 2020 12:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6CB6E939
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 12:31:37 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id x69so1039456oia.8
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 05:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jDX8J6f/2r3XxYVCLWY9LUJUgiJhb+DgmZgyb6+yu50=;
 b=LI/M6HiR6GHfek1ELEawnr0l4OOmUI0djJZA7WuGhFOXTjGCwmy/64MH+GLx+Os2I8
 9ABUe/WvJssuADplYNayv4Cix8Hv90TDIHLFobn3/LUIOEvl4Mc26BtpFYFmbZ1pNoHX
 otxcFbI1RcUUjCGjJ0+RWYSAaOchV41NwzRkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jDX8J6f/2r3XxYVCLWY9LUJUgiJhb+DgmZgyb6+yu50=;
 b=eXHuUUIPOejR5BjyfrEsYBk6Dj5I1yAh+VFr8Hv9jCYwcJ2N/pZRFAC9jBxoxRdggH
 MSwAbMZgeEGz31wg4EgZO3koaN+aJIjfSlnOw0LDTzBJTe1uItyavj4lvCZE6X56Wgkx
 ehJf5mG2xBW6vtfSwsU81RGfxp3uQCvd/cRzPOjOvBLXspiWlrwFrZg8XX/VXSdO4ai6
 Rtdun12auJIk0AbT78jnETjb+iLaJVzYlzURnc7xWjeEGbrpDZU4bdK/PW1b3j5Qp332
 oRB7FwJwFImz7in0NFug1ST8O9PjDfd791ZQLwq4IVhg7RLJan5A2IUWzxjxH9z4ph3R
 Y/Cw==
X-Gm-Message-State: AOAM532Kut4c+9fPI5wgOHSmBapdJ6ZvfDWQAc2sPnHR+LdTuX4ATYG+
 bykXbYM96MMnvvANdi22lqWd+YMjweijgybNR/QyvHpEgnzTfQ==
X-Google-Smtp-Source: ABdhPJyWStJEkBPxDNsId+nYMbKc6NupQxWPS4CMWY8IQG8o9FQ17sET7u8lfnMIJaiPuXB9FbBd0icXEQwyH7IXT/k=
X-Received: by 2002:a05:6808:206:: with SMTP id
 l6mr1088170oie.128.1601641896633; 
 Fri, 02 Oct 2020 05:31:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201002113121.47823-1-christian.koenig@amd.com>
 <20201002113121.47823-2-christian.koenig@amd.com>
In-Reply-To: <20201002113121.47823-2-christian.koenig@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 2 Oct 2020 14:31:25 +0200
Message-ID: <CAKMK7uH9RLWqnsU5KKEC3414xfNZgEB7hXVf-f5f3LXsuaNY9w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/ttm: remove no_retry flag
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Huang Rui <ray.huang@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMiwgMjAyMCBhdCAxOjMxIFBNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IEFtZGdwdSB3YXMgdGhlIG9ubHkg
dXNlciBvZiB0aGlzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgoKVWggdGhpcyBzbWVsbHMgbGlrZSBhIGZpc2h5IGJhbmQtYWlk
LiBBbmQgdGhlIG9yaWdpbmFsIGNvbW1pdAppbnRyb2R1Y2luZyB0aGlzIGFsc28gZG9lc24ndCBz
Y2hlZCBhbnkgbGlnaHQgb24gd2h5IHRoaXMgc2hvdWxkCmhhcHBlbiwgYW5kIHdoeSBpdCdzIHNw
ZWNpZmljIHRvIHRoZSBhbWRncHUgZHJpdmVyLiBEbyB5b3UgaGF2ZSBzb21lCm1vcmUgbWVtb3Jp
ZXMgaGVyZT8KCkkgZ3Vlc3Mgbm8gcmV0cnkgbWFrZXMgc2Vuc2UgZm9yIGEgImRvIHlvdSBzdGls
bCBoYXZlIG1lbW9yeT8iIHF1ZXJ5LApidXQgb25jZSB3ZSd2ZSBjb21taXQgdG8gaGF2aW5nIHRo
YXQgbWVtb3J5LCBJJ20gbm90IHNlZWluZyB3aHkgd2UKc2hvdWxkIG5vdCB0cnkgdG8gZmluZCBp
dD8gTWlnaHQgYWxzbyB0aWUgaW50byB0aGUgbGFjayBvZiBhY3RpdmUKc2hyaW5raW5nIGZvciB0
dG0gb2JqZWN0cyBpbiB0aGUgc3lzdGVtIGRvbWFpbi4KLURhbmllbAoKPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgNiArKystLS0KPiAgZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fdHQuYyAgICAgICAgICAgIHwgMyAtLS0KPiAgaW5jbHVkZS9kcm0vdHRt
L3R0bV9kZXZpY2UuaCAgICAgICAgICAgIHwgMiAtLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMKPiBpbmRleCBjNWYyYjQ5NzFlZjcuLjBhNDIzMzk4NTg3MCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPiBAQCAtMTI5OCw2ICsxMjk4LDkg
QEAgc3RhdGljIHN0cnVjdCB0dG1fdHQgKmFtZGdwdV90dG1fdHRfY3JlYXRlKHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm8sCj4gICAgICAgICB9Cj4gICAgICAgICBndHQtPmdvYmogPSAmYm8t
PmJhc2U7Cj4KPiArICAgICAgIC8qIFdlIG9wdCB0byBhdm9pZCBPT00gb24gc3lzdGVtIHBhZ2Vz
IGFsbG9jYXRpb25zICovCj4gKyAgICAgICBwYWdlX2ZsYWdzIHw9IFRUTV9QQUdFX0ZMQUdfTk9f
UkVUUlk7Cj4gKwo+ICAgICAgICAgaWYgKGRtYV9hZGRyZXNzaW5nX2xpbWl0ZWQoYWRldi0+ZGV2
KSkKPiAgICAgICAgICAgICAgICAgcGFnZV9mbGFncyB8PSBUVE1fUEFHRV9GTEFHX0RNQTMyOwo+
Cj4gQEAgLTE4OTUsOSArMTg5OCw2IEBAIGludCBhbWRncHVfdHRtX2luaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCj4gICAgICAgICB9Cj4gICAgICAgICBhZGV2LT5tbWFuLmluaXRpYWxp
emVkID0gdHJ1ZTsKPgo+IC0gICAgICAgLyogV2Ugb3B0IHRvIGF2b2lkIE9PTSBvbiBzeXN0ZW0g
cGFnZXMgYWxsb2NhdGlvbnMgKi8KPiAtICAgICAgIGFkZXYtPm1tYW4uYmRldi5ub19yZXRyeSA9
IHRydWU7Cj4gLQo+ICAgICAgICAgLyogSW5pdGlhbGl6ZSBWUkFNIHBvb2wgd2l0aCBhbGwgb2Yg
VlJBTSBkaXZpZGVkIGludG8gcGFnZXMgKi8KPiAgICAgICAgIHIgPSBhbWRncHVfdnJhbV9tZ3Jf
aW5pdChhZGV2KTsKPiAgICAgICAgIGlmIChyKSB7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCj4gaW5kZXgg
ZTJiMWU2YzUzYTA0Li45ODUxNGFiYWE5MzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fdHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPiBAQCAt
NTIsOSArNTIsNiBAQCBpbnQgdHRtX3R0X2NyZWF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3Qg
KmJvLCBib29sIHplcm9fYWxsb2MpCj4gICAgICAgICBpZiAoYm8tPnR0bSkKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4KPiAtICAgICAgIGlmIChiZGV2LT5ub19yZXRyeSkKPiAtICAgICAg
ICAgICAgICAgcGFnZV9mbGFncyB8PSBUVE1fUEFHRV9GTEFHX05PX1JFVFJZOwo+IC0KPiAgICAg
ICAgIHN3aXRjaCAoYm8tPnR5cGUpIHsKPiAgICAgICAgIGNhc2UgdHRtX2JvX3R5cGVfZGV2aWNl
Ogo+ICAgICAgICAgICAgICAgICBpZiAoemVyb19hbGxvYykKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vdHRtL3R0bV9kZXZpY2UuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fZGV2aWNlLmgKPiBp
bmRleCBiZmM2ZGQ4N2YyZDMuLmUwZWJhMzZjMTMwOSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2Ry
bS90dG0vdHRtX2RldmljZS5oCj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9kZXZpY2UuaAo+
IEBAIC0zMjYsOCArMzI2LDYgQEAgc3RydWN0IHR0bV9kZXZpY2Ugewo+ICAgICAgICAgICovCj4K
PiAgICAgICAgIHN0cnVjdCBkZWxheWVkX3dvcmsgd3E7Cj4gLQo+IC0gICAgICAgYm9vbCBub19y
ZXRyeTsKPiAgfTsKPgo+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdl
ciAqCj4gLS0KPiAyLjE3LjEKPgoKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVy
LCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
