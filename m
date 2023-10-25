Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4599F7D6209
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 09:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF6A10E56A;
	Wed, 25 Oct 2023 07:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2073.outbound.protection.outlook.com [40.107.20.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CAC10E561
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 07:02:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cd7QL0me3MlDcMdz8O1U7euEbpBe+BARKy4QAiAvrQPMxrMG+l5tY9PlzrS9+ykG9MVcXgzZuBfFdhkSXhvDmPpUvUohQxp8EKJv+kN9KiqYyb9Z1KIKensLl7GvKmdtA0ToZmltz4G95Fw9CNGr21BQ2IRvXG7dgjbbobvQkquPC8mUGpbDX1iHgkMLdYV/RfPpJn3jfVfCv6UvNIzbFa3tTfVXEWvAoH5+mujcNV1D3C9SM+rukmxC8FPpP1LH8Sh7MeiEUvUuC5kC1Un0LQgd2mbrdltw3nw5pLrs6GjSb92t8PrdVtefC6BINzDkNhhMejEXuckKFbWoZXKJ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3tIfvHIcz2l+F98OvOvxxVvJi/wJSXL2Yeqp41821s=;
 b=bQe3WOuV2qzZ4aWTLxRTRGEf01GmStioi0i0poiU5xrczuW60CvKHAqMhaa4orp+eddHHHrkKiKdF6JJHH19ti2yQBep6l/FzeRh0vyPlmYOqF6yFibbHVXbJnTSbJ6X++roRbdnXgytby38AmBpYfwFp9Wd3PVq9N0hvAB2J9DMfwgr2mO+Gs7sGJy/iUsVSpo2mtU3HYBDOSeZku0h0VA3KylHa7VTFbKgpcbGKZLNlcXG/g8MmQNAoCdnwngxTjQtrpAUj26/UNSUs4pGnSMjU2PA7QcgAWZKxj3AXzx/T97Lb9U9ZhDzbonBSRUCQCRjCQtTgHJKUqda3f8FMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3tIfvHIcz2l+F98OvOvxxVvJi/wJSXL2Yeqp41821s=;
 b=Ni3vlAvjhjmz6/kqc3oGnH6ZBv8B1PHVr+EVtpZ+yuwQNQpmaOx7uzudMraowqNtBY1nTUyRHh1qkKckYgYAV17kTPNsnvYhjK5lq9QTu5V7liGt+jcHQQRR97mhG4jOwQj65dhlK0S15veGjn7CW6IEKzPNm/4U8S9V8iYcXUk=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by AS8PR01MB7509.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:28b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 07:02:02 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::ad2b:a1e7:8828:ba2f]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::ad2b:a1e7:8828:ba2f%7]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 07:02:02 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Conor Dooley <conor@kernel.org>
Subject: RE: [PATCH 1/1] dt-bindings: backlight: mp3309c: remove two required
 properties
Thread-Topic: [PATCH 1/1] dt-bindings: backlight: mp3309c: remove two required
 properties
Thread-Index: AQHaA10IhwE5ZkDArkS4RoPMFlMBm7BS1g+AgARFCACAAHpeAIAA+0AQgACAlACAAQj6QA==
Date: Wed, 25 Oct 2023 07:02:02 +0000
Message-ID: <DU2PR01MB803494D40BCC004F269080C1F9DEA@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20231020135434.2598578-1-f.suligoi@asem.it>
 <20231020135434.2598578-2-f.suligoi@asem.it>
 <20231020-moonrise-senate-86d0edb2d404@spud>
 <DU2PR01MB803498DFD93E82DD3947D72DF9D8A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
 <20231023-anybody-silver-4548023f8f26@spud>
 <DU2PR01MB8034CF8EE4358B9446809AA2F9DFA@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
 <20231024-paddling-spongy-be82eae03228@spud>
In-Reply-To: <20231024-paddling-spongy-be82eae03228@spud>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|AS8PR01MB7509:EE_
x-ms-office365-filtering-correlation-id: d5539598-dfee-437d-29a6-08dbd5284a40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S/pRl01yDgdYGnH5eoTGJ0FT2EZM+cG9ag1vN6Xs7sMqSYcDSl84QZFrHkBB4BiH65cUOhQ6PvK2FOPrhJCtskxwpUAl5jRqmwR4T+0njq+zSz4Ub8zgm8KAmyXZhN1m1cj/OzFZmXrHsbY4/hF3h0vYNkBpwfgP+ExM0bJKITGsuBRCXEseEgwzutrtGMPIXuDp+fEPECdf/xapdn/WeG48adpnf/Td0ijDcgFPOcp5Cu6FLJ0Ig/l1whx59RtWBqqR8RQVomYrqtHb31r4d2uCr8UA0M/1NV+n2UtZmUvDYqf2Qj7eMwg3+X+HTow93NMSWmO4f2vxVk+1s6faA2O/PeR1IhHWjC6soemTviT8bcCSONmL3NgxEiokkF85Yt1rNez3ynuUtdovDUs0yXylHK5ahMXOfTF2bQFCNVgcpEf7+xmb2EHxepREwSdayLA/um3ckvWlRRL3K0Fs0EsX3dBgi7ZLTcbNOEBNh0Rim+LIkvcP9xmHUZ4gf1CXffCzu760F1d8fwRi34fFeWbMFLXhkzrw0KMSuUoYYiSIfhN3xRWy9XG5kX796Gj1dLD9epdmu5een1oRkX6GS/4SGhN5r0qAJzgDsTmHaZqUlqH+KqFhY4NBH6hnkH56
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(136003)(396003)(39850400004)(366004)(346002)(376002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(122000001)(38100700002)(6506007)(7696005)(9686003)(478600001)(55016003)(8936002)(41300700001)(83380400001)(26005)(2906002)(7416002)(54906003)(6916009)(66946007)(66556008)(66446008)(76116006)(64756008)(66476007)(5660300002)(52536014)(4326008)(8676002)(316002)(71200400001)(86362001)(33656002)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2TGWzRncV+BkhSyfcMj6KVXaRAdnYmnVr0QYX2HIOU+U44OGHSoqAQcx013t?=
 =?us-ascii?Q?00XGnrpBOZsuqj3gbMGIZ4oNZVtb6rSgkcYrGJsE/i5QlXB7cnUKaGQrNo9o?=
 =?us-ascii?Q?XcxX3+QiIwD4hLBRCElL1dyu/4/GIirboiqZZJ+OK+iNHGuGy9BFlru9SGP2?=
 =?us-ascii?Q?6TdAfGQMp1DGtCFeeH4gM++7JqL57MCCupL2ayv2zNX6MwuYTrUwvbitLSX5?=
 =?us-ascii?Q?vWo1E3D64pLYDfk9KDGKzlT4OnKBJo3QQlVUuJ9oXaBFR0YtaeFZZwmxYIF4?=
 =?us-ascii?Q?llU+PsdmO/5eeV5pM6d5K+N9JS0oNC3c5U4nVyiFIZxFZz7EJhfsDpuG5/Me?=
 =?us-ascii?Q?Cjxcjb6KBLNPoCIVR/A918PWYX9HQ3kawoLnCUxgooOPBxJHl5P52BtKKwuP?=
 =?us-ascii?Q?eqfZIQtaKb4xQB4tb7VoUIPgv5NQPmBtV6nJ2PnWhxnGlc3RFFe2lVSqmUAB?=
 =?us-ascii?Q?mz8UWv1Jvl3RzoRaE1jNUu+vSfmFNJRja0NSSDMu5Zu/8t+hrVBC7Pg0Gxvw?=
 =?us-ascii?Q?N2qnrJ0GIbT9BsY5hMMSS9aXt3mgVjgJIDN2xFJnGydq1f1OZEYcHDUHApQK?=
 =?us-ascii?Q?/eh6l5n5T4N/fPP3kzPVRxoLDsM3eN+9h0R+wXOwGgec+8wzyFX6Rt8Wa7pB?=
 =?us-ascii?Q?G4QI9F6A5CmvThsbtQDtc9B7kSglkPAxG6F3ML8/EqIvBitm8252zldnVx44?=
 =?us-ascii?Q?G9BeVhi3oGg8zfuqukDnCQwIZny0yKr7YNnNmZoOR4psxC37mC5hXscVLYqR?=
 =?us-ascii?Q?ksHfej1TUj1A16WiNpWOMK9aTGFXj2g0tcqTu9kQuefZb1CpjCzNLd7by6rn?=
 =?us-ascii?Q?MtrxK6DwS7cKVxO4Dk4L5ITD6+K7n3SYSk7Gq1HQjgnYfw4dFetoKZ9jsyNt?=
 =?us-ascii?Q?a2BnOBUaY/Yt5KxunMHlq+oPjdkDVM3XWtj3RUCBC9RfmwkyYGzFxrDfvSr8?=
 =?us-ascii?Q?RW8I0UAdno/RYPYEpBrxQB4etOpFWh+XAOcDjKnfH6RPs4FELPeZxGmJGl4v?=
 =?us-ascii?Q?6/CE7omduX7tiM0bG78bhmlHapMkgyy1or9swPxbX3Eo+ual+ryxwXROZ+Sp?=
 =?us-ascii?Q?ZzOMclDsFKxjWAQe3amRn4joZw8JV5SFzo+ZZckx/u0qMSTPCNIArRhG/q/C?=
 =?us-ascii?Q?55Z1tvFnbAZdx8uVBuCcYTza/faCsDlebd5DrNnUhkWelGryohrb4ldgg5d9?=
 =?us-ascii?Q?OH1CsEpzdqRJp3PNxRMPc974QaG37QOKlSgwaWn7w5XUJTF3Gzxqrl7ct7KO?=
 =?us-ascii?Q?uLuckFisXk9MORPQ04i6cZQfxp2QiypCkjj4gu79GhrAt6LAnCWIFFimkdjO?=
 =?us-ascii?Q?ac1zO5mjIb0FJ32zWPDwhWLzB+4bFv+y9zSvH2y06kraFHGZl6P+QLWWv7ou?=
 =?us-ascii?Q?Ha8/LJmi/ckwd55l1VzWuIMSa1jUlkAqQkUkU22xQSROkxb4WhdqDLPiE7Xm?=
 =?us-ascii?Q?gJsoygOZEgJrvHACR2DS5wEW6f/+5rdBCZZ0SYmv+FMOLSV8D2h8vlUDENUb?=
 =?us-ascii?Q?BRcMIPf0okVmbRtb40KhAOyiihmbsggdKBie8srqDkFlo+1ONbMEGXhUZh4z?=
 =?us-ascii?Q?raORVW73yUjlkB53lZI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5539598-dfee-437d-29a6-08dbd5284a40
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 07:02:02.3812 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qHs2W26yRDAoDJ7OXw2jMjfPDN3ZJRPNviK3vxNuHnh2q93I2lTRbm9GSrIGgZmcPa7P03qXq8Ed5z5aZzacNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7509
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

> > > > > > The two properties:
> > > > > >
> > > > > > - max-brightness
> > > > > > - default brightness
> > > > > >
> > > > > > are not really required, so they can be removed from the "requi=
red"
> > > > > > section.
> > > > >
> > > > > Why are they not required? You need to provide an explanation.
> > > >
> > > > The "max-brightness" is not more used now in the driver (I used it
> > > > in the first version of the driver).
> > >
> > > If it is not used any more, what happens when someone passes an old
> > > devicetree to the kernel, that contains max-brightness, but not any
> > > of your new properties?
> >
> > This is not a problem, because the device driver has not yet been inclu=
ded in
> any kernel.
> > My patch for the device driver is still being analyzed by the maintaine=
rs.
> > Only this dt-binding yaml file is already included in the
> > "for-backlight-next" branch of the "backlight" kernel repository.
> > At the moment, this driver is used only in a i.MX8MM board produced in
> > my company, under my full control. No other developer is using it now.
>=20
> Right. This is exactly the sort of commentary that you need to provide up
> front, to have us spent a bunch of time going back and forth to figure ou=
t :(

I'm sorry for wasting your time, I'll add this information in the next comm=
it.

>=20
> > > > The "default-brightness", if omitted in the DT, is managed by the
> > > > device driver, using a default value. This depends on the dimming
> > > > mode
> > > used:
> > >
> > > For default-brightness, has here always been support in the driver
> > > for the property being omitted, or is this newly added?
> >
> > In the first version of the driver this property was a "required
> > property", but nobody has used this driver before, so this should be no=
t a
> problem.
>=20
> > > What I would like is an explanation in the commit message as to why
> > > the revised example is more helpful than the existing (and
> > > must-remain-valid) one.
> >
> > As said before, no one may have ever used this device driver, so I
> > would leave only this new version of the example.
>=20
> Okay. Please improve the commit message explaining why it is okay to make
> these changes & send a v2.
> The alternative is that Lee drops the dt-binding patch & you submit a rev=
ised
> version of the binding alongside the next iteration of the driver.

Ok, I'll send a new commit v2, explaining the reasons for the changes.

>=20
> Cheers,
> Conor.

Thank you Conor,
Flavio.
