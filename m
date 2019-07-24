Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF25734DA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 19:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935576E5F9;
	Wed, 24 Jul 2019 17:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0051.hostedemail.com
 [216.40.44.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0F26E5F9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 17:16:26 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 034D818224D9C;
 Wed, 24 Jul 2019 17:16:25 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::::::,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1714:1730:1747:1777:1792:2198:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3350:3622:3867:4321:5007:6642:10004:10400:10848:11026:11232:11473:11657:11658:11914:12043:12296:12297:12438:12555:12740:12760:12895:12986:13069:13311:13357:13439:14096:14097:14181:14659:14721:21080:21451:21627:30054:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:28,
 LUA_SUMMARY:none
X-HE-Tag: brick72_54e3a62085009
X-Filterd-Recvd-Size: 1951
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Wed, 24 Jul 2019 17:16:23 +0000 (UTC)
Message-ID: <2a0c5ef5c7e20b190156908991e4c964a501d80a.camel@perches.com>
Subject: Re: [PATCH 03/12] drm: aspeed_gfx: Fix misuse of GENMASK macro
From: Joe Perches <joe@perches.com>
To: Andrew Morton <akpm@linux-foundation.org>, Joel Stanley
 <joel@jms.id.au>,  Andrew Jeffery <andrew@aj.id.au>
Date: Wed, 24 Jul 2019 10:16:22 -0700
In-Reply-To: <cddd7ad7e9f81dec1e86c106f04229d21fc21920.1562734889.git.joe@perches.com>
References: <cover.1562734889.git.joe@perches.com>
 <cddd7ad7e9f81dec1e86c106f04229d21fc21920.1562734889.git.joe@perches.com>
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
Cc: linux-aspeed@lists.ozlabs.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA3LTA5IGF0IDIyOjA0IC0wNzAwLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBB
cmd1bWVudHMgYXJlIHN1cHBvc2VkIHRvIGJlIG9yZGVyZWQgaGlnaCB0aGVuIGxvdy4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vYXNwZWVkL2FzcGVlZF9nZnguaCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hc3BlZWQvYXNwZWVkX2dmeC5oIGIvZHJpdmVycy9ncHUvZHJtL2FzcGVlZC9hc3Bl
ZWRfZ2Z4LmgKPiBpbmRleCBhMTAzNThiYjYxZWMuLjA5NWVhMDNlNTgzMyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYXNwZWVkL2FzcGVlZF9nZnguaAo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hc3BlZWQvYXNwZWVkX2dmeC5oCj4gQEAgLTc0LDcgKzc0LDcgQEAgaW50IGFzcGVlZF9n
ZnhfY3JlYXRlX291dHB1dChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKTsKPiAgLyogQ1RSTDIgKi8K
PiAgI2RlZmluZSBDUlRfQ1RSTF9EQUNfRU4JCQlCSVQoMCkKPiAgI2RlZmluZSBDUlRfQ1RSTF9W
QkxBTktfTElORSh4KQkJKCgoeCkgPDwgMjApICYgQ1JUX0NUUkxfVkJMQU5LX0xJTkVfTUFTSykK
PiAtI2RlZmluZSBDUlRfQ1RSTF9WQkxBTktfTElORV9NQVNLCUdFTk1BU0soMjAsIDMxKQo+ICsj
ZGVmaW5lIENSVF9DVFJMX1ZCTEFOS19MSU5FX01BU0sJR0VOTUFTSygzMSwgMjApCgpwaW5nPwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
