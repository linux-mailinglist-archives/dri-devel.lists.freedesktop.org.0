Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCAB3B2EB0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 14:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606BF6EB6C;
	Thu, 24 Jun 2021 12:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA026EB6C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 12:12:55 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id r7so8142684edv.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=00qJhUhsSLmie5on9fHVkXswl7GglVNf9S3IawNPKpM=;
 b=LFHTlf5beKsNbpsxpkkS7V5dXdKTpBIrVD4foDj+FdxKHL3klGfzF2ZNY8wPxslgv2
 b+q18nUxWppzyqAbC8zxa3HkuEqel6xx0h3CW75ZhmePnPERpOv3A/UK68F8D6pXZ7IN
 hhPXxXVWdAgEp3q7sAt2VrAtY/D3bz2rC8umk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=00qJhUhsSLmie5on9fHVkXswl7GglVNf9S3IawNPKpM=;
 b=QDIrOhjulp9oZ+TWxZ85Bx8P9s6erejVjz+88yhPORc9x0+9skdK4TDn2RcPGnjXvT
 u5laNXndq4hU13HaI2Qt4svLZhHTEwmnWuqAI20dJVgNc5fgSd26fHgMoFkVpNNYjDMc
 5541s4PfQJ468+Vix5Nmg6detHcuQxx8dCY6+Rev9mPUDQsXjM4l4AuqStXtBGOxX/zc
 LN7CXqNkxJU9062igAMy8+cTIhG3wwchxWAaJcMUpYtk4lqWYVpMlEI10u6d5eFXxkn5
 rhMYPN2sDFOLDZqEgAPdTEzw0hiqgJyDI/8P6jUXpbGB3G5OTanaWCDE5bVJb+lwWwEJ
 U5CA==
X-Gm-Message-State: AOAM531VTod/EDozlwi6IBuinoOiIj393XsrpsvLNRXgtHNWmS04PtNk
 PCTxIcSvHlr+AN4VOwIDMlZmx181NgfFuqXH1BlHUg==
X-Google-Smtp-Source: ABdhPJwH6wzxQh/EgARmUBUCU45D6SQC4arfqhFGQNZ2Zi25gX0SJv2dx4JOvDj7503wKBJOz/+Q/kaHBNGL0ZXDpfI=
X-Received: by 2002:a05:6402:1d55:: with SMTP id
 dz21mr6499192edb.338.1624536774634; 
 Thu, 24 Jun 2021 05:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-3-jagan@amarulasolutions.com>
 <YNO0LHNVSWjrh1ZS@pendragon.ideasonboard.com>
 <CAOMZO5Ahbu4mohtMDOQOv_y5B_TDesbdYEUZTF1RL7_y-bS+RA@mail.gmail.com>
In-Reply-To: <CAOMZO5Ahbu4mohtMDOQOv_y5B_TDesbdYEUZTF1RL7_y-bS+RA@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 24 Jun 2021 17:42:43 +0530
Message-ID: <CAMty3ZAtObU-bf6FuxvSBaZn2cotj_NxASW9g9on-kBJ7iW3OA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/9] drm: bridge: Add Samsung SEC MIPI DSIM bridge
 driver
To: Fabio Estevam <festevam@gmail.com>
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Tomasz Figa <t.figa@samsung.com>, Michael Tretter <m.tretter@pengutronix.de>,
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

Hi Fabio,

On Thu, Jun 24, 2021 at 8:18 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Jagan/Laurent,
>
> On Wed, Jun 23, 2021 at 7:23 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>
> > Looking at the register set, it seems to match the Exynos 5433,
> > supported by drivers/gpu/drm/exynos/exynos_drm_dsi.c. Can we leverage
> > that driver instead of adding a new one for the same IP core ?
>
> Yes. there was an attempt from Michael in this direction:
> https://patchwork.kernel.org/project/dri-devel/cover/20200911135413.3654800-1-m.tretter@pengutronix.de/

Thanks for the reference, I will check it out and see I can send any
updated versions wrt my i.MX8MM platform.

Jagan.
