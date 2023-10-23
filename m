Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F5C7D2E37
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 11:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15B910E19E;
	Mon, 23 Oct 2023 09:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4918B10E19E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 09:28:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3dmJt1zBrhQZb4f6b/PELRQIbU0TioEevlCp88sdYfQ4X1ZQBah938rSH1NeewLdgwEgZqWYaZ2Jj9zCw7dNxWLMVmcMB+cQ54K5LX+OakzBcNYZONqJg7QIr3lh3DA5ODohLzQuT8sgoAb3zL9NVtOWilcWOkksT1EzJxT0uiPdDiyhAtQlGVR7hsC6okkSvrAUcyP2RZYXQ8HFSl8HV9zqAs7bi0Y3uugACPePSqtWbZAJFc0DFrVn/idUpwDB6mWJzQHvixHD4gXMAAE5qQ8qjRsWHwSh8pnHwds3BMi5ygN765jTL87r6hu+u1zpmhsX8vXtNY7QefYpM9LUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIIeTQCFPpQtVJcL0dcK8tvcoMmRPwh+pvHrOHOwcQw=;
 b=mbT2+JqaGBy3WqBq/jkCypfd815uFZex8qZJbYcfje3jONul5VFhT7sm9r8dNbUpbyruZz+XRYnJLJ4u4k4AnHxlSLgvjMhrpZfPm2FRioTOamQUDGvunX5Y9lvCEgzaAlz0N7MHNw5//B+pDzjVNYVPiwbMAQrCwOyOxreyMuBU1opwEmN4IzzpEXGM5UaD7YQV7K+kMIT1rB+Krt6Qk3zteD7qGlzzNI2ehDGq1uKFbQRHPr0L6K3JFCnRVCwxNiFuoWKoJ5UB4lPHehGmApD+E/4jPDY3HVafD/wiMxtI0HgaTbj5skbHSpC3IyZU3d46xU4RN5gvsFAKarcsag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIIeTQCFPpQtVJcL0dcK8tvcoMmRPwh+pvHrOHOwcQw=;
 b=hYPjWcfBEMCvXfLPSI++rMpnSuPFYtPDFqCDKxbetgKlYp2pNJDudVGtG8AVG7Or4OF7OKHonpcrS7Fg3axTW+Is6jiTPhENr4vZymvnkrlG2d3JrhXrCkGqt1GFiHby99edpelNh1ziifZJK7Sgw+N43ayV6bf/dgIggikBTwQ=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by PA4PR01MB8993.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:2a5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 09:28:03 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::ad2b:a1e7:8828:ba2f]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::ad2b:a1e7:8828:ba2f%7]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 09:28:03 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Conor Dooley <conor@kernel.org>
Subject: RE: [PATCH 1/1] dt-bindings: backlight: mp3309c: remove two required
 properties
Thread-Topic: [PATCH 1/1] dt-bindings: backlight: mp3309c: remove two required
 properties
Thread-Index: AQHaA10IhwE5ZkDArkS4RoPMFlMBm7BS1g+AgARFCAA=
Date: Mon, 23 Oct 2023 09:28:03 +0000
Message-ID: <DU2PR01MB803498DFD93E82DD3947D72DF9D8A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20231020135434.2598578-1-f.suligoi@asem.it>
 <20231020135434.2598578-2-f.suligoi@asem.it>
 <20231020-moonrise-senate-86d0edb2d404@spud>
In-Reply-To: <20231020-moonrise-senate-86d0edb2d404@spud>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|PA4PR01MB8993:EE_
x-ms-office365-filtering-correlation-id: eb3e2b97-e52a-4bfa-5409-08dbd3aa5b73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DZ8r1WpLSXZIAIAl4E/XHyDixUhJD8TIsbJX118j1P9WBT/9Aod6K/Jvbexe51AQhjyJ2TsF0ahczSDlCROag7v8VnTmdRT0/zj1Hx1m+RkYUGklgHN7KX6zF89WfzydCLzig2bk66DYqSbMAOyoXfGJNlJOPF6yDInSn/nzOvNKNJRrnkUfel4UpSEb1a8XD7OYKTkYbzNCf3Rqn4ag/WA1VWTYfjmxUvSjMqp1sNU6X36GDbyWr7oT0oH6y3MPDjnkdb+gf4k81oTsS2C1cKu638jPAFK6fHvXYP1Tjt6KTv9+gkEkyVCSjIckSl/eEZRnUsiBhaEmJ2EgSABg2iw77b19L220v9lAGwcKSd0XO/D2VGPfmuvepGrk2tVdXghtUIoicschaDUeeJlSdoRtMlmuNKgYstKZ48/N3yXeUVVF0wqENOqReooblMEcObX5D3SeLzJyLbqCI2E2hHrI+2s6JPd7EcObelX6WSHM02iUZJaVoNRcMEnJ+XrP9n4Pq2T4eRlFEixyqZnfeNuZL01TWteY/DdprK7MD9hrm/rfbFg3C1U1h2ObwJXBc0JQRCyx0C8yv26tzuhDwMB96HFVBWStOJGfeU7qsAE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(39840400004)(396003)(366004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(38070700009)(38100700002)(2906002)(55016003)(41300700001)(86362001)(52536014)(5660300002)(7416002)(8676002)(8936002)(33656002)(4326008)(7696005)(6506007)(71200400001)(478600001)(122000001)(66476007)(6916009)(66946007)(316002)(76116006)(54906003)(64756008)(66446008)(66556008)(83380400001)(966005)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H+vv07Mkm505hq2oxnZ7TOJWr6dZDquYHE5F4lV62nLkIdu8OxnprXExdjEX?=
 =?us-ascii?Q?H3SjQjWtJV52NirpycnNKqv/xhdpp26bsijNSuPRvRicsi0bfr80UQMvfHx5?=
 =?us-ascii?Q?l/h2WMgyiaG9z9vks3eXzHvaF9ygbAEGf0SwOrQdmDtU0xCCgWAs1WYzWAaN?=
 =?us-ascii?Q?q47omqkufj59PoYUNRlEAWDIebPjWxw15GlpLW4nckUS3CrueLyYXwR7A4Em?=
 =?us-ascii?Q?ybo4bTN5pSA9NpQcwWMuLBteMune1wK8kP+9NMVl/jZ4jyz9Omi7B0U+hmnn?=
 =?us-ascii?Q?uvUEpHMDO1cKaqyEULuAuWUFVAiAe1lI8qQpzE39ydh4g4P9Sra1h9+VLlkp?=
 =?us-ascii?Q?7rQX/iNx+10wy4rXJsqileRJrJJpeA6HmXB/NAVUzv8CBVAzidj4Bf2xuig6?=
 =?us-ascii?Q?z5F05YnnSeWZjHg78JHCXjyuWTQf8mU/GxKLSl64DkFBBplOIofVfx0V3gkZ?=
 =?us-ascii?Q?8FqE2WF4JSC2/wCwc5MZi1vk5i+t/r4t/gzHP3APDVHCtObWikQhCk+WSenB?=
 =?us-ascii?Q?y0HWsbCNSd2El+WqYgC+NigDkZg12tyifSedJ6/k9OfARhbmQyDYeBeumAXP?=
 =?us-ascii?Q?eVOSiaRJruTgJix6MeBrYtg6vJsb1FGImVJ9CijZ7dPZbSCdaXYUqpDRDOr8?=
 =?us-ascii?Q?KUEqnlykqLAhpS7uHTSiVviLO7N4W4HUVn9r96AGBTgaFuvZXlMw7uKasGjq?=
 =?us-ascii?Q?9sM/p6U1GCmLLRUc8Jwkch5hlWAQrTS8cDzaagGfFN3JuuoTkPOaw2hQX0yP?=
 =?us-ascii?Q?8bknV3KH8eci2bpals/CCIXhjgedvwMOhraauVgfuRkt8WwSzLMX/68flw/q?=
 =?us-ascii?Q?ulTrdYc/ZTajt9HCB3O3hbOFt0f3thamyVHJ4c4E6Ak8lui3Sy33ip62evQb?=
 =?us-ascii?Q?dw74HYN0wmnbl+W1kDhpyUebj1eJfK8eLOo1mqhcrNLo3nnSSmQjUa5lA8gn?=
 =?us-ascii?Q?JCYl/YZqFcrVPGo1foRogcZSklZS5HtiMTB6p6Pm8tj70jF//tWiiPZbYVgN?=
 =?us-ascii?Q?NyaG6GufbsDzjVLOqxyf+D0v3gR4vl1h/XghE0vsQ0wV0GrG5snd3ICUjaZ0?=
 =?us-ascii?Q?6Unua821q8HF1qCQ9KBOkXEifK5Nd8E+SOp/TX4tIlEEfm46rASLI1U5lmMr?=
 =?us-ascii?Q?B3JmLyT6k9v+qVrhtYas8/XgZyMizS46Wj6ZUMd//V2L3UkBdv0U0gYUhRe3?=
 =?us-ascii?Q?mGCIM6oRu2ES6sckUEve4qMQlGQ9ekSCkaDT/EV40MxHp6aywpBaZnfCoCqN?=
 =?us-ascii?Q?4zNRRRSejrOeJkaUOEc7SyFuDgz6XydL/bK4MJvgI/obA+qA8xsBX2cpNl6X?=
 =?us-ascii?Q?n2zhCXhvFuGTWUzlK+G+p94lVOnxgovRJHjCXXphos653qGu2cNwkXtun2Xa?=
 =?us-ascii?Q?jqbBnPAdn7b8NunPQAwEsyEPK3yOgGw1Ujded3p+r9q7oADM5L4htDjrPppM?=
 =?us-ascii?Q?OY85OfAouMOhbo59hyXtztkwP0jjVAe/nnJolg8GU6Q/Y7gqGgXQiPHSPEVb?=
 =?us-ascii?Q?s938FLYN62liAvttghoOf2766BfKqMVm5YDWUcxY1oQmMf3bT7/k+VvMaRp0?=
 =?us-ascii?Q?TFu2OvLGpbfh6hI2Wmk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb3e2b97-e52a-4bfa-5409-08dbd3aa5b73
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 09:28:03.4908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +5l3ihTdy+/skH0RcsuEZgNS1LVUDCboabDMJs2aGVy4BgWsD0HQ+7C/otgkGK/diVE4bXm+KCpH6b6Ug1yEbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB8993
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Conor,

...

> On Fri, Oct 20, 2023 at 03:54:33PM +0200, Flavio Suligoi wrote:
> > The two properties:
> >
> > - max-brightness
> > - default brightness
> >
> > are not really required, so they can be removed from the "required"
> > section.
>=20
> Why are they not required? You need to provide an explanation.

The "max-brightness" is not more used now in the driver (I used it in the f=
irst version
of the driver).
The "default-brightness", if omitted in the DT, is managed by the device dr=
iver,
using a default value. This depends on the dimming mode used:

- for the "analog mode", via I2C commands, this value is fixed by hardware =
(=3D31)
- while in case of pwm mode the default used is the last value of the=20
  brightness-levels array.

Also the brightness-levels array is not required; if it is omitted, the dri=
ver uses=20
a default array of 0..255 and the "default-brightness" is the last one, whi=
ch is "255".

> > Other changes:
> >
> > - improve the backlight working mode description, in the "description"
> >   section
>=20
> > - update the example, removing the "max-brightness" and introducing the
> >   "brightess-levels" property
>=20
> Why is this more useful?

I introduced the "brightness-levels" instead of "max-brightness" for homoge=
neity,
since the "analog mode" dimming has a brightness-levels array fixed by hard=
ware (0..31).
In this way also the "pwm" mode can use the same concepts of array of level=
s.

>=20
> Cheers,
> Conor.

Thanks for your help.
Flavio.

>=20
> >
> > Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> > ---
> >  .../bindings/leds/backlight/mps,mp3309c.yaml           | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git
> a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> > index 4191e33626f5..527a37368ed7 100644
> > ---
> a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> > +++
> b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> > @@ -14,8 +14,8 @@ description: |
> >    programmable switching frequency to optimize efficiency.
> >    It supports two different dimming modes:
> >
> > -  - analog mode, via I2C commands (default)
> > -  - PWM controlled mode.
> > +  - analog mode, via I2C commands, as default mode (32 dimming levels)
> > +  - PWM controlled mode (optional)
> >
> >    The datasheet is available at:
> >    https://www.monolithicpower.com/en/mp3309c.html
> > @@ -50,8 +50,6 @@ properties:
> >  required:
> >    - compatible
> >    - reg
> > -  - max-brightness
> > -  - default-brightness
> >
> >  unevaluatedProperties: false
> >
> > @@ -66,8 +64,8 @@ examples:
> >              compatible =3D "mps,mp3309c";
> >              reg =3D <0x17>;
> >              pwms =3D <&pwm1 0 3333333 0>; /* 300 Hz --> (1/f) * 1*10^9=
 */
> > -            max-brightness =3D <100>;
> > -            default-brightness =3D <80>;
> > +            brightness-levels =3D <0 4 8 16 32 64 128 255>;
> > +            default-brightness =3D <6>;
> >              mps,overvoltage-protection-microvolt =3D <24000000>;
> >          };
> >      };
> > --
> > 2.34.1
> >
