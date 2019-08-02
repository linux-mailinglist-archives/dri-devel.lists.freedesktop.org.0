Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A0C7FD7F
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 17:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F25B6EEB5;
	Fri,  2 Aug 2019 15:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF716EEB4;
 Fri,  2 Aug 2019 15:29:03 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 60CAC80348;
 Fri,  2 Aug 2019 17:28:57 +0200 (CEST)
Date: Fri, 2 Aug 2019 17:28:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH v1 02/11] drm: drop uapi dependency from
 drm_print.h
Message-ID: <20190802152855.GA5626@ravnborg.org>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-3-sam@ravnborg.org>
 <156346840026.24728.936589728458336617@skylake-alporthouse-com>
 <460bf1e1-a38b-5f79-26e5-93764067f4e1@amd.com>
 <87tvb5nh5c.fsf@intel.com> <20190729143555.GA16927@ravnborg.org>
 <67c2807f-582c-49a9-5699-a8baab3d3a0f@amd.com>
 <20190729175011.GA1753@ravnborg.org> <87o917lluk.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o917lluk.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=xl3f9RERdMI_gyxlFtwA:9 a=CjuIK1q_8ugA:10
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Thierry Reding <treding@nvidia.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFuaS4KCj4gPj4gSSBtZWFuIGlzIGl0IHVzZWZ1bCB0byBoYXZlIHRoaXMgZXh0cmEgcHJp
bnRpbmcgc3Vic3lzdGVtIGluIERSTSB3aGlsZSAKPiA+PiB0aGUgc3RhbmRhcmQgTGludXggb25l
IGFjdHVhbGx5IGRvZXMgYSBiZXR0ZXIgam9iPwo+ID4gVGhlIGFkZGVkIGZ1bmN0aW9uYWxpdHkg
b2YgZHJtX3h4eF9lcnIgd291bGQgYmUgdG8ga2VlcCB0aGUgY3VycmVudAo+ID4gZHJtLmRlYnVn
PTB4MWYgZmlsdGVyaW5nIG9uIHRoZSBjb21tYW5kLWxpbmUuCj4gPiBJIGRvIG5vdCB0aGluayB3
ZSBjYW4gZG8gdGhpcyB3aXRoIHRoZSBzdGFuZGFyZCBsb2dnaW5nLgo+IAo+IENvcnJlY3QuIEkn
ZCBsb3ZlIHRoZSBiZW5lZml0cyBvZiBkeW5hbWljIGRlYnVnLCBidXQgdGhlcmUncyBubyBzdXBw
b3J0Cj4gZm9yIHRoZSBraW5kIG9mIG1lc3NhZ2UgY2F0ZWdvcmllcyB0aGF0IHdlIGRvIHdpdGgg
ZHJtLmRlYnVnLgo+IAo+IEkndmUgY29udGVtcGxhdGVkIHN3aXRjaGluZyBpOTE1IG92ZXIgdG8g
dXNpbmcgdGhlIHZhcmlhbnRzIHdoZXJlIHlvdQo+IHBhc3MgdGhlIGRldmljZSwgYnV0IEkgcmVh
bGx5IHJlYWxseSBkb24ndCBsaWtlIHRoZSBpZGVhIG9mOgo+IAo+IC0gCURSTV9ERUJVR19LTVMo
ImhlbGxvXG4iKTsKPiArIAlEUk1fREVWX0RFQlVHX0tNUyhpOTE1LT5kcm0uZGV2LCAiaGVsbG9c
biIpOwo+IAo+IFdoZXJlIGk5MTUgaXMgb3VyIHByaXZhdGUgd3JhcHBlciBmb3IgZHJtX2Rldmlj
ZS4gSSB0aGluayBpdCdzIGp1c3QgdG9vCj4gbXVjaCB1Z2x5IHVwcGVyY2FzZSBib2lsZXJwbGF0
ZSwgYW5kIGEgbGFyZ2UgcG9ydGlvbiBvZiB0aGUgZGVidWdzIHdvdWxkCj4gaGF2ZSB0byBzcGFu
IGF0IGxlYXN0IGFuIGV4dHJhIGxpbmUgYWZ0ZXIgdGhhdC4KPiAKPiBJJ2QgYWxzbyB2ZXJ5IG11
Y2ggcHJlZmVyIHBhc3NpbmcganVzdCBzdHJ1Y3QgKmRybV9kZXZpY2UgaW5zdGVhZCBvZgo+IHN0
cnVjdCAqZGV2aWNlLiBJbiB0aGF0LCBJIHRoaW5rIHRoZSBuZWVkcyBvZiB0aGUgZmV3IGhhdmUg
cHJldmFpbGVkCj4gb3ZlciB0aGUgbmVlZHMgb2YgdGhlIG1hbnkuIEknZCBkZWZpbml0ZWx5IHBy
ZWZlciBkcm1fZXJyKGNvbnN0IHN0cnVjdAo+IGRybV9kZXZpY2UgKmRybSwgLi4uKSBhbmQgZnJp
ZW5kcyBvdmVyIHRoZSBjdXJyZW50IG9uZXMuCgpUaGlzIGlzIGZyb20gbXkgbm90ZXM6CgoiCmRy
bV9lcnIoY29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRybSwgLi4uKQpkcm1faW5mbyhjb25zdCBz
dHJ1Y3QgZHJtX2RldmljZSAqZHJtLCAuLi4pCgpkcm1fa21zX2Vycihjb25zdCBzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtLCAuLi4pCmRybV9rbXNfaW5mbyhjb25zdCBzdHJ1Y3QgZHJtX2RldmljZSAq
ZHJtLCAuLi4pKQoKZXRjLgoKVGhlbiB3ZSBjb3VsZCBmaXNoIG91dCByZWxldmFudCBpbmZvIGZy
b20gdGhlIGRybSBkZXZpY2UgYW5kIHByZXNlbnQKdGhpcyBuaWNlbHkuCgpGb3IgdGhlIGNhc2Vz
IHdoZXJlIG5vIGRybV9kZXZpY2UgaXMgYXZhaWxhYmxlIHRoZSBmYWxsYmFjayBpczoKZHJtX2Rl
dl9lcnIoY29uc3Qgc3RydWN0IGRybV9kZXZpY2UgKmRybSwgLi4uKQpkcm1fZGV2X2luZm8oY29u
c3Qgc3RydWN0IGRybV9kZXZpY2UgKmRybSwgLi4uKSkKCldlIGNvdWxkIG1vZGlmeSB0aGUgZXhp
c3RpbmcgVVBQRVJDQVNFIG1hY3JvcyB0byBiZSBwbGFjZWhvbGRlcnMgZm9yCnRoZSBtb3JlIHJl
YWRlciBmcmllbmRseSBsb3dlciBjYXNlcyB2YXJpYW50cy4KIgoKU28gd2Ugc2VlbXMgdG8gYmUg
YWxpZ25lZCBoZXJlLgpJbiBvdGhlciB3b3JkcyAtIGlmIHlvdSB0aHJvdyB0aW1lIGFmdGVyIHRo
aXMgdGhlbiB0cnkgdG8gYWRkCnRoZSBuZXcgbG9nZ2luZyB2YXJpYW50cyB0byBkcm1fcHJpbnQu
aCBmb3IgdGhlIGJlbmVmaXQgb2YgYWxsLgpUaGUgd2UgY2FuIG1heWJlIGxhdGVyIGRvIHNvbWUg
bWFzcyBjb252ZXJzaW9uIGlmIHdlIHdhbnQgdG8gZ2V0IHJpZApvZiBzb21lIG9mIHRoZSBvbGRl
ciBsb2dnaW5nIHN5c3RlbXMuCgpJIGhhdmUgbm90IHlldCBmb3VuZCB0aW1lL2VuZXJneSB0byB0
aHJvdyBhZnRlciB0aGlzIG15c2VsZi4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
