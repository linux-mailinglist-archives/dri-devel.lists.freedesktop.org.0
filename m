Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEB454F12C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 08:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6892C11A671;
	Fri, 17 Jun 2022 06:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE06F11A671
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 06:46:24 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id 187so3404966pfu.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 23:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=fQNGQ/zJse2gbHWfa6pF660SRacSRW0Fy9uu/huJD4Y=;
 b=JPLW1+w8/z8WGKViSxKlFYB1DJFO5f4d4rwynmLj7wx/0qK2bG0tNVGdJOrTjCJVPW
 d0ZiMJQDidl1w4ljJIZMpCkOlhOZkW6+5BzSe4i3dZhcyh+oDngZ/gJaVlL8+QGNmUTL
 nqKpdtg55DdMsoRsLoHIj2LgXDVZ6dwdIBG8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fQNGQ/zJse2gbHWfa6pF660SRacSRW0Fy9uu/huJD4Y=;
 b=0rcI2SjtCfMcpLRHrc+MZcmDv63XxDiA7cU/PtFHrXiobhn9y/kmRXpkAoBnNhOQs3
 Mgxq05M8xk2a5y8PoNX/+SRs780BFzMVbGxhWwmeeNoagGL63HMEAVqsoLcF4xI0QgI3
 0nvdsgbViy1WLkai1OIQ4PpZ658+otfAGD/cBt/Z0xP8m+dV1cBB56dLt2aOHo9kqJhq
 cEH+aL78MtyVV/Xz2akHI36+Q6D6FWA7sCbafl4Tz6zI0P0ak3w2UmEH8cUnPXRs/kxM
 o+SCa1GQU/HyhETtvTBk5nc3IzhvpA6WaL6qirt+GT2CxkLeRkNIG/gPhFAdCvtCOPCD
 tV5g==
X-Gm-Message-State: AJIora8zGstmAufbrIlKeykz9uFQyaepvYmQIy6mD6WllzsEIyOi4HxZ
 AFAS4rz5z4Dioi26p3aWOiYTCFEsG1chQA==
X-Google-Smtp-Source: AGRyM1uENT2OwXii6KksNBQ4MXQhZdrl+ulN/85OXID2dCsUxVB+lOZD0za0PfnLmxj1+jHPwjAROA==
X-Received: by 2002:a63:80c8:0:b0:405:186f:fa39 with SMTP id
 j191-20020a6380c8000000b00405186ffa39mr7960592pgd.84.1655448384322; 
 Thu, 16 Jun 2022 23:46:24 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:e12:c024:d152:7ca])
 by smtp.gmail.com with ESMTPSA id
 fs20-20020a17090af29400b001ea75a02805sm4833237pjb.52.2022.06.16.23.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 23:46:23 -0700 (PDT)
Date: Fri, 17 Jun 2022 14:46:18 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: Re: [PATCH v7, 04/15] media: mtk-vcodec: Read max resolution from
 dec_capability
Message-ID: <YqwjOurt2DCV6snP@google.com>
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
 <20220223034008.15781-5-yunfei.dong@mediatek.com>
 <cb7cf296bc7df7334f55cc51ef11b671572559ac.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb7cf296bc7df7334f55cc51ef11b671572559ac.camel@ndufresne.ca>
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
 Yunfei Dong <yunfei.dong@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Tomasz Figa <tfiga@google.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Alexandre Courbot <acourbot@chromium.org>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Feb 28, 2022 at 04:29:15PM -0500, Nicolas Dufresne wrote:
> Hi Yunfei,
> 
> this patch does not work unless userland calls enum_framesizes, which is
> completely optional. See comment and suggestion below.
> 
> Le mercredi 23 février 2022 à 11:39 +0800, Yunfei Dong a écrit :
> > Supported max resolution for different platforms are not the same: 2K
> > or 4K, getting it according to dec_capability.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > Reviewed-by: Tzung-Bi Shih<tzungbi@google.com>
> > ---
> >  .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 29 +++++++++++--------
> >  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  4 +++
> >  2 files changed, 21 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > index 130ecef2e766..304f5afbd419 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> > @@ -445,7 +447,7 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
> >  		return -EINVAL;
> >  
> >  	q_data->fmt = fmt;
> > -	vidioc_try_fmt(f, q_data->fmt);
> > +	vidioc_try_fmt(ctx, f, q_data->fmt);
> >  	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> >  		q_data->sizeimage[0] = pix_mp->plane_fmt[0].sizeimage;
> >  		q_data->coded_width = pix_mp->width;
> > @@ -545,6 +547,9 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
> >  				fsize->stepwise.min_height,
> >  				fsize->stepwise.max_height,
> >  				fsize->stepwise.step_height);
> > +
> > +		ctx->max_width = fsize->stepwise.max_width;
> > +		ctx->max_height = fsize->stepwise.max_height;
> 
> The spec does not require calling enum_fmt, so changing the maximum here is
> incorrect (and fail with GStreamer). If userland never enum the framesizes, the
> resolution get limited to 1080p.
> 
> As this only depends and the OUTPUT format and the device being open()
> (condition being dev_capability being set and OUTPUT format being known / not
> VP8), you could initialize the cxt max inside s_fmt(OUTPUT) instead, which is a
> mandatory call. I have tested this change to verify this:
> 
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> index 044e3dfbdd8c..3e7c571526a4 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> @@ -484,6 +484,14 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
>  	if (fmt == NULL)
>  		return -EINVAL;
>  
> +	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
> +	    !(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED) &&
> +	    fmt->fourcc != V4L2_PIX_FMT_VP8_FRAME) {
> +		mtk_v4l2_debug(3, "4K is enabled");
> +		ctx->max_width = VCODEC_DEC_4K_CODED_WIDTH;
> +		ctx->max_height = VCODEC_DEC_4K_CODED_HEIGHT;
> +	}
> +
>  	q_data->fmt = fmt;
>  	vidioc_try_fmt(ctx, f, q_data->fmt);
>  	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
> @@ -574,15 +582,9 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
>  
>  		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
>  		fsize->stepwise = dec_pdata->vdec_framesizes[i].stepwise;
> -		if (!(ctx->dev->dec_capability &
> -				VCODEC_CAPABILITY_4K_DISABLED) &&
> -				fsize->pixel_format != V4L2_PIX_FMT_VP8_FRAME) {
> -			mtk_v4l2_debug(3, "4K is enabled");
> -			fsize->stepwise.max_width =
> -					VCODEC_DEC_4K_CODED_WIDTH;
> -			fsize->stepwise.max_height =
> -					VCODEC_DEC_4K_CODED_HEIGHT;
> -		}
> +		fsize->stepwise.max_width = ctx->max_width;
> +		fsize->stepwise.max_height = ctx->max_height;
> +

Recent testing on ChromeOS suggests this doesn't work. The spec implies
that querying capabilities could happen before the output format is set.
And also, supported frame sizes are detected for each given format,
which may not be the one current set.

So the if block above has to be reintroduced in some form. I'll take a
look at this.


Regards
ChenYu

>  		mtk_v4l2_debug(1, "%x, %d %d %d %d %d %d",
>  				ctx->dev->dec_capability,
>  				fsize->stepwise.min_width,
> @@ -592,8 +594,6 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
>  				fsize->stepwise.max_height,
>  				fsize->stepwise.step_height);
>  
> -		ctx->max_width = fsize->stepwise.max_width;
> -		ctx->max_height = fsize->stepwise.max_height;
>  		return 0;
>  	}
>  
> 
> 
> >  		return 0;
> >  	}
> >  

[...]

