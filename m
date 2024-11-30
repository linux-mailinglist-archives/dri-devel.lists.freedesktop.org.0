Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877E99DEF5B
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 09:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C9010E14B;
	Sat, 30 Nov 2024 08:29:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xcDVthL4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40D110E14B
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 08:29:48 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53de101525eso3469660e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 00:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732955387; x=1733560187; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YwEfcn5Pby1DuMjHVg1b1o/lcfJvv/jFNZtuiy5rgCw=;
 b=xcDVthL4mQfmDx58fOkT4HI2rn/o0oa9zKDPVHhBTk2PvUzCTbx7iY2qaJZmB5F4a8
 VP9oCtp7BHOXHfx/rDnh7Y5khyjNKeuSIErnk0CqtczvtXAMo7/PXmxd+K0BMGwLSP0E
 Cr1GggoznpF27+z4+wXRFzJVr7En2R9Ujyj12nsiD3YEO76NTY+l9geGlWnHJlOEBTro
 pAyO5SgSv60OdrFMGbdTLiYjAjA4GApjf9d7R8KuwXBAfOVRBFcTd80ivUmJa2cQiI15
 H0WVNIDF1+8wx3DN26dYSDoJKGsRU0ll8qOSV22rbDhUQdr/3KmhS9xg6ysaxgLTqydm
 70nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732955387; x=1733560187;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YwEfcn5Pby1DuMjHVg1b1o/lcfJvv/jFNZtuiy5rgCw=;
 b=HbGta3FF+e9zY8UkIFYKYc2dNUe6rbRuGzdgYnyUyc0SJI0IJMa6JI9MK42MWiiDlq
 pDiqJZzbBe6nsV8CNZHDY4hX+yHeGflLF8idUxyQGT1BJ02/hwJQhSqwUT1WtGCOQZNG
 XHOX1e4DU3Eye43I183MBHnuXrPv/8m7T4SRtAGiiwQh/1bEeoxoOQ9XHKpBtyWW3wfh
 0HffB9UOQIpEEtBzzUFfGUlqqFmPtvBsN6UgfsyIxdCj60Sy039unYrkn5dnJpV8e5KC
 SUFrwWhL2VWzuFBVKOQ8XsaTlihDKBS1HtfwHyWjcp6dsoafY1zAMDa9gPGyzidl7GU0
 s/og==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbPwUKwS5Q71j9vfXnfdNTldy9p6YZsg/+VOGopsbMwXqY2k3eMtTpRYaYNRzpayxCul+HmSl/gJ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2n3xjyPejze+wNpeBdRS3ur7/v5ixVA5uki7LPFuFT+IsblKa
 X8nAopRZkCtN68CGvm8CIm91PgWWI87fKokCNr//KvUKjRn8/jl4KBMLRot3+Ac=
X-Gm-Gg: ASbGnctoEmhnpDCjq3wD8M0n0cn+nMaiGpuNCdOJrOJHgCponn6ZtmndybluEly4fPt
 Nj0GSW82WATLD2x76AgrFC67SZR8nw3pDUeEA3eE9ioOE1YhtDAjiRKZDA81PIYzFagENQmx8wK
 Up77jR1W+lazci8KaMwxOpIcZUAudE56p/VB13wwc5fX+/L1Q/gdqryNxfb3guWWpZTtstyMyLi
 O01glrlMdOYrFIOhs8J7Bz7H6uNYUe3Vbl05uQGap0hBf8spJ4RfvK3mc3JlrkXtKMzWOwppCcM
 Vb7k27oidpo4e5KwtBhgXkM8dt0cMg==
X-Google-Smtp-Source: AGHT+IG7msEs9hgIu3ta16vL9mWEiaIEtxRrnODIuHdyaMtVbZhaiQTdxZhi9NhcUgHBW26OK3t30w==
X-Received: by 2002:a05:6512:3f7:b0:53d:f583:81df with SMTP id
 2adb3069b0e04-53df5838209mr2781109e87.28.1732955387112; 
 Sat, 30 Nov 2024 00:29:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df64a05ebsm703544e87.255.2024.11.30.00.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 00:29:45 -0800 (PST)
Date: Sat, 30 Nov 2024 10:29:43 +0200
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
Subject: Re: [EXT] Re: [PATCH v18 6/8] phy: freescale: Add DisplayPort/HDMI
 Combo-PHY driver for i.MX8MQ
Message-ID: <foi2sizfkppmunq4yqt4pex47alsvsjyqi3rk32fwyz4f5xepn@zdsx74bzzda4>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <411e42c70e71dce33a80059f663fb6c58fb2ac8c.1730172244.git.Sandor.yu@nxp.com>
 <efciuvoptv7qxwauswfseb6zlt5w4fmjdbm3huxfsn63a6bm7u@kfgkkvqoz5x4>
 <PAXPR04MB9448F638D47B5495CF78007AF4522@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <z6p6bewmykmufsghdojr4lvziurmmfpnrr5m4w3pfjlqzobpwr@zq2d2ukjvtac>
 <PAXPR04MB9448D68A5CA9755036E9B23DF42F2@PAXPR04MB9448.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9448D68A5CA9755036E9B23DF42F2@PAXPR04MB9448.eurprd04.prod.outlook.com>
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

On Tue, Nov 26, 2024 at 02:12:19PM +0000, Sandor Yu wrote:
>  
> > 
> > On Tue, Nov 05, 2024 at 02:05:51PM +0000, Sandor Yu wrote:
> > > >
> > > > On Tue, Oct 29, 2024 at 02:02:14PM +0800, Sandor Yu wrote:
> > > > > Add Cadence HDP-TX DisplayPort and HDMI PHY driver for i.MX8MQ.
> > > > >
> > > > > Cadence HDP-TX PHY could be put in either DP mode or HDMI mode
> > > > > base on the configuration chosen.
> > > > > DisplayPort or HDMI PHY mode is configured in the driver.
> > > > >
> > > > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > > ---
> > > > > v17->v18:
> > > > > - fix build error as code rebase to latest kernel version.
> > > > >
> > > > >  drivers/phy/freescale/Kconfig                |   10 +
> > > > >  drivers/phy/freescale/Makefile               |    1 +
> > > > >  drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c | 1337
> > > > ++++++++++++++++++
> > > > >  3 files changed, 1348 insertions(+)  create mode 100644
> > > > > drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > > > >
> > > > > diff --git a/drivers/phy/freescale/Kconfig
> > > > > b/drivers/phy/freescale/Kconfig index dcd9acff6d01a..2b1210367b31c
> > > > > 100644
> > > > > --- a/drivers/phy/freescale/Kconfig
> > > > > +++ b/drivers/phy/freescale/Kconfig
> > 
> > [...]
> > 
> > I'm sorry, my email client cut the email.
> > 
> > > > > +static int cdns_hdptx_dp_configure(struct phy *phy,
> > > > > +                                union phy_configure_opts
> > *opts) {
> > > > > +     struct cdns_hdptx_phy *cdns_phy = phy_get_drvdata(phy);
> > > > > +
> > > > > +     cdns_phy->dp.link_rate = opts->dp.link_rate;
> > > > > +     cdns_phy->dp.lanes = opts->dp.lanes;
> > > >
> > > > Shouldn't this be conditional on set_rate / set_lanes ?
> > >
> > > PHY do not support reconfigure link rate and lane count.
> > 
> > So, you don't support reconfiguring the rate / count, but you still copy the new
> > rate and lanes into your driver data. That sounds strange.
> 
> The PHY will use link rate and lane count to configure its registers

I'm not sure if I follow it. Do you mean that rate / count configuration
is static?

-- 
With best wishes
Dmitry
