Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A43F12AE16C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 22:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F300389C52;
	Tue, 10 Nov 2020 21:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9027389C52
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 21:15:23 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c9so4610348wml.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 13:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EvrNTGyzPLrpMkOqbiu0tJDut5rWtaLyxK55CmagbKo=;
 b=XJPgOv25JZ76wIWvv1r7+oeadXAOemvtCAKknFD8PbF8CojgPH/YzIY5iCoKqSjEww
 AO4kIyk9jonsdRnRubyCundPh31KWp8SLxnwL3rfWk50qXDRSStPoQSRVPaJt3VjTtAc
 RkmwIFwDI9S67f0iHFRZZez9aACymlUzkEQq9kGB+nLZNpw+AWrNpkTwlqgOdIfUgpSK
 gkGo+sSBHdlxsL3xNPa5qubtI2kjE+HQOYmjEJE0Uyz1t3XP5XvvWLPRyY4GDrSIGuK4
 4Sun/7yYBZAs7vXGGfTTwTHS8r5GIaltZ0gA/fYx/LkrwB0vi0f1lwnRiAtGhYQDckl2
 ITjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EvrNTGyzPLrpMkOqbiu0tJDut5rWtaLyxK55CmagbKo=;
 b=eRIABi2smzi7Q3pb/lKfqwpNA1U0VamatrrB90Rm8g6J4BH+bgt662ufQnh94EYeo+
 +6CHKk4YbWqk+MBINmZzYXB9dTBHwBzrKD2Qmn9Qdh4Jm+OU/fozh6hWmxwxVu8OvDnM
 dm8YAvOzmcwdmdB4lyVHqJqnNz8zSEpW9o88kmuQFpz0t+8q0y5tEpA52Q3y45BiRjby
 3EmnAzBzAlc782TNZODCfjXh1WWpQXxCYV6wd/MJeJhepCcLahMoL3LhqzE9+a1D6GHO
 gx56P5B47iPufnZU/+RxTfyicCuBgXLK5Rmc1A0xp23MehH2NKJ7w1v7cazfKvZqvEjS
 3WAg==
X-Gm-Message-State: AOAM530xFQkGhgyYJ37n4pA0SLoNYxfZ5ajZJEOYJ4JwZbRcsDkma4DN
 h6dsOo1Q8Qkhg/hvNohaGFwyr3aTKBZboIAx/7w=
X-Google-Smtp-Source: ABdhPJyHC8vHXsJYCh3vrnV2nELM9iSabVZOSi99vn/Wo7V70lIbQoE1qv+uHNKxSVF66X7FRUYqQDwa+xjr5OZdkGI=
X-Received: by 2002:a1c:80cb:: with SMTP id b194mr27049wmd.73.1605042830518;
 Tue, 10 Nov 2020 13:13:50 -0800 (PST)
MIME-Version: 1.0
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-8-lee.jones@linaro.org>
In-Reply-To: <20201105144517.1826692-8-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 16:13:39 -0500
Message-ID: <CADnq5_MGxcgXN-bbXVi4BidW7oa+qW8g9fOPuH2-1gSNWOW5jw@mail.gmail.com>
Subject: Re: [PATCH 07/19] gpu: drm: scheduler: sched_entity: Demote
 non-conformant kernel-doc headers
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
 Alex Deucher <alexander.deucher@amd.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgNSwgMjAyMCBhdCA5OjUyIEFNIExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFy
by5vcmc+IHdyb3RlOgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYzoz
MTY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2YnIG5vdCBkZXNjcmli
ZWQgaW4gJ2RybV9zY2hlZF9lbnRpdHlfY2xlYXJfZGVwJwo+ICBkcml2ZXJzL2dwdS9kcm0vc2No
ZWR1bGVyL3NjaGVkX2VudGl0eS5jOjMxNjogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9y
IG1lbWJlciAnY2InIG5vdCBkZXNjcmliZWQgaW4gJ2RybV9zY2hlZF9lbnRpdHlfY2xlYXJfZGVw
Jwo+ICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jOjMzMDogd2Fybmlu
ZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnZicgbm90IGRlc2NyaWJlZCBpbiAnZHJt
X3NjaGVkX2VudGl0eV93YWtldXAnCj4gIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
ZW50aXR5LmM6MzMwOiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdjYicg
bm90IGRlc2NyaWJlZCBpbiAnZHJtX3NjaGVkX2VudGl0eV93YWtldXAnCj4KPiBDYzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6IE5pcm1veSBEYXMgPG5p
cm1veS5haWVtZEBnbWFpbC5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdA
bGlzdHMubGluYXJvLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+CgpBcHBsaWVkLiAgVGhhbmtzIQoKQWxleAoKPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX2VudGl0eS5jCj4gaW5kZXggZjhlYzI3N2E2YWE4NS4uYzFhYzNlNDAwM2M2ZiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwo+IEBAIC0zMDgs
NyArMzA4LDcgQEAgdm9pZCBkcm1fc2NoZWRfZW50aXR5X2Rlc3Ryb3koc3RydWN0IGRybV9zY2hl
ZF9lbnRpdHkgKmVudGl0eSkKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRybV9zY2hlZF9lbnRpdHlf
ZGVzdHJveSk7Cj4KPiAtLyoqCj4gKy8qCj4gICAqIGRybV9zY2hlZF9lbnRpdHlfY2xlYXJfZGVw
IC0gY2FsbGJhY2sgdG8gY2xlYXIgdGhlIGVudGl0aWVzIGRlcGVuZGVuY3kKPiAgICovCj4gIHN0
YXRpYyB2b2lkIGRybV9zY2hlZF9lbnRpdHlfY2xlYXJfZGVwKHN0cnVjdCBkbWFfZmVuY2UgKmYs
Cj4gQEAgLTMyMSw3ICszMjEsNyBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfZW50aXR5X2NsZWFy
X2RlcChzdHJ1Y3QgZG1hX2ZlbmNlICpmLAo+ICAgICAgICAgZG1hX2ZlbmNlX3B1dChmKTsKPiAg
fQo+Cj4gLS8qKgo+ICsvKgo+ICAgKiBkcm1fc2NoZWRfZW50aXR5X2NsZWFyX2RlcCAtIGNhbGxi
YWNrIHRvIGNsZWFyIHRoZSBlbnRpdGllcyBkZXBlbmRlbmN5IGFuZAo+ICAgKiB3YWtlIHVwIHNj
aGVkdWxlcgo+ICAgKi8KPiAtLQo+IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
