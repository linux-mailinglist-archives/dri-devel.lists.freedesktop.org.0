Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB3F484439
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 16:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3F310E464;
	Tue,  4 Jan 2022 15:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B570A10E464
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 15:07:45 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id co15so31577719pjb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jan 2022 07:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tdqDwnzDnwpOsGUw/UOzD51FTLuxeBoE04W8D7HkRn8=;
 b=ir/19q1WfZWHP1s1XaNc5jVsYmRnEWtpMuYZ2P3C2SrwANSl/pskOuW56egjRqAM5s
 fD2ECoMK24yo5/2egJgSG2tShRirQmBzR2L7N5wlFFBUsNm/GXuVqW59yjrxe3wsHidI
 wbXMkSfEuC6H7p8GCNMBP5tA9ZIi5W7kD0w2gneF3EeguiTsUE9p5bIUfxR+lkJ0/RMI
 XVh3ATRb4MLwibFMkh40g5DSVozXtfJj15Rw/apEG3bEv6Btj/R0qOIV7eCPfxn31MMW
 mjjRDiOLDBB06AJNjgBP0S2xMumwdmsNyFefW0/2c+CeiKEsRuvxdqDlU8YunudVy1VB
 qmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tdqDwnzDnwpOsGUw/UOzD51FTLuxeBoE04W8D7HkRn8=;
 b=lMvvAyzreUaK+LTS3mPjGs/xPXAJnPWa7T3T8ykoI1Mt8pc7OIexQYITt+LgVeVaGV
 dNdZjD6erXQRSGFtHwS1EMYRjWhzyWUEQcaRCq6FEj/lf6hy070bauVkLBLv+ucNAh8S
 BUf1aUDBqbWwZbCtofI0dPhYsLqeLJW+fLCWcxHGFoYz7Lu0A5d4kK4mlQtRnQG2lBfR
 53fASq250fhcgQ4qxecIV4LOmH8+LMsKSQEXnSVdeTsp12Q3JEXu06+X5xrYPUdLPbMM
 iFWrEiIwxbULRrFTFbyvAbSDsqTfv6eOwlp0aJD3dG9yV6vhkkwKrRzBJ2L90KQ+usfC
 yU/g==
X-Gm-Message-State: AOAM533OLOGDPW7Uy8CxezwilD9xHcPoo/Q0HH1SKvTTFSg1XvnFc8Gp
 gEkDXvhNN3H/R7SXk1HTIuE8kXVX3RXcO858Nrunyw==
X-Google-Smtp-Source: ABdhPJz/1ViqzdSdgrN5b1vPnQpmUX0/aXgnYN0jItztAj9WHkhjCCQNDBC83nyIeTIruPjHDvB3+N1rGXp9lKyydmY=
X-Received: by 2002:a17:90b:4c89:: with SMTP id
 my9mr58836919pjb.152.1641308865015; 
 Tue, 04 Jan 2022 07:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20211122070633.89219-1-jagan@amarulasolutions.com>
 <20211122070633.89219-3-jagan@amarulasolutions.com>
In-Reply-To: <20211122070633.89219-3-jagan@amarulasolutions.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Jan 2022 16:07:34 +0100
Message-ID: <CAG3jFytZrvjtS0Hna6FHSAcnzNTK+DnPaPA+EskP_ePYkKehvg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: exynos: dsi: Add mode_set function
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On Mon, 22 Nov 2021 at 08:06, Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> Get the display mode settings via mode_set bridge function
> instead of explicitly de-reference.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 174590f543c3..3d4713346949 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -260,6 +260,7 @@ struct exynos_dsi {
>         struct drm_bridge bridge;
>         struct drm_bridge *out_bridge;
>         struct device *dev;
> +       struct drm_display_mode mode;
>
>         void __iomem *reg_base;
>         struct phy *phy;
> @@ -883,7 +884,7 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
>
>  static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
>  {
> -       struct drm_display_mode *m = &dsi->encoder.crtc->state->adjusted_mode;
> +       struct drm_display_mode *m = &dsi->mode;
>         unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
>         u32 reg;
>
> @@ -1526,6 +1527,15 @@ static int exynos_dsi_create_connector(struct exynos_dsi *dsi)
>         return 0;
>  }
>
> +static void exynos_dsi_mode_set(struct drm_bridge *bridge,
> +                               const struct drm_display_mode *mode,
> +                               const struct drm_display_mode *adjusted_mode)
> +{
> +       struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> +
> +       drm_mode_copy(&dsi->mode, adjusted_mode);
> +}
> +
>  static int exynos_dsi_attach(struct drm_bridge *bridge,
>                              enum drm_bridge_attach_flags flags)
>  {
> @@ -1540,6 +1550,7 @@ static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
>         .atomic_reset           = drm_atomic_helper_bridge_reset,
>         .atomic_enable          = exynos_dsi_atomic_enable,
>         .atomic_disable         = exynos_dsi_atomic_disable,
> +       .mode_set               = exynos_dsi_mode_set,
>         .attach                 = exynos_dsi_attach,
>  };
>
> --
> 2.25.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
