Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50159D1CC8E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 08:15:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D53810E590;
	Wed, 14 Jan 2026 07:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDlMLYJ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C3A10E590
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 07:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768374933; x=1799910933;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VA9a9AXvtKiBXo9K3S8LA7RsTwJ5v/VjkAbf2RrgN2w=;
 b=aDlMLYJ02+cDrlTuci2gorRfe4wzQzdRZ0aYdTPeRmYI6fK0owZUdrIo
 edkpyIsCEDL5L9cHlX/0X04KiB/4nN7MHyDOQUomwHJk3r9uxDWlDZbyH
 LvpfqXfbO5gdTNT5CGQQAlpYaJvA+ejHdNMt/uW2adQiSkzl3SSr/FGBN
 UP15WC5qK8cmiwNUXYtHVkE37yfRa45l/VqFdZvYILeEdPCKYBxyMczFJ
 /iD43Xm/NGiMK8MddXwzjoPi42TJ72GfLWq+k8pwVJbOwvtyV9sjuKHKJ
 X4G/kRq+tYOc0ZzJjGArgoo97in03LNkublTWEepx+SAvahIqBtz+NhPr A==;
X-CSE-ConnectionGUID: w+AN4vAWQBO4dwRD5igfqw==
X-CSE-MsgGUID: I60vuoqjQW2Qy3p8Tq4dZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69588478"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69588478"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 23:15:32 -0800
X-CSE-ConnectionGUID: BRCY7p9xTYmfuVsllxvXpQ==
X-CSE-MsgGUID: 6GpVhYH1TXubYBdtY+OV9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="209448783"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.83])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 23:15:30 -0800
Date: Wed, 14 Jan 2026 09:15:27 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6] staging: fbtft: Use fbdev logging helpers when
 FB_DEVICE is disabled
Message-ID: <aWdCj9FPfOaLNf8L@smile.fi.intel.com>
References: <20260113045909.336931-1-chintanlike@gmail.com>
 <2026011341-chomp-protegee-6be5@gregkh>
 <0a90bd0a-cb74-43a3-a50b-4c83bc086556@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a90bd0a-cb74-43a3-a50b-4c83bc086556@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Tue, Jan 13, 2026 at 08:47:54PM -0800, Chintan Patel wrote:
> On 1/12/26 22:16, Greg KH wrote:
> > On Mon, Jan 12, 2026 at 08:59:09PM -0800, Chintan Patel wrote:
> > > Replace direct accesses to info->dev with fb_dbg() and fb_info()
> > > helpers to avoid build failures when CONFIG_FB_DEVICE=n.
> > 
> > Why is there a fb_* specific logging helper?  dev_info() and dev_dbg()
> > should be used instead.
> 
> You’re correct that dev_dbg()/dev_info() are the standard logging APIs.
> 
> The reason I switched to fb_dbg()/fb_info() is not stylistic: direct
> dereferences of info->dev / fb_info->dev are invalid when
> CONFIG_FB_DEVICE=n, which causes compile-time errors.
> 
> fb_dbg() and fb_info() are framebuffer-specific helpers that handle
> this case correctly, allowing logging without touching info->dev.
> 
> > > Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
> > 
> > Is this really a bug?
> 
> The build failure occurs when CONFIG_FB_DEVICE=n, where direct
> dereferences of info->dev / fb_info->dev are not valid. This was reported by
> the kernel test robot.
> 
> That said, I’m fine dropping the Fixes tag if you don’t consider this a
> regression.

I believe the point Greg made is that: If it's a bug, state it more clearly in
the commit message. The summary of the above sounds to me like a good enough
justification to leave Fixes tag as is.

...

> Same reason: dereferencing info->dev is invalid when CONFIG_FB_DEVICE=n.
> fb_dbg() handles this correctly without needing info->dev.

Similar comment here, make it more clearly, e.g. by adding more details in the
commit message, like explaining that there is no such a field to access when it
goes under some circumstances.

...

> > > +	fb_info(fb_info,
> > > +		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
> > > +		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
> > > +		fb_info->fix.smem_len >> 10, text1,
> > > +		HZ / fb_info->fbdefio->delay, text2);
> > 
> > When drivers work properly, they are quiet.  Why is this needed at all
> > except as a debug message?
> 
> Agreed. The informational message during framebuffer registration is not
> necessary. I will either remove it entirely or convert it to a debug-only
> message.
> 
> I’ll rework the patch accordingly and resend.

If you go this direction, I would do it in two stages (first is a direct
fix for a compilation issue and second one is switching to dbg level, each
with the respective commit message), but I leave it up to you and Greg.

-- 
With Best Regards,
Andy Shevchenko


