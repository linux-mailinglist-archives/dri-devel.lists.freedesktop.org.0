Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020ED28D019
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 16:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5496E8ED;
	Tue, 13 Oct 2020 14:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F306E8ED
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 14:20:44 +0000 (UTC)
IronPort-SDR: IYh2K/+I865AKbWGxgUhgYNh2KT3eAU5FJg47Zb6Gz9gNmx1RnS2es1CGwLtnRD4hq2OThDF2b
 XMBA7YU65pPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="153746497"
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="153746497"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 07:20:43 -0700
IronPort-SDR: y7bU2eaFWlxhlSx6ocaqpiz974F/+BL6H9+5bQdjLdF6Sl0CaZd/k3R8SeLhvcc99BwMLukqsR
 cVPvd6RsQ0wQ==
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="463504096"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 07:20:42 -0700
Date: Tue, 13 Oct 2020 17:20:38 +0300
From: Imre Deak <imre.deak@intel.com>
To: Andriy Shevchenko <andriy.shevchenko@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3] drm: shmobile: Reduce include dependencies
Message-ID: <20201013142038.GA2441144@ideak-desk.fi.intel.com>
References: <20200206111232.75309-1-andriy.shevchenko@linux.intel.com>
 <20200224090430.GT10400@smile.fi.intel.com>
 <20200226014406.GY4764@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226014406.GY4764@pendragon.ideasonboard.com>
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
Reply-To: imre.deak@intel.com
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 03:44:06AM +0200, Laurent Pinchart wrote:
> Hi Andy,
> 
> Thank you for the patch, and sorry for the delay.
> 
> On Mon, Feb 24, 2020 at 11:04:30AM +0200, Andy Shevchenko wrote:
> > On Thu, Feb 06, 2020 at 01:12:32PM +0200, Andy Shevchenko wrote:
> > > This file doesn't need everything provided by <linux/kernel.h>.
> 
> s/everything/anything/
> 
> > > All it needs are some types, which are provided by <drm/drm_mode.h>.
> > > 
> > > Drop unneeded <linux/kernel.h> completely.
> > 
> > Any comments on this?
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Feel free to push :-)

Pushed to drm-misc-next, thanks for the patch and review.

> 
> > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > ---
> > > v3: Drop header completely (Laurent)
> > >  include/linux/platform_data/shmob_drm.h | 2 --
> > >  1 file changed, 2 deletions(-)
> > > 
> > > diff --git a/include/linux/platform_data/shmob_drm.h b/include/linux/platform_data/shmob_drm.h
> > > index fe815d7d9f58..d661399b217d 100644
> > > --- a/include/linux/platform_data/shmob_drm.h
> > > +++ b/include/linux/platform_data/shmob_drm.h
> > > @@ -10,8 +10,6 @@
> > >  #ifndef __SHMOB_DRM_H__
> > >  #define __SHMOB_DRM_H__
> > >  
> > > -#include <linux/kernel.h>
> > > -
> > >  #include <drm/drm_mode.h>
> > >  
> > >  enum shmob_drm_clk_source {
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
