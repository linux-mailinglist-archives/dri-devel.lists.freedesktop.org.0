Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA3B31C00F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 18:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3113A6E321;
	Mon, 15 Feb 2021 17:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658B76E321
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 17:05:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51DC961493;
 Mon, 15 Feb 2021 17:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613408751;
 bh=qlDEjTny/wih/sMMQqRl+8DVcQluidusnPRkNYSDRK0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z+zD1bzotvDEc5rnwTtfxq3cpHiWjbnHJ1ikgNfgV7uzxHVq5/JhTLf6L/pGHCVqK
 RtttacCk4yzbTNBjpe4TxYQRwh1Lu5bNCeiZLPVQX0NRjT8FliRnnxq76hpqF/lsT4
 j85GWP0KYWrHYyJ9qhqQBDX1aYZY4U7ltdN6VfLlvamJGxHJg6ga/6tFodxcGlLh9F
 akb8jUyQ+q8UubxPudJCRCov2h/94HIkAsOwDahsjixOQ9VfgObkWgT3TCwX1knfGt
 vxRgDQym4qXq78NVzDcaW4k7FfGm7VEs73gQuO+4BWquWaUnbFrB5Wk+7vaQUMDimD
 rIqaIRBWp9QDQ==
Date: Mon, 15 Feb 2021 18:05:45 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v7 2/3] v4l: ioctl: Use %p4cc printk modifier to print
 FourCC codes
Message-ID: <20210215180545.7178e180@coco.lan>
In-Reply-To: <YCqnu61J2Q8rsrZa@alley>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-3-sakari.ailus@linux.intel.com>
 <YCqnu61J2Q8rsrZa@alley>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Mon, 15 Feb 2021 17:56:27 +0100
Petr Mladek <pmladek@suse.com> escreveu:

> On Mon 2021-02-15 13:40:29, Sakari Ailus wrote:
> > Now that we can print FourCC codes directly using printk, make use of the
> > feature in V4L2 core.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>  
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> 
> I am curious whether I could take this via printk tree or if Mauro
> would prefer to take this via his tree.

IMO, the best would be if the entire series gets merged via a single
tree.

Feel free to merge via the printk one.

Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> 
> Anyway, there will be v8 with small changes in the 1st patch.
> 
> Best Regards,
> Petr



Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
