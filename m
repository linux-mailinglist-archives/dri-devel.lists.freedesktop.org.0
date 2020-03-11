Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0A718247E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 23:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8832A8931D;
	Wed, 11 Mar 2020 22:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0007.hostedemail.com
 [216.40.44.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77758931D;
 Wed, 11 Mar 2020 22:11:09 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id F39FF181D330D;
 Wed, 11 Mar 2020 22:11:08 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1568:1593:1594:1711:1714:1730:1747:1777:1792:2393:2525:2566:2682:2685:2828:2859:2902:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3622:3865:3866:3867:3870:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4362:5007:9025:10004:10400:11232:11658:11914:12043:12297:12438:12555:12679:12740:12760:12895:12986:13069:13311:13357:13439:14181:14659:14721:21080:21433:21627:21740:21811:21939:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: loaf59_60ffb32fe5a07
X-Filterd-Recvd-Size: 1958
Received: from XPS-9350 (unknown [172.58.78.137])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Wed, 11 Mar 2020 22:11:06 +0000 (UTC)
Message-ID: <3fc2c61e4c1c25d847fd7f284c818b664b64441c.camel@perches.com>
Subject: Re: [PATCH -next 023/491] AMD KFD: Use fallthrough;
From: Joe Perches <joe@perches.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Date: Wed, 11 Mar 2020 15:09:22 -0700
In-Reply-To: <12c75b17-1d0e-6cc4-4ed1-a6f5003772ae@amd.com>
References: <cover.1583896344.git.joe@perches.com>
 <3cfc40c8f750abc672d6a60418fe220cb663a0f5.1583896349.git.joe@perches.com>
 <12c75b17-1d0e-6cc4-4ed1-a6f5003772ae@amd.com>
User-Agent: Evolution 3.34.1-2 
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2020-03-11 at 17:50 -0400, Felix Kuehling wrote:
> On 2020-03-11 12:51 a.m., Joe Perches wrote:
> > Convert the various uses of fallthrough comments to fallthrough;
> > 
> > Done via script
> > Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/
> 
> The link seems to be broken. This one works: 
> https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe@perches.com/

Thanks.

I neglected to use a backslash on the generating script.
In the script in 0/491,

Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe@perches.com/

likely should have been:

Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe\@perches.com/


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
