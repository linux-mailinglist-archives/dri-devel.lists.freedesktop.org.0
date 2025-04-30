Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE936AA481C
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 12:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B78410E71A;
	Wed, 30 Apr 2025 10:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uoo7dkV4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A13610E71A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 10:17:34 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id F34E9AF;
 Wed, 30 Apr 2025 12:17:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1746008247;
 bh=gDZoQOFaUPDT5JFZ3OjWDkvUdTzUEVOLB2ahBwpA/ig=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uoo7dkV4JzFGIGWtvt/dO1dm4DFIXsq0coD+zaFUKTt2w3rm2hD/1loCCHgl68xQ/
 7Z88C+d+RpH0BoxC2a4TARlgDiqW4Vkzuc+VWjnmoWzk0f++djxflSM9qMjm8Ao26D
 ivoDJXN/MFo9yH4OU1iLZC+qYz89kNRxSBC9tXaY=
Message-ID: <bbb351d5-8e05-4222-badc-aae085aa7024@ideasonboard.com>
Date: Wed, 30 Apr 2025 13:17:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] media: renesas: vsp1: Expose color space through
 the DRM API
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250429232904.26413-9-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250429232904.26413-9-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 30/04/2025 02:29, Laurent Pinchart wrote:
> Now that the VSP1 driver supports color spaces, expose them through the
> API used by the DU driver. This allows configuring the YCbCr encoding
> and quantization used by each plane, ensuring correct color rendering.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>   drivers/media/platform/renesas/vsp1/vsp1_drm.c | 4 ++++
>   drivers/media/platform/renesas/vsp1/vsp1_drm.h | 6 ++++--
>   include/media/vsp1.h                           | 4 ++++
>   3 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> index e5339fda5941..fe55e8747b05 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -136,6 +136,8 @@ static int vsp1_du_pipeline_setup_rpf(struct vsp1_device *vsp1,
>   	format.format.height = input->crop.height + input->crop.top;
>   	format.format.code = rpf->fmtinfo->mbus;
>   	format.format.field = V4L2_FIELD_NONE;
> +	format.format.ycbcr_enc = input->ycbcr_enc;
> +	format.format.quantization = input->quantization;
>   
>   	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_fmt, NULL,
>   			       &format);
> @@ -876,6 +878,8 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
>   	input->crop = cfg->src;
>   	input->compose = cfg->dst;
>   	input->zpos = cfg->zpos;
> +	input->ycbcr_enc = cfg->color_encoding;
> +	input->quantization = cfg->color_range;
>   
>   	drm_pipe->pipe.inputs[rpf_index] = rpf;
>   
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.h b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
> index 7234737cc464..07a5d0adbd08 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.h
> @@ -52,8 +52,8 @@ struct vsp1_drm_pipeline {
>    * struct vsp1_drm - State for the API exposed to the DRM driver
>    * @pipe: the VSP1 DRM pipeline used for display
>    * @lock: protects the BRU and BRS allocation
> - * @inputs: source crop rectangle, destination compose rectangle and z-order
> - *	position for every input (indexed by RPF index)
> + * @inputs: source crop rectangle, destination compose rectangle, z-order
> + *	position and colorspace for every input (indexed by RPF index)
>    */
>   struct vsp1_drm {
>   	struct vsp1_drm_pipeline pipe[VSP1_MAX_LIF];
> @@ -63,6 +63,8 @@ struct vsp1_drm {
>   		struct v4l2_rect crop;
>   		struct v4l2_rect compose;
>   		unsigned int zpos;
> +		enum v4l2_ycbcr_encoding ycbcr_enc;
> +		enum v4l2_quantization quantization;
>   	} inputs[VSP1_MAX_RPF];
>   };
>   
> diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> index 48f4a5023d81..4ea6352fd63f 100644
> --- a/include/media/vsp1.h
> +++ b/include/media/vsp1.h
> @@ -52,6 +52,8 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
>    * @alpha: alpha value (0: fully transparent, 255: fully opaque)
>    * @zpos: Z position of the plane (from 0 to number of planes minus 1)
>    * @premult: true for premultiplied alpha
> + * @color_encoding: color encoding (valid for YUV formats only)
> + * @color_range: color range (valid for YUV formats only)
>    */
>   struct vsp1_du_atomic_config {
>   	u32 pixelformat;
> @@ -62,6 +64,8 @@ struct vsp1_du_atomic_config {
>   	unsigned int alpha;
>   	unsigned int zpos;
>   	bool premult;
> +	enum v4l2_ycbcr_encoding color_encoding;
> +	enum v4l2_quantization color_range;
>   };
>   
>   /**

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

  Tomi

