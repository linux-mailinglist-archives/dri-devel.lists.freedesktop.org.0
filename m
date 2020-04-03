Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265AD19E1AB
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 01:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EC56ECC5;
	Fri,  3 Apr 2020 23:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0032.hostedemail.com
 [216.40.44.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABDD6ECC5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 23:57:26 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 874B2837F24C;
 Fri,  3 Apr 2020 23:57:23 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1537:1566:1593:1594:1711:1714:1730:1747:1777:1792:2110:2393:2559:2562:2828:2918:3138:3139:3140:3141:3142:3622:3865:3866:3867:3870:3871:3873:4321:5007:6120:6742:7901:10004:10400:10450:10455:10848:11232:11658:11914:12297:12740:12760:12895:13069:13071:13311:13357:13439:14180:14659:19904:19999:21060:21080:21324:21611:21627:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: book21_232a483c7e13a
X-Filterd-Recvd-Size: 1743
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Fri,  3 Apr 2020 23:57:21 +0000 (UTC)
Message-ID: <cabfb02bf36b50463ebfe850ba642025ebeb88b2.camel@perches.com>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
From: Joe Perches <joe@perches.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Fri, 03 Apr 2020 16:55:24 -0700
In-Reply-To: <20200403233647.GA4394@kekkonen.localdomain>
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
 <20200403102449.GB4882@pendragon.ideasonboard.com>
 <20200403104701.GC3172@kekkonen.localdomain>
 <e44e41317719727ea12aee4ff1e210dea796dd2f.camel@perches.com>
 <20200403233647.GA4394@kekkonen.localdomain>
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
Cc: Petr Mladek <pmladek@suse.com>, mchehab@kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2020-04-04 at 02:36 +0300, Sakari Ailus wrote:
> Hi Joe,

Hi Sakari.

> How would these be different in functionality? fmt[2] won't be accessed if
> fmt[1] is not 'c' (including '\0'), just like on the line above. I find the
> original easier to read.

Oops. You are right of course.

cheers, Joe

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
