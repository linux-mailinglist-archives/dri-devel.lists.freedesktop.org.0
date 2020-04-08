Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AA11A2A02
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 22:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B006EADC;
	Wed,  8 Apr 2020 20:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA2D6EAE7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 20:01:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9613159E;
 Wed,  8 Apr 2020 22:01:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586376111;
 bh=61QBxElcESJR0QqO2K++tyWrWFyA7zoUCeDLp6hC+aQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qoYyJyh+jqyAYLHY0BVUnl3jCFhNUaTaNTUhldIrMbPqukGr0bP38btQyrpHhVjBa
 cKxx8DIgd3DkTUzF9sxryDEAlfYD3P1dbHsaqiO2TYGXuzYFk3XpsWfdB3ponKZ39S
 pr5AIEYTQWPD3vfSFXkdUtoYt+qCDGop56gP/FN0=
Date: Wed, 8 Apr 2020 23:01:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] fbdev: mx3fb: const pointer to ipu_di_signal_cfg
Message-ID: <20200408200141.GM4881@pendragon.ideasonboard.com>
References: <20200408162551.3928330-1-arnd@arndb.de> <87pnchhp2s.fsf@intel.com>
 <20200408180216.GC24828@ravnborg.org>
 <20200408182926.GA21997@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408182926.GA21997@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Wed, Apr 08, 2020 at 08:29:26PM +0200, Sam Ravnborg wrote:
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> and
> Jani Nikula <jani.nikula@intel.com> both
> suggested to make the pointer to struct ipu_di_signal_cfg const.
> 
> Fix this.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Fixes: 3f6c93ec9254 ("fbdev: mx3fb: avoid warning about psABI change")
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Enrico Weigelt <info@metux.net>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: linux-fbdev@vger.kernel.org

Assuming this is compile-tested,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Again, sorry. I should have waited a day before applying.
> 
> 	Sam
> 
>  drivers/video/fbdev/mx3fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
> index e13fea3a292f..603731a5a72e 100644
> --- a/drivers/video/fbdev/mx3fb.c
> +++ b/drivers/video/fbdev/mx3fb.c
> @@ -509,7 +509,7 @@ static int sdc_init_panel(struct mx3fb_data *mx3fb, enum ipu_panel panel,
>  			  uint16_t h_start_width, uint16_t h_sync_width,
>  			  uint16_t h_end_width, uint16_t v_start_width,
>  			  uint16_t v_sync_width, uint16_t v_end_width,
> -			  struct ipu_di_signal_cfg *sig)
> +			  const struct ipu_di_signal_cfg *sig)
>  {
>  	unsigned long lock_flags;
>  	uint32_t reg;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
