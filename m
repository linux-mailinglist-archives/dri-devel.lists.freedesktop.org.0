Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1449B585D3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 17:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B96E6E056;
	Thu, 27 Jun 2019 15:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC8966E36D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 13:54:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8458B360;
 Thu, 27 Jun 2019 06:54:47 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 829F23F246;
 Thu, 27 Jun 2019 06:54:46 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Add AArch64 page table format support
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
References: <20190513144012.17243-1-robh@kernel.org>
 <CAAObsKADkCLUDSJ9aAxQ_WAotFYTuUuVhifKA5Y+dWjOfmmP4w@mail.gmail.com>
 <deb3aa13-36ea-acdf-b3bd-3380cbe75fda@arm.com>
 <CAAObsKDOvnLU+k5jDbAibq58uh_6-Af4c1STw4Bd0AfDQrYOEw@mail.gmail.com>
 <CAL_JsqLqZ-R+bkEkqsyn1ir9KQ14FwR=uATJJZFRs_t1dkOgLg@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <d5adbbae-0dcd-0c31-2a8a-29ff535ead0f@arm.com>
Date: Thu, 27 Jun 2019 14:54:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLqZ-R+bkEkqsyn1ir9KQ14FwR=uATJJZFRs_t1dkOgLg@mail.gmail.com>
Content-Language: en-GB
X-Mailman-Approved-At: Thu, 27 Jun 2019 15:33:25 +0000
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
Cc: Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMDYvMjAxOSAxNDoyMCwgUm9iIEhlcnJpbmcgd3JvdGU6ClsuLi5dCj4gSSB3b3VsZG4n
dCBoYXZlIGV4cGVjdGVkIEFTX1RSQU5TQ0ZHX0FEUk1PREVfTEVHQUNZIHRvIHdvcmsgYW5kIGlm
IGl0Cj4gZGlkIGl0IHdhcyBieSBjaGFuY2UuIFNvIEkgZG9uJ3QgdGhpbmsgaXQgaXMgc29tZXRo
aW5nIHdlIHdhbnQgdG8KPiBzdXBwb3J0LgoKQWN0dWFsbHkgbGVnYWN5IG1vZGUgaXMgc3VwcG9y
dGVkIG9uIChtb3N0PykgQmlmcm9zdCBHUFVzLiBCdXQgYmVzdCB0bwpmb2xsb3cgdGhlIGxlYWQg
b2Yga2Jhc2UgaGVyZSBhcyB0aGF0IHdpbGwgYmUgd2hhdCBoYXMgYmVlbiB0ZXN0ZWQuCgpTdGV2
ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
