Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1466C78623
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B11E89CD7;
	Mon, 29 Jul 2019 07:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4BA1A6ED18
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 10:43:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0E76344;
 Fri, 26 Jul 2019 03:43:03 -0700 (PDT)
Received: from [10.1.35.37] (Hgb10.cambridge.arm.com [10.1.35.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 803243F71A;
 Fri, 26 Jul 2019 03:43:02 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] drm/panfrost: Add support for GPU heap allocations
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20190725011003.30837-1-robh@kernel.org>
 <20190725011003.30837-7-robh@kernel.org>
 <ab9c3277-9e34-2712-975b-7c59b64e52d0@arm.com>
 <9eaf879c-bd7b-aded-e8f6-8efc2394fef5@arm.com> <20190725161344.GA2950@kevin>
 <482dc837-3ca8-dd93-bbc6-0eb97f3627e7@arm.com> <20190725174006.GA2876@kevin>
From: Steven Price <steven.price@arm.com>
Message-ID: <1c54bd6c-a594-614d-7de0-badb00269ea1@arm.com>
Date: Fri, 26 Jul 2019 11:43:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190725174006.GA2876@kevin>
Content-Language: en-GB
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <Robin.Murphy@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjUvMDcvMjAxOSAxODo0MCwgQWx5c3NhIFJvc2VuendlaWcgd3JvdGU6Cj4+IFNvcnJ5LCBJ
IHdhcyBiZWluZyBzbG9wcHkgYWdhaW4hWzFdIEkgbWVhbnQgQ1BVIG1tYXBwZWQuCj4gCj4gTm8g
d29ycmllcywganVzdCB3YW50ZWQgdG8gY2hlY2sgOikKPiAKPj4gQXBwYXJlbnRseSB0aGUgYmxv
YiBpbiBzb21lIGNhc2VzIGNyZWF0ZXMgYSBTQU1FX1ZBIEdST1dfT05fR1BGIGJ1ZmZlciAtCj4+
IHNpbmNlIFNBTUVfVkEgbWVhbnMgcGVybWFuZW50bHkgbWFwcGVkIG9uIHRoZSBDUFUgdGhpcyB0
cmFuc2xhdGVkIHRvCj4+IG1tYXBwaW5nIGEgSEVBUCBvYmplY3QuIFdoeSBpdCBkb2VzIHRoaXMg
SSd2ZSBubyBpZGVhLgo+IAo+IEknbSBub3Qgc3VyZSBJIGZvbGxvdy4gQ29uY2VwdHVhbGx5LCBp
ZiB5b3UncmUgcGVybWFuZW50bHkgbWFwcGVkLAo+IHRoZXJlJ3Mgbm90aGluZyB0byBncm93LCBy
aWdodD8gSXMgdGhlcmUgYSByZWFzb24gbm90IHRvIGp1c3QgZGlzYWJsZQo+IEhFQVAgaW4gdGhp
cyBjYXNlcywgaS5lLjoKPiAKPiAJaWYgKGZsYWdzICYgU0FNRV9WQSkKPiAJCWZsYWdzICY9IH5H
Uk9XX09OX0dQRjsKPiAKPiBJdCBtYXkgbm90IGJlIGZ1bGx5IG9wdGltYWwsIGJ1dCB0aGF0IHdh
eSB0aGUgbGVnYWN5IGNvZGUga2VlcHMgd29ya2luZwo+IGFuZCB1cHN0cmVhbSB1c2Vyc3BhY2Ug
aXNuJ3QgaGVsZCBiYWNrIDopCgpZZXMsIHRoYXQncyBteSBoYWNrIGF0IHRoZSBtb21lbnQgYW5k
IGl0IHdvcmtzLiBJdCBsb29rcyBsaWtlIHRoZSBkcml2ZXIgCm1pZ2h0IGJlIGFsbG9jYXRlZCBh
IGRlcHRoIG9yIHN0ZW5jaWwgYnVmZmVyIHdpdGhvdXQga25vd2luZyB3aGV0aGVyIGl0IAp3aWxs
IGJlIHVzZWQuIFRoZSBidWZmZXIgaXMgdGhlbiAiZ3Jvd24iIGlmIGl0IGlzIG5lZWRlZCBieSB0
aGUgR1BVLiBUaGUgCnByb2JsZW0gaXMgaXQgaXMgcG9zc2libGUgZm9yIHRoZSBhcHBsaWNhdGlv
biB0byBhY2Nlc3MgaXQgbGF0ZXIuCgo+PiBUaGUgbWFpbiB1c2UgaW4gdGhlIGJsb2IgZm9yCj4+
IHRoaXMgaXMgYmVpbmcgYWJsZSB0byBkdW1wIGJ1ZmZlcnMgd2hlbiBkZWJ1Z2dpbmcgKGkuZS4g
ZHVtcCBidWZmZXJzCj4+IGJlZm9yZS9hZnRlciBldmVyeSBHUFUgam9iKS4KPiAKPiBDb3VsZCB3
ZSBkaXNhYmxlIEhFQVAgc3VwcG9ydCBpbiB1c2Vyc3BhY2UgKG5vdCBzZXR0aW5nIHRoZSBmbGFn
cykgZm9yCj4gZGVidWcgYnVpbGRzIHRoYXQgbmVlZCB0byBkdW1wIGJ1ZmZlcnM/IEluIHByb2R1
Y3Rpb24gdGhlIGV4dHJhIG1lbW9yeQo+IHVzYWdlIG1hdHRlcnMsIGhlbmNlIHRoaXMgcGF0Y2gs
IGJ1dCBpbiBkZXYsIHRoZXJlJ3MgcGxlbnR5IG9mIG1lbW9yeSB0bwo+IHNwYXJlLgo+IAo+PiBJ
ZGVhbGx5IHlvdSBhbHNvIG5lZWQgYSB3YXkgb2YgcXVlcnlpbmcgd2hpY2ggcGFnZXMgaGF2ZSBi
ZWVuIGJhY2tlZAo+PiBieSBmYXVsdHMgKG11Y2ggZWFzaWVyIHdpdGgga2Jhc2Ugd2hlcmUgdGhh
dCdzIGFsd2F5cyBqdXN0IHRoZSBudW1iZXIKPj4gb2YgcGFnZXMpLgo+IAo+IElzIHRoZXJlIGEg
dXNlIGNhc2UgZm9yIHRoaXMgd2l0aCBvbmUgb2YgdGhlIHVzZXJsYW5kIEFQSXM/IChNYXliZQo+
IFZ1bGthbj8pCgpJJ20gbm90IGF3YXJlIG9mIE9wZW5HTChFUykgQVBJcyB0aGF0IGV4cG9zZSBm
dW5jdGlvbmFsaXR5IGxpa2UgdGhpcy4gCkJ1dCBlLmcuIGFsbG9jYXRpbmcgYSBidWZmZXIgYWhl
YWQgb2YgdGltZSBmb3IgZGVwdGgvc3RlbmNpbCAianVzdCBpbiAKY2FzZSIgd291bGQgbmVlZCBz
b21ldGhpbmcgbGlrZSB0aGlzIGJlY2F1c2UgeW91IG1heSBuZWVkIENQVSBhY2Nlc3MgdG8gaXQu
CgpWdWxrYW4gaGFzIHRoZSBjb25jZXB0IG9mICJzcGFyc2UiIGJpbmRpbmdzL3Jlc2lkZW5jeS4g
QXMgZmFyIGFzIEknbSAKYXdhcmUgdGhlcmUncyBubyByZXF1aXJlbWVudCB0aGF0IG1lbW9yeSBp
cyBhbGxvY2F0ZWQgb24gZGVtYW5kLCBidXQgYSAKcGFnZS1ieS1wYWdlIGFwcHJvYWNoIHRvIHBv
cHVsYXRpbmcgbWVtb3J5IGlzIGV4cGVjdGVkLiBUaGVyZSdzIHF1aXRlIGEgCmJpdCBvZiBjb21w
bGV4aXR5IGFuZCB0aGUgYWN0dWFsIHdheSB0aGlzIGlzIHJlcHJlc2VudGVkIG9uIHRoZSBHUFUg
CmRvZXNuJ3QgbmVjZXNzYXJpbHkgbWF0Y2ggdGhlIHVzZXIgdmlzaWJsZSBBUEkuIEFsc28gSSBi
ZWxpZXZlIGl0J3MgYW4gCm9wdGlvbmFsIGZlYXR1cmUuCgpQYW5mcm9zdCwgb2YgY291cnNlLCBk
b2Vzbid0IHlldCBoYXZlIGEgZ29vZCBtZWNoYW5pc20gZm9yIHN1cHBvcnRpbmcgCmFueXRoaW5n
IGxpa2UgU0FNRV9WQS4gTXkgaGFjayBzbyBmYXIgaXMgdG8ga2VlcCBhbGxvY2F0aW5nIEJPcyB1
bnRpbCBpdCAKaGFwcGVucyB0byBsYW5kIGF0IGFuIGFkZHJlc3MgY3VycmVudGx5IHVudXNlZCBp
biB1c2VyIHNwYWNlLgoKT3BlbkNMIGRvZXMgcmVxdWlyZSBzb21ldGhpbmcgbGlrZSBTQU1FX1ZB
ICgiU2hhcmVkIFZpcnR1YWwgTWVtb3J5IiBvciAKU1ZNKS4gVGhpcyBpcyBhcHBhcmVudGx5IHVz
ZWZ1bCBiZWNhdXNlIHRoZSBzYW1lIHBvaW50ZXIgY2FuIGJlIHVzZWQgb24gCmJvdGggQ1BVIGFu
ZCBHUFUuCgpJIGNhbiBzZWUgdHdvIGFwcHJvYWNoZXMgZm9yIGludGVncmF0aW5nIHRoYXQ6Cgoq
IFVzZSBITU06IENQVSBWQT09R1BVIFZBLiBUaGlzIG5pY2VseSBzb2x2ZXMgdGhlIHByb2JsZW0s
IGJ1dCBmYWxscyAKb3ZlciBiYWRseSB3aGVuIHRoZSBHUFUgVkEgc2l6ZSBpcyBzbWFsbGVyIHRo
YW4gdGhlIHVzZXIgc3BhY2UgVkEgc2l6ZSAtIAp3aGljaCBpcyBzYWRseSB0cnVlIG9uIG1hbnkg
NjQgYml0IGludGVncmF0aW9ucy4KCiogUHJvdmlkZSBhbiBhbGxvY2F0aW9uIGZsYWcgd2hpY2gg
Y2F1c2VzIHRoZSBrZXJuZWwgZHJpdmVyIHRvIG5vdCBwaWNrIAphIEdQVSBhZGRyZXNzIHVudGls
IHRoZSBidWZmZXIgaXMgbWFwcGVkIG9uIHRoZSBDUFUuIFRoZSBtbWFwIGNhbGxiYWNrIAp3b3Vs
ZCB0aGVuIG5lZWQgdG8gbG9vayBmb3IgYSByZWdpb24gdGhhdCBpcyBmcmVlIG9uIGJvdGggdGhl
IENQVSBhbmQgR1BVLgoKVGhlIHNlY29uZCBpcyBvYnZpb3VzbHkgbW9zdCBzaW1pbGFyIHRvIHRo
ZSBrYmFzZSBhcHByb2FjaC4ga2Jhc2UgCnNpbXBsaWZpZXMgdGhpbmdzIGJlY2F1c2UgdGhlIGtl
cm5lbCBkcml2ZXIgaGFzIHRoZSB1bHRpbWF0ZSBzYXkgb3ZlciAKd2hldGhlciB0aGUgYnVmZmVy
IGlzIFNBTUVfVkEgb3Igbm90LiBTbyBvbiA2NCBiaXQgdXNlciBzcGFjZSB3ZSB1cGdyYWRlIApl
dmVyeXRoaW5nIHRvIGJlIFNBTUVfVkEgLSB3aGljaCBtZWFucyB0aGUgR1BVIFZBIHNwYWNlIGp1
c3QgZm9sbG93cyB0aGUgCkNQVSBWQSAoc2ltaWxhciB0byBITU0pLgoKU3RldmUKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
