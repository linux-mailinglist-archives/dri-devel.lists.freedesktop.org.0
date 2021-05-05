Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E821374277
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 18:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2826EC26;
	Wed,  5 May 2021 16:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7AC6EC26
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 16:47:25 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id j11so1676595qtn.12
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 09:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hfuvq0lPPGJtYdyZ1vkVytRA0Pk45RS2gIGvlt4/7G8=;
 b=nLZa5ictAQo0EczmGFCfPvEAupEfk6LpOo2Zt5K6BIdja6ratXcSL5ejabb5dSaW2s
 vkwT7ceM0GtgOQsRsLOPbtcezdDxs2J2i1/tI5X5jMFBUQmW7CwrZ1bJRDuHOH1Sfwc3
 SwqOVxgWz+a65KiHlIAld4VCS64xKME8bW5Uay5gJExsoLGzWIHe80t5JomYj6jKeVWM
 L0j5gNHvWw91YqPlfvQ05gKHI8lj2cM/7s9p6Okixskevnh9WCKXkV/04KB+taenkAB4
 Y1mPmYcl3kyq4CCo9pHOSPnZWPOGXnLVyrktS428vTK+cmW0bV030PYpzC6u2iPhQYTz
 U/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hfuvq0lPPGJtYdyZ1vkVytRA0Pk45RS2gIGvlt4/7G8=;
 b=pIpWY79YYIjA0HrbjgMJoq4PL72XT+OlBSG3gKit+2Uz5YCZ7c5FfMVx4iEGKzX5Mv
 J6Q+Cw5GJ6vMuvnmLDCMxcP7nV6Df98l1FvkVs9M972XA1p5eP9BaehbGAZavFoxn4UN
 gKtNsqE0JciqlQsG9Hj2rEg4I3sn7gxLaHf2Ze74R85vOtXM+n6WbYkgcdv6xpM+B3tp
 Qx5PirD3Nj1+DUfsqdtXLc4d6PGFIoV/Eb9di++ey6QXHXezrQomJ4bw5s6uY5ZgtwpO
 5AVvHKAx7B4ghqpeY9+/bC4PrhJs06m1LgDERRd73NhReAPMf4EiRQeecUxHJaC+bivA
 AEpQ==
X-Gm-Message-State: AOAM532zRvO9ylMP9ysGIGTEK3xnVFpi2PeQdqca6fiYemYBRwABSpCm
 TIMWX7ErnfBYEjlamua9aWNgGEpFvNVbmi94atY=
X-Google-Smtp-Source: ABdhPJwFMQ2i5Ggi5asoqKzPQL3Ltc5U3zyYwqkHXmJ8AYEt9sD7vQPm+uE6PJ8V/kTjKCMb7clZwCAVJPxqPUuuVUY=
X-Received: by 2002:ac8:7408:: with SMTP id p8mr4081063qtq.265.1620233244860; 
 Wed, 05 May 2021 09:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210430092508.60710-1-christian.koenig@amd.com>
 <20210430092508.60710-11-christian.koenig@amd.com>
 <CAM0jSHN0+w-VxmB9edWhbeq6faWfsC-r2R9N7q4p6PtjZUEdhA@mail.gmail.com>
 <b16ba144-4553-5cf0-67ad-602a411e514a@gmail.com>
In-Reply-To: <b16ba144-4553-5cf0-67ad-602a411e514a@gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 5 May 2021 17:46:58 +0100
Message-ID: <CAM0jSHOYHsnEah5Xd=Ui=zND4Yu3vwnHrcTqheXnxVh5uiS7YA@mail.gmail.com>
Subject: Re: [PATCH 11/13] drm/nouveau: switch the TTM backends to self alloc
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAzIE1heSAyMDIxIGF0IDEyOjE0LCBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmlnLmxl
aWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBbSAzMC4wNC4yMSB1bSAxNzowMiBz
Y2hyaWViIE1hdHRoZXcgQXVsZDoKPiA+IE9uIEZyaSwgMzAgQXByIDIwMjEgYXQgMTA6MjUsIENo
cmlzdGlhbiBLw7ZuaWcKPiA+IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPj4gU2ltaWxhciB0byB0aGUgVFRNIHJhbmdlIG1hbmFnZXIuCj4gPj4KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4g
Pj4gLS0tCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X21lbS5oIHwgMSAr
Cj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jIHwgNCArKysrCj4g
Pj4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ID4+Cj4gPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfbWVtLmggYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X21lbS5oCj4gPj4gaW5kZXggN2RmMzg0OGU4NWFhLi4zYTZhMWJl
MmVkNTIgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9t
ZW0uaAo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfbWVtLmgKPiA+
PiBAQCAtMTMsNiArMTMsNyBAQCBub3V2ZWF1X21lbShzdHJ1Y3QgdHRtX3Jlc291cmNlICpyZWcp
Cj4gPj4gICB9Cj4gPj4KPiA+PiAgIHN0cnVjdCBub3V2ZWF1X21lbSB7Cj4gPj4gKyAgICAgICBz
dHJ1Y3QgdHRtX3Jlc291cmNlIGJhc2U7Cj4gPj4gICAgICAgICAgc3RydWN0IG5vdXZlYXVfY2xp
ICpjbGk7Cj4gPj4gICAgICAgICAgdTgga2luZDsKPiA+PiAgICAgICAgICB1OCBjb21wOwo+ID4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3R0bS5jIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwo+ID4+IGluZGV4IDE1Yzc2MjdmOGY1
OC4uNWU1Y2UyZWM4OWYwIDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfdHRtLmMKPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X3R0bS5jCj4gPj4gQEAgLTU5LDYgKzU5LDggQEAgbm91dmVhdV92cmFtX21hbmFnZXJfbmV3KHN0
cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuLAo+ID4+ICAgICAgICAgIGlmIChyZXQpCj4g
Pj4gICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4+Cj4gPj4gKyAgICAgICB0dG1fcmVz
b3VyY2VfaW5pdChibywgcGxhY2UsIHJlZy0+bW1fbm9kZSk7Cj4gPj4gKwo+ID4gV2hhdCBoYXBw
ZW5lZCBoZXJlPyBJIGFzc3VtZSB0aGlzIG5lZWRzIHRvIGJlIG5vdXZlYXVfbWVtLmJhc2Ugbm90
IHRoZSBtbV9ub2RlPwo+Cj4gU2FtZSBsaWtlIHRoZSBvdGhlciBiYWNrZW5kcyBJJ20gZmlyc3Qg
Y2hhbmdpbmcgdGhlIGFsbG9jYXRpb24gc28gdGhhdAo+IHdlIGFsbG9jYXRlIHR0bV9yZXNvdXJj
ZSBhbmQgdGhlIHByaXZhdGUgaG91c2VrZWVwaW5nIHRvZ2V0aGVyIGFuZCB0aGVuCj4gZmxpcCB0
aGUgc3dpdGNoIGluIHRoZSBsYXN0IHBhdGNoLgo+Cj4gU28gcmVnLT5tbV9ub2RlIGlzIHRlbXBv
cmFyeSBwb2ludGluZyB0byB0aGUgdHRtX3Jlc291cmNlIG9iamVjdCB1bnRpbAo+IGl0IGlzIHJl
bW92ZWQgaW4gdGhlIGxhc3QgcGF0Y2guCgpPaywgbWFrZXMgc2Vuc2UsClJldmlld2VkLWJ5OiBN
YXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+Cgo+Cj4gQ2hyaXN0aWFuLgo+Cj4g
Pgo+ID4+ICAgICAgICAgIHJldCA9IG5vdXZlYXVfbWVtX3ZyYW0ocmVnLCBudmJvLT5jb250aWcs
IG52Ym8tPnBhZ2UpOwo+ID4+ICAgICAgICAgIGlmIChyZXQpIHsKPiA+PiAgICAgICAgICAgICAg
ICAgIG5vdXZlYXVfbWVtX2RlbChyZWcpOwo+ID4+IEBAIC04Nyw2ICs4OSw3IEBAIG5vdXZlYXVf
Z2FydF9tYW5hZ2VyX25ldyhzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwKPiA+PiAg
ICAgICAgICBpZiAocmV0KQo+ID4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+Pgo+
ID4+ICsgICAgICAgdHRtX3Jlc291cmNlX2luaXQoYm8sIHBsYWNlLCByZWctPm1tX25vZGUpOwo+
ID4+ICAgICAgICAgIHJlZy0+c3RhcnQgPSAwOwo+ID4+ICAgICAgICAgIHJldHVybiAwOwo+ID4+
ICAgfQo+ID4+IEBAIC0xMTIsNiArMTE1LDcgQEAgbnYwNF9nYXJ0X21hbmFnZXJfbmV3KHN0cnVj
dCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuLAo+ID4+ICAgICAgICAgIGlmIChyZXQpCj4gPj4g
ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4+Cj4gPj4gKyAgICAgICB0dG1fcmVzb3Vy
Y2VfaW5pdChibywgcGxhY2UsIHJlZy0+bW1fbm9kZSk7Cj4gPj4gICAgICAgICAgcmV0ID0gbnZp
Zl92bW1fZ2V0KCZtZW0tPmNsaS0+dm1tLnZtbSwgUFRFUywgZmFsc2UsIDEyLCAwLAo+ID4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAobG9uZylyZWctPm51bV9wYWdlcyA8PCBQQUdFX1NI
SUZULCAmbWVtLT52bWFbMF0pOwo+ID4+ICAgICAgICAgIGlmIChyZXQpIHsKPiA+PiAtLQo+ID4+
IDIuMjUuMQo+ID4+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
