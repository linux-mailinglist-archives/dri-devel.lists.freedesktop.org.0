Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A92A21DC5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 14:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD4810E04E;
	Wed, 29 Jan 2025 13:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="P2Sm3tQq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA9210E04E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 13:18:14 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30738a717ffso59974501fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 05:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1738156692; x=1738761492;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+CHJ8n+1weOhv4NN8WEDPgNRoao7eEb7VxTBwhD7To=;
 b=P2Sm3tQqedj2s/vcB5gUrA4dNo/OW0TH+jgMvATk1TyrSm3j9Fw/Nq3AZIppjk2Cbl
 rak5Nl8MDiomj7ULimC2cefHSqhPblbELsKIDa29F1FG2xrZuADYdC5FhbWPDLyi8Ism
 wOdOXl+WCB3GUlBy0OVretSbVVNre3jtCydxA7CBm8+FX4yK2GxRvrwxdKr9WovIoXeT
 oZFZq1zb9+xoygvr/jwcZQsvz511ae7LJLQxiD0lyAAJ+zucX3KQ56jXdySwrz2Q6fEq
 6RoJuOQH1bEMZwsg892a/gz38sDpqwl4BWiYRcf2stgbhlHsXfL0Ehv7peYPoyp9nDKI
 VQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738156692; x=1738761492;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+CHJ8n+1weOhv4NN8WEDPgNRoao7eEb7VxTBwhD7To=;
 b=ni3gcXP3mtKme6k0fxbclDWGaXeUeupy9CisHbnntNxf3zzwr13Wrwy0eyBjvY3pD6
 mUCY4BM55H5N226EY87p61XvcG1F6Vgn9aHuezxO1yqHui6OfKskX7Kq6e0B8jsvkhJA
 l/Qp15Tm9aPAO0/eEfigH5NcM4ViZFNYEoJ8jYbW+H1d/b9zL6+ySoSO3XG0NLfuK1nj
 LjWLEefAqL5sHMbWqMMwfBC38egNiG6Qldm95eUdZFbyR//SmooyVzAk1k/YsJzykcCh
 /9MPIpqOgiRj7YbcDhOyKDf4grniDiZpJC2uneC+aEIUpl2SHeBt7Lu2U7WvXKtoyWyY
 V2Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSdvfATbbNngwqcWEHWYy01BWaXtVqXwhQvdAQPWbqwYbac0esgvE2NVZt1Wx1LUeo6KNYjfO1XNs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzR/t5oeq3BzHThI5om0Uz49pdsXCFWQ0X8E3Jg/Pl193eSmw/L
 Dzmw6mfbaQObMaEHyVoLiY+BCD8LJhvSD4kMA9VknfEYc07+IhKHP6Y9TpfZ5QvJl0yLewLT2vQ
 JgNZ0lqTSVuq/8fmqjjL6nogVwbJDZm8pTsIarw==
X-Gm-Gg: ASbGncuh7SiuT1bW/wR0M72OEV6AYMd4gfrJmKUEAXCWvq5IvOcdQEYJ5GOrK4xcWAn
 lBNpFPDHyd3OS37x7aGu8uBg0CxnvI7HSw3QoTT3kEOyn8nZjQdSURkGrRTi0iuV07VxlmWBiuj
 eDEIu4xNR9EyjWxv/50Qs/pXCzXDvq
X-Google-Smtp-Source: AGHT+IGFRC+m+r/a8Okn6oewxCN7IKGCsP32ORqURIUMiUOfm5o7kOj6AXMqnFWDbj2MV05dJpu5VXuc2FEJhvoxCWI=
X-Received: by 2002:a2e:be9c:0:b0:307:2bc6:5eb4 with SMTP id
 38308e7fff4ca-307968bfa7bmr8911111fa.3.1738156692452; Wed, 29 Jan 2025
 05:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-13-0d1609a29587@redhat.com>
In-Reply-To: <20250128-cocci-memory-api-v1-13-0d1609a29587@redhat.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 29 Jan 2025 13:17:54 +0000
X-Gm-Features: AWEUYZktkNT_EsHcnViFnfugP1naRJeQlMuaRyszOFwlglEWr7DXeU7KaxFISbw
Message-ID: <CAPY8ntBvJpSFhOwqBPmiN59Z0EpienEm-=M-euHdQU8XLGgXUA@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/vc4: move to devm_platform_ioremap_resource()
 usage
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
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Vasut <marex@denx.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, 
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
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>, 
 linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Anusha

On Tue, 28 Jan 2025 at 22:33, Anusha Srivatsa <asrivats@redhat.com> wrote:
>
> Replace platform_get_resource_byname + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
>
> Used Coccinelle to do this change. SmPl patch:
> //rule s/(devm_)platform_get_resource_byname +
> //(devm_)ioremap/devm_platform_ioremap_resource.
> @rule_3@
> identifier res;
> expression ioremap;
> identifier pdev;
> constant mem;
> expression name;
> @@
> -struct resource *res;
> ...
> -res =3D platform_get_resource_byname(pdev,mem,name);
> <...
> -if (!res) {
> -...
> -}
> ...>
> -ioremap =3D devm_ioremap(...);
> +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: "Ma=C3=ADra Canal" <mcanal@igalia.com>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..e22733f8159aa4b247a915e24=
a236f620bae932c 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -2951,15 +2951,10 @@ static int vc5_hdmi_init_resources(struct drm_dev=
ice *drm,
>  {
>         struct platform_device *pdev =3D vc4_hdmi->pdev;
>         struct device *dev =3D &pdev->dev;
> -       struct resource *res;
>         int ret;
>
> -       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdmi"=
);
> -       if (!res)
> -               return -ENODEV;
> -
> -       vc4_hdmi->hdmicore_regs =3D devm_ioremap(dev, res->start,
> -                                              resource_size(res));
> +       vc4_hdmi->hdmicore_regs =3D devm_platform_ioremap_resource_byname=
(pdev,
> +                                                                       "=
hdmi");

Whilst I totally agree with this change, why was only one of the 8
instances of this pattern within this function updated? Is that a
limitation in your script?
https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/vc4/vc4_hdmi.=
c#L2957-L3020

  Dave

>         if (!vc4_hdmi->hdmicore_regs)
>                 return -ENOMEM;
>
>
> --
> 2.47.0
>
