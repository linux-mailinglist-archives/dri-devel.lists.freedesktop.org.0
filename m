Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DA7EB6BD
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 19:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4FB6E0C8;
	Thu, 31 Oct 2019 18:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0221.hostedemail.com
 [216.40.44.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CAD6E0C8
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 18:16:52 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 354811822563C;
 Thu, 31 Oct 2019 18:16:51 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::::::::::::::,
 RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1537:1561:1593:1594:1711:1714:1730:1747:1777:1792:2194:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3866:3867:3871:4321:5007:6742:7903:9108:10004:10400:11232:11658:11914:12297:12740:12760:12895:13069:13311:13357:13439:14659:21060:21080:21627:30054:30075:30091,
 0,
 RBL:47.151.135.224:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:162,
 LUA_SUMMARY:none
X-HE-Tag: sea16_75aca35dfcc57
X-Filterd-Recvd-Size: 1678
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf14.hostedemail.com (Postfix) with ESMTPA;
 Thu, 31 Oct 2019 18:16:48 +0000 (UTC)
Message-ID: <734ef2833e4e4e7bded92e9d964bc2415aadf3c4.camel@perches.com>
Subject: Re: [PATCH] fbdev: potential information leak in do_fb_ioctl()
From: Joe Perches <joe@perches.com>
To: Andrea Righi <andrea.righi@canonical.com>, "Eric W. Biederman"
 <ebiederm@xmission.com>
Date: Thu, 31 Oct 2019 11:16:39 -0700
In-Reply-To: <20191030201201.GA3209@xps-13>
References: <20191029182320.GA17569@mwanda>
 <87zhhjjryk.fsf@x220.int.ebiederm.org> <20191030074321.GD2656@xps-13>
 <87r22ujaqq.fsf@x220.int.ebiederm.org> <20191030201201.GA3209@xps-13>
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
Cc: linux-fbdev@vger.kernel.org, security@kernel.org,
 Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 kernel-janitors@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Julia Lawall <Julia.Lawall@lip6.fr>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Peter Rosin <peda@axentia.se>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTEwLTMwIGF0IDIxOjEyICswMTAwLCBBbmRyZWEgUmlnaGkgd3JvdGU6Cj4g
VGhlbiBtZW1zZXQoKSArIG1lbWNweSgpIGlzIHByb2JhYmx5IHRoZSBiZXN0IG9wdGlvbiwKPiBz
aW5jZSBjb3B5aW5nIGFsbCB0aG9zZSBmaWVsZHMgb25lIGJ5IG9uZSBsb29rcyBxdWl0ZSB1Z2x5
IHRvIG1lLi4uCgpBIG1lbXNldCBvZiBhbiBhdXRvbWF0aWMgYmVmb3JlIGEgbWVtY3B5IHRvIHRo
ZSBzYW1lCmF1dG9tYXRpYyBpcyB1bm5lY2Vzc2FyeS4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
