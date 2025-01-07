Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B208A045A5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 17:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ED710E729;
	Tue,  7 Jan 2025 16:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="BsgYYpCe";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jq/MXzcb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB30010E729
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 16:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1736266289; x=1767802289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fpObqAoXYGDuXmd7OJbLt1uD81iqZ65kmp4O9tlZlR0=;
 b=BsgYYpCe1+qpfFDm/AJonY2gihYEF09lIWk+P7aFBEpPiW9DQSXfhJqW
 S/ORjBE8MwGZ9qmTVUyelSwWQp//sHtzGh9CUD28b4AaafbRoLOqWp7po
 FAGG1z56+7h/TC6cTGHNm4rJE4U8UpzFb2haLEkNMIe6zw7M5nBCuZau5
 WyGi6PJeo7INOl5pa2zzCq37kxpstL7ybAERnBtqYA+U1iv5r6+q0rD2A
 Hr4L3mvAGM05ohvm4fQ5AoeIeE5P3uC+hNHhlMMFKxt45BhvllknfCNvr
 1x1fpwKBLZvfYztsdYI0ia0NJZXqXpWKXKTL+vy46nQAM77EaiRO3Xw2p w==;
X-CSE-ConnectionGUID: zfmTbFAKS+6qkYkoNxcPMg==
X-CSE-MsgGUID: vix0vpW6SK2bT7vB7tR6vQ==
X-IronPort-AV: E=Sophos;i="6.12,296,1728943200"; d="scan'208";a="40899285"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 07 Jan 2025 17:11:27 +0100
X-CheckPoint: {677D522F-17-1CE016C0-E589DA3E}
X-MAIL-CPID: E868A18D3CE8DA83F2851A3B639ED350_1
X-Control-Analysis: str=0001.0A682F1C.677D5230.002F, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ACDDE164C41; Tue,  7 Jan 2025 17:11:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1736266283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fpObqAoXYGDuXmd7OJbLt1uD81iqZ65kmp4O9tlZlR0=;
 b=jq/MXzcbHKMcyfTWpycQVV4XyGhaio9YN4lyLQ7Aoif8Z6K4ksVdzwyi+bWk2nJ4A1J8EU
 M+3+8ccRu0FvM57ycTvP9U8RIQkTp2XU97jRI4nRx6q3+5DJzClnOOKjEkB6Wa7nymoOTV
 VEa26nf/HBRs7kMGffGPRi9zqaqkbY2ScY4Njzy8GuGE/P0C4Oodb7kWDj1utcXBen7Tn4
 K4xTKkd8t8NPPcDddWcKFMtYbvpilaLRf2IN5tQnMS5cybm1k8K+7ZyaV9Vk2kqENp92Qy
 u/R9Bhp+OhaNbCwPtQOJGOgWSb7hnwL0HcOUK4mn0SFQtyDcnKjPt2Jfpz0iRw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
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
 "linux-phy@lists.infradead.org" <li
 nux-phy@lists.infradead.org>, "mripard@kernel.org" <mripard@kernel.org>,
 Sandor Yu <sandor.yu@nxp.com>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [PATCH v20 0/8] Initial support Cadence MHDP8501(HDMI/DP) for
 i.MX8MQ
Date: Tue, 07 Jan 2025 17:11:18 +0100
Message-ID: <7783214.EvYhyI6sBW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <PAXPR04MB94483B3704FB62E12A009390F4112@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <2381464.ElGaqSPkdT@steina-w>
 <PAXPR04MB94483B3704FB62E12A009390F4112@PAXPR04MB9448.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,

Am Dienstag, 7. Januar 2025, 15:42:56 CET schrieb Sandor Yu:
> Hi Alexander
>=20
> It may cause by the first preferred mode in EDID is not supported by driv=
er.
> Please use modetest or other user application to change the video mode to=
 CTA standard modes.
> Such as148.5MHz 1080p60 or 594MHz 3840x2160p60.

No, the EDID does not affect the issue. I resurrected series v14 and
HDMI does work without any issues at 1920x1080.
If I can find a time slot maybe I can check which series version regresses.

Best regards,
Alexander

>=20
> >
> > Hi Sandor,
> >
> > thanks for the updates.
> >
> > Am Dienstag, 17. Dezember 2024, 07:51:42 CET schrieb Sandor Yu:
> > > The patch set initial support Cadence MHDP8501(HDMI/DP) DRM bridge
> > > driver and Cadence HDP-TX PHY(HDMI/DP) driver for Freescale i.MX8MQ.
> > >
> > > The patch set compose of DRM bridge drivers and PHY driver.
> > >
> > > Both of them need by patch #1 and #3 to pass build.
> > >
> > > DRM bridges driver patches:
> > >   #1: soc: cadence: Create helper functions for Cadence MHDP
> > >   #2: drm: bridge: cadence: Update mhdp8546 mailbox access functions
> > >   #3: phy: Add HDMI configuration options
> > >   #4: dt-bindings: display: bridge: Add Cadence MHDP8501
> > >   #5: drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
> > >
> > > PHY driver patches:
> > >   #1: soc: cadence: Create helper functions for Cadence MHDP
> > >   #3: phy: Add HDMI configuration options
> > >   #6: dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
> > >   #7: phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for
> > > i.MX8MQ
> > >
> > > i.MX8M/TQMa8Mx DT patches:
> > >   #8: Add DT nodes for DCSS/HDMI pipeline
> > >   #9: Enable HDMI for TQMa8Mx/MBa8Mx
> > >
> >
> > I gave this version a new try but unfortunately the display stays black.
> > Although the display pipeline is intialized and even wayland starts.
> > Do you have any idea where to start looking?
> >
> > Best regards,
> > Alexander
> > --
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> > http://www.tq/
> > -group.com%2F&data=3D05%7C02%7CSandor.yu%40nxp.com%7C734ea27ba98
> > 140b7483e08dd2eed1276%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%
> > 7C0%7C638718317967624410%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU
> > 1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIs
> > IldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D1HdQdbye9p5AHoT7JCF3Md%
> > 2FB9k9tyN%2FW25YKCEngvWM%3D&reserved=3D0
> >
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


