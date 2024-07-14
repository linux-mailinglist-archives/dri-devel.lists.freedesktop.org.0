Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642B2930837
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jul 2024 03:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097EB10E060;
	Sun, 14 Jul 2024 01:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pMC5LzUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE4C10E0C8
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2024 01:37:44 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-5ca9835db95so1837713eaf.3
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2024 18:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720921063; x=1721525863; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NkkPlnzI7f+qQKC1m7qqtAGk1jqbVPd0COHuqZug0WY=;
 b=pMC5LzUPJ+1+Pbv/ibvzT4svoH40yWQwXEPMlixfUZbVPvlzAg7tOJ+SFrhv3nzmZH
 NSjqhhYZC5zAlzcGsKzIAz5tThc4R644XAO/kj/bTDcgBtt907/uXt3VYrZYmEWbQl+D
 ULa0StvPjYczgn6VwsLif2AbUBl5YXu33Jwcz+xc4AhHLdP6y8uu2VzDR246jXtvP6IA
 RCSIqW99Npbcfc3aLZThutLVBrvBJrd4e+aXaNqZ3m3PLslzoDUZfpJd2a+vyhB3Emi8
 0mysbEI+37ZMD9aBrH7UuoZsozrrcqlAnWRZ27iL1gODpJoL0BH6PM6ICPTstbyFPZDk
 GWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720921063; x=1721525863;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NkkPlnzI7f+qQKC1m7qqtAGk1jqbVPd0COHuqZug0WY=;
 b=UuKgBk8li+FzPo+hHGWTih2ulW3WtkdQTFv9pPly6z91yXtfWzL6VAJKZMOGL/KF7M
 7SPHnJ2UfQP+y5GPuc0UUnNHms/ZNpdukV2FhQTJ8ybAHCXeCCjrB5nCF//qTBEBIhkw
 UrabJAu0Jp5OeA5VZrVOVYn86gwRWvo8/jjSNC+gz2F8n783s7AASqVPjPi355ID8zcN
 s+sVmeSOSdlIk386pJNIChSmF2+ARQvyp3MB0clmEGsDVQ6RbtM0CaiBAECwLnqYd/zK
 lmLU3hLw7RWtJbBDeJRjzj8pSzXNujjWev3hBcQPPzqnK0E3SG8yOiOq3bQwp9fTc4Nm
 jpZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8K4bM9IRqsD198jVAvvGy6yksH+AiIqjmtJyvE9FGccq1U259U/6dc6nAlsiwXwSdiFrIndS1ul390kEbxBJgM6jrNvNEyWx/fSedOoGp
X-Gm-Message-State: AOJu0YxuOwNnMRMoCAx+Qip05R0T1O8NSHJQ5/dURmpY/tFMLL/AEGmx
 hetsMJknN0gPEXs+4db6wqNAKzLxM3eK0i2z18BYNV1ST3NwbiTVz5GzvMvniIs=
X-Google-Smtp-Source: AGHT+IEzQnaTQ+Pu4qAlZFzP3hWTzj2x4i5JRUt3MAcUsxqNIfhdGFun/+zNguBPpwhqoOWKVFDSyg==
X-Received: by 2002:a05:6820:2686:b0:5c4:57b6:ffbf with SMTP id
 006d021491bc7-5cce0a4d350mr7394313eaf.0.1720921063514; 
 Sat, 13 Jul 2024 18:37:43 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5ce753d1a3dsm360634eaf.12.2024.07.13.18.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 18:37:43 -0700 (PDT)
Date: Sat, 13 Jul 2024 20:37:41 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-media@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] media: imx: vdic: Introduce mem2mem VDI deinterlacer
 driver
Message-ID: <9f4cd132-6a4d-413a-badb-19e9f988c9a1@suswa.mountain>
References: <20240713154934.109318-1-marex@denx.de>
 <20240713154934.109318-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240713154934.109318-2-marex@denx.de>
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

On Sat, Jul 13, 2024 at 05:48:02PM +0200, Marek Vasut wrote:
> diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
> index be54dca11465d..b75eec4513eab 100644
> --- a/drivers/staging/media/imx/imx-media-dev.c
> +++ b/drivers/staging/media/imx/imx-media-dev.c
> @@ -57,7 +57,47 @@ static int imx6_media_probe_complete(struct v4l2_async_notifier *notifier)
>  		goto unlock;
>  	}
>  
> +	imxmd->m2m_vdic[0] = imx_media_mem2mem_vdic_init(imxmd, 0);
> +	if (IS_ERR(imxmd->m2m_vdic[0])) {
> +		ret = PTR_ERR(imxmd->m2m_vdic[0]);
> +		imxmd->m2m_vdic[0] = NULL;
> +		goto unlock;
> +	}
> +
> +	/* MX6S/DL has one IPUv3, init second VDI only on MX6Q/QP */
> +	if (imxmd->ipu[1]) {
> +		imxmd->m2m_vdic[1] = imx_media_mem2mem_vdic_init(imxmd, 1);
> +		if (IS_ERR(imxmd->m2m_vdic[1])) {
> +			ret = PTR_ERR(imxmd->m2m_vdic[1]);
> +			imxmd->m2m_vdic[1] = NULL;
> +			goto unlock;


There should be some clean up on this error path.  Ideally
imx_media_mem2mem_vdic_init() would have a matching uninit() function
we could call.

> +		}
> +	}
> +
>  	ret = imx_media_csc_scaler_device_register(imxmd->m2m_vdev);
> +	if (ret)
> +		goto unlock;
> +
> +	ret = imx_media_mem2mem_vdic_register(imxmd->m2m_vdic[0]);
> +	if (ret)
> +		goto unreg_csc;
> +
> +	/* MX6S/DL has one IPUv3, init second VDI only on MX6Q/QP */
> +	if (imxmd->ipu[1]) {
> +		ret = imx_media_mem2mem_vdic_register(imxmd->m2m_vdic[1]);
> +		if (ret)
> +			goto unreg_vdic;
> +	}
> +
> +	mutex_unlock(&imxmd->mutex);
> +	return ret;

return 0;

> +
> +unreg_vdic:
> +	imx_media_mem2mem_vdic_unregister(imxmd->m2m_vdic[0]);
> +	imxmd->m2m_vdic[0] = NULL;
> +unreg_csc:
> +	imx_media_csc_scaler_device_unregister(imxmd->m2m_vdev);
> +	imxmd->m2m_vdev = NULL;
>  unlock:
>  	mutex_unlock(&imxmd->mutex);
>  	return ret;

[ snip ]

> +static void ipu_mem2mem_vdic_device_run(void *_ctx)
> +{
> +	struct ipu_mem2mem_vdic_ctx *ctx = _ctx;
> +	struct ipu_mem2mem_vdic_priv *priv = ctx->priv;
> +	struct vb2_v4l2_buffer *curr_buf, *dst_buf;
> +	dma_addr_t prev_phys, curr_phys, out_phys;
> +	struct v4l2_pix_format *infmt;
> +	u32 phys_offset = 0;
> +	unsigned long flags;
> +	int ret;
> +
> +	infmt = ipu_mem2mem_vdic_get_format(priv, V4L2_BUF_TYPE_VIDEO_OUTPUT);
> +	if (V4L2_FIELD_IS_SEQUENTIAL(infmt->field))
> +		phys_offset = infmt->sizeimage / 2;
> +	else if (V4L2_FIELD_IS_INTERLACED(infmt->field))
> +		phys_offset = infmt->bytesperline;
> +	else
> +		dev_err(priv->dev, "Invalid field %d\n", infmt->field);
> +
> +	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +	out_phys = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
> +
> +	curr_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +	if (!curr_buf) {
> +		dev_err(priv->dev, "Not enough buffers %d\n", ret);

ret is uninitialized.  Just delete it.

> +		return;
> +	}
> +
> +	spin_lock_irqsave(&priv->irqlock, flags);
> +
> +	if (ctx->curr_buf) {
> +		ctx->prev_buf = ctx->curr_buf;
> +		ctx->curr_buf = curr_buf;
> +	} else {
> +		ctx->prev_buf = curr_buf;
> +		ctx->curr_buf = curr_buf;
> +		dev_warn(priv->dev, "Single-buffer mode, fix your userspace\n");
> +	}
> +
> +	prev_phys = vb2_dma_contig_plane_dma_addr(&ctx->prev_buf->vb2_buf, 0);
> +	curr_phys = vb2_dma_contig_plane_dma_addr(&ctx->curr_buf->vb2_buf, 0);
> +
> +	priv->curr_ctx = ctx;
> +	spin_unlock_irqrestore(&priv->irqlock, flags);
> +
> +	ipu_cpmem_set_buffer(priv->vdi_out_ch,  0, out_phys);
> +	ipu_cpmem_set_buffer(priv->vdi_in_ch_p, 0, prev_phys + phys_offset);
> +	ipu_cpmem_set_buffer(priv->vdi_in_ch,   0, curr_phys);
> +	ipu_cpmem_set_buffer(priv->vdi_in_ch_n, 0, curr_phys + phys_offset);
> +
> +	/* No double buffering, always pick buffer 0 */
> +	ipu_idmac_select_buffer(priv->vdi_out_ch, 0);
> +	ipu_idmac_select_buffer(priv->vdi_in_ch_p, 0);
> +	ipu_idmac_select_buffer(priv->vdi_in_ch, 0);
> +	ipu_idmac_select_buffer(priv->vdi_in_ch_n, 0);
> +
> +	/* Enable the channels */
> +	ipu_idmac_enable_channel(priv->vdi_out_ch);
> +	ipu_idmac_enable_channel(priv->vdi_in_ch_p);
> +	ipu_idmac_enable_channel(priv->vdi_in_ch);
> +	ipu_idmac_enable_channel(priv->vdi_in_ch_n);
> +}

[ snip ]

> +static int ipu_mem2mem_vdic_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
> +					unsigned int *nplanes, unsigned int sizes[],
> +					struct device *alloc_devs[])
> +{
> +	struct ipu_mem2mem_vdic_ctx *ctx = vb2_get_drv_priv(vq);
> +	struct ipu_mem2mem_vdic_priv *priv = ctx->priv;
> +	struct v4l2_pix_format *fmt = ipu_mem2mem_vdic_get_format(priv, vq->type);
> +	unsigned int count = *nbuffers;
> +
> +	*nbuffers = count;

count and *nbuffers are the same already.  Delete this statement.

> +
> +	if (*nplanes)
> +		return sizes[0] < fmt->sizeimage ? -EINVAL : 0;
> +
> +	*nplanes = 1;
> +	sizes[0] = fmt->sizeimage;
> +
> +	dev_dbg(ctx->priv->dev, "get %d buffer(s) of size %d each.\n",
                                     ^^
%u for unsigned int.

> +		count, fmt->sizeimage);
> +
> +	return 0;
> +}

[ snip ]

> +static int ipu_mem2mem_vdic_get_ipu_resources(struct ipu_mem2mem_vdic_priv *priv,
> +					      struct video_device *vfd)
> +{
> +	char *nfbname, *eofname;
> +	int ret;
> +
> +	nfbname = devm_kasprintf(priv->dev, GFP_KERNEL, "%s_nfb4eof:%u",
> +				 vfd->name, priv->ipu_id);
> +	if (!nfbname)
> +		return -ENOMEM;
> +
> +	eofname = devm_kasprintf(priv->dev, GFP_KERNEL, "%s_eof:%u",
> +				 vfd->name, priv->ipu_id);
> +	if (!eofname)
> +		goto err_eof;
> +
> +	priv->vdi = ipu_vdi_get(priv->ipu_dev);
> +	if (IS_ERR(priv->vdi)) {
> +		ret = PTR_ERR(priv->vdi);
> +		goto err_vdi;
> +	}
> +
> +	priv->ic = ipu_ic_get(priv->ipu_dev, IC_TASK_VIEWFINDER);
> +	if (IS_ERR(priv->ic)) {
> +		ret = PTR_ERR(priv->ic);
> +		goto err_ic;
> +	}
> +
> +	priv->vdi_in_ch_p = ipu_idmac_get(priv->ipu_dev,
> +					  IPUV3_CHANNEL_MEM_VDI_PREV);
> +	if (IS_ERR(priv->vdi_in_ch_p)) {
> +		ret = PTR_ERR(priv->vdi_in_ch_p);
> +		goto err_prev;
> +	}
> +
> +	priv->vdi_in_ch = ipu_idmac_get(priv->ipu_dev,
> +					IPUV3_CHANNEL_MEM_VDI_CUR);
> +	if (IS_ERR(priv->vdi_in_ch)) {
> +		ret = PTR_ERR(priv->vdi_in_ch);
> +		goto err_curr;
> +	}
> +
> +	priv->vdi_in_ch_n = ipu_idmac_get(priv->ipu_dev,
> +					  IPUV3_CHANNEL_MEM_VDI_NEXT);
> +	if (IS_ERR(priv->vdi_in_ch_n)) {
> +		ret = PTR_ERR(priv->vdi_in_ch_n);
> +		goto err_next;
> +	}
> +
> +	priv->vdi_out_ch = ipu_idmac_get(priv->ipu_dev,
> +					 IPUV3_CHANNEL_IC_PRP_VF_MEM);
> +	if (IS_ERR(priv->vdi_out_ch)) {
> +		ret = PTR_ERR(priv->vdi_out_ch);
> +		goto err_out;
> +	}
> +
> +	priv->nfb4eof_irq = ipu_idmac_channel_irq(priv->ipu_dev,
> +						  priv->vdi_out_ch,
> +						  IPU_IRQ_NFB4EOF);
> +	ret = devm_request_irq(priv->dev, priv->nfb4eof_irq,
> +			       ipu_mem2mem_vdic_nfb4eof_interrupt, 0,
> +			       nfbname, priv);
> +	if (ret)
> +		goto err_irq_nfb4eof;
> +
> +	priv->eof_irq = ipu_idmac_channel_irq(priv->ipu_dev,
> +					      priv->vdi_out_ch,
> +					      IPU_IRQ_EOF);
> +	ret = devm_request_irq(priv->dev, priv->eof_irq,
> +			       ipu_mem2mem_vdic_eof_interrupt, 0,
> +			       eofname, priv);
> +	if (ret)
> +		goto err_irq_eof;
> +
> +	/*
> +	 * Enable PRG, without PRG clock enabled (CCGR6:prg_clk_enable[0]
> +	 * and CCGR6:prg_clk_enable[1]), the VDI does not produce any
> +	 * interrupts at all.
> +	 */
> +	if (ipu_prg_present(priv->ipu_dev))
> +		ipu_prg_enable(priv->ipu_dev);
> +
> +	return 0;
> +
> +err_irq_eof:
> +	devm_free_irq(priv->dev, priv->nfb4eof_irq, priv);
        ^^^^

> +err_irq_nfb4eof:
> +	ipu_idmac_put(priv->vdi_out_ch);
> +err_out:
> +	ipu_idmac_put(priv->vdi_in_ch_n);
> +err_next:
> +	ipu_idmac_put(priv->vdi_in_ch);
> +err_curr:
> +	ipu_idmac_put(priv->vdi_in_ch_p);
> +err_prev:
> +	ipu_ic_put(priv->ic);
> +err_ic:
> +	ipu_vdi_put(priv->vdi);
> +err_vdi:
> +	devm_kfree(priv->dev, eofname);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> +err_eof:
> +	devm_kfree(priv->dev, nfbname);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Any time we call devm_kfree() it's a red flag.  Sometimes it makes sense
but I haven't looked at it closely enough to see how it makes sense
here.  Is it an ordering issue where we had to do devm_free_irq() and
then we just freed oefname and nfbname for consistency and because why
not?


> +	return ret;
> +}
> +
> +static void ipu_mem2mem_vdic_put_ipu_resources(struct ipu_mem2mem_vdic_priv *priv)
> +{
> +	devm_free_irq(priv->dev, priv->eof_irq, priv);
> +	devm_free_irq(priv->dev, priv->nfb4eof_irq, priv);
> +	ipu_idmac_put(priv->vdi_out_ch);
> +	ipu_idmac_put(priv->vdi_in_ch_n);
> +	ipu_idmac_put(priv->vdi_in_ch);
> +	ipu_idmac_put(priv->vdi_in_ch_p);
> +	ipu_ic_put(priv->ic);
> +	ipu_vdi_put(priv->vdi);
> +}
> +
> +int imx_media_mem2mem_vdic_register(struct imx_media_video_dev *vdev)
> +{
> +	struct ipu_mem2mem_vdic_priv *priv = to_mem2mem_priv(vdev);
> +	struct video_device *vfd = vdev->vfd;
> +	int ret;
> +
> +	vfd->v4l2_dev = &priv->md->v4l2_dev;
> +
> +	ret = ipu_mem2mem_vdic_get_ipu_resources(priv, vfd);
> +	if (ret) {
> +		v4l2_err(vfd->v4l2_dev, "Failed to get VDIC resources (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		v4l2_err(vfd->v4l2_dev, "Failed to register video device\n");

Probably should call ipu_mem2mem_vdic_put_ipu_resources() on this error
path?

> +		return ret;
> +	}
> +
> +	v4l2_info(vfd->v4l2_dev, "Registered %s as /dev/%s\n", vfd->name,
> +		  video_device_node_name(vfd));
> +
> +	return 0;
> +}
> +
> +void imx_media_mem2mem_vdic_unregister(struct imx_media_video_dev *vdev)
> +{
> +	struct ipu_mem2mem_vdic_priv *priv = to_mem2mem_priv(vdev);
> +	struct video_device *vfd = priv->vdev.vfd;
> +
> +	video_unregister_device(vfd);
> +
> +	ipu_mem2mem_vdic_put_ipu_resources(priv);
> +}
> +
> +struct imx_media_video_dev *
> +imx_media_mem2mem_vdic_init(struct imx_media_dev *md, int ipu_id)
> +{
> +	struct ipu_mem2mem_vdic_priv *priv;
> +	struct video_device *vfd;
> +	int ret;
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return ERR_PTR(-ENOMEM);
> +
> +	priv->md = md;
> +	priv->ipu_id = ipu_id;
> +	priv->ipu_dev = md->ipu[ipu_id];
> +	priv->dev = md->md.dev;
> +
> +	mutex_init(&priv->mutex);
> +
> +	vfd = video_device_alloc();
> +	if (!vfd) {
> +		ret = -ENOMEM;
> +		goto err_vfd;
> +	}
> +
> +	*vfd = mem2mem_template;
> +	vfd->lock = &priv->mutex;
> +	priv->vdev.vfd = vfd;
> +
> +	INIT_LIST_HEAD(&priv->vdev.list);
> +	spin_lock_init(&priv->irqlock);
> +	atomic_set(&priv->stream_count, 0);
> +
> +	video_set_drvdata(vfd, priv);
> +
> +	priv->m2m_dev = v4l2_m2m_init(&m2m_ops);
> +	if (IS_ERR(priv->m2m_dev)) {
> +		ret = PTR_ERR(priv->m2m_dev);
> +		v4l2_err(&md->v4l2_dev, "Failed to init mem2mem device: %d\n",
> +			 ret);
> +		goto err_m2m;
> +	}
> +
> +	/* Reset formats */
> +	priv->fmt[V4L2_M2M_SRC] = ipu_mem2mem_vdic_default;
> +	priv->fmt[V4L2_M2M_SRC].pixelformat = V4L2_PIX_FMT_YUV420;
> +	priv->fmt[V4L2_M2M_SRC].field = V4L2_FIELD_SEQ_TB;
> +	priv->fmt[V4L2_M2M_SRC].bytesperline = DEFAULT_WIDTH;
> +	priv->fmt[V4L2_M2M_SRC].sizeimage = DEFAULT_WIDTH * DEFAULT_HEIGHT * 3 / 2;
> +
> +	priv->fmt[V4L2_M2M_DST] = ipu_mem2mem_vdic_default;
> +	priv->fmt[V4L2_M2M_DST].pixelformat = V4L2_PIX_FMT_RGB565;
> +	priv->fmt[V4L2_M2M_DST].field = V4L2_FIELD_NONE;
> +	priv->fmt[V4L2_M2M_DST].bytesperline = DEFAULT_WIDTH * 2;
> +	priv->fmt[V4L2_M2M_DST].sizeimage = DEFAULT_WIDTH * DEFAULT_HEIGHT * 2;
> +
> +	return &priv->vdev;
> +
> +err_m2m:
> +	video_set_drvdata(vfd, NULL);

video_device_release(vfd)

regards,
dan carpenter

> +err_vfd:
> +	kfree(priv);
> +	return ERR_PTR(ret);
> +}


