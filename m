Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF463B119F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 04:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F296E853;
	Wed, 23 Jun 2021 02:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808346E853
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 02:13:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E21E49B1;
 Wed, 23 Jun 2021 04:13:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624414411;
 bh=eTr6bTwliEL234bS6wj1Fd0elfBdWQDNvpn/GDYoPmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U6L0jIaH0VMK1EEzCDOqKlxFY79Ct0PSx7ApV6sOVZpYq8crnPb3uDl8M6qb2DCSQ
 nwGPwl2jqafkCaBcN2RGJWIuxEh8X1TasS1/nuYsV2eLhpOxVViCiV1SVHqh8ML9Kc
 JV+np2D2rPREdpccWeO3V18+WKa02/tAr9ktn0t4=
Date: Wed, 23 Jun 2021 05:13:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH 1/3] drm: rcar-du: Sort the DU outputs
Message-ID: <YNKYrmf4p65DruSh@pendragon.ideasonboard.com>
References: <20210622232024.3215248-1-kieran.bingham@ideasonboard.com>
 <20210622232024.3215248-2-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210622232024.3215248-2-kieran.bingham@ideasonboard.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

Thank you for the patch.

On Wed, Jun 23, 2021 at 12:20:22AM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Sort the DU outputs alphabetically, with the exception of the final
> entry which is there as a sentinal.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> index 5f2940c42225..440e6b4fbb58 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> @@ -96,10 +96,10 @@ struct rcar_du_crtc_state {
>  enum rcar_du_output {
>  	RCAR_DU_OUTPUT_DPAD0,
>  	RCAR_DU_OUTPUT_DPAD1,
> -	RCAR_DU_OUTPUT_LVDS0,
> -	RCAR_DU_OUTPUT_LVDS1,
>  	RCAR_DU_OUTPUT_HDMI0,
>  	RCAR_DU_OUTPUT_HDMI1,
> +	RCAR_DU_OUTPUT_LVDS0,
> +	RCAR_DU_OUTPUT_LVDS1,
>  	RCAR_DU_OUTPUT_TCON,
>  	RCAR_DU_OUTPUT_MAX,
>  };

-- 
Regards,

Laurent Pinchart
