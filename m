Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACDE347A80
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 15:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717F36EA0A;
	Wed, 24 Mar 2021 14:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0127.hostedemail.com
 [216.40.44.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55F96EA0A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 14:20:29 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id E3CBF8406;
 Wed, 24 Mar 2021 14:20:27 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:152:355:379:599:800:960:973:982:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1801:2393:2553:2559:2562:2689:2901:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4321:4605:5007:6119:6742:7522:7576:7652:7903:10004:10400:11026:11232:11473:11657:11658:11783:11914:12043:12048:12295:12296:12297:12438:12740:12895:13069:13311:13357:13894:14181:14659:14721:21080:21433:21451:21627:21660:21939:21966:30034:30054:30070:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: mist41_450a56a2777b
X-Filterd-Recvd-Size: 3203
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Wed, 24 Mar 2021 14:20:25 +0000 (UTC)
Message-ID: <e1310273dcc577f3a772380ada7b6cc1906d680b.camel@perches.com>
Subject: Re: [PATCH] [v2] drm/imx: imx-ldb: fix out of bounds array access
 warning
From: Joe Perches <joe@perches.com>
To: Arnd Bergmann <arnd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 24 Mar 2021 07:20:23 -0700
In-Reply-To: <20210324121832.3714570-1-arnd@kernel.org>
References: <20210324121832.3714570-1-arnd@kernel.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
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
Cc: Arnd Bergmann <arnd@arndb.de>, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTAzLTI0IGF0IDEzOjE3ICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+
IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gCj4gV2hlbiBDT05GSUdfT0Yg
aXMgZGlzYWJsZWQsIGJ1aWxkaW5nIHdpdGggJ21ha2UgVz0xJyBwcm9kdWNlcyB3YXJuaW5ncwo+
IGFib3V0IG91dCBvZiBib3VuZHMgYXJyYXkgYWNjZXNzOgo+IAo+IGRyaXZlcnMvZ3B1L2RybS9p
bXgvaW14LWxkYi5jOiBJbiBmdW5jdGlvbiAnaW14X2xkYl9zZXRfY2xvY2suY29uc3Rwcm9wJzoK
PiBkcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYzoxODY6ODogZXJyb3I6IGFycmF5IHN1YnNj
cmlwdCAtMjIgaXMgYmVsb3cgYXJyYXkgYm91bmRzIG9mICdzdHJ1Y3QgY2xrICpbNF0nIFstV2Vy
cm9yPWFycmF5LWJvdW5kc10KPiAKPiBBZGQgYW4gZXJyb3IgY2hlY2sgYmVmb3JlIHRoZSBpbmRl
eCBpcyB1c2VkLCB3aGljaCBoZWxwcyB3aXRoIHRoZQo+IHdhcm5pbmcsIGFzIHdlbGwgYXMgYW55
IHBvc3NpYmxlIG90aGVyIGVycm9yIGNvbmRpdGlvbiB0aGF0IG1heSBiZQo+IHRyaWdnZXJlZCBh
dCBydW50aW1lLgo+IAo+IFRoZSB3YXJuaW5nIGNvdWxkIGJlIGZpeGVkIGJ5IGFkZGluZyBhIEtj
b25maWcgZGVwZWRlbmN5IG9uIENPTkZJR19PRiwKPiBidXQgTGl1IFlpbmcgcG9pbnRzIG91dCB0
aGF0IHRoZSBkcml2ZXIgbWF5IGhpdCB0aGUgb3V0LW9mLWJvdW5kcwo+IHByb2JsZW0gYXQgcnVu
dGltZSBhbnl3YXkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4KPiAtLS0KPiB2MjogZml4IHN1YmplY3QgbGluZQo+IMKgwqDCoMKgZXhwYW5kIHBhdGNo
IGRlc2NyaXB0aW9uCj4gwqDCoMKgwqBwcmludCBtdXggbnVtYmVyCj4gwqDCoMKgwqBjaGVjayB1
cHBlciBib3VuZCBhcyB3ZWxsCltdCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbXgv
aW14LWxkYi5jIGIvZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtbGRiLmMKW10KPiBAQCAtMTk3LDYg
KzE5NywxMiBAQCBzdGF0aWMgdm9pZCBpbXhfbGRiX2VuY29kZXJfZW5hYmxlKHN0cnVjdCBkcm1f
ZW5jb2RlciAqZW5jb2RlcikKPiDCoAlpbnQgZHVhbCA9IGxkYi0+bGRiX2N0cmwgJiBMREJfU1BM
SVRfTU9ERV9FTjsKPiDCoAlpbnQgbXV4ID0gZHJtX29mX2VuY29kZXJfYWN0aXZlX3BvcnRfaWQo
aW14X2xkYl9jaC0+Y2hpbGQsIGVuY29kZXIpOwo+IAo+ICsJaWYgKG11eCA8IDAgfHwgbXV4ID49
IEFSUkFZX1NJWkUobGRiLT5jbGtfc2VsKSkgewo+ICsJCWRldl93YXJuKGxkYi0+ZGV2LCAiJXM6
IGludmFsaWQgbXV4ICVkXG4iLAo+ICsJCQkgX19mdW5jX18sIEVSUl9QVFIobXV4KSk7CgpUaGlz
IGRvZXMgbm90IGNvbXBpbGUgd2l0aG91dCB3YXJuaW5ncy4KCmRyaXZlcnMvZ3B1L2RybS9pbXgv
aW14LWxkYi5jOiBJbiBmdW5jdGlvbiDigJhpbXhfbGRiX2VuY29kZXJfZW5hYmxl4oCZOgpkcml2
ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYzoyMDE6MjI6IHdhcm5pbmc6IGZvcm1hdCDigJglZOKA
mSBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUg4oCYaW504oCZLCBidXQgYXJndW1lbnQgNCBoYXMg
dHlwZSDigJh2b2lkICrigJkgWy1XZm9ybWF0PV0KICAyMDEgfCAgIGRldl93YXJuKGxkYi0+ZGV2
LCAiJXM6IGludmFsaWQgbXV4ICVkXG4iLAogICAgICB8ICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KCklmIHlvdSB3YW50IHRvIHVzZSBFUlJfUFRSLCB0aGUgJWQg
c2hvdWxkIGJlICVwZSBhcyBFUlJfUFRSCmlzIGNvbnZlcnRpbmcgYW4gaW50IGEgdm9pZCAqIHRv
IGRlY29kZSB0aGUgZXJyb3IgdHlwZSBhbmQKZW1pdCBpdCBhcyBhIHN0cmluZy4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
