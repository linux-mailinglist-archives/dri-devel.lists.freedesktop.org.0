Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E018EDCD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 16:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E6BB6E9C1;
	Thu, 15 Aug 2019 14:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9AB6E9C1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 14:11:13 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id l12so2129876oil.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 07:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JoGosoNZCrkvvmYn2s5nj1f5F7hDnA1u4nMizuQrZrY=;
 b=Oyl4oQZMbEhXBn2ADNO9jkGM27LROAKu2Wrw5t9s/VtMVyX7Au26nBIFWgdGsIa+im
 ueQS+uHOxAaT0XuhAacn6Wz4PNhTcmhg0cvyuVqCEqtjA15OfC+N5eD+rAGYfcLi7wWi
 oc30I+xn5sCeS1Ba6ckkt92ZndMp04r08Hjy/zga+IDuAJboaSnH9X7fQ6eKTFhqeN0i
 1wr2bkh2KhWt/lR6y3LvLuQ2eTctFLXv3SVewjEmXNpP4mtGQVjMCgDsoIiSqmHn7Rv2
 9+KWCkTzOQt0pZGKJdNuR6zwnk7FYDvgJr3HgrWha6hUErINTWsOodW18ziZqp+xPas5
 T9jg==
X-Gm-Message-State: APjAAAX0+ZLHB0pgRNpLw0gwpQleJIb13mBt6EUm9JgwccvDSmLWyd+A
 +LvJl50BeLUE5DdOAgucijyUnUCwTcg111nzSNPcSA==
X-Google-Smtp-Source: APXvYqxHHuZUJHutmpU1PxQt0uV2+Ykat106aSv9mv+sZohSCF2iaIS7JJIHSD9E9jn0yYbTdunJelrlspa8xiz2IJo=
X-Received: by 2002:aca:1a0b:: with SMTP id a11mr1746505oia.128.1565878272617; 
 Thu, 15 Aug 2019 07:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
In-Reply-To: <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 15 Aug 2019 16:11:00 +0200
Message-ID: <CAKMK7uG1cugQvYLpEivDGg7+D0tUp5B9Jo7hWQCsmbXe3TC3nQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=JoGosoNZCrkvvmYn2s5nj1f5F7hDnA1u4nMizuQrZrY=;
 b=ZXn1m1FH5gKNEJpDzbYEQ/TeOQBFIvpbkI0YuusZkSaNu++nHT1eLRd2C0K7SmEAgt
 jcz2rhXJ7QOxzzGjCvG5GHfReRUVq1aSjj24gtd7eoYRZGB5E3+Qbmxj6k0AyKDjw0TD
 z1yiA/d8MOlh5J7FDAOEg7RTXNhViOukHDi9w=
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTI6NDcgQU0gRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgMTUgQXVnIDIwMTkgYXQgMDc6MzEsIEthcm9sIEhl
cmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGlzIHJldmVydHMgY29t
bWl0IDI4NTg2YTUxZWVhNjY2ZDU1MzFiY2FlZjJmNjhlNGFiYmQ4NzI0MmMuCj4gPgo+ID4gVGhl
IG9yaWdpbmFsIGNvbW1pdCBtZXNzYWdlIGRpZG4ndCBldmVuIG1ha2Ugc2Vuc2UuIEFNRCBfZG9l
c18gc3VwcG9ydCBpdCBhbmQKPiA+IGl0IHdvcmtzIHdpdGggTm91dmVhdSBhcyB3ZWxsLgo+ID4K
PiA+IEFsc28gd2hhdCB3YXMgdGhlIGlzc3VlIGJlaW5nIHNvbHZlZCBoZXJlPyBObyByZWZlcmVu
Y2VzIHRvIGFueSBidWdzIGFuZCBub3QKPiA+IGV2ZW4gZXhwbGFpbmluZyBhbnkgaXNzdWUgYXQg
YWxsIGlzbid0IHRoZSB3YXkgd2UgZG8gdGhpbmdzLgo+ID4KPiA+IEFuZCBldmVuIGlmIGl0IG1l
YW5zIGEgbXV4ZWQgZGVzaWduLCB0aGVuIHRoZSBmaXggaXMgdG8gbWFrZSBpdCB3b3JrIGluc2lk
ZSB0aGUKPiA+IGRyaXZlciwgbm90IGFkZGluZyBzb21lIGhhY2t5IHdvcmthcm91bmQgdGhyb3Vn
aCBBQ1BJIHRyaWNrcy4KPiA+Cj4gPiBBbmQgd2hhdCBvdXQgb2YgdHJlZSBkcml2ZXJzIGRvIG9y
IGRvIG5vdCBzdXBwb3J0IHdlIGRvbid0IGNhcmUgb25lIGJpdCBhbnl3YXkuCj4gPgo+Cj4gSSB0
aGluayB0aGUgcmV2ZXJ0cyBzaG91bGQgYmUgbWVyZ2VkIHZpYSBSYWZhZWwncyB0cmVlIGFzIHRo
ZSBvcmlnaW5hbAo+IHBhdGNoZXMgd2VudCBpbiB2aWEgdGhlcmUsIGFuZCB3ZSBzaG91bGQgZ2V0
IHRoZW0gaW4gYXNhcC4KCisxCgo+IEFja2VkLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRo
YXQuY29tPgoKQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
CgpBbHNvIGZ1bGx5IGFncmVlaW5nIHdpdGggS2Fyb2wncyByZXBseSBmdXJ0aGVyIGRvd24sIGlm
IHRoaXMgZG9lc24ndAp3b3JrIHdlIG5lZWQgdG8gaW1wcm92ZSB0aGUgZHJpdmVycywgbm90IHBp
bGUgc3R1ZmYgb24gdG9wIGluIHNvbWUKQUNQSSBoYWNrcy4KLURhbmllbAotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUg
NTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
