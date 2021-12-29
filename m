Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF6E481073
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 07:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2ABE89272;
	Wed, 29 Dec 2021 06:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0C689272
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 06:37:00 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id u16so15209892plg.9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 22:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=p7zVEyegDmuj+6n30KCO1S5If0BRlYsdYfkjtOazVTk=;
 b=US3E/hqHlmnyPzOy/HskFnqIw6YITYtB3SecYzBz/TvRFRiaQ5DNALRLAG1KPwoX4J
 sdBQ2c6Fm0s8nGLH1iLRLu6FUqFDXjmD5E5kgs1rUOuHC+aCdtwY5dqh2Ev41kZOMVMb
 JT/44yXGfpcDJ/kOLKnYQIqs7HAjYlSLDIVP98i5KxF2HWCRbPPlFuiGAGcRbPQoTNpq
 pKVNacwTs8+fmivZ1QHilorH76JfKWLYlHAR+j1FcZCE4uG8HNOHvJyki9/G9qHZ9doc
 w3+mIdcw/VCRHpkDbNyJyPBV0iBAIkpoMwfbDuFPZgJmId3BIzA0/bGe1/XouW9QehRg
 3+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p7zVEyegDmuj+6n30KCO1S5If0BRlYsdYfkjtOazVTk=;
 b=XHr7mfZtcvDLDNiEPsLA/TTm154ktTjhcBDLGxeuswSh1tksNrWpBKJ5VqBF8Js7Q6
 7o7kkRCt+MsTdRSAOup0PJ8jK1UtFFjPEl19UxzFE1q3Vf3Rumk1YGJ+VuMFylUT1hfk
 DhP8Mh8GpQ7k2MOqOhjSGedXACN1ijN1TGYUZ8Mnpt6xdWtjXun4DNacQRxULNwGhH8a
 giF9PW5QbvzI/EhRMt2KZcFYkYczS116SsThAh5p00lePj1l7RNCvDRmT+peaSBbIl+v
 oLQh4d29OBrgLNLs4lrp1M7hZ7iBCvJova8x4yyXXU/sGFEHZdDQSC/n7knH/AuAVTq6
 FL+A==
X-Gm-Message-State: AOAM5334NRMCPa7uUT/t3FfMp9YV/1u0wb/1kLuV+J8ntQFE2eYFH6b9
 I442UvGeAavJ0Fn25oEhW08sgw==
X-Google-Smtp-Source: ABdhPJzbQgs3ZiPyG3g68c9CE72l8nXqFUBGdfo2PobHZ4oRqfWUj1AoQFmLtN/bznm5cjXVREY+kQ==
X-Received: by 2002:a17:902:6a82:b0:148:a2e7:fb5c with SMTP id
 n2-20020a1709026a8200b00148a2e7fb5cmr25308794plk.157.1640759819836; 
 Tue, 28 Dec 2021 22:36:59 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4dea:2b20:ea89:724b])
 by smtp.gmail.com with ESMTPSA id p37sm18097039pfh.97.2021.12.28.22.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 22:36:59 -0800 (PST)
Date: Wed, 29 Dec 2021 14:36:54 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v2, 05/12] media: mtk-vcodec: Call
 v4l2_m2m_set_dst_buffered() set capture buffer buffered
Message-ID: <YcwCBgw6ZjYwBLFf@google.com>
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
 <20211228094146.20505-6-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211228094146.20505-6-yunfei.dong@mediatek.com>
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

On Tue, Dec 28, 2021 at 05:41:39PM +0800, Yunfei Dong wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>

Same as 4th patch.  Please fix it.

> For lat and core architecture, just need to get output buffer for lat
> decode. For core hardware need to get lat's message and capture buffer.
> In order to let lat and core decode in parallel, need to set capture
> buffer buffered.

I think the description should be rephrased.

I may misunderstand but something like the template:
"""
OUTPUT -> lat -> core -> CAPTURE.  Lat and core can work in parallel.

Sets capture buffer buffered to ...
"""

> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> index 5aebf88f997b..23a154c4e321 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
> @@ -314,6 +314,9 @@ static void mtk_init_vdec_params(struct mtk_vcodec_ctx *ctx)
>  	src_vq = v4l2_m2m_get_vq(ctx->m2m_ctx,
>  				 V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>  
> +	if (ctx->dev->vdec_pdata->hw_arch != MTK_VDEC_PURE_SINGLE_CORE)
> +		v4l2_m2m_set_dst_buffered(ctx->m2m_ctx, 1);

s/1/true/ helps readability.
