Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1F34A8FF1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 22:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465EF10EC94;
	Thu,  3 Feb 2022 21:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6BE10EAF2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 21:31:04 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id ba1c05f4-8538-11ec-ac19-0050568cd888;
 Thu, 03 Feb 2022 21:32:02 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id BB2CE194B78;
 Thu,  3 Feb 2022 22:31:02 +0100 (CET)
Date: Thu, 3 Feb 2022 22:31:00 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 10/21] fb: Delete fb_info->queue
Message-ID: <YfxJlH2NDnLk/GUw@ravnborg.org>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-11-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131210552.482606-11-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 10:05:41PM +0100, Daniel Vetter wrote:
> It was only used by fbcon, and that now switched to its own,
> private work.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
I would merge this with the patch that drops the usage

> ---
>  include/linux/fb.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index 02f362c661c8..a8a00d2ba1f3 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -449,7 +449,6 @@ struct fb_info {
>  	struct fb_var_screeninfo var;	/* Current var */
>  	struct fb_fix_screeninfo fix;	/* Current fix */
>  	struct fb_monspecs monspecs;	/* Current Monitor specs */
> -	struct work_struct queue;	/* Framebuffer event queue */
>  	struct fb_pixmap pixmap;	/* Image hardware mapper */
>  	struct fb_pixmap sprite;	/* Cursor hardware mapper */
>  	struct fb_cmap cmap;		/* Current cmap */
> -- 
> 2.33.0
