Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D69FB44449A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 16:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8030F736B9;
	Wed,  3 Nov 2021 15:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1B4736B9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 15:23:42 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id ay20so2625910qkb.7
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Nov 2021 08:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=yNC62w+2HzH2SSJhKHtvCjiHcp3DcKu13in8YXC3L58=;
 b=M+/I/5Hft2NlUO4i9S63IGXtD51pzlQDc0ULTbi6L/ghNtnKUooxVNq/SoYMwi/zvp
 3ahh0cL98Kl38mypdfi39VAQKnvM/O3y38/UAns84MaTzcyyJ+7s6fg16KXNdcyRBZdT
 FwODxzltEwj1ZghagD2B9aw/e/BwPbzu9QAVS5hZ0zT4PepwV/BfoXga0U50Xa5fQyN4
 2hBub2Hq19bZtgvlv6/vmGGs+wyeckvmviP0QMeRRaep6xcFXm1e+zgC9ZiHl4l4Rc94
 bNvoyhpmW60gS7MVRSnt79hvX7pZnMn8yVimbCbRD8Gq1xatvxtdtWw8ZjwfynRbIXCP
 rhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=yNC62w+2HzH2SSJhKHtvCjiHcp3DcKu13in8YXC3L58=;
 b=uNpQFg8rOU3KURo9ZHtwTXGCikpjOF+nC+0MWXKVa0Ki2xgxR956uI/An0dG1/f/N3
 laCtQTrHwSuPzUcS39e1regEapa0C77NmPW4AQHsaP+YiSB//pEsAed8vdRzywLksV0q
 NHgLN4WQhmuVnYRLFROu6kEUVqssr3obyRpf+UjR2U6RuCjunmlrmxu2R7f4gMaE+bWU
 +7N2mDqC4ta94vXwB06jM6BZwSvO2eGzzX5xyHRXFew4sqj3CkEvFyYqB6Gzj95zsgiB
 PV1tXj5GiXgQm75iUk31EMp0aLVSI2w6w0gC8X1oOR+Dz/AluhtDYJ+tbGN7T1tTVOQf
 mK0A==
X-Gm-Message-State: AOAM531RAOqBn7dNPc2LOn9TtcLSWFTbuVfhGYEU7HJXn7gZop0fQkoo
 J3WfyrRVAfAVNHHaUAtLAjfTCw==
X-Google-Smtp-Source: ABdhPJy4df7FJ5jzZA9CX3XJtZc5nqiiuNWg/WwEWiY+wux4cxWLrQ/cnNXjtkeLmUJr9/v8V9RPUQ==
X-Received: by 2002:a05:620a:2f4:: with SMTP id
 a20mr12095070qko.123.1635953020908; 
 Wed, 03 Nov 2021 08:23:40 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
 by smtp.gmail.com with ESMTPSA id
 m20sm1736604qkp.57.2021.11.03.08.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:23:40 -0700 (PDT)
Message-ID: <b398917ca0c467d83c795f02f751609a52d56edb.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: mtk-vcodec: Align width and height to 64 bytes
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Steve Cho <stevecho@google.com>,
 Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>,  Tiffany
 Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Wed, 03 Nov 2021 11:23:38 -0400
In-Reply-To: <20211103033708.14469-1-yunfei.dong@mediatek.com>
References: <20211103033708.14469-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0 (3.42.0-1.fc35) 
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
Cc: Irui Wang <irui.wang@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le mercredi 03 novembre 2021 à 11:37 +0800, Yunfei Dong a écrit :
> Width and height need to 64 bytes aligned when setting the format.
> Need to make sure all is 64 bytes align when use width and height to
> calculate buffer size.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Change-Id: I39886b1a6b433c92565ddbf297eb193456eec1d2

Perhaps avoid this tag later ? Another perhaps, there is a tag to indicate which
patch introduce that bug, if you add this tag, the patch will be automatically
backported into relevant stable kernel. The format is:

> Fixes: <short-hash> ("<short commit description")

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h        | 1 +
>  drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> index e30806c1faea..66cd6d2242c3 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> @@ -11,6 +11,7 @@
>  #include <media/videobuf2-core.h>
>  #include <media/v4l2-mem2mem.h>
>  
> +#define VCODEC_DEC_ALIGNED_64 64
>  #define VCODEC_CAPABILITY_4K_DISABLED	0x10
>  #define VCODEC_DEC_4K_CODED_WIDTH	4096U
>  #define VCODEC_DEC_4K_CODED_HEIGHT	2304U
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> index d402fc4bda69..e1a3011772a9 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> @@ -562,8 +562,8 @@ static void get_pic_info(struct vdec_h264_slice_inst *inst,
>  {
>  	struct mtk_vcodec_ctx *ctx = inst->ctx;
>  
> -	ctx->picinfo.buf_w = (ctx->picinfo.pic_w + 15) & 0xFFFFFFF0;
> -	ctx->picinfo.buf_h = (ctx->picinfo.pic_h + 31) & 0xFFFFFFE0;
> +	ctx->picinfo.buf_w = ALIGN(ctx->picinfo.pic_w, VCODEC_DEC_ALIGNED_64);
> +	ctx->picinfo.buf_h = ALIGN(ctx->picinfo.pic_h, VCODEC_DEC_ALIGNED_64);
>  	ctx->picinfo.fb_sz[0] = ctx->picinfo.buf_w * ctx->picinfo.buf_h;
>  	ctx->picinfo.fb_sz[1] = ctx->picinfo.fb_sz[0] >> 1;
>  	inst->vsi_ctx.dec.cap_num_planes =

