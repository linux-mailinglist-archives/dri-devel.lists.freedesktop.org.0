Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D36B255529
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 18:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8298907B;
	Tue, 25 Jun 2019 16:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0134.hostedemail.com
 [216.40.44.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3080D8907B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:52:27 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 4C3435000;
 Tue, 25 Jun 2019 16:52:26 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::,
 RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2693:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3870:3871:3872:3873:4321:5007:8527:8545:8660:8879:10004:10400:10848:11232:11658:11914:12043:12297:12555:12679:12740:12760:12895:13069:13148:13230:13311:13357:13439:14096:14097:14659:14721:21080:21627:30054:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:25,
 LUA_SUMMARY:none
X-HE-Tag: tramp21_4f3996ed0ab50
X-Filterd-Recvd-Size: 2131
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com
 [23.242.196.136]) (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Tue, 25 Jun 2019 16:52:24 +0000 (UTC)
Message-ID: <2bdbbd7909c5c4ad96d32c0c5be4690292132a34.camel@perches.com>
Subject: Re: [PATCH] video: fbdev: s3c-fb: Mark expected switch fall-throughs
From: Joe Perches <joe@perches.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Jingoo Han
 <jingoohan1@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Date: Tue, 25 Jun 2019 09:52:23 -0700
In-Reply-To: <20190625160103.GA13133@embeddedor>
References: <20190625160103.GA13133@embeddedor>
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

T24gVHVlLCAyMDE5LTA2LTI1IGF0IDExOjAxIC0wNTAwLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdy
b3RlOgo+IEluIHByZXBhcmF0aW9uIHRvIGVuYWJsaW5nIC1XaW1wbGljaXQtZmFsbHRocm91Z2gs
IG1hcmsgc3dpdGNoCj4gY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91
Z2guCltdCj4gVGhpcyBwYXRjaCBpcyBwYXJ0IG9mIHRoZSBvbmdvaW5nIGVmZm9ydHMgdG8gZW5h
YmxlCj4gLVdpbXBsaWNpdC1mYWxsdGhyb3VnaC4KCkp1c3QgZW5hYmxlIHRoZSB0aGluZyBhbHJl
YWR5LgoKSWYgeW91IHN0b3BwZWQgdHJ5aW5nIHRvIGRvIGl0IGFsbCB5b3Vyc2VsZiwgb3RoZXJz
CndpbGwgaGVscCByZXNvbHZlIGFueSBuZXcgYnVpbGQgd2FybmluZ3MuCgpGb3IgaW5zdGFuY2U6
IGEgYnVpbGQgb2YgLW5leHQgeDg2LzY0IGRlZmNvbmZpZyBoYXMgMi4gIG5iZC4KLS0tCiBNYWtl
ZmlsZSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEv
TWFrZWZpbGUgYi9NYWtlZmlsZQppbmRleCA1MTAyYjJiYmQyMjQuLmRmOTA5ZmZkZmNkYiAxMDA2
NDQKLS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAgLTY5MCw2ICs2OTAsNyBAQCBlbmRp
ZiAjIG1heS1zeW5jLWNvbmZpZwogZW5kaWYgIyAkKGRvdC1jb25maWcpCiAKIEtCVUlMRF9DRkxB
R1MJKz0gJChjYWxsIGNjLW9wdGlvbiwtZm5vLWRlbGV0ZS1udWxsLXBvaW50ZXItY2hlY2tzLCkK
K0tCVUlMRF9DRkxBR1MJKz0gJChjYWxsIGNjLW9wdGlvbiwgLVdpbXBsaWNpdC1mYWxsdGhyb3Vn
aCkKIEtCVUlMRF9DRkxBR1MJKz0gJChjYWxsIGNjLWRpc2FibGUtd2FybmluZyxmcmFtZS1hZGRy
ZXNzLCkKIEtCVUlMRF9DRkxBR1MJKz0gJChjYWxsIGNjLWRpc2FibGUtd2FybmluZywgZm9ybWF0
LXRydW5jYXRpb24pCiBLQlVJTERfQ0ZMQUdTCSs9ICQoY2FsbCBjYy1kaXNhYmxlLXdhcm5pbmcs
IGZvcm1hdC1vdmVyZmxvdykKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
