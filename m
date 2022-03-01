Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985304C93D9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 20:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F2D10E2F6;
	Tue,  1 Mar 2022 19:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77AC510E2F6
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 19:02:24 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id n185so13712265qke.5
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 11:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=GsGl1dGldgnpdLEXcvxrxYAF/SUgWFg5pNG0AUKw04w=;
 b=v5QG28VLIZmA6C+9VU64CfSfh9FZ13n2yEH89RDA/5CBUpVZQ6ZijmlreX4/EXQMrP
 dFKg1MxqW13FfKMGIq81pTFUPEEQNIv92eat+lBY0ISh7pgFQd8V9lQrQt7Vp6SwVr0F
 P3YdCNICRmkCtBsdq2cantzryx93X8fr91clLV8S81Xs4f1eyVL1TV+Ide4FznDwmJTO
 3iXMvrZtgPOZjcPX4qKd5C0Ju4QlRA62+nmhwW0FlYQNeMzy4PYj5oS3SPKCzAW7Tsf0
 5hGvQU6x5Fd+AEaDjpN5WIb3SmB9S4DAFdcJuxbm2mmAlmRPbqRm/0e41O2jbrBmyz93
 As0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=GsGl1dGldgnpdLEXcvxrxYAF/SUgWFg5pNG0AUKw04w=;
 b=aec3A3zaI0feCeqD3/WzM22ARwGj2Hrnu4S6QFtd2XwRMD6qneUVW/822toAPmYpXS
 nOCsS1ITsOeh+EL1BOBcm6JS+A38Tl4evGiy9Yr7r+bjRq8GjOVyKeeumqiHAN7ZwLDZ
 afs08wc++r8V/v8RSjd35S20CKjAHVhNH7YpxbjOIHTIfOZhl9D0Et+LOIzsCaQHioYY
 v0FVlyJDOgsaXnUFeyMBOQVKXb4f1jaG6G40QRjurkz9mNsWAKhyxBSrL8Ui32mQP0HP
 W/JdMn2LV4MhVqpZxX1Hkuml3+TM0z8hdK4e/ERosEpztOdqLIXN1qSwloFjbOvp/PjI
 +9Sw==
X-Gm-Message-State: AOAM533/TveOlIK1FTAREXHbEXti02JUO89/ndDK8efVd0SoWGrCDyjh
 a9YUURQ0tI4bpQp3OQATUiYWYg==
X-Google-Smtp-Source: ABdhPJzpmA5uFIaU8OToNP2i0XOhvtLd6r7cnQbc8qnuHs7rV4wShM354MApuOXKlSpD/7rOLJGNhg==
X-Received: by 2002:a05:620a:22a6:b0:662:e97d:c7bc with SMTP id
 p6-20020a05620a22a600b00662e97dc7bcmr6914032qkh.486.1646161343508; 
 Tue, 01 Mar 2022 11:02:23 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168]) by smtp.gmail.com with ESMTPSA id
 i128-20020a378686000000b00648ddd8a5c0sm6790641qkd.100.2022.03.01.11.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 11:02:22 -0800 (PST)
Message-ID: <90c57ac742bad5cd75ae76e01e6042739b4e8012.camel@ndufresne.ca>
Subject: Re: [PATCH v7, 09/15] media: mtk-vcodec: disable vp8 4K capability
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Tue, 01 Mar 2022 14:02:21 -0500
In-Reply-To: <20220223034008.15781-10-yunfei.dong@mediatek.com>
References: <20220223034008.15781-1-yunfei.dong@mediatek.com>
 <20220223034008.15781-10-yunfei.dong@mediatek.com>
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
> For vp8 not support 4K, need to disable it.

This patch will need to be changed after you have moved this code into the
proper ioctl.

> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> index bae43938ee37..ba188d16f0fb 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
> @@ -532,7 +532,8 @@ static int vidioc_enum_framesizes(struct file *file, void *priv,
>  		fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
>  		fsize->stepwise = dec_pdata->vdec_framesizes[i].stepwise;
>  		if (!(ctx->dev->dec_capability &
> -				VCODEC_CAPABILITY_4K_DISABLED)) {
> +				VCODEC_CAPABILITY_4K_DISABLED) &&
> +				fsize->pixel_format != V4L2_PIX_FMT_VP8_FRAME) {
>  			mtk_v4l2_debug(3, "4K is enabled");
>  			fsize->stepwise.max_width =
>  					VCODEC_DEC_4K_CODED_WIDTH;

