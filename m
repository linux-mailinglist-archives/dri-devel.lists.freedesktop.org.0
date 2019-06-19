Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C704B714
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 13:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59E36E372;
	Wed, 19 Jun 2019 11:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9A06E377
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 11:31:50 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id a128so2043653oib.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 04:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a590KSuKPMz/+0KqNFnVOBURWvKiukLsqi7JKku8bGk=;
 b=jdq4hOIQ2d5+L6sRybFP3HXpIjR1EqJPu3lZEWlyWBPC16xLAFMszTdDmw2miOefGm
 C6+cgyslxsXHomd0lTv/lm29LxiBJVd4LE3J6xI3r061ADmXlF27nW4G5dzMqXnhpYgA
 k9h8IZMW7irojdzT9ftA9VCV2cIs0lBHKuEfWW1S+bVTjNpMkOSS/tCIUajfR+G1xVTR
 HxwRpCS1wVNVQkydWB0odvlNPxwqS3CYs1EuuO4S+y47roN5d5VnT9mUiz1az0XooWdQ
 d2ZXiEkR8hw6YJije8HIKY2eqa/HZueNf4t9sNtuT/nV2xoKLBtHCewkmyLzz4AhxaZB
 mrwQ==
X-Gm-Message-State: APjAAAUu4CLFZtNd8Cz6knzMZf/vK8MmEAMCKcUtaIBNdRcchvNNS68c
 gq1GWT+vJtqnYCA4KagSDMIDqJxyLPJXqTIyOQcBuQ==
X-Google-Smtp-Source: APXvYqwYHdPMsxsyTz9llTeAJtepKqBkzcKu5USkUS0oxtzCjFmrDwpZCEsVuzJwx59cA54J1ffyxoJ71o/hM/nsOYg=
X-Received: by 2002:aca:b104:: with SMTP id a4mr2139266oif.14.1560943909608;
 Wed, 19 Jun 2019 04:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-41-daniel.vetter@ffwll.ch>
 <20190617082438.s5eypq5lf6s33nyz@sirius.home.kraxel.org>
 <20190617135912.GB12905@phenom.ffwll.local>
 <20190618044925.qljngiypdch4wdsw@sirius.home.kraxel.org>
 <CAKMK7uGzO-r5MtU+EPWiqq=J_XuF5mRo8t_br2k++Uwd0+E2Zw@mail.gmail.com>
 <20190619112117.fook3u4at5nvepsk@sirius.home.kraxel.org>
In-Reply-To: <20190619112117.fook3u4at5nvepsk@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 19 Jun 2019 13:31:36 +0200
Message-ID: <CAKMK7uE-JSc2mMoB8uKk7YiXaSCM0Eyauv+rFbmAJfuEm7F-iA@mail.gmail.com>
Subject: Re: [PATCH 40/59] drm/vram-helper: Drop drm_gem_prime_export/import
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=a590KSuKPMz/+0KqNFnVOBURWvKiukLsqi7JKku8bGk=;
 b=WtAd7zdVvgA9nTHUYR1dFNKRC4N1O6a2aP/UB13ytvS7rvWIQsQI/XBsV5yQkSUG9V
 swzeB+7Xrj+4liP35uAhcvDSjaZnsppIWLoHbTl6S4lsQIxP+XNMzlZeWUpHNdqxrVYN
 Tmswu0ToqgdnAp4Oj7/FhNmpoD1qfbf1Emf3M=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMToyMSBQTSBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiAgIEhpLAo+Cj4gPiA+ID4gU2Vjb25kIG9uZSBpcyBkcm1fZHJp
dmVyLT5mb3BzLT5tbWFwLiBUaGF0IG9uZSB3ZSBuZWVkIHRvIGtlZXAsIGJ1dCB0aGlzCj4gPiA+
ID4gaXNuJ3QgbW1hcCBvbiBhIGJ1ZmZlciwgYnV0IG1tYXAgb24gdGhlIGVudGlyZSBkcm1fZGV2
aWNlLiBUaGUgb25lIHdoaWNoCj4gPiA+ID4gc2hvdWxkIGJlIHJlcGxhY2VkIGJ5IGRybV9nZW1f
b2JqZWN0X2Z1bmNzLnZtX29wcyBpcwo+ID4gPiA+IGRybV9kcml2ZXItPmdlbV92bV9vcHMuCj4g
PiA+Cj4gPiA+IEhtbSwgc2VlbXMgdHRtIGhhc24ndCBzb21ldGhpbmcgSSBjYW4gaG9vayBpbnRv
IGRybV9kcml2ZXItPmdlbV92bV9vcHMgLi4uCj4gPgo+ID4gdHRtX2JvX3ZtX29wcyBzZWVtcyB0
byBiZSB0aGUgdGhpbmcgeW91IHdhbnQuCj4KPiBXb3VsZG4ndCB3b3JrIGFzLWlzLCBidXQgd2hl
biB0dG0gYm8gYXJlIGEgc3ViY2xhc3Mgb2YgZ2VtIGJvcyBzaG91bGQKPiBiZSBwb3NzaWJsZSB0
byBjcmVhdGUgc29tZXRoaW5nIHVzYWJsZSBiYXNlZCBvbiBpdC4KCllvdSdkIG5lZWQgdG8gY3Jl
YXRlIGRyaXZlci1zcGVjaWZpYyB3cmFwcGVycywgYnV0IHRoYXQncyBzb21ld2hhdApkZWZlYXRp
bmcgdGhlIHBvaW50LgoKPiBSZWxhdGVkIHF1ZXN0aW9uOiB3aHkgdGhlcmUgaXMgbm8gZHJtX2dl
bV9vYmplY3RfZnVuY3MubW1hcCgpIGNhbGxiYWNrPwo+IEkgdGhpbmsgaXQgd291bGQgbWFrZSBz
ZW5zZSB0byBoYXZlIGEgY2FsbGJhY2sgd2hlcmUgdGhlIGJvLXNwZWNpZmljCj4gc2V0dXAgY2Fu
IGJlIGRvbmUsIGkuZS4gd2hhdCB0dG1fYm9fbW1hcCgpIG9yIGRybV9nZW1fc2htZW1fbW1hcCgp
IGFyZQo+IGRvaW5nLCBhbmQgaGF2ZSBzb21lIGdlbmVyaWMgZnVuY3Rpb24gd2hpY2ggYmFzaWNh
bGx5IGRvZXMgdGhlIGxvb2t1cCwKPiB0aGVuIGRpc3BhdGNoZXMuCgpNYXliZS4gQXRtIGFsbCB3
ZSBoYXZlIGFyb3VuZCBtbWFwIGlzIGEgc3ByYXdsaW5nIG51bWJlciBvZiBkaWZmZXJlbnQKc29s
dXRpb25zLiBBdG0gSSdtIG5vdCByZWFsbHkgc3VyZSB3aGljaCBkaXJlY3Rpb24gd2UgcmVhbGx5
IHNob3VsZApoZWFkIGludG8gLi4uCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUg
RW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
