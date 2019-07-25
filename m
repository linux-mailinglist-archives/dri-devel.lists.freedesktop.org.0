Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB79742D2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 03:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A63F6E5D5;
	Thu, 25 Jul 2019 01:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0170.hostedemail.com
 [216.40.44.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68B586E5D5
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 01:18:22 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 5FF5818026238;
 Thu, 25 Jul 2019 01:18:21 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::::::,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2828:2911:3138:3139:3140:3141:3142:3352:3622:3867:3872:4321:4425:5007:10004:10400:10848:11026:11232:11473:11657:11658:11914:12043:12296:12297:12438:12555:12740:12760:12895:12986:13069:13161:13229:13311:13357:13439:14096:14097:14181:14659:14721:21080:21451:21611:21627:30054:30090:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:26,
 LUA_SUMMARY:none
X-HE-Tag: rain11_48b2601630360
X-Filterd-Recvd-Size: 2496
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Thu, 25 Jul 2019 01:18:19 +0000 (UTC)
Message-ID: <4e5bc8d61436024a30a8fb6a1516e29e23a75ede.camel@perches.com>
Subject: Re: [PATCH 03/12] drm: aspeed_gfx: Fix misuse of GENMASK macro
From: Joe Perches <joe@perches.com>
To: Andrew Jeffery <andrew@aj.id.au>, Andrew Morton
 <akpm@linux-foundation.org>,  Joel Stanley <joel@jms.id.au>
Date: Wed, 24 Jul 2019 18:18:18 -0700
In-Reply-To: <4f6709f8-381f-415c-8569-798b074b66c5@www.fastmail.com>
References: <cover.1562734889.git.joe@perches.com>
 <cddd7ad7e9f81dec1e86c106f04229d21fc21920.1562734889.git.joe@perches.com>
 <2a0c5ef5c7e20b190156908991e4c964a501d80a.camel@perches.com>
 <4f6709f8-381f-415c-8569-798b074b66c5@www.fastmail.com>
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

T24gVGh1LCAyMDE5LTA3LTI1IGF0IDEwOjQwICswOTMwLCBBbmRyZXcgSmVmZmVyeSB3cm90ZToK
PiAKPiBPbiBUaHUsIDI1IEp1bCAyMDE5LCBhdCAwMjo0NiwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4g
PiBPbiBUdWUsIDIwMTktMDctMDkgYXQgMjI6MDQgLTA3MDAsIEpvZSBQZXJjaGVzIHdyb3RlOgo+
ID4gPiBBcmd1bWVudHMgYXJlIHN1cHBvc2VkIHRvIGJlIG9yZGVyZWQgaGlnaCB0aGVuIGxvdy4K
PiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvZSBQZXJjaGVzIDxqb2VAcGVyY2hlcy5jb20+
Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2FzcGVlZC9hc3BlZWRfZ2Z4LmggfCAy
ICstCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiA+ID4gCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXNwZWVkL2FzcGVlZF9n
ZnguaCBiL2RyaXZlcnMvZ3B1L2RybS9hc3BlZWQvYXNwZWVkX2dmeC5oCj4gPiA+IGluZGV4IGEx
MDM1OGJiNjFlYy4uMDk1ZWEwM2U1ODMzIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXNwZWVkL2FzcGVlZF9nZnguaAo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXNwZWVk
L2FzcGVlZF9nZnguaAo+ID4gPiBAQCAtNzQsNyArNzQsNyBAQCBpbnQgYXNwZWVkX2dmeF9jcmVh
dGVfb3V0cHV0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pOwo+ID4gPiAgLyogQ1RSTDIgKi8KPiA+
ID4gICNkZWZpbmUgQ1JUX0NUUkxfREFDX0VOCQkJQklUKDApCj4gPiA+ICAjZGVmaW5lIENSVF9D
VFJMX1ZCTEFOS19MSU5FKHgpCQkoKCh4KSA8PCAyMCkgJiBDUlRfQ1RSTF9WQkxBTktfTElORV9N
QVNLKQo+ID4gPiAtI2RlZmluZSBDUlRfQ1RSTF9WQkxBTktfTElORV9NQVNLCUdFTk1BU0soMjAs
IDMxKQo+ID4gPiArI2RlZmluZSBDUlRfQ1RSTF9WQkxBTktfTElORV9NQVNLCUdFTk1BU0soMzEs
IDIwKQo+IAo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSmVmZmVyeSA8YW5kcmV3QGFqLmlkLmF1PgoK
VGhpcyBoYXJkbHkgbmVlZHMgYSByZXZpZXcsIGl0IG5lZWRzIHRvIGJlIGFwcGxpZWQuClRoZXJl
J3MgYSBub21pbmFsIGdpdCB0cmVlIGZvciBhc3BlZWQgaGVyZToKClQ6CWdpdCBnaXQ6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvam9lbC9hc3BlZWQuZ2l0CgpCdXQg
d2hvJ3MgZ29pbmcgdG8gZG8gYXBwbHkgdGhpcz8KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
