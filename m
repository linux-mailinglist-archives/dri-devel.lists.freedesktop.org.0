Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE72B97F1B1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 22:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1449E10E489;
	Mon, 23 Sep 2024 20:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZdOCfnLT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C9610E489
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 20:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727123208; x=1758659208;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=diFYIrVYUjXjF+5MnI8hisPee6mEeIVLiIQVHwB3h5k=;
 b=ZdOCfnLTHFH4jRuBvgckQIfrJT2MGPLcEK9sMQWIXwtMQOsLnsZYMr3N
 qf6yoZb6447IWD8a5s8CQXpsaT3IZO0JAUl+1tiB1P+WOYQuO5OwPiSLY
 IYwzz7jliMaE+tEx1NhblRG8NdaNZg4ydZ9xwsBK68Thl23L6ij6bQx8K
 zVonsbb991roBgHOUe9tEQGxPqfumsoh+6OkjXeMJBbx2IXG6gD1BCtKU
 sjU8+FsyxAe+yzsluQXwnnWJLDblRJEo/ryVHH4ZZhJ8zdkdzVYdTnJxj
 vFypDVsot/o0y+BM9O1eqXv/udOP2b4xlH5hqKNGRorNAWzVgTwwEJC3n A==;
X-CSE-ConnectionGUID: zQiBD0s2TS25lEqSH8u4AQ==
X-CSE-MsgGUID: 3fLza52yQIOSTQ1DDdAAeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="37228659"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="37228659"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 13:26:48 -0700
X-CSE-ConnectionGUID: 3Zzwn6WYSVWgYT5hnxTZvA==
X-CSE-MsgGUID: ZJk5wLqAQ6Wdyu7QkPUgtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71320966"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 13:26:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Sep 2024 23:26:44 +0300
Date: Mon, 23 Sep 2024 23:26:44 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/6] fbcon: fbcon_cursor_noblink -> fbcon_cursor_blink
Message-ID: <ZvHPBGPqFznIxV1R@intel.com>
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-4-ville.syrjala@linux.intel.com>
 <89c4a5c6-d83d-4b7e-9a92-99e382e6061d@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89c4a5c6-d83d-4b7e-9a92-99e382e6061d@gmx.de>
X-Patchwork-Hint: comment
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 23, 2024 at 09:46:03PM +0200, Helge Deller wrote:
> On 9/23/24 17:57, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Invert fbcon_cursor_noblink into fbcon_cursor_blink so that:
> > - it matches the sysfs attribute exactly
> > - avoids having to do these NOT operations all over the place
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >   drivers/video/fbdev/core/fbcon.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > index bbe332572ca7..eb30aa872371 100644
> > --- a/drivers/video/fbdev/core/fbcon.c
> > +++ b/drivers/video/fbdev/core/fbcon.c
> > @@ -166,7 +166,7 @@ static const struct consw fb_con;
> >
> >   #define advance_row(p, delta) (unsigned short *)((unsigned long)(p) + (delta) * vc->vc_size_row)
> >
> > -static int fbcon_cursor_noblink;
> > +static int fbcon_cursor_blink;
> 
> Shouldn't it default then to value 1, e.g.
> +static int fbcon_cursor_blink = 1;

Indeed, good catch. Thanks. 

Had to double check that my udev rule still actually works
and it wasn't just caused by this fumble. Fortunately it
still seems effective. Phew.

> 
> Looks good otherwise.
> 
> Helge
> 
> >
> >   #define divides(a, b)	((!(a) || (b)%(a)) ? 0 : 1)
> >
> > @@ -399,7 +399,7 @@ static void fbcon_add_cursor_work(struct fb_info *info)
> >   {
> >   	struct fbcon_ops *ops = info->fbcon_par;
> >
> > -	if (!fbcon_cursor_noblink)
> > +	if (fbcon_cursor_blink)
> >   		queue_delayed_work(system_power_efficient_wq, &ops->cursor_work,
> >   				   ops->cur_blink_jiffies);
> >   }
> > @@ -3214,7 +3214,7 @@ static ssize_t rotate_show(struct device *device,
> >   static ssize_t cursor_blink_show(struct device *device,
> >   				 struct device_attribute *attr, char *buf)
> >   {
> > -	return sysfs_emit(buf, "%d\n", !fbcon_cursor_noblink);
> > +	return sysfs_emit(buf, "%d\n", fbcon_cursor_blink);
> >   }
> >
> >   static ssize_t cursor_blink_store(struct device *device,
> > @@ -3230,7 +3230,7 @@ static ssize_t cursor_blink_store(struct device *device,
> >   	console_lock();
> >   	idx = con2fb_map[fg_console];
> >
> > -	fbcon_cursor_noblink = !blink;
> > +	fbcon_cursor_blink = blink;
> >
> >   	if (idx == -1 || fbcon_registered_fb[idx] == NULL)
> >   		goto err;

-- 
Ville Syrjälä
Intel
