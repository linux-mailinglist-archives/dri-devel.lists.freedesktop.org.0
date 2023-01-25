Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC4D67B8AC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 18:36:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC95310E0C3;
	Wed, 25 Jan 2023 17:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E5210E0C3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 17:35:57 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-506609635cbso59473667b3.4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 09:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sLdv2Pq53a6vZyVVcX2zLb9TAy6HzzMK+y+dx6JC+Lk=;
 b=dbmRy/zYnZU/M5INdVitjh85ZSEKWF1DQvm+OSMTwpP8/J7nXfaKdncz7Snr8+smLi
 7Xi/hsMp+w+prUmQQU409wp9ax/6qQ6lzuwrpyWRtwA03xm3lFryNM6vA0L0jNAv6O6I
 cMGzJnlaz6waMXOl5o+Yyvj1Pgm+a7toTM8dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sLdv2Pq53a6vZyVVcX2zLb9TAy6HzzMK+y+dx6JC+Lk=;
 b=3YDfWJBap9w9soyVd265OpZ6uf+F+9YcvnH0bR2enZU4bZj+JhXsUmqBu2SBau8yuB
 66GVBimwEt4hfGPKngW5IE2PM5Pdm/flnltWPyeTUcucTvecjxNaHMZVAykByfmC8Uhe
 AK5z2qJbPvadNDGBoTropnBllPoomXbiOYTmaF73cfCprj0NplTWFMVKEvzCzqyJCg7F
 BUpP1xmOZoMWPDhEXTI1l9ZmnAHSMoB54OSnliCX4zF+CE0vzhpx5FfPOaNkHXZzY6N9
 N2Q4N4vaCVqOmbX1Cec1MydE1S24SHoFxE5nxBRhdbFi+oZ04Y8tNYh+YHmDplMaG6Fg
 BYjA==
X-Gm-Message-State: AO0yUKW820BczFM/iSqj/vysiiH5Puh1cRsB9oFDRif1cfW6AcwNet9d
 Q9vCr9oIUIdDIkBlQqgU8jQkl1QdBbKAcZ4z2ZRubw==
X-Google-Smtp-Source: AK7set8dZvYXO9O3Yo3GqCYBfsHOcPW61gmf10CtU9i82U6qwqanae2Yypwvvel3B9n8cSWxBRjp/LOAB4yZWl5d3EA=
X-Received: by 2002:a81:ae61:0:b0:506:6364:fda3 with SMTP id
 g33-20020a81ae61000000b005066364fda3mr503445ywk.72.1674668156462; Wed, 25 Jan
 2023 09:35:56 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com>
 <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
 <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
 <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de>
 <CAMty3ZAYz=XEN6s1XhBWg5b77kk+s942qa9Oz4E4oHtSfaVZtA@mail.gmail.com>
 <CAMty3ZB8jAoKzXpPJzrfH6bOGBOpJRuTacgQDSg8kVuhg7p37Q@mail.gmail.com>
 <CAMty3ZDNwJ40pPJFKqwMd13y-rF9ELb5N6JZffea6T4dnD-0nA@mail.gmail.com>
 <d8e539bd-93db-fb6f-eaec-463f382a1dfb@denx.de>
 <CAMty3ZBxbwwocAwZ18o8tis54SRC64853b+p8VfzcD=OWrjP6Q@mail.gmail.com>
 <c67cdb83-2fef-ad7c-f2c4-e2a6eb09a3e8@denx.de>
 <CAMty3ZAh7J6_X9NkE+-mBrHBFx+KfuQXPBUYyL5g2vu_Y5X9iw@mail.gmail.com>
 <a756fd20-28e4-85e7-3947-4c468bf3366d@denx.de>
In-Reply-To: <a756fd20-28e4-85e7-3947-4c468bf3366d@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 25 Jan 2023 23:05:44 +0530
Message-ID: <CAMty3ZDTcnN_NgjL8hEBnABpFcaE=hCegZnzaC9tz-7wFxYSmw@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 13/18] drm: exynos: dsi: Add Exynos based host
 irq hooks
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 10:57 PM Marek Vasut <marex@denx.de> wrote:
>
> On 1/25/23 18:12, Jagan Teki wrote:
> > On Wed, Jan 25, 2023 at 10:16 PM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 1/25/23 15:04, Jagan Teki wrote:
> >>> On Wed, Jan 25, 2023 at 7:23 PM Marek Vasut <marex@denx.de> wrote:
> >>>>
> >>>> On 1/25/23 07:54, Jagan Teki wrote:
> >>>>> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>>>>>
> >>>>>> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>>>>>>
> >>>>>>> On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
> >>>>>>>>
> >>>>>>>> On 1/24/23 22:01, Jagan Teki wrote:
> >>>>>>>>> On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
> >>>>>>>>>>
> >>>>>>>>>> On 1/23/23 16:12, Jagan Teki wrote:
> >>>>>>>>>>> Enable and disable of te_gpio's are Exynos platform specific
> >>>>>>>>>>> irq handling, so add the exynos based irq operations and hook
> >>>>>>>>>>> them for exynos plat_data.
> >>>>>>>>>>
> >>>>>>>>>> If this is just an optional generic GPIO IRQ, why not keep it in the
> >>>>>>>>>> core code ? TE (tearing enable?) should be available on MX8M too.
> >>>>>>>>>
> >>>>>>>>> So far the discussion (since from initial versions) with Marek
> >>>>>>>>> Szyprowski, seems to be available in Exynos. So, I keep it separate
> >>>>>>>>> from the DSIM core.
> >>>>>>>>
> >>>>>>>> Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .
> >>>>>>
> >>>>>> I will check this.
> >>>>>
> >>>>> In order to use TE_GPIO we need te handler implementation, right now
> >>>>> Exynos CRTC DRM drivers have implementation for this. That is the main
> >>>>> reason to keep the TE_GPIO handling in exynos, maybe if we handle that
> >>>>> generically then it is a viable option to move TE_GPIO to the DSIM
> >>>>> core.
> >>>>
> >>>> I think you can do this exactly the same way exynos does it -- check
> >>>> whether te_handler() callback is implemented by the glue code (the one
> >>>> you already have for various exynos and imx8mm/imx8mm SoCs) and if so,
> >>>> call it. If it is not implemented, do not call anything in the TE IRQ
> >>>> handler.
> >>>
> >>> I need to understand how i.MX8MM handles this on TE IRQ in the DSIM
> >>> host side, Can I do this in future patch set as it might involve
> >>> bindings changes as well if it's part of DSIM?
> >>
> >> Why not leave an empty te_handler implementation on MX8M for now ?
> >> You can fill that implementation in future patchset, but the generic
> >> part of the code would be in place .
> >
> > Look like we have one issue to move regster te_irq into samsung-dsim.
> >
> > exynos_dsi_register_te_irq is done after the bridge attach is done in
> > Exynos, here bridge attach is triggered in the component ops bind
> > call, since samsung-dsim is a pure bridge w/o any component ops.
> > https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/bridge/samsung-dsim.c#L1527
> > https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/exynos/exynos_drm_dsi.c#L112
> >
> > Any suggestion on how to handle this?
>
> Why isn't the generic code calling drm_bridge_attach() in
> samsung_dsim_host_attach(), like the exynos one ?

Exynos drm drivers follow component ops and generic dsim is a pure drm
bridge whose downstream bridge will attach in bridge ops attach and
the component-based drivers require an initial bridge attach (whose
previous is NULL) call in the component bind hook for establishing the
bridge chain.

Jagan.
