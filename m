Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2F473BD31
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 18:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E283210E682;
	Fri, 23 Jun 2023 16:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA8810E682
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 16:51:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7362440;
 Fri, 23 Jun 2023 18:51:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687539080;
 bh=dJCcFznGmgjBPGYO8VLPgFvS4koMqtbBK7r2v0bvXUA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DYtUs7WU+jw/hk8NuEYdCiHY8kTs2riXrvglC+xZqsfpSkAnUYNP8q20J7DdN6I78
 fIRzvGJ8/mvv9x1FBKL46Ael13WBGe7Okh1so3cRHBjS18EAMzXCuWy4Nnb8irbEGk
 ULDkx81wg7vQ00nFv5JoxeuspVuTK8fMPtRXx27U=
Date: Fri, 23 Jun 2023 19:51:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 26/39] drm: renesas: shmobile: Rename
 shmob_drm_connector.connector
Message-ID: <20230623165156.GD2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <34065943fb616180779936aa5b1d20c3c5e06886.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <34065943fb616180779936aa5b1d20c3c5e06886.1687423204.git.geert+renesas@glider.be>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:38AM +0200, Geert Uytterhoeven wrote:
> Rename the "connector" member of the shmob_drm_connector subclass
> structure to "base", to improve readability.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 4 ++--
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index 3f0b71253ed929c9..2c0ca802d36026f4 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -608,7 +608,7 @@ int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
>  
>  static inline struct shmob_drm_connector *to_shmob_connector(struct drm_connector *connector)
>  {
> -	return container_of(connector, struct shmob_drm_connector, connector);
> +	return container_of(connector, struct shmob_drm_connector, base);
>  }
>  
>  static int shmob_drm_connector_get_modes(struct drm_connector *connector)
> @@ -669,7 +669,7 @@ shmob_drm_connector_init(struct shmob_drm_device *sdev,
>  	if (!scon)
>  		return ERR_PTR(-ENOMEM);
>  
> -	connector = &scon->connector;
> +	connector = &scon->base;
>  	info = &connector->display_info;
>  	info->width_mm = sdev->pdata->panel.width_mm;
>  	info->height_mm = sdev->pdata->panel.height_mm;
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> index 79cce0a0ada4cfce..2c6d7541427581a6 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> @@ -33,7 +33,7 @@ struct shmob_drm_crtc {
>  };
>  
>  struct shmob_drm_connector {
> -	struct drm_connector connector;
> +	struct drm_connector base;
>  	struct drm_encoder *encoder;
>  	const struct videomode *mode;
>  };

-- 
Regards,

Laurent Pinchart
