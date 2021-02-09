Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD6A3153FB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 17:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292D66E0A0;
	Tue,  9 Feb 2021 16:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EA889DFE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 15:32:10 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id d20so19800285oiw.10
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 07:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FLCA6IO40snskjJZDTwax4cOB0Hc4fTsIea1GRHbYqw=;
 b=kvnEwEIFrahzPVo3mkc68ni3hvFkTJo4jgIwH+zPLtWKNynGXxGa8nZObbKLW2IDmI
 3a46th3LHZDoBQmxtnfcccl8FMuftmUNv9bRdyh7WTYluEcZfsBmJEuEXMZByHuH7Uo5
 yCnASweu6IkfTBZw0kjB7MfRDg7ldqtvk4B+7XER9bVogg7krsCSAt7pu5Qy5kU0ZNPH
 PDyNjk/b5YpSvphU+rSIQe2EpwlgjF4Wvo+qkxEgZWTFnAIgX+W0v7CtusZG63z3e8a0
 a6PbGRsH9E2xPpEPvANeKbRttFtVWU9J7Zrh51lH9SnVq6+St1kDZk5p1GoCI8Yt+yPm
 CemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=FLCA6IO40snskjJZDTwax4cOB0Hc4fTsIea1GRHbYqw=;
 b=RpJPLAwq7Xgr0lsV3u65ebKXZH4qFhAdF2+nYLLmvUrJyvg860sXDONGbu5lSjp9OM
 BRIJpe+EEhmYkI0pu5LDQOfrz6BO9GnorXjn45fFFM3FD+Ckg/N5WL/s7Z5XtLETujzr
 0DyeSac8uHZwaZKuYQ+erCVA2MFm655aeFGunHeV4wifGX4syuDAXAfsx5wVUmREci60
 RNFt9r+idSykYOZL1Uu011k7R4Xfu+FCjKrSOI7f//1aDG26y74oeV22yJygFj8Dcomy
 pXer8rZXWlJRUYpa3U4Yhem9dhpYIWwWlUGbFN0LN5Itzoj28ESKZIA3/ih498GuOU4+
 h2Kg==
X-Gm-Message-State: AOAM530ceTbyyARXYL2XdxD4tEuEZwjdFFxVuMb7cIbPSUrHQOU/vprB
 jKNl5TBvE8TFQGrRhYk8q5pWNo8+Ryc=
X-Google-Smtp-Source: ABdhPJyiqVTRbNHqwEOslyBfXgEDo8uRefp2GZczvabIoa5IJcgps061q+D4OOvLoVupWlnLpGk2WQ==
X-Received: by 2002:aca:4a4c:: with SMTP id x73mr2753987oia.97.1612884729290; 
 Tue, 09 Feb 2021 07:32:09 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id r6sm4327754oij.29.2021.02.09.07.32.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 09 Feb 2021 07:32:08 -0800 (PST)
Date: Tue, 9 Feb 2021 07:32:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v6 2/8] drm/mediatek: add component POSTMASK
Message-ID: <20210209153206.GA19067@roeck-us.net>
References: <20210202081237.774442-1-hsinyi@chromium.org>
 <20210202081237.774442-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202081237.774442-3-hsinyi@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 09 Feb 2021 16:37:18 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 02, 2021 at 04:12:31PM +0800, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> This patch add component POSTMASK.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> ---
[ ... ]
>  
> +void mtk_postmask_config(struct device *dev, unsigned int w,

static

> +			unsigned int h, unsigned int vrefresh,
> +			unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	mtk_ddp_write(cmdq_pkt, w << 16 | h, &priv->cmdq_reg, priv->regs,
> +		      DISP_POSTMASK_SIZE);
> +	mtk_ddp_write(cmdq_pkt, POSTMASK_RELAY_MODE, &priv->cmdq_reg,
> +		      priv->regs, DISP_POSTMASK_CFG);
> +}
> +
> +void mtk_postmask_start(struct device *dev)

static

> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	writel(POSTMASK_EN, priv->regs + DISP_POSTMASK_EN);
> +}
> +
> +void mtk_postmask_stop(struct device *dev)

static

> +{
> +	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> +
> +	writel_relaxed(0x0, priv->regs + DISP_POSTMASK_EN);
> +}
> +
>  static void mtk_aal_config(struct device *dev, unsigned int w,
>  			   unsigned int h, unsigned int vrefresh,
>  			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> @@ -413,6 +445,14 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
>  	.bgclr_in_off = mtk_ovl_bgclr_in_off,
>  };
>  
> +static const struct mtk_ddp_comp_funcs ddp_postmask = {
> +	.clk_enable = mtk_ddp_clk_enable,
> +	.clk_disable = mtk_ddp_clk_disable,
> +	.config = mtk_postmask_config,
> +	.start = mtk_postmask_start,
> +	.stop = mtk_postmask_stop,
> +};
> +
>  static const struct mtk_ddp_comp_funcs ddp_rdma = {
>  	.clk_enable = mtk_rdma_clk_enable,
>  	.clk_disable = mtk_rdma_clk_disable,
> @@ -448,6 +488,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
>  	[MTK_DISP_MUTEX] = "mutex",
>  	[MTK_DISP_OD] = "od",
>  	[MTK_DISP_BLS] = "bls",
> +	[MTK_DISP_POSTMASK] = "postmask",
>  };
>  
>  struct mtk_ddp_comp_match {
> @@ -457,36 +498,37 @@ struct mtk_ddp_comp_match {
>  };
>  
>  static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
> -	[DDP_COMPONENT_AAL0]	= { MTK_DISP_AAL,	0, &ddp_aal },
> -	[DDP_COMPONENT_AAL1]	= { MTK_DISP_AAL,	1, &ddp_aal },
> -	[DDP_COMPONENT_BLS]	= { MTK_DISP_BLS,	0, NULL },
> -	[DDP_COMPONENT_CCORR]	= { MTK_DISP_CCORR,	0, &ddp_ccorr },
> -	[DDP_COMPONENT_COLOR0]	= { MTK_DISP_COLOR,	0, &ddp_color },
> -	[DDP_COMPONENT_COLOR1]	= { MTK_DISP_COLOR,	1, &ddp_color },
> -	[DDP_COMPONENT_DITHER]	= { MTK_DISP_DITHER,	0, &ddp_dither },
> -	[DDP_COMPONENT_DPI0]	= { MTK_DPI,		0, &ddp_dpi },
> -	[DDP_COMPONENT_DPI1]	= { MTK_DPI,		1, &ddp_dpi },
> -	[DDP_COMPONENT_DSI0]	= { MTK_DSI,		0, &ddp_dsi },
> -	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, &ddp_dsi },
> -	[DDP_COMPONENT_DSI2]	= { MTK_DSI,		2, &ddp_dsi },
> -	[DDP_COMPONENT_DSI3]	= { MTK_DSI,		3, &ddp_dsi },
> -	[DDP_COMPONENT_GAMMA]	= { MTK_DISP_GAMMA,	0, &ddp_gamma },
> -	[DDP_COMPONENT_OD0]	= { MTK_DISP_OD,	0, &ddp_od },
> -	[DDP_COMPONENT_OD1]	= { MTK_DISP_OD,	1, &ddp_od },
> -	[DDP_COMPONENT_OVL0]	= { MTK_DISP_OVL,	0, &ddp_ovl },
> -	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, &ddp_ovl },
> -	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
> -	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
> -	[DDP_COMPONENT_OVL_2L2] = { MTK_DISP_OVL_2L,    2, &ddp_ovl },
> -	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
> -	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
> -	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
> -	[DDP_COMPONENT_RDMA0]	= { MTK_DISP_RDMA,	0, &ddp_rdma },
> -	[DDP_COMPONENT_RDMA1]	= { MTK_DISP_RDMA,	1, &ddp_rdma },
> -	[DDP_COMPONENT_RDMA2]	= { MTK_DISP_RDMA,	2, &ddp_rdma },
> -	[DDP_COMPONENT_UFOE]	= { MTK_DISP_UFOE,	0, &ddp_ufoe },
> -	[DDP_COMPONENT_WDMA0]	= { MTK_DISP_WDMA,	0, NULL },
> -	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
> +	[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,	0, &ddp_aal },
> +	[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,	1, &ddp_aal },
> +	[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,	0, NULL },
> +	[DDP_COMPONENT_CCORR]		= { MTK_DISP_CCORR,	0, &ddp_ccorr },
> +	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,	0, &ddp_color },
> +	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,	1, &ddp_color },
> +	[DDP_COMPONENT_DITHER]		= { MTK_DISP_DITHER,	0, &ddp_dither },
> +	[DDP_COMPONENT_DPI0]		= { MTK_DPI,		0, &ddp_dpi },
> +	[DDP_COMPONENT_DPI1]		= { MTK_DPI,		1, &ddp_dpi },
> +	[DDP_COMPONENT_DSI0]		= { MTK_DSI,		0, &ddp_dsi },
> +	[DDP_COMPONENT_DSI1]		= { MTK_DSI,		1, &ddp_dsi },
> +	[DDP_COMPONENT_DSI2]		= { MTK_DSI,		2, &ddp_dsi },
> +	[DDP_COMPONENT_DSI3]		= { MTK_DSI,		3, &ddp_dsi },
> +	[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,	0, &ddp_gamma },
> +	[DDP_COMPONENT_OD0]		= { MTK_DISP_OD,	0, &ddp_od },
> +	[DDP_COMPONENT_OD1]		= { MTK_DISP_OD,	1, &ddp_od },
> +	[DDP_COMPONENT_OVL0]		= { MTK_DISP_OVL,	0, &ddp_ovl },
> +	[DDP_COMPONENT_OVL1]		= { MTK_DISP_OVL,	1, &ddp_ovl },
> +	[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,	0, &ddp_ovl },
> +	[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,	1, &ddp_ovl },
> +	[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,    2, &ddp_ovl },
> +	[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,	0, &ddp_postmask },
> +	[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,	0, NULL },
> +	[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,	1, NULL },
> +	[DDP_COMPONENT_PWM2]		= { MTK_DISP_PWM,	2, NULL },
> +	[DDP_COMPONENT_RDMA0]		= { MTK_DISP_RDMA,	0, &ddp_rdma },
> +	[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,	1, &ddp_rdma },
> +	[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,	2, &ddp_rdma },
> +	[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,	0, &ddp_ufoe },
> +	[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,	0, NULL },
> +	[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,	1, NULL },
>  };
>  
>  static bool mtk_drm_find_comp_in_ddp(struct device *dev,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index bb914d976cf5d..cd1dec6b4cdf2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -30,6 +30,7 @@ enum mtk_ddp_comp_type {
>  	MTK_DISP_UFOE,
>  	MTK_DSI,
>  	MTK_DPI,
> +	MTK_DISP_POSTMASK,
>  	MTK_DISP_PWM,
>  	MTK_DISP_MUTEX,
>  	MTK_DISP_OD,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
