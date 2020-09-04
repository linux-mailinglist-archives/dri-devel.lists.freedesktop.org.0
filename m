Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBD225E353
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 23:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EF06ECE3;
	Fri,  4 Sep 2020 21:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0078.hostedemail.com
 [216.40.44.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758AC6ECDD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 21:34:05 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 75B528384365;
 Fri,  4 Sep 2020 21:34:04 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1537:1566:1593:1594:1711:1714:1730:1747:1777:1792:2393:2525:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3622:3865:3867:3868:3870:3871:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:7903:9025:10004:10400:10848:11232:11658:11914:12043:12048:12297:12555:12663:12679:12740:12760:12895:13069:13161:13229:13311:13357:13439:14181:14659:14721:21080:21627:21740:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: brain20_590dcfc270b5
X-Filterd-Recvd-Size: 1527
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Fri,  4 Sep 2020 21:34:02 +0000 (UTC)
Message-ID: <f5e9bd00f94d4058e7fa214b4219d3e1978e8b55.camel@perches.com>
Subject: Re: [PATCH 08/29] dma-buf: Avoid comma separated statements
From: Joe Perches <joe@perches.com>
To: kieran.bingham+renesas@ideasonboard.com, Jiri Kosina
 <trivial@kernel.org>,  Sumit Semwal <sumit.semwal@linaro.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
In-Reply-To: <e6035e4b-9d4e-3c23-c140-4e9d6822496b@ideasonboard.com>
References: <cover.1598331148.git.joe@perches.com>
 <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
 <e6035e4b-9d4e-3c23-c140-4e9d6822496b@ideasonboard.com>
Date: Fri, 04 Sep 2020 14:33:52 -0700
MIME-Version: 1.0
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2020-09-04 at 12:42 +0100, Kieran Bingham wrote:
> I'm pleased to see this is treewide ;-)
> Definitely prefer this.

These are only the comma uses in if/do/while blocks that
would also need braces as separate statements.

There a multiple dozens more just with single statements
terminated by commas and not semicolons.

See:  https://lore.kernel.org/patchwork/patch/1291033/


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
