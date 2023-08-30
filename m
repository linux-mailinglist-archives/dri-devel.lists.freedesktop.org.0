Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B2F78EFF0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 17:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C5910E0A2;
	Thu, 31 Aug 2023 15:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2049.outbound.protection.outlook.com [40.107.6.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345D810E4FF
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 11:56:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeWlDPX5Xrf5+Xr/yb4VocAK2biQS997TEOJVuEXaeaLF8GURqzWdDMI9n7HrQCGvRvmw1sjeyNo5vRQQHIpkGXSQTqM4hwsUcqgvnzLWpxw5XSyxlmNGgIk15ajXUUn0TPVdpb4BgiMTFrhGiDIk1/KDspA0Jh62ywQbdYVtTCt4juJmt8Bdnh85c/B4LuLqGxcO91SY6R6v3bTOo6xl6lNCcvFBKLGJDL2FfnL/R9xaB+jUTrad6TZ6Or04Nyc/75tfY6EESN3mar2K8NCsKrsCPgKOoYnlksmYHLvtO8rE4H/XxYfph1CYHUGZsbJHsy9TdA4Ef1/sI4x8/aFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZCZb5WTzCPkiSGRsu0YEasDm7RBAmDEqJnyXuNmkMM=;
 b=LOqTxzzIpiSz3HcqS7piTmlq1D2vdOKCF3cz/4HiNZ5mpaGwoXS3ENmp60qRTTlCpxPQbLxY5Hq6oPTywWi1+PdwX6NPebqZK7x284BJpjvJ/0Ec30PFWkGmpYVtnc4zflpc6DjwzRLEn1NihVocjt/Dqz0xqj5g31VfcpbmXWna0WDXLkYFDwaa978RcHovr70SXqYH+43zEoWQjHB7Ep5El3s8oBQoqAqdsggqlm0TdWEdF4rNoILiuavC7IFyT0O5VPn5yYI58q+1nKcXwwBhDg0wK9TdJq4ogwqufcD8GxJXwWqlEKzrCVitY77FMMxuntwPHMnhMpiHyL4fIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZCZb5WTzCPkiSGRsu0YEasDm7RBAmDEqJnyXuNmkMM=;
 b=A2xWYQ/vrWUHq1S+0B/vdMYCToTMu36OVAABkDW13wDFTdSD8NDrZj2QO3/FhtgWcuo5XQliBAyuatfoC8lV/71b0Ck5GA5HVKJIHdO5Le6LlVzMR8OxDvOz4dQqQD9t1fljTu+X3iZ2FOT0R5JwXpiUth1k/Bk9oG7FHM0ZSiE=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by DBAPR01MB6551.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:179::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 11:56:32 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::11d:15c1:fca6:e077]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::11d:15c1:fca6:e077%7]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 11:56:32 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: RE: [PATCH v1 2/2] backlight: mp3309c: Add support for MPS MP3309C
Thread-Topic: [PATCH v1 2/2] backlight: mp3309c: Add support for MPS MP3309C
Thread-Index: AQHZ2mHRsMNOaOYwzkeWXdI/h0YD/bABdtoAgAFFaPA=
Date: Wed, 30 Aug 2023 11:56:32 +0000
Message-ID: <DU2PR01MB80348776A43291B59C5D2A59F9E6A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20230829101546.483189-1-f.suligoi@asem.it>
 <20230829101546.483189-2-f.suligoi@asem.it>
 <20230829162814.GA56339@aspen.lan>
In-Reply-To: <20230829162814.GA56339@aspen.lan>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|DBAPR01MB6551:EE_
x-ms-office365-filtering-correlation-id: ee6a66ad-9058-4842-43ab-08dba9502721
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qr8C3uqt2DPnwiykr/adLEyWyA+MF2uiBq71Rjx6XMqMA52LW56tqNCrTNaWZm3JsKQQnkEamjYGglzW4e/bL63VFcnXA82638k5o5Hkzi9SfeqO6XRveDo2ctQGHeq0uZ+HiA7GQWRS/QXZTBjqKLRMXZ67JP8XeRBuGZD8oNFnT6gn6XVhYWN1TP8XJf+2xChPhYXIqUoUJPd+VfVJ9kj/zgpm2xm5+8vD2KcLAUNohzvIWo8KDZ6Ipt74c+Sui81iBnh/nSj2YhGEdQSsePhd7zDa3ruX2Au2cXszlhiyEATISqH41NHRFPSmRhpXqxP2Uji/fM+EFob7iKEKCfAzaZdhrhe60Qc+PQkPLjmc61qybHGWDIc5V07WhqWU6nll8EQjSMGTtgYsjFBMW8vmK4tBPMQp+UaLe+qO0BEI5ydx78dTsaU3KGJBnIbNmHD6xmPoDzjp4HIwA/o+QY94Y1g2DvnmFP3IpBn0c6KJBlxMV5KL2Jrr2P/kRvtRyiFonqfC4hX2yvWXur0OgCWFfJ+tA9EgojBZiC7Ht8QEVSVQsHSjF4qdtFqq2vpdONuMwF9O2kqoQKvlpbGZrYB+cLeO2PCOvRoWEf/bHUc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(39840400004)(346002)(136003)(186009)(1800799009)(451199024)(33656002)(7416002)(66556008)(6916009)(66476007)(54906003)(66446008)(2906002)(64756008)(66946007)(76116006)(316002)(55016003)(41300700001)(9686003)(53546011)(71200400001)(6506007)(7696005)(5660300002)(52536014)(26005)(83380400001)(86362001)(966005)(8936002)(38070700005)(38100700002)(4326008)(8676002)(122000001)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Si2W3Rwya+nFNWs/lXpOVYr7gz91Bt3kjdlf/0OAvRLvPUPQNHgudIxlqbDL?=
 =?us-ascii?Q?xBK1MgZaJxVlAe7Q9H/X1txf5pC/5ErHFZY6tCxMi0BUtTa/NU7Y5GBwehqQ?=
 =?us-ascii?Q?e9C922MSt4ofMZvy/yGZk+Dy9UCh+vue8QMoIGQhVsJ1sRoWpMHtyIEW6mPu?=
 =?us-ascii?Q?An7pyYv+NAF4w44jQcHqHLz0m7e9h9J31WD/3wLfwCZsgTwSefFb5eaYuVRD?=
 =?us-ascii?Q?s+6thA8T0ADXLSLO84K0s5cxYG822QmblwwgiFZPyd3LtkKA1l96pVdhT04D?=
 =?us-ascii?Q?YwsaNGv1SrMfj7HYqgEq3N2nS/+Mm9vfDTk7xnC6LFNDoJXBLw8kJG0j/vkp?=
 =?us-ascii?Q?6g5euq983lTY/yUT9cAy7XIBEqvIObh9ZKVrA/W/V4E9uYnR9fDn2qsMQcQU?=
 =?us-ascii?Q?7IP5RInzcQtmLvsi0zCk49sWN/md3D4P7t1pQ+uCG59tcwF/ev76hCaRMtvi?=
 =?us-ascii?Q?vN4RJHkvjAKuJtWIjMj3ObQNix3Jkvy23XTxXoDcJFMwXAI7QNivMTbA9RX4?=
 =?us-ascii?Q?MYERjnW2ARKmjJa5ZZJqeK9yKh6WbXwuKji4TUpJ+iHylS/polQhAQztc3C8?=
 =?us-ascii?Q?1O7+0MfS80pbxYh3WnO4UknLjVwc50Nw4ij4jM3ZWvvDNBBUrgzCm83tTbaD?=
 =?us-ascii?Q?V9650+GClTD7VvoaBdBGTFuQmnQ/JAPlJe/mNNCurckknR29lPXAmogSxkil?=
 =?us-ascii?Q?3/lsuJv6tgvTOWCY+sn6UZa604yZMBGIO3+kHdvjuPLOyUG91zzSmrHsA0fY?=
 =?us-ascii?Q?jGEFT2Jiof2SsbQ/6lIoPMJwrwxCgzRBYNp1D9xiNq7CFI5C15Bh9EaHrY2i?=
 =?us-ascii?Q?NBysvA7sGfmpZWebvRjDMWiZxowx+G8pXURrcJtK3QCeMNlos5GyQI3uAcYc?=
 =?us-ascii?Q?rGTq6+MVA604V8ifU1hD0FXe8d0b7qkm1zxZSnaqGDUQdPz0Nyx6DEGaYlh9?=
 =?us-ascii?Q?K/qgKa2tMKKHn9Bh1xuNjP64mmrao3Na3Tm4d0PLUugSCcBSyRFuQYV+evMF?=
 =?us-ascii?Q?ASUP+YNwvXIzwDcrGo+UAmvieiX0ZMEXXWe+zT0kLC2aMNyiaZwnnsIpnkBH?=
 =?us-ascii?Q?iu86/HJX2HAHfw31TyFOsLsayfAup+UVcik7pfe2DB6CaCfFVj8DUn/OXz74?=
 =?us-ascii?Q?+ENGLXNmrEIvrcudMfA1y7KOQcomR0sy3KHGN5ATZ6NoC+p7khhMcGb94zZ1?=
 =?us-ascii?Q?giuENwkWYpP7TUTqzE3EqzOyG8wNRwISEWmYDvciiv7eN5Pb4UxAdgmMHeC5?=
 =?us-ascii?Q?cKU54IN6kiQUVSUUIVQo7yG16KWw6Y/qMcKWcmO7qVZ/LIn5pjIfLZRs/2+W?=
 =?us-ascii?Q?B7eEELHaMnRNQJbSOLuFmoxd1ENMyg6poHMjSi8aqfy/PEJfJKkKv8rQl3Ws?=
 =?us-ascii?Q?FcmqJtm8f+jFAdfqltQeAM4jsDz7IPlORx1QaFAl+Lvj1TF9NQ/gT4Ga3Y4u?=
 =?us-ascii?Q?FQV+uiq25FYMMgZ84wwOmt6suXLsFlOjAVhGzt3uwI/u8u9pO1VVbiA7Wqt5?=
 =?us-ascii?Q?2sJOhCMujyDT3zwnwNydncYSBDJ2lHlPEStxaMTfjXWFpaRO9zVQRVGQfU0z?=
 =?us-ascii?Q?fvn4zqMnlNYydsDN4Wc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6a66ad-9058-4842-43ab-08dba9502721
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2023 11:56:32.1928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VK/gtJbPvr4vvtOk29Wkdiqna8MRwMCUwo6bi7wLio+qjvrhSprs5Gf2DDuoCGYcmeuuaaGomhdCc1l0VCq/dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6551
X-Mailman-Approved-At: Thu, 31 Aug 2023 15:10:31 +0000
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

HI Daniel,

> -----Original Message-----
> From: Daniel Thompson <daniel.thompson@linaro.org>
> Sent: Tuesday, August 29, 2023 6:28 PM
> To: Flavio Suligoi <f.suligoi@asem.it>
> Cc: Lee Jones <lee@kernel.org>; Jingoo Han <jingoohan1@gmail.com>; Helge
> Deller <deller@gmx.de>; Pavel Machek <pavel@ucw.cz>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
> dri-devel@lists.freedesktop.org; linux-leds@vger.kernel.org;
> devicetree@vger.kernel.org; linux-fbdev@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v1 2/2] backlight: mp3309c: Add support for MPS
> MP3309C
>=20
> On Tue, Aug 29, 2023 at 12:15:46PM +0200, Flavio Suligoi wrote:
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
>=20
> > diff --git a/drivers/video/backlight/Kconfig
> > b/drivers/video/backlight/Kconfig index 51387b1ef012..65d0ac9f611d
> > 100644
> > --- a/drivers/video/backlight/Kconfig
> > +++ b/drivers/video/backlight/Kconfig
> > @@ -389,6 +389,19 @@ config BACKLIGHT_LM3639
> >  	help
> >  	  This supports TI LM3639 Backlight + 1.5A Flash LED Driver
> >
> > +config BACKLIGHT_MP3309C
> > +	tristate "Backlight Driver for MPS MP3309C"
> > +	depends on I2C
> > +	select REGMAP_I2C
> > +	select NEW_LEDS
> > +	select LEDS_CLASS
>=20
> This doesn't seem right.
>=20
> Shouldn't PWM and GPIOLIB be listed here? Why are NEW_LEDS and
> LEDS_CLASS needed?

ok, I'll fix it

>=20
> > +	help
> > +	  This supports MPS MP3309C backlight WLED Driver in both PWM
> and
> > +	  analog/I2C dimming modes.
> > +
> > +	  To compile this driver as a module, choose M here: the module will
> > +	  be called mp3309c_bl.
> > +
> >  config BACKLIGHT_LP855X
> >  	tristate "Backlight driver for TI LP855X"
> >  	depends on I2C && PWM
>=20
> > +static int mp3309c_bl_update_status(struct backlight_device *bl) {
> > +	struct mp3309c_chip *chip =3D bl_get_data(bl);
> > +	int brightness =3D backlight_get_brightness(bl);
> > +	struct pwm_state pwmstate;
> > +	unsigned int analog_val, bits_val;
> > +	int i, ret;
> > +
> > +	if (chip->pdata->dimming_mode =3D=3D DIMMING_PWM) {
> > +		/*
> > +		 * PWM dimming mode
> > +		 */
> > +		pwm_init_state(chip->pwmd, &pwmstate);
> > +		pwm_set_relative_duty_cycle(&pwmstate, brightness,
> > +					    chip->pdata->max_brightness);
> > +		pwmstate.enabled =3D true;
> > +		ret =3D pwm_apply_state(chip->pwmd, &pwmstate);
> > +		if (ret)
> > +			return ret;
> > +	} else {
> > +		/*
> > +		 * Analog dimming mode by I2C commands
> > +		 *
> > +		 * The 5 bits of the dimming analog value D4..D0 is allocated
> > +		 * in the I2C register #0, in the following way:
> > +		 *
> > +		 *     +--+--+--+--+--+--+--+--+
> > +		 *     |EN|D0|D1|D2|D3|D4|XX|XX|
> > +		 *     +--+--+--+--+--+--+--+--+
> > +		 */
> > +		analog_val =3D DIV_ROUND_UP(ANALOG_MAX_VAL *
> brightness,
> > +					  chip->pdata->max_brightness);
> > +		bits_val =3D 0;
> > +		for (i =3D 0; i <=3D 5; i++)
> > +			bits_val +=3D ((analog_val >> i) & 0x01) << (6 - i);
> > +		ret =3D regmap_update_bits(chip->regmap, REG_I2C_0,
> > +					 ANALOG_REG_MASK, bits_val);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	if (brightness > 0) {
> > +		switch (chip->pdata->status) {
> > +		case FIRST_POWER_ON:
> > +			/*
> > +			 * Only for the first time, wait for the optional
> > +			 * switch-on delay and then enable the device.
> > +			 * Otherwise enable the backlight immediately.
> > +			 */
> > +			schedule_delayed_work(&chip->enable_work,
> > +					      msecs_to_jiffies(chip->pdata-
> >switch_on_delay_ms));
>=20
> Delaying this work makes no sense to me, especially when it is only going=
 to
> happen at initial power on.
>=20
> If you are (ab)using this property to try and sequence the backlight powe=
r-on
> with display initialization then this is not the way to do it.
> Normally backlight drivers that support sequencing versus the panel work =
by
> having a backlight property set on the panel linking it to the backlight.=
 When
> the panel is ready this power status of the backlight will be updated
> accordingly.
>=20
> All the backlight driver need do is make sure that is the initial power s=
tatus is
> "powerdown" on systems when the link is present (e.g.
> leave the backlight off and wait to be told the display has settled).

OK, I'll remove this delay. It was used for one of our boards, as a workaro=
und.

>=20
>=20
> > +			/*
> > +			 * Optional external device GPIO reset, with
> > +			 * delay pulse length
> > +			 */
> > +			if (chip->pdata->reset_pulse_enable)
> > +				schedule_delayed_work(&chip-
> >reset_gpio_work,
> > +						      msecs_to_jiffies(chip-
> >pdata->reset_on_delay_ms));
>=20
> Similarly I don't understand what this property is for. A backlight is di=
rectly
> perceivable by the user. There is nothing downstream of a light that need=
s to
> be reset!
>=20
> What is this used for?

Also this property, this gpio, was used for one of our boards.
It is not necessary, I'll remove it.

>=20
>=20
> Daniel.

Thanks, Daniel!
Flavio
