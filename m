Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE963B80C8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 12:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A49F89DC7;
	Wed, 30 Jun 2021 10:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630B689DC7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 10:21:47 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id yy20so3366327ejb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 03:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pRd6pcMdNebp+pN5HMRRgF54QAuGLj+u/RVF3wGoo18=;
 b=ATKO+gmm4xEc6zgEP7S6/Z+diDreHx/sUxeSyYuhtT7zwrtOsR0ZtMcFTiDUA8ZlOu
 JX/hOLoFLa8O29+0/knSdMZQB3/yImsXIvJjt86mYMGf9u0OexWOBu65f8ZHwyBpAxzX
 Cu5psuErLV+VoTcyFiT/zThG5MBdf/A632cx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pRd6pcMdNebp+pN5HMRRgF54QAuGLj+u/RVF3wGoo18=;
 b=Cye34sGEJowPAIkppdkGWDCvCiU5KWc3COTKOBeETT6ml+7QInH7q3orCsga4xBPss
 JLPtjl2+xT2LYAqZ4yDe9b4QXd9Q47fAyr8r5Iy66LUg0qfEwmn9T6B9ragCPJQ0KuON
 gpggEA9mqLuNnIeulcKG0/X41A9lMaKayq+1AJi/fQEfVUNOuF1nIjrgLuOjkgQWA4yo
 yTzlNKskxXe74j5Z7XiqgkeNoXW7Z4OMg6PgnEj1+7ILMeIMZNYEGI1KuDYBgCP2XEa6
 rHLZrgpIDsc1l15N1SieYnpCPe1XpetUOvvdp+PCzmOyo/dt/UxymJc2Uj2tibR6O9sE
 RtWA==
X-Gm-Message-State: AOAM533mYN+MD7JJb5NxfiEB56FIU5QjhaU/CHS4l+EcIGT364K1+Jy7
 XbA2C8SMFgGBV3KwWeKoWhOPvivX6/hMoxaRw+jNjQ==
X-Google-Smtp-Source: ABdhPJywNEi1yzvhH5/eMxuTSgQsZfHFd6bpKgnli8ZWpww+T6iw62Wvl6+Irx61qHcOCFQlQ5wjQ3GqF0XI0jyTfjM=
X-Received: by 2002:a17:906:bb10:: with SMTP id
 jz16mr31357635ejb.252.1625048505958; 
 Wed, 30 Jun 2021 03:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-3-jagan@amarulasolutions.com>
 <YNO0LHNVSWjrh1ZS@pendragon.ideasonboard.com>
 <CAOMZO5Ahbu4mohtMDOQOv_y5B_TDesbdYEUZTF1RL7_y-bS+RA@mail.gmail.com>
 <2decfea3-3659-2a3b-7706-326c97f57f8e@canonical.com>
 <3aa47f60-94ab-cf0f-3777-3a872dd0e6d4@kontron.de>
In-Reply-To: <3aa47f60-94ab-cf0f-3777-3a872dd0e6d4@kontron.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 30 Jun 2021 15:51:34 +0530
Message-ID: <CAMty3ZBnj6AwdrGXKx1jsqVnrk9abShzamM4H++WE7mcU09sYA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/9] drm: bridge: Add Samsung SEC MIPI DSIM bridge
 driver
To: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Daniel Vetter <daniel.vetter@intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Peng Fan <peng.fan@nxp.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Tomasz Figa <t.figa@samsung.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Milco Pratesi <milco.pratesi@engicam.com>,
 linux-phy@lists.infradead.org, Fancy Fang <chen.fang@nxp.com>,
 "marex@denx.de" <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Anthony Brandon <anthony@amarulasolutions.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Matteo Lisi <matteo.lisi@engicam.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Shawn Guo <shawnguo@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Frieder,

Thanks for sharing the details.

On Mon, Jun 28, 2021 at 1:49 PM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Jagan,
>
> On 24.06.21 10:30, Krzysztof Kozlowski wrote:
> > On 24/06/2021 04:48, Fabio Estevam wrote:
> >> Hi Jagan/Laurent,
> >>
> >> On Wed, Jun 23, 2021 at 7:23 PM Laurent Pinchart
> >> <laurent.pinchart@ideasonboard.com> wrote:
> >>
> >>> Looking at the register set, it seems to match the Exynos 5433,
> >>> supported by drivers/gpu/drm/exynos/exynos_drm_dsi.c. Can we leverage
> >>> that driver instead of adding a new one for the same IP core ?
> >>
> >> Yes. there was an attempt from Michael in this direction:
> >> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpa=
tchwork.kernel.org%2Fproject%2Fdri-devel%2Fcover%2F20200911135413.3654800-1=
-m.tretter%40pengutronix.de%2F&amp;data=3D04%7C01%7Cfrieder.schrempf%40kont=
ron.de%7C52db05459ef0462d5a9b08d936eab1ba%7C8c9d3c973fd941c8a2b1646f3942daf=
1%7C0%7C0%7C637601203901391193%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DLTYk9kpUe=
B9bgfRITQT6wIij3XTOIk37AHXbzQ2UI4Y%3D&amp;reserved=3D0
> >
> > That's the proper direction (maybe as Marek suggested - sharing common
> > code like for Analogix DP), not duplicating a driver.
> >
>
> Just to make sure that you are aware of the previous patches and discussi=
ons here are some additional pointers:
>
> * i.MX8MM glue code from Marek (+ Cc): [1]
> * DPHY driver from Marek: [2]
> * General discussion about driver implementation: [3]
> * Daniel's (+ Cc) suggested direction to move forward: [4]

It Looks like Daniel's suggestion is to have a common bridge driver
without sharing a code between platforms. It makes sense and clean but
the key issues lie on the exynos side, the exynos drm drives require
potential changes and tests, which indeed are hard but possible -
IMHO. However there is another issue with component_ops the i.MX8M
side MXSFB doesn't use any component_ops but the exynos are fully
component aware.

>
> It looks like you already did a fork of the Exynos driver, so your approa=
ch might be generally in line with what Daniel suggested.

I did use PMS computation from exynos and reference driver from imx8
tree. Last 2 days I worked on exynos_drm_dsi.c (with some additions)
and converted a bridge driver and it worked on my i.MX8MM platform.

Right now, I'm checking the possible implementations and will come
back to my approach for further comments.

Jagan.
