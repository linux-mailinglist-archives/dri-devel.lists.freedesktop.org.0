Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C8DAA4786
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 11:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDF310E07D;
	Wed, 30 Apr 2025 09:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bT4LKrpL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B64210E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 09:44:14 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E8C2725;
 Wed, 30 Apr 2025 11:43:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1746006239;
 bh=0R7kbd8v7Ndx8uOq1zTNvYS6wblPz94/OWZoUS5EH/M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bT4LKrpLm5AUOCHMjGm0KgR79SxkO2yZKZ08D0OZQwXcgVnn1gPWW/AKDJW/dhMg1
 sheZnt3JzbAWmPsAbsixSpQUMTuoqWfJ2ciWCvw/r2k3trGLn0oUrb34AuedhbPpTI
 Jpeb+wvEZC+0zGbl+UQk1XuMvT1alZh+ytJdx4MI=
Message-ID: <ac2578c3-0439-4909-922d-0e1d9c05e8d7@ideasonboard.com>
Date: Wed, 30 Apr 2025 12:44:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] media: renesas: vsp1: Report colour space
 information to userspace
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250429232904.26413-6-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250429232904.26413-6-laurent.pinchart+renesas@ideasonboard.com>
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
> The vsp1 driver implements very partial colour space support: it
> hardcodes the colorspace field on all video devices and subdevices to
> V4L2_COLORSPACE_SRGB, regardless of the configured format. The
> xfer_func, ycbcr_enc and quantization fields are not set (except for
> hsv_enc for HSV formats on video devices). This doesn't match the
> hardware configuration, which handles YUV data as encoding in BT.601
> with limited range.
> 
> As a first step towards colour space configuration, keep the colour
> space fields hardcoded, but set them based on the selected format type
> (RGB, YUV or HSV).
> 
> While at it, remove an extra blank line.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v1:
> 
> - Drop unneeded colorspace adjustements when propagating RWPF formats
> ---
>   .../media/platform/renesas/vsp1/vsp1_brx.c    |  9 +++-
>   .../media/platform/renesas/vsp1/vsp1_entity.c | 22 +++++++++-
>   .../media/platform/renesas/vsp1/vsp1_entity.h |  2 +
>   .../media/platform/renesas/vsp1/vsp1_hsit.c   | 11 ++++-
>   .../media/platform/renesas/vsp1/vsp1_pipe.c   | 44 +++++++++++++++++++
>   .../media/platform/renesas/vsp1/vsp1_pipe.h   |  2 +
>   .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 11 ++++-
>   .../media/platform/renesas/vsp1/vsp1_sru.c    |  9 +++-
>   .../media/platform/renesas/vsp1/vsp1_uds.c    |  9 +++-
>   .../media/platform/renesas/vsp1/vsp1_video.c  |  7 +--
>   10 files changed, 115 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> index 5dee0490c593..5fc2e5a3bb30 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> @@ -15,6 +15,7 @@
>   #include "vsp1.h"
>   #include "vsp1_brx.h"
>   #include "vsp1_dl.h"
> +#include "vsp1_entity.h"
>   #include "vsp1_pipe.h"
>   #include "vsp1_rwpf.h"
>   #include "vsp1_video.h"
> @@ -108,6 +109,8 @@ static void brx_try_format(struct vsp1_brx *brx,
>   		if (fmt->code != MEDIA_BUS_FMT_ARGB8888_1X32 &&
>   		    fmt->code != MEDIA_BUS_FMT_AYUV8_1X32)
>   			fmt->code = MEDIA_BUS_FMT_AYUV8_1X32;
> +
> +		vsp1_entity_adjust_color_space(fmt);
>   		break;
>   
>   	default:
> @@ -115,13 +118,17 @@ static void brx_try_format(struct vsp1_brx *brx,
>   		format = v4l2_subdev_state_get_format(sd_state,
>   						      BRX_PAD_SINK(0));
>   		fmt->code = format->code;
> +
> +		fmt->colorspace = format->colorspace;
> +		fmt->xfer_func = format->xfer_func;
> +		fmt->ycbcr_enc = format->ycbcr_enc;
> +		fmt->quantization = format->quantization;
>   		break;
>   	}
>   
>   	fmt->width = clamp(fmt->width, BRX_MIN_SIZE, BRX_MAX_SIZE);
>   	fmt->height = clamp(fmt->height, BRX_MIN_SIZE, BRX_MAX_SIZE);
>   	fmt->field = V4L2_FIELD_NONE;
> -	fmt->colorspace = V4L2_COLORSPACE_SRGB;
>   }
>   
>   static int brx_set_format(struct v4l2_subdev *subdev,
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> index 8b8945bd8f10..9f93ae86b1da 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> @@ -99,6 +99,20 @@ void vsp1_entity_configure_partition(struct vsp1_entity *entity,
>   						 dl, dlb);
>   }
>   
> +void vsp1_entity_adjust_color_space(struct v4l2_mbus_framefmt *format)
> +{
> +	u8 xfer_func = format->xfer_func;
> +	u8 ycbcr_enc = format->ycbcr_enc;
> +	u8 quantization = format->quantization;
> +
> +	vsp1_adjust_color_space(format->code, &format->colorspace, &xfer_func,
> +				&ycbcr_enc, &quantization);
> +
> +	format->xfer_func = xfer_func;
> +	format->ycbcr_enc = ycbcr_enc;
> +	format->quantization = quantization;
> +}
> +
>   /* -----------------------------------------------------------------------------
>    * V4L2 Subdevice Operations
>    */
> @@ -329,7 +343,13 @@ int vsp1_subdev_set_pad_format(struct v4l2_subdev *subdev,
>   	format->height = clamp_t(unsigned int, fmt->format.height,
>   				 min_height, max_height);
>   	format->field = V4L2_FIELD_NONE;
> -	format->colorspace = V4L2_COLORSPACE_SRGB;
> +
> +	format->colorspace = fmt->format.colorspace;
> +	format->xfer_func = fmt->format.xfer_func;
> +	format->ycbcr_enc = fmt->format.ycbcr_enc;
> +	format->quantization = fmt->format.quantization;
> +
> +	vsp1_entity_adjust_color_space(format);
>   
>   	fmt->format = *format;
>   
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.h b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> index 1bcc9e27dfdc..ce4a09610164 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.h
> @@ -170,6 +170,8 @@ void vsp1_entity_configure_partition(struct vsp1_entity *entity,
>   				     struct vsp1_dl_list *dl,
>   				     struct vsp1_dl_body *dlb);
>   
> +void vsp1_entity_adjust_color_space(struct v4l2_mbus_framefmt *format);
> +
>   struct media_pad *vsp1_entity_remote_pad(struct media_pad *pad);
>   
>   int vsp1_subdev_get_pad_format(struct v4l2_subdev *subdev,
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
> index 8ba2a7c7305c..1fcd1967d3b2 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
> @@ -14,6 +14,7 @@
>   
>   #include "vsp1.h"
>   #include "vsp1_dl.h"
> +#include "vsp1_entity.h"
>   #include "vsp1_hsit.h"
>   
>   #define HSIT_MIN_SIZE				4U
> @@ -96,7 +97,13 @@ static int hsit_set_format(struct v4l2_subdev *subdev,
>   	format->height = clamp_t(unsigned int, fmt->format.height,
>   				 HSIT_MIN_SIZE, HSIT_MAX_SIZE);
>   	format->field = V4L2_FIELD_NONE;
> -	format->colorspace = V4L2_COLORSPACE_SRGB;
> +
> +	format->colorspace = fmt->format.colorspace;
> +	format->xfer_func = fmt->format.xfer_func;
> +	format->ycbcr_enc = fmt->format.ycbcr_enc;
> +	format->quantization = fmt->format.quantization;
> +
> +	vsp1_entity_adjust_color_space(format);
>   
>   	fmt->format = *format;
>   
> @@ -106,6 +113,8 @@ static int hsit_set_format(struct v4l2_subdev *subdev,
>   	format->code = hsit->inverse ? MEDIA_BUS_FMT_ARGB8888_1X32
>   		     : MEDIA_BUS_FMT_AHSV8888_1X32;
>   
> +	vsp1_entity_adjust_color_space(format);
> +
>   done:
>   	mutex_unlock(&hsit->entity.lock);
>   	return ret;
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> index f7b133536704..b9ab6c9c96df 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -346,6 +346,50 @@ vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
>   	return NULL;
>   }
>   
> +/**
> + * vsp1_adjust_color_space - Adjust color space fields in a format
> + * @code: the media bus code
> + * @colorspace: the colorspace
> + * @xfer_func: the transfer function
> + * @encoding: the encoding
> + * @quantization: the quantization
> + *
> + * This function adjusts all color space fields of a video device of subdev
> + * format structure, taking into account the requested format, requested color
> + * space and limitations of the VSP1. It should be used in the video device and
> + * subdev set format handlers.
> + *
> + * For now, simply hardcode the color space fields to the VSP1 defaults based
> + * on the media bus code.
> + */
> +void vsp1_adjust_color_space(u32 code, u32 *colorspace, u8 *xfer_func,
> +			     u8 *encoding, u8 *quantization)
> +{
> +	switch (code) {
> +	case MEDIA_BUS_FMT_ARGB8888_1X32:
> +	default:
> +		*colorspace = V4L2_COLORSPACE_SRGB;
> +		*xfer_func = V4L2_XFER_FUNC_SRGB;
> +		*encoding = V4L2_YCBCR_ENC_601;
> +		*quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +		break;
> +
> +	case MEDIA_BUS_FMT_AHSV8888_1X32:
> +		*colorspace = V4L2_COLORSPACE_SRGB;
> +		*xfer_func = V4L2_XFER_FUNC_SRGB;
> +		*encoding = V4L2_HSV_ENC_256;
> +		*quantization = V4L2_QUANTIZATION_FULL_RANGE;
> +		break;
> +
> +	case MEDIA_BUS_FMT_AYUV8_1X32:
> +		*colorspace = V4L2_COLORSPACE_SMPTE170M;
> +		*xfer_func = V4L2_XFER_FUNC_709;
> +		*encoding = V4L2_YCBCR_ENC_601;
> +		*quantization = V4L2_QUANTIZATION_LIM_RANGE;
> +		break;
> +	}
> +}
> +
>   /* -----------------------------------------------------------------------------
>    * Pipeline Management
>    */
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> index 1d3d033af209..c88a3f0d5b1e 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.h
> @@ -182,5 +182,7 @@ const struct vsp1_format_info *vsp1_get_format_info(struct vsp1_device *vsp1,
>   const struct vsp1_format_info *
>   vsp1_get_format_info_by_index(struct vsp1_device *vsp1, unsigned int index,
>   			      u32 code);
> +void vsp1_adjust_color_space(u32 code, u32 *colorspace, u8 *xfer_func,
> +			     u8 *encoding, u8 *quantization);
>   
>   #endif /* __VSP1_PIPE_H__ */
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> index 1b4bac7b7cfa..4e8bcf6a59ad 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> @@ -10,6 +10,7 @@
>   #include <media/v4l2-subdev.h>
>   
>   #include "vsp1.h"
> +#include "vsp1_entity.h"
>   #include "vsp1_rwpf.h"
>   #include "vsp1_video.h"
>   
> @@ -90,6 +91,8 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
>   		else
>   			format->code = sink_format->code;
>   
> +		vsp1_entity_adjust_color_space(format);
> +
>   		fmt->format = *format;
>   		goto done;
>   	}
> @@ -100,7 +103,13 @@ static int vsp1_rwpf_set_format(struct v4l2_subdev *subdev,
>   	format->height = clamp_t(unsigned int, fmt->format.height,
>   				 RWPF_MIN_HEIGHT, rwpf->max_height);
>   	format->field = V4L2_FIELD_NONE;
> -	format->colorspace = V4L2_COLORSPACE_SRGB;
> +
> +	format->colorspace = fmt->format.colorspace;
> +	format->xfer_func = fmt->format.xfer_func;
> +	format->ycbcr_enc = fmt->format.ycbcr_enc;
> +	format->quantization = fmt->format.quantization;
> +
> +	vsp1_entity_adjust_color_space(format);
>   
>   	fmt->format = *format;
>   
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_sru.c b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> index 1759ce642e6e..bba2872afaf2 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_sru.c
> @@ -14,6 +14,7 @@
>   
>   #include "vsp1.h"
>   #include "vsp1_dl.h"
> +#include "vsp1_entity.h"
>   #include "vsp1_pipe.h"
>   #include "vsp1_sru.h"
>   
> @@ -178,6 +179,8 @@ static void sru_try_format(struct vsp1_sru *sru,
>   		    fmt->code != MEDIA_BUS_FMT_AYUV8_1X32)
>   			fmt->code = MEDIA_BUS_FMT_AYUV8_1X32;
>   
> +		vsp1_entity_adjust_color_space(fmt);
> +
>   		fmt->width = clamp(fmt->width, SRU_MIN_SIZE, SRU_MAX_SIZE);
>   		fmt->height = clamp(fmt->height, SRU_MIN_SIZE, SRU_MAX_SIZE);
>   		break;
> @@ -187,6 +190,11 @@ static void sru_try_format(struct vsp1_sru *sru,
>   		format = v4l2_subdev_state_get_format(sd_state, SRU_PAD_SINK);
>   		fmt->code = format->code;
>   
> +		fmt->colorspace = format->colorspace;
> +		fmt->xfer_func = format->xfer_func;
> +		fmt->ycbcr_enc = format->ycbcr_enc;
> +		fmt->quantization = format->quantization;
> +
>   		/*
>   		 * We can upscale by 2 in both direction, but not independently.
>   		 * Compare the input and output rectangles areas (avoiding
> @@ -211,7 +219,6 @@ static void sru_try_format(struct vsp1_sru *sru,
>   	}
>   
>   	fmt->field = V4L2_FIELD_NONE;
> -	fmt->colorspace = V4L2_COLORSPACE_SRGB;
>   }
>   
>   static int sru_set_format(struct v4l2_subdev *subdev,
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_uds.c b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> index c5a38478cf8c..2db473b6f83c 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_uds.c
> @@ -14,6 +14,7 @@
>   
>   #include "vsp1.h"
>   #include "vsp1_dl.h"
> +#include "vsp1_entity.h"
>   #include "vsp1_pipe.h"
>   #include "vsp1_uds.h"
>   
> @@ -177,6 +178,8 @@ static void uds_try_format(struct vsp1_uds *uds,
>   		    fmt->code != MEDIA_BUS_FMT_AYUV8_1X32)
>   			fmt->code = MEDIA_BUS_FMT_AYUV8_1X32;
>   
> +		vsp1_entity_adjust_color_space(fmt);
> +
>   		fmt->width = clamp(fmt->width, UDS_MIN_SIZE, UDS_MAX_SIZE);
>   		fmt->height = clamp(fmt->height, UDS_MIN_SIZE, UDS_MAX_SIZE);
>   		break;
> @@ -186,6 +189,11 @@ static void uds_try_format(struct vsp1_uds *uds,
>   		format = v4l2_subdev_state_get_format(sd_state, UDS_PAD_SINK);
>   		fmt->code = format->code;
>   
> +		fmt->colorspace = format->colorspace;
> +		fmt->xfer_func = format->xfer_func;
> +		fmt->ycbcr_enc = format->ycbcr_enc;
> +		fmt->quantization = format->quantization;
> +
>   		uds_output_limits(format->width, &minimum, &maximum);
>   		fmt->width = clamp(fmt->width, minimum, maximum);
>   		uds_output_limits(format->height, &minimum, &maximum);
> @@ -194,7 +202,6 @@ static void uds_try_format(struct vsp1_uds *uds,
>   	}
>   
>   	fmt->field = V4L2_FIELD_NONE;
> -	fmt->colorspace = V4L2_COLORSPACE_SRGB;
>   }
>   
>   static int uds_set_format(struct v4l2_subdev *subdev,
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> index da578993f472..68d495c20a84 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> @@ -127,12 +127,10 @@ static int __vsp1_video_try_format(struct vsp1_video *video,
>   		info = vsp1_get_format_info(video->vsp1, VSP1_VIDEO_DEF_FORMAT);
>   
>   	pix->pixelformat = info->fourcc;
> -	pix->colorspace = V4L2_COLORSPACE_SRGB;
>   	pix->field = V4L2_FIELD_NONE;
>   
> -	if (info->fourcc == V4L2_PIX_FMT_HSV24 ||
> -	    info->fourcc == V4L2_PIX_FMT_HSV32)
> -		pix->hsv_enc = V4L2_HSV_ENC_256;
> +	vsp1_adjust_color_space(info->mbus, &pix->colorspace, &pix->xfer_func,
> +				&pix->ycbcr_enc, &pix->quantization);
>   
>   	memset(pix->reserved, 0, sizeof(pix->reserved));
>   
> @@ -891,7 +889,6 @@ vsp1_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>   			  | V4L2_CAP_IO_MC | V4L2_CAP_VIDEO_CAPTURE_MPLANE
>   			  | V4L2_CAP_VIDEO_OUTPUT_MPLANE;
>   
> -
>   	strscpy(cap->driver, "vsp1", sizeof(cap->driver));
>   	strscpy(cap->card, video->video.name, sizeof(cap->card));
>   

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

  Tomi

