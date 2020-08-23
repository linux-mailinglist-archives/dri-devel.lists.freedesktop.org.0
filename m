Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3934124F039
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 00:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959D96E0C6;
	Sun, 23 Aug 2020 22:19:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734706E0C6
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Aug 2020 22:19:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B41A279;
 Mon, 24 Aug 2020 00:19:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1598221153;
 bh=jR2719Bh8edQKpKcDCblp3fFLCmrLJ9k0mDA6xq9Vw8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gKBnNPjhYTM3EYnpFqaj4S7t7Iozy47maNCuMrXuefLLjxSVpvg+MK3FaBHwgg70z
 xBfv2iysL/2WhIQMppAipazp6O1frreJAOh7eKWIeJvl/4MaxHnLps8WqmJMuye1UU
 kOXvMQa/0uhJa6c9meNOFCite6cJOvlPCwkxRDUA=
Date: Mon, 24 Aug 2020 01:18:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH v2] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
Message-ID: <20200823221854.GG6002@pendragon.ideasonboard.com>
References: <20200608025340.3050-1-cai@lca.pw>
 <20200608031442.GP22208@pendragon.ideasonboard.com>
 <20200608031622.GQ22208@pendragon.ideasonboard.com>
 <20200822012036.GA26224@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200822012036.GA26224@lca.pw>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Qian,

On Fri, Aug 21, 2020 at 09:20:37PM -0400, Qian Cai wrote:
> On Mon, Jun 08, 2020 at 06:16:22AM +0300, Laurent Pinchart wrote:
> > Hi Qian,
> > 
> > I forgot to mention, I think the subject line should be
> > 
> > drm/rcar-du: Make DRM_RCAR_WRITEBACK depend on DRM_RCAR_DU
> > 
> > Could you please let me know if you're OK with these two small changes ?
> 
> Laurent, this patch is still not in the latest linux-next. Can you take a look?

Sorry for the delay. It will be included in the pull request I send this
week.

> > On Mon, Jun 08, 2020 at 06:14:43AM +0300, Laurent Pinchart wrote:
> > > On Sun, Jun 07, 2020 at 10:53:40PM -0400, Qian Cai wrote:
> > > > There is no need to select DRM_RCAR_WRITEBACK if DRM=n which just make
> > > 
> > > s/DRM=n/DRM_RCAR_DU=n/ here.
> > > 
> > > > the generated .config a bit ugly.
> > > > 
> > > >  # ARM devices
> > > >  #
> > > >  # end of ARM devices
> > > > 
> > > >  CONFIG_DRM_RCAR_WRITEBACK=y
> > > > 
> > > >  #
> > > >  # Frame buffer Devices
> > > > 
> > > > Let DRM_RCAR_WRITEBACK depend on DRM_RCAR_DU instead.
> > > > 
> > > > Signed-off-by: Qian Cai <cai@lca.pw>
> > > 
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > 
> > > No need to submit a v3 if you agree with the above change, I'll fix it
> > > in my tree.
> > > 
> > > > ---
> > > >  drivers/gpu/drm/rcar-du/Kconfig | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > > > index 0919f1f159a4..3304b41f5611 100644
> > > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > > @@ -48,3 +48,4 @@ config DRM_RCAR_VSP
> > > >  config DRM_RCAR_WRITEBACK
> > > >  	bool
> > > >  	default y if ARM64
> > > > +	depends on DRM_RCAR_DU

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
