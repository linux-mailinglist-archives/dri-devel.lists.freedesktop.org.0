Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC0A7FD532
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 12:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD40D10E1A4;
	Wed, 29 Nov 2023 11:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2080.outbound.protection.outlook.com [40.107.241.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9E910E1A4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 11:12:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Id86VjwK2JZRkLDXJyFZJ3fCgJTL4NAyyf7YssgkWOcx1ivjGkmMPa1ibjQnT1NHrOd05kyWTLVoPtcIBc5T4AuWBOFXryZ91WL/pIdIcVrmJDOSMYuD5xQ8H6AIWQ1J6gIwjzZseoESs22qoBwKHsazImhbfBj3Zko5mmYPhLeCU0AXBEafpN7gNM4WaAHPxHBoBvzyLplkFIgxac5gfsny1gkfDI+jmmLVwgscnOqls+SQUfBl0BOvaAfUpMceemh8sshJSLSdmlMTn0HYIsHc3r78N5GsypQvX2Zo9Uh0b2koVW4gEuWoCQqR9WYnf56F87Ht+Bvzbh1c1NClLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYhu8I2oCHXKIsovWjlIk2ngbSo/clss8W7/yb0uRE0=;
 b=QdCbklACYZATvipLT7x2VMNBNY3Vp7Upo9uJ77edWN4FZMmDb5XuiSJo1Bl5IOBMwM5C6Je/qaZqL8KZeB9eYZsomyS527IYbb3eXVPhbPnd/d+y0WUX1Jfh+XPwcVVrT8jvnfHFNUWioAzynU46na5JI3bgRWPM9rrB7fpCFyWmfujivinb0+dKLkqTl0NqRkU1wLWpC1+VyraLy20ecM+GuX+oJUb8XDny04ZlN7Yx+xnlPa1OwnGdK1OwKTbXfdFLH1+0CRzxHL5+QkVawUhpgsKJ1TY33R1FToRp6TVLbpWlDO63QIZ5W8AiMgKgTg+1YFggFgK0gLQ2JKuroA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYhu8I2oCHXKIsovWjlIk2ngbSo/clss8W7/yb0uRE0=;
 b=BG5xqKGZhCY60JhPEvwj4n89LJMeKfDz9wi0ioe6A9nUT+IgZsGak02u0j5Bxb5eEK+geDdNUs2SQYC9bnClFePkw8elibLl9SETgA9vzwZFR4nUeiHGBQ+7UllNuEZDVe03qeHBRh8I9O1OFXuSc0kvsQysa5WhY55tHqlsMms=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by AM8PR01MB7603.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:234::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Wed, 29 Nov
 2023 11:12:30 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::6938:4551:b9e4:d8f7]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::6938:4551:b9e4:d8f7%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 11:12:30 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: RE: [bug report] backlight: mp3309c: Add support for MPS MP3309C
Thread-Topic: [bug report] backlight: mp3309c: Add support for MPS MP3309C
Thread-Index: AQHaIcteksOk78Z0FEOyREfLI6lWULCPZHvQgAHA0pA=
Date: Wed, 29 Nov 2023 11:12:29 +0000
Message-ID: <DU2PR01MB8034C4DEA3CC0BC7FD76A0AEF983A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <af0a1870-693b-442f-9b11-0503cfcd944a@moroto.mountain>
 <DU2PR01MB8034E29BB2ECDAF13972F484F9BCA@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
In-Reply-To: <DU2PR01MB8034E29BB2ECDAF13972F484F9BCA@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|AM8PR01MB7603:EE_
x-ms-office365-filtering-correlation-id: 85412764-dff8-4588-7884-08dbf0cc13b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PGF8Uhb27ituDm6Wb0SaIQYDJDYpmIuz6kEoNr9mUZy+MIbAKsuUljL1dMcd++owuZp84kDYMebNqjDTN8yY69Mz7dKwj6uTnczw1GmOqoMf8GWfpbY3c9Mk5VY9Np/KLtyaVv32iQLIioPQQqF+F1l2ybcPQDAsOcGlXPVI1/V/aRkXoASyUcvPNcDmC3QWZGDBDgpaW+XNwbDDUKzlSrjp0q+OCc4ll5p1CzcrQ6SiFYpg1FlYyaSwNGKkK4KEMd0BXh1PtFptt7AeMwWh2tygPuHNk7v6NLxoyTasS4lR6txTd8PDrfrrcKZV+/Jj6ps3o0nEwnoi6sq62MDRxKUuNxpG7Xmjwv6RB6WNa7iB7BuNsYCE5bN8dHCX5wUltB13TXkxb1p1MtsRk7nAQyoJyo5gifRChDAXnApSufwL483nLS0qEak0ph4VeLRDm6aWJ+iRNoFXlPW9zHJIXWsVjkgtCkqpHKxqHufFhy4u6CZjegPkF1/FuVmoG2qEmgzdaj/c+PHWRvP8Hk9+L+BNSGIxuvfnIwJWzfdFN0ADT8G2DZcQ9eSPiUhSTyeV7HcvIqsoPYL2HPFeNUlTqVINMEguDG39cjoEoAoJB4aCjZLz3WJnkUGio/UWZoBCd22yqPjSQKNk30EJffUF8VBF5/p9SZXg/peACpRRGmM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(39850400004)(346002)(376002)(366004)(136003)(396003)(230922051799003)(230273577357003)(230173577357003)(1800799012)(451199024)(64100799003)(186009)(55016003)(122000001)(26005)(9686003)(53546011)(478600001)(7696005)(6506007)(71200400001)(38100700002)(38070700009)(86362001)(33656002)(66946007)(2906002)(41300700001)(83380400001)(316002)(76116006)(64756008)(66446008)(6916009)(8936002)(66476007)(8676002)(5660300002)(52536014)(66556008)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mB0MB/JMerHb2ZXSOZ/IlL487w8F+0Ov9RssDxYQI3fSHd1CpImGBSqd47P+?=
 =?us-ascii?Q?RZhtn5ajhZEQ9c6jw2ZiwrjjQPL2LmfSSxV0B9BmjS5Kh+dzhFtq6/fj4Vea?=
 =?us-ascii?Q?8gYdH6YEI5MB6e4aasQwW2ZWB1iKRNGqV4pshNJs+zkN+xKsyjZAAwuV4hgq?=
 =?us-ascii?Q?qRTTO8zv60/crQwDgRsHK3T7EAyR6XaQx/PKrvbBpRhUsp1j1wC+FB6XFegD?=
 =?us-ascii?Q?W0XItuwV7vz/4/kLOTLJodC4XPF8Wxy0LRdiTmQRK86h6oDUxE95Mue51ZpR?=
 =?us-ascii?Q?P5rG+w5BTFi5Lz5KyX+cM8JBWg/0Ft7K3E+Zou9leShfr3jM3it5t+C5H1pf?=
 =?us-ascii?Q?qpmk1gbC05hSZ0+cpfBdzI/appyDE1I1AW+TcAQuyw9blAJSO7gs7nG45BXD?=
 =?us-ascii?Q?SeCm+5rDCt/GfaQkt/hC83NPGM0VBv6qlp43aEL1oFZ75iDU7cgZJTYcKdce?=
 =?us-ascii?Q?QAg7PUPvvCtKb9zPjbuf6PgWBR/Lt5+oJ1C3gV4ylKYpR4oICSVfvGd6RCks?=
 =?us-ascii?Q?aNGyBBySlgPDhuaxa8munE3zr2ygjBH8yyo6FhyX7RimeFg6IWCLmEJ8EMNL?=
 =?us-ascii?Q?QK0VBcxYQ2x1FM3tT2jtjmVsY8DAsssnC9m+8RQehBflS3/Aasgz/FDWcC88?=
 =?us-ascii?Q?C2mTNPa7pqd3qRHUNG9nmWyK5svWevKFMIkVaKmzPfx9YtLwc1UM9AJL0Av3?=
 =?us-ascii?Q?l8GmUx9wDC/GmXwt497I2wuxEr19ECET6Tuifd8Ze3wcKbhpKPOLVQPqVGUf?=
 =?us-ascii?Q?ffYl5fO6SjTekbk08pMA16SpJPNiKIR97ad771aJcnql3T922OzQ9XfytAEF?=
 =?us-ascii?Q?KQLO2A0qxppgSQffujR1AHoW55Auq8k7D2zdYUL+bW5SeX58KtqRGEUryItz?=
 =?us-ascii?Q?8DX6NcEplmarIwHpKqB1VAZHQujtaH2AdjgYoL727YhmuKqWBRy5LCHKXknf?=
 =?us-ascii?Q?gvv4rgFkjSXwFg53paGAMYt1K4OQ5SXM7MGiGNeuoUZAC+b05CqpdZ4SAB1n?=
 =?us-ascii?Q?9QX/jd7afRP/Y4sjnYH8bLfyc2a2wWvAn0RrxQiHjenBC7QUh5K6RMxFoJU8?=
 =?us-ascii?Q?TzXxWrX7wfTaKLQtqmiFi7Qke+xtG5yLcceBfxJ2iAMHheWlH9CpcOxWOjNp?=
 =?us-ascii?Q?7vSAfqC2lrwhQjcpvjA2bFbMeJY0DkQEbCSVDGbmj8KntHicUPOj6iOziBIJ?=
 =?us-ascii?Q?o7It7crajAD5AWiW80G48aBjY8S/PiiGOA+0a4zLSAV7f6cIjrGtx8OL7QQo?=
 =?us-ascii?Q?bwyj3gfZ5GVroe5AluGfQmnNuYG4OY9rSyvmdhp1fegN8xsEpFF7BU0EUsnT?=
 =?us-ascii?Q?ctsBB+cvpSlTp8/c5osaX5R7sXjEAdcx53qSoE7Y1hHzwOsFLay5w0LOCAAd?=
 =?us-ascii?Q?emOyAFjkoHwLjqZmc02c00yjHqqYOuiSjo8Q4srl1P7j0zIEdnoXOEchyS3/?=
 =?us-ascii?Q?69z71iyHcY1Mn/HTOxdLm4SW7cMaFcNT8ieeDcxXfk8l0wP3Ms5NorDfmOj3?=
 =?us-ascii?Q?ku0dFPzE6X4JkBDEG3X7xHZyv1lHLHLtDcmStE9QwYLt8VudVaAQDvnjRMLH?=
 =?us-ascii?Q?1dlSpQO31xwDrAlr+Ws=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85412764-dff8-4588-7884-08dbf0cc13b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 11:12:29.7721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UGBgm/B+32b95Srhj3mo9VKg8Sk89b9lrHqcenhUxL2gESEjNImVo83RKZ9poN76R8WrI48LTBbLfLDShAEynQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR01MB7603
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

Can I add the "Reported-by" tag, with your name, in my 2nd vers of
the commit to fix this bug?

Thanks and regards,

Flavio


> -----Original Message-----
> From: Flavio Suligoi <f.suligoi@asem.it>
> Sent: Tuesday, November 28, 2023 9:24 AM
> To: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Subject: RE: [bug report] backlight: mp3309c: Add support for MPS
> MP3309C
>=20
> Hi Dan,
>=20
> Thanks for the report, I'll fix the bug as soon as possible.
>=20
> Regards,
> Flavio
>=20
> > -----Original Message-----
> > From: Dan Carpenter <dan.carpenter@linaro.org>
> > Sent: Tuesday, November 28, 2023 8:20 AM
> > To: Flavio Suligoi <f.suligoi@asem.it>
> > Cc: dri-devel@lists.freedesktop.org
> > Subject: [bug report] backlight: mp3309c: Add support for MPS MP3309C
> >
> > Hello Flavio Suligoi,
> >
> > The patch 2e914516a58c: "backlight: mp3309c: Add support for MPS
> > MP3309C" from Nov 16, 2023 (linux-next), leads to the following
> > Smatch static checker warning:
> >
> > 	drivers/video/backlight/mp3309c.c:277 pm3309c_parse_dt_node()
> > 	error: uninitialized symbol 'prop_levels'.
> >
> > drivers/video/backlight/mp3309c.c
> >     202 static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
> >     203                                  struct mp3309c_platform_data
> > *pdata)
> >     204 {
> >     205         struct device_node *node =3D chip->dev->of_node;
> >     206         struct property *prop_pwms, *prop_levels;
> >     207         int length =3D 0;
> >     208         int ret, i;
> >     209         unsigned int num_levels, tmp_value;
> >     210
> >     211         if (!node) {
> >     212                 dev_err(chip->dev, "failed to get DT node\n");
> >     213                 return -ENODEV;
> >     214         }
> >     215
> >     216         /*
> >     217          * Dimming mode: the MP3309C provides two dimming
> > control mode:
> >     218          *
> >     219          * - PWM mode
> >     220          * - Analog by I2C control mode (default)
> >     221          *
> >     222          * I2C control mode is assumed as default but, if the
> > pwms property is
> >     223          * found in the backlight node, the mode switches to
> PWM
> > mode.
> >     224          */
> >     225         pdata->dimming_mode =3D DIMMING_ANALOG_I2C;
> >     226         prop_pwms =3D of_find_property(node, "pwms", &length);
> >     227         if (prop_pwms) {
> >     228                 chip->pwmd =3D devm_pwm_get(chip->dev, NULL);
> >     229                 if (IS_ERR(chip->pwmd))
> >     230                         return dev_err_probe(chip->dev,
> > PTR_ERR(chip->pwmd),
> >     231                                              "error getting
> pwm
> > data\n");
> >     232                 pdata->dimming_mode =3D DIMMING_PWM;
> >     233                 pwm_apply_args(chip->pwmd);
> >     234         }
> >     235
> >     236         /*
> >     237          * In I2C control mode the dimming levels (0..31) are
> > fixed by the
> >     238          * hardware, while in PWM control mode they can be
> > chosen by the user,
> >     239          * to allow nonlinear mappings.
> >     240          */
> >     241         if  (pdata->dimming_mode =3D=3D DIMMING_ANALOG_I2C) {
> >     242                 /*
> >     243                  * Analog (by I2C commands) control mode:
> fixed
> > 0..31 brightness
> >     244                  * levels
> >     245                  */
> >     246                 num_levels =3D ANALOG_I2C_NUM_LEVELS;
> >     247
> >     248                 /* Enable GPIO used in I2C dimming mode only
> */
> >     249                 chip->enable_gpio =3D devm_gpiod_get(chip->dev,
> > "enable",
> >     250
> > GPIOD_OUT_HIGH);
> >     251                 if (IS_ERR(chip->enable_gpio))
> >     252                         return dev_err_probe(chip->dev,
> >     253                                              PTR_ERR(chip-
> > >enable_gpio),
> >     254                                              "error getting
> > enable gpio\n");
> >
> > prop_levels not initialized on this path.
> >
> >     255         } else {
> >     256                 /*
> >     257                  * PWM control mode: check for brightness
> level
> > in DT
> >     258                  */
> >     259                 prop_levels =3D of_find_property(node,
> > "brightness-levels",
> >     260                                                &length);
> >     261                 if (prop_levels) {
> >     262                         /* Read brightness levels from DT */
> >     263                         num_levels =3D length / sizeof(u32);
> >     264                         if (num_levels < 2)
> >     265                                 return -EINVAL;
> >     266                 } else {
> >     267                         /* Use default brightness levels */
> >     268                         num_levels =3D
> > MP3309C_PWM_DEFAULT_NUM_LEVELS;
> >     269                 }
> >     270         }
> >     271
> >     272         /* Fill brightness levels array */
> >     273         pdata->levels =3D devm_kcalloc(chip->dev, num_levels,
> >     274                                      sizeof(*pdata->levels),
> > GFP_KERNEL);
> >     275         if (!pdata->levels)
> >     276                 return -ENOMEM;
> > --> 277         if (prop_levels) {
> >                     ^^^^^^^^^^^
> > Uninitialized
> >
> >     278                 ret =3D of_property_read_u32_array(node,
> > "brightness-levels",
> >     279                                                  pdata-
> >levels,
> >     280                                                  num_levels);
> >     281                 if (ret < 0)
> >     282                         return ret;
> >     283         } else {
> >     284                 for (i =3D 0; i < num_levels; i++)
> >     285                         pdata->levels[i] =3D i;
> >     286         }
> >     287
> >     288         pdata->max_brightness =3D num_levels - 1;
> >     289
> >     290         ret =3D of_property_read_u32(node, "default-brightness"=
,
> >     291                                    &pdata-
> >default_brightness);
> >     292         if (ret)
> >     293                 pdata->default_brightness =3D pdata-
> > >max_brightness;
> >     294         if (pdata->default_brightness > pdata->max_brightness)
> {
> >     295                 dev_err(chip->dev,
> >     296                         "default brightness exceeds max
> > brightness\n");
> >     297                 pdata->default_brightness =3D pdata-
> > >max_brightness;
> >     298         }
> >     299
> >     300         /*
> >
> > regards,
> > dan carpenter
