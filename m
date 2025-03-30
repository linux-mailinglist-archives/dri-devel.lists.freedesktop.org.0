Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F31AFA759BC
	for <lists+dri-devel@lfdr.de>; Sun, 30 Mar 2025 13:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D0110E105;
	Sun, 30 Mar 2025 11:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J8+0dhi9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC1F10E105
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Mar 2025 11:13:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EF5A11AA;
 Sun, 30 Mar 2025 13:11:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1743333063;
 bh=3hE6jH0/uHaWAN9ulu4gI3FtnCxcQcxt3f7Fh3GP81o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J8+0dhi96ZFdmZNR+MTl09+o4ryC+lWgb9FOAXzzqTCDB/2qCvKinilzA1GUp9RKG
 iG+qcqg/sZ/wlOpJuJWNlHGYcoswbZ36+oOdfvZa8NX9WGHXlTF16eoNS2mL+myPi1
 DF6fEZI9c9lNySjb6KtVvR5PSX/jKHqEXKkJ8FbE=
Date: Sun, 30 Mar 2025 14:12:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v2 1/2] drm: renesas: rz-du: Drop bpp variable from
 struct rzg2l_du_format_info
Message-ID: <20250330111229.GA8840@pendragon.ideasonboard.com>
References: <20250330102357.56010-1-biju.das.jz@bp.renesas.com>
 <20250330102357.56010-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250330102357.56010-2-biju.das.jz@bp.renesas.com>
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

Hi Biju,

Thank you for the patch.

On Sun, Mar 30, 2025 at 11:23:52AM +0100, Biju Das wrote:
> Drop the unused variable bpp from struct rzg2l_du_format_info.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v2:
>  * New patch.
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 3 ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h | 1 -
>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> index 90c6269ccd29..1a428ab3c424 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> @@ -38,19 +38,16 @@ static const struct rzg2l_du_format_info rzg2l_du_format_infos[] = {
>  	{
>  		.fourcc = DRM_FORMAT_XRGB8888,
>  		.v4l2 = V4L2_PIX_FMT_XBGR32,
> -		.bpp = 32,
>  		.planes = 1,
>  		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_ARGB8888,
>  		.v4l2 = V4L2_PIX_FMT_ABGR32,
> -		.bpp = 32,
>  		.planes = 1,
>  		.hsub = 1,
>  	}, {
>  		.fourcc = DRM_FORMAT_RGB888,
>  		.v4l2 = V4L2_PIX_FMT_BGR24,
> -		.bpp = 24,
>  		.planes = 1,
>  		.hsub = 1,
>  	}
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
> index 876e97cfbf45..e2c599f115c6 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
> @@ -23,7 +23,6 @@ struct sg_table;
>  struct rzg2l_du_format_info {
>  	u32 fourcc;
>  	u32 v4l2;
> -	unsigned int bpp;
>  	unsigned int planes;
>  	unsigned int hsub;
>  };

-- 
Regards,

Laurent Pinchart
