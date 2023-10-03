Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81EE7B6DC2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 18:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70D710E04B;
	Tue,  3 Oct 2023 16:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2041.outbound.protection.outlook.com [40.107.247.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C1A10E04B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 16:00:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpMJLu3oQzgILN1J4YROpIx5JWsQL1HAVvxQIrwe04Opk4dBNPxICpZLhO5mV0QxsgT0zhqe1nyLT/vw+6fdVv0yItBV3wCd+/0/Fb83OaQstk5nRYf3Oh6hWdrPnFWWcfjDcF8nQh3UkRgwucgab3ByF4xUPvIxmINC2GlO8FgnUqDBse7Fd+eEzVlChZ1Hsob8OvAEC7Ml56F/FmVWVZRuE44RdIDm1A5HYcZdWN9RfUaL0i2XM4ZIEW6eTqBeugAb8AcxNfXvMDV32ptHmSDzKYe3GadGCPObAaJ6/NtP8vyXNoEIL1Jz8eGpPS9iQzOltvMWRQyfO5R2tljYlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F4n94L291UXsAO1OoSELIFe3BwGwBLYgxy3Pu2NnHMc=;
 b=K75qs2XR9A5loGhmLguIljn/HE2XXQp/gg5voFiVFaBsiAPuArQGUkghyfALDB+u0zb+Mg5Y7S6SROmozR7LEAxNn8W6kv0lJoQhirutx2Eq0isdG1QCdzMrE8YpwC2faPTtG7Di6AtEQ6eYDnXrnjIFfvdUslgbjmjOnJp2r+kYG12Sc9bHuEeqrVQt74pg3KvgkU1ia4DWnEYXrtD5d5vqbCw7rCjUUpV/en6BxpX0mMfy8GokjhbWzQUIjsGA1VEEbufYWyFKM9YNpeFkPjdyM7fultREKmSBSFRgG7Uasxb6VYJlNWHUxqPY941MNh4NkhNEwhLGnFqTdAxydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4n94L291UXsAO1OoSELIFe3BwGwBLYgxy3Pu2NnHMc=;
 b=oLBqZecacAvviGxzZzTKaEPilDy/3vckFy4L/APdjGUKT+mfQYwRjhwvL7qriU/VD0dbkEhNHWMHnZ6tCr+WrfyqI28oY0Z8hQOkrhPspFEpHkBbv2HuyjyEJvPmcaOzY6Boi3K4HVmsItstS9joZb81AuYix6SwT5UGSiIg8TA=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by DB9PR01MB9246.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:366::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.21; Tue, 3 Oct
 2023 16:00:32 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::ad2b:a1e7:8828:ba2f]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::ad2b:a1e7:8828:ba2f%7]) with mapi id 15.20.6838.024; Tue, 3 Oct 2023
 16:00:32 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: RE: [PATCH v3 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Topic: [PATCH v3 1/2] dt-bindings: backlight: Add MPS MP3309C
Thread-Index: AQHZ76uO1Fb/EPNT/k67j1TrFzld37AtE7aAgAmVcBCAAT5MAIAAXgAg
Date: Tue, 3 Oct 2023 16:00:32 +0000
Message-ID: <DU2PR01MB80349344FB8CB1415BFA917DF9C4A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20230925122609.78849-1-f.suligoi@asem.it>
 <20230926130113.GB4356@aspen.lan>
 <DU2PR01MB8034F448F6E66BAC3823CDB1F9C4A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
 <20231003102138.GB69443@aspen.lan>
In-Reply-To: <20231003102138.GB69443@aspen.lan>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|DB9PR01MB9246:EE_
x-ms-office365-filtering-correlation-id: bd36f944-de3d-405f-a678-08dbc429df4e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QQPknnIm/etCA39/gf5CSzoAjhItFIL/5g+oTajiZX4uLW1NbAznMIGySXTABmynnO+rep5AYlUiHP1Ran8lEQA5RUzxU/pJQfXl+9kLQF7p2aJK4HQewvbCmM4zcpynTUbAnNEpkz3vRNtqyL0ZLn6EjNgnXPGpOolD40ab5ImLrVxKLeXU8xT2EVqHSEdqBfSJ1UB3SMeuHLHuFhHVd0EwdiHJKoIEd/zFoo5hc+o4RkPRNkzVfJEZsEDabqG1Wo4QTYVsaInJEDLk6dU2J/ndpi8Wv1cEYpgLo7cYKqY5t1GGfDLJSrowmEV93z9lLegiaMe8wmEKY1gjYQ1s1oB9bNCyzS4rxwWwp3ABWDcB1yR2Ki8zP3Gf4KuFQmHMZHgphPF20FOqt7zIHisKBCtbnCHtZ4SMtXqCsrej/skrFIkG3661UMud70h05tNeCu4r6BW6xFce6+NrwWfU0Ygu8u5S5ccz35SP5uJH2kdZyfg3F1FsyWvbxqVhCX/GiSBllSJLt7B6xzFsV8mQ6vxz5yo0Cp3WsN9RsGg46gZmIhtETNzQ4l59zxaw6JX6oLYla/00kf/rGndvgPUDyDraMbRvEz4qWymjiwWn5f5aOkkHQllktOnVZROxdnGA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(39850400004)(396003)(366004)(346002)(136003)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(54906003)(66946007)(5660300002)(76116006)(316002)(6916009)(64756008)(52536014)(66556008)(66446008)(478600001)(66476007)(7416002)(2906002)(71200400001)(41300700001)(7696005)(6506007)(4326008)(8676002)(8936002)(26005)(9686003)(66899024)(38100700002)(55016003)(38070700005)(122000001)(33656002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lJu/9rToUgFnyxLxTdoJ/gyCTk6jHQcI4oyXXqWTZgDyMoTaDWrf5JHFwx4n?=
 =?us-ascii?Q?GgvL4UYlp+9JbLpYvuK95Pnon+FIuYKrwHCOB11f7VZRy/UXv+q2pNUUdRLy?=
 =?us-ascii?Q?WkskGrOKFGPO5OpePh4bcDNpwT4YkbNEyjCIHMoQk6ppxGKt/O+3SVKHA7Z3?=
 =?us-ascii?Q?6x8OkjPRg2yKTnAfrQ0pDyH3Qyn9b9E//REEQeenVEoYBHTlGJ7IHEr+xzTg?=
 =?us-ascii?Q?lXc8QvvrS5YXsI36/GrF9HEAW8hD6B0GNVhs5oAGSte119ktjQ2lURFt4f55?=
 =?us-ascii?Q?trrGBLg0bPntyBtqwuPXndn94LD/W8EsuulFsSGC93Eht0qzBMVQgyVIuEPv?=
 =?us-ascii?Q?EFl4+XRCOhcbpVnnPPEN1Q4qnozZkDngMrnNZ71HcAuRiw+sWb3taFKOwJ4I?=
 =?us-ascii?Q?k29WLLgdhx1rLeMXmp9pqk2Umb1c5XDiBaRWJEdm4J4PonkMOTEVjfATKrvv?=
 =?us-ascii?Q?0L3kc4TZa9JOCBWfPKT9hQzEdFsYx3tx2q8VV9bnTLCsenpNsUIvutD8U48q?=
 =?us-ascii?Q?RX9wJbsHxHg4+5J/TYx2WTIDEKqHm0VVZmQOrUs4CC9IgmUA39Uld+6hyuvM?=
 =?us-ascii?Q?YuiOw1sLS5T1hJDxKKKLUDSJk6vZglp2sM8Aky7LMlo4d1Pxad4eNu81u4q1?=
 =?us-ascii?Q?m1TLqFdkDT4zwvtSVcKhkCM0BWI7FAQexhGbwENwUoyPpBKslzE+dhWNIGJc?=
 =?us-ascii?Q?8X++uFgWiAnPscXuQA/G/T/9ysFFYojVi1RAmPYhRZmsRXJ+EKWj9NJFat73?=
 =?us-ascii?Q?8x6qtj7kvC9YwUAQO7HTRSkROon9EoYuN0VgpPoXqfMhikDVf//V8u5YFU60?=
 =?us-ascii?Q?qbCY2vAgexBKeOMKtT0Olz+BJndb69S1OKzRYwRDX2rnCJlDTumAD1gjL5Ek?=
 =?us-ascii?Q?emw9t6T0gusmMSdyqslEa06pYXFiE9ah6HlQ4NNbuEOCxuD6PSbAus7jm1Wi?=
 =?us-ascii?Q?6FgCwKz9ucRvtbf5VqZG+wDMyC9pw3jelVehMqhF5E2UQcoPTCWMzN0bZpkD?=
 =?us-ascii?Q?hnD8aitu/bUbM+hFhbLrueBCmePClE7wkPY7pZ0y8QnW/IvKvNt76KebH3hX?=
 =?us-ascii?Q?eoYw5oCjasmVPT3Hi26K6FuGvwmQ2T5M6DHSVAEe90JNB7Scjsk32dWhZFiB?=
 =?us-ascii?Q?OvJRjY965rKXAlqS48xWDwioYt3fSrfj5aXQqtc4coOvyVftPwOH03LKKRQ7?=
 =?us-ascii?Q?35rgymGVpvJU6C2/PMzUZ5FSp9ru46lSaRf33ZyXt/u8j9C6qlSCYzyYcdcR?=
 =?us-ascii?Q?0qte6GD6tV2vbePVvWMqZjRqE5qAdYURD1L57wzk/bJCUDzX4rwu5Pzmmdnl?=
 =?us-ascii?Q?taOViKAgeQfIwGplgIOpCFSpl5NRZNCQ7vATb53QA49RmPWYSYG8V9Yodmz+?=
 =?us-ascii?Q?t5FI7wy38USxgE7bZqRIYf5Y/jfSun8m5+RWSjqAivyu1TCPzXnsdRkDfLEa?=
 =?us-ascii?Q?7N70wFkZy1ndy8RdhRuLh6+8sZSRF0MKaZnSO+LCCa6ibFlRNqATOfudbKLc?=
 =?us-ascii?Q?zzqtFphAaHe7mQNeTipjrAuRV5T9iUVEHWnMzpzr7f5B/R2B/zAkX4t4DzaM?=
 =?us-ascii?Q?WhOqoZ0d3bGmEoH/1Uo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd36f944-de3d-405f-a678-08dbc429df4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2023 16:00:32.1839 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LPxyVnC2mSC7UtP3T5UsTN22axMyizDcqkJsSZNAtrTwbvlWdCFwkFJfIwvZndAz9bmUiZ9myCBZDIjw9mVlfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB9246
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
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - max-brightness
> > >
> > > Why is this mandatory?
> > >
> > > There's no point in setting max-brightness when running in I2C mode
> > > (max- brightness should default to 31 in that case).
> > >
> > >
> > > > +  - default-brightness
> > >
> > > Again. I'm not clear why this needs to be mandatory.
> > >
> > >
> >
> > Ok, you are right, I'll remove max-brightness and default-brightness
> > from required properties list. I think to change these properties, for
> > the pwm dimming, into a clearer:
> >
> > - brightness-levels (uint32)
> > - default-brightness-levels (uint32).
> >
> > For example:
> >
> >   brightness-levels:
> >     description:
> >       Number of brightness levels. The actual brightness
> >       level (PWM duty cycle) will be interpolated from 0 to this value.
> >       0 means a  0% duty cycle (darkest/off), while the brightness-leve=
ls
> represents
> >       a 100% duty cycle (brightest).
> >     $ref: /schemas/types.yaml#/definitions/uint32
> >
> >   default-brightness-level:
> >     description:
> >       The default brightness level (from 0 to brightness-levels)
> >     $ref: /schemas/types.yaml#/definitions/uint32
> >
> > Example:
> > brightness-levels =3D <10>;
> > default-brightness-level =3D <6>;
> >
> > What do you think about this solution?
>=20
> If you want to introduce a brightness-levels property then I would expect=
 it to
> be defined with the same meaning as pwm-backlight (it's not relevant to t=
he
> bindings but ideally it would be implemented by refactoring and reusing t=
he
> code from pwm_bl.c).

ok, I'll use the brightness-levels property as used in pwm-backlight

>=20
> Same with default-brightness-level although I'm not sure why one wouldn't
> just use default-brightness for new bindings (doesn't default-brightness-=
level
> simply do exactly the same thing as default-brightness).

ok for default-brightness instead of default-brightness-level

>=20
>=20
> Daniel.

Thanks an best regards,
Flavio
