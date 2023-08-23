Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B52C7852FD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 10:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E84A10E3F8;
	Wed, 23 Aug 2023 08:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1B910E3F8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 08:47:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yopj7l8pBZivO4szsrk3M84DVFc9xOm1nK2h11qEA3oYmPEwXtviUvB7HMDP+rz5A1x/zOXQ9vO7c8lcXof2rm6JnxEmos39iHWMIPHF9W3Juk9A5Js3bQBXNUpFGVTjSgcrh29NU5nSolvfy+I2gbwyaE0FjtOiytzBMRMoMV48LprNgsfPWR1MlDDs0zTr1x+jPqh/whM54U+0LJYAiUWOOHvuKyzj704LbIyn06HRCZBNhi01262Vs/rFRWgV0HwvMkUEAM4qL6szU8T2U/ADLbyPaDitwK5IDxANTuMQMmeB333A1FP9IjLsiSzvgE4O8zYlIoRS9qypUj3/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02KwBIbEfdFQeBLYboi26ZieAZ+DLwIxjnBv/ygOuNs=;
 b=BjHFgOu0LRwJQWMIncFVd+SNWkwuP69XrNnc1TgwUkjScIcNismrm9EcNPjZuK2e2ZLWvmPN6/sIPq207BUA7xdLjdHKOgMRMlzKWu2iPB8avEmSvrWNyeEXWvA5RchN4OgWY/aext03vH/luIJ1piLEBCQ0rRfLaFjxzIXMy8PM0Eo20AY2DCg4Bdq9441LcYVmE3oYmwniSpCjZ54mO+a2ytQ23/46gc5jFyA2HCBovg6NLLlEOV5IitLvZapwf2nRZXGsxvpxpP2I+KOGROdVrcSlhlz8j5PKQYsPB6g66TCJ0Cga/cFTGWjs5YEGrpnvALSdtl6srkvwOpAdag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02KwBIbEfdFQeBLYboi26ZieAZ+DLwIxjnBv/ygOuNs=;
 b=J5eahRsZoKRRd7HzcLrPp+XfThk4nOCPciSUbDhGDZ8mgfcQK1JyH5UPIT51YXqKUIeQk/iruQcLMU1+k0buF6UGuSMOQt6hsyzBCInl88y0Wop7P8j3rX2VSybwIVUGlbhDuZ9w8WUwuOL6AwVEQm6PNwdRc+fBjZQiJDwcPfg=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9638.eurprd04.prod.outlook.com (2603:10a6:102:273::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 08:47:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Wed, 23 Aug 2023
 08:47:51 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v14 RESEND 1/6] dt-bindings: display: imx: Add i.MX8qxp/qm
 DPU binding
Thread-Topic: [PATCH v14 RESEND 1/6] dt-bindings: display: imx: Add
 i.MX8qxp/qm DPU binding
Thread-Index: AQHZ1NZxpKDHNQbjgEiILz/ou3qvwa/2MuwAgADviPCAAFvOAIAABz3w
Date: Wed, 23 Aug 2023 08:47:51 +0000
Message-ID: <AM7PR04MB7046E8DD816FC99193B07E07981CA@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230822085949.816844-1-victor.liu@nxp.com>
 <20230822085949.816844-2-victor.liu@nxp.com>
 <scbtbu4cdjlsmbr6ugkpqslvfywidvbuqyekxuttfe4rmbp2st@lev2zfqe4h62>
 <AM7PR04MB70469E94D5FCFC46F51A72F3981CA@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <64bpiz5nt3xgboxya26gcdh6d7nyyflm2m56orgjwwwibh52n7@yk4ogdcierho>
In-Reply-To: <64bpiz5nt3xgboxya26gcdh6d7nyyflm2m56orgjwwwibh52n7@yk4ogdcierho>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|PA4PR04MB9638:EE_
x-ms-office365-filtering-correlation-id: a65c4daf-0afe-4f32-160d-08dba3b5a2cd
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /Ms3CtOiHF0b5HMMOXatwmE7ocSMcNQR9FoL2DiMWb7AKUuwpYNYG9cSIn7/xcLO5f4O1KpfU6Vda09gHvDFLkwLGFT4viTwAIlcemIG6F9zulgb4Ed7RDlJ/m4tajmn38EyrIA/Qms8+wiVORYXai7Xx2dOOO+WmdshtrqiWixl0aK5szeXde/qYz1z50lUGGK0TP8Odjkb84YgNlEcruO0sKTqbVRLDO4IQNyOZSFdHJ6wcBz3Z3ezGkGu8l/DNdovAhv0TAlC01shW1He5NakkdczsefOTgNLdgnEboj5WNleQ5nJJGF5xb/VQE+h4cgxThYnrNIHZIYCfhhHiL3R40xgYTgbg8olRyUEvsklCXHxyEd5sbx1W4eZCUT3mbVcGHcKrdanswiP71L0ajODRl20KEpcAaFMgGTVQ6u678HtbPfvXR9lccUuqRITB1sPhFY80U55IWhZ809H9Cs81N3YcINaDzBkNQuhI+KBq0XzVcWKvXAYVxwx/I2bNRtegf+nK+96BUQfMT2+vOcywhknGz41EaDIZUbY0EhTzyVn80GZuyC48QRX+OokvCu0MMJ3EFZ3/4HdcgR/4UBkL8xQZiZ63YneOvUyC+xGtazJnpQ0cY5gQoOCS7KuVGiwDYtjXxXqvOu6RMcFzA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(376002)(396003)(346002)(1800799009)(186009)(451199024)(83380400001)(30864003)(2906002)(38070700005)(38100700002)(122000001)(33656002)(86362001)(55016003)(41300700001)(9686003)(66446008)(66946007)(66556008)(66476007)(54906003)(64756008)(76116006)(7696005)(6506007)(6916009)(316002)(53546011)(52536014)(4326008)(8936002)(8676002)(966005)(478600001)(71200400001)(26005)(7416002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?DZ25dnzwody9jQe3dyBfxo3MFjzbKnxE8Ihcj4mEhwToye7lzo2skcn6Fs?=
 =?iso-8859-1?Q?zl4uSHrOIIW7xh2uDA4eYaHS2eCYN2iJQbP0piYFZlDDBYTtoif0QwsCHm?=
 =?iso-8859-1?Q?xc1PB+Sz8avjEazkLipNnGtYn4TJEYVPBFj+hUb4l+K0SKJscl5bA6esi8?=
 =?iso-8859-1?Q?McQQrW4OnSkAa8jmd4j5l5XAMkDz5nI69IOtkaH8/+Nf5SvX0jz4uta0Xz?=
 =?iso-8859-1?Q?c/4V8VRAHRqs8LGD5yj50H1p5XIXInNCR3O6obV/tSDnwB8K+0jm8YMFvV?=
 =?iso-8859-1?Q?Pc8gU8AfcM1fNG/IkVyeaudPDMpdMt8cQoTwalELIhfqXAoWbSAQG3GAsX?=
 =?iso-8859-1?Q?NooJtlFP587TTzbJjlusSpfrusOjEQPkPxt7Qjj1/QwMHYy6m2hfCz9B7R?=
 =?iso-8859-1?Q?WLLNNWSPj3k1Ok1wYEZivWCIqyzsRdmy3rSdwJ8KsZC1jMq588rqqH9npy?=
 =?iso-8859-1?Q?Zh9Nc9N4eVNABypK+Vgckx/+eF0MFJlmsy+SB+znwlfKg23M5m/V8PD//y?=
 =?iso-8859-1?Q?x2gU+IGY85KfLN1ivBebRKlFDsTaq9V5sttnwtVCZDoR8Hkd4P5PG3eQ4X?=
 =?iso-8859-1?Q?5hxECBfOBy3V+4vN7wmFkAx5i7FBSOMXbeB/PN2kZpPy1JhX17T/h9/xxx?=
 =?iso-8859-1?Q?/+pfjwRCZ64RdtHqISlZwEphkGXLAQzAYQxQEvMrbVJz++fu1hlaejAOmu?=
 =?iso-8859-1?Q?BoGgr//EBn6IaCGIOZ+U8aCKfJeX4qDt5ukLQDoEfjlNlcV2oofbXxgCow?=
 =?iso-8859-1?Q?I6Z+vUyq+KzteIhPIqL+3Y2cctvzempAwDZx9Bk+UXfhPYWAIuAAP39d8j?=
 =?iso-8859-1?Q?nvkKm7/VAOPkUyV7NdZLh2l6HuaFxpVsFCQ27b0mj9EghElCXh/yxlqs6R?=
 =?iso-8859-1?Q?taf8y+05kpAZFVrEll6FMXCtVBSfnmb6+c5Jpm2RaL0lBxSDyc07BiQBQ/?=
 =?iso-8859-1?Q?tSdo54/TmwzJNNyjbhtc8xkaLDTDmvS39X7EhqH3sirfKZktsy1JRd6dMt?=
 =?iso-8859-1?Q?ryDtla+XUV2awPzzJy3kGFL6/Nvm+TS7d8qLD3Owg3p5wZrEGvO+KuCrYy?=
 =?iso-8859-1?Q?UA6dGiVbdK32OadKF30h+0arujKPaHro0JCj5znJgEiwjqlcle763tTzNF?=
 =?iso-8859-1?Q?M2ReCxx0j6n+7nayNDGqUubYh/rmq9F3RTG8IhO2glKRqtFH4Y2+uy8IRV?=
 =?iso-8859-1?Q?xzuSGMRcPSl1DepIg+lQBxlNEBGRx1BmjjUXmtqgFAsNMTER0c/cUqIOwi?=
 =?iso-8859-1?Q?jLOQ/RH4zR96pJtbNo7GnQ+tVHz2eVmtJMUo/d4JXqvy4Qq1adsLRh525J?=
 =?iso-8859-1?Q?vOri7DjCbeqdJ6/EIYELleUi5+YQ/MBbusBYg6tTqb/vRMeOjoD/oQXfz5?=
 =?iso-8859-1?Q?+Ifl/M+5cAkZgvPbDGZxXlLUq6pzkrkAOltD8yAogT4+yWs1eBJAiQyHpX?=
 =?iso-8859-1?Q?yuFCz0aCy7mI9BQC2lmDqiRaR40SxDiv58GHyOtpBNFR0gOW3PGr3+CCFy?=
 =?iso-8859-1?Q?+Xb+9a9P88Zi/XL+mPn3GGK0Uq78I+EVSRxCIwwD+Gfly220P3xxDk63TL?=
 =?iso-8859-1?Q?TiEL2M8DeFXM7/FfDgL8JCGWNekjg5x6S+Jq5tetzjFoOijvPpCfdIQtuq?=
 =?iso-8859-1?Q?3uqDJnrm3cXx8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a65c4daf-0afe-4f32-160d-08dba3b5a2cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2023 08:47:51.8290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PF7M6Vc3YJsUtHGJiIejGKbUTBi8AsqdQShdVAksuwKyUe2VlMZlk/o8iKhxXvGQWWfWaQ2YRIs3NqJ+j8J+/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9638
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "Laurentiu Palcu \(OSS\)" <laurentiu.palcu@oss.nxp.com>,
 =?iso-8859-1?Q?Guido_G=FCnther?= <guido.gunther@puri.sm>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wednesday, August 23, 2023 3:32 PM Maxime Ripard <mripard@kernel.org> wr=
ote:
>=20
> On Wed, Aug 23, 2023 at 02:45:53AM +0000, Ying Liu wrote:
> > On  Tuesday, August 22, 2023 7:47 PM Maxime Ripard
> <mripard@kernel.org> wrote:
> > >
> > > Hi,
> >
> > Hi Maxime,
> >
> > Thanks for your review.
> >
> > >
> > > On Tue, Aug 22, 2023 at 04:59:44PM +0800, Liu Ying wrote:
> > > > This patch adds bindings for i.MX8qxp/qm Display Processing Unit.
> > > >
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > ---
> > > > v7->v14:
> > > > * No change.
> > > >
> > > > v6->v7:
> > > > * Add Rob's R-b tag back.
> > > >
> > > > v5->v6:
> > > > * Use graph schema. So, drop Rob's R-b tag as review is needed.
> > > >
> > > > v4->v5:
> > > > * No change.
> > > >
> > > > v3->v4:
> > > > * Improve compatible property by using enum instead of oneOf+const.
> > > (Rob)
> > > > * Add Rob's R-b tag.
> > > >
> > > > v2->v3:
> > > > * No change.
> > > >
> > > > v1->v2:
> > > > * Fix yamllint warnings.
> > > > * Require bypass0 and bypass1 clocks for both i.MX8qxp and i.MX8qm,
> as
> > > the
> > > >   display controller subsystem spec does say that they exist.
> > > > * Use new dt binding way to add clocks in the example.
> > > > * Trivial tweaks for the example.
> > > >
> > > >  .../bindings/display/imx/fsl,imx8qxp-dpu.yaml | 387
> ++++++++++++++++++
> > > >  1 file changed, 387 insertions(+)
> > > >  create mode 100644
> > > Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
> > > >
> > > > diff --git
> a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-
> > > dpu.yaml
> b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-
> > > dpu.yaml
> > > > new file mode 100644
> > > > index 000000000000..6b05c586cd9d
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-
> > > dpu.yaml
> > > > @@ -0,0 +1,387 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-
> dpu.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Freescale i.MX8qm/qxp Display Processing Unit
> > > > +
> > > > +maintainers:
> > > > +  - Liu Ying <victor.liu@nxp.com>
> > > > +
> > > > +description: |
> > > > +  The Freescale i.MX8qm/qxp Display Processing Unit(DPU) is
> comprised of
> > > two
> > > > +  main components that include a blit engine for 2D graphics
> accelerations
> > > > +  and a display controller for display output processing, as well =
as a
> > > command
> > > > +  sequencer.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - fsl,imx8qxp-dpu
> > > > +      - fsl,imx8qm-dpu
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    items:
> > > > +      - description: |
> > > > +          store9 shadow load interrupt(blit engine)
> > > > +      - description: |
> > > > +          store9 frame complete interrupt(blit engine)
> > > > +      - description: |
> > > > +          store9 sequence complete interrupt(blit engine)
> > > > +      - description: |
> > > > +          extdst0 shadow load interrupt
> > > > +          (display controller, content stream 0)
> > > > +      - description: |
> > > > +          extdst0 frame complete interrupt
> > > > +          (display controller, content stream 0)
> > > > +      - description: |
> > > > +          extdst0 sequence complete interrupt
> > > > +          (display controller, content stream 0)
> > > > +      - description: |
> > > > +          extdst4 shadow load interrupt
> > > > +          (display controller, safety stream 0)
> > > > +      - description: |
> > > > +          extdst4 frame complete interrupt
> > > > +          (display controller, safety stream 0)
> > > > +      - description: |
> > > > +          extdst4 sequence complete interrupt
> > > > +          (display controller, safety stream 0)
> > > > +      - description: |
> > > > +          extdst1 shadow load interrupt
> > > > +          (display controller, content stream 1)
> > > > +      - description: |
> > > > +          extdst1 frame complete interrupt
> > > > +          (display controller, content stream 1)
> > > > +      - description: |
> > > > +          extdst1 sequence complete interrupt
> > > > +          (display controller, content stream 1)
> > > > +      - description: |
> > > > +          extdst5 shadow load interrupt
> > > > +          (display controller, safety stream 1)
> > > > +      - description: |
> > > > +          extdst5 frame complete interrupt
> > > > +          (display controller, safety stream 1)
> > > > +      - description: |
> > > > +          extdst5 sequence complete interrupt
> > > > +          (display controller, safety stream 1)
> > > > +      - description: |
> > > > +          disengcfg0 shadow load interrupt
> > > > +          (display controller, display stream 0)
> > > > +      - description: |
> > > > +          disengcfg0 frame complete interrupt
> > > > +          (display controller, display stream 0)
> > > > +      - description: |
> > > > +          disengcfg0 sequence complete interrupt
> > > > +          (display controller, display stream 0)
> > > > +      - description: |
> > > > +          framegen0 programmable interrupt0
> > > > +          (display controller, display stream 0)
> > > > +      - description: |
> > > > +          framegen0 programmable interrupt1
> > > > +          (display controller, display stream 0)
> > > > +      - description: |
> > > > +          framegen0 programmable interrupt2
> > > > +          (display controller, display stream 0)
> > > > +      - description: |
> > > > +          framegen0 programmable interrupt3
> > > > +          (display controller, display stream 0)
> > > > +      - description: |
> > > > +          signature0 shadow load interrupt
> > > > +          (display controller, display stream 0)
> > > > +      - description: |
> > > > +          signature0 measurement valid interrupt
> > > > +          (display controller, display stream 0)
> > > > +      - description: |
> > > > +          signature0 error condition interrupt
> > > > +          (display controller, display stream 0)
> > > > +      - description: |
> > > > +          disengcfg1 shadow load interrupt
> > > > +          (display controller, display stream 1)
> > > > +      - description: |
> > > > +          disengcfg1 frame complete interrupt
> > > > +          (display controller, display stream 1)
> > > > +      - description: |
> > > > +          disengcfg1 sequence complete interrupt
> > > > +          (display controller, display stream 1)
> > > > +      - description: |
> > > > +          framegen1 programmable interrupt0
> > > > +          (display controller, display stream 1)
> > > > +      - description: |
> > > > +          framegen1 programmable interrupt1
> > > > +          (display controller, display stream 1)
> > > > +      - description: |
> > > > +          framegen1 programmable interrupt2
> > > > +          (display controller, display stream 1)
> > > > +      - description: |
> > > > +          framegen1 programmable interrupt3
> > > > +          (display controller, display stream 1)
> > > > +      - description: |
> > > > +          signature1 shadow load interrupt
> > > > +          (display controller, display stream 1)
> > > > +      - description: |
> > > > +          signature1 measurement valid interrupt
> > > > +          (display controller, display stream 1)
> > > > +      - description: |
> > > > +          signature1 error condition interrupt
> > > > +          (display controller, display stream 1)
> > > > +      - description: |
> > > > +          command sequencer error condition interrupt(command
> sequencer)
> > > > +      - description: |
> > > > +          common control software interrupt0(common control)
> > > > +      - description: |
> > > > +          common control software interrupt1(common control)
> > > > +      - description: |
> > > > +          common control software interrupt2(common control)
> > > > +      - description: |
> > > > +          common control software interrupt3(common control)
> > > > +      - description: |
> > > > +          framegen0 synchronization status activated interrupt
> > > > +          (display controller, safety stream 0)
> > > > +      - description: |
> > > > +          framegen0 synchronization status deactivated interrupt
> > > > +          (display controller, safety stream 0)
> > > > +      - description: |
> > > > +          framegen0 synchronization status activated interrupt
> > > > +          (display controller, content stream 0)
> > > > +      - description: |
> > > > +          framegen0 synchronization status deactivated interrupt
> > > > +          (display controller, content stream 0)
> > > > +      - description: |
> > > > +          framegen1 synchronization status activated interrupt
> > > > +          (display controller, safety stream 1)
> > > > +      - description: |
> > > > +          framegen1 synchronization status deactivated interrupt
> > > > +          (display controller, safety stream 1)
> > > > +      - description: |
> > > > +          framegen1 synchronization status activated interrupt
> > > > +          (display controller, content stream 1)
> > > > +      - description: |
> > > > +          framegen1 synchronization status deactivated interrupt
> > > > +          (display controller, content stream 1)
> > > > +
> > > > +  interrupt-names:
> > > > +    items:
> > > > +      - const: store9_shdload
> > > > +      - const: store9_framecomplete
> > > > +      - const: store9_seqcomplete
> > > > +      - const: extdst0_shdload
> > > > +      - const: extdst0_framecomplete
> > > > +      - const: extdst0_seqcomplete
> > > > +      - const: extdst4_shdload
> > > > +      - const: extdst4_framecomplete
> > > > +      - const: extdst4_seqcomplete
> > > > +      - const: extdst1_shdload
> > > > +      - const: extdst1_framecomplete
> > > > +      - const: extdst1_seqcomplete
> > > > +      - const: extdst5_shdload
> > > > +      - const: extdst5_framecomplete
> > > > +      - const: extdst5_seqcomplete
> > > > +      - const: disengcfg_shdload0
> > > > +      - const: disengcfg_framecomplete0
> > > > +      - const: disengcfg_seqcomplete0
> > > > +      - const: framegen0_int0
> > > > +      - const: framegen0_int1
> > > > +      - const: framegen0_int2
> > > > +      - const: framegen0_int3
> > > > +      - const: sig0_shdload
> > > > +      - const: sig0_valid
> > > > +      - const: sig0_error
> > > > +      - const: disengcfg_shdload1
> > > > +      - const: disengcfg_framecomplete1
> > > > +      - const: disengcfg_seqcomplete1
> > > > +      - const: framegen1_int0
> > > > +      - const: framegen1_int1
> > > > +      - const: framegen1_int2
> > > > +      - const: framegen1_int3
> > > > +      - const: sig1_shdload
> > > > +      - const: sig1_valid
> > > > +      - const: sig1_error
> > > > +      - const: cmdseq_error
> > > > +      - const: comctrl_sw0
> > > > +      - const: comctrl_sw1
> > > > +      - const: comctrl_sw2
> > > > +      - const: comctrl_sw3
> > > > +      - const: framegen0_primsync_on
> > > > +      - const: framegen0_primsync_off
> > > > +      - const: framegen0_secsync_on
> > > > +      - const: framegen0_secsync_off
> > > > +      - const: framegen1_primsync_on
> > > > +      - const: framegen1_primsync_off
> > > > +      - const: framegen1_secsync_on
> > > > +      - const: framegen1_secsync_off
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 8
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: axi
> > > > +      - const: cfg
> > > > +      - const: pll0
> > > > +      - const: pll1
> > > > +      - const: bypass0
> > > > +      - const: bypass1
> > > > +      - const: disp0
> > > > +      - const: disp1
> > > > +
> > > > +  power-domains:
> > > > +    items:
> > > > +      - description: DC power-domain
> > > > +      - description: PLL0 power-domain
> > > > +      - description: PLL1 power-domain
> > > > +
> > > > +  power-domain-names:
> > > > +    items:
> > > > +      - const: dc
> > > > +      - const: pll0
> > > > +      - const: pll1
> > > > +
> > > > +  fsl,dpr-channels:
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > > +    description: |
> > > > +      List of phandle which points to DPR channels associated with
> > > > +      this DPU instance.
> > > > +
> > > > +  ports:
> > > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > > +
> > > > +    properties:
> > > > +      port@0:
> > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > +        description: The DPU output port node from display stream0=
.
> > > > +
> > > > +      port@1:
> > > > +        $ref: /schemas/graph.yaml#/properties/port
> > > > +        description: The DPU output port node from display stream1=
.
> > > > +
> > > > +    required:
> > > > +      - port@0
> > > > +      - port@1
> > >
> > > Generally speaking, and looking at the main KMS drivers patch, it rea=
lly
> > > looks like it's multiple device glued as one, with the driver un-glui=
ng
> > > them and creating devices and their resources based on what actual
> > > devices you have in there.
> > >
> > > It's especially obvious for the CRTCs, and to some extent the embedde=
d
> > > interrupt controller you have in your driver.
> > >
> > > This is *very* far from the usual way of describing things in the dev=
ice
> > > tree, and you would usually have a driver that doesn't take care of
> > > creating the devices, because they are properly described in the devi=
ce
> > > tree.
> >
> > The DPU core driver(dpu-core.c) creates platform devices only for CRTCs=
,
> > no other device is created.  The CRTC devices, as components, are bound
> > together with the DPU DRM master device.  i.MX8qm SoC embeds two
> > DPU IPs, while i.MX8qxp SoC embeds one.  Each DPU supports two CRTCs.
> > So, e.g., for i.MX8qm, there could be at most four CRTCs under the imx8=
-
> dpu
> > umbrella.
>=20
> Yeah, and that's fine. It should all be separate devices in the device
> tree though.

There are 50+ individual DPU internal units and 20+ unit types.  Do you rea=
lly
mean that each unit should be a separate device in device tree and each uni=
t
type should have it's own compatible string ?=20

Almost all units have input/output ports to connect with each other.
Some units have multiple input/output options.
Should we use OF graph ports to tell the connections ?

>=20
> > > If you have a good reason to deviate from that design, then it should=
 be
> > > explicitly discussed and explained.
> >
> > The DPU is one single IP which cannot be split into separate devices.
>=20
> Sure it can, your driver does so already by splitting it into several
> devices and accessing registers based on their stream_id.

I would call them DPU internal units instead of devices.

>=20
> > The "IPIdentifer" register in DPU register map kind of provides version
> > information for the IP.
>=20
> That's fine too, just read the version register in the main KMS driver,
> every other component will then have access to it.

I meant that "IPIdentifer" register hints that DPU is one single IP/hardwar=
e.
And, we don't have to describe all DPU internal details in dt-binding.

>=20
> > This dt-binding just follows generic dt-binding rule to describe the DP=
U IP
> > hardware, not the software implementation.  DPU internal units do not
> > constitute separate devices.
>=20
> I mean, your driver does split them into separate devices so surely it
> constitutes separate devices.

My driver treats them as DPU internal units, especially not Linux devices.

Let's avoid Linuxisms when implementing this dt-binding and just be simple
to describe necessary stuff exposing to DPU's embodying system/SoC, like
reg, interrupts, clocks and power-domains.

Regards,
Liu Ying

>=20
> Maxime
