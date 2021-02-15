Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4818031C062
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 18:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF6889895;
	Mon, 15 Feb 2021 17:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74086E329
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 17:22:41 +0000 (UTC)
IronPort-SDR: kt3CAvIbqOD6EQhiavnqXUPFPRv5mpum/KeeSF3WfSpvT5HdByGiC51oSB+y8K1xrh8s3rpPXt
 O6mKndUvyaDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162479364"
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; d="scan'208";a="162479364"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 09:22:41 -0800
IronPort-SDR: xefnQJpzJ5DrCRisWmrD7Ac76UF3NqQhUSqIibI+Hqxl0EtDmoiGjuNP5Gw0b8QHVoBMltecHQ
 PbcSzLnZCenA==
X-IronPort-AV: E=Sophos;i="5.81,181,1610438400"; d="scan'208";a="438637738"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 09:22:37 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id D590F20518;
 Mon, 15 Feb 2021 19:22:35 +0200 (EET)
Date: Mon, 15 Feb 2021 19:22:35 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v7 2/3] v4l: ioctl: Use %p4cc printk modifier to print
 FourCC codes
Message-ID: <20210215172235.GK3@paasikivi.fi.intel.com>
References: <20210215114030.11862-1-sakari.ailus@linux.intel.com>
 <20210215114030.11862-3-sakari.ailus@linux.intel.com>
 <YCqnu61J2Q8rsrZa@alley> <20210215180545.7178e180@coco.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210215180545.7178e180@coco.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Petr Mladek <pmladek@suse.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 15, 2021 at 06:05:45PM +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 15 Feb 2021 17:56:27 +0100
> Petr Mladek <pmladek@suse.com> escreveu:
> 
> > On Mon 2021-02-15 13:40:29, Sakari Ailus wrote:
> > > Now that we can print FourCC codes directly using printk, make use of the
> > > feature in V4L2 core.
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>  
> > 
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > 
> > I am curious whether I could take this via printk tree or if Mauro
> > would prefer to take this via his tree.
> 
> IMO, the best would be if the entire series gets merged via a single
> tree.
> 
> Feel free to merge via the printk one.
> 
> Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks, Mauro!

-- 
Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
