Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7B77D4909
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 09:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A8710E2EC;
	Tue, 24 Oct 2023 07:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F89210E2EC
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 07:53:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZ4DMiL8MDikIFL5YpF3o9t+tTHmMZuNTkQzC2RX6SUm7JSaJ/SwmsqOSgiAb8VYaiBOI0dC5dqm6On7HFT0Bd+0M3RFhdOSNwbRvA+YLcevDruYVGghri1heuKTqaN+sKxyWs11VpeBgilEThz2kZPXs+2l5tT95SZEJwS/aLb7DshkvMBOc4lqi5rcLNd4fqhus073694JmIltiyVukGpTVEaOXYJECLRdmgJbplGerWmtsoguptY5vHBzHVY9X7FO1nzfajj1MdVdmud7mh271wuiFKd4luARgjFim9q8yEBym1uTAsQmN62pD97D0Wq9OHE98CAou8qeDP1lrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYC4gXUapCd9Z0fR61JtnrX4Tkcoc8jdmUIcOTsbrY0=;
 b=SXYfsWZCXkD+AJU2+B/2Z3EpxMzmMPS209o6EyKu1qyo2cgv66PpIwQmuJNDmWNOgJmPtSFHkWkLNjoQr+IsSKabTJrhwnxkrFrSYVOMXCJ11gvUlr2qU3GDI/kaOMJqSS/kZyx1jODZJykLbefTigIR1S17rboYCJ4XqhyfFW6xZFAcoXi7L/bvurUpVWQKBxEnEzxS084r/Wal8yQaqr3chHFHb3Ph2XHaviR35yO4qmfTG2fs2lcGGlQwdMuAz+hY9oEgOkqjvTGAqiStsFlC7JNiroomp2tFM2waTBD4314nyVRAOhv9RyKiJNRDyRQtbMfDDNxiR70wZtKuAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYC4gXUapCd9Z0fR61JtnrX4Tkcoc8jdmUIcOTsbrY0=;
 b=VajzmsHvIzr1huWSP2w+Zs9pfsNvttWoD6dvWuO+/eOwyn7DftG1e+TA4qpN5qOYsDXaj9JPJlw7BCYFVx2pgw09fzrUvOwXlBjNE5OHwUGhE1MP4wvpefvSPbViRnXQVPQEznlqT92P5ha2loQw4Ksv3NmX2MKLCeb5MUhK1x4=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by DU5PR01MB10437.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:51c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 07:53:39 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::ad2b:a1e7:8828:ba2f]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::ad2b:a1e7:8828:ba2f%7]) with mapi id 15.20.6907.032; Tue, 24 Oct 2023
 07:53:39 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Conor Dooley <conor@kernel.org>
Subject: RE: [PATCH 1/1] dt-bindings: backlight: mp3309c: remove two required
 properties
Thread-Topic: [PATCH 1/1] dt-bindings: backlight: mp3309c: remove two required
 properties
Thread-Index: AQHaA10IhwE5ZkDArkS4RoPMFlMBm7BS1g+AgARFCACAAHpeAIAA+0AQ
Date: Tue, 24 Oct 2023 07:53:38 +0000
Message-ID: <DU2PR01MB8034CF8EE4358B9446809AA2F9DFA@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20231020135434.2598578-1-f.suligoi@asem.it>
 <20231020135434.2598578-2-f.suligoi@asem.it>
 <20231020-moonrise-senate-86d0edb2d404@spud>
 <DU2PR01MB803498DFD93E82DD3947D72DF9D8A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
 <20231023-anybody-silver-4548023f8f26@spud>
In-Reply-To: <20231023-anybody-silver-4548023f8f26@spud>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|DU5PR01MB10437:EE_
x-ms-office365-filtering-correlation-id: 61f1a778-2b52-4e1e-a847-08dbd4665584
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8SqwiEzDN4yTM3ylh4hwMdtNKMG1R2RDeNhC9o+eIdn5/3/jOXh3lbbOuWfGXWa2FCyDell0UBxSbL8t/3QQb6cK/j6HO9xpy3EGNovvbf5s9stPLXjXZCE6v8lyiLmFdGM5yIv3065/HDNU3ZKDSfZpQbaJHdGIRdXP2mFSmRS0CS7fOeupE2qzWUsVXqNF8/PGmRpQsZZtKXN+f6ycWLIxkz8c2e4hk6vY8ygZVvrnKnkseWQyCgDYOChxC2oS+R2wL/2NEXOQMFqiNWd/EdzWGI8IDrrZgb2XqVfwhmOg8n1bITUTzAdOgSVOdlJqsKHNHOfveb7OQlH2gcd69GJVgR+s7k4bq3/IxpSm3VykrmsmahkrAIqbTlPHf/FZPf6D6hVIFeZoeT1aNi5j85j/dOes1zo1jBj01aHgT1hBQJSJ5FZQ5zmUURLIiMm+GVNJ2VWuaRswIppx+YeTqOVXszSBYOanj24Gcmlh+utEOjdZqxasKHhxi559Vyh9CQISjCr8IBKNrZLAvWnkWdTtu7gnPzZGg9cP+Y9j9CdeqHQ/Xq7GP0wihgbX4nyTMmwmRdaOkhX1b2xfx8OBnZLEdqVyKyJIErw9okwSD+I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(366004)(39850400004)(396003)(346002)(136003)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(86362001)(55016003)(2906002)(38100700002)(54906003)(122000001)(66476007)(76116006)(316002)(66946007)(66556008)(6916009)(66446008)(7696005)(478600001)(71200400001)(6506007)(9686003)(966005)(83380400001)(64756008)(4326008)(41300700001)(52536014)(5660300002)(7416002)(33656002)(8676002)(8936002)(26005)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eTdYAe98Ptx3BfIQCc5GgZBJ0ElOdhCrWJ9HGFE+wdGBUvUe9ll6LjYNRBax?=
 =?us-ascii?Q?iYqObZlGpaa8L9OeBcbc419TBnEkO5upi34lsCDQXEx6McrFz/TFil0lcYue?=
 =?us-ascii?Q?WT8UUg7M80fx+/hII7c+divAK3ln23TuWdN068rgKwPGqY+0LLeHZWVrRa6a?=
 =?us-ascii?Q?7x3bccuE5T6S8MUnt+XEgcoq/0/poI8eTSYCYRop8aIdzq8+5V0CmF1BpGrs?=
 =?us-ascii?Q?zrFsUVII99nf3imAG0wZz2PDOrGLN7V+WS89VEjgoWM5uUrGutMhRY1dScqS?=
 =?us-ascii?Q?M4H7tyn8A9ypHkG8SBq0Iz1kWkx4OYG7tNHTQ1qHHMNX9I6uRgGRFt2z64N0?=
 =?us-ascii?Q?Toq/2QmHegrI160EVkATu/gyv4f5N/vPMfBMxOg0nq5EIC9t6oDl9MJumJu5?=
 =?us-ascii?Q?aIZJ2jkpAIlQg3Cdp9J1ioJxSlL+LuRqUpOndvaJeq8q2VEHN2xsHu5NpHCO?=
 =?us-ascii?Q?CdjIJnsw+gywtrFEcdJIQldb89jQWCv2QbAiaZB3fjV7GJGnbj32g8wTOtGk?=
 =?us-ascii?Q?RjcD7n9TAYKDFoYIXFz/6GTLkaRlI3Imj9fBZUpwmoe8+00YSbmum4NKa+Uj?=
 =?us-ascii?Q?ycoxXWCauF6cPd+G1CFc3Y23l+iFGZGCkmRAmrJ5/GLmq7TWYKGTV15OOSba?=
 =?us-ascii?Q?PtUaJHGCxjFy+mPfZkYC0FEyc4b6xy1KqvgMDibSus00zBE/YepS0piCp40J?=
 =?us-ascii?Q?aIZNlb14XO1zcEuDoCCtu/RhaM1p/WvKhmQUe1tBjTz2gw4ij+kZvpgGwTHt?=
 =?us-ascii?Q?/xI1xWjFynX5Rc3aAJYB9y57sZrnRT0w4CGGweA/YF/r4FuOWwmg38i8KHJf?=
 =?us-ascii?Q?Pwhv45fMqb38f8QpzqfTYHub0J3fZl1WdJKahck/PsJwn+B10Hr6VyP7YkFc?=
 =?us-ascii?Q?rO5CeDqePgDzSHsKMEulv8aRedI8vXEW0pVa5Z3y4iRJ1w0ckCuNDFwLbqzx?=
 =?us-ascii?Q?EeIwz3ooOSAP2edgU1/CZ4YlhGV05Ezi43gRVxXIL2At0KGUIrJIFz9m+BKm?=
 =?us-ascii?Q?LBWK55MnBPwo4shVN/afRIVT0xkbR55NHE4vcBrjgvA5M8h5uEE8VXxlDvii?=
 =?us-ascii?Q?zEBZcVr3i5JtGn5Y+n29pBKlCUSWWuuukCS4AvA1hyfMcwN/4vp0QVabXupM?=
 =?us-ascii?Q?1o7X++eKwzXG46D8eYWFioVhS0RCDuoahjzcMRSYZG7O/GObtgIHFC6JuUHF?=
 =?us-ascii?Q?3+NRKqfGpWQQYWxTLXKQL0GtoIOXcImTsb/iBPBFQuFJN3lGhHrXBni26znw?=
 =?us-ascii?Q?08KPtbn1N7T6/w4hyBTQmsNo+OvPXfEdbfc36S5yGBd7NdYHg0zwt/5aVx5m?=
 =?us-ascii?Q?cuGPxIA38gD4pAvrSfoarTL/d+JfuTSmdPXS9fqkyo0DnJ4hFnOVTGuLlIQq?=
 =?us-ascii?Q?PqdJHnbfxn31lmpf6f6JJDDEA0LKV2ud++wGkNZIZhyEuzSGeJPFo41S06r2?=
 =?us-ascii?Q?lpueSYeZmM4QY0zsrUXMp8KjmK/jWe24YbShRNsIHWR5mg7KehAtLnXBmKqD?=
 =?us-ascii?Q?XOGz3WDoTPm9HHmcUrlajGik89M7QSJZfMTb+02sXOn2k+m6PwVKyiBkJV/q?=
 =?us-ascii?Q?gIBJs6M7F6a8wxps9Do=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f1a778-2b52-4e1e-a847-08dbd4665584
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2023 07:53:38.9415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zn7Ihj5jUvFsPcsKbU7uKFAhPS3VFhYMJ8qWNIS34BkQ++RuFBLZV4k2jVZaCriKZwHuxGNxZ2o/c2bZMLb1gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR01MB10437
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

> On Mon, Oct 23, 2023 at 09:28:03AM +0000, Flavio Suligoi wrote:
> > > On Fri, Oct 20, 2023 at 03:54:33PM +0200, Flavio Suligoi wrote:
> > > > The two properties:
> > > >
> > > > - max-brightness
> > > > - default brightness
> > > >
> > > > are not really required, so they can be removed from the "required"
> > > > section.
> > >
> > > Why are they not required? You need to provide an explanation.
> >
> > The "max-brightness" is not more used now in the driver (I used it in
> > the first version of the driver).
>=20
> If it is not used any more, what happens when someone passes an old
> devicetree to the kernel, that contains max-brightness, but not any of yo=
ur
> new properties?

This is not a problem, because the device driver has not yet been included =
in any kernel.
My patch for the device driver is still being analyzed by the maintainers.
Only this dt-binding yaml file is already included in the "for-backlight-ne=
xt" branch
of the "backlight" kernel repository.
At the moment, this driver is used only in a i.MX8MM board produced in my c=
ompany,
under my full control. No other developer is using it now.

> > The "default-brightness", if omitted in the DT, is managed by the
> > device driver, using a default value. This depends on the dimming mode
> used:
>=20
> For default-brightness, has here always been support in the driver for th=
e
> property being omitted, or is this newly added?

In the first version of the driver this property was a "required property",
but nobody has used this driver before, so this should be not a problem.

>=20
> > - for the "analog mode", via I2C commands, this value is fixed by
> > hardware (=3D31)
> > - while in case of pwm mode the default used is the last value of the
> >   brightness-levels array.
> >
> > Also the brightness-levels array is not required; if it is omitted,
> > the driver uses a default array of 0..255 and the "default-brightness" =
is the
> last one, which is "255".
>=20
> Firstly, this is the sort of rationale that needs to be put into your com=
mit
> messages, rather than bullet pointed lists of what you have done.

You are absolutely right, I'll include these details in the next commit mes=
sage.

>=20
> Secondly, what about other operating systems etc, do any of those support
> this platform and depend on presence of these properties?

I used this backlight driver in our i.MX8MM board only, with Linux only.

>=20
> >
> > > > Other changes:
> > > >
> > > > - improve the backlight working mode description, in the "descripti=
on"
> > > >   section
> > >
> > > > - update the example, removing the "max-brightness" and introducing
> the
> > > >   "brightess-levels" property
> > >
> > > Why is this more useful?
> >
> > I introduced the "brightness-levels" instead of "max-brightness" for
> > homogeneity, since the "analog mode" dimming has a brightness-levels ar=
ray
> fixed by hardware (0..31).
> > In this way also the "pwm" mode can use the same concepts of array of
> levels.
>=20
> What I would like is an explanation in the commit message as to why the
> revised example is more helpful than the existing (and
> must-remain-valid) one.

As said before, no one may have ever used this device driver,
so I would leave only this new version of the example.

>=20
> Cheers,
> Conor.

Thanks for your help and best regards,
Flavio.

>=20
> > >
> > > >
> > > > Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> > > > ---
> > > >  .../bindings/leds/backlight/mps,mp3309c.yaml           | 10 ++++--=
----
> > > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git
> > > a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> > > b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> > > > index 4191e33626f5..527a37368ed7 100644
> > > > ---
> > > a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> > > > +++
> > > b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> > > > @@ -14,8 +14,8 @@ description: |
> > > >    programmable switching frequency to optimize efficiency.
> > > >    It supports two different dimming modes:
> > > >
> > > > -  - analog mode, via I2C commands (default)
> > > > -  - PWM controlled mode.
> > > > +  - analog mode, via I2C commands, as default mode (32 dimming
> > > > + levels)
> > > > +  - PWM controlled mode (optional)
> > > >
> > > >    The datasheet is available at:
> > > >    https://www.monolithicpower.com/en/mp3309c.html
> > > > @@ -50,8 +50,6 @@ properties:
> > > >  required:
> > > >    - compatible
> > > >    - reg
> > > > -  - max-brightness
> > > > -  - default-brightness
> > > >
> > > >  unevaluatedProperties: false
> > > >
> > > > @@ -66,8 +64,8 @@ examples:
> > > >              compatible =3D "mps,mp3309c";
> > > >              reg =3D <0x17>;
> > > >              pwms =3D <&pwm1 0 3333333 0>; /* 300 Hz --> (1/f) * 1*=
10^9 */
> > > > -            max-brightness =3D <100>;
> > > > -            default-brightness =3D <80>;
> > > > +            brightness-levels =3D <0 4 8 16 32 64 128 255>;
> > > > +            default-brightness =3D <6>;
> > > >              mps,overvoltage-protection-microvolt =3D <24000000>;
> > > >          };
> > > >      };
> > > > --
> > > > 2.34.1
> > > >
