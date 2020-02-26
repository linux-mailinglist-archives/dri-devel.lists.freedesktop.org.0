Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 558C916F535
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 02:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19F86E060;
	Wed, 26 Feb 2020 01:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116E36E060
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 01:44:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99B1A43F;
 Wed, 26 Feb 2020 02:44:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582681469;
 bh=68iI9YFyw7yzGzx24yLYLDqREd9wos0WYpOdexIXGo0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ma+dwGI9lvQa6NClYAq3NSKC51mqSu7tscXHA1PTzdPPCR1GuvgYtsjuabwetyf1u
 QBjAasS/vEvcF98gaI1mIjwJH9Fy4YYG05sRqb2PzjAvS1yc5ot87s3SrPXu+uZx9X
 Qrcpc7lh3ERCXgyRS8AoQlM8H8tTRmkVi7Xv81DU=
Date: Wed, 26 Feb 2020 03:44:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3] drm: shmobile: Reduce include dependencies
Message-ID: <20200226014406.GY4764@pendragon.ideasonboard.com>
References: <20200206111232.75309-1-andriy.shevchenko@linux.intel.com>
 <20200224090430.GT10400@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224090430.GT10400@smile.fi.intel.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

Thank you for the patch, and sorry for the delay.

On Mon, Feb 24, 2020 at 11:04:30AM +0200, Andy Shevchenko wrote:
> On Thu, Feb 06, 2020 at 01:12:32PM +0200, Andy Shevchenko wrote:
> > This file doesn't need everything provided by <linux/kernel.h>.

s/everything/anything/

> > All it needs are some types, which are provided by <drm/drm_mode.h>.
> > 
> > Drop unneeded <linux/kernel.h> completely.
> 
> Any comments on this?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Feel free to push :-)

> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > v3: Drop header completely (Laurent)
> >  include/linux/platform_data/shmob_drm.h | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/include/linux/platform_data/shmob_drm.h b/include/linux/platform_data/shmob_drm.h
> > index fe815d7d9f58..d661399b217d 100644
> > --- a/include/linux/platform_data/shmob_drm.h
> > +++ b/include/linux/platform_data/shmob_drm.h
> > @@ -10,8 +10,6 @@
> >  #ifndef __SHMOB_DRM_H__
> >  #define __SHMOB_DRM_H__
> >  
> > -#include <linux/kernel.h>
> > -
> >  #include <drm/drm_mode.h>
> >  
> >  enum shmob_drm_clk_source {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
