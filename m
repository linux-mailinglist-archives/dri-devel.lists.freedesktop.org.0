Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98482A471B2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 02:52:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2005110EA0D;
	Thu, 27 Feb 2025 01:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FkIN+cFg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7742210EA0A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 01:52:46 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5fcf21d7235so167250eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 17:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740621162; x=1741225962; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ixz4rke/Pu4MIs/yXHWsa0RBvJ804N4RrG8GmiSG7vE=;
 b=FkIN+cFgN6yGVRAlk42harMknozeDF0y/wexJ9UoY7/Buhf40c1sGHMQOJL4wHdNo7
 YoVH4DjJduoo3ZSMq7ZwZzbQ0wVYrgQiqCUVz4EYHq82QM5Y38XsA0Ac4weyzA9hUdTy
 VH/AHFnVuswaRQiYlkgamhNoQUJFvmi1NWaDZ6nfsQ5h/DeAiltmE1jbCWuA/d3f6t4J
 ooMUCdnlvBjMk6j1b5MACwONKn8Cbjaf1flLGbZMIk9PQv1a/I+8A8U4penjOA1HkgiU
 7wSBmFBCmJcgzgN+EHsAfDnoizdR5seTR/LmZbcLoJzsqr6KyrkWBP+mm/6tlBvXImqR
 VOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740621162; x=1741225962;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ixz4rke/Pu4MIs/yXHWsa0RBvJ804N4RrG8GmiSG7vE=;
 b=TFb/NL9ZFETMlo8qgGsK/E/XyeicNT/X7B1xGonk9A3af6lxhcL3dZ654pXl1hDavD
 aajugdOe4Q+DWJ7hDT66X4G8+6KluoSI4v6KahL507oSWsGWJ/m4cE+fjq9dAlCvvTc7
 CWJBNoHBtMFIt23TohKyad9F+/z5gxgoJaMkO4xBpzHiQSZRtsS8ZwDvg/p6nPjHp1eo
 bbkP1eNzcxYYZE/1HS7Mq2tsJaVH5uI06o+uWeqj8+N/Ger2eS+d0nxb/grtoFVPghUO
 sVc/YNFDxBeq1AqDHTy1wOi52P7SlfhHcFWp7wvYxCypxod7kVlj2LXXgN7Ydogw3c/d
 Kb2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrjFhVbFuK8zrCSsGPKQqNx7SUB7RX9dDBL1TwfSHcIC/5VJp5MfCykvlIMsP1mJFWOsQt4kqJh3A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVdsQv4IBjlSERc9yK8uvrMtVurX0aDqX2Os08+xmcDSuiTt7s
 ecqwdzBfXyzAzsDZ9U61n7IPsrQVeeGSi3chKdToq8SOtP3FvKCJ2hxmLDuhQwL63uDCYYBRnII
 7OkD58TDuFKznl2QX1v7ryrzKqhA=
X-Gm-Gg: ASbGncvuYqGM67VN7eDFn4kL+mn4G7bll12aPaIxBJ2P7uIN1mze4k+2N0yZe1i+nHf
 Yin9ImlW6xIxjwWG1bmFuPNa5inA3JCBhl0im1KDF7VgCYR6PUsyYG1qq9IjE1JKMzWFPRwMB6j
 9UWMS2k7OGsVmA5zNlhwVd40fg7hhlbbFjS4Xdst0=
X-Google-Smtp-Source: AGHT+IGqnXgTmRNVtKjZ/iy4Us2fHmhfpIjxOOKmUbGHr3+Ih8p+w6kJGd3DiiswHNSoSt374klMkalELnpHhT8BfD0=
X-Received: by 2002:a05:6808:1513:b0:3f3:f90b:f1b3 with SMTP id
 5614622812f47-3f425a658admr16487647b6e.5.1740621162105; Wed, 26 Feb 2025
 17:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20250225-memory-drm-misc-next-v1-0-9d0e8761107a@redhat.com>
 <20250225-memory-drm-misc-next-v1-6-9d0e8761107a@redhat.com>
In-Reply-To: <20250225-memory-drm-misc-next-v1-6-9d0e8761107a@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 27 Feb 2025 09:52:06 +0800
X-Gm-Features: AQ5f1Jo4V-x_aMe6cNu_t6bm5DyuMpmkfFoBZmOQ95iqLbLXuNwjk8JtAQUipWI
Message-ID: <CAAfSe-vGC2bA10yNRjSkLo3Y=2K8HJvssuM8qLeB=57vQk1eZg@mail.gmail.com>
Subject: Re: [PATCH RESEND 06/12] drm/sprd: move to
 devm_platform_ioremap_resource() usage
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, 
 Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
 John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Marek Vasut <marex@denx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, 
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 linux-doc@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 26 Feb 2025 at 06:22, Anusha Srivatsa <asrivats@redhat.com> wrote:
>
> Replace platform_get_resource + devm_ioremap
> with just devm_platform_ioremap_resource()
>
> Used Coccinelle to do this change. SmPl patch:
> @rule_2@
> identifier res;
> expression ioremap;
> identifier pdev;
> @@
> -struct resource *res;
> ...
> -res = platform_get_resource(pdev,...);
> <...
> -if (!res) {
> -...
> -}
> ...>
> -ioremap = devm_ioremap(...);
> +ioremap = devm_platform_ioremap_resource(pdev,0);
>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

> ---
>  drivers/gpu/drm/sprd/sprd_dpu.c | 9 +--------
>  drivers/gpu/drm/sprd/sprd_dsi.c | 9 +--------
>  2 files changed, 2 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
> index cb2816985305fd19eac27413c214681a5a1e9ffa..65cd5aa1634eee5a6735ccffa4ee3979844d92ce 100644
> --- a/drivers/gpu/drm/sprd/sprd_dpu.c
> +++ b/drivers/gpu/drm/sprd/sprd_dpu.c
> @@ -784,16 +784,9 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu,
>  {
>         struct platform_device *pdev = to_platform_device(dev);
>         struct dpu_context *ctx = &dpu->ctx;
> -       struct resource *res;
>         int ret;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!res) {
> -               dev_err(dev, "failed to get I/O resource\n");
> -               return -EINVAL;
> -       }
> -
> -       ctx->base = devm_ioremap(dev, res->start, resource_size(res));
> +       ctx->base = devm_platform_ioremap_resource(pdev, 0);
>         if (!ctx->base) {
>                 dev_err(dev, "failed to map dpu registers\n");
>                 return -EFAULT;
> diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
> index 8fc26479bb6bce0aa94914f49d0986a7e19326c1..1668bb4166ab0ad3812c5654244544a9caf249a6 100644
> --- a/drivers/gpu/drm/sprd/sprd_dsi.c
> +++ b/drivers/gpu/drm/sprd/sprd_dsi.c
> @@ -901,15 +901,8 @@ static int sprd_dsi_context_init(struct sprd_dsi *dsi,
>  {
>         struct platform_device *pdev = to_platform_device(dev);
>         struct dsi_context *ctx = &dsi->ctx;
> -       struct resource *res;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!res) {
> -               dev_err(dev, "failed to get I/O resource\n");
> -               return -EINVAL;
> -       }
> -
> -       ctx->base = devm_ioremap(dev, res->start, resource_size(res));
> +       ctx->base = devm_platform_ioremap_resource(pdev, 0);
>         if (!ctx->base) {
>                 drm_err(dsi->drm, "failed to map dsi host registers\n");
>                 return -ENXIO;
>
> --
> 2.48.1
>
