Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245D95564F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 19:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14ACD6E16D;
	Tue, 25 Jun 2019 17:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0140.hostedemail.com
 [216.40.44.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4073E6E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 17:49:06 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 368CB180A8142;
 Tue, 25 Jun 2019 17:49:04 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 ::::::::::::::::::,
 RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1730:1747:1777:1792:2110:2393:2553:2559:2562:2828:2902:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3870:3871:3872:3874:4321:5007:8879:10004:10400:10848:11232:11658:11914:12297:12740:12760:12895:13069:13311:13357:13439:14180:14659:21080:21627:30054:30062:30090:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:54,
 LUA_SUMMARY:none
X-HE-Tag: mask89_8921d5caef211
X-Filterd-Recvd-Size: 1887
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Tue, 25 Jun 2019 17:49:02 +0000 (UTC)
Message-ID: <9c0d4ed622d6b8e47e040d398f764d52a9ac396d.camel@perches.com>
Subject: Re: [PATCH] video: fbdev: s3c-fb: Mark expected switch fall-throughs
From: Joe Perches <joe@perches.com>
To: Kees Cook <keescook@chromium.ngsorg>
Date: Tue, 25 Jun 2019 10:49:01 -0700
In-Reply-To: <201906251029.08B862130@keescook>
References: <20190625160103.GA13133@embeddedor>
 <2bdbbd7909c5c4ad96d32c0c5be4690292132a34.camel@perches.com>
 <201906251029.08B862130@keescook>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA2LTI1IGF0IDEwOjMxIC0wNzAwLCBLZWVzIENvb2sgd3JvdGU6Cj4gT24g
VHVlLCBKdW4gMjUsIDIwMTkgYXQgMDk6NTI6MjNBTSAtMDcwMCwgSm9lIFBlcmNoZXMgd3JvdGU6
Cj4gPiBPbiBUdWUsIDIwMTktMDYtMjUgYXQgMTE6MDEgLTA1MDAsIEd1c3Rhdm8gQS4gUi4gU2ls
dmEgd3JvdGU6Cj4gPiA+IEluIHByZXBhcmF0aW9uIHRvIGVuYWJsaW5nIC1XaW1wbGljaXQtZmFs
bHRocm91Z2gsIG1hcmsgc3dpdGNoCj4gPiA+IGNhc2VzIHdoZXJlIHdlIGFyZSBleHBlY3Rpbmcg
dG8gZmFsbCB0aHJvdWdoLgo+ID4gW10KPiA+ID4gVGhpcyBwYXRjaCBpcyBwYXJ0IG9mIHRoZSBv
bmdvaW5nIGVmZm9ydHMgdG8gZW5hYmxlCj4gPiA+IC1XaW1wbGljaXQtZmFsbHRocm91Z2guCj4g
PiAKPiA+IEp1c3QgZW5hYmxlIHRoZSB0aGluZyBhbHJlYWR5Lgo+IAo+IExpbnVzIGhhcyBiZWVu
IHByZXR0eSBjbGVhciBhYm91dCBub3Qgd2FudGluZyB3YXJuaW5nIG9wdGlvbnMgZW5hYmxlZAo+
IHdpdGhvdXQgZmlyc3QgZml4aW5nIGFsbCB0aGUgY2FzZXMgaXQgd2FybnMgYWJvdXQgZmlyc3Qu
CgpIZXkgS2Vlcy4KCkkgZG9uJ3QgcmVjYWxsIHRoYXQgcGFydGljdWxhciB0aWRiaXQuICBHb3Qg
YSBsaW5rPyAgCgpjaGVlcnMsIEpvZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
