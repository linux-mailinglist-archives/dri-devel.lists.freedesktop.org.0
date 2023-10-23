Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87327D2DBC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 11:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA5910E1A4;
	Mon, 23 Oct 2023 09:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E6A10E1A4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 09:11:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTrIF0gg2KsUOjC8Lic9HuHJuSp3uM+PRlFBC0wrBIwh6e8fyrIrPB9FhyBU0Klu5Z4Mx6zxOIS3rxsyQSu0N5GN3/jGuxRMfjKWIp3qfEM6BpIh0mX0TIRs5AQceqzmsFoUGIz78WG5FoiMI/uF7XQe4mGMCSjhmyCDJRMKehdbTTAYcxyHgQV/qSkg8o4Bxq+YUreCHkptdR7eARHmN9aofpSiRZqSJ4PTlWH2fwoUzgSmk6YJkEtCjUc3gllB/QfFHzjDe25yAXyMhix91gDUDaR1xY0WPGZ3luDUY1G01rHQaIxDki7NZ+ZTtoO0zpzWKW2pK5ctyfvTCoR/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ourLwKHy55r8YMD6kXF6QxyM1MM18bTxiDnsaJdODYY=;
 b=XNDLWWA7XwjfYqTUKd01EsSpLfKRUP8VBC05icfwCt331nfqsQKO+jvSxzG4XzbTVfnIm05qCbBSZdPrGyXu8UHVl/Sl+aGqF9+5HmwJNWepVRuoQvfMM9FEwENZJFwZlRK0dhEUV9sniUccLZOUa18HFpjHGTniJ9Kd5cErLT2Ygt9j3tXtsexuqa1Z9h2U8wpF9eVCQsPO0dFdLe6M0f2rZv2Io8xRSf+QUrVwHSsyXVhW+DDx31MI6HxJBVLQcb+1wgsCutRCGV+DodT2mLR3uEz+bUqWS75AlIvYMBOw6ikrW7kcS1l27P9QLOcJymQETYqfu8uphEjGJjesjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ourLwKHy55r8YMD6kXF6QxyM1MM18bTxiDnsaJdODYY=;
 b=KuvUkgi017iU0HgprRxdnA/y1OXXJ/WfJt95/Yr+tM1slm/AS5qudXdPWA9Uq8GvIhtptF+a9I9k+gDg6mOqP6+v5wT6se1uxzeEXD2JR/n1tPf1hYjJOuQvydSXHPpytS2yLZU2mn4OgXtCKS2EhyGoMg9fi3rGZvs/G77JSwk=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by DB9PR01MB9295.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:364::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 09:11:16 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::ad2b:a1e7:8828:ba2f]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::ad2b:a1e7:8828:ba2f%7]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 09:11:16 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Conor Dooley <conor@kernel.org>
Subject: RE: [PATCH v5] backlight: mp3309c: Add support for MPS MP3309C
Thread-Topic: [PATCH v5] backlight: mp3309c: Add support for MPS MP3309C
Thread-Index: AQHaA10IGWVGksymQEOivhmPwvnfu7BS1VmAgARDJYA=
Date: Mon, 23 Oct 2023 09:11:16 +0000
Message-ID: <DU2PR01MB803407D29922D56E34D65ED4F9D8A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20231020135434.2598578-1-f.suligoi@asem.it>
 <20231020135434.2598578-3-f.suligoi@asem.it>
 <20231020-esquire-rug-24a27fb72314@spud>
In-Reply-To: <20231020-esquire-rug-24a27fb72314@spud>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|DB9PR01MB9295:EE_
x-ms-office365-filtering-correlation-id: 8bf5eda1-572b-45a8-bd77-08dbd3a80347
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AIUQ8yGBQ2EjSxfVh94U/JPch5DvgNO3AUgFMOULLAHaMOgZ/tXga2UNhdXb26MtAA1ZF/CelqziPJgV/0tHR/FS1LmhVbqseeYYiC1cYlriRweGliMHae1/VzJ/Fk6U11XUffjoo2pxUzOQNWSbfOv9NBnKtR8v62efB9ohLIyURY6Wl4/5Evs/iWARqcgPEuuwHCxUCIDWQCVy3wH6SfX1ZYh0uXuWMgBACbudnhRTYr0HujahkTRZd5xpKAOF/8UKVAsTacw2iKDlnLGQso3780zu/ujzR35N5qkbiW89tlwxi+MTsnFkel23Un0Js0klK8jW/3/F8w/09UxYR/oLZDwiLV8+U8XlUbRdXAdlR2j4ZvOSw1PinXgDxB+zJ2Qrk4Qd1BTQ4MXC122yrpf6jFVw60XhUu+U75bzGaIvawoShDnVeToBb+ADpEBoN8rBt303znOddK3GAz9iXGP14crYf12jxW/fsyo6weMQ4SNsJpb2jsJEEE8x4jL6Y4145uIJfo0O5yr5OcQDv6ae+aIYu4Df3KMe6jARGQIcdf6wpQGRJ0pAcJSrxhz7sIBHxuIP+eoJoitk4fev3cpcCHc5HBJe8aMjA6xg71o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(396003)(136003)(39840400004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38070700009)(2906002)(7696005)(6506007)(9686003)(38100700002)(122000001)(86362001)(33656002)(26005)(30864003)(7416002)(71200400001)(478600001)(966005)(55016003)(83380400001)(41300700001)(8936002)(8676002)(4326008)(52536014)(5660300002)(64756008)(66946007)(66556008)(66476007)(66446008)(316002)(6916009)(54906003)(76116006)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9nHz/327KMwx/3gCH5Ouv3e0jCEQoEBaN2xmpxjsLPQCHiJLfMFb+qneoeE2?=
 =?us-ascii?Q?vEK10dQRkxgG6JGVMuYgkDYdy2+FYmISG9/TzKS9LuoTlhRIiMypsBe9koPd?=
 =?us-ascii?Q?om5oa9prqB9S6ufXUxadhIfMYNsLOKCfQrWIlQpa20kQ/+9ODlyhOwX9v0jQ?=
 =?us-ascii?Q?trJ+xdV6Cs32z4m5aDYeKnf+FFnL3KvvRKyNnnOk739NSv++oJPJLyxHtWbz?=
 =?us-ascii?Q?KXzxfW3uZM742ASasI+M8dgzKsklt0sfQT+uZOdLHD5soa8ITu81EpFM1bCD?=
 =?us-ascii?Q?wdlKAzRkwaAht7WOGcEX0k8Bz+ioVG4Iw9D1zUACdjYJP7rQKTGzeqLSHeQ9?=
 =?us-ascii?Q?89QttBGWiPmiXyOS3RIDKmVKb0pnK0dr3uCu1++l/FHHGp7SjHBCPBoztwXU?=
 =?us-ascii?Q?CtuFOS3rx+Zyth6vQ7xJZ3IS4/fQaHugeFNcqe1CGbcpXJBeXK3Y9Z2+J89b?=
 =?us-ascii?Q?FcNampvEFXK5HXoLz5V2rGFXG1hZaSzgNdwJyT0kTFfsW8VaV4loNVC2NpzC?=
 =?us-ascii?Q?YSKaqniHs9skX7hwsdtaHjgpixnxWbxb+iPbi6bPH2iNe/HZ4JoFplYF+qtG?=
 =?us-ascii?Q?85+eeNaG27yGJ92zWZef20j3gZnmcwzsh4BzQ3jfGEgbC69upr/EY6SdB8FL?=
 =?us-ascii?Q?ECPFOmB2+JIKU0k9IiZazRmYYVoRPXQsWy/gm3JH2O/weQHbQnET/i4E402I?=
 =?us-ascii?Q?ZkWhTaKRYuO4T7A8MJ0QyauuG7yTmaQ5ODl3QRDdn9X825h9zNErVTjQl0eQ?=
 =?us-ascii?Q?U9yHooGjPfVdUlZgt4GQdaODKAmz0aH/GBgsGZpYu7R8tImzyLrXuWVhKYUG?=
 =?us-ascii?Q?CDSTkRBVFEof9n9G4c5tHmhjJJ+jkOAo4rU+bGK6XHfrwo2wpFP53xy/DD4z?=
 =?us-ascii?Q?YuYqQDDpBXxtzKnC9GIQ5osE1IvF6fwUeQ2wCdMbRLDO5164KFg5WINxDcxd?=
 =?us-ascii?Q?ymcr8p3lqV+0rTNnqU6Ab6CAMgkNdf+/3uR2XSDjFr8YcnH3HjdEISTA0965?=
 =?us-ascii?Q?ov2pdlkC4TyumDvyHqe4HF/68g2tKG2GOl3gA0d/hMchsVTTzYnh39w1Pi3/?=
 =?us-ascii?Q?d2tZnrp6He8GVgA3A6nXoipvaAvXWDDK6eyPwJ0BOdl914VNVvR/Vkqx/2CV?=
 =?us-ascii?Q?38aV/oRY/qdh7llckip0DyGtVkag1sWZ5ONA/Fw637VlBlUTERrszJMqNWA3?=
 =?us-ascii?Q?sCUPmUHTwA1R/cvnUIGgpqDhHHHOQ4dYjLmoRGZdxGQJhAck3Q1AH4CRfz0T?=
 =?us-ascii?Q?HdMsXWYpQmfOSRK7Mr4NF4csa2dJs5jGYhMnPCWFoolRvR9nAhiUUvNJHuew?=
 =?us-ascii?Q?inTwBGCk7EqvHtLIacIaPCT/oUpqlbfuqSaIF/13MAbuXpejmJasyACIP75k?=
 =?us-ascii?Q?13B397bl1sjPJSC4/cV8K6uTyCQHX90P3XXQ2J+IwGIRMfXRaTJuHXFiAkup?=
 =?us-ascii?Q?N7D/Sgv37vXKxj6s0FooE/Nl2RasjWL4vOivXJ5UyBfjbflRfpsRbma1D17M?=
 =?us-ascii?Q?eV0QlbvW9udxzvAe7yTCwWDC+IsHZeUuhumNO/qKDSwqHtbHmGWNATnzL59Z?=
 =?us-ascii?Q?oJhFDaGbUvgoiQDG3nQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf5eda1-572b-45a8-bd77-08dbd3a80347
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2023 09:11:16.5838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0VmvGNKBw3w2Q6wEECDmYKzx6YhDWneggvJAeMBhzyiW5lA0/p1BIDoK0nzURZG9pgFTOEvPxdRMRc1q+wvRWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB9295
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

> Subject: Re: [PATCH v5] backlight: mp3309c: Add support for MPS MP3309C
>=20
> On Fri, Oct 20, 2023 at 03:54:34PM +0200, Flavio Suligoi wrote:
> > The Monolithic Power (MPS) MP3309C is a WLED step-up converter,
> > featuring a programmable switching frequency to optimize efficiency.
> > The brightness can be controlled either by I2C commands (called "analog=
"
> > mode) or by a PWM input signal (PWM mode).
> > This driver supports both modes.
> >
> > For DT configuration details, please refer to:
> > - Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
> >
> > The datasheet is available at:
> > - https://www.monolithicpower.com/en/mp3309c.html
> >
> > Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> > ---
> >
> > v5:
> >  - checked and resend for updated kernel 6.6.0-rc1
>=20
> Why is this v5 patch attached to a 1 patch "series" that only purports to
> contain a binding patch?

Sorry Conor, what do you mean for "binding patch"? The cover letter of this=
 patch or the
other patch about the dt-bindings for the mp3309c backlight ?

> Thanks,
> Conor.

Thanks,
Flavio.


>=20
> > v4:
> >  - add brightness-levels property
> >  - force fixed 32 brightness levels (0..31) in analog-i2c dimming mode
> >  - remove useless irq and reset_gpio from mp3309c_chip structure
> > v3:
> >  - fix SPDX obsolete spelling
> >  - in mp3309c_bl_update_status, change from msleep_interruptible() to
> msleep()
> >    and improve the related comment
> > v2:
> >  - fix dependecies in Kconfig
> >  - fix Kconfig MP3309C entry order
> >  - remove switch-on-delay-ms property
> >  - remove optional gpio property to reset external devices
> >  - remove dimming-mode property (the analog-i2c dimming mode is the
> default; the
> >    presence of the pwms property, in DT, selects automatically the pwm
> dimming
> >    mode)
> >  - substitute three boolean properties, used for the overvoltage-protec=
tion
> >    values, with a single enum property
> >  - drop simple tracing messages
> >  - use dev_err_probe() in probe function
> >  - change device name from mp3309c_bl to the simple mp3309c
> >  - remove shutdown function
> > v1:
> >  - first version
> >
> >  MAINTAINERS                       |   7 +
> >  drivers/video/backlight/Kconfig   |  11 +
> >  drivers/video/backlight/Makefile  |   1 +
> >  drivers/video/backlight/mp3309c.c | 443
> > ++++++++++++++++++++++++++++++
> >  4 files changed, 462 insertions(+)
> >  create mode 100644 drivers/video/backlight/mp3309c.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 90f13281d297..3d23b869e2aa 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14474,6 +14474,13 @@ S:	Maintained
> >  F:	Documentation/driver-api/tty/moxa-smartio.rst
> >  F:	drivers/tty/mxser.*
> >
> > +MP3309C BACKLIGHT DRIVER
> > +M:	Flavio Suligoi <f.suligoi@asem.it>
> > +L:	dri-devel@lists.freedesktop.org
> > +S:	Maintained
> > +F:
> 	Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.ya
> ml
> > +F:	drivers/video/backlight/mp3309c.c
> > +
> >  MR800 AVERMEDIA USB FM RADIO DRIVER
> >  M:	Alexey Klimov <klimov.linux@gmail.com>
> >  L:	linux-media@vger.kernel.org
> > diff --git a/drivers/video/backlight/Kconfig
> > b/drivers/video/backlight/Kconfig index 51387b1ef012..1144a54a35c0
> > 100644
> > --- a/drivers/video/backlight/Kconfig
> > +++ b/drivers/video/backlight/Kconfig
> > @@ -402,6 +402,17 @@ config BACKLIGHT_LP8788
> >  	help
> >  	  This supports TI LP8788 backlight driver.
> >
> > +config BACKLIGHT_MP3309C
> > +	tristate "Backlight Driver for MPS MP3309C"
> > +	depends on I2C && PWM
> > +	select REGMAP_I2C
> > +	help
> > +	  This supports MPS MP3309C backlight WLED driver in both PWM
> and
> > +	  analog/I2C dimming modes.
> > +
> > +	  To compile this driver as a module, choose M here: the module will
> > +	  be called mp3309c.
> > +
> >  config BACKLIGHT_PANDORA
> >  	tristate "Backlight driver for Pandora console"
> >  	depends on TWL4030_CORE
> > diff --git a/drivers/video/backlight/Makefile
> > b/drivers/video/backlight/Makefile
> > index f72e1c3c59e9..1af583de665b 100644
> > --- a/drivers/video/backlight/Makefile
> > +++ b/drivers/video/backlight/Makefile
> > @@ -44,6 +44,7 @@ obj-$(CONFIG_BACKLIGHT_LP855X)		+=3D
> lp855x_bl.o
> >  obj-$(CONFIG_BACKLIGHT_LP8788)		+=3D lp8788_bl.o
> >  obj-$(CONFIG_BACKLIGHT_LV5207LP)	+=3D lv5207lp.o
> >  obj-$(CONFIG_BACKLIGHT_MAX8925)		+=3D max8925_bl.o
> > +obj-$(CONFIG_BACKLIGHT_MP3309C)		+=3D mp3309c.o
> >  obj-$(CONFIG_BACKLIGHT_MT6370)		+=3D mt6370-backlight.o
> >  obj-$(CONFIG_BACKLIGHT_OMAP1)		+=3D omap1_bl.o
> >  obj-$(CONFIG_BACKLIGHT_PANDORA)		+=3D pandora_bl.o
> > diff --git a/drivers/video/backlight/mp3309c.c
> > b/drivers/video/backlight/mp3309c.c
> > new file mode 100644
> > index 000000000000..3fe4469ef43f
> > --- /dev/null
> > +++ b/drivers/video/backlight/mp3309c.c
> > @@ -0,0 +1,443 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Driver for MPS MP3309C White LED driver with I2C interface
> > + *
> > + * This driver support both analog (by I2C commands) and PWM dimming
> > +control
> > + * modes.
> > + *
> > + * Copyright (C) 2023 ASEM Srl
> > + * Author: Flavio Suligoi <f.suligoi@asem.it>
> > + *
> > + * Based on pwm_bl.c
> > + */
> > +
> > +#include <linux/backlight.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/pwm.h>
> > +#include <linux/regmap.h>
> > +
> > +#define REG_I2C_0	0x00
> > +#define REG_I2C_1	0x01
> > +
> > +#define REG_I2C_0_EN	0x80
> > +#define REG_I2C_0_D0	0x40
> > +#define REG_I2C_0_D1	0x20
> > +#define REG_I2C_0_D2	0x10
> > +#define REG_I2C_0_D3	0x08
> > +#define REG_I2C_0_D4	0x04
> > +#define REG_I2C_0_RSRV1	0x02
> > +#define REG_I2C_0_RSRV2	0x01
> > +
> > +#define REG_I2C_1_RSRV1	0x80
> > +#define REG_I2C_1_DIMS	0x40
> > +#define REG_I2C_1_SYNC	0x20
> > +#define REG_I2C_1_OVP0	0x10
> > +#define REG_I2C_1_OVP1	0x08
> > +#define REG_I2C_1_VOS	0x04
> > +#define REG_I2C_1_LEDO	0x02
> > +#define REG_I2C_1_OTP	0x01
> > +
> > +#define ANALOG_I2C_NUM_LEVELS	32		/* 0..31 */
> > +#define ANALOG_I2C_REG_MASK	0x7c
> > +
> > +#define MP3309C_PWM_DEFAULT_NUM_LEVELS	256	/* 0..255 */
> > +
> > +enum mp3309c_status_value {
> > +	FIRST_POWER_ON,
> > +	BACKLIGHT_OFF,
> > +	BACKLIGHT_ON,
> > +};
> > +
> > +enum mp3309c_dimming_mode_value {
> > +	DIMMING_PWM,
> > +	DIMMING_ANALOG_I2C,
> > +};
> > +
> > +struct mp3309c_platform_data {
> > +	unsigned int max_brightness;
> > +	unsigned int default_brightness;
> > +	unsigned int *levels;
> > +	u8  dimming_mode;
> > +	u8  over_voltage_protection;
> > +	bool sync_mode;
> > +	u8 status;
> > +};
> > +
> > +struct mp3309c_chip {
> > +	struct device *dev;
> > +	struct mp3309c_platform_data *pdata;
> > +	struct backlight_device *bl;
> > +	struct gpio_desc *enable_gpio;
> > +	struct regmap *regmap;
> > +	struct pwm_device *pwmd;
> > +};
> > +
> > +static const struct regmap_config mp3309c_regmap =3D {
> > +	.name =3D "mp3309c_regmap",
> > +	.reg_bits =3D 8,
> > +	.reg_stride =3D 1,
> > +	.val_bits =3D 8,
> > +	.max_register =3D REG_I2C_1,
> > +};
> > +
> > +static int mp3309c_enable_device(struct mp3309c_chip *chip) {
> > +	u8 reg_val;
> > +	int ret;
> > +
> > +	/* I2C register #0 - Device enable */
> > +	ret =3D regmap_update_bits(chip->regmap, REG_I2C_0, REG_I2C_0_EN,
> > +				 REG_I2C_0_EN);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * I2C register #1 - Set working mode:
> > +	 *  - set one of the two dimming mode:
> > +	 *    - PWM dimming using an external PWM dimming signal
> > +	 *    - analog dimming using I2C commands
> > +	 *  - enable/disable synchronous mode
> > +	 *  - set overvoltage protection (OVP)
> > +	 */
> > +	reg_val =3D 0x00;
> > +	if (chip->pdata->dimming_mode =3D=3D DIMMING_PWM)
> > +		reg_val |=3D REG_I2C_1_DIMS;
> > +	if (chip->pdata->sync_mode)
> > +		reg_val |=3D REG_I2C_1_SYNC;
> > +	reg_val |=3D chip->pdata->over_voltage_protection;
> > +	ret =3D regmap_write(chip->regmap, REG_I2C_1, reg_val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mp3309c_bl_update_status(struct backlight_device *bl) {
> > +	struct mp3309c_chip *chip =3D bl_get_data(bl);
> > +	int brightness =3D backlight_get_brightness(bl);
> > +	struct pwm_state pwmstate;
> > +	unsigned int analog_val, bits_val;
> > +	int i, ret;
> > +
> > +	if (chip->pdata->dimming_mode =3D=3D DIMMING_PWM) {
> > +		/*
> > +		 * PWM control mode
> > +		 */
> > +		pwm_get_state(chip->pwmd, &pwmstate);
> > +		pwm_set_relative_duty_cycle(&pwmstate,
> > +					    chip->pdata->levels[brightness],
> > +					    chip->pdata->levels[chip->pdata-
> >max_brightness]);
> > +		pwmstate.enabled =3D true;
> > +		ret =3D pwm_apply_state(chip->pwmd, &pwmstate);
> > +		if (ret)
> > +			return ret;
> > +
> > +		switch (chip->pdata->status) {
> > +		case FIRST_POWER_ON:
> > +		case BACKLIGHT_OFF:
> > +			/*
> > +			 * After 20ms of low pwm signal level, the chip turns
> > +			 * off automatically. In this case, before enabling the
> > +			 * chip again, we must wait about 10ms for pwm
> signal to
> > +			 * stabilize.
> > +			 */
> > +			if (brightness > 0) {
> > +				msleep(10);
> > +				mp3309c_enable_device(chip);
> > +				chip->pdata->status =3D BACKLIGHT_ON;
> > +			} else {
> > +				chip->pdata->status =3D BACKLIGHT_OFF;
> > +			}
> > +			break;
> > +		case BACKLIGHT_ON:
> > +			if (brightness =3D=3D 0)
> > +				chip->pdata->status =3D BACKLIGHT_OFF;
> > +			break;
> > +		}
> > +	} else {
> > +		/*
> > +		 * Analog (by I2C command) control mode
> > +		 *
> > +		 * The first time, before setting brightness, we must enable the
> > +		 * device
> > +		 */
> > +		if (chip->pdata->status =3D=3D FIRST_POWER_ON)
> > +			mp3309c_enable_device(chip);
> > +
> > +		/*
> > +		 * Dimming mode I2C command (fixed dimming range 0..31)
> > +		 *
> > +		 * The 5 bits of the dimming analog value D4..D0 is allocated
> > +		 * in the I2C register #0, in the following way:
> > +		 *
> > +		 *     +--+--+--+--+--+--+--+--+
> > +		 *     |EN|D0|D1|D2|D3|D4|XX|XX|
> > +		 *     +--+--+--+--+--+--+--+--+
> > +		 */
> > +		analog_val =3D brightness;
> > +		bits_val =3D 0;
> > +		for (i =3D 0; i <=3D 5; i++)
> > +			bits_val +=3D ((analog_val >> i) & 0x01) << (6 - i);
> > +		ret =3D regmap_update_bits(chip->regmap, REG_I2C_0,
> > +					 ANALOG_I2C_REG_MASK, bits_val);
> > +		if (ret)
> > +			return ret;
> > +
> > +		if (brightness > 0)
> > +			chip->pdata->status =3D BACKLIGHT_ON;
> > +		else
> > +			chip->pdata->status =3D BACKLIGHT_OFF;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct backlight_ops mp3309c_bl_ops =3D {
> > +	.update_status =3D mp3309c_bl_update_status, };
> > +
> > +static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
> > +				 struct mp3309c_platform_data *pdata) {
> > +	struct device_node *node =3D chip->dev->of_node;
> > +	struct property *prop_pwms, *prop_levels;
> > +	int length =3D 0;
> > +	int ret, i;
> > +	unsigned int num_levels, tmp_value;
> > +
> > +	if (!node) {
> > +		dev_err(chip->dev, "failed to get DT node\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	/*
> > +	 * Dimming mode: the MP3309C provides two dimming control mode:
> > +	 *
> > +	 * - PWM mode
> > +	 * - Analog by I2C control mode (default)
> > +	 *
> > +	 * I2C control mode is assumed as default but, if the pwms property i=
s
> > +	 * found in the backlight node, the mode switches to PWM mode.
> > +	 */
> > +	pdata->dimming_mode =3D DIMMING_ANALOG_I2C;
> > +	prop_pwms =3D of_find_property(node, "pwms", &length);
> > +	if (prop_pwms) {
> > +		chip->pwmd =3D devm_pwm_get(chip->dev, NULL);
> > +		if (IS_ERR(chip->pwmd))
> > +			return dev_err_probe(chip->dev, PTR_ERR(chip-
> >pwmd),
> > +					     "error getting pwm data\n");
> > +		pdata->dimming_mode =3D DIMMING_PWM;
> > +		pwm_apply_args(chip->pwmd);
> > +	}
> > +
> > +	/*
> > +	 * In I2C control mode the dimming levels (0..31) are fixed by the
> > +	 * hardware, while in PWM control mode they can be chosen by the
> user,
> > +	 * to allow nonlinear mappings.
> > +	 */
> > +	if  (pdata->dimming_mode =3D=3D DIMMING_ANALOG_I2C) {
> > +		/*
> > +		 * Analog (by I2C commands) control mode: fixed 0..31
> brightness
> > +		 * levels
> > +		 */
> > +		num_levels =3D ANALOG_I2C_NUM_LEVELS;
> > +
> > +		/* Enable GPIO used in I2C dimming mode only */
> > +		chip->enable_gpio =3D devm_gpiod_get(chip->dev, "enable",
> > +						   GPIOD_OUT_HIGH);
> > +		if (IS_ERR(chip->enable_gpio))
> > +			return dev_err_probe(chip->dev,
> > +					     PTR_ERR(chip->enable_gpio),
> > +					     "error getting enable gpio\n");
> > +	} else {
> > +		/*
> > +		 * PWM control mode: check for brightness level in DT
> > +		 */
> > +		prop_levels =3D of_find_property(node, "brightness-levels",
> > +					       &length);
> > +		if (prop_levels) {
> > +			/* Read brightness levels from DT */
> > +			num_levels =3D length / sizeof(u32);
> > +			if (num_levels < 2)
> > +				return -EINVAL;
> > +		} else {
> > +			/* Use default brightness levels */
> > +			num_levels =3D
> MP3309C_PWM_DEFAULT_NUM_LEVELS;
> > +		}
> > +	}
> > +
> > +	/* Fill brightness levels array */
> > +	pdata->levels =3D devm_kcalloc(chip->dev, num_levels,
> > +				     sizeof(*pdata->levels), GFP_KERNEL);
> > +	if (!pdata->levels)
> > +		return -ENOMEM;
> > +	if (prop_levels) {
> > +		ret =3D of_property_read_u32_array(node, "brightness-levels",
> > +						 pdata->levels,
> > +						 num_levels);
> > +		if (ret < 0)
> > +			return ret;
> > +	} else {
> > +		for (i =3D 0; i < num_levels; i++)
> > +			pdata->levels[i] =3D i;
> > +	}
> > +
> > +	pdata->max_brightness =3D num_levels - 1;
> > +
> > +	ret =3D of_property_read_u32(node, "default-brightness",
> > +				   &pdata->default_brightness);
> > +	if (ret)
> > +		pdata->default_brightness =3D pdata->max_brightness;
> > +	if (pdata->default_brightness > pdata->max_brightness) {
> > +		dev_err(chip->dev,
> > +			"default brightness exceeds max brightness\n");
> > +		pdata->default_brightness =3D pdata->max_brightness;
> > +	}
> > +
> > +	/*
> > +	 * Over-voltage protection (OVP)
> > +	 *
> > +	 * This (optional) property values are:
> > +	 *
> > +	 *  - 13.5V
> > +	 *  - 24V
> > +	 *  - 35.5V (hardware default setting)
> > +	 *
> > +	 * If missing, the default value for OVP is 35.5V
> > +	 */
> > +	pdata->over_voltage_protection =3D REG_I2C_1_OVP1;
> > +	if (!of_property_read_u32(node, "mps,overvoltage-protection-
> microvolt",
> > +				  &tmp_value)) {
> > +		switch (tmp_value) {
> > +		case 13500000:
> > +			pdata->over_voltage_protection =3D 0x00;
> > +			break;
> > +		case 24000000:
> > +			pdata->over_voltage_protection =3D REG_I2C_1_OVP0;
> > +			break;
> > +		case 35500000:
> > +			pdata->over_voltage_protection =3D REG_I2C_1_OVP1;
> > +			break;
> > +		default:
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	/* Synchronous (default) and non-synchronous mode */
> > +	pdata->sync_mode =3D true;
> > +	if (of_property_read_bool(node, "mps,no-sync-mode"))
> > +		pdata->sync_mode =3D false;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mp3309c_probe(struct i2c_client *client) {
> > +	struct mp3309c_platform_data *pdata =3D dev_get_platdata(&client-
> >dev);
> > +	struct mp3309c_chip *chip;
> > +	struct backlight_properties props;
> > +	struct pwm_state pwmstate;
> > +	int ret;
> > +
> > +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> > +		dev_err(&client->dev, "failed to check i2c functionality\n");
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	chip =3D devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> > +	if (!chip)
> > +		return -ENOMEM;
> > +
> > +	chip->dev =3D &client->dev;
> > +
> > +	chip->regmap =3D devm_regmap_init_i2c(client, &mp3309c_regmap);
> > +	if (IS_ERR(chip->regmap))
> > +		return dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
> > +				     "failed to allocate register map\n");
> > +
> > +	i2c_set_clientdata(client, chip);
> > +
> > +	if (!pdata) {
> > +		pdata =3D devm_kzalloc(chip->dev, sizeof(*pdata),
> GFP_KERNEL);
> > +		if (!pdata)
> > +			return -ENOMEM;
> > +
> > +		ret =3D pm3309c_parse_dt_node(chip, pdata);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +	chip->pdata =3D pdata;
> > +
> > +	/* Backlight properties */
> > +	props.brightness =3D pdata->default_brightness;
> > +	props.max_brightness =3D pdata->max_brightness;
> > +	props.scale =3D BACKLIGHT_SCALE_LINEAR;
> > +	props.type =3D BACKLIGHT_RAW;
> > +	props.power =3D FB_BLANK_UNBLANK;
> > +	props.fb_blank =3D FB_BLANK_UNBLANK;
> > +	chip->bl =3D devm_backlight_device_register(chip->dev, "mp3309c",
> > +						  chip->dev, chip,
> > +						  &mp3309c_bl_ops, &props);
> > +	if (IS_ERR(chip->bl))
> > +		return dev_err_probe(chip->dev, PTR_ERR(chip->bl),
> > +				     "error registering backlight device\n");
> > +
> > +	/* In PWM dimming mode, enable pwm device */
> > +	if (chip->pdata->dimming_mode =3D=3D DIMMING_PWM) {
> > +		pwm_init_state(chip->pwmd, &pwmstate);
> > +		pwm_set_relative_duty_cycle(&pwmstate,
> > +					    chip->pdata->default_brightness,
> > +					    chip->pdata->max_brightness);
> > +		pwmstate.enabled =3D true;
> > +		ret =3D pwm_apply_state(chip->pwmd, &pwmstate);
> > +		if (ret)
> > +			return dev_err_probe(chip->dev, ret,
> > +					     "error setting pwm device\n");
> > +	}
> > +
> > +	chip->pdata->status =3D FIRST_POWER_ON;
> > +	backlight_update_status(chip->bl);
> > +
> > +	return 0;
> > +}
> > +
> > +static void mp3309c_remove(struct i2c_client *client) {
> > +	struct mp3309c_chip *chip =3D i2c_get_clientdata(client);
> > +	struct backlight_device *bl =3D chip->bl;
> > +
> > +	bl->props.power =3D FB_BLANK_POWERDOWN;
> > +	bl->props.brightness =3D 0;
> > +	backlight_update_status(chip->bl);
> > +}
> > +
> > +static const struct of_device_id mp3309c_match_table[] =3D {
> > +	{ .compatible =3D "mps,mp3309c", },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, mp3309c_match_table);
> > +
> > +static const struct i2c_device_id mp3309c_id[] =3D {
> > +	{ "mp3309c", 0 },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, mp3309c_id);
> > +
> > +static struct i2c_driver mp3309c_i2c_driver =3D {
> > +	.driver	=3D {
> > +			.name		=3D KBUILD_MODNAME,
> > +			.of_match_table	=3D mp3309c_match_table,
> > +	},
> > +	.probe		=3D mp3309c_probe,
> > +	.remove		=3D mp3309c_remove,
> > +	.id_table	=3D mp3309c_id,
> > +};
> > +
> > +module_i2c_driver(mp3309c_i2c_driver);
> > +
> > +MODULE_DESCRIPTION("Backlight Driver for MPS MP3309C");
> > +MODULE_AUTHOR("Flavio Suligoi <f.suligoi@asem.it>");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.34.1
> >
