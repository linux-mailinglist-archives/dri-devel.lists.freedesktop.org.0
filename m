Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0C72AE435
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FF689D46;
	Tue, 10 Nov 2020 23:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F9D89D44;
 Tue, 10 Nov 2020 23:40:35 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b8so383562wrn.0;
 Tue, 10 Nov 2020 15:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7Kkc+sXRhJ1ZOnG2Idz2D/eyp50AaUEzxdbosWJCnfc=;
 b=sndifEs6IPBU1QcqULomDdKJbRO0B8RfN0xu255024by7JZYRljU0bAuVxa50FiNo6
 VowBpIAUU00RN8KYVwQHrt1gRpaAB+hBE5o5SM7p4Hs5shaY1jVHUtNXdSa59bi8V8kY
 KTq2thkxI4vpjMeDBz+m/lElBZhdALaGN2b2as/1SJ1zlFnVvmcWZ/cwGhWmk4nDg1lV
 omhGykiS/GkbbyTSIPLlYMVuLsQtq4S/4L1y/Y+kl3VhXuvoJDRo4vfJhgdbJ0zhmmdp
 3Eqtvo9bhVnNsfgz7XGwb2t982PyUj1M5sdmryLurJSSQsMM6TZy17jP37ZZ8aDLxp2Y
 gXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7Kkc+sXRhJ1ZOnG2Idz2D/eyp50AaUEzxdbosWJCnfc=;
 b=l8H+wB0UP5jIpfqD9yq80xATUBdswBP8bT2a/CpCz5yJZdCw3kHlG2JUzpx4ITNgzi
 kS+NQjPZ+wj66KIw7+jy3Xa2UY0FX8cdVnrLwv6hpOSv0OiZHHryNSanXKnnazUPMWdz
 iiLQbrcA71xALrFa59jPS5q366drffHZ1Eiq9dROapnH+0fVR6EiKu9QbX9DJfIl6AvU
 y5KohfVrK/is+VOrAinfTkw59M4MTuVsBrIuhGOfKoszEHY+IBHclNgdEXLcZEphZHpV
 s77MoisxU9nocRWeYRvJBIfYxGOSU+SzMGyatxWPrVpZT590GYl8Mnn3WkIpyqcn8se3
 BiFA==
X-Gm-Message-State: AOAM531TN8G57nTcb4AHWlDcEAc2CSOhUky4bKYPodILLrN/lnTeqfB9
 b5cuUhnExhjQy7rgcF6h+uR8/+mhFLDqvapske8=
X-Google-Smtp-Source: ABdhPJwDpXAdtq2BWrkbbFcS4rEJ6TQP6GK4YglRDW4qrqj+0WgIyXJz/2t5rDQl8yv8FHy71t/uUQ6HD/bc1bwV47o=
X-Received: by 2002:adf:f246:: with SMTP id b6mr26172437wrp.111.1605051634647; 
 Tue, 10 Nov 2020 15:40:34 -0800 (PST)
MIME-Version: 1.0
References: <20201110193112.988999-1-lee.jones@linaro.org>
 <20201110193112.988999-11-lee.jones@linaro.org>
In-Reply-To: <20201110193112.988999-11-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Nov 2020 18:40:20 -0500
Message-ID: <CADnq5_NRMtfiuVtORwQC0_3wwXG9N9Hx7BrmO-atOfAOM1qwwA@mail.gmail.com>
Subject: Re: [PATCH 10/30] drm/radeon/radeon_sync: Add description for
 function param 'rdev'
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgMjozMSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3N5bmMuYzo5Mjog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAncmRldicgbm90IGRlc2NyaWJl
ZCBpbiAncmFkZW9uX3N5bmNfcmVzdicKPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5z
ZW13YWxAbGluYXJvLm9yZz4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmcKPiBDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnCj4gU2lnbmVk
LW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCkFwcGxpZWQuICBUaGFu
a3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9zeW5jLmMg
fCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fc3luYy5jIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fc3luYy5jCj4gaW5kZXggNTVjYzc3YTczYzdiNy4uNWQzMzAyOTQ1MDc2YiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9zeW5jLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9zeW5jLmMKPiBAQCAtNzksNiArNzksNyBA
QCB2b2lkIHJhZGVvbl9zeW5jX2ZlbmNlKHN0cnVjdCByYWRlb25fc3luYyAqc3luYywKPiAgLyoq
Cj4gICAqIHJhZGVvbl9zeW5jX3Jlc3YgLSB1c2UgdGhlIHNlbWFwaG9yZXMgdG8gc3luYyB0byBh
IHJlc2VydmF0aW9uIG9iamVjdAo+ICAgKgo+ICsgKiBAcmRldjogcmFkZW9uX2RldmljZSBwb2lu
dGVyCj4gICAqIEBzeW5jOiBzeW5jIG9iamVjdCB0byBhZGQgZmVuY2VzIGZyb20gcmVzZXJ2YXRp
b24gb2JqZWN0IHRvCj4gICAqIEByZXN2OiByZXNlcnZhdGlvbiBvYmplY3Qgd2l0aCBlbWJlZGRl
ZCBmZW5jZQo+ICAgKiBAc2hhcmVkOiB0cnVlIGlmIHdlIHNob3VsZCBvbmx5IHN5bmMgdG8gdGhl
IGV4Y2x1c2l2ZSBmZW5jZQo+IC0tCj4gMi4yNS4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
