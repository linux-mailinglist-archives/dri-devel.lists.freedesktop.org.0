Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAB3649FC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 17:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39BE6E10C;
	Wed, 10 Jul 2019 15:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0164.hostedemail.com
 [216.40.44.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4F96E10E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:46:11 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id C502F1802912E;
 Wed, 10 Jul 2019 15:46:09 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2692:2731:2828:2917:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4250:4321:5007:6691:6742:7875:7904:10004:10400:10848:11026:11232:11473:11658:11914:12296:12297:12740:12760:12895:13069:13311:13357:13439:14096:14097:14659:21080:21220:21326:21451:21627:30012:30034:30054:30056:30090:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:25,
 LUA_SUMMARY:none
X-HE-Tag: range96_50d7d845d712e
X-Filterd-Recvd-Size: 3121
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Wed, 10 Jul 2019 15:45:54 +0000 (UTC)
Message-ID: <b9c3b83c9be50286062ae8cefd5d38e2baa0fb22.camel@perches.com>
Subject: Re: [PATCH 00/12] treewide: Fix GENMASK misuses
From: Joe Perches <joe@perches.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Johannes Berg
 <johannes@sipsolutions.net>
Date: Wed, 10 Jul 2019 08:45:53 -0700
In-Reply-To: <20190710094337.wf2lftxzfjq2etro@shell.armlinux.org.uk>
References: <cover.1562734889.git.joe@perches.com>
 <5fa1fa6998332642c49e2d5209193ffe2713f333.camel@sipsolutions.net>
 <20190710094337.wf2lftxzfjq2etro@shell.armlinux.org.uk>
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
Cc: devel@driverdev.osuosl.org, linux-mmc@vger.kernel.org,
 alsa-devel@alsa-project.org, Benjamin Fair <benjaminfair@google.com>,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Nancy Yuen <yuenn@google.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA3LTEwIGF0IDEwOjQzICswMTAwLCBSdXNzZWxsIEtpbmcgLSBBUk0gTGlu
dXggYWRtaW4gd3JvdGU6Cj4gT24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMTE6MTc6MzFBTSArMDIw
MCwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPiA+IE9uIFR1ZSwgMjAxOS0wNy0wOSBhdCAyMjowNCAt
MDcwMCwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gPiA+IFRoZXNlIEdFTk1BU0sgdXNlcyBhcmUgaW52
ZXJ0ZWQgYXJndW1lbnQgb3JkZXIgYW5kIHRoZQo+ID4gPiBhY3R1YWwgbWFza3MgcHJvZHVjZWQg
YXJlIGluY29ycmVjdC4gIEZpeCB0aGVtLgo+ID4gPiAKPiA+ID4gQWRkIGNoZWNrcGF0Y2ggdGVz
dHMgdG8gaGVscCBhdm9pZCBtb3JlIG1pc3VzZXMgdG9vLgo+ID4gPiAKPiA+ID4gSm9lIFBlcmNo
ZXMgKDEyKToKPiA+ID4gICBjaGVja3BhdGNoOiBBZGQgR0VOTUFTSyB0ZXN0cwo+ID4gCj4gPiBJ
TUhPIHRoaXMgZG9lc24ndCBtYWtlIGEgbG90IG9mIHNlbnNlIGFzIGEgY2hlY2twYXRjaCB0ZXN0
IC0ganVzdCB0aHJvdwo+ID4gaW4gYSBCVUlMRF9CVUdfT04oKT8KCkkgdHJpZWQgdGhhdC4KCkl0
J2QgY2FuJ3QgYmUgZG9uZSBhcyBpdCdzIHVzZWQgaW4gZGVjbGFyYXRpb25zCmFuZCBpbmNsdWRl
ZCBpbiBhc20gZmlsZXMgYW5kIGl0IHVzZXMgdGhlIFVMKCkKbWFjcm8uCgpJIGFsc28gdHJpZWQg
anVzdCBtYWtpbmcgaXQgZG8gdGhlIHJpZ2h0IHRoaW5nCndoYXRldmVyIHRoZSBhcmd1bWVudCBv
cmRlci4KCk9oIHdlbGwuCgo+IE15IHBlcnNvbmFsIHRha2Ugb24gdGhpcyBpcyB0aGF0IEdFTk1B
U0soKSBpcyByZWFsbHkgbm90IHVzZWZ1bCwgaXQncwo+IGp1c3QgcHVyZSBvYmZ1c2NhdGlvbiBh
bmQgbGVhZHMgdG8gZXhhY3RseSB0aGVzZSBraW5kcyBvZiBtaXN0YWtlcy4KPiAKPiBZZXMsIEkg
ZnVsbHkgdW5kZXJzdGFuZCB0aGUgYXJndW1lbnQgdGhhdCB5b3UgY2FuIGp1c3Qgc3BlY2lmeSB0
aGUKPiBzdGFydCBhbmQgZW5kIGJpdHMsIGFuZCBpdCBfaW4gdGhlb3J5XyBtYWtlcyB0aGUgY29k
ZSBtb3JlIHJlYWRhYmxlLgo+IAo+IEhvd2V2ZXIsIHRoZSBwcm9ibGVtIGlzIHdoZW4gd3JpdGlu
ZyBjb2RlLiAgR0VOTUFTSyhhLCBiKS4gIElzIGEgdGhlCj4gc3RhcnRpbmcgYml0IG9yIGVuZGlu
ZyBiaXQ/ICBJcyBiIHRoZSBudW1iZXIgb2YgYml0cz8gIEl0J3MgY29uZnVzaW5nCj4gYW5kIGNh
dXNlcyBtaXN0YWtlcyByZXN1bHRpbmcgaW4gaW5jb3JyZWN0IGNvZGUuICBBIEJVSUxEX0JVR19P
TigpCj4gY2FuIGNhdGNoIHNvbWUgb2YgdGhlIGNhc2VzLCBidXQgbm90IGFsbCBvZiB0aGVtLgoK
SXQncyBhIGhvcnJpZCBsaXR0bGUgbWFjcm8gYW5kIEkgYWdyZWUgd2l0aCBSdXNzZWxsLgoKSSBh
bHNvIHRoaW5rIGlmIGl0IGV4aXN0ZWQgYXQgYWxsIGl0IHNob3VsZCBoYXZlIGJlZW4KR0VOTUFT
Syhsb3csIGhpZ2gpIG5vdCBHRU5NQVNLKGhpZ2gsIGxvdykuCgpJCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
