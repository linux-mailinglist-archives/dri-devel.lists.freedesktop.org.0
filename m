Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A06757188
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 03:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2F210E031;
	Tue, 18 Jul 2023 01:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35A310E031
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 01:58:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngVemi+jLbAcSFIq3m1FJOQGuFW+cbQcBH6pDnQr1c0DXi1c2PEZSaS+Me3jd7xLUdC1p+3cO6ck9z50UEC0rTBee+rjLPG7JqL3VOHq27TSRXN0yMQRiMZ4iw+nfwSNnIkmeL15IIWzQ+wFVL9QKom4lKNCx6O3gho5WWeStRuB3PV7qj1lzeLyaRIOvgGkkGguV0Bj9lhXeZWL/y+JTijfCHRSmceZMIln4uEEU9xow6CVjsIxjZzlDgJuew51UAdf4LI7sUmF/sAuWcbW4x42C/LyCARfsxybZMrXLRLh67s2wNr8qrjc58qd+VLG7NcltniGGObLx0k5Myn1Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9o6m1UXERem9yKtWStw+Hpklq987nMnos05QsWdKUss=;
 b=M9mY1HfQLoDdOsVApugJOjUcUzQ/G6JplpDL3dR/FkKkZsFW0ATO/97UtWzGXJGTNAuMvYMA80CyKdXo+kYGWPXmlv6edwqBgikHI5NxuDwERfd4zF4Fj7IDayXBs8QBnJs9kg3Wg8+VVJEofmb2ftHWyzrBTAKNFrvxDMvKWDkahD2aMCIZq6y9lrK5R64UkQnoLxyMdZYbrDg+jpK/uRzDbezRxcefq5vcoCPeTi6sE8AUHiKJj3JjMX6Eq6JULeEgbrVf4gdpYlL1bl4H24rtLRQxTcILWvNvQQ1NVU058PZYNbcCVJqoXoEScfa26AivloR5emfsy3P/9+jEMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9o6m1UXERem9yKtWStw+Hpklq987nMnos05QsWdKUss=;
 b=BFHl5PkpDy92UkvahkknKTjGUfEzVhDZKDZ9ta+x+RmvjI/HELfkEkEqUkn+ck9+6i5woI2NCxK4mnOrq62CpF3JRFbhOr8bPWo74heOldpTIQZUNhxYAePNKNcYPl0GpWW0EZSf4djhL31chaz2uquzwGuJhAFJsSAhiUkTk7A=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAWPR04MB10030.eurprd04.prod.outlook.com (2603:10a6:102:387::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 01:58:09 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 01:58:09 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v7 3/7] dt-bindings: display: bridge: Add
 Cadence MHDP850
Thread-Topic: [EXT] Re: [PATCH v7 3/7] dt-bindings: display: bridge: Add
 Cadence MHDP850
Thread-Index: AQHZuIUePa/zOSPAXUe6/zQl/U27da+9sp2AgAERxRA=
Date: Tue, 18 Jul 2023 01:58:09 +0000
Message-ID: <PAXPR04MB94483425E2BC17597B7E555AF438A@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1689580812.git.Sandor.yu@nxp.com>
 <3646ea4d279838c78e00af1d746e3de34351b083.1689580812.git.Sandor.yu@nxp.com>
 <5693162.DvuYhMxLoT@steina-w>
In-Reply-To: <5693162.DvuYhMxLoT@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|PAWPR04MB10030:EE_
x-ms-office365-filtering-correlation-id: 5930d55d-5799-43b2-2734-08db87326fbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rNFVd+aCNZEbT/FhcZWfyJ5RrEgT710VK9cno8r7bDb53dWYOlGmtMwzQY27I18DO8DRgP5RzBJy8VFe2nQhPPsgBOfSX0Y+eC+xh2XvX1YUK2ndDMUMvK3/Py5IS356qZ2feVo4epkzeGpjFVh1Q7yIpplsUBH6yw6N5M6v+j4OO4Sv/FJDftvRluKHtceDYEa0KTIQ98fzuPAU6lnAgVfqqxXjqisejaN5vPnOIRo0Ttbfs3B5cEcbzAL0eAQdERQ2DMIygwG0U4Gx3hFvEXKbuSJzv0DSDP7bbF/eI5Sn059anXNn3qV9vQ8J2awU9dUPDcIS6GNrYpT4vTDkhCmva8zxQ3xpzX9n3IoY1g+t2QWUGHWkpaKneyZb1jhfbKsvLTOx67kY2gQtaDrE+pn8NqjrWZpQvVwC+hTBNm7bA100Zj8hzlH8g3KjFhmbCLkgdsyznUZVUEfKae6vnYBat1MaB0u0c9dA5aVliD3yF9zTeq5BjCRmk5Q2Y08KgHmBxpe7ulgd+jDX+B4Y+cpLNN+TGgDs6pmJmLK8i2X7Ufvp3iZFaYtUOsV3bpDWE25aqANTYNOz3AQNEJHlcdnjwV2cEYAyo2Lj6XdHzyaP7MYniwXy8dl8K5MKZiij
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(55016003)(54906003)(122000001)(110136005)(921005)(7696005)(5660300002)(478600001)(8936002)(45080400002)(8676002)(41300700001)(52536014)(76116006)(66946007)(316002)(71200400001)(4326008)(66446008)(64756008)(38100700002)(66556008)(66476007)(66574015)(186003)(83380400001)(966005)(6506007)(26005)(9686003)(86362001)(33656002)(44832011)(38070700005)(2906002)(7416002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?vo2vCz/YFvz7tMiN9mw91kl7fO1Us3mahQSGoeuc2dyxC/9ov31WgYIc8p?=
 =?iso-8859-1?Q?zbMEVaUzygDBH0Ua8gkSkUSgnelOvYtfi5z2t2Fc9fhT99QnUt+AyJlRcl?=
 =?iso-8859-1?Q?DDCUINPR0cnQ24/NH7r7V3Pn10pRiZXMTm3Mb/tqg+OGDKKDY5S5FwjrAo?=
 =?iso-8859-1?Q?dZ/LhpM+1YbFbFGPyU27rxCodaj/6Giw9jP+r7D3QFuZhJjrjTldtP8sZ2?=
 =?iso-8859-1?Q?f6JkfFM2RL2c0IiHYshnsGYoAPR8Y1o15oxu2y2LbHgo9zarJcI3kURtRb?=
 =?iso-8859-1?Q?LIQQ4Vu/k1svDdagQDfcmr15MQeI5fRIXHTv3gHATqBjdTMPB1xfseBu6e?=
 =?iso-8859-1?Q?KWdmtgA35YC1MyKENG3DST3J5qu0kz5cbmjOomukUlL2XyUvRv3cQnFUXZ?=
 =?iso-8859-1?Q?ZT2zRv42WortqxE7OfSl4TVQycDsVRV9HfCn1Q1CP30FoGZBJYPCj4t3fg?=
 =?iso-8859-1?Q?39DzlUTL5cWyCfS36P89uV7hDX5ZnqbHqfuaZ2OihqIv7eaQs2SfbEL9Tv?=
 =?iso-8859-1?Q?9kPr1FqN3sjCHJX0X6BhkX1mpEZEA/rc0jyg1TrD+NKDY/1riK7okqRowz?=
 =?iso-8859-1?Q?0P2FY5+u8Xu/bcDu5FQKq6q/Imuy3Y+FJjIOf95H6B4mobZfi+i9yVcFLF?=
 =?iso-8859-1?Q?9YVy8HDtG459ZICZsAbP2Qfm1U8Ji0gIbw1h34dtnApwyLEBqwrXdJSGf2?=
 =?iso-8859-1?Q?FY6z9bFd+pTJ4K+jGVeYdNSuFBWTFy/o2BzZbaJNET8Le83JhCBxHbyEE4?=
 =?iso-8859-1?Q?sWtrchR658jk97pd6Xa4lt+9bS4x3mIypDhyDInClYqIdrQpU7gAd4rhQt?=
 =?iso-8859-1?Q?WBhzPedCN+KnXpObCS0qPuLwWY5krRzHN2UAMmcN21lw4tUq2hta0B8yZK?=
 =?iso-8859-1?Q?DhLTf1oi4YEdx7yUlbTDcDD1AvuUK4qWsEsK0f9LMendcWNwY2cQIqL5mU?=
 =?iso-8859-1?Q?dFdkSXUL5hz0NWM8/Gh2JTiuukbscy2YhOJtldBwRpcR4BSmlfnr77fHTz?=
 =?iso-8859-1?Q?Eyuvqn43yNrMbeXXtDV+8rN5l9VoC+X2BS3WNdaSd4q1+/3acdpxYRjOPZ?=
 =?iso-8859-1?Q?0ChRmWTOC3kFPXWactyDsAecGgncakYIApUDXBF+knGngSz65cKNZIIZCu?=
 =?iso-8859-1?Q?vx87cec1TUa3X2i+j5bQJaDwVCWj82dTYOlUBltg1aHuxqXdciJGI9Qvuo?=
 =?iso-8859-1?Q?hZZBjGZ0ttOm4/OW162Qkiv6QqoheCuj6U7WRcjlRTW7XpM0mddEfG4ZzC?=
 =?iso-8859-1?Q?MYFP5aKqaNZx9Ex0K2G7Sl6a739Eeu5+54NTOnqfxdx5eJGcQI4QKC1rMU?=
 =?iso-8859-1?Q?wYrjlfxgGi0Ate5GauWf7zPTt9PvzrRuPkYSwpxmwCiAGZTr+Se3mqEfCp?=
 =?iso-8859-1?Q?OQawKEWjCYLoWoVYCsQAQWte0awhMJ6BLei2uOVYiKv6z7K0g/IOsFAHXV?=
 =?iso-8859-1?Q?I/svMY023pHgpKCZz71npguXK63Gvhm8aUfEDSHSktlzkpxCtafNGvONbH?=
 =?iso-8859-1?Q?11RvS87YilXgIF5t81693mAorN/EsO8OLRtPSV81XUtoUKvQnKh3RcrI3J?=
 =?iso-8859-1?Q?8q5TsTugOSXvnfaO1tlN6feHO8yJHmI0fvrQ3iJ4KwUmVpqjnMHHBoyLhk?=
 =?iso-8859-1?Q?qN7cvohW2VfP0=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5930d55d-5799-43b2-2734-08db87326fbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 01:58:09.5845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5f/DmCtjryd3QLJ5GI63sgjPcLGm1UM1vZlHg65d6iOgTfgDIn8Oq4304K6wkhbM01YOHtBs1vGVQhuTj6mgKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10030
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
Cc: Oliver Brown <oliver.brown@nxp.com>, "sam@ravnborg.org" <sam@ravnborg.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexander,

Thanks for your comments,

>
> Am Montag, 17. Juli 2023, 10:03:49 CEST schrieb Sandor Yu:
> > ********************
> > Achtung externe E-Mail: =D6ffnen Sie Anh=E4nge und Links nur, wenn Sie
> > wissen, dass diese aus einer sicheren Quelle stammen und sicher sind.
> > Leiten Sie die E-Mail im Zweifelsfall zur Pr=FCfung an den IT-Helpdesk =
weiter.
> > Attention external email: Open attachments and links only if you know
> > that they are from a secure source and are safe. In doubt forward the
> > email to the IT-Helpdesk to check it. ********************
> >
> > Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge..
> >
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > ---
> >  .../display/bridge/cdns,mhdp8501.yaml         | 105
> ++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > new file mode 100644 index 000000000000..b983ee765f54
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.y
> > +++ aml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +http://devi/
> >
> +cetree.org%2Fschemas%2Fdisplay%2Fbridge%2Fcdns%2Cmhdp8501.yaml%
> 23&dat
> >
> +a=3D05%7C01%7CSandor.yu%40nxp.com%7C603a90f3f3c34d32a1e708db86a
> 8f868%7C
> >
> +686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63825183250590544
> 2%7CUnkno
> >
> +wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1
> haWwi
> >
> +LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DJnbufeZplo%2B6JGW4HaK
> %2BLyC0MESK
> > +GsV%2FtjfeXCXqK4U%3D&reserved=3D0
> > +$schema:
> > +http://devi/
> >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=3D05%7C01%7CSandor.
> yu%40n
> >
> +xp.com%7C603a90f3f3c34d32a1e708db86a8f868%7C686ea1d3bc2b4c6fa9
> 2cd99c5
> >
> +c301635%7C0%7C0%7C638251832505905442%7CUnknown%7CTWFpbGZs
> b3d8eyJWIjoi
> >
> +MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3
> 000%7C%
> >
> +7C%7C&sdata=3DrdOyjVz4gGnToVC40Rcfp%2Fk925yC%2F6xNwGbBAnOtcDQ
> %3D&reserv
> > +ed=3D0
> > +
> > +title: Cadence MHDP8501 DP/HDMI bridge
> > +
> > +maintainers:
> > +  - Sandor Yu <Sandor.yu@nxp.com>
> > +
> > +description:
> > +  Cadence MHDP8501 DisplayPort/HDMI interface.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - cdns,mhdp8501
> > +      - fsl,imx8mq-mhdp8501
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description: MHDP8501 DP/HDMI APB clock.
> > +
> > +  phys:
> > +    maxItems: 1
> > +    description:
> > +      phandle to the DisplayPort or HDMI PHY
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Hotplug cable plugin.
> > +      - description: Hotplug cable plugout.
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: plug_in
> > +      - const: plug_out
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Input port from display controller output.
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description:
> > +          Output port to DisplayPort or HDMI connector.
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - interrupts
> > +  - interrupt-names
> > +  - phys
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/imx8mq-clock.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    mhdp_dp: dp-bridge@32c00000 {
>
> I'm not sure, but I would name this node just 'bridge', because it can be=
 either
> DP or HDMI depending on the connector. But DT folks will know better than
> me.
This name should update too after DP and HDMI driver combined.
I will change to "mhdp: mhdp-bridge@32c00000" in the next version.
B.R
Sandor
>
> Best regards,
> Alexander
>
> > +        compatible =3D "fsl,imx8mq-mhdp8501";
> > +        reg =3D <0x32c00000 0x100000>;
> > +        interrupts =3D <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-names =3D "plug_in", "plug_out";
> > +        clocks =3D <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
> > +        phys =3D <&dp_phy>;
> > +
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +
> > +                mhdp_in: endpoint {
> > +                    remote-endpoint =3D <&dcss_out>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +
> > +                mhdp_out: endpoint {
> > +                    remote-endpoint =3D <&dp_connector>;
> > +                };
> > +            };
> > +        };
> > +    };
>
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq/
> -group.com%2F&data=3D05%7C01%7CSandor.yu%40nxp.com%7C603a90f3f3c3
> 4d32a1e708db86a8f868%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C
> 0%7C638251832505905442%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w
> LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C
> %7C%7C&sdata=3Dm1JbdOzu8sx6h6fP2Q8OpyLAmvpguKFUj6ddCSB3OCs%3D&
> reserved=3D0
>

