Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92326757713
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66EFB10E303;
	Tue, 18 Jul 2023 08:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F95210E303
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:52:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hru72NogRD/6gfNDXVh8MkiNDPHoeNK+CseYztbGw9VKN6lZzfSQ/eZTwJjC8A7WnZYfsrKVA5K3/2Y8rigse8s5XFe1sTy682+noKA3zsU3gL/sYLUUw76wvbvfJHYZwaIrTbhg9N4NbSqy2Hgf3b6kJjDwmKX2W3UZDB3hVBdLS3yIaanjox8worXtSmI+rgD12LUMbpQ+Sm2he/NN9qd0Bk/u6cl3NfT87lzc1sRE6eOZOkvp4uWui/9vsPnUbbpfl3BfZNccCKj1Fr/P4jDgfX5keNeUNHHDFl2M5loCqnBNAu7ECd2+rJT0b1QfXb189mQZspF/Xb9w+YwmsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDLxcefUGUaTQCksC/KqghZND36mBGVy60NgKYid/XM=;
 b=O8HHYzeROzFWPk6Rg57nrP53cDNHzWXZVpfmz5XzKiKVXkNoVQzfZnpSvgN+I8c6BXKpCm9PYPMZmFgDx3fF0Qb06cH53dB/93P/j+EDJ/sK67OBXxnuqWCD5EaRCi0paH1VBZLve5VJX3PemLUQRo/GmKfjDWNEfN7vlR6ddEaMEeplqeiSYZW31Ouln9OBPoHv9U69LZb4B8kEhplp5RkamnGgx+XakVE0MD4sKjWJx36EZ9mFZAN12Bvhjh4kQUq5vRPld6F56RLE6uVgZRC1qODGl1LBJdc8x2KvSyinbsArbFKPAlfj2kuc3TkvS2kOaaLLVQZJuunedYpVvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDLxcefUGUaTQCksC/KqghZND36mBGVy60NgKYid/XM=;
 b=sURpDztB1pz4+A/vb+F+2dUU9zViJaHukFe0+Bps0w2S3e23bYS/IEM9ZKOR76nXSo/vAnw9BBqTldVB7CTuSc7ErA+6wjHxCxdcbaal8J2jCRRAqHbxFMBrmjopjMbyvMZnpP1I902MMYrZhoHNKAw660U1hAeK3hBHvfOITaw=
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
 by AS1PR04MB9629.eurprd04.prod.outlook.com (2603:10a6:20b:474::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 08:52:43 +0000
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::5073:2966:2774:c741]) by DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::5073:2966:2774:c741%3]) with mapi id 15.20.6588.027; Tue, 18 Jul 2023
 08:52:43 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 0/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Thread-Topic: [PATCH 0/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
Thread-Index: AQHZuHXZ0xRCxa1OlUaeT9fURHFGOa+/JRQAgAAMBkA=
Date: Tue, 18 Jul 2023 08:52:42 +0000
Message-ID: <DB8PR04MB7051681DDDAA76604AEBF8609838A@DB8PR04MB7051.eurprd04.prod.outlook.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <3750806.kQq0lBPeGt@steina-w>
In-Reply-To: <3750806.kQq0lBPeGt@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB7051:EE_|AS1PR04MB9629:EE_
x-ms-office365-filtering-correlation-id: d11101c9-691d-4a85-f810-08db876c596e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dEG9Fu39rC5Tn/Wr2bZmqug/tcYK66bLimbLcGPIO7PQuJpoqNv+Bcf4wTEoUf2cQaZmOxqi1kg371LzMVMSYGBKRmyxmNBaO9TVi9kYGKzZNaDYYCpEW3N6wFpqv7eOAqYO13Son/zPR1O/QNbVwqwcUprqQlqOpiQlArI56Zk+r2Eb8TWONJ52r66Jqc3k1d1LqQk8ZPQ2quPojrTz4cDNOCYlgLTE+yXmIVJ0lAP/jyeEyiWn2h23LXGQojjoK1P4VsZbgkvwoO6FXzPNJUayq+eHYcNR3B+wM1615xCCwoVpR+XMyVXHh+1zRWnnExHyknW6nqvLEC7QaT9C6C9pIeFdTgc4cfQkyRy6RtWmhjt7sDJvVvGlW45WqNLSkK57KpG+XYZJ+qtHuz/YpNkQTp1vYvId2ndggI306IEZPgExMrj9mmuL3fP7MRtvqUXcbZGBaJUFCChLcqgT8QobIqtJ/vqjvkBqXA5nj6SpAfHJyKufRSkl7sz0aYCB7aKtUSJud98lqsoBIGl/dgxBMEYCJpuvvedldBdnOoP3cWjsvjniND6oK1peUpsejK0j5o8wveoh1NohGmwgmJTQ6nboia119/nJn/EnUr4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB7051.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(66446008)(66556008)(110136005)(54906003)(86362001)(7416002)(186003)(66476007)(64756008)(66946007)(76116006)(4326008)(478600001)(41300700001)(9686003)(316002)(966005)(7696005)(45080400002)(71200400001)(38100700002)(8676002)(8936002)(38070700005)(26005)(5660300002)(52536014)(6506007)(2906002)(83380400001)(122000001)(53546011)(55016003)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UB3V7xQFE2me5VyZWf/Sa5YLyIeVxh2ArB8nVrc7pfkVBbh/XcUn6Ac9sI?=
 =?iso-8859-1?Q?Rgxr3BxcOKrxJso7EeCRFWNZshRnVMilk2uFrvGMzEaApTKwi1QF7DFwRp?=
 =?iso-8859-1?Q?8sOgtKetqdTHuhBehbMK6o8lon7ATz7NTXVklorOKFq53ZhUrRzP6Cnmj+?=
 =?iso-8859-1?Q?b1paDM60RriRBqCyQgDXMqgYIMm3f8WG/2SCCNY1NY1cFshuWi+yN8Efdn?=
 =?iso-8859-1?Q?EfmBOLbNIKWVd17sIcAZD+4fqgurjl9ycleIatRP1v8OrHbWZBMy005s7V?=
 =?iso-8859-1?Q?XnMMeKIJv/1p9Nf2nW0Khhu4u+g1AgcZM2SaCRy8eq1NVONyqQyL8lB8U2?=
 =?iso-8859-1?Q?zo3slu9c20tYcM4alDC82CjwGRFlSkVAqBTXuWAOYmSENKSfYKjZTCaD9r?=
 =?iso-8859-1?Q?hc4/mNP1lA9MuhH7w1aZOXAv4FzWXJZvBI+UbchBTNsrryf11YTQm7L5Ey?=
 =?iso-8859-1?Q?5KtKXv6QW3TwK01QH1FrMolLv9Ek7s712/cPrs88S5TWuslLVn1u3F3Q47?=
 =?iso-8859-1?Q?xI9ITlC3cCJMxhSppAO+5qxdUSYKpWQYxhJurUamxDDQWppzUMeZJsIBYe?=
 =?iso-8859-1?Q?kRqtzj01upUkQVle9E8FgkCJGqIYeobhpN8AMaLfwFAM6fXaDQkyDJPxkd?=
 =?iso-8859-1?Q?DaKqo+1BNmiKJWwDaR1IZDlncDy9BQO91aSFTDvU85+EmPvqUSTHdYVyl2?=
 =?iso-8859-1?Q?4JXb1fNEQAYLB7WlsIaZi3vkRG8gHBI7PQ9NVwN7J+PhsHiXW8uri4avi1?=
 =?iso-8859-1?Q?tF4r7m4ZKfbT0M7zj+saH9fetuPk6siLlpopLaMvTT25kaUUw94njzov6E?=
 =?iso-8859-1?Q?GgJ8ipOEIw4WDCZZPBni6fmzCTAx3ddXVLaf9rnRYJHARIpU+Gjt/hi4Yq?=
 =?iso-8859-1?Q?vIRrieGyvSVpHqQaNsaW+QkQbY7IqlAMD5r2n7wjZva0rDNJkGKjf7SaMj?=
 =?iso-8859-1?Q?3n+km5obbQmr0ma+7+6i85oBd25DDbDn19Usr1M23lj0+xjJDaUFZcmlsQ?=
 =?iso-8859-1?Q?I4y1pehJ25IrZeNgauXThOx7n5GNR2YKa3YcNmbokI1txtE3CJbPgqPIFF?=
 =?iso-8859-1?Q?UvEja+bIuLessitgLYMPNa6Taa4k7/DzGgdtZRpkUvFFyfNuglaQL44UxA?=
 =?iso-8859-1?Q?F3D+TX+8ce55ACrfRPNkhCoSZSNQpgjKpKpaBTjmP/gX2TcumrJ4qpRVRr?=
 =?iso-8859-1?Q?e7Vizf30w1584+oWmTVelictUfI2l1GWmbDPu6kNHQr7nXDfwzt97T346t?=
 =?iso-8859-1?Q?atA0U+DLeibbnCR/ZOj8x8FWRIRdoKMKOzZNuJomIoiJ6UI88Vb3Yv/Vfc?=
 =?iso-8859-1?Q?/eO6opLqrTVMAFQYGp1R7XGGXxQwl+1nygMrtkJCyCST3nXEa51CvCw93y?=
 =?iso-8859-1?Q?PdLaDb8+CRxMeV0MPhyQJ4a+LqALKmuuJFXdH5LJo2U7hwO5bojxd8iGTr?=
 =?iso-8859-1?Q?qlhmM75XW4UrwPXAdqF4uy6ptNCcn7lgzJs7fQmlqnfPEnP04Nb1OF/LgJ?=
 =?iso-8859-1?Q?vwfGZ0xUM2vxcxyefDxU3gDJ0/6et9dcii1AUdV9W81x+5UxvFxm/tyKIX?=
 =?iso-8859-1?Q?2AhWPaDDfSr9p7xX0Ki7HaRyW5zTjkPi9xkThLhhP+za+w8RtFYcpXNIFZ?=
 =?iso-8859-1?Q?lutOPdT3zQLIM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d11101c9-691d-4a85-f810-08db876c596e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 08:52:42.9559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zLbbAifLziyDb04pHPRPmdBMBp7zgX1nEJ4e6mcPG1pPKfrdTLsDNJAERf0iyjqXEPF0d1H1x6eAONlW5Kq6VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9629
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
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 dl-linux-imx <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tuesday, July 18, 2023 3:40 PM Alexander Stein <alexander.stein@ew.tq-gr=
oup.com> wrote:
>
> Hi,

Hi,

>
> Am Montag, 17. Juli 2023, 08:18:22 CEST schrieb Liu Ying:
> > Hi,
> >
> > This series aims to add MIPI DSI support for Freescale i.MX93 SoC.
> >
> > There is a Synopsys DesignWare MIPI DSI host controller and a Synopsys
> > Designware MIPI DPHY embedded in i.MX93.  Some configurations and
> > extensions to them are controlled by i.MX93 media blk-ctrl.
> >
> > Add a DRM bridge for i.MX93 MIPI DSI by using existing DW MIPI DSI
> > bridge helpers and implementing i.MX93 MIPI DSI specific extensions.
> >
> > Note that since this series touches the dw-mipi-dsi driver, tests are
> > needed to be done for meson, rockchip and stm.
> >
> > Patch 1 ~ 7 do preparation work for adding i.MX93 MIPI DSI DRM bridge
> > driver.
> >
> > Patch 8 adds DT-binding documentation for i.MX93 MIPI DSI.
> >
> > Patch 9 adds i.MX93 MIPI DSI DRM bridge.
> >
> > Liu Ying (9):
> >   drm/bridge: synopsys: dw-mipi-dsi: Add dw_mipi_dsi_get_bridge() helpe=
r
> >   drm/bridge: synopsys: dw-mipi-dsi: Add input bus format negotiation
> >     support
> >   drm/bridge: synopsys: dw-mipi-dsi: Force input bus flags
> >   drm/bridge: synopsys: dw-mipi-dsi: Add mode fixup support
> >   drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock rate to calculate
> >     lbcc
> >   drm/bridge: synopsys: dw-mipi-dsi: Set minimum lane byte clock cycles
> >     for HSA and HBP
> >   drm/bridge: synopsys: dw-mipi-dsi: Disable HSTX and LPRX timeout chec=
k
> >   dt-bindings: display: bridge: Document Freescale i.MX93 MIPI DSI
> >   drm/bridge: imx: Add i.MX93 MIPI DSI support
> >
> >  .../display/bridge/fsl,imx93-mipi-dsi.yaml    | 115 +++
> >  drivers/gpu/drm/bridge/imx/Kconfig            |  10 +
> >  drivers/gpu/drm/bridge/imx/Makefile           |   1 +
> >  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c   | 934
> ++++++++++++++++++
> >  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  91 +-
> >  include/drm/bridge/dw_mipi_dsi.h              |  16 +
> >  6 files changed, 1163 insertions(+), 4 deletions(-)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/fsl,imx93-mipi-
> dsi.yaml
> > create mode 100644 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
>
> Thanks for posting this patch series. I was trying to use this driver on =
our
> TQMa93xxLA platform where the DSI signals are connected to a TC9595
> (driver
> tc358767) DSI-to-DP bridge.

Thanks for trying to test/use this driver.

I don't have TC9595 bridge to test, unfortunately.

> Unfortunately this bridge requires the DSI signals to be in LP-11 upon re=
set
> and while in idle, otherwise not even DP AUX channel is functional.
> Apparently DSI is currently not in LP-11. But reading the RM I have no id=
ea
> how to configure the DSI host to achieve that. Do you have additional
> information which might help me here?

Hmm, probably no.
But, I tested ADV7535 DSI to HDMI bridge or RM67191 DSI panel on
i.MX93 11x11 EVK with this series, which works.

> Also could you provide your DT configuration?

For media blk-ctrl, dsi and lcdif, see:
https://pastebin.mozilla.org/aP8tFrPM

For adv7535 display pipeline, see:
https://pastebin.mozilla.org/89zwvr9Y

Note assigned-clock-rates is needed in lcdif DT node to suggest video pll r=
ate.

Regards,
Liu Ying

>
> Thanks and best regards,
> Alexander
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.t/
> q-
> group.com%2F&data=3D05%7C01%7Cvictor.liu%40nxp.com%7Cbf329d1b4d704
> 801a94f08db876225f6%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
> 7C638252627845769696%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA
> wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7
> C%7C&sdata=3DQ4wBL6Ji0wcMVIJpuR1gNAqBtFgUiJAwA5QvesFoGLc%3D&rese
> rved=3D0
>

