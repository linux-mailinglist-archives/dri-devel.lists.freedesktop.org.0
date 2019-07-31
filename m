Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B99747B9A1
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 08:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846676E67F;
	Wed, 31 Jul 2019 06:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0185.hostedemail.com
 [216.40.44.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D916E67F
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 06:26:36 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id D38943811;
 Wed, 31 Jul 2019 06:26:35 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::::,
 RULES_HIT:41:355:379:599:800:960:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2559:2563:2682:2685:2828:2859:2902:2904:2911:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3865:3867:3868:3870:3871:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:4425:4605:5007:6119:7514:7875:7903:9025:10004:10400:10848:11026:11232:11658:11914:12043:12296:12297:12438:12555:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21433:21451:21627:30054:30090:30091,
 0, RBL:error, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0,
 LFtime:25, LUA_SUMMARY:none
X-HE-Tag: error57_395f5308c0426
X-Filterd-Recvd-Size: 2802
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Wed, 31 Jul 2019 06:26:34 +0000 (UTC)
Message-ID: <29b3741ca8a9e94d64dba213059abb2296c30936.camel@perches.com>
Subject: Re: [PATCH v2] drm: use trace_printk rather than printk in drm_dbg.
From: Joe Perches <joe@perches.com>
To: Fuqian Huang <huangfq.daxian@gmail.com>
Date: Tue, 30 Jul 2019 23:26:32 -0700
In-Reply-To: <20190731062416.26238-1-huangfq.daxian@gmail.com>
References: <20190731062416.26238-1-huangfq.daxian@gmail.com>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA3LTMxIGF0IDE0OjI0ICswODAwLCBGdXFpYW4gSHVhbmcgd3JvdGU6Cj4g
SW4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2loLmMsCj4gYW1kZ3B1X2loX3By
b2Nlc3MgY2FsbHMgRFJNX0RFQlVHIHdoaWNoIGNhbGxzIGRybV9kYmcgYW5kCj4gZmluYWxseSBj
YWxscyBwcmludGsuCj4gQXMgYW1kZ3B1X2loX3Byb2Nlc3MgaXMgY2FsbGVkIGZyb20gYW4gaW50
ZXJydXB0IGhhbmRsZXIsCj4gYW5kIGludGVycnVwdCBoYW5kbGVyIHNob3VsZCBiZSBzaG9ydCBh
cyBwb3NzaWJsZS4KPiAKPiBBcyBwcmludGsgbWF5IGxlYWQgdG8gYm9nZ2luZyBkb3duIHRoZSBz
eXN0ZW0gb3IgY2FuIGV2ZW4KPiBjcmVhdGUgYSBsaXZlIGxvY2suIHByaW50ayBzaG91bGQgbm90
IGJlIHVzZWQgaW4gSVJRIGNvbnRleHQuCj4gSW5zdGVhZCwgdHJhY2VfcHJpbnRrIGlzIHJlY29t
bWVuZGVkIGluIElSUSBjb250ZXh0Lgo+IExpbms6IGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy8z
NjU4MzUKPiAKPiBSZXZpZXdlZC1ieTogSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4gCgpJ
IG1hZGUgYSBzdWdnZXN0aW9uLiAgSSBkaWQgbm90IHJldmlldyB0aGlzLgoKUGxlYXNlIGRvIG5v
dCBhZGQgc2lnbmF0dXJlcyBsaWtlIHRoaXMgaWYKbm90IHNwZWNpZmljYWxseSBnaXZlbiBieSBz
b21lb25lLgoKCj4gU2lnbmVkLW9mZi1ieTogRnVxaWFuIEh1YW5nIDxodWFuZ2ZxLmRheGlhbkBn
bWFpbC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAgIC0gT25seSBtYWtlIHRoZSBpbnRl
cnJ1cHQgdXNlcyB0aGUgdHJhY2VfcHJpbnRrIHRvIGF2b2lkCj4gICAgIGFsbCA0MDAwKyBkcm1f
ZGJnL0RSTV9ERUJVRyB1c2VzIGVtaXR0aW5nIGEgdHJhY2VfcHJpbnRrLgo+IAo+ICBkcml2ZXJz
L2dwdS9kcm0vZHJtX3ByaW50LmMgfCAxMCArKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fcHJpbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYwo+IGluZGV4
IGExN2M4YTE0ZGJhNC4uNzQ3ODM1ZDE2ZmE2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fcHJpbnQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYwo+IEBAIC0y
MzYsOSArMjM2LDEzIEBAIHZvaWQgZHJtX2RiZyh1bnNpZ25lZCBpbnQgY2F0ZWdvcnksIGNvbnN0
IGNoYXIgKmZvcm1hdCwgLi4uKQo+ICAJdmFmLmZtdCA9IGZvcm1hdDsKPiAgCXZhZi52YSA9ICZh
cmdzOwo+ICAKPiAtCXByaW50ayhLRVJOX0RFQlVHICJbIiBEUk1fTkFNRSAiOiVwc10gJXBWIiwK
PiAtCSAgICAgICBfX2J1aWx0aW5fcmV0dXJuX2FkZHJlc3MoMCksICZ2YWYpOwo+IC0KPiArCWlm
IChpbl9pbnRlcnJ1cHQoKSkgewo+ICsJCXRyYWNlX3ByaW50ayhLRVJOX0RFQlVHICJbIiBEUk1f
TkFNRSAiOiVwc10gJXBWIiwKPiArCQkgICAgICAgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDAp
LCAmdmFmKTsKPiArCX0gZWxzZSB7Cj4gKwkJcHJpbnRrKEtFUk5fREVCVUcgIlsiIERSTV9OQU1F
ICI6JXBzXSAlcFYiLAo+ICsJCSAgICAgICBfX2J1aWx0aW5fcmV0dXJuX2FkZHJlc3MoMCksICZ2
YWYpOwo+ICsJfQo+ICAJdmFfZW5kKGFyZ3MpOwo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZHJtX2Ri
Zyk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
