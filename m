Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D56758B63
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 04:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBB310E3FA;
	Wed, 19 Jul 2023 02:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5899B10E0E9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 02:32:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyH2jrn64GwRKhxPw9502s/5vC0koI+Kx7plrxrtiiejRgqVOUXha73zzsLALITk+nHF1WHdNQ8V0T0kzfV3c03fEwno+yRJ08M/9/mKwFbh4/TG2mcc5PyRq9EEwNxEbXx20boMM4/TBm9wydCsuabdNojtYnuEvzh6UBx1leCGTea3QGj2pxiXsmZZ6hdhpqb8UhjlvXiNUItq8s4cQ0I+9CqFxNJ+ELVa+Nn+5miqQJtSvkdLsjf2o6PIaSmgxfeX8UByX4rpZhJ7GL+jLLZq3MqjQi1Cxgxr2nt6m+Xgspe9i4ca6ELJ1mlFXKwt0uF9+CvJu7rzcW3z3oNJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YC5TPtZzJl6vTkUQ2avJVMJehCoza8c/zJKFnCH5Gw=;
 b=VXST8itexOkLczkQtWw2jTBtE1DOMquHUm8yDNegp5CpinxIU/QDYdSa+NBd63BMc3QKWPZUzlPYxaZXIvLEE06u+VhDyoQQuVARj4A54grtLNLYaVbh2xzNfH2bZ9MdUD8I+R9et/VZEmI+qO2d9JIaadN6KrUJVAOVEhCmQGWx++yBviizthZ50dnW5HfhPDqdhlfKn4Te5GqOBUZXMHIyldkDRXAlwRlBz/X2lUc0c76wXgPiON4hcHGEPkoTPsYdzCdbps5OzPOTcyGoM87xuXXVHqimSpq6K2/IerL1G/xgjtKlYXjFOUkggpDGD57BWro6ncaTJBq9TVvD0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YC5TPtZzJl6vTkUQ2avJVMJehCoza8c/zJKFnCH5Gw=;
 b=Y8mz5boEuzA7ejYhsXnVPWl94FXBOZ5aOnIinC67+2xsiLRDNqQpW0J2pz18xmfwXzS/cdTwRnnsN6YBkAZKJb1yXToBiRo85Su0y4jWb+7Moyy2uou5XV4LkQW9JkiOhwkfHvsOqlcwQgjo4dVWN6u8/s8KBQaaQZQDAnjLNUE=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB9PR04MB9792.eurprd04.prod.outlook.com (2603:10a6:10:4c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 02:32:40 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 02:32:39 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [EXT] Re: [PATCH v7 3/7] dt-bindings: display: bridge: Add
 Cadence MHDP850
Thread-Topic: [EXT] Re: [PATCH v7 3/7] dt-bindings: display: bridge: Add
 Cadence MHDP850
Thread-Index: AQHZuIUePa/zOSPAXUe6/zQl/U27da/AHoWAgABCD1A=
Date: Wed, 19 Jul 2023 02:32:39 +0000
Message-ID: <PAXPR04MB9448A6CD96FB6CE751E565A8F439A@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1689580812.git.Sandor.yu@nxp.com>
 <3646ea4d279838c78e00af1d746e3de34351b083.1689580812.git.Sandor.yu@nxp.com>
 <20230718223249.GB2112396-robh@kernel.org>
In-Reply-To: <20230718223249.GB2112396-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|DB9PR04MB9792:EE_
x-ms-office365-filtering-correlation-id: 7b74a330-700b-4b67-c44e-08db88006be4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0HoxzhDGlHf4sfPg8TDfHhBDd6Jau9khnuDqpU8cIbp2aFhyv9oJz37p1aqk0aNL4bfKikyf+/WIr4b2NlDclpRftd5LW//CCbGVMv5OYruh0eprQitWiyGL1n3CfmcNcc5DyFYQhKkKLOVohUw8fz8voN8nam1ynMJ1SRpdKNolbD98grDFTMIRvgcD/rYnyqu908FWThHnB1l+UredTHPFjNbj5DN8BYVw3SOVqvwGEuhCTe/2jDSyHHfaKRMk1pcVrj5/C/Fj41vcf3ZA5Hbx9ToVPF9aOVmOSJvHX8difytA/UuFgBgkh5rK6m1cl/catZQQymbMF5lPFohq9jm/b0XxBC6r3j2do4LKLhFhGOvXIlrT9a46QLNKm/oDxkAyfLVFGpiMRfUfwBldQntah46N5O/ZgTj+DmkhUTp/7uZ3K+fxs0U3qJePhNta1OKqHrH58HJF6WkCTvcifnokvSr0nBDabbnTVuItleqJFpzogVIO3b4ZnLr6Bi3fcXB+Y4mcP30xvpEHftSSLcmQ4OouNRHycWnqyDSwUB/CSr/q8bSPrJ7gKdWYtpf3Ga+jhqyaUZhSx6zVmBTnmQplTOoNkVS/mA0+RY+O+s+wznFqhPgSLwbbiIZJoFzM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199021)(86362001)(2906002)(7416002)(38070700005)(33656002)(44832011)(55016003)(83380400001)(186003)(26005)(9686003)(6506007)(7696005)(122000001)(54906003)(316002)(66446008)(64756008)(66476007)(8936002)(66946007)(6916009)(66556008)(38100700002)(4326008)(5660300002)(478600001)(41300700001)(71200400001)(45080400002)(76116006)(52536014)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+spA5o/GlrFyIjSLi/FnVNjhBhe7RSNTABTIaINREysR73hBLKMlhg40VTbE?=
 =?us-ascii?Q?3tdnT6hrEXKROAaZqZ3Ba/tzdWVBiNoWqOchV7wmrEa+uu/m55GwO9Q7joef?=
 =?us-ascii?Q?Xkyoxr7DWImdrkW1Wd1Jb8YA2MGM7LMWNioovOPu0mrbwjQx8buVXfjxhX4V?=
 =?us-ascii?Q?QuBoOqxtcWiYe8rqNlfrn8m2eFO9qYSvRErKZLqLriGbGnZHGoa+hW8Jmhiu?=
 =?us-ascii?Q?GTGN5McGHPyVca9j9zSoQi3YkQ1xAwp4czt8HcuMexBJWeSBbWP6C9lHcTbR?=
 =?us-ascii?Q?7mzNiNPRxpo/9BxPRoZa4RtDj2/gynVB49BYAGydW4FjpograUQjyMF6z9SX?=
 =?us-ascii?Q?Oelo3ck38DZByyIatoGBgOkFbn7gjvVnpYVFH/lsgSLREHRV3X6yWEFSmnOm?=
 =?us-ascii?Q?/GLypEt7vrsDujC//dPBCHNYPB67Vrff/CKkiG3QF5axZ6YhhwjKkWbwifmM?=
 =?us-ascii?Q?cTB8Ulgg+iPuEVHxmQR4sfn4XIC+y0UewVBV9B5ggUwj8U1Fq6ksetPCYm8L?=
 =?us-ascii?Q?TeCres935VcJG8NqEau4r0Je1+Th4i5KGruZYGCiCfw7jzeU+RN8PR7v0h61?=
 =?us-ascii?Q?6+7sOHwcDE/mKXNwUgfm0huj/yUYZQxl4h6Y/igGA+7w9KiLmzg1lJAm/Mzj?=
 =?us-ascii?Q?ZkSTJFTPrH4eCceGX70WkuMhjaW80ttzRJh8ixXviPQgw1d0DLPzQXilwOeo?=
 =?us-ascii?Q?B9A90ihuqmBbFrd3sSM3NuZfETgARQ+wvCNAu2JopXwO07AZRK6Di6tX7c0i?=
 =?us-ascii?Q?0Mc81DKeTixAmtwImAUfYJR8MzSrD2EWBaWyIv+b662KsO6fZE8QfG7z4SZi?=
 =?us-ascii?Q?YUiWcI7imb1RHToGoqolX3otG/a87hx0WysM3ijNAYGlTO0JVp9WOuCtEajb?=
 =?us-ascii?Q?xfzVSdMf1yUKqU3dEPLfN4q4piTeUM3TKqyjfBYH90T4J4OFhI8kFPhZQ7V1?=
 =?us-ascii?Q?DJSQ2TIGL9zlhYPIKbDo62a8goIiodjlFGwbgk/rT3XxIpHFtZJolnp0DJZl?=
 =?us-ascii?Q?73LwwVFvWAXgsZQ1nLh8MoVfyaHdvSesr99LW16GQpB667mopvfuxwWD2IjI?=
 =?us-ascii?Q?m1xz6HZSgLFdHgPhZue8/nklVBd6/wd2jfD3oxor5HAMTbDshmRS2X8bYi3W?=
 =?us-ascii?Q?f7KaEJI+53CVTNlTVyTSGVm2nATW8KNb/N7QuSDG3rD+VWIEAGvVxhvX2mjb?=
 =?us-ascii?Q?f5WS/vtmoUeMvYgh44Bphccw7C9fi2GBAw2yWsgeAMOa7hAH3CwErSP5cwTY?=
 =?us-ascii?Q?leffvokhf+3k5VWA512bWV+L5PaXuFrP4P6Jte+EY0CE5VGRITEnMqY7YapI?=
 =?us-ascii?Q?OOHh98K1YYl8qK9gSqirJTQ4qbuZgFCFeG6l2ZRtJC8Hv0Wu4yFRQz12xTH9?=
 =?us-ascii?Q?P/e94an7iLYxG30PEnNr7FVPtUMxyqBbaE9zMXHf7sw6JP8btCSB7HAP6Q6U?=
 =?us-ascii?Q?TyKOQVskNQEakyQhY36I/9jQVngYf0sie2wywrRfwMTtYsaRxj3JcBbfWpoj?=
 =?us-ascii?Q?vPdMjhuDO/xM88xdN4fwPcASbqGAkoXYLE/OhguvXzcaL4ul0rKMOUd8KE86?=
 =?us-ascii?Q?8yhTRl4/S8gdItw/YLI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b74a330-700b-4b67-c44e-08db88006be4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 02:32:39.4015 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E3vKok/J+lfJzCSYGXRkDiKIzHm3cGLtYN6/kCc5CWpYPAi/7xQoIU1ItU8BQAgPoikmhgukoodRsp6Cc6mbIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9792
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
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Oliver Brown <oliver.brown@nxp.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,=20

Thanks for your comments,

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
> > new file mode 100644
> > index 000000000000..b983ee765f54
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.y
> > +++ aml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fschemas%2Fdisplay%2Fbridge%2Fcdns%2Cmhdp8501.yaml%
> 23&dat
> >
> +a=3D05%7C01%7CSandor.yu%40nxp.com%7C7c33f38de4804df82ed108db87d
> eeeef%7C
> >
> +686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63825316378283684
> 1%7CUnkno
> >
> +wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1
> haWwi
> >
> +LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DM0fImRvAyayYwQLSQsJVo
> OQF59Y47KI5
> > +XNnVzmuTHOc%3D&reserved=3D0
> > +$schema:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=3D05%7C01%7CSandor.
> yu%40n
> >
> +xp.com%7C7c33f38de4804df82ed108db87deeeef%7C686ea1d3bc2b4c6fa9
> 2cd99c5
> >
> +c301635%7C0%7C0%7C638253163782836841%7CUnknown%7CTWFpbGZs
> b3d8eyJWIjoi
> >
> +MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3
> 000%7C%
> >
> +7C%7C&sdata=3DiCjpKSNsRnQYhRlXz7%2FR46uot%2B3aYbFz1ecfy63dYaw%3
> D&reserv
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
>=20
> Drop this.
OK, " - cdns,mhdp8501" will be dropped.
B.R
Sandor
>=20
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
> > --
> > 2.34.1
> >
