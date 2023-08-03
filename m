Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E950076F645
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 01:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4C510E22D;
	Thu,  3 Aug 2023 23:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6C310E22D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 23:49:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 913AB600;
 Fri,  4 Aug 2023 01:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691106507;
 bh=+935kVH/FK/lofzSBEYDuqpBcdQ7yGNUnGss5L1DfQs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dBs9jcRLyTV8ok1g4FPuF2O8Ip+M1Xx53A8rvvB0KaE7jC18e3tFzYxF5Wu4yzOOs
 Ba0p4LgDSYN9SHD7SvzwJdByk5DWUQEwPQ0B267a5QEY2nw38encLLntpS4sseRjrv
 s8bNgm/mWsI73Ob3IVOzax0wuIKybwzDDt3IxmaE=
Date: Fri, 4 Aug 2023 02:49:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Damian Hobson-Garcia <dhobsong@igel.co.jp>
Subject: Re: [PATCH 2/2] drm:rcar-du: Enable ABGR and XBGR formats
Message-ID: <20230803234938.GK9722@pendragon.ideasonboard.com>
References: <20230728200714.2084223-1-dhobsong@igel.co.jp>
 <20230728200714.2084223-2-dhobsong@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230728200714.2084223-2-dhobsong@igel.co.jp>
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
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 taki@igel.co.jp, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Damian,

Thank you for the patch.

On Fri, Jul 28, 2023 at 04:07:14PM -0400, Damian Hobson-Garcia wrote:
> These formats are used by Android so having them available
> allows the DU to be used for composition operations.
> 
> Signed-off-by: Damian Hobson-Garcia <dhobsong@igel.co.jp>

This looks good to me. I'm not sure why I haven't included them
initially.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> index 96241c03b60f..d61bb2e44c06 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> @@ -122,6 +122,8 @@ static const u32 rcar_du_vsp_formats[] = {
>  	DRM_FORMAT_RGB888,
>  	DRM_FORMAT_BGRA8888,
>  	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XBGR8888,
>  	DRM_FORMAT_ARGB8888,
>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_UYVY,
> @@ -154,6 +156,8 @@ static const u32 rcar_du_vsp_formats_gen4[] = {
>  	DRM_FORMAT_RGB888,
>  	DRM_FORMAT_BGRA8888,
>  	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XBGR8888,
>  	DRM_FORMAT_ARGB8888,
>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_RGBX1010102,
> @@ -194,6 +198,10 @@ static u32 rcar_du_vsp_state_get_format(struct rcar_du_vsp_plane_state *state)
>  			fourcc = DRM_FORMAT_XRGB8888;
>  			break;
>  
> +		case DRM_FORMAT_ABGR8888:
> +			fourcc = DRM_FORMAT_XBGR8888;
> +			break;
> +
>  		case DRM_FORMAT_BGRA8888:
>  			fourcc = DRM_FORMAT_BGRX8888;
>  			break;

-- 
Regards,

Laurent Pinchart
