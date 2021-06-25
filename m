Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C553B3E5F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 10:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29F96E09F;
	Fri, 25 Jun 2021 08:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51396E09F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 08:20:01 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id nd37so13853803ejc.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 01:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ij57ec/kT6vqdj3SkA9+UxDinMRytbLturPpNw8vjWU=;
 b=fUPOg7qJFU4+Ky55nonbhHO3m4gsmtHJ5JR19iPaBEvYjk3/idyXrnOzPF0RETsFki
 aon0d55/n0DgoLxhyqvpHSMAzPTz5otjiNSZ/KZCVwhjW1FHTLiHnWh/CM8AwwZZpldx
 Kdh+7y5JjZRwPrcv7S0CsQpczGiUAYa472kT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ij57ec/kT6vqdj3SkA9+UxDinMRytbLturPpNw8vjWU=;
 b=eycLa6mNU/0U0rEYhyaJPKMNSjmkgXzN7VUKNZBcKFdYLLDmLEkVIV7xF+KkMOqll0
 cOCB6YcGUgMh5QztLGRMGnGBlNjv/ihmg/K2xh+UADu+7X1oXCANntty/C64dyWHX0u3
 gx2EGk5OnsiNmMks59R1VgkfGXQXDhfdZH1Fctq9OmGVZCgLqYjaBGY02ya4bqCflxZI
 Ae2nwxwQcou/Xmzg54ZvCjr1vnsDwgX5rct9u8lrSjPLkhJh3oPJcyVXRI48meZ0Skzj
 N1cJFzaSGtgqGzQiDCLQ8hfPLCH4kcy7x0Bx8qpLIr9W9qlvMRV3huS+uR4mLT1hry5A
 2Nzw==
X-Gm-Message-State: AOAM53237aUCcwNwLJQRhibq4HE7AXP6l/c4Jm4UOxT3LTeOWtASNltU
 O35mpPUhO4CPWCtHreO/VC0wQZQQ2AZBHb4f9hbncg==
X-Google-Smtp-Source: ABdhPJxPYVWDTuNQnGVZcTr/J+zl2QMfQDE1LFW7NWpHcZf0GBIjnlowThGs9yNuKiJWJssteOsB7NCRRWQI1Rw+mOk=
X-Received: by 2002:a17:906:bb10:: with SMTP id
 jz16mr5890056ejb.252.1624609200411; 
 Fri, 25 Jun 2021 01:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-3-jagan@amarulasolutions.com>
 <YNO0LHNVSWjrh1ZS@pendragon.ideasonboard.com>
 <CAOMZO5Ahbu4mohtMDOQOv_y5B_TDesbdYEUZTF1RL7_y-bS+RA@mail.gmail.com>
 <CAMty3ZAtObU-bf6FuxvSBaZn2cotj_NxASW9g9on-kBJ7iW3OA@mail.gmail.com>
 <YNR37NWkxq0mZyq5@pendragon.ideasonboard.com>
 <CAMty3ZA=1xreRB+SZOwj6khH6+nLsE_ND5599xfV8J=LzGFYYQ@mail.gmail.com>
 <YNR+r3G7crWS+wcx@pendragon.ideasonboard.com>
In-Reply-To: <YNR+r3G7crWS+wcx@pendragon.ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 25 Jun 2021 13:49:49 +0530
Message-ID: <CAMty3ZBuPCGYrC=Poucrotvaf3ZT2PnAeCbv-iq7vnQLS=KgNQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/9] drm: bridge: Add Samsung SEC MIPI DSIM bridge
 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>, Fancy Fang <chen.fang@nxp.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 6:17 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Jun 24, 2021 at 06:02:36PM +0530, Jagan Teki wrote:
> > Hi Laurent,
> >
> > On Thu, Jun 24, 2021 at 5:48 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Jagan,
> > >
> > > On Thu, Jun 24, 2021 at 05:42:43PM +0530, Jagan Teki wrote:
> > > > On Thu, Jun 24, 2021 at 8:18 AM Fabio Estevam wrote:
> > > > > On Wed, Jun 23, 2021 at 7:23 PM Laurent Pinchart wrote:
> > > > >
> > > > > > Looking at the register set, it seems to match the Exynos 5433,
> > > > > > supported by drivers/gpu/drm/exynos/exynos_drm_dsi.c. Can we leverage
> > > > > > that driver instead of adding a new one for the same IP core ?
> > > > >
> > > > > Yes. there was an attempt from Michael in this direction:
> > > > > https://patchwork.kernel.org/project/dri-devel/cover/20200911135413.3654800-1-m.tretter@pengutronix.de/
> > > >
> > > > Thanks for the reference, I will check it out and see I can send any
> > > > updated versions wrt my i.MX8MM platform.
> > >
> > > Thanks.
> > >
> > > I had a brief look at the exynos driver, and I think it should be turned
> > > into a DRM bridge as part of this rework to be used with the i.MX8MM.
> > >
> > > Is there someone from Samsung who could assist, at least to test the
> > > changes ?
> >
> > I have hardware to verify it on i.MX8MM but from exynos I don't have
> > any contact from Samsung to suggest or test. Maybe I can add Tomasz
> > Figa while sending the changes?
>
> Tomasz hasn't been working for Samsung for a loooong time (I've dropped
> his Samsung address from the CC list for this reason).

Okay. I think exynos drm maintainers might help out here, but not sure of it.

>
> > I understand that there are 2 key implementations.
> >
> > 1. Adjust the exynos_drm_dsi.c by dropping component_ops as i.MX8MM
> > flow with LCDIF doesn't have component_ops (make sure it works with
> > exynos platform first)
>
> I think it should be turned into a real drm_bridge, it's currently
> implemented based on drm_encoder.

Yes, ie what I'm trying for.

Jagan.
