Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4C03B4122
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 12:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAA56ECC3;
	Fri, 25 Jun 2021 10:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503B26ECC3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 10:09:12 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ot9so13254302ejb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 03:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DTHgculPydhzpEVBph2GMT4tKo+Bdruk5MQJ3Xil02M=;
 b=iYwJpzc2B1Vz6C+1VFuga00mnTGnb9YkGQ/i60e24srUZeXEivl90uhEWHDaJdJdZl
 KAzTXfCP1HsostkzLKSNkcqzvh761bcFXJlvAuEcnKTdvLVOEw4iKFyeLOUgsTVIicbR
 6DM31e2rJS4bq7LbZAzi05Pn6ATJrDukYOReg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DTHgculPydhzpEVBph2GMT4tKo+Bdruk5MQJ3Xil02M=;
 b=F9xSZijGg3b27J4GzxeFDxVw3JuQDRwI2t4O2C96oXCkD4cNasVqVNFbagHN78Pypa
 6mp0A3GH6lrhIuiBVp7AcCFMLr1vKScT9MLSIHlGDhJVaJQrsr089ymDfGh/tI9DyTZd
 tBFRt8j5xL+Eu5dPH8c18E/KVVMF7+o71+XLyonYVNK5QRnlx5YMevuJLPb+cHq6kHPN
 g1Nu690bS/9NT1F3ohjCPmNclaQOOtDhqMsF88lYtZYCROGFOVH34TLWGA06rqL3B95e
 njb972RTf/Top9rwnRFbhu3nCQWTLOWE6W+A1PRPdq+pr/VavPvg+ibK9QrcAcPa5Nmp
 X05w==
X-Gm-Message-State: AOAM531mHREiHqzKxLexYcoFH7qsjgUoXRvLh3++743TqAKiaMz1CKwY
 Kj65F74YRghm9tD6NMw1rEDJz8Z/3kEJEOuh7x/Hsw==
X-Google-Smtp-Source: ABdhPJx5YzGyXwGKXbBwpGfmUZFM2l/3b+DgX10TOcWtu9LgUc8/68VvsFeIkZnC3ePSCoBaMYF/unXbPoA2N3GfeR0=
X-Received: by 2002:a17:906:bb10:: with SMTP id
 jz16mr6339523ejb.252.1624615750910; 
 Fri, 25 Jun 2021 03:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
 <20210621072424.111733-3-jagan@amarulasolutions.com>
 <YNO0LHNVSWjrh1ZS@pendragon.ideasonboard.com>
 <CAOMZO5Ahbu4mohtMDOQOv_y5B_TDesbdYEUZTF1RL7_y-bS+RA@mail.gmail.com>
 <CAMty3ZAtObU-bf6FuxvSBaZn2cotj_NxASW9g9on-kBJ7iW3OA@mail.gmail.com>
 <YNR37NWkxq0mZyq5@pendragon.ideasonboard.com>
 <fdd446c6-c8ce-9dae-f7ac-e06241f76250@canonical.com>
In-Reply-To: <fdd446c6-c8ce-9dae-f7ac-e06241f76250@canonical.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 25 Jun 2021 15:38:59 +0530
Message-ID: <CAMty3ZCEQeRi53yuLYyWVU8o=Lo2ZKy+kgjU+9PC33QJEq2LQg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/9] drm: bridge: Add Samsung SEC MIPI DSIM bridge
 driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>, Fancy Fang <chen.fang@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

On Fri, Jun 25, 2021 at 2:51 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On Thu, 24 Jun 2021 at 14:19, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Jagan,
> >
> > On Thu, Jun 24, 2021 at 05:42:43PM +0530, Jagan Teki wrote:
> > > On Thu, Jun 24, 2021 at 8:18 AM Fabio Estevam wrote:
> > > > On Wed, Jun 23, 2021 at 7:23 PM Laurent Pinchart wrote:
> > > >
> > > > > Looking at the register set, it seems to match the Exynos 5433,
> > > > > supported by drivers/gpu/drm/exynos/exynos_drm_dsi.c. Can we leverage
> > > > > that driver instead of adding a new one for the same IP core ?
> > > >
> > > > Yes. there was an attempt from Michael in this direction:
> > > > https://patchwork.kernel.org/project/dri-devel/cover/20200911135413.3654800-1-m.tretter@pengutronix.de/
> > >
> > > Thanks for the reference, I will check it out and see I can send any
> > > updated versions wrt my i.MX8MM platform.
> >
> > Thanks.
> >
> > I had a brief look at the exynos driver, and I think it should be turned
> > into a DRM bridge as part of this rework to be used with the i.MX8MM.
> >
> > Is there someone from Samsung who could assist, at least to test the
> > changes ?
>
> Yes, I mentioned few guys in reply to PHY. Around the DRM drivers you
> can get in touch with:
> Inki Dae <inki.dae@samsung.com>
> Seung-Woo Kim <sw0312.kim@samsung.com>
> Marek Szyprowski <m.szyprowski@samsung.com>
> Andrzej Hajda <a.hajda@samsung.com>

Thanks for the information.

>
> The easiest testing of the display stack would be on Hardkernel's Odroid
> XU4 (https://www.hardkernel.com/shop/odroid-xu4-special-price/) however
> you will not test the DSI/DSIM directly (it has only HDMI port).

Look like I found one board with Exynos5430 with DSI. Does this SoC is
same as mainline Exynos5433?

Jagan.
