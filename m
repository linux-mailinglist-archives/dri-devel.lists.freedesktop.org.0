Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A30B0A05536
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 09:25:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0474F10E243;
	Wed,  8 Jan 2025 08:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="GqrYoO8F";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="g3Hp0kVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC67810E243
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 08:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1736324729; x=1767860729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f6eOXS4JzRW5k2gGRfsw+YLVhYqUIyp3RhkH6MdJOIw=;
 b=GqrYoO8Fbs4vFzy9brENOxr4nGYZbeozRP3Sixr1cECIFo4MkcjOYKy8
 zDWtMXiYGNBYIxjIE8DgnW5GFF+6QcNPAFW5q1Mwy8YP3GTGhrYfmx7Pd
 dwa9eziHUwG4s0kMeU/77nVFiPMSQIbgsfQjFN1uJecHUa9bW7z4+NCS1
 km83c1AuUVCE0U3jojVfUpPIO1GXRvf/8J31kqxBTq+BZDcXjD7GgFjtL
 0boGlFGzAxx6d/ujTzJLZzJ3HIh0BofwoDMd81g3/LhCugl0ShTMaZHS3
 5TNNbHKlRPVYEmpWoKeLKLeopN7DNMYq1BHJ3sQdu7yOcJNSWEootb7uU A==;
X-CSE-ConnectionGUID: QkiaKRaqTx2Qh9ssCosMFw==
X-CSE-MsgGUID: uM4oghMBQDyTDJCmhHSfAA==
X-IronPort-AV: E=Sophos;i="6.12,297,1728943200"; d="scan'208";a="40913250"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 08 Jan 2025 09:25:26 +0100
X-CheckPoint: {677E3676-24-31397509-E321C4C4}
X-MAIL-CPID: B998A495D6FB15769D1220A8AE7CC4D2_0
X-Control-Analysis: str=0001.0A682F17.677E3676.00FE, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C1A52165E9F; Wed,  8 Jan 2025 09:25:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1736324722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f6eOXS4JzRW5k2gGRfsw+YLVhYqUIyp3RhkH6MdJOIw=;
 b=g3Hp0kVrJ9fiTMrvR6mPO9hRMnCKT2Ar+DaIRewMgxic9eWtgRY4yXfjTm9Gba1NZS27Pa
 p980LYsDZlAXQo4ZDhzG/mEKwy8VAtWBzERAXuroL0nG1QuGKS44Cyak0eNGSVSNRn8tiS
 iGH4rFMVnYZtWSNHjcKbsFUcke7FUiU7E92Y9dWN+p4MdU/ZhlAGvxLAalcshqoMNrDPyp
 4mdK6Yn8arN9+O/u4tLwn1Byu+yE4alqhiPISoKvRaV1RlHpuUJ61YxCtRsAPEWB+e/l7+
 V7cDDgdAcNHKzm0q/iOvu9Sfcfyjf61PKOkBWqY4TGm4ju1YyVNYnesXQN05ZQ==
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
Date: Wed, 08 Jan 2025 09:25:13 +0100
Message-ID: <3289670.5fSG56mABF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <PAXPR04MB9448B9928C1F7A64F32807F8F4122@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <7783214.EvYhyI6sBW@steina-w>
 <PAXPR04MB9448B9928C1F7A64F32807F8F4122@PAXPR04MB9448.eurprd04.prod.outlook.com>
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

Am Mittwoch, 8. Januar 2025, 01:31:11 CET schrieb Sandor Yu:
> > Hi,
> >
> > Am Dienstag, 7. Januar 2025, 15:42:56 CET schrieb Sandor Yu:
> > > Hi Alexander
> > >
> > > It may cause by the first preferred mode in EDID is not supported by =
driver.
> > > Please use modetest or other user application to change the video mod=
e to
> > CTA standard modes.
> > > Such as148.5MHz 1080p60 or 594MHz 3840x2160p60.
> >
> > No, the EDID does not affect the issue. I resurrected series v14 and HD=
MI
> > does work without any issues at 1920x1080.
> > If I can find a time slot maybe I can check which series version regres=
ses.
> >
>=20
> Could you please list the all video modes by modetest when device bootup?

This is  the output of modeset command after directly bootup:
> trying to open device 'imx-dcss'...done
> Encoders:
> id      crtc    type    possible crtcs  possible clones
> 32      40      none    0x00000001      0x00000001
>=20
> Connectors:
> id      encoder status          name            size (mm)       modes =20
> encoders 33      32      connected       HDMI-A-1        510x290         =
8=20
>      32>=20
>   modes:
>         index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot
>  =20
>   #0 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500 flags:
>   phsync, pvsync; type: preferred, driver #1 1920x1080 50.00 1920 2448 24=
92
>   2640 1080 1084 1089 1125 148500 flags: phsync, pvsync; type: driver #2
>   1280x720 60.00 1280 1390 1430 1650 720 725 730 750 74250 flags: phsync,
>   pvsync; type: driver #3 1280x720 50.00 1280 1720 1760 1980 720 725 730
>   750 74250 flags: phsync, pvsync; type: driver #4 1440x576 50.00 1440 14=
64
>   1592 1728 576 581 586 625 54000 flags: nhsync, nvsync; type: driver #5
>   1440x480 59.94 1440 1472 1596 1716 480 489 495 525 54000 flags: nhsync,
>   nvsync; type: driver #6 720x576 50.00 720 732 796 864 576 581 586 625
>   27000 flags: nhsync, nvsync; type: driver #7 720x480 59.94 720 736 798
>   858 480 489 495 525 27000 flags: nhsync, nvsync; type: driver>  =20
>   props:
>         1 EDID:
>                 flags: immutable blob
>                 blobs:
>                =20
>                 value:
>                         00ffffffffffff000469a2231f870200
>                         0d1a010380331d782ae295a2554f9f26
>                         115054b7ef00d1c0b300950081808140
>                         81c0714f0101023a801871382d40582c
>                         4500fd1e1100001e000000ff0047334c
>                         4d54463136353636330a000000fd0032
>                         4b185311000a202020202020000000fc
>                         00415355532050423233380a20200194
>                         020322714f0102031112130414050e0f
>                         1d1e1f90230917078301000065030c00
>                         10008c0ad08a20e02d10103e9600fd1e
>                         11000018011d007251d01e206e285500
>                         fd1e1100001e011d00bc52d01e20b828
>                         5540fd1e1100001e8c0ad09020403120
>                         0c405500fd1e11000018000000000000
>                         00000000000000000000000000000069
>        =20
>         2 DPMS:
>                 flags: enum
>                 enums: On=3D0 Standby=3D1 Suspend=3D2 Off=3D3
>                 value: 0
>        =20
>         5 link-status:
>                 flags: enum
>                 enums: Good=3D0 Bad=3D1
>                 value: 0
>        =20
>         6 non-desktop:
>                 flags: immutable range
>                 values: 0 1
>                 value: 0
>        =20
>         4 TILE:
>                 flags: immutable blob
>                 blobs:
>        =20
>                 value:
>         34 max bpc:
>                 flags: range
>                 values: 8 8
>                 value: 8
>=20
> CRTCs:
> id      fb      pos     size
> 40      43      (0,0)   (1920x1080)
>=20
>   #0 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500 flags:
>   phsync, pvsync; type: preferred, driver>  =20
>   props:
>         24 VRR_ENABLED:
>                 flags: range
>                 values: 0 1
>                 value: 0
>=20
> Planes:
> id      crtc    fb      CRTC x,y        x,y     gamma size      possible
> crtcs 35      40      43      0,0             0,0     0             =20
> 0x00000001>=20
>   formats: AR24 XR24 AB24 XB24 RA24 RX24 BA24 BX24 XR30 XB30 RX30 BX30 AR=
30
>   AB30 RA30 BA30>  =20
>   props:
>         8 type:
>                 flags: immutable enum
>                 enums: Overlay=3D0 Primary=3D1 Cursor=3D2
>                 value: 1
>        =20
>         30 IN_FORMATS:
>                 flags: immutable blob
>                 blobs:
>                =20
>                 value:
>                         01000000000000001000000018000000
>                         03000000580000004152323458523234
>                         41423234584232345241323452583234
>                         42413234425832345852333058423330
>                         52583330425833304152333041423330
>                         52413330424133300310000000000000
>                         00000000000000000100000000000006
>                         03100000000000000000000000000000
>                         0200000000000006ffff000000000000
>                         00000000000000000000000000000000
>                =20
>                 in_formats blob decoded:
>                          AR24:  VIVANTE_TILED(0x600000000000001)
>                          VIVANTE_SUPER_TILED(0x600000000000002) LINEAR(0x=
0)
>                          XR24:  VIVANTE_TILED(0x600000000000001)
>                          VIVANTE_SUPER_TILED(0x600000000000002) LINEAR(0x=
0)
>                          AB24:  LINEAR(0x0)
>                          XB24:  LINEAR(0x0)
>                          RA24:  LINEAR(0x0)
>                          RX24:  LINEAR(0x0)
>                          BA24:  LINEAR(0x0)
>                          BX24:  LINEAR(0x0)
>                          XR30:  LINEAR(0x0)
>                          XB30:  LINEAR(0x0)
>                          RX30:  LINEAR(0x0)
>                          BX30:  LINEAR(0x0)
>                          AR30:  VIVANTE_TILED(0x600000000000001)
>                          VIVANTE_SUPER_TILED(0x600000000000002) LINEAR(0x=
0)
>                          AB30:  LINEAR(0x0)
>                          RA30:  LINEAR(0x0)
>                          BA30:  LINEAR(0x0)
>        =20
>         37 zpos:
>                 flags: immutable range
>                 values: 0 0
>                 value: 0
>        =20
>         38 SCALING_FILTER:
>                 flags: enum
>                 enums: Default=3D0 Nearest Neighbor=3D1
>                 value: 0
>        =20
>         39 rotation:
>                 flags: bitmask
>                 values: rotate-0=3D0x1 rotate-90=3D0x2 rotate-180=3D0x4
>                 rotate-270=3D0x8 reflect-x=3D0x10 reflect-y=3D0x20 value:=
 1
>=20
> Frame buffers:
> id      size    pitch

The listed modes don't change over the series versions. The only
significant difference is that since v16 there is a "max bpc" property
Also since series v16 the HDMI screen stays blank, as in no signal.
I tried all from v14 to v20, v14 and v15 work, the others don't.

Best regards,
Alexander

> Sandor
>=20
> > Best regards,
> > Alexander
> >
> > >
> > > >
> > > > Hi Sandor,
> > > >
> > > > thanks for the updates.
> > > >
> > > > Am Dienstag, 17. Dezember 2024, 07:51:42 CET schrieb Sandor Yu:
> > > > > The patch set initial support Cadence MHDP8501(HDMI/DP) DRM bridge
> > > > > driver and Cadence HDP-TX PHY(HDMI/DP) driver for Freescale
> > i.MX8MQ.
> > > > >
> > > > > The patch set compose of DRM bridge drivers and PHY driver.
> > > > >
> > > > > Both of them need by patch #1 and #3 to pass build.
> > > > >
> > > > > DRM bridges driver patches:
> > > > >   #1: soc: cadence: Create helper functions for Cadence MHDP
> > > > >   #2: drm: bridge: cadence: Update mhdp8546 mailbox access
> > functions
> > > > >   #3: phy: Add HDMI configuration options
> > > > >   #4: dt-bindings: display: bridge: Add Cadence MHDP8501
> > > > >   #5: drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
> > > > >
> > > > > PHY driver patches:
> > > > >   #1: soc: cadence: Create helper functions for Cadence MHDP
> > > > >   #3: phy: Add HDMI configuration options
> > > > >   #6: dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
> > > > >   #7: phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for
> > > > > i.MX8MQ
> > > > >
> > > > > i.MX8M/TQMa8Mx DT patches:
> > > > >   #8: Add DT nodes for DCSS/HDMI pipeline
> > > > >   #9: Enable HDMI for TQMa8Mx/MBa8Mx
> > > > >
> > > >
> > > > I gave this version a new try but unfortunately the display stays b=
lack.
> > > > Although the display pipeline is intialized and even wayland starts.
> > > > Do you have any idea where to start looking?
> > > >
> > > > Best regards,
> > > > Alexander
> > > > --
> > > > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> > > > Amtsgericht M=FCnchen, HRB 105018
> > > > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schn=
eider
> > > >
> > http://www/
> > > > .tq%2F&data=3D05%7C02%7Csandor.yu%40nxp.com%7C23ba3321d4d5480
> > 4b98f08dd
> > > >
> > 2f35f3db%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63871863
> > 095591
> > > >
> > 6087%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw
> > LjAuMDA
> > > >
> > wMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%
> > 7C&s
> > > >
> > data=3D4Ip3wEX207cu0EreOtf11F%2BS%2ByNzAcI2C2iPjjlQzVg%3D&reserved=3D
> > 0
> > > >
> > -group.com%2F&data=3D05%7C02%7CSandor.yu%40nxp.com%7C734ea27ba98
> > > >
> > 140b7483e08dd2eed1276%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%
> > > >
> > 7C0%7C638718317967624410%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU
> > > >
> > 1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIs
> > > >
> > IldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D1HdQdbye9p5AHoT7JCF3Md%
> > > > 2FB9k9tyN%2FW25YKCEngvWM%3D&reserved=3D0
> > > >
> > >
> > >
> > >
> >
> >
> > --
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> > http://www.tq/
> > -group.com%2F&data=3D05%7C02%7Csandor.yu%40nxp.com%7C23ba3321d4d
> > 54804b98f08dd2f35f3db%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C
> > 0%7C638718630955952151%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1h
> > cGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIld
> > UIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dn3QmrbJru4JcdZvEM%2FxJp4rVf
> > Vmifjoxpq0o9Wxzh2Y%3D&reserved=3D0
> >
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


