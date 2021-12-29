Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFC9481015
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 06:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B64710E252;
	Wed, 29 Dec 2021 05:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFA810E252
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 05:36:39 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id co15so17662353pjb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 21:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EVZZSsnSEbk7FiSuXX+j6iG5Lve1o+shP8m0TVPd8J8=;
 b=WsQpdWNkOJElVUBxeh5GzoA4UyY1aiQJlLuHojZ6bQZvDE5LeRnTfE0R4JryGCIPsd
 kku9tZLNxpWLlYnq01UZs7WKrRgq535q8NHUDrxwxrIIJ5ZcdnDIh6buMSm/wRS7cXaK
 adC5EF2/u6uO2INPoxF3WWe6G8nMZ/IiHlOxMb5OUDLSa9pQyL8t/n/O1OQhgdTk7KdX
 iDm5JUkuiQ6WE+1D26dnVcDwvo+JmKB91CN0yN+mBxh4Y1pjNnbKPRWYp8QAY13rKSkx
 UE6fDAPAzqEXvUwUmNG6sKbKhgE8HrGTHJrujglxxy4ckQUQpWaM3oSM/OAWjPMe9/7N
 3zqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EVZZSsnSEbk7FiSuXX+j6iG5Lve1o+shP8m0TVPd8J8=;
 b=8CL+x2fkV2cSl+jeNm5V/23RQvc2pe3ZfYI8Ru6H87BJpsWl1cSTnXN2p9cIlB15nt
 LTrrTn6HM3XXomOx6KqpV/rKg3hFzy04zHhfMxf4VQhh46wUvkVOh4WKrrv+/7L8PUSH
 2JncYvM9iUO6otBFrhE14Q5T41+vZe/8xTZ3V51JO1vVZkOa0zCCshanv0pxeBav2fqy
 c7v64OYEXQmHmGgnDQxP0Flatl9ET+NAwR2Mi2VuqUjtw0ALqSp+HHwhgX9s92HPkmXW
 hY2qHaKXOfCD4vxofpkHXMnUbHF16lT12CMpIz5IRqCQAiqvGVcCoY9UP98y8dwyWmJt
 exRw==
X-Gm-Message-State: AOAM531hrTStnXIpbiuz1ZwfMoB9Ni7gNTumuqYHo6SxT0oMdSphnfEv
 x+iNsZB+Fg5Ksu3H9mc9zthYSw==
X-Google-Smtp-Source: ABdhPJwEZCf+klU3yVnt1OAgcOs+vsB+j1kqeIrZKK1OcHaKrQKyI3nRkSTVgdzT2hb0Ehi2sQwGTQ==
X-Received: by 2002:a17:902:be0f:b0:149:5535:287b with SMTP id
 r15-20020a170902be0f00b001495535287bmr24413705pls.28.1640756198303; 
 Tue, 28 Dec 2021 21:36:38 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4dea:2b20:ea89:724b])
 by smtp.gmail.com with ESMTPSA id h17sm18129074pfv.217.2021.12.28.21.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 21:36:38 -0800 (PST)
Date: Wed, 29 Dec 2021 13:36:33 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v2, 03/12] media: mtk-vcodec: get capture queue buffer
 size from scp
Message-ID: <Ycvz4UrmbngVzIv2@google.com>
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
 <20211228094146.20505-4-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211228094146.20505-4-yunfei.dong@mediatek.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Steve Cho <stevecho@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Alexandre Courbot <acourbot@chromium.org>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 28, 2021 at 05:41:37PM +0800, Yunfei Dong wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
[...]
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> index 130ecef2e766..87891ebd7246 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> @@ -466,6 +466,8 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
>  			}
>  			ctx->state = MTK_STATE_INIT;
>  		}
> +	} else {
> +		ctx->capture_fourcc = fmt->fourcc;
>  	}
>  
>  	/*
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index a23a7646437c..95e07cf2cd3e 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -277,6 +277,7 @@ struct vdec_pic_info {
>   *		     to be used with encoder and stateful decoder.
>   * @is_flushing: set to true if flushing is in progress.
>   * @current_codec: current set input codec, in V4L2 pixel format
> + * @capture_fourcc: capture queue type in V4L2 pixel format
>   *
>   * @colorspace: enum v4l2_colorspace; supplemental to pixelformat
>   * @ycbcr_enc: enum v4l2_ycbcr_encoding, Y'CbCr encoding
> @@ -322,6 +323,7 @@ struct mtk_vcodec_ctx {
>  	bool is_flushing;
>  
>  	u32 current_codec;
> +	u32 capture_fourcc;

What is the purpose of capture_fourcc?  It is not used.

> +/**
> + * struct vdec_ap_ipi_get_param - for AP_IPIMSG_SET_PARAM
> + * @msg_id	: AP_IPIMSG_DEC_START
> + * @inst_id     : instance ID. Used if the ABI version >= 2.
> + * @data	: picture information
> + * @param_type	: get param type
> + * @codec_type	: Codec fourcc
> + */
> +struct vdec_ap_ipi_get_param {
> +	uint32_t msg_id;
> +	uint32_t inst_id;
> +	uint32_t data[4];
> +	uint32_t param_type;
> +	uint32_t codec_type;
> +};

Are AP_IPIMSG_SET_PARAM and AP_IPIMSG_DEC_START typos?

> +/**
> + * struct vdec_vpu_ipi_init_ack - for VPU_IPIMSG_DEC_INIT_ACK
> + * @msg_id	: VPU_IPIMSG_DEC_INIT_ACK
> + * @status	: VPU exeuction result
> + * @ap_inst_addr	: AP vcodec_vpu_inst instance address
> + * @data     : picture information from SCP.
> + * @param_type	: get param type
> + */
> +struct vdec_vpu_ipi_get_param_ack {
> +	uint32_t msg_id;
> +	int32_t status;
> +	uint64_t ap_inst_addr;
> +	uint32_t data[4];
> +	uint32_t param_type;
> +	uint32_t reserved;
> +};

Same here: is VPU_IPIMSG_DEC_INIT_ACK a typo?

What is the purpose of the "reserved" field?

> diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.c
[...]
> +static void handle_get_param_msg_ack(
> +	const struct vdec_vpu_ipi_get_param_ack *msg)
> +{
> +	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
> +					(unsigned long)msg->ap_inst_addr;

Does it really need to cast twice?

> +
> +	mtk_vcodec_debug(vpu, "+ ap_inst_addr = 0x%llx", msg->ap_inst_addr);
> +
> +	/* param_type is enum vdec_get_param_type */
> +	switch(msg->param_type) {
> +	case 2:

What is 2?  Is it GET_PARAM_PIC_INFO?

> +int vpu_dec_get_param(struct vdec_vpu_inst *vpu, uint32_t *data,
> +	unsigned int len, unsigned int param_type)
> +{
> +	struct vdec_ap_ipi_get_param msg;
> +	int i;
> +	int err;
> +
> +	mtk_vcodec_debug_enter(vpu);
> +
> +	if (len > ARRAY_SIZE(msg.data)) {
> +		mtk_vcodec_err(vpu, "invalid len = %d\n", len);
> +		return -EINVAL;
> +	}
> +
> +	memset(&msg, 0, sizeof(msg));
> +	msg.msg_id = AP_IPIMSG_DEC_GET_PARAM;
> +	msg.inst_id = vpu->inst_id;
> +	for (i = 0; i < len; i++)
> +		msg.data[i] = data[i];

Would it be more concise if using memcpy?

> diff --git a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> index 4cb3c7f5a3ad..963f8d4877b7 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> +++ b/drivers/media/platform/mtk-vcodec/vdec_vpu_if.h
> @@ -28,6 +28,8 @@ struct mtk_vcodec_ctx;
>   * @wq          : wait queue to wait VPU message ack
>   * @handler     : ipi handler for each decoder
>   * @codec_type     : use codec type to separate different codecs
> + * @capture_type    : used capture type to separate different capture format
> + * @fb_sz  : frame buffer size of each plane
>   */
>  struct vdec_vpu_inst {
>  	int id;
> @@ -42,6 +44,8 @@ struct vdec_vpu_inst {
>  	wait_queue_head_t wq;
>  	mtk_vcodec_ipi_handler handler;
>  	unsigned int codec_type;
> +	unsigned int capture_type;
> +	unsigned int fb_sz[2];
>  };

capture_type is not used in the patch.

Does fb_sz take effect in later patches?
