Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ED567B822
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 18:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F06510E374;
	Wed, 25 Jan 2023 17:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9F710E374
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 17:13:11 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id u72so3192241ybi.7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 09:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=10jznw+dU73F3G+2htQ5BN40SBePEPoWssf6etHuDyY=;
 b=H2uHFkikzN+jd9LeHgxQ/ZY6toSFHwcEEkxyffyZMvcbcJiF+PemgjFXOd/+L8AeV1
 8BnSL9VEA+XC5RObgMF6gnFC+jLnrEARLmaI6/H7J37kal2g+MA4EKhyvTXw45Tje+8o
 DWNbCULokMtoUweg+FTfbYPQgiGII68lpuYMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=10jznw+dU73F3G+2htQ5BN40SBePEPoWssf6etHuDyY=;
 b=DsWhJQMm0dcahmdGIOPGfZSfvxwD6mEYhJ4eovKwLar2dqBDllV9+aTWVunYEaZhQC
 dEfkFP9H0jOCikHqhnDHj0dG6lezQO/3qcHlRlHnwpPQv18RhZsbG1VTnYJqPkViJ08t
 nYEs1E4iyx3b4gFoszsdIfIlGsQXqjuSX8XHMQ5Aw2QHziHAd/Fr3NSg6GuOblc96ke1
 VpPh9KO8fczM6+ru4oq4hzQIy3DcZLPaaITb5Gyzdls11PplGOkhlnl4u2R9XJyez5gf
 4XBGlsDOgqXA0jMsyajajOiFkD5hoD2H1GP6tEr3tK1gOQwNXMYIjHEcZZ19Sl7AIp9q
 oDAw==
X-Gm-Message-State: AFqh2krPLy1QgmcnDYNzRdkpZesENVZgNUbZtLHGdOwIIljIj1AQ0na2
 PHVYypKx++T5wnObtAxNlxc2W22Odd3I8h6adQtDAw==
X-Google-Smtp-Source: AMrXdXsXwmHr8ksQpE5sZjWMMY7j20SdU+Ico84VAihCay6thuoD5W6vjfU0+10OYT51WJn5mFVccCJcQfcjiJ9GpME=
X-Received: by 2002:a25:5f43:0:b0:7fe:b611:d88c with SMTP id
 h3-20020a255f43000000b007feb611d88cmr2459544ybm.594.1674666791005; Wed, 25
 Jan 2023 09:13:11 -0800 (PST)
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
In-Reply-To: <c67cdb83-2fef-ad7c-f2c4-e2a6eb09a3e8@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 25 Jan 2023 22:42:59 +0530
Message-ID: <CAMty3ZAh7J6_X9NkE+-mBrHBFx+KfuQXPBUYyL5g2vu_Y5X9iw@mail.gmail.com>
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

On Wed, Jan 25, 2023 at 10:16 PM Marek Vasut <marex@denx.de> wrote:
>
> On 1/25/23 15:04, Jagan Teki wrote:
> > On Wed, Jan 25, 2023 at 7:23 PM Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 1/25/23 07:54, Jagan Teki wrote:
> >>> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>>>
> >>>> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>>>>
> >>>>> On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
> >>>>>>
> >>>>>> On 1/24/23 22:01, Jagan Teki wrote:
> >>>>>>> On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
> >>>>>>>>
> >>>>>>>> On 1/23/23 16:12, Jagan Teki wrote:
> >>>>>>>>> Enable and disable of te_gpio's are Exynos platform specific
> >>>>>>>>> irq handling, so add the exynos based irq operations and hook
> >>>>>>>>> them for exynos plat_data.
> >>>>>>>>
> >>>>>>>> If this is just an optional generic GPIO IRQ, why not keep it in the
> >>>>>>>> core code ? TE (tearing enable?) should be available on MX8M too.
> >>>>>>>
> >>>>>>> So far the discussion (since from initial versions) with Marek
> >>>>>>> Szyprowski, seems to be available in Exynos. So, I keep it separate
> >>>>>>> from the DSIM core.
> >>>>>>
> >>>>>> Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .
> >>>>
> >>>> I will check this.
> >>>
> >>> In order to use TE_GPIO we need te handler implementation, right now
> >>> Exynos CRTC DRM drivers have implementation for this. That is the main
> >>> reason to keep the TE_GPIO handling in exynos, maybe if we handle that
> >>> generically then it is a viable option to move TE_GPIO to the DSIM
> >>> core.
> >>
> >> I think you can do this exactly the same way exynos does it -- check
> >> whether te_handler() callback is implemented by the glue code (the one
> >> you already have for various exynos and imx8mm/imx8mm SoCs) and if so,
> >> call it. If it is not implemented, do not call anything in the TE IRQ
> >> handler.
> >
> > I need to understand how i.MX8MM handles this on TE IRQ in the DSIM
> > host side, Can I do this in future patch set as it might involve
> > bindings changes as well if it's part of DSIM?
>
> Why not leave an empty te_handler implementation on MX8M for now ?
> You can fill that implementation in future patchset, but the generic
> part of the code would be in place .

Look like we have one issue to move regster te_irq into samsung-dsim.

exynos_dsi_register_te_irq is done after the bridge attach is done in
Exynos, here bridge attach is triggered in the component ops bind
call, since samsung-dsim is a pure bridge w/o any component ops.
https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/bridge/samsung-dsim.c#L1527
https://github.com/openedev/kernel/blob/imx8mm-dsi-v12/drivers/gpu/drm/exynos/exynos_drm_dsi.c#L112

Any suggestion on how to handle this?

Thanks,
Jagan.
