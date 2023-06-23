Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0092573BAFF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 17:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB40310E65A;
	Fri, 23 Jun 2023 15:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D381010E650
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 15:04:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4AA6838;
 Fri, 23 Jun 2023 17:04:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687532646;
 bh=L0JeIL/kTtYp3SuxU1Cw3iCGkCrTf5TOpTRBzOxuPI4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SnqG14c9ZlrSv6RYws6+chxA6XcvR5lgl/UtI9Mhrruu8b/kotLR8WwZqCWmu3Op7
 a6SE9NjQKSWqvaVl0aiPZjSQsUuBdE7XPxZ8w7kibqK83Au3CtJeXKLNseXDwi/G0S
 3dpP8lsopodJ6vRbEtVL3C95mQCDM2Spn19Khytw=
Date: Fri, 23 Jun 2023 18:04:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 08/39] drm: renesas: shmobile: Use %p4cc to print fourcc
 code
Message-ID: <20230623150441.GJ2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <7eb153878ffa1242d537aade655936f33b7eec62.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7eb153878ffa1242d537aade655936f33b7eec62.1687423204.git.geert+renesas@glider.be>
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

On Thu, Jun 22, 2023 at 11:21:20AM +0200, Geert Uytterhoeven wrote:
> Replace the last printing of an hexadecimal fourcc format code by a
> pretty-printed format name, using the "%p4cc" format specifier.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> index 7e49e2873da1bb6f..36fedb2b74c8b7a2 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> @@ -184,8 +184,8 @@ shmob_drm_plane_update(struct drm_plane *plane, struct drm_crtc *crtc,
>  
>  	format = shmob_drm_format_info(fb->format->format);
>  	if (format == NULL) {
> -		dev_dbg(sdev->dev, "update_plane: unsupported format %08x\n",
> -			fb->format->format);
> +		dev_dbg(sdev->dev, "update_plane: unsupported format %p4cc\n",
> +			&fb->format->format);
>  		return -EINVAL;
>  	}
>  

-- 
Regards,

Laurent Pinchart
