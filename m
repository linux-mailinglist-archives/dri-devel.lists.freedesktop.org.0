Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40704D5A2E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 06:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644906E1E9;
	Mon, 14 Oct 2019 04:21:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749C46E1D6;
 Mon, 14 Oct 2019 04:21:45 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id x3so12682344oig.2;
 Sun, 13 Oct 2019 21:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dKy3Tz6Ws931G3AGzhWPaubEyLxuWiw82SbOfGPJLPo=;
 b=To2yEHTN2N1+yYfrdL+DAeJQyhwNfTBCfnX6bU6dQMBrv92x/9h8t7c3+ikC+9lzuT
 kJrGnRRvEBEg6skjQBzoD7sUfmaUNLemsPnvS+uhjIBaBsCs169GIZOZxuSJdu2koLpA
 HAIeBfQSyo6XmMWhlcBTytveWyc7rlFUwFs325a9mS0EY0XF7v2rOflndB3MXPSs2KCx
 PtnPQhtBtPMswWu+6fjbTp8x9OBkb/0g2JqskfJmx0HIB/CE275desg6Dx+bzWd0LuoC
 K4BxrxqoGoK9ftLIZYawjcDfIp1sxh/O1lYod82kynnePidFmBORKquaockc/ep6bSG4
 lLXA==
X-Gm-Message-State: APjAAAU/LSTXioqOWmeoqq1Dhr4OMru8pzSrjtz1zKDbjjirecxLoFYB
 IsO2R2ErP7+qh7tA2OyJXs0ypQ6fMqjwCtYVhW8=
X-Google-Smtp-Source: APXvYqwdo1oI7VIsFX600LBwsUxIrWljsN16wa/Lpkdj+m0gQUhOqx7fEiRyReaLFJR7W6TqR8GoB8aFl7Gx6l25YpE=
X-Received: by 2002:a05:6808:9:: with SMTP id u9mr23189003oic.98.1571026904544; 
 Sun, 13 Oct 2019 21:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191010140152.17747-1-yuq825@gmail.com>
In-Reply-To: <20191010140152.17747-1-yuq825@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sun, 13 Oct 2019 21:21:18 -0700
Message-ID: <CA+E=qVdxZ83k_3G=ynxmN5Wkw2wirCWWH5H2SDw=OkGFruv_9w@mail.gmail.com>
Subject: Re: [Lima] [PATCH v4 0/3] drm/lima: simplify driver by using more drm
 helpers
To: Qiang Yu <yuq825@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dKy3Tz6Ws931G3AGzhWPaubEyLxuWiw82SbOfGPJLPo=;
 b=JdcRigxNr34YusdqulR6edguaOCbsZU70zFdEl3lyf6+RaoyXNFpFsU0ion1sbos7Q
 coQM17KGaNYFe6Ex7ezolrpanEs880YG/G/m9XiSmUSMrL4Ucn2Zq3xTvaT58O6UZj/4
 V2k6Wkccx0sV/qzBVRXpD2XvhUT2a4+GbqdeDWnW0wpeiJwkcA3MZ+QkHdP+aifqIdUS
 S9CA9zUx24QBanHUdlLp9bLJ48ceP4mIf+1UyH0L5VYZvagoWh1hWxP3uJPFKr5ucCJx
 ikNBIk6oWUxm3aApW9+7TnXQ2vS2+/FsfSHr1A1l76rvggj6xzOOGhz+dSmG6x2+Wz/7
 Qwmg==
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgNzowMiBBTSBRaWFuZyBZdSA8eXVxODI1QGdtYWlsLmNv
bT4gd3JvdGU6Cj4KPiBCeSB1c2luZyBzaGFyZWQgZHJtIGhlbHBlcnM6Cj4gMS4gZHJtX2dlbV8o
dW4pbG9ja19yZXNlcnZhdGlvbnMKPiAyLiBkcm1fZ2VtX3NobWVtX2hlbHBlcnMKPiB3ZSBjYW4g
c2ltcGxpZnkgbGltYSBkcml2ZXIgYSBsb3QgYW5kIGJlbmlmaXQgZnJvbSB1cGRhdGVzIHRvCj4g
dGhlc2UgZnVuY3Rpb25zLgo+Cj4gUGF0Y2ggc2VyaWVzIGlzIGJhc2VkIG9uIGRybS1taXNjLW5l
eHQgYnJhbmNoCj4KPiB2MjoKPiBBZGQgZHJtX2dlbV9vYmplY3RzX2xvb2t1cF91c2VyIGFuZCB1
c2UgaXQgZm9yIGRyaXZlciB3aGljaAo+IHBhc3MgdXNlciBHRU0gaGFuZGxlcyBpbiBjb250aW91
cyBhcnJheS4KPgo+IHYzOgo+IGltcHJvdmUgY29tbWl0IGNvbW1lbnQuCj4KPiB2NDoKPiBEcm9w
IGRybV9nZW1fb2JqZWN0c19sb29rdXAgcmVmaW5lIHBhdGNoZXMuCj4KPiBRaWFuZyBZdSAoMyk6
Cj4gICBkcm0vbGltYTogdXNlIGRybV9nZW1fc2htZW1faGVscGVycwo+ICAgZHJtL2xpbWE6IHVz
ZSBkcm1fZ2VtXyh1bilsb2NrX3Jlc2VydmF0aW9ucwo+ICAgZHJtL2xpbWE6IGFkZCBfX0dGUF9O
T1dBUk4gZmxhZyB0byBhbGwgZG1hX2FsbG9jX3djCgpMR1RNLCB3aG9sZSBzZXJpZXM6CgpSZXZp
ZXdlZC1ieTogVmFzaWx5IEtob3J1emhpY2sgPGFuYXJzb3VsQGdtYWlsLmNvbT4KCj4gIGRyaXZl
cnMvZ3B1L2RybS9saW1hL0tjb25maWcgICAgICAgICAgfCAgIDEgKwo+ICBkcml2ZXJzL2dwdS9k
cm0vbGltYS9NYWtlZmlsZSAgICAgICAgIHwgICA0ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9saW1h
L2xpbWFfZGV2aWNlLmMgICAgfCAgIDIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9k
cnYuYyAgICAgICB8ICAyMiArLS0KPiAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYyAg
ICAgICB8IDE5NSArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bGltYS9saW1hX2dlbS5oICAgICAgIHwgIDMyICsrKystCj4gIGRyaXZlcnMvZ3B1L2RybS9saW1h
L2xpbWFfZ2VtX3ByaW1lLmMgfCAgNDYgLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xp
bWFfZ2VtX3ByaW1lLmggfCAgMTMgLS0KPiAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9tbXUu
YyAgICAgICB8ICAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfb2JqZWN0LmMgICAg
fCAxMTkgLS0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX29iamVj
dC5oICAgIHwgIDM1IC0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfc2NoZWQuYyAg
ICAgfCAgIDYgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV92bS5jICAgICAgICB8ICA4
NyArKysrKystLS0tLS0KPiAgMTMgZmlsZXMgY2hhbmdlZCwgMTQ4IGluc2VydGlvbnMoKyksIDQx
NSBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9saW1h
L2xpbWFfZ2VtX3ByaW1lLmMKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9s
aW1hL2xpbWFfZ2VtX3ByaW1lLmgKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9saW1hL2xpbWFfb2JqZWN0LmMKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9saW1hL2xpbWFfb2JqZWN0LmgKPgo+IC0tCj4gMi4xNy4xCj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbWEgbWFpbGluZyBsaXN0Cj4gbGlt
YUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbWEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
