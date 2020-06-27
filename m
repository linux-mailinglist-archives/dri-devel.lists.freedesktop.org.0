Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE9420BECA
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 07:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA6D6E107;
	Sat, 27 Jun 2020 05:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0080.hostedemail.com
 [216.40.44.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B43B6E107
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 05:12:40 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id B8318180A7FE8;
 Sat, 27 Jun 2020 05:12:37 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1381:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:1801:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3868:3870:3872:3873:3874:4321:4605:5007:7903:7904:9149:10004:10400:10848:11026:11232:11658:11914:12043:12048:12297:12438:12555:12740:12760:12895:12986:13019:13069:13101:13311:13357:13439:14659:14721:21080:21627:30054:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: glue64_4900af226e5b
X-Filterd-Recvd-Size: 1995
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf20.hostedemail.com (Postfix) with ESMTPA;
 Sat, 27 Jun 2020 05:12:36 +0000 (UTC)
Message-ID: <82612d7cc05d1a8f178a71be25884ec8ac5ef6cc.camel@perches.com>
Subject: Re: [PATCH] fbtft-bus.c: Removing that prohibited space before ')'
From: Joe Perches <joe@perches.com>
To: B K Karthik <bkkarthik@pesu.pes.edu>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jan Sebastian =?ISO-8859-1?Q?G=F6tte?=
 <linux@jaseg.net>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Date: Fri, 26 Jun 2020 22:12:35 -0700
In-Reply-To: <20200627045150.ysqvd47o52f4a6rc@pesu-pes-edu>
References: <20200627045150.ysqvd47o52f4a6rc@pesu-pes-edu>
User-Agent: Evolution 3.36.2-0ubuntu1 
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

On Sat, 2020-06-27 at 00:51 -0400, B K Karthik wrote:
> fbtft-bus.c:
> 
> fixing ERROR: space prohibited before that close parenthesis ')' by removing that space and ',' in line 65 and 67.
[]
> diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
> index 63c65dd67b17..847cbfbbd766 100644
> --- a/drivers/staging/fbtft/fbtft-bus.c
> +++ b/drivers/staging/fbtft/fbtft-bus.c
> @@ -62,9 +62,9 @@ out:									      \
>  }                                                                             \
>  EXPORT_SYMBOL(func);
>  
> -define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
> +define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
>  define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
> -define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
> +define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)

Q: Did you compile the files modified by this patch
   before you submitted it?
A: No



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
