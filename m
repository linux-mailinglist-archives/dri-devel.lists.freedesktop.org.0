Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6BE3B2F06
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 14:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F04B6EB79;
	Thu, 24 Jun 2021 12:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1676EB04
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 12:32:49 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id hc16so9182940ejc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 05:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1pdNyGnwu73Y/M+lRxwYbfC63xdRtvOG341evPVloL4=;
 b=VT4Xbs/6+8YEG5ok69Cp66JqzZQH90fw7I76MXbLk3uomJANwnomPoo574oC5hjoQ4
 EKQdDKf9yDx4L7r2cF62JOT40zbd68qIkBdugdNROO5ALrOarxqS15JpQUzu+iBlP/bO
 FZoTBAM7u3HhTjWJ9SuTe5GD1eTpfsr8wdQVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1pdNyGnwu73Y/M+lRxwYbfC63xdRtvOG341evPVloL4=;
 b=qSSJ4LKStroQrkXPLo7YGmgXjm6jjxNLwq5A3mAIfuZq5vQpW7epS5MkFxEXxe6Sb3
 0iQXsJgsYuuxfDs7dacchTXX796c6zGFjCh0nukIFYXW1iy4ZmYxnbaUHIHzxsl3ETHx
 PRjtYJADsbNejkUPD9/x1WfpgDZn5YkGVb3uaAmmr2Y9ONahMjgmxTuV36w0bZcTC4T7
 jqNPcOq6RM34EF2LsJshdoK2xkJ9C4hEG/r6+qmE77NE0fN3VUv/Udr04qgAPFIWNQvR
 CH75GTnmu0DEzRXSE9Qv5UNXDpWn6IPVOa86WBCfVwOQPrgQXxNJ+JEtv8LUlweUECNI
 BcmA==
X-Gm-Message-State: AOAM530CWizs8pcHBYcHACgclDbt85o9nEgIZTOVKX9R/o95Qz8AkExs
 W0MG/Tk0XQGbF7dJiXylcDH7xq57JLkJYejE1V+r0A==
X-Google-Smtp-Source: ABdhPJy9346wJ7pgPh41de3TKx9jGsDYkXgGD+VTQowScqmus3DWBHWMTQtjBZGWKBfvb/2N8Rflzvh3mC8Utrm9SqA=
X-Received: by 2002:a17:906:718b:: with SMTP id
 h11mr5091976ejk.418.1624537967775; 
 Thu, 24 Jun 2021 05:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-3-jagan@amarulasolutions.com>
 <YNO0LHNVSWjrh1ZS@pendragon.ideasonboard.com>
 <CAOMZO5Ahbu4mohtMDOQOv_y5B_TDesbdYEUZTF1RL7_y-bS+RA@mail.gmail.com>
 <CAMty3ZAtObU-bf6FuxvSBaZn2cotj_NxASW9g9on-kBJ7iW3OA@mail.gmail.com>
 <YNR37NWkxq0mZyq5@pendragon.ideasonboard.com>
In-Reply-To: <YNR37NWkxq0mZyq5@pendragon.ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 24 Jun 2021 18:02:36 +0530
Message-ID: <CAMty3ZA=1xreRB+SZOwj6khH6+nLsE_ND5599xfV8J=LzGFYYQ@mail.gmail.com>
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

Hi Laurent,

On Thu, Jun 24, 2021 at 5:48 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jagan,
>
> On Thu, Jun 24, 2021 at 05:42:43PM +0530, Jagan Teki wrote:
> > On Thu, Jun 24, 2021 at 8:18 AM Fabio Estevam wrote:
> > > On Wed, Jun 23, 2021 at 7:23 PM Laurent Pinchart wrote:
> > >
> > > > Looking at the register set, it seems to match the Exynos 5433,
> > > > supported by drivers/gpu/drm/exynos/exynos_drm_dsi.c. Can we leverage
> > > > that driver instead of adding a new one for the same IP core ?
> > >
> > > Yes. there was an attempt from Michael in this direction:
> > > https://patchwork.kernel.org/project/dri-devel/cover/20200911135413.3654800-1-m.tretter@pengutronix.de/
> >
> > Thanks for the reference, I will check it out and see I can send any
> > updated versions wrt my i.MX8MM platform.
>
> Thanks.
>
> I had a brief look at the exynos driver, and I think it should be turned
> into a DRM bridge as part of this rework to be used with the i.MX8MM.
>
> Is there someone from Samsung who could assist, at least to test the
> changes ?

I have hardware to verify it on i.MX8MM but from exynos I don't have
any contact from Samsung to suggest or test. Maybe I can add Tomasz
Figa while sending the changes?

I understand that there are 2 key implementations.

1. Adjust the exynos_drm_dsi.c by dropping component_ops as i.MX8MM
flow with LCDIF doesn't have component_ops (make sure it works with
exynos platform first)
2. Sec DSIM Bridge driver common cross Exynos and i.MX8MM platform
drivers or only one Sec DSIM bridge driver to handle both the
platforms by differentiating compatible and driver data

Any more suggestions would be appreciated?

Jagan.
