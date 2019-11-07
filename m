Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C85F2B87
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 10:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC72D6F3EE;
	Thu,  7 Nov 2019 09:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0174.hostedemail.com
 [216.40.44.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441806F3EE
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 09:54:38 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id F0F76182CED34;
 Thu,  7 Nov 2019 09:54:36 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 13, 1.2, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::,
 RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1381:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3653:3865:3866:3870:3871:3872:3873:3874:4321:5007:6119:6691:7903:10008:10400:10848:11026:11232:11473:11657:11658:11914:12043:12048:12049:12296:12297:12438:12740:12760:12895:13019:13069:13095:13161:13229:13311:13357:13439:14659:14721:21080:21433:21627:30029:30054:30091,
 0,
 RBL:47.151.135.224:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:1:0, LFtime:25,
 LUA_SUMMARY:none
X-HE-Tag: ring31_45311ab5a8d41
X-Filterd-Recvd-Size: 1775
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf20.hostedemail.com (Postfix) with ESMTPA;
 Thu,  7 Nov 2019 09:54:35 +0000 (UTC)
Message-ID: <4c74db2614cefe23f888d0643c2d7c356086745a.camel@perches.com>
Subject: Re: [PATCH] drm/rockchip: use DRM_DEV_ERROR for log output
From: Joe Perches <joe@perches.com>
To: Wambui Karuga <wambui.karugax@gmail.com>, hjc@rock-chips.com, 
 heiko@sntech.de, airlied@linux.ie, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 07 Nov 2019 01:54:22 -0800
In-Reply-To: <20191107092945.15513-1-wambui.karugax@gmail.com>
References: <20191107092945.15513-1-wambui.karugax@gmail.com>
User-Agent: Evolution 3.34.1-2 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTExLTA3IGF0IDEyOjI5ICswMzAwLCBXYW1idWkgS2FydWdhIHdyb3RlOgo+
IFJlcGxhY2UgdGhlIHVzZSBvZiB0aGUgZGV2X2VyciBtYWNybyB3aXRoIHRoZSBEUk1fREVWX0VS
Uk9SCj4gRFJNIGhlbHBlciBtYWNyby4KClRoZSBjb21taXQgbWVzc2FnZSBzaG91bGQgc2hvdyB0
aGUgcmVhc29uIF93aHlfIHlvdSBhcmUgZG9pbmcKdGhpcyBpbnN0ZWFkIG9mIGp1c3Qgc3RhdGlu
ZyB0aGF0IHlvdSBhcmUgZG9pbmcgdGhpcy4KCkl0J3Mgbm90IHRoYXQgZGV2X2VyciBpcyB1bmNv
bW1vbiBpbiBkcml2ZXJzL2dwdS9kcm0uCgokIGdpdCBncmVwIC13IGRldl9lcnIgZHJpdmVycy9n
cHUvZHJtIHwgd2MgLWwKMTk1MAokIGdpdCBncmVwIC13IERSTV9ERVZfRVJST1IgZHJpdmVycy9n
cHUvZHJtIHwgd2MgLWwKNzU2Cgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvZHctbWlwaS1kc2ktcm9ja2NoaXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9kdy1t
aXBpLWRzaS1yb2NrY2hpcC5jCltdCj4gQEAgLTkxNiw3ICs5MTYsNyBAQCBzdGF0aWMgaW50IGR3
X21pcGlfZHNpX3JvY2tjaGlwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
IAl9Cj4gIAo+ICAJaWYgKCFkc2ktPmNkYXRhKSB7Cj4gLQkJZGV2X2VycihkZXYsICJubyBkc2kt
Y29uZmlnIGZvciAlcyBub2RlXG4iLCBucC0+bmFtZSk7Cj4gKwkJRFJNX0RFVl9FUlJPUihkZXYs
ICJubyBkc2ktY29uZmlnIGZvciAlcyBub2RlXG4iLCBucC0+bmFtZSk7Cj4gIAkJcmV0dXJuIC1F
SU5WQUw7Cj4gIAl9CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
