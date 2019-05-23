Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7839E28B78
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 22:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36D76E063;
	Thu, 23 May 2019 20:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 464 seconds by postgrey-1.36 at gabe;
 Thu, 23 May 2019 20:27:03 UTC
Received: from smtprelay.hostedemail.com (smtprelay0068.hostedemail.com
 [216.40.44.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914E26E063
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 20:27:03 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave05.hostedemail.com (Postfix) with ESMTP id DCFB118022D0E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 20:19:19 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id A74F8182CED28;
 Thu, 23 May 2019 20:19:18 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::,
 RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3868:3871:4250:4321:5007:6117:6119:7903:10004:10400:10848:11026:11232:11473:11657:11658:11914:12043:12048:12679:12740:12760:12895:13069:13311:13357:13439:14659:14721:21080:21433:21451:21627:30029:30054:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:28,
 LUA_SUMMARY:none
X-HE-Tag: lock32_6e24366692258
X-Filterd-Recvd-Size: 2246
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Thu, 23 May 2019 20:19:16 +0000 (UTC)
Message-ID: <f1fa87acecc7cb5329d28d42f7327742aceb04db.camel@perches.com>
Subject: Re: [PATCHv6 1/4] drm/omap: use DRM_DEBUG_DRIVER instead of CORE
From: Joe Perches <joe@perches.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>, Sebastian Reichel
 <sre@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Tony Lindgren
 <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Date: Thu, 23 May 2019 13:19:15 -0700
In-Reply-To: <20190523200756.25314-2-sebastian.reichel@collabora.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
 <20190523200756.25314-2-sebastian.reichel@collabora.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
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
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, linux-omap@vger.kernel.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA1LTIzIGF0IDIyOjA3ICswMjAwLCBTZWJhc3RpYW4gUmVpY2hlbCB3cm90
ZToKPiBUaGlzIG1hY3JvIGlzIG9ubHkgdXNlZCBieSBvbWFwZHJtLCB3aGljaCBzaG91bGQgcHJp
bnQKPiBkZWJ1ZyBtZXNzYWdlcyB1c2luZyB0aGUgRFJJVkVSIGNhdGVnb3J5IGluc3RlYWQgb2Yg
dGhlCj4gZGVmYXVsdCBDT1JFIGNhdGVnb3J5LgpbXQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9vbWFwX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9k
cnYuaApbXQo+IEBAIC0zNyw4ICszNyw4IEBACj4gICNpbmNsdWRlICJvbWFwX2lycS5oIgo+ICAj
aW5jbHVkZSAib21hcF9wbGFuZS5oIgo+ICAKPiAtI2RlZmluZSBEQkcoZm10LCAuLi4pIERSTV9E
RUJVRyhmbXQiXG4iLCAjI19fVkFfQVJHU19fKQo+IC0jZGVmaW5lIFZFUkIoZm10LCAuLi4pIGlm
ICgwKSBEUk1fREVCVUcoZm10LCAjI19fVkFfQVJHU19fKSAvKiB2ZXJib3NlIGRlYnVnICovCj4g
KyNkZWZpbmUgREJHKGZtdCwgLi4uKSBEUk1fREVCVUdfRFJJVkVSKGZtdCJcbiIsICMjX19WQV9B
UkdTX18pCj4gKyNkZWZpbmUgVkVSQihmbXQsIC4uLikgaWYgKDApIERSTV9ERUJVR19EUklWRVIo
Zm10LCAjI19fVkFfQVJHU19fKSAvKiB2ZXJib3NlIGRlYnVnICovCgpUcml2aWE6CgpTdHJpY3Rs
eSwgdGhpcyBzaG91bGQgdXNlIGRvIHsgaWYgKDApIGV0Yy4uLiB9IHdoaWxlICgwKQoKQWxzbywg
bm9uZSBvZiB0aGUgVkVSQiB1c2VzIGhhdmUgYSB0ZXJtaW5hdGluZyBuZXdsaW5lCnNvIGlkZWFs
bHksIHRoaXMgc2hvdWxkIGJlOgoKI2RlZmluZSBWRVJCKGZtdCwgLi4uKSBkbyB7IGlmICgwKSBE
Uk1fREVCVUdfRFJJVkVSKGZtdCAiXG4iLCAjI19fVkFfQVJHU19fKTsgfSB3aGlsZSAoMCkgLyog
dmVyYm9zZSBkZWJ1ZyAqLwoKQW5kIFZFUkIgaXNuJ3QgYSBwYXJ0aWN1bGFybHkgaW50ZWxsaWdp
YmxlIG1hY3JvIG5hbWUuCk1heWJlIFZEQkcgaW5zdGVhZC4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
