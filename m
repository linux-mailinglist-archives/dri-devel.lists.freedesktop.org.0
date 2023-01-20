Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E26A1675D3F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 19:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B28110E10E;
	Fri, 20 Jan 2023 18:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D5410E10E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 18:59:33 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id jm10so6097312plb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 10:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CSpcr6BECwbKqN5C4mS2QoXyKqAo8YI4sEb7as9mMCA=;
 b=KRSjIZAv+ErWFqsr1QieUudw00ZQ/GVCFpPHe8W2nhOfddYbmFpo959RykA0kpK8TD
 Fu5eLt60+46fFthd4RyUXPuIbaENX6lMR8PnOS4J7eJ5KtoYFcf48oLC3GeiqYZzfxfC
 OGVCGo0IYXqIohXVOTI2PfqQa632eS/ItjJIFTqIGX6z//lHtv/jgJ/QhQR+NTdllExj
 BB6OXAPy0fMBpwgaMHsF7JpFHzPJdBcxK56kagHNBwzEMwqCtNT9DwYxenqkBbteuF4e
 PCk3sJEbXyEd711OXL/Y7htNL3Pp+cp0ymqdcVrs7H7BYzf4i5/OxBrwqBq2QJBTSLB/
 ddYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CSpcr6BECwbKqN5C4mS2QoXyKqAo8YI4sEb7as9mMCA=;
 b=h0WuVacFaW4AtvyC5T53Oil++u8NU1R4KnOpF+dRh39fEUxxxhOxUlJmFPt/4kqSKx
 vnrKEo6ouqNp2bOO5OPBqmhd2C9G255l2wc1D+t8OOq4s10map7rgHPMEWMO7a7b+18u
 xJFVToMqKR1EOPTOMbi2AtYVCpy8VRUJexP4InR4i2z/uyQd6oH2JnE1fPXZ8jIiTXEj
 XqA1uDA57a+UHB60oCtMB+/U8H0p8JSpCQa4vCbFhBdg/X9x33JnXuhSXC4f8WuOODWQ
 f1uwkWBPJ+LUonOqCqpDQDsIRK4LroJQLBKwLPSvU9ifghEO/PDhg8dd1Du4QdgmV7KH
 9QDw==
X-Gm-Message-State: AFqh2krSDyLECv+u0yKKBcX/sYNPsxR6LVz5UB3GZyvGnuQ8CO3t+kA7
 oVz1GXS0+lAaXonQJZ0Kz1Szd7saBgHGDmz/naaw0Q==
X-Google-Smtp-Source: AMrXdXv1/Neiv/1e/D5P3hmgshhPwFZKpYyhL6uK8A1HX8UY+b2o3mE5r+RLm2T1i2rglg86eoRy2FTS+aDvDiQOgmA=
X-Received: by 2002:a17:902:d894:b0:193:405:1704 with SMTP id
 b20-20020a170902d89400b0019304051704mr1621761plz.31.1674241173411; Fri, 20
 Jan 2023 10:59:33 -0800 (PST)
MIME-Version: 1.0
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
 <CAMty3ZC9TtnupJKF4LA9e-jnYMux28u4Pn3femJZXi4ogV+drA@mail.gmail.com>
 <CAOMZO5AYzZXQ_7jqktKrGcZyE_CaZHZpfyQPWAzbcxGvByH5Kg@mail.gmail.com>
 <CAMty3ZDnNJJQ2=Xbi6tNDzp17Ye=mnVhPOEtWVZbZuot_N513w@mail.gmail.com>
 <CAOMZO5CXCYjmmjs97=c6pVzyG8s0W=XN01k0C_0M_X2-pCFuMQ@mail.gmail.com>
 <CAMty3ZAc=t5FEphQkd=O1eaA70-779zhESwPFqoiGs8x569H2w@mail.gmail.com>
 <ea400d44-a6cb-2f26-9c03-ee1ede2cdf09@denx.de>
In-Reply-To: <ea400d44-a6cb-2f26-9c03-ee1ede2cdf09@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Jan 2023 18:59:15 +0000
Message-ID: <CAPY8ntDUeWMXY_VuNyXUzuerXbnt8SmVL3M6KEpmfsc041G_2w@mail.gmail.com>
Subject: Re: [PATCH v10 00/18] drm: Add Samsung MIPI DSIM bridge
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>, Matteo Lisi <matteo.lisi@engicam.com>,
 Maxime Ripard <maxime@cerno.tech>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek & Jagan

On Fri, 20 Jan 2023 at 15:06, Marek Vasut <marex@denx.de> wrote:
>
> On 1/20/23 15:41, Jagan Teki wrote:
> > Hi Fabio,
>
> Hello all,
>
> > On Fri, Jan 20, 2023 at 5:36 PM Fabio Estevam <festevam@gmail.com> wrote:
> >>
> >> Hi Jagan,
> >>
> >> On Thu, Jan 19, 2023 at 2:59 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>
> >>> There are two patch series prior to this need to apply.
> >>>
> >>> https://patchwork.kernel.org/project/dri-devel/patch/20221212145745.15387-1-jagan@amarulasolutions.com/
> >>> https://patchwork.kernel.org/project/dri-devel/cover/20221212182923.29155-1-jagan@amarulasolutions.com/
> >>
> >> Would it make sense to re-submit these two patches as part of your series?
> >
> > The previous version's comment was to separate them from the DSIM series.
>
> Hmmmmm, seems like those first two patches got stuck. I fixed up the
> malformed Fixes: line (it was split across two lines and had angular
> brackets around it) and picked the first series via drm-misc-next .
>
> Can you send a subsequent patch to convert the DSIM_* macros to BIT()
> macro , since checkpatch --strict complains about it ?
>
> For the second series, you likely want a RB from Maxime Ripard and Dave
> Stevenson first about the probe order handling.

Not sure what I can add for "Enable prepare_prev_first flag for
samsung-s6e panels" and "tc358764: Enable pre_enable_prev_first flag"
as I have no datasheet for those devices.
On the basis that they are wanting the DSI host to be in LP-11 before
prepare/pre_enable, then setting the flag is the right thing. More
than happy to say
Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
to those two (I can't find them quickly in my mail to respond directly).

I have just sent a separate response on the third patch.

  Dave
