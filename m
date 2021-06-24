Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389653B2F52
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 14:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6696EB10;
	Thu, 24 Jun 2021 12:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9993B6EB2F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 12:46:23 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d16so10060294lfn.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 05:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rTH8vR4RixbXkriAwojNaOEycEezf1HsxVW3e2HYh0I=;
 b=m6xiTmK+5YqywiWU2SER1AgOl/l82/y/T4MGDg0zdo5hkygLuOcecQwPHTaN78mPcc
 Buc8c1nAfwLyqw7sQxd9FMd6whPlM1zabBySHWaTiSQpHXDT8meOhc69vK7n0IrO8T76
 wh6wbVUwDx6v5WkJZsw2V5f8TpjAFxdSiELGAMzKMr2wDtt/jIPxT6jbSZO7bZn8c+mw
 Gq0dDod9ydm7j3hmuTbId1ywAQIbzYr0N+ZKy2CBe3UzblKKiq0e12gJtEApxR+ojbJ/
 pTEb6vxJGW84DsuP5q7K40hxtfRF4BM1Cl5T3kCAHmJ01xM+Hz5Gu0Fx1tT4XVdPSb74
 erVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rTH8vR4RixbXkriAwojNaOEycEezf1HsxVW3e2HYh0I=;
 b=VQpFSDO1B6vyhUS0ImFGmmckWmFWV6N/dEuUXilv/MXeMt6YqF1CVJPoECFZP3AZgO
 H/OqoQnI664zeh1UTn76Ox9Fii7mN9wdM8LASnCeNcegT9AT1hUMowXhobKHw/FsdIRE
 ddbcUN8ZhJHSMlphDOfNNoWQW0THFgaJmPM5yGla9xRCDFzxf8HkaAhZRhHfA4e278gQ
 hZuhvRORXQ4LQHdlIT439JCKtB+zfMdjRnYpYlKfP6dqdkM0h/MzgX1WLdolRyUKV1y/
 WWPMaM9gieSqR17wL8lRkQNX3YpqNMD3GatcEnQs3Ko6fg/lSBUY1FG93lX4V55otnMr
 212g==
X-Gm-Message-State: AOAM531JVxsvtVO5TLujP9n3/UQJMVp4wVUmnEryqRzJLl0DtVSAB7PC
 thyj3fCdvVyWvIp4PIqYGhar0lYGjyZHFSr+upQ=
X-Google-Smtp-Source: ABdhPJyT8BsP7EuS9DD/tQXewK7uBCyS9K2u42ed17KyvX5CdnnqwRSlHjBz+bCRnG+XthX/bMhDCntdoUBccksmKi0=
X-Received: by 2002:a19:6d06:: with SMTP id i6mr3624988lfc.223.1624538782003; 
 Thu, 24 Jun 2021 05:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-3-jagan@amarulasolutions.com>
 <YNO0LHNVSWjrh1ZS@pendragon.ideasonboard.com>
 <CAOMZO5Ahbu4mohtMDOQOv_y5B_TDesbdYEUZTF1RL7_y-bS+RA@mail.gmail.com>
 <CAMty3ZAtObU-bf6FuxvSBaZn2cotj_NxASW9g9on-kBJ7iW3OA@mail.gmail.com>
 <YNR37NWkxq0mZyq5@pendragon.ideasonboard.com>
 <CAMty3ZA=1xreRB+SZOwj6khH6+nLsE_ND5599xfV8J=LzGFYYQ@mail.gmail.com>
In-Reply-To: <CAMty3ZA=1xreRB+SZOwj6khH6+nLsE_ND5599xfV8J=LzGFYYQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 24 Jun 2021 09:46:10 -0300
Message-ID: <CAOMZO5C4n0nnD0y_Ouoo70C4dN+BKg_D8iEO_wgN4_fDx0E2DA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/9] drm: bridge: Add Samsung SEC MIPI DSIM bridge
 driver
To: Jagan Teki <jagan@amarulasolutions.com>, Inki Dae <inki.dae@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 Fancy Fang <chen.fang@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On Thu, Jun 24, 2021 at 9:32 AM Jagan Teki <jagan@amarulasolutions.com> wrote:

> > I had a brief look at the exynos driver, and I think it should be turned
> > into a DRM bridge as part of this rework to be used with the i.MX8MM.
> >
> > Is there someone from Samsung who could assist, at least to test the
> > changes ?
>
> I have hardware to verify it on i.MX8MM but from exynos I don't have
> any contact from Samsung to suggest or test. Maybe I can add Tomasz
> Figa while sending the changes?

Adding Inki Dae and Marek Szyprowski from Samsung who helped to review
Michael's series.

> I understand that there are 2 key implementations.
>
> 1. Adjust the exynos_drm_dsi.c by dropping component_ops as i.MX8MM
> flow with LCDIF doesn't have component_ops (make sure it works with
> exynos platform first)
> 2. Sec DSIM Bridge driver common cross Exynos and i.MX8MM platform
> drivers or only one Sec DSIM bridge driver to handle both the
> platforms by differentiating compatible and driver data
>
> Any more suggestions would be appreciated?
>
> Jagan.
