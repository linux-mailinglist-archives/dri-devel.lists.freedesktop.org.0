Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A78241B9832
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 09:18:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8324489C2C;
	Mon, 27 Apr 2020 07:18:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0142.hostedemail.com
 [216.40.44.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D81189C2C;
 Mon, 27 Apr 2020 07:18:21 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 95AAE181D3025;
 Mon, 27 Apr 2020 07:18:20 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:69:355:379:599:960:982:988:989:1260:1277:1311:1313:1314:1345:1359:1381:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3871:3872:4321:5007:6737:10004:10400:10848:11232:11658:11914:12048:12297:12679:12740:12760:12895:13018:13019:13069:13161:13229:13311:13357:13439:14096:14097:14659:21080:21433:21627:21990:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: curve16_82cecc1d91724
X-Filterd-Recvd-Size: 1839
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Mon, 27 Apr 2020 07:18:18 +0000 (UTC)
Message-ID: <cfc8fd0fbef54262f7cf714726b7b7cafc8c567e.camel@perches.com>
Subject: Re: [PATCH] drm/amd/display: remove conversion to bool in dcn20_mpc.c
From: Joe Perches <joe@perches.com>
To: Jason Yan <yanaijie@huawei.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com,  alexander.deucher@amd.com, christian.koenig@amd.com,
 David1.Zhou@amd.com,  airlied@linux.ie, daniel@ffwll.ch,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Mon, 27 Apr 2020 00:18:17 -0700
In-Reply-To: <20200427063715.21255-1-yanaijie@huawei.com>
References: <20200427063715.21255-1-yanaijie@huawei.com>
User-Agent: Evolution 3.36.1-2 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-04-27 at 14:37 +0800, Jason Yan wrote:
> The '==' expression itself is bool, no need to convert it to bool again.

trivia:

These descriptions are not quite correct.
The operators return an int, either 0 or 1.

-----------------
6.5.8 Relational operators

6 Each of the operators < (less than), > (greater than), <= (less than or equal to), and >=
(greater than or equal to) shall yield 1 if the specified relation is true and 0 if it is false. 90)
The result has type int

6.5.9 Equality operators

3 The == (equal to) and != (not equal to) operators are analogous to the relational
operators except for their lower precedence. 91) Each of the operators yields 1 if the
specified relation is true and 0 if it is false. The result has type int. For any pair of
operands, exactly one of the relations is true.
-----------------




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
