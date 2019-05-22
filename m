Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BD326605
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C186089B7D;
	Wed, 22 May 2019 14:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id A93C6899F3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 12:39:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83A4780D;
 Wed, 22 May 2019 05:39:07 -0700 (PDT)
Received: from [10.1.196.69] (e112269-lin.cambridge.arm.com [10.1.196.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B9483F575;
 Wed, 22 May 2019 05:39:05 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] drm/panfrost: Use drm_gem_shmem_map_offset()
To: Chris Wilson <chris@chris-wilson.co.uk>, Rob Herring <robh@kernel.org>
References: <20190520092306.27633-1-steven.price@arm.com>
 <20190520092306.27633-3-steven.price@arm.com>
 <CAL_JsqLzefOvopTCuyBsNhJDGbFV3JdVce0x398vMaGy3-+fVw@mail.gmail.com>
 <155846303227.23981.8007374203089408422@skylake-alporthouse-com>
From: Steven Price <steven.price@arm.com>
Message-ID: <a4cd9ada-aaf1-3bd8-a138-f61308baf70c@arm.com>
Date: Wed, 22 May 2019 13:39:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <155846303227.23981.8007374203089408422@skylake-alporthouse-com>
Content-Language: en-GB
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjEvMDUvMjAxOSAxOToyMywgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgUm9iIEhl
cnJpbmcgKDIwMTktMDUtMjEgMTY6MjQ6MjcpCj4+IE9uIE1vbiwgTWF5IDIwLCAyMDE5IGF0IDQ6
MjMgQU0gU3RldmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4gd3JvdGU6Cj4+Pgo+Pgo+
PiBZb3UgZm9yZ290IHRvIHVwZGF0ZSB0aGUgc3ViamVjdC4gSSBjYW4gZml4dXAgd2hlbiBhcHBs
eWluZywgYnV0IEknZAo+PiBsaWtlIGFuIGFjayBmcm9tIENocmlzIG9uIHBhdGNoIDEuCgpTb3Jy
eSBhYm91dCB0aGF0IC0gSSdsbCB0cnkgdG8gYmUgbW9yZSBjYXJlZnVsIGluIHRoZSBmdXR1cmUu
Cgo+IEkgc3RpbGwgdGhpbmsgaXQgaXMgaW5jb3JyZWN0IGFzIHRoZSBsaW1pdGF0aW9uIGlzIHB1
cmVseSBhbiBpc3N1ZSB3aXRoCj4gdGhlIHNobWVtIGJhY2tlbmQgYW5kIG5vdCBhIGdlbmVyaWMg
R0VNIGxpbWl0YXRpb24uIEl0IG1hdHRlcnMgaWYgeW91CgpEbyB5b3UgcHJlZmVyIHRoZSBwcmV2
aW91cyB2ZXJzaW9uIG9mIHRoaXMgc2VyaWVzWzFdIHdpdGggdGhlIHNobWVtIGhlbHBlcj8KClsx
XQpodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkwNTE2MTQxNDQ3LjQ2ODM5LTEtc3Rl
dmVuLnByaWNlQGFybS5jb20vCgpBbHRob3VnaCB0aGlzIGlzbid0IGEgZ2VuZXJpYyBHRU0gbGlt
aXRhdGlvbiBpdCdzIGN1cnJlbnRseSB0aGUgc2FtZQpsaW1pdGF0aW9uIHRoYXQgYXBwbGllcyB0
byB0aGUgJ2R1bWInIGRyaXZlcnMgYXMgd2VsbCBhcyBzaG1lbSBiYWNrZW5kLApzbyBJJ2QgcHJl
ZmVyIG5vdCBpbXBsZW1lbnRpbmcgdHdvIGlkZW50aWNhbCBmdW5jdGlvbnMgcHVyZWx5IGJlY2F1
c2UKdGhpcyBsaW1pdGF0aW9uIGNvdWxkIGJlIHJlbW92ZWQgaW4gdGhlIGZ1dHVyZS4KCj4gaGF2
ZSBhIGhpc3Rvcnkgb2YgcGFzc2luZyBuYW1lcyBhbmQgd2FudCBhIGNvbnNpc3RlbnQgYXBpIGFj
cm9zcyBvYmplY3RzCj4gd2hlbiB0aGUgYXBwcyB0aGVtc2VsdmVzIG5vIGxvbmdlciBjYW4gdGVs
bCB0aGUgZGlmZmVyZW5jZSwgYW5kCj4gY2VydGFpbmx5IGRvIG5vdCBoYXZlIGFjY2VzcyB0byB0
aGUgZG1hYnVmIGZkLiBpOTE1IHByb3ZpZGVzIGFuIGluZGlyZWN0Cj4gbW1hcCBpbnRlcmZhY2Ug
dGhhdCB1c2VzIHRoZSBkbWEgbWFwcGluZyByZWdhcmRsZXNzIG9mIHNvdXJjZS4KCkkgZG9uJ3Qg
dW5kZXJzdGFuZCB0aGUgaTkxNSBkcml2ZXIsIGJ1dCBmcm9tIGEgcXVpY2sgbG9vayBhdCB0aGUg
c291cmNlCm9mIGk5MTVfZ2VtX21tYXBfaW9jdGwoKToKCgkvKiBwcmltZSBvYmplY3RzIGhhdmUg
bm8gYmFja2luZyBmaWxwIHRvIEdFTSBtbWFwCgkgKiBwYWdlcyBmcm9tLgoJICovCglpZiAoIW9i
ai0+YmFzZS5maWxwKSB7CgkJYWRkciA9IC1FTlhJTzsKCQlnb3RvIGVycjsKCX0KCml0IGxvb2tz
IHRvIG1lIHRoYXQgYW4gYXR0ZW1wdCB0byBtYXAgYW4gaW1wb3J0ZWQgZG1hYnVmIGZyb20gdXNl
ciBzcGFjZQp1c2luZyB0aGUgaW9jdGwgd2lsbCBmYWlsLiBBbSBJIG1pc3Npbmcgc29tZXRoaW5n
PwoKZXh5bm9zX2RybV9nZW1fbW1hcCgpIGlzIHRoZSBvbmx5IChtYWlubGluZVsyXSkgaW5zdGFu
Y2UgSSBjYW4gc2VlIHdoZXJlCmEgdHJhbnNwYXJlbnQgbWFwcGluZyBvZiBhIGRtYV9idWYgaXMg
c3VwcG9ydGVkLgoKWzJdIG1hbGlfa2Jhc2UgZG9lcyB0aGlzIHRvbyAtIGJ1dCBJJ20gbm90IGNv
bnZpbmNlZCBpdCB3YXMgYSBnb29kIGlkZWEuCgpJIGNvdWxkIGluc3RlYWQgYWRkIHN1cHBvcnQg
aW4gc2htZW0vcGFuZnJvc3QgZm9yIHRyYW5zcGFyZW50bHkgcGFzc2luZwp0aGUgcmVxdWVzdCB0
byB0aGUgZXhwb3J0ZXIgKGkuZS4gY2FsbCBkbWFfYnVmX21tYXAoKSkgLSBidXQgSSdtIG5vdApz
dXJlIHdlIHdhbnQgdG8gaW1wbGVtZW50IHRoaXMgaWYgdGhlcmUgaXNuJ3QgZ29pbmcgdG8gYmUg
YSB1c2VyIG9mIHRoZQpzdXBwb3J0LgoKU3RldmUKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
