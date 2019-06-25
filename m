Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 251DC5560D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 19:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588286E190;
	Tue, 25 Jun 2019 17:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0052.hostedemail.com
 [216.40.44.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DA56E190
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 17:37:58 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 9D02718224D97;
 Tue, 25 Jun 2019 17:37:57 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::,
 RULES_HIT:41:355:379:421:599:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2691:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4250:4321:5007:7808:7903:8527:8879:10004:10400:10848:11232:11658:11914:12050:12297:12663:12740:12760:12895:13069:13161:13229:13311:13357:13439:14096:14097:14659:21080:21433:21451:21627:30012:30054:30070:30083:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:26,
 LUA_SUMMARY:none
X-HE-Tag: tent74_2823a894be11f
X-Filterd-Recvd-Size: 2858
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Tue, 25 Jun 2019 17:37:55 +0000 (UTC)
Message-ID: <360e2cd7578450d1a24729bf4483d0e762c21dc5.camel@perches.com>
Subject: Re: [PATCH] video: fbdev: s3c-fb: Mark expected switch fall-throughs
From: Joe Perches <joe@perches.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Jingoo Han
 <jingoohan1@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Date: Tue, 25 Jun 2019 10:37:54 -0700
In-Reply-To: <3e40f8c1-9699-2723-4e70-9e91ff256257@embeddedor.com>
References: <20190625160103.GA13133@embeddedor>
 <2bdbbd7909c5c4ad96d32c0c5be4690292132a34.camel@perches.com>
 <3e40f8c1-9699-2723-4e70-9e91ff256257@embeddedor.com>
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
Cc: linux-fbdev@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>,
 Kees Cook <keescook@chromium.org>, linux-kbuild <linux-kbuild@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA2LTI1IGF0IDEyOjA2IC0wNTAwLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdy
b3RlOgo+IAo+IE9uIDYvMjUvMTkgMTE6NTIgQU0sIEpvZSBQZXJjaGVzIHdyb3RlOgo+ID4gT24g
VHVlLCAyMDE5LTA2LTI1IGF0IDExOjAxIC0wNTAwLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3Rl
Ogo+ID4gPiBJbiBwcmVwYXJhdGlvbiB0byBlbmFibGluZyAtV2ltcGxpY2l0LWZhbGx0aHJvdWdo
LCBtYXJrIHN3aXRjaAo+ID4gPiBjYXNlcyB3aGVyZSB3ZSBhcmUgZXhwZWN0aW5nIHRvIGZhbGwg
dGhyb3VnaC4KPiA+IFtdCj4gPiA+IFRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBl
ZmZvcnRzIHRvIGVuYWJsZQo+ID4gPiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLgo+ID4gCj4gPiBK
dXN0IGVuYWJsZSB0aGUgdGhpbmcgYWxyZWFkeS4KPiA+IAo+ID4gSWYgeW91IHN0b3BwZWQgdHJ5
aW5nIHRvIGRvIGl0IGFsbCB5b3Vyc2VsZiwgb3RoZXJzCj4gCj4gV2hhdCBhcmUgeW91IHRhbGtp
bmcgYWJvdXQ/Cj4gCj4gQW55b25lIGNhbiBlbmFibGUgaXQsIEknbSBhZGRpbmcgdGhpcyB0byBl
dmVyeSBjb21taXQ6Cj4gCj4gV2FybmluZyBsZXZlbCAzIHdhcyB1c2VkOiAtV2ltcGxpY2l0LWZh
bGx0aHJvdWdoPTMKCk5vIG9uZSBkb2VzIHRoYXQgYnkgZGVmYXVsdCBhbmQgYWxtb3N0IG5vIG9u
ZQppcyBoZWxwaW5nIGVsaW1pbmF0ZSB0aGVzZS4gIE5vdCBldmVuIG9uIHRoCgpBbG1vc3Qgbm8g
b25lIHVzZXMgbWFrZSBXPTxsZXZlbHM+IGVpdGhlciBhcyBpdCdzCmdlbmVyYWxseSBleHRyZW1l
bHkgbm9pc3kgYW5kIGNhbiBlbWl0IGEgbG90IG9mCmZhbHNlIHBvc2l0aXZlcy4KCj4gQW5kIEkn
bGwgc2VuZCBhIFBSIHdpdGggYSBwcm9wZXIgcGF0Y2ggZm9yIHRoZSBNYWtlZmlsZQo+IGR1cmlu
ZyB0aGUgbmV4dCBtZXJnZSB3aW5kb3cuCgpUaGF0J3MgZ3JlYXQuCgo+IElmIGhhZCB0aGUgcG93
ZXIgSSB3b3VsZCBoYXZlIGVuYWJsZWQgdGhpcyBvcHRpb24gc2luY2UgZGF5IDEsCj4gc28gZXZl
cnkgZGV2ZWxvcGVyIGNhbiB0YWtlIGNhcmUgb2YgdGhlaXIgb3duIGNvZGUuCgpZb3UgaGF2ZSBh
bHdheXMgaGFkIHRoZSBwb3dlciB0byBzZW5kIGEgcGF0Y2guCgpZb3UgYWxzbyBzZWVtIHRvIGJl
bGlldmUgdGhlIGJ1aWxkIG5lZWRzIHRvIGJlCmNvbXBsZXRlbHkgY2xlYW4gYmVmb3JlIGVuYWJs
aW5nIHRoZSBzd2l0Y2guCgpJIGRvbid0LgoKPiBMYXRlbHksIHlvdSBhcmUgbm90IGJlaW5nIG9m
IG11Y2ggaGVscCwgSm9lLgoKPHNtaWxlPiBXaGF0IGtpbmQgb2YgaGVscCBhcmUgeW91IGV4cGVj
dGluZz8KCkknbSBub3Qgc3VibWl0dGluZyBwYXRjaGVzIGFkZGluZyBmYWxsdGhvdWdoIGNvbW1l
bnRzCmFzIEkgdGhpbmsgdGhhdCdzIG5vdCBhIGdvb2QgZm9ybS4gIEkndmUgc2FpZCBzbwpyZXBl
YXRlZGx5LgoKSSBiZWxpZXZlIEkgc3VnZ2VzdGVkIG1vbnRocyBhZ28geW91IGRlZmF1bHQgZW5h
YmxlCnRoZSBjb21waWxlciBzd2l0Y2guCgpTbyBpdCdzIHVwIHRvIHlvdSB0byBlaXRoZXIgZG8g
aXQgb3Igbm90LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
