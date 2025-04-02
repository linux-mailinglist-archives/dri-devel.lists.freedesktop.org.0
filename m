Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D110A78B70
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 11:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BA610E707;
	Wed,  2 Apr 2025 09:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="iyMcMLZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BFA89C93
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 09:42:58 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-224019ad9edso49366205ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 02:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743586978; x=1744191778;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yqCjN2XnaBIaqPEFvjQc6aei3tdzzIB/3dXAk1qHr5w=;
 b=iyMcMLZNVi5P4yzmA5A0YvBf10502/UdiHQHnCYwPR/7Dj1DIcGqWJdiHAz2XUtG1A
 fueDwHdy2AM7PR3qJlLcm0GBlSGg02Uufqvl310t1JT8OdtHmWSshE978elQzlryJze5
 ZQ0jIdPSpAcoJ3N6ijy74BZWXENkzfNCUfs+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743586978; x=1744191778;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yqCjN2XnaBIaqPEFvjQc6aei3tdzzIB/3dXAk1qHr5w=;
 b=NRKyfBtwxtBzJafOzJgMXHxQBXXncQ6rOhhAbwPNcaCWQuoXXVvTunJMviqrttuXfh
 bSPyeJkOtnJCCL099/F+eop+lrfNGwOWsIR+4JHNvNIUn3eBPgzIRkRYFCiSEynTFhC8
 +QVEumioTfq4alwjoXKGa1aPZFolqw5InDIcgEcFrBThuKbMuDhPNFH5C5VHkD4B4RGT
 u3ZZdpASyyextm9Ds145+Cjx46Zg8ocF5aQkMXctvLBBQVpu+XG+2yUsIkNCKg6MvrUi
 fdsDEOAkhfKCLEO6AuXE27QNKqQOf9ucPBMzuY85bMgwd+H3dx13+KBb7InDYTHFfczV
 d3/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYejqYNoR3Vl6z7datuv0Sj+f9TmmsRxjDv5bq/T1qB49JscKPwWGNrVhH8hLQ3+MrUoNZRHg3tYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyMkU2jBqS76ByuACHO0bH4wEMo1Wm5pFVtDJfFbHV+I7rafNv
 5Mxq6062Xo3fHd013ScrmNe4v13GoGHN3z1xG2hxj8f/+TW7D2x+omnXMzCxcnW0EsaLms0rp+C
 NXKYXO6bl1aTPlK/TG30uOSjp4//QeH6/mjnE
X-Gm-Gg: ASbGncvshTkKNmrvVcnJayU2js7DRce1TCihQ4u4T89UoqXZpHkQ1sBHqSBaF5TjSqA
 8D/pKKsTyFLXcfH8YTCgrCkkHz2Ophky7+WURjgXjTuSj43NSEyUASok/in46qQnnjS/qoJ1vHJ
 oCnbKPwPDsr9CFXpncD2nLY7r5HH3JZREf35j/z85Bjzh6nMnpdmmE
X-Google-Smtp-Source: AGHT+IGMZDQXr98ZNR/OTYIob8ILLj+AqDEEsuZ8JN3W+IxwuRQKfzlFXjpxIo8J+CbSTybZ0f55Aqhe9qvbkLunHuc=
X-Received: by 2002:a17:903:1110:b0:223:517a:d2a3 with SMTP id
 d9443c01a7336-2296c65f3b4mr20133075ad.17.1743586978295; Wed, 02 Apr 2025
 02:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
 <20250402083628.20111-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 17:42:45 +0800
X-Gm-Features: AQ5f1JpfpbwiH6bCyV4YV_ME0bLhkIPk06VpTzeijPYQFz6wYmEpVSh-GkNPq_Y
Message-ID: <CAGXv+5EnGbYTPh9vrrcn0T1oskCY=AHDJsd1rfGw4MiPoUAAxQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] drm/mediatek: mtk_disp_rdma: Enable/disable
 interrupt on bind/unbind
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
 ck.hu@mediatek.com, djkurtz@chromium.org, littlecvr@chromium.org, 
 bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
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

On Wed, Apr 2, 2025 at 4:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The RDMA driver is installing an ISR in the probe function but, if
> the component is not bound yet, the interrupt handler may call the
> vblank_cb ahead of time (while probing other drivers) or too late
> (while removing other drivers), possibly accessing memory that it
> should not try to access by reusing stale pointers.
>
> In order to fix this, like done in the OVL driver, add a new `irq`
> member to struct mtk_disp_ovl and then set the NOAUTOEN flag to
> the irq before installing the ISR to manually disable and clear
> the hwirqs with register writes, and enable_irq() and disable_irq()
> in the bind and unbind callbacks respectively.
>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 35 ++++++++++++++----------
>  1 file changed, 21 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/m=
ediatek/mtk_disp_rdma.c
> index bf47790e4d6b..8c5021365a04 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
> @@ -81,6 +81,7 @@ struct mtk_disp_rdma_data {
>  struct mtk_disp_rdma {
>         struct clk                      *clk;
>         void __iomem                    *regs;
> +       int                             irq;
>         struct cmdq_client_reg          cmdq_reg;
>         const struct mtk_disp_rdma_data *data;
>         void                            (*vblank_cb)(void *data);
> @@ -295,13 +296,23 @@ void mtk_rdma_layer_config(struct device *dev, unsi=
gned int idx,
>  static int mtk_disp_rdma_bind(struct device *dev, struct device *master,
>                               void *data)
>  {
> -       return 0;
> +       struct mtk_disp_rdma *priv =3D dev_get_drvdata(dev);
> +
> +       /* Disable and clear pending interrupts */
> +       writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
> +       writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
>
> +       enable_irq(priv->irq);
> +
> +       return 0;
>  }
>
>  static void mtk_disp_rdma_unbind(struct device *dev, struct device *mast=
er,
>                                  void *data)
>  {
> +       struct mtk_disp_rdma *priv =3D dev_get_drvdata(dev);
> +
> +       disable_irq(priv->irq);
>  }
>
>  static const struct component_ops mtk_disp_rdma_component_ops =3D {
> @@ -314,16 +325,15 @@ static int mtk_disp_rdma_probe(struct platform_devi=
ce *pdev)
>         struct device *dev =3D &pdev->dev;
>         struct mtk_disp_rdma *priv;
>         struct resource *res;
> -       int irq;
>         int ret;
>
>         priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
>
> -       irq =3D platform_get_irq(pdev, 0);
> -       if (irq < 0)
> -               return irq;
> +       priv->irq =3D platform_get_irq(pdev, 0);
> +       if (priv->irq < 0)
> +               return priv->irq;
>
>         priv->clk =3D devm_clk_get(dev, NULL);
>         if (IS_ERR(priv->clk))
> @@ -347,21 +357,18 @@ static int mtk_disp_rdma_probe(struct platform_devi=
ce *pdev)
>         if (ret && (ret !=3D -EINVAL))
>                 return dev_err_probe(dev, ret, "Failed to get rdma fifo s=
ize\n");
>
> -       /* Disable and clear pending interrupts */
> -       writel(0x0, priv->regs + DISP_REG_RDMA_INT_ENABLE);
> -       writel(0x0, priv->regs + DISP_REG_RDMA_INT_STATUS);
> -
> -       ret =3D devm_request_irq(dev, irq, mtk_disp_rdma_irq_handler,
> -                              IRQF_TRIGGER_NONE, dev_name(dev), priv);
> -       if (ret < 0)
> -               return dev_err_probe(dev, ret, "Failed to request irq %d\=
n", irq);
> -
>         priv->data =3D of_device_get_match_data(dev);
>
>         platform_set_drvdata(pdev, priv);
>
>         pm_runtime_enable(dev);
>
> +       irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
> +       ret =3D devm_request_irq(dev, priv->irq, mtk_disp_rdma_irq_handle=
r,
> +                              IRQF_TRIGGER_NONE, dev_name(dev), priv);

Same comment as OVL driver change.

ChenYu

> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "Failed to request irq %d\=
n", priv->irq);
> +
>         ret =3D component_add(dev, &mtk_disp_rdma_component_ops);
>         if (ret) {
>                 pm_runtime_disable(dev);
> --
> 2.48.1
>
