Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2937C5280
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 13:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4518D10E60E;
	Wed, 11 Oct 2023 11:52:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EC410E72A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 11:52:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BajABAhS1wddLHiX78ZokBp1lzG7Ac5SuKvKu7YtNfQ/bNx5LqYv2OT3Gi/0Fhwj3KR9Fd8KfFB5mN6/uu35H6leWpwc4QBsHRiF8ACsYixx+lNKdDo9wBc5A44uzVO4OEfhr2XCM57SF8kcd+QKnU61vlQxqGybxaHMY8lx5Q1bZYrqlWCRl3txuH8/zGE8ufW/gmfaW92DlBQGDq8Nm2zZobtTHNLsaECsSHjjDzukCLIQ+FJXFZvxpX9qqyWFBTTVg3wFlsoTnvHvOi7ek6eNiT9eTAy8ag3cmBYDAWieQSQjw1VZfJq+btu4MjUKKBjZyoJcnhlrCN6zS08vGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgtU1r1mLL/v1/xFLjZhbGM7Sdi5HA0hwxv2NrW+7ew=;
 b=Wr4dH3abHAXrhyQC1dGzf1d0QPn09kxb2vmbX8Dje4yDQLOqsbxUCNzNUT6Rix3a8OaoXBT5SzY0VC4nVFWYRnDiJxUJzY8r0uyfnvNP3OpfTt+RYGyJjRkfRzSTmYKT5+phxujertHGFPh8PY9HnpRdhBVBf3Ktuu4z5rYSPPdW7gZwHl+CaKss88jTrS6gOpfwTzDadjaGoRFr7P2nOtgFwJ9sN8SC+H6KuFQYzUX4MPkkmaL7UW0OKNLZmTlfqDOSb9to6XVyf0RSXuF/cRtqTk1zlUiFThW00oC2jmMtQsZG/BZLhterk1Gw6SDatYzPmv3ThDgM+ROA5v15cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgtU1r1mLL/v1/xFLjZhbGM7Sdi5HA0hwxv2NrW+7ew=;
 b=fGX3+U0NnRmQYyylM+fDUFtQD1pBN41j9DQ3Hua2mueH6aUcVV0jQeUfTPmD9gWIuv2DcB1dZcvYFCZKKIne/BSxFgvbGa4Zx5Psrc7js2nx5L185BxHyfnazt2XhRFWh5OPXmURAqoJHmw1YtVZMFoDSJdP37DauFy6UFywfWk=
Received: from AM8PR01MB8045.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:320::8) by AS1PR01MB9180.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 11:52:14 +0000
Received: from AM8PR01MB8045.eurprd01.prod.exchangelabs.com
 ([fe80::e0b4:579f:9463:f4cc]) by AM8PR01MB8045.eurprd01.prod.exchangelabs.com
 ([fe80::e0b4:579f:9463:f4cc%5]) with mapi id 15.20.6886.016; Wed, 11 Oct 2023
 11:52:14 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v4 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Topic: [PATCH v4 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Index: AQHZ+3Oa23Umjg05nUq8U4rLHzRJ47BDMv0AgAFHCjA=
Date: Wed, 11 Oct 2023 11:52:14 +0000
Message-ID: <AM8PR01MB8045ADD01F342CCCAB6FA4A1F9CCA@AM8PR01MB8045.eurprd01.prod.exchangelabs.com>
References: <20231010121621.3009154-1-f.suligoi@asem.it>
 <20231010161512.GA944015-robh@kernel.org>
In-Reply-To: <20231010161512.GA944015-robh@kernel.org>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR01MB8045:EE_|AS1PR01MB9180:EE_
x-ms-office365-filtering-correlation-id: 07a56bdb-e1b3-4946-316f-08dbca5082ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yf+pFfvISQ2bEVe3DCbC6bf0a8mP+lYx2PTGTPENI6HUjgujuD+nmzymvmoYGe+58s9YUwkcvHlq2mFYPwv6SnBH/mzrMYButJWHvAroQwjLWnYK20lNV1nGeU00YnqvIRdxWGJG91brHqW9FloRG3wRkO21A1D7DyL4jf5a+PTX0qfrFb5neLkO5Gu0gw6uCrRkLwLmcyfmVIfTR/+d+aLqzmCKxGdCNcMKWBu+MC3n8DbeOiv1JE2Y2AbELqijePMa5V7oD5ThctisftGXgat+N1a0vXgm6GoYe2OOblwJPQ0gh6Yt2kqV5wfp1DhrdjuYBSexXjlEVt7f+05K6CV9eOIWWs7CapNGli3Gd6pr/IOwO3Bkxe3VSkHyaWAQIGyO37XIqFrO6b7FiF3Mhrmk/H+btjqXjjx4j2hce6ENRRCR0lBFUcUWxdY7YfTJcudaYLQi43AWHC/Sn6PpnUDXXRAyqtEpJZ8//XeW0xC8glCSTBRKq5cAFq4JR9vMdxGgRvgCigHQx2+tMyVi08k7HMuqS4kgGKRd8hYYmvu48XPVSi7IXLKLuDF3wgK/BY90TqVY35lZZWXUGr/rhT8ARaKU/kBhv0ESbEr0YaI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR01MB8045.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(39840400004)(136003)(346002)(396003)(376002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(52536014)(8676002)(8936002)(5660300002)(41300700001)(4326008)(316002)(66946007)(66476007)(6916009)(76116006)(66556008)(54906003)(66446008)(64756008)(2906002)(7416002)(7696005)(26005)(6506007)(966005)(9686003)(38100700002)(38070700005)(33656002)(478600001)(86362001)(122000001)(55016003)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rXU0wCSznBjMSrQi0XILzyWvk0jg4wTAy2kSvAti6Dc26mLFYJI/aCfBQPx/?=
 =?us-ascii?Q?b2DXXQtABAXUIa/GMzRyNj9W8Q/zYgy1nrkNFOSP278chOKBxF/tHEgS0LwC?=
 =?us-ascii?Q?Y5bc5Cj+/D0L5WT4YQF2+4RgwSWZRyTq1JcoGoIAVGeAY7H0Ymj2tz3zTkLh?=
 =?us-ascii?Q?NOb0lBDhLRw9/Wmn6Dz5GncG9jBR6ADvr6uOhDkLRssU2CYaoJmqlHEMdVne?=
 =?us-ascii?Q?o0R0SvNp6pE/BLYdWhvIOfPto0B6gZ5zMeGS31EiJrFTHQ+TJUwzag+9Ogwd?=
 =?us-ascii?Q?NQb6jmlzY99TPYkp0fAGUtyO96ius3KtFnOUK2E8NRUqF/gH7P3Zub7sWVYj?=
 =?us-ascii?Q?1dAs84dII9sLG3+CDhY8qKKgYrB/qq6ZSEKZ5NOamJxjlb+nzyBLNfOu1E00?=
 =?us-ascii?Q?3psEMDBXho0ASrZ72bAoSico+2HUPZsNYAcKtksaghOZTubltK81OqmSCENS?=
 =?us-ascii?Q?Y+8VI3GJUo5w6Agjzx8PJ9oVCtwUUaZHBMt0cGoswGGCqbqOT8QpbWW11DYP?=
 =?us-ascii?Q?V9sVdl1tPuUB2apRQnYoNuLHqKovk5bIc5ZspVgjRyVnWTWXc8+Ocp1TRAJ7?=
 =?us-ascii?Q?3xqRMYwluMpTMMfZvSxssKr+Cg0qQLGwKvuszCXzk9mRB75LEKq0oYBGXLft?=
 =?us-ascii?Q?x/9guyf+LPGjNqNqosDyKK/WrQmsR0ou4Tw0aTAKLu2s9lqmWecs96G2Wj35?=
 =?us-ascii?Q?GTnHb2hOUfVeLk+CIGK46k2aPtybMPKDeOh6MPRqSYrBHK0j6TURu0WufKAv?=
 =?us-ascii?Q?zUdSdjzegmEe3wlJvRZENWOD85rICr14t6U5AFzCFhvEqY+RqwOwbIfvolU2?=
 =?us-ascii?Q?OT4f41sIR/Lljf0x+a9UKAUberaeQVEfYNDkVwdg/syr8RXiV+eh4l9dDrF8?=
 =?us-ascii?Q?rvk8jNMMau4j18fkDWm4tBfX2gPp3tCEHA+EevixuFXeGsHcTZ4vCgzj4v0c?=
 =?us-ascii?Q?Hi4Kqiq8MGWm3/KT84mmOoycgu8nykE1YNNAqofQyGGZfT+yCx8mvObbFF2/?=
 =?us-ascii?Q?84lAj37vDfof8oLJk8ToL5NfiQH9UxNHv6rYmj7jZJ9nxnPjVDXptDKwDhnj?=
 =?us-ascii?Q?M3iQFwCSnervD+JgvPC6JhcWQ2JaR9yiVGvlWY/gbyR1DxTrqwXIg+UBJdZL?=
 =?us-ascii?Q?7Gk5f9VyM5kM/9n/xi9ML9uev9THStCboDEAYtbFZyGbMNZD8XyTkRkf5SA4?=
 =?us-ascii?Q?1ARlylRW9u6LIlYsaZgBBKdV1GPLUDeJanFjOiMBcKJOIsOod2bb747V9/Pk?=
 =?us-ascii?Q?07z0Ew3yH/Qz3F8m0EMwO8Qb7DAgXoXQh8m9j6BmbjSIx9/0iD8kf8LoBwLr?=
 =?us-ascii?Q?jCQ9SwO23Vs+3XlYwavyaenIipTeoNb/oxyiBhcjygrGo7COvQqLd2JzAKNx?=
 =?us-ascii?Q?nK8olfpbijLAOCXEnzURMdZKvNdNEVAy0cwGuI2PaVrJxr8IFnvgOzyalG+S?=
 =?us-ascii?Q?kk/a6Qz0t1cRXqlGlpg6pYsBV7PNFFz2gdGlNGrc5f/Y+Uk3qIQThHMYG4j6?=
 =?us-ascii?Q?5MU6ZUFSdAp4MmW6XXnb9vaYJ0Fi3uaVcgaEYVlwXqnBGzs5WMGRbueLyzDw?=
 =?us-ascii?Q?UFQlofJTnl3AHX/KhIQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR01MB8045.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a56bdb-e1b3-4946-316f-08dbca5082ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2023 11:52:14.3477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DVRVL4xQGGuNR9effRnvXyySCYU71xz4nCs7sZk/+5HcKGw1B67pEsB6Er7JysbG55/62M/q5TymCX2b4iti6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9180
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
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

...=20
> >  .../bindings/leds/backlight/mps,mp3309c.yaml  | 82
> > +++++++++++++++++++
> >  1 file changed, 82 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> > b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> > new file mode 100644
> > index 000000000000..e2f9ae2b3fb4
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yam
> > +++ l
> > @@ -0,0 +1,82 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/mps,mp3309c.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MPS MP3309C backlight
> > +
> > +maintainers:
> > +  - Flavio Suligoi <f.suligoi@asem.it>
> > +
> > +description: |
> > +  The Monolithic Power (MPS) MP3309C is a WLED step-up converter,
> > +featuring a
> > +  programmable switching frequency to optimize efficiency.
> > +  It supports two different dimming modes:
> > +
> > +  - analog mode, via I2C commands, as default mode (32 dimming
> > + levels)
> > +  - PWM controlled mode (optional)
> > +
> > +  The datasheet is available at:
> > +  https://www.monolithicpower.com/en/mp3309c.html
> > +
> > +properties:
> > +  compatible:
> > +    const: mps,mp3309c
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  pwms:
> > +    description: if present, the backlight is controlled in PWM mode.
> > +    maxItems: 1
> > +
> > +  enable-gpios:
> > +    description: GPIO used to enable the backlight in "analog-i2c" dim=
ming
> mode.
> > +    maxItems: 1
> > +
> > +  brightness-levels:
> > +    description:
> > +      Array of distinct brightness levels, in PWM dimming mode.
> > +      Typically these are in the range from 0 to 255, but any range st=
arting
> > +      at 0 will do.
> > +      The 0 value means a 0% duty cycle (darkest/off), while the last =
value in
> > +      the array represents a 100% duty cycle (brightest).
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
>=20
> This already has a type defined. Please add it to backlight/common.yaml a=
nd
> remove from led-backlight.yaml and pwm-backlight.yaml.

Ok, I'll add common.yaml and I'll prepare two other separate patches for th=
ese.

>=20
> You say 0-255 here, but your example is 0-10. One of those seems wrong.
> Anyways, don't define constraints in prose, use a schema:
>=20
> items:
>   maximum: 10 (or 255?)

Ok, I'll add maximum, and I'll change the example, using 0..255

>=20
> > +
> > +  default-brightness:
> > +    description:
> > +      The default brightness (index into the levels array).
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>=20
> Already has a type. You need to reference backlight/common.yaml.

Ok

>=20
> > +
> > +  mps,overvoltage-protection-microvolt:
> > +    description: Overvoltage protection (13.5V, 24V or 35.5V).
> > +    enum: [ 13500000, 24000000, 35500000 ]
> > +    default: 35500000
> > +
> > +  mps,no-sync-mode:
> > +    description: disable synchronous rectification mode
> > +    type: boolean
> > +
> > +required:
> > +  - compatible
> > +  - reg
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
> > +            compatible =3D "mps,mp3309c";
> > +            reg =3D <0x17>;
> > +            pwms =3D <&pwm1 0 3333333 0>; /* 300 Hz --> (1/f) * 1*10^9=
 */
> > +            brightness-levels =3D <0 1 2 3 4 5 6 7 8 9 10>;
> > +            default-brightness =3D <8>;
> > +            mps,overvoltage-protection-microvolt =3D <24000000>;
> > +        };
> > +    };
> > --
> > 2.34.1
> >

Thanks,
Flavio
