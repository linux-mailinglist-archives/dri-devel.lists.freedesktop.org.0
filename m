Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B58B758B62
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 04:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EFA10E3F6;
	Wed, 19 Jul 2023 02:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C013410E0E9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 02:32:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e8wmIKQ0wGaZVehqz7m21EsyDCjWSX7HI/Z0YFGM6i8bDCVHa2u4+x/PYp7LrNyL4tuOZpYiif9kEs689gQt5iLKInXIIqrJjLjuQxEbk4qQJd/sy6oTWbZWxVBtMcvL+pK//acu6rrWllc1paMhYSEeojHfYIfowklapB+vxuCYSM1z5X4foXeQEq2IC7VJzh7Wd640Q34Ti21LcQ63eYCAzBCVl9spAxQ7FAnpyYWk/IQCVY89fV2/ylSPUcKuMNx3PeNh4dioJeCbxO/JP6swBXXTKTp9aaK98SbkDpw3JkQls30MYskw0ytf0bBgeUnnGx175YQCiVtyDG58YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypY41TDW50csgsRuc3se4H10wf2yfTzQo1RlTYZIpJ0=;
 b=VbToUqq5ri00HXPehkRPFRTRQA/eYlWFqKd3MFcaHOgdtocFYEN85JcZRejrqjOeKxcmG9FQQmpTUhJ19DztbR9FlegtXG5CdOCuaGMQrXD2iBnGDi4/4u/6AoBSQSq2Wx20bN9xL/1dkwa7PZHeEcYbsNZKTra3fIvXeQNPawlEmrYP9hhCCrWVlYs9B0e5ULEZRQ+vpCSsMJf11H9jlcUzRbuAW5FfxcIMMz7YnZb+Hy74gLpGcTbOlzBgt4YOmdYcLqqBPfcSkXyyPAFeSV5F6oVRGkU9MVaJ5YziEkO93hdoHgCIDGb4Qh5nc8HjfpdlH7guGrs1HFEEb8+ulQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypY41TDW50csgsRuc3se4H10wf2yfTzQo1RlTYZIpJ0=;
 b=nKnU7POqtbBcZaXX+/LjoYek9WXPcBk5Vuh7Dic4FLF8Vk2pvnTvPJOpqhHpu+eWgiXL5mdeot7wiVxMcCeRZxk+8xW20nLC30DAmI8cmVPlVOgXqbCWrjb0ik9FqPfiY6JSsE+jKHYuxwznA36Pd9FqP2kHZAu6R/axqdFeTR0=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB9PR04MB9792.eurprd04.prod.outlook.com (2603:10a6:10:4c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 02:32:41 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3505:c499:96d4:1429%4]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 02:32:41 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [EXT] Re: [PATCH v7 3/7] dt-bindings: display: bridge: Add
 Cadence MHDP850
Thread-Topic: [EXT] Re: [PATCH v7 3/7] dt-bindings: display: bridge: Add
 Cadence MHDP850
Thread-Index: AQHZuIUePa/zOSPAXUe6/zQl/U27da+9sp2AgAERxRCAAVnyAIAAOPmw
Date: Wed, 19 Jul 2023 02:32:41 +0000
Message-ID: <PAXPR04MB9448A51496A99C6AE17BBD4EF439A@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1689580812.git.Sandor.yu@nxp.com>
 <3646ea4d279838c78e00af1d746e3de34351b083.1689580812.git.Sandor.yu@nxp.com>
 <5693162.DvuYhMxLoT@steina-w>
 <PAXPR04MB94483425E2BC17597B7E555AF438A@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <20230718223208.GA2112396-robh@kernel.org>
In-Reply-To: <20230718223208.GA2112396-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|DB9PR04MB9792:EE_
x-ms-office365-filtering-correlation-id: fed99ed6-f9fd-4acc-f1aa-08db88006d47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wt/nsq585kZo2OPjOaKCfUoLKRMrq6TNpTMlL5Kw+HBc9ZFYE/z9cg4txLUp3zx5RSl97HcuVU4VCWzuXjihHjisk7TyDYCJBBRoMgr8cEkT4LXv/CbiM8eK2EnvyBXi7F0jXJ/fcm+JheegK+FFGaTk0IfYzJboWqyruRoI/TmSNKz7IORG8xwfYVhvUClgjic4awvqTgaapXybyjAGRKGFnwHt5QAAJ5a3s3rvbMMUKBm4chG+U81s+NzixMQ+GjqKhYUBsb8GrKu5qCo+0aQrtyoLxQTH0yeWCFpFoALD1W6dXdCMBTwRzntpHPMhUBZJcIhx/6G8xDk4LLkDrVZv3Wgm841NXPF8ZRc+borpIBnayyWTlYUsLrDPMBhfj9IaWvz11Wb3GrwB70gbOtZdQpwV2lShJOU5fEx7CYURA28wD5JwErSi+0ylU2goDcYa74C0TZdShBbJpOVihx3qOdrVbtbhuk0tv3dZ4s6ggJGcAbgt8ORkGd00Bbn3SzgMs8utQExMfDUp+JNVhyeyRk3epGsDpo0zgsXQ+z84RxXxArSV2p3tHB1q8VXe/Gg5jhKD11K9DqtEJaNdlGBiRMcWadj9Kq02Yw8DctK9h1ZJyQclZJzBFlcunWlX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199021)(86362001)(2906002)(7416002)(38070700005)(33656002)(44832011)(55016003)(83380400001)(186003)(26005)(66574015)(9686003)(6506007)(7696005)(122000001)(54906003)(316002)(66446008)(64756008)(66476007)(8936002)(66946007)(6916009)(66556008)(38100700002)(4326008)(5660300002)(478600001)(41300700001)(71200400001)(76116006)(52536014)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?p4mvm7wGChyKb5X84ozOq0X7IvNX/n3udIBDnzt+H6DwpOT934FuOtZz/U?=
 =?iso-8859-1?Q?1w8a7ayj4UcqsVZRm1hGrSZWwx0YRZP+JbHWpXL9tiNC4b1Lr6oAiMb8t9?=
 =?iso-8859-1?Q?yu4IIiiCYib8vb2ulWCbfmXLh+uhzvaJqPWvd0LogbuG4pj9gm+Vdiibyt?=
 =?iso-8859-1?Q?iIDC1OTPFiewzZK+dA7jo05KlS1OTsSpNs5zQhEqka6SPTBB11t8UYGIcI?=
 =?iso-8859-1?Q?6R5AWGVB/4WsXlx+i/tiYqN24AIirVRcqBsm4HishreAaQL/+Y4nj1ivhl?=
 =?iso-8859-1?Q?sEFynhFn1PjVLmwYwEKuMXbdMP68cob96AHppoGMVCdidjtySK3ILXujxp?=
 =?iso-8859-1?Q?kvezBr379eKXdxc9vz0imXgmzCszeXAmjgv6A+xzTN1GlXpEulR6GPigju?=
 =?iso-8859-1?Q?C73BBPfaogPeAl1dFEWEx8DoN6WuVpYBSiqGtS9ylfZ14Z0DheG/6TJv8N?=
 =?iso-8859-1?Q?ZEwk+LvUJl7fbzvI5vyvK82RXBOQCpguUn6di4XtLsbvgblNsrJCQ7Mlo/?=
 =?iso-8859-1?Q?QnaTGLuYAfHWDAHZ4/3dzMrM2D1zVV8/Sf3S2txcDyVB9ZqcwgTCeD3ZKB?=
 =?iso-8859-1?Q?3eN+ES0YwReN6T7pdRQc23Luy/6XyCDNHXzYgzL0ann0PyTEQJxHnA+z4w?=
 =?iso-8859-1?Q?18nW5XiLZfbuM+0d4SBudb3sxmbp5QSEscGDt8VYwLd3sjJyfHG565hKOP?=
 =?iso-8859-1?Q?ARaPi0MXcwGThARhZJP6UPo1D6XXR8b2cKuYnN/ugwd08r4hzfnMjMVXwJ?=
 =?iso-8859-1?Q?HuhEHTWDHIASPUZrlC9kDRXbo/Xzc327giELyvSJbKldlZX6mX+3kw+yUc?=
 =?iso-8859-1?Q?jB+Od23xJyyNNYsBOGT1f6i18n1dxkxZtwLWeXNEAQZ2/vtxAf9/f5BRn9?=
 =?iso-8859-1?Q?rD2eazY38JumbuhO19CZc7QWhLXo/erpdKEQsrFl2+1yUU2mLewpKEH9Aq?=
 =?iso-8859-1?Q?Kknijgdl6PD00yXAlJM/HtWzSYpoV1QMy1oek2JVKdqVbTd2GBNDDiN+F4?=
 =?iso-8859-1?Q?xGMb+B+YoruIv9EFeu+H9+9lHo+V/f7SwsRKy7WdzlqiLA6GWzkwnMXMFE?=
 =?iso-8859-1?Q?VBiIe/fwvvIomFxQjiaJnnAvTLUbH1bIf73gZbPqJYW+KyFk+gxZZmQiqZ?=
 =?iso-8859-1?Q?DeJZMwB2k8rAWnBG3TH8y1CcKj6F7E1dM6vO9JHK19QPgsU36/EclK+21W?=
 =?iso-8859-1?Q?awwabmOAkG5jb37d0GUmYetvxsvO4vkJopTaekOaZf1ZBWVs5kl6QcDW2B?=
 =?iso-8859-1?Q?2r5wemdwSxWzEtkYeqt33K0BVd5b6UW/4dCTTSUqk2hOGdR75Nqq1jjBMt?=
 =?iso-8859-1?Q?BcdjPxfTlB6pQ7D4G/cce7xWsB1irurmyDVJx7wfLpfG9lsnzm/aL7B/mb?=
 =?iso-8859-1?Q?qB2H+g1t28Bmya2m5Bk3ckZNJ8GH6hW9/Q0npO4MZ9QnxFe6xIe7SXUCXL?=
 =?iso-8859-1?Q?juz2SUkJjP7IiBHo6Cezw3XM/IzLHLsQW/HTE9ZknaSdREzrjy8E+UjD2Q?=
 =?iso-8859-1?Q?khns32z82LcNmXakOv6BDJOrtC+cn704Tgwoo+JiM5mdf8m7jw2l0gMaSy?=
 =?iso-8859-1?Q?4RBSqUUorg/nNKqHsgO6UwPsvezWAMlPtYELZRWgcdGZaSzQA902REbgdI?=
 =?iso-8859-1?Q?sOWwKW+2B45KM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fed99ed6-f9fd-4acc-f1aa-08db88006d47
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 02:32:41.7515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QkgfKA5CM1Ce6736farYPLCWokudPgobkmypjG0CwSavtCQfhJK7fEDGswbmLdq1Exl424pS5u04BvUNDQOu0g==
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
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "ker nel@pengutronix.de" <kernel@pengutronix.de>,
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

Hi Rob,

Thanks for your comment.

> > Hi Alexander,
> >
> > Thanks for your comments,
> >
> > >
> > > Am Montag, 17. Juli 2023, 10:03:49 CEST schrieb Sandor Yu:
> > > > ********************
> > > > Achtung externe E-Mail: =D6ffnen Sie Anh=E4nge und Links nur, wenn =
Sie
> > > > wissen, dass diese aus einer sicheren Quelle stammen und sicher sin=
d.
> > > > Leiten Sie die E-Mail im Zweifelsfall zur Pr=FCfung an den IT-Helpd=
esk
> weiter.
> > > > Attention external email: Open attachments and links only if you
> > > > know that they are from a secure source and are safe. In doubt
> > > > forward the email to the IT-Helpdesk to check it.
> > > > ********************
> > > >
> > > > Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge..
> > > >
> > > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > > ---
> > > >  .../display/bridge/cdns,mhdp8501.yaml         | 105
> > > ++++++++++++++++++
> > > >  1 file changed, 105 insertions(+)  create mode 100644
> > > >
> Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yam
> > > > l
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.y
> > > > aml
> > > > b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.y
> > > > aml new file mode 100644 index 000000000000..b983ee765f54
> > > > --- /dev/null
> > > > +++
> > > b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.y
> > > > +++ aml
> > > > @@ -0,0 +1,105 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > > > +---
> > > > +$id:
> > > > +http://devi/
> > > >
> > >
> +cetree.org%2Fschemas%2Fdisplay%2Fbridge%2Fcdns%2Cmhdp8501.yaml%
> > > 23&dat
> > > >
> > >
> +a=3D05%7C01%7CSandor.yu%40nxp.com%7C603a90f3f3c34d32a1e708db86a
> > > 8f868%7C
> > > >
> > >
> +686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63825183250590544
> > > 2%7CUnkno
> > > >
> > >
> +wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1
> > > haWwi
> > > >
> > >
> +LCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DJnbufeZplo%2B6JGW4HaK
> > > %2BLyC0MESK
> > > > +GsV%2FtjfeXCXqK4U%3D&reserved=3D0
> > > > +$schema:
> > > > +http://devi/
> > > >
> > >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&data=3D05%7C01%7CSandor.
> > > yu%40n
> > > >
> > >
> +xp.com%7C603a90f3f3c34d32a1e708db86a8f868%7C686ea1d3bc2b4c6fa9
> > > 2cd99c5
> > > >
> > >
> +c301635%7C0%7C0%7C638251832505905442%7CUnknown%7CTWFpbGZs
> > > b3d8eyJWIjoi
> > > >
> > >
> +MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3
> > > 000%7C%
> > > >
> > >
> +7C%7C&sdata=3DrdOyjVz4gGnToVC40Rcfp%2Fk925yC%2F6xNwGbBAnOtcDQ
> > > %3D&reserv
> > > > +ed=3D0
> > > > +
> > > > +title: Cadence MHDP8501 DP/HDMI bridge
> > > > +
> > > > +maintainers:
> > > > +  - Sandor Yu <Sandor.yu@nxp.com>
> > > > +
> > > > +description:
> > > > +  Cadence MHDP8501 DisplayPort/HDMI interface.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - cdns,mhdp8501
> > > > +      - fsl,imx8mq-mhdp8501
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +    description: MHDP8501 DP/HDMI APB clock.
> > > > +
> > > > +  phys:
> > > > +    maxItems: 1
> > > > +    description:
> > > > +      phandle to the DisplayPort or HDMI PHY
> > > > +
> > > > +  interrupts:
> > > > +    items:
> > > > +      - description: Hotplug cable plugin.
> > > > +      - description: Hotplug cable plugout.
> > > > +
> > > > +  interrupt-names:
> > > > +    items:
> > > > +      - const: plug_in
> > > > +      - const: plug_out
> > > > +
> > > > +  ports:
> > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > +
> > > > +    properties:
> > > > +      port@0:
> > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > +        description:
> > > > +          Input port from display controller output.
> > > > +      port@1:
> > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > +        description:
> > > > +          Output port to DisplayPort or HDMI connector.
> > > > +
> > > > +    required:
> > > > +      - port@0
> > > > +      - port@1
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - clocks
> > > > +  - interrupts
> > > > +  - interrupt-names
> > > > +  - phys
> > > > +  - ports
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/imx8mq-clock.h>
> > > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > +
> > > > +    mhdp_dp: dp-bridge@32c00000 {
> > >
> > > I'm not sure, but I would name this node just 'bridge', because it
> > > can be either DP or HDMI depending on the connector. But DT folks
> > > will know better than me.
> > This name should update too after DP and HDMI driver combined.
>=20
> Has nothing to do with a driver.
>=20
> > I will change to "mhdp: mhdp-bridge@32c00000" in the next version.
>=20
> What is 'mhdp'? Doesn't sound generic. Use just 'bridge' or 'display-brid=
ge'.
> We don't have a standard name defined in the DT spec (there's 'hdmi', but
> nothing that's protocol independent).

OK, thanks, will change to "mhdp: display-bridge@32c00000".
B.R
Sandor
>=20
> Rob
