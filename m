Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1252C9DEF58
	for <lists+dri-devel@lfdr.de>; Sat, 30 Nov 2024 09:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2168A10E00F;
	Sat, 30 Nov 2024 08:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YR4MnhV7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC7D10E00F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 08:28:10 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53ddb99e9dcso2584833e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Nov 2024 00:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732955289; x=1733560089; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cbSnMoGC544U7zX5fIfp831y8T12sKgnt66TAb2i060=;
 b=YR4MnhV73wbb3KIuTGZWzb/7ZhmuPVfVRZfGpaDgC+OUyc9+TLYmHc5+dNZAZ5dn2H
 uqi4Nfikjh0LcgSdy8XEfh69Q7jvc0yFRLDIGTlw/9pzx4LGOE5kRd5KHX+ztf8BNjii
 6US2Fb2TXSIrz7j1kTx9tnEYHztnJEweqYRNsw45ot/WWMPSW9NwCi8prDlc0XMzYba9
 +JLEwUwPRtK+he39oTxCW/Hm0l+KTyHticL6JHNJNs9dByuuOTpqWHhC3ERKVaVb03Ap
 vO+otkSdeXukemEmZDh/ohGFZKN8nDvkW8a3CJFqlp3tCyKqLrfLjRDvMk+vmAf8qrNf
 uJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732955289; x=1733560089;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cbSnMoGC544U7zX5fIfp831y8T12sKgnt66TAb2i060=;
 b=oXiGl/lDxPkHAYIb3Dqv6+g64vcJbQbjpgDaC60MrEmDC7XLqJMZuj9+7rOw7/Oe25
 MfrwQPvNdn6D5zzNjJWYreFZX9dyhaqhdcGxCkFBgoaBoyvMVhFcG/dwtI8jyrKRtNBi
 2XcV+7/9uznjBc6W0EaU+9+KElMcVCvudwn4fLfwI3juCqDfI3Ur8j0xJYDwtA2eFFVv
 urVdLSlkDXLAlvTzuRwz3Zw+qk9UeH9KCDzJePgKuH3Hu87WVsa4paRqoo21KxgngviW
 N3399kHx+yOE0UHoqPtuq5yi6rtduyOtuBDSZ1wmbMlytZznaOoz/Kqkv5GWLzZfs8CX
 gRAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpIaMwzBTkurT7EBf/jBonVDfDMmOz6IFUuRh57R9jB4t2/E7g5yCIzwZA/Z8WSRea7rp7ozwoxy0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPWz5FfwqvePk1x6jbJtsmUsysYPETErwC2Y2Lzg6na82snWYz
 MYTwxUrLBLMa/rAi+l8lZB6V0FmrYyiaurv4PSbTc/Hs16y2jQkV2O0rQ16gauc=
X-Gm-Gg: ASbGnctExZ15Wyng1bLJd5dz1bAWxtNGatvYHUdUJrJlQXTeSaNmltwBTV/JSJRwLJ4
 ubR1p37xLuIrNke4AfRfvFU/p4JnXKAxCsOeLoTF5enhHq6B/HmmJNeG5Hik8nCKymd5CpqOvmt
 N0PR99YKmiJOBGNoD9JXmQ7j795fG1OeU0zIKpRooMXpUAqTa78L8khKpAhJqdVzVVyRq3kiVxb
 VVhrbT16Ok7GIltM+4BuxzabM6NFoz1+bbsIymUj6QY29GylfzjIe9LkxNkQxLQXoHXsRIMeYyz
 l/19QEGbbNxCn0YhrNaEZEfcrH1WMQ==
X-Google-Smtp-Source: AGHT+IFgWR3gAkOG9mafLXj/TmNlCERT2tB84SZRTKkdRAWB1jZom71zptQRqQUiP9OjF7eSxCiFOQ==
X-Received: by 2002:a05:6512:3c9c:b0:53d:e544:3fda with SMTP id
 2adb3069b0e04-53df0114865mr9728745e87.55.1732955288602; 
 Sat, 30 Nov 2024 00:28:08 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f2cesm689752e87.121.2024.11.30.00.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 00:28:07 -0800 (PST)
Date: Sat, 30 Nov 2024 10:28:04 +0200
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
Message-ID: <ux55oif6kyp6thojj55ymlcjjgsmqbrc35wtmmfbaun7qlxfuw@k6fi3ea5laty>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <411e42c70e71dce33a80059f663fb6c58fb2ac8c.1730172244.git.Sandor.yu@nxp.com>
 <efciuvoptv7qxwauswfseb6zlt5w4fmjdbm3huxfsn63a6bm7u@kfgkkvqoz5x4>
 <PAXPR04MB9448F638D47B5495CF78007AF4522@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <76D430C8-3DBB-4D89-9361-9B5D3EDCF067@linaro.org>
 <PAXPR04MB9448A7F6973D9DAE98115716F42F2@PAXPR04MB9448.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9448A7F6973D9DAE98115716F42F2@PAXPR04MB9448.eurprd04.prod.outlook.com>
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

On Tue, Nov 26, 2024 at 02:12:04PM +0000, Sandor Yu wrote:
> > 
> > 
> > On 5 November 2024 14:05:51 GMT, Sandor Yu <sandor.yu@nxp.com> wrote:
> > >>
> > >> On Tue, Oct 29, 2024 at 02:02:14PM +0800, Sandor Yu wrote:
> > >> > Add Cadence HDP-TX DisplayPort and HDMI PHY driver for i.MX8MQ.
> > >> >
> > >> > Cadence HDP-TX PHY could be put in either DP mode or HDMI mode
> > base
> > >> > on the configuration chosen.
> > >> > DisplayPort or HDMI PHY mode is configured in the driver.
> > >> >
> > >> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > >> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > >> > ---
> > >> > v17->v18:
> > >> > - fix build error as code rebase to latest kernel version.
> > >> >
> > >> >  drivers/phy/freescale/Kconfig                |   10 +
> > >> >  drivers/phy/freescale/Makefile               |    1 +
> > >> >  drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c | 1337
> > >> ++++++++++++++++++
> > >> >  3 files changed, 1348 insertions(+)  create mode 100644
> > >> > drivers/phy/freescale/phy-fsl-imx8mq-hdptx.c
> > >> >
> > >> > diff --git a/drivers/phy/freescale/Kconfig
> > >> > b/drivers/phy/freescale/Kconfig index dcd9acff6d01a..2b1210367b31c
> > >> > 100644
> > >> > --- a/drivers/phy/freescale/Kconfig
> > >> > +++ b/drivers/phy/freescale/Kconfig
> > >> > @@ -35,6 +35,16 @@ config PHY_FSL_IMX8M_PCIE
> > >> >         Enable this to add support for the PCIE PHY as found on
> > >> >         i.MX8M family of SOCs.
> > >> >
> > >> > +config PHY_FSL_IMX8MQ_HDPTX
> > >> > +     tristate "Freescale i.MX8MQ DP/HDMI PHY support"
> > >> > +     depends on OF && HAS_IOMEM
> > >> > +     depends on COMMON_CLK
> > >> > +     select GENERIC_PHY
> > >> > +     select CDNS_MHDP_HELPER
> > >>
> > >> This can have problems with being satisfied on randconfig builds,
> > >> because CDNS_MHDP_HELPER is deep inside the DRM tree.
> > >
> > >Yes, it should be. Change it to "depend on CDNS_MHDP_HELPER" will
> > eliminate this problem.
> > 
> > No, depending on a non-user-selectable symbol is a bad idea. You should
> > either depend/select all necessary symbols or, better in my opinion, move
> > your helpers out of the DRM tree.
> 
> How about change CDNS_MHDP_HELPER to user selectable? such as
> 
>  config CDNS_MHDP_HELPER
>          tristate "Cadence MHDP Helper driver"
>          help
>            Enable Cadence MHDP helpers for mailbox, HDMI and DP.
>            This driver provides a foundational layer of mailbox communication for
>            various Cadence MHDP IP implementations, such as HDMI and DisplayPort

I'd say, it's a bad idea. Helpers should be automatically selected.

> 
> Finding a suitable location for the helper code is challenging. 
> It needs to be shared among various IP versions (essentially different SoCs) 
> and across different driver types to facilitate mailbox access.
> I've searched the kernel code but haven't found a good precedent. 
> Placing this helper in either drivers/gpu/drm/bridge/cadence or drivers/soc/ (as you previously suggested) has its drawbacks. 
> drivers/gpu/drm/bridge/cadence at least provides better context for readers.

Yes, I understand the issue. However you might as well use drivers/phy/
for the helpers: your DRM driver already depends on GENERIC_PHY, but
there is no dependency from the PHY onto the DRM.

> 
> > 
> > 
> > >
> > >>
> > >> > +     help
> > >> > +       Enable this to support the Cadence HDPTX DP/HDMI PHY
> > driver
> > >> > +       on i.MX8MQ SOC.
> > >> > +
> > >> >  config PHY_FSL_IMX8QM_HSIO
> > >> >       tristate "Freescale i.MX8QM HSIO PHY"
> > >> >       depends on OF && HAS_IOMEM

-- 
With best wishes
Dmitry
