Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8A154B531
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 18:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C2110FE6F;
	Tue, 14 Jun 2022 16:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D0A910FE6F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 16:00:30 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id v1so18010705ejg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dfWwY8/FZDKROVGBj7eQmK589UzYQ9s/yKIWp9h8r5U=;
 b=gtLgYTxUs7EjEuxXaPRqfQnebX/9+q7zQr2rdhvW3Z7HvWzbhnqcq4xlE33Un0uOIt
 hYuJMV2+wk/JK+R7wPfFljN4HnHVXLb8LpCbUStXJcCKQTE1OP2wcVMszHTyxHsVMwLe
 yQRnGOz0LbsQuC+sruqjMglKaY0eRKCX+zejCNbW+qj20SP1YPRiRKDNdOApft6FDGBx
 9xsl/Yb6wjWqNDl5sFb4sGK0nJY3rqXtpHPl2a2k5g/zNpQi2eOcPpDgw8U/9DINUVEp
 VqFlGIpdoVzdKeXNYh3khN2oR39oTIppFGNroq9duaoHwTH05aB8M/2iUYa0+DzYUnep
 D/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dfWwY8/FZDKROVGBj7eQmK589UzYQ9s/yKIWp9h8r5U=;
 b=PEllnqw73PTuRKh1OmCjrFXiT5keWHCwCIrU5Gw0ZtwPlwshhVHCVN5qzmlumv76RM
 zK0j9fzcGnzN65/baRsIP/UEbluwzvnHEZiIRswsYt0hu7ePYp8j2CfcglkYzsQPkIHM
 LMGgU5o1xd+ALIMTE1m0YrEM/r8As9+41D9HR8m+l/BoIHniFREvxG7+S6vlZa/obh1z
 vSVYEhf3dHrePYGQ1Mlke9mje2SBxsp6PeHVniTLJDk9m83/FBMqi4Rwc9EAe2YZKr7K
 AG9WcmeB8SudY5w1ZbAT09wCUDHJdTr/gH1Db0w/NDmORh4LO0HVq4Ehdv3xR4p9dqft
 IdLw==
X-Gm-Message-State: AJIora8rZkl4WtS+1MirhyQOnpSd5m9py1Dt4Edcn093ns4YjYoWrgAr
 YHnsflXXJzf7LrziWoDCpAPEtRG5uE1zDPQVOy572Q==
X-Google-Smtp-Source: AGRyM1s71flrfxXmVwXIrL+ndVipYvINrAHxZYCNeiPm1Zq8yUF7ggbSijZVnGeO/Y8/0rSRLpV7nbJKL0W7RYsDOss=
X-Received: by 2002:a17:907:ea9:b0:710:9003:9b33 with SMTP id
 ho41-20020a1709070ea900b0071090039b33mr4785134ejc.175.1655222429014; Tue, 14
 Jun 2022 09:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-21-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-21-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 17:00:13 +0100
Message-ID: <CAPY8ntDEYnyAOJy5YVSNzzDbc7nkU33q_CNaF6Q0k=ARpWLgug@mail.gmail.com>
Subject: Re: [PATCH 20/64] drm/vc4: dpi: Remove vc4_dev dpi pointer
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
>
> There's no user for that pointer so let's just get rid of it.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_dpi.c | 7 -------
>  drivers/gpu/drm/vc4/vc4_drv.h | 1 -
>  2 files changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index c180eb60bee8..f2b46c524919 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -249,7 +249,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
>  {
>         struct platform_device *pdev = to_platform_device(dev);
>         struct drm_device *drm = dev_get_drvdata(master);
> -       struct vc4_dev *vc4 = to_vc4_dev(drm);
>         struct vc4_dpi *dpi;
>         struct vc4_dpi_encoder *vc4_dpi_encoder;
>         int ret;
> @@ -308,8 +307,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
>
>         dev_set_drvdata(dev, dpi);
>
> -       vc4->dpi = dpi;
> -
>         vc4_debugfs_add_regset32(drm, "dpi_regs", &dpi->regset);
>
>         return 0;
> @@ -323,8 +320,6 @@ static int vc4_dpi_bind(struct device *dev, struct device *master, void *data)
>  static void vc4_dpi_unbind(struct device *dev, struct device *master,
>                            void *data)
>  {
> -       struct drm_device *drm = dev_get_drvdata(master);
> -       struct vc4_dev *vc4 = to_vc4_dev(drm);
>         struct vc4_dpi *dpi = dev_get_drvdata(dev);
>
>         drm_of_panel_bridge_remove(dev->of_node, 0, 0);
> @@ -332,8 +327,6 @@ static void vc4_dpi_unbind(struct device *dev, struct device *master,
>         drm_encoder_cleanup(dpi->encoder);
>
>         clk_disable_unprepare(dpi->core_clock);
> -
> -       vc4->dpi = NULL;
>  }
>
>  static const struct component_ops vc4_dpi_ops = {
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index fff3772be2d4..846f3cda179a 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -79,7 +79,6 @@ struct vc4_dev {
>
>         struct vc4_hvs *hvs;
>         struct vc4_v3d *v3d;
> -       struct vc4_dpi *dpi;
>         struct vc4_vec *vec;
>         struct vc4_txp *txp;
>
> --
> 2.36.1
>
