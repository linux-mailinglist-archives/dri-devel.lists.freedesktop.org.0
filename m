Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAF1625A53
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 13:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D14810E7FF;
	Fri, 11 Nov 2022 12:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF2110E807
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 12:12:55 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id v81so1737623vkv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 04:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+bqRX/1AGL3Fy1iw8VYJyV8azK5p+mNvSynHj9OnX4=;
 b=RYKtB5c1TQD4IZCuBjyXdrjPhoWA6iK+klMuG+68e8aVi+Vh+1VtMg5I7NE4phkWdW
 wV/TTQipXQd+kbpMWSFzW9bjPuo8xRXEVv6kiUn0zBeb1BBLivyu6kIZDc3Xxuk6sZUY
 5Ed1Twx1j9Yfl03hhHTQds/4q4dc/iTJmUWeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+bqRX/1AGL3Fy1iw8VYJyV8azK5p+mNvSynHj9OnX4=;
 b=yDhbuQor/i1yMHSIuSpL3jcQeH87OFPBbnMI3QjkHig/kubiWCTYHolIY6bI2U8GnJ
 0ul2CCvH3OOzhJA82Qzqeel4/f31aE9eX+YMK6vTDrvWPRp3e6x424Lba5Guuf33YA2n
 eo2SUGX4LabyYHr0H1e2Kq091Y4TEVaapL/3J8ng+0wcufpLNq8MvmcmZ132OD3ixyQv
 krNBbDXAgp/kzwDyOmAOxOxiR8xkuKvPxBgRuhZ5WuHUCWQ8ay61w2wkTrZvrC48+OpY
 RxlujOGWorKEvYoNGt34uVlmnQ3t/95Yn/8TdYAQhzazk4u6qapJxISDLQiskcuAOwAm
 c5qQ==
X-Gm-Message-State: ANoB5pmBgmuG9meCZbd7scDc+jQtyyVhRWGKmcSn1s3PE0tdzAEAKx1+
 ijDycilNvsbSwzdQ9HGPUEThCyG8z2jqgaFBErFvLQ==
X-Google-Smtp-Source: AA0mqf6io/7aUf/ki3e5SFEAWsCBMKBT/LHbJFo0J5p5HR4Eh+bQBCLzYTJ+DCuZyb88MV2zAsE1kwMiUGly43OvF4o=
X-Received: by 2002:ac5:c385:0:b0:3b8:4e2b:4540 with SMTP id
 s5-20020ac5c385000000b003b84e2b4540mr729215vkk.26.1668168774665; Fri, 11 Nov
 2022 04:12:54 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-2-jagan@amarulasolutions.com>
 <CANMq1KCHQExVVp1jHjhRB2pMqeFFE1Cg1GVmnN83v=z1KzJt0Q@mail.gmail.com>
 <CAMty3ZBC3pbWf4yixjv4DZWFR+fYkPctiL3hzubgY8RF4ZGHmA@mail.gmail.com>
In-Reply-To: <CAMty3ZBC3pbWf4yixjv4DZWFR+fYkPctiL3hzubgY8RF4ZGHmA@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 11 Nov 2022 20:12:43 +0800
Message-ID: <CANMq1KDmF+cMo8qZh7UyM1vyZ6BD_cFPc6j2MNMNPFiutqxL3w@mail.gmail.com>
Subject: Re: [PATCH v8 01/14] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 11, 2022 at 4:49 PM Jagan Teki <jagan@amarulasolutions.com> wro=
te:
>
> On Fri, Nov 11, 2022 at 6:19 AM Nicolas Boichat <drinkcat@chromium.org> w=
rote:
> >
> > On Fri, Nov 11, 2022 at 2:40 AM Jagan Teki <jagan@amarulasolutions.com>=
 wrote:
> > >
> > > HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
> > > 0 =3D Enable and 1 =3D Disable.
> >
> > Oh I see, that's confusing... IMHO you might want to change the
> > register macro name... (but if that's what the datasheet uses, it
> > might not be ideal either). At the _very_ least, I'd add a comment in
> > the code so the next person doesn't attempt to "fix" it again...
>
> 02/14 on the same series doing the name change.
> https://lore.kernel.org/all/20221110183853.3678209-3-jagan@amarulasolutio=
ns.com/

Oh thanks I wasn't cc'ed on that one, makes sense.

You can add my reviewed tag to this one, as my HSE comment doesn't change t=
his.

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

But please double check HSE.

>
> >
> > BTW, are you sure DSIM_HSE_MODE is correct now?
>
> Yes, we have tested in imx8m platforms as well. S=C3=A9bastien Szymanski
> initially observed this issue on the imx8m platform.

I'll repeat, are you sure about HSE specifically? You invert the
polarity for HBP, HFP, and HSA, which makes sense given your patch
02/14.

I'm concerned about HSE. Is the bit really a disable bit?
MIPI_DSI_MODE_VIDEO_HSE is supposed to be an enable flag, so you
should not do `reg |=3D DSIM_HSE_DISABLE;`, probably.

Thanks,

>
> Jagan.
