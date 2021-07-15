Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B63A3C9D83
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 13:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADF66E822;
	Thu, 15 Jul 2021 11:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81606E822;
 Thu, 15 Jul 2021 11:09:55 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 h24-20020a9d64180000b029036edcf8f9a6so5759505otl.3; 
 Thu, 15 Jul 2021 04:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VnIvSXzuiLKWuvgulqfarspmLG2dOzwb7htWyTzwsjw=;
 b=jZSvmaYSy8ADTgcCb9b7ny+VGlsNNLLNOYJdU7McebyVX4mq0pGAcstpYcMq1Aiv6S
 XOo3xy1FWet7MXd7e7bhh9ULV6oDNaPZwU83/HY/YN+avkBCc7WRn8rrw01zsWV94kqD
 zveDrhVhYXZNw9+xQg2SBfo7OMbtziipz+BPTRr2nVTwTX5Zbj3LNmo5gqPZla4YgjUr
 CMVnzDdH9YVyJCAxYWCz6i0n7jvRINXJv0bLBQO52VA4L5QduTy2cR8drOamqk/LOftw
 kysUkWgyiG6dY9FlEfnonTf57JurQjQ+0MQUH4y/eduUeozIhN6rWYTFT2mAUx+bFtCa
 eVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VnIvSXzuiLKWuvgulqfarspmLG2dOzwb7htWyTzwsjw=;
 b=e6STrcDKzWNO3T2Ev2Bp9sh2akAJ2k6ao22iba10cUA7tbqKXEgf66H1/FXu4y1LJm
 iHRHJcB3hq/pF0ldX7y/dk2gWRfdcffWggazqp1YopOY1Cqyr3DOg1QENBoDdMXSI0Dh
 0jyYQAHv6TTL/x9BgTgq3RJAcAgJ7ayxCpRnJnYv8p78YEAt7eZDP4veL7UT8ax5vk3o
 Lsu+WjA2iPu+PfW0WOPTg6nX6cOHPo5rKzm4Zhm0W0VsxHuCplIZflzu344oU1jqxyDc
 EmrnT/eR5NjMXcuy7ircbGygQ6le8oClZ8iUojpSXyWMIsn9R3kY2CVrQYRZS11Phgkw
 GveQ==
X-Gm-Message-State: AOAM530pPwPyb8ecPcN9ifkzS4qArBvM+XulUmxvOxl+BykV7YRNn65D
 ZsHuxxwcD7uxS8jFwy2dzlXGm1XpIyJBxL/BTMU=
X-Google-Smtp-Source: ABdhPJyE6O2CsuPYvTE0fEvIRod8YkMOcqSCGJb0RhRrpq/XyumDEFhAFhjuy8zGn19Bma0gQJuRs9BuxAPgAU8c3Mw=
X-Received: by 2002:a05:6830:19cd:: with SMTP id
 p13mr2307456otp.362.1626347395013; 
 Thu, 15 Jul 2021 04:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210624105517.3886963-1-hsinyi@chromium.org>
 <20210624105517.3886963-2-hsinyi@chromium.org>
In-Reply-To: <20210624105517.3886963-2-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 15 Jul 2021 13:09:43 +0200
Message-ID: <CAFqH_51zDMC6N-1DBiSfARTM-SG0SH9VAXOX=G1W6yHJaVBL3A@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 2/3] drm/mediatek: init panel orientation
 property
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi,

Thank you for your patch.

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dj., 24 de juny
2021 a les 12:55:
>
> Init panel orientation property after connector is initialized. Let the
> panel driver decides the orientation value later.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

As together with the other two patches works and I don't see any
problem on the Lenovo IdeaPad Duet, and the panel has the proper
orientation


> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index ae403c67cbd92..9da1fd6491319 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -964,6 +964,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>                 ret = PTR_ERR(dsi->connector);
>                 goto err_cleanup_encoder;
>         }
> +
> +       ret = drm_connector_init_panel_orientation_property(dsi->connector);
> +       if (ret) {
> +               DRM_ERROR("Unable to init panel orientation\n");
> +               goto err_cleanup_encoder;
> +       }
> +
>         drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>
>         return 0;
> --
> 2.32.0.288.g62a8d224e6-goog
>
