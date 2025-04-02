Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E238A78B33
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 11:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468C410E2F3;
	Wed,  2 Apr 2025 09:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QiinruIw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1100810E732
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 09:38:17 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30db1bd3bddso62418191fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 02:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1743586695; x=1744191495;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x2JNszX6iZTEKfz+6ykvGTqM6KFlJFkA7aYcjD0/BdY=;
 b=QiinruIwtT+wwSs90pnKgWGi5gx3Nuq/7+Ec6a8sqOdJQ+KHjgNISE4MTdc4rtsF9U
 vnltcEjLInwapD01x9I9Xt8tqw9A0qRxyq3YpCkY/T/UmYphC9bUU9gPPTSRLhjU0ww5
 8rKpnNkZBUPM70pl46OGmWBhB3JES/7LwntvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743586695; x=1744191495;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x2JNszX6iZTEKfz+6ykvGTqM6KFlJFkA7aYcjD0/BdY=;
 b=mLn1al3Dm23ij0AK3MOoLNKUfnaGyDQbFQnESfhVW1KHztzX20oggVa74TDrTux54p
 QfAJI6R9BC85hP1gEB1VcXvl+Iw1KPnqWsO7ne1hpF9Cb6J+uM/mqiD4oiYMdMdR7e8P
 JhTpOsEi9OUuTvw8I+VDZYzeOUgohCegKPUphvQ3F0FTJ6OeHiz/dKiBPJmytxjLFx26
 mjHne8jgScOsSUOcAmbGkEZWGL5NiNSvDcGvE4s8HgwmMPVlatXL8wFwTnuBMrdXwLP/
 Em3UA7gELuFa485sWRc/+0zmSCGJ6o6hWD59SB72k7tGbKDS4ULRj72aVc0NqiiQQ764
 UNtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtgrrScvWt+zckhXitWtZpXNf+d6g3ZZu4yh1eaz0E2JxaeN0KJDwLVk556zMoPgv01x/nSwed38w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuJhm/Z10O5bEcp8hCmKqu1rCdB9sqQPnpxmtWWzgaB3REDiHl
 FNuE1ozfHSOCFWBTZCej00vKOB8p7b0Zesf7UvVGJCmQ+8VXEt0cB6lHnbdbNTWflG/xGoYR4Je
 DOsmtjFBT3F+CEvb2InB9r4+r9OH/Mp35HGxm
X-Gm-Gg: ASbGncuisNZ9F9Pv55jzuBYvZ8wX+clU6LfnxYrq4rKDXibh3EjOLVcAdf2YAG6+hrI
 Lq7/c8QITYHizv48aVXH0IEvFXJHaRQWVnJU9aJkRtlFrtK91IORR0soyu8XklApJyrcK0n8XoS
 IUjIm2GzywSkSfAt6S+gXsjQJyW1IZIX1pO/48jpxpL3gits97icY/ISxb0LSnuzA=
X-Google-Smtp-Source: AGHT+IExYrNEjA4pPxITL5Kgnipvtbv102T/YS0lH31Fsyobnp9W1LSzaQUExnLdiCH6E51BoFuI8ihy0vHN4Nlyq+I=
X-Received: by 2002:a2e:be0f:0:b0:30c:5c6:91e0 with SMTP id
 38308e7fff4ca-30de0231a0cmr50673981fa.2.1743586694676; Wed, 02 Apr 2025
 02:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
 <20250402083628.20111-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083628.20111-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 17:38:03 +0800
X-Gm-Features: AQ5f1Jo5jbEeaCvlhXWHAtzwNK4wbBL1go7L3GIt1qsXbC424ywOaYMmnHcwKAY
Message-ID: <CAGXv+5E1qShE1LqgFL6rrgRzjwFUPoBqYdhO-sgNzmMqQsMS0Q@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] drm/mediatek: mtk_disp_ovl: Enable/disable
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
> The OVL driver is installing an ISR in the probe function but, if
> the component is not bound yet, the interrupt handler may call the
> vblank_cb ahead of time (while probing other drivers) or too late
> (while removing other drivers), possibly accessing memory that it
> should not try to access by reusing stale pointers.
>
> In order to fix this, add a new `irq` member to struct mtk_disp_ovl
> and then set the NOAUTOEN flag to the irq before installing the ISR
> to manually call enable_irq() and disable_irq() in the bind and
> unbind callbacks respectively.
>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/me=
diatek/mtk_disp_ovl.c
> index df82cea4bb79..1bff3a1273f6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -161,6 +161,7 @@ struct mtk_disp_ovl {
>         struct drm_crtc                 *crtc;
>         struct clk                      *clk;
>         void __iomem                    *regs;
> +       int                             irq;
>         struct cmdq_client_reg          cmdq_reg;
>         const struct mtk_disp_ovl_data  *data;
>         void                            (*vblank_cb)(void *data);
> @@ -587,12 +588,18 @@ void mtk_ovl_bgclr_in_off(struct device *dev)
>  static int mtk_disp_ovl_bind(struct device *dev, struct device *master,
>                              void *data)
>  {
> +       struct mtk_disp_ovl *priv =3D dev_get_drvdata(dev);
> +
> +       enable_irq(priv->irq);
>         return 0;
>  }
>
>  static void mtk_disp_ovl_unbind(struct device *dev, struct device *maste=
r,
>                                 void *data)
>  {
> +       struct mtk_disp_ovl *priv =3D dev_get_drvdata(dev);
> +
> +       disable_irq(priv->irq);
>  }
>
>  static const struct component_ops mtk_disp_ovl_component_ops =3D {
> @@ -605,16 +612,15 @@ static int mtk_disp_ovl_probe(struct platform_devic=
e *pdev)
>         struct device *dev =3D &pdev->dev;
>         struct mtk_disp_ovl *priv;
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
> @@ -635,10 +641,11 @@ static int mtk_disp_ovl_probe(struct platform_devic=
e *pdev)
>         priv->data =3D of_device_get_match_data(dev);
>         platform_set_drvdata(pdev, priv);
>
> -       ret =3D devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
> +       irq_set_status_flags(priv->irq, IRQ_NOAUTOEN);
> +       ret =3D devm_request_irq(dev, priv->irq, mtk_disp_ovl_irq_handler=
,
>                                IRQF_TRIGGER_NONE, dev_name(dev), priv);

Use IRQF_NO_AUTOEN here? Also, IRQF_TRIGGER_NONE can be dropped.

Make sense otherwise.

ChenYu

>         if (ret < 0)
> -               return dev_err_probe(dev, ret, "Failed to request irq %d\=
n", irq);
> +               return dev_err_probe(dev, ret, "Failed to request irq %d\=
n", priv->irq);
>
>         pm_runtime_enable(dev);
>
> --
> 2.48.1
>
