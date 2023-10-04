Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8057B8368
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 17:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8B810E065;
	Wed,  4 Oct 2023 15:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CC110E065
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 15:18:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArJrNLZN82j8XZxk+vSxyQ5dTlcVSnu8rz4e+rqMvu2TdwPcefYsDJhAyDM6RwOXuB6VF7hjukSey2uqEMujgIEP7sbbtLH/wTk6wx+pBaqHhlUrqI1bCn2dHzCLa96JFF8j7uHYMtSV66LuGQ3wn3+eKwh7WzK94uiYoiRU0ZpIZ9GN/2y/tGA5iyIfaaoJZR7Qa+xnIOSbZ0PSDgugjAm4kSgegsn6Z1K5CJNM/R+4Ic/monKxt6o+GZb6ABxlOUudnAZT//z/n4OM2vFlLo8jrtzjgX/6jaN04kzJbSdLVos8NrjimAbb36/4MLIgpKwLIh8OSEVXqC9CrQA83w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7v6nDhaUwiuENxl9EW1PnekAKk8hpRD9elLSa6/VL8=;
 b=KK2+RskYVrIvX0PJwrxEixjUPXYS6G27Z3EBy4lEyV0wI8K+dXgnJvIxpcW7ktVivqRij+v8h7mjK5ynxH214SB6yRJhdjTuPINrks+EHNikI+//oIitZVmMK3g/hZ0SmNTaOTUxlevw5FRpZ2L3iuNaoiwiqTmYEjoJ7YNVk1J2qtcmZIkMCVouMaY0kyUI37WTAhZcEJNb2cB5slbKeYqu8M50XevoL8dQSX9AEEHCS8AeqeBV9JH94cERhT+Mx0PLxpwvlb2FFWJpCWP0cehFtqxAUb+OzGjpikLTzMa+yIdCxOF+r6FwN82GbzyJDngcT+2otfKqt1UoYWEEkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7v6nDhaUwiuENxl9EW1PnekAKk8hpRD9elLSa6/VL8=;
 b=HmrqRzbQjjRD25WELH1UE8JCxhqpD1D1mvQq4xP7PRPOCAh1cgy/IwkgH+YU1CGyUegseTlleM5hKs0Syno8HPktczA2fgxFX8C2O6mwwcko7xPAvizjuOudPx8HWjEwD6y0vpVEek57TQttyHEkADDJFzk1V50myRY82KRpMwY=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by DU2PR01MB8624.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2fb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.24; Wed, 4 Oct
 2023 15:18:24 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::ad2b:a1e7:8828:ba2f]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::ad2b:a1e7:8828:ba2f%7]) with mapi id 15.20.6863.024; Wed, 4 Oct 2023
 15:18:24 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: RE: [PATCH v3 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Topic: [PATCH v3 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Index: AQHZ76uO1Fb/EPNT/k67j1TrFzld37AtE7aAgAmVcBCAAT5MAIAAXgAggAGFVUA=
Date: Wed, 4 Oct 2023 15:18:24 +0000
Message-ID: <DU2PR01MB8034F17A9C81FE198CCAC5B7F9CBA@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20230925122609.78849-1-f.suligoi@asem.it>
 <20230926130113.GB4356@aspen.lan>
 <DU2PR01MB8034F448F6E66BAC3823CDB1F9C4A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
 <20231003102138.GB69443@aspen.lan>
 <DU2PR01MB80349344FB8CB1415BFA917DF9C4A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
In-Reply-To: <DU2PR01MB80349344FB8CB1415BFA917DF9C4A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|DU2PR01MB8624:EE_
x-ms-office365-filtering-correlation-id: f1d76810-552f-472c-4d02-08dbc4ed26f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /FM81apmaCf7eq3Xyj3bCLMFn/HdrQOTCfahjwIGPF4udy9anHX1ItWkT/YfLIPjxSIMLGhNl0ueZ+Xo/sfs19D7BI7cN2pTQVHlgLKvCRrR7XNjNJLT/zIJyVlJ9Y3LfsTSKCcOABl5mCBLj43ZJjQycaGNYH/duCyV1y9/uuKOuKaxuMdcdQfWd3/+6X1mxOpI9Xmc1gsYJ8YXsN1nF5Vi6kiRYydiMY3TXNCqWag//j7NUn8EzVu3gr7Hg/PmgB4dZNkE/RYUjugWZnc/k70F89nA6++fw58p6dfEECG/U6XY4jsSvZaXdcimKB0WripNgh38ZG2uGtjOdVAsLySB5fPd6QlMVjldlVSalhoEB/Lskjkfb9QJuqWSOKXVDCc7KGICqVuQskykVygIUkYq0CBCnTrd6//1srdA53/a11wOIV0jfb4YeJryMKd/CDpcJTEcNf5lt9m2K3ZsJr05LP7QPN2jclqNh3X7oaruLt2STWiuUQ6xeRPL/PQZzaCRcrYTKhJM4kdhGZHhnWeM5u4AZgI7/fka4p75EXFgWmftCQoeNfIBMfRFjflyKYmKai+aHuNrusn8C9PZygGyVSaO9srTc9M2NEU0naX94dKMsKKfalk435pKRVYM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(376002)(39840400004)(346002)(366004)(136003)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(71200400001)(26005)(478600001)(6506007)(7696005)(9686003)(76116006)(7416002)(4326008)(2906002)(8676002)(64756008)(8936002)(54906003)(66556008)(66476007)(52536014)(66446008)(5660300002)(66946007)(316002)(41300700001)(6916009)(122000001)(33656002)(86362001)(38070700005)(55016003)(38100700002)(66899024);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6UEWUcpwBy8EkfaPEZDemwfL1c/HBfplVlUTc3qG0OvjDRMuUAspoo/R9iDE?=
 =?us-ascii?Q?UTt+z9yRJXdm/ybTwyWZDmfJdHsQg/Bn94LaYQdsVFdKwKs1yw1vPnyO0sqW?=
 =?us-ascii?Q?JBk4l2SMEQSTNwQLxT6rKO8SJnpHp2ZbcHxRwz9USkjF5r47YBJhAxD8mgCd?=
 =?us-ascii?Q?ShSGxXq+hfNv35V3/R0OplzBcK6iHdHNyHWEb5OBEjmoFxn5kLubPmGhJDHN?=
 =?us-ascii?Q?kh4wMBFr33TefZf617GyztdPUjUgpqCnVxt3jwPCfHJ92keF2hjJmfZH6sRf?=
 =?us-ascii?Q?EUcOssyNeA7skollrXNR1nThE7t4sj1vHryHr0Cmy6ll2euhZWD+DHaLfYZF?=
 =?us-ascii?Q?IgFsRWE4VCS5kC3ve5vkz1/TeO30/QvzqrHOhhPWPS6YHtbZNN72yXhMGVMS?=
 =?us-ascii?Q?1ZH1QX8TwX6xyLRjrnXRoNCGWLdNh5tw8+j9+uJcWvoatRoPyp1niVFVf8fT?=
 =?us-ascii?Q?rkuZN34YuhBujYpHwXskJD2Y3fsQZ8Bj8IW4g52i8tcfiR9C8ahIIJx4Wgfw?=
 =?us-ascii?Q?ZM4cQIfPO3T/BfP2v0GoGcauW6I2rEZMCx984XXfwQL9Ubg4AW00UOMsrtIO?=
 =?us-ascii?Q?EtNuRTqfpGW0mpv4FcrWgSOLe9zl3NTXfg7+3ZPxAnGL5vQbBsskE98pxMbK?=
 =?us-ascii?Q?7+QSC3TArcog4O5I8SUOY/BPFy937gZfT4nmmle5WSc1V6Df+L1BEdVDlOgV?=
 =?us-ascii?Q?WMmcOXGiJP9p3B7TmoVuX6R08Nep2LB7DbltpBMwLDebz0BOaMGAt6pn7ID8?=
 =?us-ascii?Q?/i4d9AytWoFzu6RjKQUO5IVzLnhg++VPd52CTMEViJDfRpi3J/6eR4wGTSNS?=
 =?us-ascii?Q?J9oG7+BjBMM+7tug5njju8atMy5y3idwbim9sePvB7Ej1uzZNdmAEz9Jqcq1?=
 =?us-ascii?Q?t4X8wDSvVmusjzVEsdLcW7NWd5EzHa9CsX1L6fOiFNf81k4BEd3EkZs1dkBZ?=
 =?us-ascii?Q?vt+1wzA07pb5d3i+5l+zaw9U602VMLYu7jbr47dCZfCc+Y/DO33xi9Ezvdd6?=
 =?us-ascii?Q?CnaLmTUWyLbEccEklh1U1bf352b/2+QW7QwV36nZ61PT2NTecQJQIHIXFq9K?=
 =?us-ascii?Q?4heqB64ZxikNz+lkBVWTXuefPFj8yTjSUMO/5lrIpgqD8uVQZLaBezr0H8vW?=
 =?us-ascii?Q?KeBvCnYSP0zoISjeruQSMEjJoL0t0x6Lw8QC6nnfwHYWLZ09yKaeluMIIkoo?=
 =?us-ascii?Q?lmSknwfS7sdMeNkp8zxgLKlWW5+rQGELEIfX5Hfs/U/YxfIqhPbFxx2nqZou?=
 =?us-ascii?Q?PCQ76C0ev2v/dFiBZmMD5XqaXTFQ9l+Ss7Na/kJ6A9y0rNbN47us3/8fwubm?=
 =?us-ascii?Q?SBoFgvhY/5MSl39m+up1Y8hTa/zGgwxVJOCPqMsNOaKcAyzPqyAbdx9C0ROs?=
 =?us-ascii?Q?ioeR1oRU5Hlsti2nuLxVj2e9o7wwAS5jIR8A9PXIVsQTyX0A5OzJney/X3Fy?=
 =?us-ascii?Q?vW3cKbT6GPqI7CGwpVpxxdK1WmsVZ0hKQGqznmczLsbQ8QyrBjbu82MU2g0e?=
 =?us-ascii?Q?oV5FC113sUWzE1x1aMooT2Mryi2RVGqjIFAWN39Yp48qLYuOafsF5Zgf/TtV?=
 =?us-ascii?Q?yl4/N5RGoRk8YgY8zrs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d76810-552f-472c-4d02-08dbc4ed26f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 15:18:24.2081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b8Is2HQx+mpw1c858+TDKKPVpMQJ3pBKtFUZ+QCeOR9KL+QwJTygVBfLDXwY/hvbuEn5HbceRA3tk7ZCGX+9EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR01MB8624
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
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,
...
> ...
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - reg
> > > > > +  - max-brightness
> > > >
> > > > Why is this mandatory?
> > > >
> > > > There's no point in setting max-brightness when running in I2C
> > > > mode
> > > > (max- brightness should default to 31 in that case).
> > > >
> > > >
> > > > > +  - default-brightness
> > > >
> > > > Again. I'm not clear why this needs to be mandatory.
> > > >
> > > >
> > >
> > > Ok, you are right, I'll remove max-brightness and default-brightness
> > > from required properties list. I think to change these properties,
> > > for the pwm dimming, into a clearer:
> > >
> > > - brightness-levels (uint32)
> > > - default-brightness-levels (uint32).
> > >
> > > For example:
> > >
> > >   brightness-levels:
> > >     description:
> > >       Number of brightness levels. The actual brightness
> > >       level (PWM duty cycle) will be interpolated from 0 to this valu=
e.
> > >       0 means a  0% duty cycle (darkest/off), while the
> > > brightness-levels
> > represents
> > >       a 100% duty cycle (brightest).
> > >     $ref: /schemas/types.yaml#/definitions/uint32
> > >
> > >   default-brightness-level:
> > >     description:
> > >       The default brightness level (from 0 to brightness-levels)
> > >     $ref: /schemas/types.yaml#/definitions/uint32
> > >
> > > Example:
> > > brightness-levels =3D <10>;
> > > default-brightness-level =3D <6>;
> > >
> > > What do you think about this solution?
> >
> > If you want to introduce a brightness-levels property then I would
> > expect it to be defined with the same meaning as pwm-backlight (it's
> > not relevant to the bindings but ideally it would be implemented by
> > refactoring and reusing the code from pwm_bl.c).
>=20
> ok, I'll use the brightness-levels property as used in pwm-backlight
>=20
> >
> > Same with default-brightness-level although I'm not sure why one
> > wouldn't just use default-brightness for new bindings (doesn't
> > default-brightness-level simply do exactly the same thing as default-
> brightness).
>=20
> ok for default-brightness instead of default-brightness-level

Just a question: default-brightness-level is the index into the brightness-=
levels array.
But, if I use default-brightness instead of default-brightness-level, =20
should I consider default-brightness also as an index into brightness-level=
s array?
Or, in this case, have the default-brightness to be equal to one of the val=
ues inside the
brightness-levels array?

>=20
> >
> >
> > Daniel.
>=20
> Thanks an best regards,
> Flavio

Thanks,

Flavio
