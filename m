Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF6C9C07D0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 14:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505CF10E844;
	Thu,  7 Nov 2024 13:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XffTeSQh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A608110E82A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 13:43:25 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2fb518014b9so8911951fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2024 05:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730987004; x=1731591804; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lTaMwPBJtQ/LdLyLH+A1iubTYFAHCFT/bM+1zUoljkk=;
 b=XffTeSQhQ9urCUnZ1YqrDgniR6sL9c+gDRH259qB48EDDNQP2D8DyLvAQPQqpIx/Ej
 CYO6kWLq0zG3yrbdXNYZgjl4+SPfOzkFlZljlYKyaxwwLAlFjfJmMhUgFgRxh1n7qOSk
 k7i1IawQZtXd0m59mzVUBoFLp8NiUkmwf6zXYZ349KLlHcU/ticf3UvaY5/xVGJCb0Gj
 XJq/gqXWyH8A0fXmntulqfYM6p5CQp46UoAAuyhJoMB8P8JClx4P7bDD6Iv1IUa/SUHn
 FeQAtqgM1scCYYDUXnvg0G0VC27D0f+DdUbEHA7GZHXZhSjTKKLFabDybib24cTlwdAP
 +1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730987004; x=1731591804;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lTaMwPBJtQ/LdLyLH+A1iubTYFAHCFT/bM+1zUoljkk=;
 b=D00Mkjpaa/vvnKvB1zElrqxEHmOBHKH/nFOxfDOQ0fvrQYdbm0yRKxWVdq4RQnwQuO
 UoJTWn5ytwWVqckek6VAm8FwPqQrzoGhHy0zuYIuXW424PYAVqbF1RKLvM0cnnPaJ5Q+
 cEUTd1mZYosUOr6VtjnS39URKggVi/kw1tLspJQVZBD+XNttBs6LRoVO3Dq/cIpmVKs5
 dpc/MybxiqKqcyd9/vgAJbBrTB53D6+DpSdj3Y1bVR3FrYr9/UqDYhYLz9HQr3pqunNZ
 niIJTo+rVRYrWLBLfQ2BZD9m3EMgSRr6FLanIfRRBMmizCz5q5jSmug2IJ1fMsWQj8wa
 brsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc46gkD9r71rITx7SKvp4V8lYQreukFweeE40Rkev2J1v9lVb+qkGP9caUPNifd3YuzJM8IPmF3Vg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7S2QwRgTxyk1mdzZJ9fVDO2KCkqYe1a9kU7p9OJ6OQzJE0iUj
 bpyYMgjWx8PoocROPAKml+93pW07RqtEhWKJ7pCifYAIe28q3gbv99oKDJQSuwo=
X-Google-Smtp-Source: AGHT+IEEXrpAS4axbz2EtICI+fGeaZacL297HQJJZ5R8O8wDOSGkjXWDf4lfkDOD+6Bag7+pFG1qiQ==
X-Received: by 2002:a05:651c:2209:b0:2fb:4c08:be08 with SMTP id
 38308e7fff4ca-2fcbdf6ff42mr222407471fa.11.1730987003678; 
 Thu, 07 Nov 2024 05:43:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff178dfe0asm2220701fa.23.2024.11.07.05.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 05:43:22 -0800 (PST)
Date: Thu, 7 Nov 2024 15:43:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sandor Yu <sandor.yu@nxp.com>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>, 
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, 
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, 
 "vkoul@kernel.org" <vkoul@kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>, 
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [PATCH v18 6/8] phy: freescale: Add DisplayPort/HDMI Combo-PHY
 driver for i.MX8MQ
Message-ID: <z6p6bewmykmufsghdojr4lvziurmmfpnrr5m4w3pfjlqzobpwr@zq2d2ukjvtac>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <411e42c70e71dce33a80059f663fb6c58fb2ac8c.1730172244.git.Sandor.yu@nxp.com>
 <efciuvoptv7qxwauswfseb6zlt5w4fmjdbm3huxfsn63a6bm7u@kfgkkvqoz5x4>
 <PAXPR04MB9448F638D47B5495CF78007AF4522@PAXPR04MB9448.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9448F638D47B5495CF78007AF4522@PAXPR04MB9448.eurprd04.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 05, 2024 at 02:05:51PM +0000, Sandor Yu wrote:
> > 
> > On Tue, Oct 29, 2024 at 02:02:14PM +0800, Sandor Yu wrote:
> > > Add Cadence HDP-TX DisplayPort and HDMI PHY driver for i.MX8MQ.
> > >
> > > Cadence HDP-TX PHY could be put in either DP mode or
> > > HDMI mode base on the configuration chosen.
> > > DisplayPort or HDMI PHY mode is configured in the driver.
> > >
> > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > > v17->v18:
> > > - fix build error as code rebase to latest kernel version.
> > >
> > >  drivers/phy/freescale/Kconfig                |   10 +
> > >  drivers/phy/freescale/Makefile               |    1 +
> > >  drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c | 1337
> > ++++++++++++++++++
> > >  3 files changed, 1348 insertions(+)
> > >  create mode 100644 drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > >
> > > diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> > > index dcd9acff6d01a..2b1210367b31c 100644
> > > --- a/drivers/phy/freescale/Kconfig
> > > +++ b/drivers/phy/freescale/Kconfig

[...]

I'm sorry, my email client cut the email.

> > > +static int cdns_hdptx_dp_configure(struct phy *phy,
> > > +                                union phy_configure_opts *opts)
> > > +{
> > > +     struct cdns_hdptx_phy *cdns_phy = phy_get_drvdata(phy);
> > > +
> > > +     cdns_phy->dp.link_rate = opts->dp.link_rate;
> > > +     cdns_phy->dp.lanes = opts->dp.lanes;
> > 
> > Shouldn't this be conditional on set_rate / set_lanes ?
> 
> PHY do not support reconfigure link rate and lane count.

So, you don't support reconfiguring the rate / count, but you still copy
the new rate and lanes into your driver data. That sounds strange.

[...]

> 
> > 
> > > +
> > > +static int cdns_hdptx_phy_set_mode(struct phy *phy, enum phy_mode
> > mode, int submode)
> > > +{
> > > +     struct cdns_hdptx_phy *cdns_phy = phy_get_drvdata(phy);
> > > +     int ret = 0;
> > > +
> > > +     if (mode == PHY_MODE_DP) {
> > > +             hdptx_dp_phy_ref_clock_type(cdns_phy);
> > > +
> > > +             /* PHY power up */
> > > +             ret = hdptx_dp_phy_power_up(cdns_phy);
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > > +             hdptx_dp_aux_cfg(cdns_phy);
> > 
> > Why? Don't power up the PHY if you haven't been told to.
> 
> Power on the PHY to enable DP AUX, which is necessary for reading EDID and training the link.

Call phy_power_on() from the DP driver.

> 
> > 
> > > +     } else if (mode != PHY_MODE_HDMI) {
> > > +             dev_err(&phy->dev, "Invalid PHY mode: %u\n", mode);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int cdns_hdptx_hdmi_configure(struct phy *phy,
> > > +                                  union phy_configure_opts
> > *opts)
> > > +{
> > > +     struct cdns_hdptx_phy *cdns_phy = phy_get_drvdata(phy);
> > > +     int ret;
> > > +
> > > +     cdns_phy->hdmi.tmds_char_rate = opts->hdmi.tmds_char_rate;
> > > +
> > > +     /* Check HDMI FW alive before HDMI PHY init */
> > > +     ret = hdptx_phy_check_alive(cdns_phy);
> > > +     if (!ret) {
> > > +             dev_err(cdns_phy->dev, "NO HDMI FW running\n");
> > > +             return -ENXIO;
> > > +     }
> > > +
> > > +     /* Configure PHY */
> > > +     if (hdptx_hdmi_phy_cfg(cdns_phy, cdns_phy->hdmi.tmds_char_rate)
> > < 0) {
> > > +             dev_err(cdns_phy->dev, "failed to set phy pclock\n");
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     ret = hdptx_hdmi_phy_power_up(cdns_phy);
> > 
> > it seems to be all over the place :-(
> 
> The PHY has different power-up rules depending on whether it's in DP or HDMI mode. 
> In DP mode, it needs to power up first to enable DP AUX. 
> In HDMI mode, it can power up last.

The main question is why are you powering the PHY from the configure
path at all? There is a phy_power_on() API which should be used by your
HDMI / DP driver instead of handling that in an automagic way.

> 

-- 
With best wishes
Dmitry
