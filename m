Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB264231DA
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 12:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0BF89295;
	Mon, 20 May 2019 10:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227A989293;
 Mon, 20 May 2019 10:58:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 May 2019 03:58:32 -0700
Received: from jkrzyszt-desk.ger.corp.intel.com ([172.22.244.18])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 May 2019 03:58:30 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [RFC PATCH] drm/i915: Tolerate file owned GEM contexts on hot
 unbind
Date: Mon, 20 May 2019 12:58:21 +0200
Message-ID: <1818300.2E6qEfYBKl@jkrzyszt-desk.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <155810355587.12244.1572259791791116662@skylake-alporthouse-com>
References: <20190517140617.31187-1-janusz.krzysztofik@linux.intel.com>
 <155810355587.12244.1572259791791116662@skylake-alporthouse-com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpZGF5LCBNYXkgMTcsIDIwMTkgNDozMjozNSBQTSBDRVNUIENocmlzIFdpbHNvbiB3cm90
ZToKPiBRdW90aW5nIEphbnVzeiBLcnp5c3p0b2ZpayAoMjAxOS0wNS0xNyAxNTowNjoxNykKPiA+
IEZyb206IEphbnVzeiBLcnp5c3p0b2ZpayA8amFudXN6LmtyenlzenRvZmlrQGludGVsLmNvbT4K
PiA+IAo+ID4gRHVyaW5nIGk5MTVfZHJpdmVyX3VubG9hZCgpLCBHRU0gY29udGV4dHMgYXJlIHZl
cmlmaWVkIHJlc3RyaWN0aXZlbHkKPiA+IGluc2lkZSBpOTE1X2dlbV9maW5pKCkgaWYgdGhleSBk
b24ndCBjb25zdW1lIHNoYXJlZCByZXNvdXJjZXMgd2hpY2gKPiA+IHNob3VsZCBiZSBjbGVhbmVk
IHVwIGJlZm9yZSB0aGUgZHJpdmVyIGlzIHJlbGVhc2VkLiAgSWYgdGhvc2UgY2hlY2tzCj4gPiBk
b24ndCByZXN1bHQgaW4ga2VybmVsIHBhbmljLCBvbmUgbW9yZSBjaGVjayBpcyBwZXJmb3JtZWQg
YXQgdGhlIGVuZCBvZgo+ID4gaTkxNV9nZW1fZmluaSgpIHdoaWNoIGlzc3VlcyBhIFdBUk5fT04o
KSBpZiBHRU0gY29udGV4dHMgc3RpbGwgZXhpc3QuCj4gCj4gSnVzdCBmaXggdGhlIHVuZGVybHlp
bmcgYnVnIG9mIHRoaXMgY29kZSBiZWluZyBjYWxsZWQgdG9vIGVhcmx5LiBUaGUKPiBhc3N1bXB0
aW9ucyB3ZSBtYWRlIGZvciB1bmxvYWQgYXJlIGNsZWFybHkgaW52YWxpZCB3aGVuIGFwcGxpZWQg
dG8KPiB1bmJpbmQsIGFuZCB3ZSBuZWVkIHRvIHNwbGl0IHRoZSBwaGFzZXMuCj4gLUNocmlzCgpU
aGFua3MgQ2hyaXMsIEkgdGhpbmsgSSBnZXQgaXQgZmluYWxseS4KCkphbnVzegoKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
