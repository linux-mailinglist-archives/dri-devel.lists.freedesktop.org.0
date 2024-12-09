Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A959E8FCC
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 11:13:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C5110E6B9;
	Mon,  9 Dec 2024 10:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qwN+PgZP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A44CA10E6B9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 10:13:24 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-e396c98af22so3412039276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 02:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733739203; x=1734344003; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qcha0zHynfu3Ub0724lpoIRWfmwOKO+r/oksIEeJ2RY=;
 b=qwN+PgZPx93vheiaMsDG9+v7tgcnMVrQ905RqJpHsixe5cD5mNEqetLwXy3DLulj0Z
 TnsEkxNBASW/k01nMJotWh1uleZd2QL/IioP7M8bwphXCImnxPGH/HTMVp2cJDQAZSVe
 aTQeFi2WPnKQn9FKS6paOI1GrjxaH3UQos7Vaso2IYnLfLStIv+V9WXA2k101AqsKn/v
 K8x0zs1f2ovWZu9zANXlcJH9OQA9ughZKTn73GxMg/lStGR2JibPnTPLZryr78HQnWLB
 YrArDaYEa0m9jSb4zVmXi3tmYTN3kPJjDsAK8WqmXnezQH3AqzkXZEIBiN29h3cepiZL
 fvoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733739203; x=1734344003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qcha0zHynfu3Ub0724lpoIRWfmwOKO+r/oksIEeJ2RY=;
 b=c1llp0qX7ABMmR8eRXYTmfPlQPxdXuXVApSEZrd2EVJQpLbZVE5sJQyLpIK5iGgd2C
 petBFVNWcSB5Qxe97Li3O5/bp7tDnHwyNfoHyNPhgjYq5oe94/dJiWtgWM9yvCdQpDpk
 VlbNWI0aIIXHXv8z3eIJvM7UhQR1B83I/ECpxupFEsd4GHpKPS8Wmbj+dtq1lsvaq125
 yHyOcS6quv2MeMF8/dHBiU60q6LoP+grbTrlgVY7STOVnEhKD9W3DUWFyzW4d4XLz9iE
 5Orl5/48PvWXESb55RR5yk1HbK0PspXnyOkeVETBvOmVwt8lOdrV2MHTLWEWSGfKVJTr
 WWMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMkM5fjR8JkPUf/yEoVYd0Q52JbNOd8pZEC7J1ipMNCBY+wDX3JuuQKWtQRrV3PeIHFZYjw4R+wjk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzzc1T6I6rc5CFOC+3pARR+yXMNT1ChaCS/OpOtL63V053DTRsq
 XBauks6wgEfyivZXpvUjPJq6k+2OZS4BNIiLfXL53iGggI4Net+Wue+al51UfFPWGLz+LN0Ml0l
 S3DLPnV6OQibQZKf8fDvWWYAJxdnkAa639f/lqg==
X-Gm-Gg: ASbGncvnFESLJ7H1Udg4+J1QKK8Ud29V8wQYc5V4N59EclkIqKG41BUtvvQszW+a9iF
 1mH0LFRcaZ2LxrjsMvvZKrIHijRzowMQ=
X-Google-Smtp-Source: AGHT+IH2bT+gKDdOGRSmqtWgH0YUH5W9D5gi5OgCuogw+kN6ib1DMYcXSnWkxS48FLs9InNsXTrt1JIXrBK8w04Q03w=
X-Received: by 2002:a05:6902:983:b0:e30:b98e:b111 with SMTP id
 3f1490d57ef6-e3a0b0c4f08mr8343409276.17.1733739203685; Mon, 09 Dec 2024
 02:13:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <411e42c70e71dce33a80059f663fb6c58fb2ac8c.1730172244.git.Sandor.yu@nxp.com>
 <efciuvoptv7qxwauswfseb6zlt5w4fmjdbm3huxfsn63a6bm7u@kfgkkvqoz5x4>
 <PAXPR04MB9448F638D47B5495CF78007AF4522@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <z6p6bewmykmufsghdojr4lvziurmmfpnrr5m4w3pfjlqzobpwr@zq2d2ukjvtac>
 <PAXPR04MB9448D68A5CA9755036E9B23DF42F2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <foi2sizfkppmunq4yqt4pex47alsvsjyqi3rk32fwyz4f5xepn@zdsx74bzzda4>
 <PAXPR04MB94488E0A549E519CEB8AA40EF43C2@PAXPR04MB9448.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB94488E0A549E519CEB8AA40EF43C2@PAXPR04MB9448.eurprd04.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Dec 2024 12:13:15 +0200
Message-ID: <CAA8EJprUKXxGbtP6M95Ep=2Lj2NSiUN31QNaysNJAzvO5g2LdQ@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH v18 6/8] phy: freescale: Add DisplayPort/HDMI
 Combo-PHY driver for i.MX8MQ
To: Sandor Yu <sandor.yu@nxp.com>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, 
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Dec 2024 at 10:16, Sandor Yu <sandor.yu@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: 2024=E5=B9=B411=E6=9C=8830=E6=97=A5 16:30
> > To: Sandor Yu <sandor.yu@nxp.com>
> > Cc: andrzej.hajda@intel.com; neil.armstrong@linaro.org; Laurent Pinchar=
t
> > <laurent.pinchart@ideasonboard.com>; jonas@kwiboo.se;
> > jernej.skrabec@gmail.com; airlied@gmail.com; daniel@ffwll.ch;
> > robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; festevam@gmail.com;
> > vkoul@kernel.org; dri-devel@lists.freedesktop.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-phy@lists.infradead.org;
> > mripard@kernel.org; kernel@pengutronix.de; dl-linux-imx
> > <linux-imx@nxp.com>; Oliver Brown <oliver.brown@nxp.com>;
> > alexander.stein@ew.tq-group.com; sam@ravnborg.org
> > Subject: Re: [EXT] Re: [PATCH v18 6/8] phy: freescale: Add DisplayPort/=
HDMI
> > Combo-PHY driver for i.MX8MQ
> >
> > Caution: This is an external email. Please take care when clicking link=
s or
> > opening attachments. When in doubt, report the message using the 'Repor=
t
> > this email' button
> >
> >
> > On Tue, Nov 26, 2024 at 02:12:19PM +0000, Sandor Yu wrote:
> > >
> > > >
> > > > On Tue, Nov 05, 2024 at 02:05:51PM +0000, Sandor Yu wrote:
> > > > > >
> > > > > > On Tue, Oct 29, 2024 at 02:02:14PM +0800, Sandor Yu wrote:
> > > > > > > Add Cadence HDP-TX DisplayPort and HDMI PHY driver for
> > i.MX8MQ.
> > > > > > >
> > > > > > > Cadence HDP-TX PHY could be put in either DP mode or HDMI mod=
e
> > > > > > > base on the configuration chosen.
> > > > > > > DisplayPort or HDMI PHY mode is configured in the driver.
> > > > > > >
> > > > > > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > > > > > Signed-off-by: Alexander Stein
> > > > > > > <alexander.stein@ew.tq-group.com>
> > > > > > > ---
> > > > > > > v17->v18:
> > > > > > > - fix build error as code rebase to latest kernel version.
> > > > > > >
> > > > > > >  drivers/phy/freescale/Kconfig                |   10 +
> > > > > > >  drivers/phy/freescale/Makefile               |    1 +
> > > > > > >  drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c | 1337
> > > > > > ++++++++++++++++++
> > > > > > >  3 files changed, 1348 insertions(+)  create mode 100644
> > > > > > > drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > > > > > >
> > > > > > > diff --git a/drivers/phy/freescale/Kconfig
> > > > > > > b/drivers/phy/freescale/Kconfig index
> > > > > > > dcd9acff6d01a..2b1210367b31c
> > > > > > > 100644
> > > > > > > --- a/drivers/phy/freescale/Kconfig
> > > > > > > +++ b/drivers/phy/freescale/Kconfig
> > > >
> > > > [...]
> > > >
> > > > I'm sorry, my email client cut the email.
> > > >
> > > > > > > +static int cdns_hdptx_dp_configure(struct phy *phy,
> > > > > > > +                                union phy_configure_opts
> > > > *opts) {
> > > > > > > +     struct cdns_hdptx_phy *cdns_phy =3D phy_get_drvdata(phy=
);
> > > > > > > +
> > > > > > > +     cdns_phy->dp.link_rate =3D opts->dp.link_rate;
> > > > > > > +     cdns_phy->dp.lanes =3D opts->dp.lanes;
> > > > > >
> > > > > > Shouldn't this be conditional on set_rate / set_lanes ?
> > > > >
> > > > > PHY do not support reconfigure link rate and lane count.
> > > >
> > > > So, you don't support reconfiguring the rate / count, but you still
> > > > copy the new rate and lanes into your driver data. That sounds stra=
nge.
> > >
> > > The PHY will use link rate and lane count to configure its registers
> >
> > I'm not sure if I follow it. Do you mean that rate / count configuratio=
n is static?
>
> In DP controller driver, rate and lane count are determined during link t=
raining.
> These two parameters are fixed in the DP PHY driver and cannot be modifie=
d.

Yes, llane count, rate and swing are determined during link training.
However it's not a part of the PHY's job to settle on that. Usually it
is the DP driver who determines these params and then calls
phy_configure() to set necessary params for the next iteration of
clock recovery attempt or link training step. As a part of the calling
API the DP driver doesn't have to pass full configuration. Instead DP
driver sets only required parts of the PHY configuration and uses
these flags to specify which part of the PHY configuration should be
updated and which parts were not set and must be ignored.

--=20
With best wishes
Dmitry
