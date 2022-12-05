Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FEA642802
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 13:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BB610E1B3;
	Mon,  5 Dec 2022 12:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE1010E1CB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 12:06:16 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-3b10392c064so115752927b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 04:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OrDSz1v9qyNjHSfcaUzl0KseW+BdUND2SR3NKy5ohvo=;
 b=JVI6tC0j8MUWq8058NICxilbSJ0mIl1vJnSCq38O1iQw78yaTNZKoY8s9DFI4b15Zy
 gF3c2tBYI31QQjjLQCNk8Su8s0rr41C1Rn3HfkDCXB3jc5fcTo/em9nsygWNgFOvBQgM
 fVa2i98NImyIlY5JqOC255M9/Ug18pSmGLSHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OrDSz1v9qyNjHSfcaUzl0KseW+BdUND2SR3NKy5ohvo=;
 b=kENcJQrDUfvf9TvD6YE9l7McP+JKaijjpAMZNKWMF09b8TaO3cOKSLilSV6sb3Mfya
 0WIBNZFDReJjk7fTYOMtKwbIkBCT9S2aUF4w0CM+4MJkHaKPD0vPW42RfjYdtubLYUk2
 gUayHH0VzlgNULbD7YmHjjGW0V69FRgWnDeuVd2VpvU6BgiZZI8GL0em5IXa4M0kdQO2
 DkBLMjAAfWC6PtgLeVD+B+Dut8vcK0QaCwuQskLAeY/597sSmWZdROxfr7ZB84hdSG9l
 Tuq9ZChzhcb1dHwU0HHSbB+P85cddg2QiMunxKSukHSJJjDzx2ipF3DlOSu0e1Sw533l
 d4Ng==
X-Gm-Message-State: ANoB5pkpOKqtTsvQW8MDKgDnRPDvuZoDB8iVCBBCUCMkD3tJw3bC7oGr
 sZ2Vj0qPl83gqFhPNg7iy8AF0CkeCVYS1s2N+elulw==
X-Google-Smtp-Source: AA0mqf4JPC8fLduP2jgV//4lunhlPYXqSvawe4GsRfezQ/THGEDzEtOZpD33TCjgo6axNknJUNVnt/GTnkwKtAbd3OQ=
X-Received: by 2002:a05:690c:91:b0:392:1434:c329 with SMTP id
 be17-20020a05690c009100b003921434c329mr61359779ywb.72.1670241975488; Mon, 05
 Dec 2022 04:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-3-jagan@amarulasolutions.com>
 <8dea3d9c-61b6-c576-ff97-89e4ad55a5d2@kontron.de>
In-Reply-To: <8dea3d9c-61b6-c576-ff97-89e4ad55a5d2@kontron.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 5 Dec 2022 17:36:03 +0530
Message-ID: <CAMty3ZCM-R2aWj5pTVX9vSRw4VFWgayrZs+1hJ50HOmPZtNPxw@mail.gmail.com>
Subject: Re: [PATCH v8 02/14] drm: exynos: dsi: Properly name HSA/HBP/HFP/HSE
 bits
To: Frieder Schrempf <frieder.schrempf@kontron.de>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 5, 2022 at 5:29 PM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 10.11.22 19:38, Jagan Teki wrote:
> > HSA/HBP/HFP/HSE mode bits in Exynos DSI host specify a naming
> > conversion as 'disable mode bit' due to its bit definition,
> > 0 = Enable and 1 = Disable.
> >
> > Fix the naming convention of the mode bits.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > index b5305b145ddb..fce7f0a7e4ee 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -75,10 +75,10 @@
> >  #define DSIM_MAIN_PIX_FORMAT_RGB565  (0x4 << 12)
> >  #define DSIM_SUB_VC                  (((x) & 0x3) << 16)
> >  #define DSIM_MAIN_VC                 (((x) & 0x3) << 18)
> > -#define DSIM_HSA_MODE                        (1 << 20)
> > -#define DSIM_HBP_MODE                        (1 << 21)
> > -#define DSIM_HFP_MODE                        (1 << 22)
> > -#define DSIM_HSE_MODE                        (1 << 23)
> > +#define DSIM_HSA_DISABLE             (1 << 20)
> > +#define DSIM_HBP_DISABLE             (1 << 21)
> > +#define DSIM_HFP_DISABLE             (1 << 22)
> > +#define DSIM_HSE_DISABLE             (1 << 23)
> >  #define DSIM_AUTO_MODE                       (1 << 24)
> >  #define DSIM_VIDEO_MODE                      (1 << 25)
> >  #define DSIM_BURST_MODE                      (1 << 26)
> > @@ -804,13 +804,13 @@ static int exynos_dsi_init_link(struct exynos_dsi *dsi)
> >               if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_AUTO_VERT)
> >                       reg |= DSIM_AUTO_MODE;
> >               if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
> > -                     reg |= DSIM_HSE_MODE;
> > +                     reg |= DSIM_HSE_DISABLE;
>
> Please add a comment to explain that the DSIM_HSE_DISABLE bit as named
> in the datasheet actually has inverted logic (set = HSE enabled).

Yes, I have the V9 series with all relevant fixes and updates -
waiting for the responses on the host init patch 06/14

Jagan.
