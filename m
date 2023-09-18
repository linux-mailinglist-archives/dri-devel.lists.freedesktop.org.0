Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E13B7A5A46
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 08:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6587110E315;
	Tue, 19 Sep 2023 06:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2085.outbound.protection.outlook.com [40.107.247.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C06610E0A6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 12:22:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTQXNDMwvDbJ2k8lGU55VcEriNk/H38Ep9JtagXSb0VeRzV9bdUbR4MFxd49IYygWImaUIDHHE7oozpXc/J1ci5ufL82eosz8zVrJbOzm3a5LT0jv+0WIFweGDKs+7+DzQRzUvIw4yZlXiLoOQr8MTeGEnSK4LvpPySQsq8TNR7oCffCaZddq8p9tjSDbCaJdj+077idxJYRKKBjoM6ZDWg1YStIoMkoV77FcGEFkCQTflp1oLtdeMOZyrv67oK80mbhH8xIkvipO6bkPrNMS/gaZMIl1JH2NQMa1H6RuRncHviQ9c8NRwwSgQpvjTZHXiVNRAFcBAiiRvqBeHx6xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eT5TLfbod9WNxDAkzKu/viKH5r15oYqM7J6YirYKn0o=;
 b=SaA+XBT2ins15hUErZ5kc3o0ApnnWzQ2AH2MddD8SVG+SaHo/QVL9eOLrNI0jJTZwjNfN156O02F/Zc4tkxNfeQFDDsUKgJTl34jYYBz/ycTUPJ2JXs+siuj8lPWW3CjdndNzan4SkglKV2VpnyILvfoYcCAet2X/NlyXadOmnmij4KdHCwsGPAdkdsouHAerYbRPyVnv6ZpBrFM0idqYwmVCUtQJ6/obrXU27oqrkzoy8QGBBCNYQC5NHJQd7PGsTbKuPzDUWFOeqQDM06gREe5ieABUO7q5qVNpNF9WMOVIa2H/cKc3Q9a+TEXfGOSA4bhd5AwGhVke5fi/q40Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eT5TLfbod9WNxDAkzKu/viKH5r15oYqM7J6YirYKn0o=;
 b=orJLgGTnAvlWV6B+MUJisKxMQ/58WPMb3zt84sgnbhErA59tLOZCMZh3eCBEioGIBf1mwHfCEwwegYeGQwKOruBLqrvDsiOh2x40bApPQKdGnrVs0iCZc+qKB0FEZW3bk+TeFShNRMLYrAG13glwDEhWN9l0ht6ALg4eGuMIYPU=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by AM0PR01MB6306.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:16a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.15; Mon, 18 Sep
 2023 12:22:51 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::11d:15c1:fca6:e077]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::11d:15c1:fca6:e077%7]) with mapi id 15.20.6813.013; Mon, 18 Sep 2023
 12:22:51 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Conor Dooley <conor@kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Topic: [PATCH v2 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Index: AQHZ592r0UV0+OQAK0qc65NPyGpwxrAcB2yAgAR937A=
Date: Mon, 18 Sep 2023 12:22:51 +0000
Message-ID: <DU2PR01MB80342BFB3FC5C5B49EDA3E73F9FBA@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20230915140516.1294925-1-f.suligoi@asem.it>
 <20230915-sinuous-domestic-80cd8775ecb0@spud>
In-Reply-To: <20230915-sinuous-domestic-80cd8775ecb0@spud>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|AM0PR01MB6306:EE_
x-ms-office365-filtering-correlation-id: c0c416de-d132-4ce0-e0fb-08dbb841fa51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Y9hoUwdn1TIPmCqI1lg4BiR/xlGQK6oTXZYDRUmgf2u7vLDq4rzXp/vK3eVh09fYHHxj+hYuKzRcbLNqxc7eC8uJNGjmCFEJq9AFbI0Mu9mq54crpNYkNDZCNArIv/Xafxb+o5b7fcnvJp5wk4cfYYEvEvxVd9q2AtvnLb/GhV4V9UORz6bfmIT2BqB0Ys8o5UBNnsneuOvVGx2D2KTuaDlp4xpDq97jsG4bd6Ze8KRUeu+kUsiapiAXtVTeA7fOTr+jNWicXg0TVRIKq+yhwQW1XCR3rkeKeYkPSBFBE8cYzyMafkOrGNvtTGGUdccb9ufYoXD1gM4wq8f6aZAMPIj76HLPUgXnc8rGG5aXTbubG+BiCUNcUCG0EgkJ/bT73gtgk+lzoinUaKI17FiYz2C/sJ2ECPtP3Rq/Y24nF+81C+zVeF4MbDRRyEaXwkV59Wq9fW1eWWfwf7Z55clR/CygqZp92A7HtlLv0DYKaUFlk/j5dotYs1585OuGAaqBYg/ZMmL2ZmIhAWFAp7BiFuo+DBcB9XRNcnwCQmmn1RxcmSJW/BDI7J8ixv4rLIGvaxOqBi2kTFhXauG/JzGCCbVls2Fsjc/aOsrLhAGJbY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(376002)(346002)(39850400004)(366004)(136003)(396003)(1800799009)(186009)(451199024)(7696005)(6506007)(966005)(71200400001)(9686003)(478600001)(26005)(2906002)(7416002)(66446008)(76116006)(66946007)(64756008)(54906003)(316002)(66476007)(6916009)(66556008)(4326008)(8676002)(52536014)(5660300002)(8936002)(41300700001)(55016003)(86362001)(33656002)(38070700005)(38100700002)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?K0Dq9iQwmr9z99yDPMpNKDjPoa26xybdJtTCbJv4CuvhcZySyba119RWa2ir?=
 =?us-ascii?Q?iwu3qehmodGpFtGGa45OZAch36nsKJzY6MX+m3a3xKHVKZ9OM2cmqRaJBokP?=
 =?us-ascii?Q?suFDCOTiNs2ofhpa+tbvASoOB/4NMmKrRV+Qm/IV/ruXSPYCYsjtJDOBnbK1?=
 =?us-ascii?Q?FwhP+nx23nNaYvqvWHBnlLIQmRT7en+HCguZOIWKQk5LAa9zcyRzwK/cm62H?=
 =?us-ascii?Q?u+BrhAOaR6hAVYwEYnlCtD2VxMyYJrVhynGue9ruz6LBSg5zjkVvjWmXTAjz?=
 =?us-ascii?Q?vAJZQXXp7AAVWNENh9AFuXGvTnmAtKe6XffJqPvnf3BybH12m8VAT+fjOQOl?=
 =?us-ascii?Q?SSbBTlfmTFkyM6OgvPdF55JRyyNLJPa/ThAiCvnPZYT5sMK7jZHV/oQiojuG?=
 =?us-ascii?Q?X4ZCw9OccAt0xGRbo0Cojsj2hAeiM2ZU1KxypDrDjo301BjV8TVacnLrXdku?=
 =?us-ascii?Q?gdOiAwukQCAa1r6BbHukTPzmzfpDPJ4JNaAxsCb+zrghO0O9mMBZuhjn2/un?=
 =?us-ascii?Q?6I3EyLyv5DXyFAcoAPxQYScjfUQfcr2a31Tsu2Y5yCw7AuTADFpuJdBOYMhj?=
 =?us-ascii?Q?cRvC/L+4xP3kWpFcKKSV1X026u9NZCNs0Q59Zu3RupuniJnngtHURg2ROi3q?=
 =?us-ascii?Q?GNWRJd9KPaYnqwybvVNpgOFV6n8Gs0nfCGkLwqr9MrAMf0ZrnuaHp29/m01g?=
 =?us-ascii?Q?x1LFJat/2yaP/6n0SRot6SuxCra0qgPtE1XNm6AjYPfBt+UY6R6RLEZNWfJJ?=
 =?us-ascii?Q?lAxJ1+kTy6lldh9gENyrImzY1r7YUwGUnPqat2670Wd2WC+z5/ZThOG2Ur/p?=
 =?us-ascii?Q?AvB/5eQtCHvLX6FOraI7BlBQVCQi3AQ8F3UtiIZXd9wLO+YQ3UpBqLYYbT/2?=
 =?us-ascii?Q?wkjl8qIiY2H6kTMmu3Ok4ostc1n3nVsZ/qm8SKEQsnSNhzIIEvK0ouEGFJE+?=
 =?us-ascii?Q?dyd7tbR/cCeqR/8Rriz3pcFIsEpwd/varAlxN03fB4ej6csWSvoFQlbw0Abj?=
 =?us-ascii?Q?Hbwgo2TGqldpCkeo2/JIJcaDbGAO397ylHvZ8B+5Dr2aSuSwlvphnJ4QNGfV?=
 =?us-ascii?Q?pOqhx5li+I6yuGbU0N4ib6DYwA6DXV2VJrBm8g4UVCVW67Fi6C26ReAEEy7A?=
 =?us-ascii?Q?6OmtC9JBW0Mq14SCX5c3y2DAz8f159Cw0wD0DIN/oTQhXAet4wZIw5nmXcQw?=
 =?us-ascii?Q?1GTQORtH0JBTUuZ8qxE35QAKEq23xmFm/pSKw3yCfadBjvjIx3z/SXDiE1Mz?=
 =?us-ascii?Q?iRHKDB4JoC+Y4kfx/ohd6ue7qG7GG2bGRVn3jkFHdDLw/OeJwYWuCr1ehh+S?=
 =?us-ascii?Q?5TLmdv7ONPQlbyt5F3s1fN2o1yBo8159W3mKempIARAXEzZm9OV0PhktIrXs?=
 =?us-ascii?Q?ZRpLkTojof5xae9iGPImfPMR+HKrwcQS8GyE3UCxfIRJH8dHuDqhncDPtpPr?=
 =?us-ascii?Q?/V5HxOtlosklFZlCvMYXdP0bJ0EBEvs0nmCpMhUAz7nuDLyaDGRluTxjiIGD?=
 =?us-ascii?Q?r6MteH7wXG0D98xBdL6HWU1lkxgwo5TZjBf1NRuHFEIBiE3SsjKZEPOPp5h2?=
 =?us-ascii?Q?vBY9FtBydag2gCgtnLc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c416de-d132-4ce0-e0fb-08dbb841fa51
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2023 12:22:51.4684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSaHs4GhYzWneQIuE0DP6QknkbJsnwmFfj1Ib04J2uXtRbHQmB14USRpmGGSMgwKQ/L4IGZ+sUhsK6BNAKR+Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR01MB6306
X-Mailman-Approved-At: Tue, 19 Sep 2023 06:59:32 +0000
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


> On Fri, Sep 15, 2023 at 04:05:15PM +0200, Flavio Suligoi wrote:
> > The Monolithic Power (MPS) MP3309C is a WLED step-up converter,
> > featuring a programmable switching frequency to optimize efficiency.
> > The brightness can be controlled either by I2C commands (called "analog=
"
> > mode) or by a PWM input signal (PWM mode).
> > This driver supports both modes.
> >
> > For device driver details, please refer to:
> > - drivers/video/backlight/mp3309c_bl.c
> >
> > The datasheet is available at:
> > - https://www.monolithicpower.com/en/mp3309c.html
> >
> > Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> > ---
> >
> > v2:
> >  - remove useless properties (dimming-mode, pinctrl-names, pinctrl-0,
> >    switch-on-delay-ms, switch-off-delay-ms, reset-gpios, reset-on-delay=
-ms,
> >    reset-on-length-ms)
> >  - add common.yaml#
> >  - remove already included properties (default-brightness,
> > max-brightness)
> >  - substitute three boolean properties, used for the overvoltage-protec=
tion
> >    values, with a single enum property
> >  - remove some conditional definitions
> >  - remove the 2nd example
> > v1:
> >  - first version
> >
> >  .../bindings/leds/backlight/mps,mp3309c.yaml  | 73
> > +++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> > b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> > new file mode 100644
> > index 000000000000..99ccdba2c08f
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yam
> > +++ l
> > @@ -0,0 +1,73 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/mps,mp3309c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MPS MP3309C backlight
> > +
> > +maintainers:
> > +  - Flavio Suligoi <f.suligoi@asem.it>

...

> > +  mps,overvoltage-protection-microvolt:
> > +    description: Overvoltage protection (13.5V, 24V or 35.5V). If miss=
ing, the
> > +      hardware default of 35.5V is used.
> > +    enum: [ 13500000, 24000000, 35500000 ]
> You can add "default: 35500000" and drop the free form default as text in=
 the
> description.

Ok, thanks.

>=20
> Cheers,
> Conor.
>=20
> > +
> > +  mps,no-sync-mode:
> > +    description: disable synchronous rectification mode
> > +    type: boolean
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - max-brightness
> > +  - default-brightness
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        /* Backlight with PWM control */
> > +        backlight_pwm: backlight@17 {
> > +            compatible =3D "mps,mp3309c-backlight";
>=20
> As the bot pointed out, the compatible doesn't contain "backlight".

Right, fixed!

Thanks and regards,
Flavio
