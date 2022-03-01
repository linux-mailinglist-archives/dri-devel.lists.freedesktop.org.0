Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3444C8DD5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 15:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F22710E400;
	Tue,  1 Mar 2022 14:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E45B910E51F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 14:34:46 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id bm39so13073509qkb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 06:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=YfgYFmdvjCecxn9h6hICnr9ORgDNXmi56da4QLUNvw8=;
 b=WZArLX81JCSDckeLQQDIfNH/QNKU0u9XXx9qlhHh64Q3/PwWfcqhGf5enS+iEIkjjw
 h13pYiJwOu3UWyeK/RFDipp01OT9v3rwj5U59wQUnJt5cnubV0ZOqr6vE3Ij2SFbloCb
 curdZNpuigdzdFmauSfXRtt0gFz6kjeLJZjc1xQUimIb/UvxiWQYM+QGs6KryWu9pwIt
 S3NNsNTVyzz0L4+7D8vl9DK19Px+YUXbHGEFtr1hDzmhAr2LXhS23txs3zFuITeYCEDD
 TPcyWAFWzgYjRDc/fzpAmzAwuaTNB+iPPwPAhT2Y5jJuh7MzvsyUjP6KOwA/Mx1NtSu1
 mbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=YfgYFmdvjCecxn9h6hICnr9ORgDNXmi56da4QLUNvw8=;
 b=KNYGVqIT/cuJyz7zU6JBkIf+Kq/T/3mwX51i3g59YTE+zON7HHln0giS4rg7xw6+ds
 wWm8NmdqVRe8t/NKlHtfUi9y5h5LKpnT4mC5/3RAt7Webntjs50cE8iL/whN8FnuQo4f
 wBvZj1anZl3FThHuuqCgafsmFy06KxdUG5GbFMLs73ZZZCwc6EDOpujFOe5OsYWRvzI0
 yhcQoI36DCJ8fN2wGbx36pxlViEEDDaZI5X2bwsTpFzQeG9YVNDJVh/mvKumd0t4QvPK
 EZNI8j87WqR3OBaej04+CXivjFbxorMfsnion/amfbOtuuq+BRRpiWaRs7luDCWOF834
 jbFQ==
X-Gm-Message-State: AOAM53077ekuTioBz/kQwSGjdgfZidLLapvV7S6gPcbtqRjUa8lapDuA
 vVMj0rTlE5dPrijfv2/yBIozPw==
X-Google-Smtp-Source: ABdhPJx7lWgps1gKsp51n9DwywDayhxh/TdusjIKACtsKwbvy3sEwFfDLxbIT9UatJHeC4uWNMoL0w==
X-Received: by 2002:ae9:ebd2:0:b0:4e9:15a5:bdce with SMTP id
 b201-20020ae9ebd2000000b004e915a5bdcemr14147591qkg.303.1646145285922; 
 Tue, 01 Mar 2022 06:34:45 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168]) by smtp.gmail.com with ESMTPSA id
 y11-20020a05622a004b00b002dea2052d7dsm9297258qtw.12.2022.03.01.06.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 06:34:45 -0800 (PST)
Message-ID: <777ced91106f5aba06e7cac6b6b1c80f42d25a1f.camel@ndufresne.ca>
Subject: Re: [PATCH v7, 07/15] media: mtk-vcodec: Refactor supported vdec
 formats and framesizes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Tue, 01 Mar 2022 09:34:43 -0500
In-Reply-To: <20220223034008.15781-8-yunfei.dong@mediatek.com>
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
 <20220223034008.15781-8-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Steve Cho <stevecho@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mercredi 23 février 2022 à 11:40 +0800, Yunfei Dong a écrit :
> Supported output and capture format types for mt8192 are different
> with mt8183. Needs to get format types according to decoder capability.

This patch is both refactoring and changing the behaviour. Can you please split
the non-functional changes from the functional one. This ensure we can proceed
with a good review of the functional changes.

regards,
Nicolas

> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   8 +-
>  .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |  13 +-
>  .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 117 +++++++++++++-----
>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  13 +-
>  4 files changed, 107 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> index 304f5afbd419..bae43938ee37 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> @@ -26,7 +26,7 @@ mtk_vdec_find_format(struct v4l2_format *f,
>  	const struct mtk_video_fmt *fmt;
>  	unsigned int k;
>  
> -	for (k = 0; k < dec_pdata->num_formats; k++) {
> +	for (k = 0; k < *dec_pdata->num_formats; k++) {
>  		fmt = &dec_pdata->vdec_formats[k];
>  		if (fmt->fourcc == f->fmt.pix_mp.pixelformat)
>  			return fmt;
> @@ -525,7 +525,7 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
>  	if (fsize->index != 0)
>  		return -EINVAL;
>  
> -	for (i = 0; i < dec_pdata->num_framesizes; ++i) {
> +	for (i = 0; i < *dec_pdata->num_framesizes; ++i) {
>  		if (fsize->pixel_format != dec_pdata->vdec_framesizes[i].fourcc)
>  			continue;
>  
> @@ -564,7 +564,7 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
>  	const struct mtk_video_fmt *fmt;
>  	int i, j = 0;
>  
> -	for (i = 0; i < dec_pdata->num_formats; i++) {
> +	for (i = 0; i < *dec_pdata->num_formats; i++) {
>  		if (output_queue &&
>  		    dec_pdata->vdec_formats[i].type != MTK_FMT_DEC)
>  			continue;
> @@ -577,7 +577,7 @@ static int vidioc_enum_fmt(struct v4l2_fmtdesc *f, void *priv,
>  		++j;
>  	}
>  
> -	if (i == dec_pdata->num_formats)
> +	if (i == *dec_pdata->num_formats)
>  		return -EINVAL;
>  
>  	fmt = &dec_pdata->vdec_formats[i];
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
> index 7966c132be8f..3f33beb9c551 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
> @@ -37,7 +37,9 @@ static const struct mtk_video_fmt mtk_video_formats[] = {
>  	},
>  };
>  
> -#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
> +static const unsigned int num_supported_formats =
> +	ARRAY_SIZE(mtk_video_formats);
> +
>  #define DEFAULT_OUT_FMT_IDX 0
>  #define DEFAULT_CAP_FMT_IDX 3
>  
> @@ -59,7 +61,8 @@ static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
>  	},
>  };
>  
> -#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
> +static const unsigned int num_supported_framesize =
> +	ARRAY_SIZE(mtk_vdec_framesizes);
>  
>  /*
>   * This function tries to clean all display buffers, the buffers will return
> @@ -235,7 +238,7 @@ static void mtk_vdec_update_fmt(struct mtk_vcodec_ctx *ctx,
>  	unsigned int k;
>  
>  	dst_q_data = &ctx->q_data[MTK_Q_DATA_DST];
> -	for (k = 0; k < NUM_FORMATS; k++) {
> +	for (k = 0; k < num_supported_formats; k++) {
>  		fmt = &mtk_video_formats[k];
>  		if (fmt->fourcc == pixelformat) {
>  			mtk_v4l2_debug(1, "Update cap fourcc(%d -> %d)",
> @@ -617,11 +620,11 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata = {
>  	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
>  	.vdec_vb2_ops = &mtk_vdec_frame_vb2_ops,
>  	.vdec_formats = mtk_video_formats,
> -	.num_formats = NUM_FORMATS,
> +	.num_formats = &num_supported_formats,
>  	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
>  	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
>  	.vdec_framesizes = mtk_vdec_framesizes,
> -	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
> +	.num_framesizes = &num_supported_framesize,
>  	.worker = mtk_vdec_worker,
>  	.flush_decoder = mtk_vdec_flush_decoder,
>  	.is_subdev_supported = false,
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> index 6d481410bf89..e51d935bd21d 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> @@ -81,33 +81,23 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
>  
>  #define NUM_CTRLS ARRAY_SIZE(mtk_stateless_controls)
>  
> -static const struct mtk_video_fmt mtk_video_formats[] = {
> -	{
> -		.fourcc = V4L2_PIX_FMT_H264_SLICE,
> -		.type = MTK_FMT_DEC,
> -		.num_planes = 1,
> -	},
> -	{
> -		.fourcc = V4L2_PIX_FMT_MM21,
> -		.type = MTK_FMT_FRAME,
> -		.num_planes = 2,
> -	},
> +static struct mtk_video_fmt mtk_video_formats[2];
> +static struct mtk_codec_framesizes mtk_vdec_framesizes[1];
> +
> +static struct mtk_video_fmt default_out_format;
> +static struct mtk_video_fmt default_cap_format;
> +static unsigned int num_formats;
> +static unsigned int num_framesizes;
> +
> +static struct v4l2_frmsize_stepwise stepwise_fhd = {
> +	.min_width = MTK_VDEC_MIN_W,
> +	.max_width = MTK_VDEC_MAX_W,
> +	.step_width = 16,
> +	.min_height = MTK_VDEC_MIN_H,
> +	.max_height = MTK_VDEC_MAX_H,
> +	.step_height = 16
>  };
>  
> -#define NUM_FORMATS ARRAY_SIZE(mtk_video_formats)
> -#define DEFAULT_OUT_FMT_IDX    0
> -#define DEFAULT_CAP_FMT_IDX    1
> -
> -static const struct mtk_codec_framesizes mtk_vdec_framesizes[] = {
> -	{
> -		.fourcc	= V4L2_PIX_FMT_H264_SLICE,
> -		.stepwise = {  MTK_VDEC_MIN_W, MTK_VDEC_MAX_W, 16,
> -				MTK_VDEC_MIN_H, MTK_VDEC_MAX_H, 16 },
> -	},
> -};
> -
> -#define NUM_SUPPORTED_FRAMESIZE ARRAY_SIZE(mtk_vdec_framesizes)
> -
>  static void mtk_vdec_stateless_out_to_done(struct mtk_vcodec_ctx *ctx,
>  					   struct mtk_vcodec_mem *bs, int error)
>  {
> @@ -350,6 +340,62 @@ const struct media_device_ops mtk_vcodec_media_ops = {
>  	.req_queue	= v4l2_m2m_request_queue,
>  };
>  
> +static void mtk_vcodec_add_formats(unsigned int fourcc,
> +				   struct mtk_vcodec_ctx *ctx)
> +{
> +	struct mtk_vcodec_dev *dev = ctx->dev;
> +	const struct mtk_vcodec_dec_pdata *pdata = dev->vdec_pdata;
> +	int count_formats = *pdata->num_formats;
> +	int count_framesizes = *pdata->num_framesizes;
> +
> +	switch (fourcc) {
> +	case V4L2_PIX_FMT_H264_SLICE:
> +			[count_formats].fourcc = fourcc;
> +		mtk_video_formats[count_formats].type = MTK_FMT_DEC;
> +		mtk_video_formats[count_formats].num_planes = 1;
> +
> +		mtk_vdec_framesizes[count_framesizes].fourcc = fourcc;
> +		mtk_vdec_framesizes[count_framesizes].stepwise = stepwise_fhd;
> +		num_framesizes++;
> +		break;
> +	case V4L2_PIX_FMT_MM21:
> +		mtk_video_formats[count_formats].fourcc = fourcc;
> +		mtk_video_formats[count_formats].type = MTK_FMT_FRAME;
> +		mtk_video_formats[count_formats].num_planes = 2;
> +		break;
> +	default:
> +		mtk_v4l2_err("Can not add unsupported format type");
> +		return;
> +	}
> +
> +	num_formats++;
> +	mtk_v4l2_debug(3, "num_formats: %d num_frames:%d dec_capability: 0x%x",
> +		       count_formats, count_framesizes, ctx->dev->dec_capability);
> +}
> +
> +static void mtk_vcodec_get_supported_formats(struct mtk_vcodec_ctx *ctx)
> +{
> +	int cap_format_count = 0, out_format_count = 0;
> +
> +	if (num_formats && num_framesizes)
> +		return;
> +
> +	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_MM21) {
> +		mtk_vcodec_add_formats(V4L2_PIX_FMT_MM21, ctx);
> +		cap_format_count++;
> +	}
> +	if (ctx->dev->dec_capability & MTK_VDEC_FORMAT_H264_SLICE) {
> +		mtk_vcodec_add_formats(V4L2_PIX_FMT_H264_SLICE, ctx);
> +		out_format_count++;
> +	}
> +
> +	if (cap_format_count)
> +		default_cap_format = mtk_video_formats[cap_format_count - 1];
> +	if (out_format_count)
> +		default_out_format =
> +			mtk_video_formats[cap_format_count + out_format_count - 1];
> +}
> +
>  static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
>  {
>  	struct vb2_queue *src_vq;
> @@ -360,6 +406,11 @@ static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
>  	if (ctx->dev->vdec_pdata->hw_arch != MTK_VDEC_PURE_SINGLE_CORE)
>  		v4l2_m2m_set_dst_buffered(ctx->m2m_ctx, 1);
>  
> +	if (!ctx->dev->vdec_pdata->is_subdev_supported)
> +		ctx->dev->dec_capability |=
> +			MTK_VDEC_FORMAT_H264_SLICE | MTK_VDEC_FORMAT_MM21;
> +	mtk_vcodec_get_supported_formats(ctx);
> +
>  	/* Support request api for output plane */
>  	src_vq->supports_requests = true;
>  	src_vq->requires_requests = true;
> @@ -393,11 +444,11 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata = {
>  	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
>  	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
>  	.vdec_formats = mtk_video_formats,
> -	.num_formats = NUM_FORMATS,
> -	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
> -	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
> +	.num_formats = &num_formats,
> +	.default_out_fmt = &default_out_format,
> +	.default_cap_fmt = &default_cap_format,
>  	.vdec_framesizes = mtk_vdec_framesizes,
> -	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
> +	.num_framesizes = &num_framesizes,
>  	.uses_stateless_api = true,
>  	.worker = mtk_vdec_worker,
>  	.flush_decoder = mtk_vdec_flush_decoder,
> @@ -413,11 +464,11 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata = {
>  	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
>  	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
>  	.vdec_formats = mtk_video_formats,
> -	.num_formats = NUM_FORMATS,
> -	.default_out_fmt = &mtk_video_formats[DEFAULT_OUT_FMT_IDX],
> -	.default_cap_fmt = &mtk_video_formats[DEFAULT_CAP_FMT_IDX],
> +	.num_formats = &num_formats,
> +	.default_out_fmt = &default_out_format,
> +	.default_cap_fmt = &default_cap_format,
>  	.vdec_framesizes = mtk_vdec_framesizes,
> -	.num_framesizes = NUM_SUPPORTED_FRAMESIZE,
> +	.num_framesizes = &num_framesizes,
>  	.uses_stateless_api = true,
>  	.worker = mtk_vdec_worker,
>  	.flush_decoder = mtk_vdec_flush_decoder,
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 9fcaf69549dd..270c73c05285 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -344,6 +344,15 @@ enum mtk_vdec_hw_arch {
>  	MTK_VDEC_LAT_SINGLE_CORE,
>  };
>  
> +/*
> + * struct mtk_vdec_format_types - Structure used to get supported
> + *		  format types according to decoder capability
> + */
> +enum mtk_vdec_format_types {
> +	MTK_VDEC_FORMAT_MM21 = 0x20,
> +	MTK_VDEC_FORMAT_H264_SLICE = 0x100,
> +};
> +
>  /**
>   * struct mtk_vcodec_dec_pdata - compatible data for each IC
>   * @init_vdec_params: init vdec params
> @@ -379,12 +388,12 @@ struct mtk_vcodec_dec_pdata {
>  	struct vb2_ops *vdec_vb2_ops;
>  
>  	const struct mtk_video_fmt *vdec_formats;
> -	const int num_formats;
> +	const int *num_formats;
>  	const struct mtk_video_fmt *default_out_fmt;
>  	const struct mtk_video_fmt *default_cap_fmt;
>  
>  	const struct mtk_codec_framesizes *vdec_framesizes;
> -	const int num_framesizes;
> +	const int *num_framesizes;
>  
>  	enum mtk_vdec_hw_arch hw_arch;
>  

