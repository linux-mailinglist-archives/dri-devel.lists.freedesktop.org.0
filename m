Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 109C8706655
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 13:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19C710E3E7;
	Wed, 17 May 2023 11:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEFC10E3E7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 11:14:36 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-51b4ef5378bso557168a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 04:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684322075; x=1686914075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/Xmg0O869YONDDMLwqg9d/3/NvawOKxY5WTUQTRsXs4=;
 b=gsJEmNx011NZDQBVn9JarypfjzrP9WDlPO7alzVcBkMUU3laeNeMqHKj4nr+jW5QdI
 qVdDN5bKAkOPmAq6ylek2sXRXvoUuOg4emMTSyPwJLa4Q18TTNOucGsksdBOqhX/KWjA
 mEIlXPOd6mlzFtobzaxjdNn+RhpNTJSPJkZikEWuqKBspfslOO2/kRGWTKDeWwGYdK40
 v0Ukvahg6BqNlM7NKd2PT7Hpycuvcx2WG/2JsqRWXek03dksyzMlMLw6Z9sHUm97wMxs
 rP7Mo/lsYRtsWagPT1kzP3C4VX/MpSGr9QJN6BtHXTp4iAzdDIMdCasaPi2MNC6aZrfa
 RHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684322075; x=1686914075;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/Xmg0O869YONDDMLwqg9d/3/NvawOKxY5WTUQTRsXs4=;
 b=YAxnyg6XWxh/cPXFX2DM7m+D7g3ZENi1Q9/Ko1mW0sXbL4CDFfN8uHD+rODCVtiGlC
 PQZu2jLVGoj/TuVCStOO+j+T8xrTetVKdbZbCHQGqDzCYLwpqRvBX0PWVg7E1DWlGz6P
 5jrUp7eiD9HNcZKOyDJsZyfBEpqWt8mNqYrPMsZHsKquA7G3KhCTTuciUCWYry3hYt/D
 w6f5AuqynDWAIzgQYQhYmYJbFpCvdggIWuOoGhmoyQHz94LInRZSDmanBFjjVAQ2lsY+
 ejMbsS4s8lb6N8kzQjfNdSYBBpWqkzyDV6B7WWrjZTiB6jm/SZ3OUr8IfuOTTZPqsViS
 P89g==
X-Gm-Message-State: AC+VfDxwJIMyBvVxmdvNDOv2IrU4axIbmkLx6N84+H1UJJm2+i4R0/UX
 3DNbPi2JL7sUdR0TCZGcmco7n9/ndPqhWReP058=
X-Google-Smtp-Source: ACHHUZ4OfzYF7x5ng3MrSzcFycroJmBpDU07iAMnA1Ywp/koOW+8aaV/zJ0+iXsq5LZsC/PgdZqKRDC/ykobGmQ1k2g=
X-Received: by 2002:a17:90a:fcf:b0:253:4c99:6342 with SMTP id
 73-20020a17090a0fcf00b002534c996342mr681855pjz.46.1684322075405; Wed, 17 May
 2023 04:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-5-aford173@gmail.com>
 <CAMty3ZAU3NG8yk1dFB4Y3QtCZ7j7XUTqKHkJVKhhOduc4V5XpQ@mail.gmail.com>
In-Reply-To: <CAMty3ZAU3NG8yk1dFB4Y3QtCZ7j7XUTqKHkJVKhhOduc4V5XpQ@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 17 May 2023 06:14:23 -0500
Message-ID: <CAHCN7xKweWg2OtvWzBaBMzEQgV9ychK+U9J3=Z+-0XwR4cHrqA@mail.gmail.com>
Subject: Re: [PATCH V6 4/6] drm: bridge: samsung-dsim: Select
 GENERIC_PHY_MIPI_DPHY
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 6:05=E2=80=AFAM Jagan Teki <jagan@amarulasolutions.=
com> wrote:
>
> Hi Adam,
>
> On Tue, May 16, 2023 at 5:27=E2=80=AFAM Adam Ford <aford173@gmail.com> wr=
ote:
> >
> > In order to support variable DPHY timings, it's necessary
> > to enable GENERIC_PHY_MIPI_DPHY so phy_mipi_dphy_get_default_config
> > can be used to determine the nominal values for a given resolution
> > and refresh rate.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kc=
onfig
> > index f076a09afac0..82c68b042444 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -227,6 +227,7 @@ config DRM_SAMSUNG_DSIM
> >         select DRM_KMS_HELPER
> >         select DRM_MIPI_DSI
> >         select DRM_PANEL_BRIDGE
> > +       select GENERIC_PHY_MIPI_DPHY
>
> Is it really required? phy is optional as it is not required for
> imx8mm/n/p as of now. May be we can add it while supporting it.

This was added to the series because build errors were reported
without it due to the fact that I added calls to
phy_mipi_dphy_get_default_config_for_hsclk.
Selecting this config option guarantees
phy_mipi_dphy_get_default_config_for_hsclk will be built and removes
the build error for Exynos and some 32-bit builds.

phy_mipi_dphy_get_default_config_for_hsclk sets the DSI configurations
like lpx, hs_exit, clk_prepare, clk_zero, clk_trail, hs_prepare,
hs_zero and hs_trail and those need to be
dynamic in order to functional at various resolutions.  I did try
leaving the hard-coded values you used, and I wasn't successful in
getting much to sync.

adam

>
> Thanks,
> Jagan.
