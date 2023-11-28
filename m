Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320487FB403
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 09:24:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B78310E443;
	Tue, 28 Nov 2023 08:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2062.outbound.protection.outlook.com [40.107.6.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6434710E443
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 08:24:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I+kraAtFqlbXHYRrOXU3KUv84EbHdP6aREf/wd8nADCZ0Abh2tv2iDCwWz6A3OHdkezyg3Ia7Ngi8OowD5jY/ysRoAp25QgOK81RFGZ1Cr1uaZkpOTK+DODbHSEGz89bZ6vuzi3O3ri3nrjysrjpjQerF3rFt6lbtXWdEfbTY1qPDjhozFZis+2QmNnpJLi4QsE9fpQOtn6BndYkVRz4zo/wgTNlzKXgqs+1hkTcQzHqS7oJbNVlZh38F8I9hbmcdoLdcK4xK/Q+qftzTjVaLg6p/4FZ/tYEBr9o70kY6iPFH4ILj2Z13L7ZIZuNsGhgdDnYgjgNfxkiCDKhv6JlKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksxGlrXnCypty900k2tZZcV/uvl9jMeO4PXUzwLGVn0=;
 b=dOEPRIqj8+29HW+9UGfU2IHl5bhh8yR75JY0hG2uKXbCqu6LuzSdNUqTniuBzA98pNhg8evgUMxxVBi/GlnwSNz8PwrT9QbvDr6sO8N1gZ5tA2T35wX90nkGMKYOa8b4wpR1FKappGVTWt+ZE9r2oUMZ8Y25RXfj6lkjD6xij1ODLSxvW3tyVZB8GZs6WPgewTijzq6vaTqFwuIayNe/8S4B36xZlJJIM28ZupEqF6W6oJbAicsnapAsIKhIbFer5U+rfxdxqwicQdNPb9ZfiyXC2sczwfnuWcqT4CovZ8N8HMlTZ6xsvw2nWAjn9vNd50VFKYHOTwgd/ELplt2APA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksxGlrXnCypty900k2tZZcV/uvl9jMeO4PXUzwLGVn0=;
 b=G4bl+L+gD60A0IYdGRemoaR/7eq8Iqw6xsmjrG5c+wDpwne86VqIqpWb4iFYfD9baulCWgJ2s0FH9uMYMY6osptMR2I8mDlvtaXstM7etGvcEQcLJzAY2oFT8HuFD8hdSnMrCgrfvlBsrMaSJTu4fxI3ELjXovdlRIIO3mVTX8w=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by PA4PR01MB7184.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:f7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Tue, 28 Nov
 2023 08:24:21 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::d8ae:6d5c:e58a:4bde]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::d8ae:6d5c:e58a:4bde%7]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 08:24:21 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: RE: [bug report] backlight: mp3309c: Add support for MPS MP3309C
Thread-Topic: [bug report] backlight: mp3309c: Add support for MPS MP3309C
Thread-Index: AQHaIcteksOk78Z0FEOyREfLI6lWULCPZHvQ
Date: Tue, 28 Nov 2023 08:24:21 +0000
Message-ID: <DU2PR01MB8034E29BB2ECDAF13972F484F9BCA@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <af0a1870-693b-442f-9b11-0503cfcd944a@moroto.mountain>
In-Reply-To: <af0a1870-693b-442f-9b11-0503cfcd944a@moroto.mountain>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|PA4PR01MB7184:EE_
x-ms-office365-filtering-correlation-id: 04d10471-0c91-498a-2464-08dbefeb6c58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mIFjfrCeNzy1xCP5Bo9mw5OCFNjuO7acddXvNCCfww1g68Xq7fxqV5GzW8X84UaaPfzlX1DytVeMwXzetQ94ZBrWA8xZCr8KN0hIf5U9WXxIGcxp9VQeNO2PEVNvlVVsmKRrtHLekFeWzNXODM7eN6t9rw5BRrai5zVBBVMGCv/YHjXgs7/bFzr3YR8LWyP2DxTKk20h+Q7owZfdBTPxRsUIN3yYxMY08WCdWUqYllarAigayw8/lE99eKCmddwl1i6uZ8bWP8L80XCT+U61vMIpAYazb2fJQogWtF/MVELVLmbDOMuNKuEZ7jn/Qw9ykJ/f3oeu/9ZldP9nCIjSS8s/oagNIKPGtoxBnHGmIapkkuZAUo8CSQsrSewgw1k6EaqKWehp7qpwOh2d6CpA9NofQ7bhaAhcrMvRsWJQFz/zR5Alu7TcorYdiwaasoifEKgKR3s57mk07T8bjKoIwGnHf54xtx/w9d7nx4zAbC2HHd6saIveVqZTKJJRUiJm6u6hbG1YLGGMXrYah38AGAJFO2+XTkcW+9WFrg+HxVzQopJ6Ie+yizXvCvY59bLsU6watHzWm3iMTHRjm0u6MBzrcbVfTAXlQiP6Cq6Mt2JLlW0K/A1LwRdXKKpwpzACnGvdx80CjExKVc4ShIExaeAVNIktULJZGPh1znEUClY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(39850400004)(136003)(396003)(376002)(346002)(366004)(230173577357003)(230273577357003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(55016003)(2906002)(5660300002)(9686003)(71200400001)(38070700009)(52536014)(41300700001)(33656002)(478600001)(7696005)(8676002)(8936002)(4326008)(6506007)(122000001)(38100700002)(66476007)(83380400001)(66446008)(64756008)(66556008)(316002)(6916009)(66946007)(86362001)(53546011)(76116006)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jjx+gydeNERZr0Td3jwvExZK9dhPwNf3FPs/ES6KbufLNXSg+5tNGxOaZ0JO?=
 =?us-ascii?Q?x6o/PMvOHp9s3LvBdWhdHqEyLvxywTXGGslTByoHwYWHpBqytKlJfnHlIqYC?=
 =?us-ascii?Q?vfp+8nBLPUiT5GFaaqshCHXPcxQpoQrI7R0T/AJumcvD+BO16anlFz0pM8ay?=
 =?us-ascii?Q?K/lvys3nlvlbjIp1eL60Dy7ckbFqnXw6aflyXK0RL3v1S3u+CquQd6locQJT?=
 =?us-ascii?Q?Djs6GIhLVj2eMk97O9dnhhmTOh1PNCxKjOpuq9AJ3HjbeLa26XObZwEElgQg?=
 =?us-ascii?Q?5g9IOkhPUenQ25UazjoCiesyW3P/Y+zhrh5iYDJgYKbbgPmQ+KwvsEEELlj2?=
 =?us-ascii?Q?Ip2/rYrPG5HAIhcnbj0XsfovCu2dNweV+K/eje1e00u4Xdfmm4BwBJLJziZp?=
 =?us-ascii?Q?mM1oE0MtmdhtNbFPm52Zjp6U1b0NdG3DwEGedONZDqv2WceAcStR0F8vEeZh?=
 =?us-ascii?Q?NSSdh0L/lg92JITOYgvIVN+fqTpeaTeHEARDajDDxQed0FoCyKHAZOMsMXsV?=
 =?us-ascii?Q?EH5kdD8Zg9WJoJaNTTzkMeeSIc9/0M/RD853aQRbQGFs9AimjXeP0AyjUN6V?=
 =?us-ascii?Q?KtMnd2EixMjFTvyDNTJBMWtddT+dMXxB4glqeBfHkwAcTSP6jK3fAWAGItZn?=
 =?us-ascii?Q?vO3xNUfb8NGVoDE9fzCGJMDgNuydLn0zxNP36D0hqIWJ3Puwy7nzUnxZwzbP?=
 =?us-ascii?Q?VTDdEVQRPp+jTiExkcpermcyTvF5oBGu1tZ4fuip/VCuMoO44710HY8agnww?=
 =?us-ascii?Q?FzXD9OVG1ZV5NNORmd9GgqBBpndxIg/r1DVXBT1jXY2JNzC+zGfiqltNORJe?=
 =?us-ascii?Q?ItyOLsHoQ8fZ1Wj63BOsOXecLvaXwAPsEXw6KYmn2/N1nMVHibrMuzbNU+QT?=
 =?us-ascii?Q?Qh5TgMWvfkoHk+YeV7L0u0RKi6u+VxBeQujK2jqcKzfo/UOl3PvbzuUWYezR?=
 =?us-ascii?Q?ibiFHzJfnD15a1qngvF4ROMPipgSOoAbjvScWFXQ7xDlRUB47Bery9QOieMH?=
 =?us-ascii?Q?uewXMmKlRXT0Bh5A/GYoDRUqJJP6hzm5F3asqk8UmXarTUSUtZUzc7dS0tNM?=
 =?us-ascii?Q?7XEOYWSz9JyNL41xQTULerx2zo/sS3g8DV62c9wjxBsRd+CGMyFsMpSHyR0M?=
 =?us-ascii?Q?ABcD2uw1OTEhVs5iTmKcajJ5Kr17yjAbRbgw6mYUk1JLylnWe1J72OWRfiXK?=
 =?us-ascii?Q?ETIJrzyUUH5fH08xz3mKM/u8cuu1uqLNsYM3M7V8HyXQuaKH9D047Fn/hQLZ?=
 =?us-ascii?Q?B1xltIgNYPy5w8JhaEMh+OzVq7w3Vm4MtubSSu6EsVW68Mfv5zrEuYKqNX5d?=
 =?us-ascii?Q?ARs/BywGySvdPtV9nSNYY0ulVit8I9ryya0ryKWBFTRZfFrNXdTJccLTvtpZ?=
 =?us-ascii?Q?fkTv84dfljx/YpYf2HL6e8G3nWwBaom1051IG7119aSfpw1cQZhYacjmQXpO?=
 =?us-ascii?Q?oBIjc2iDZjy7aHzPuskxacfUf8aCvyvgXA5OABMTM9bd3M3eP/4BylI2Bhrt?=
 =?us-ascii?Q?4QhhHc5Quek2iMSz1ADfrQQJhTSjWIYMdSMnQsPdUNhlUBHNnyr89epi1vfk?=
 =?us-ascii?Q?27sPsIPvwI9GHZHEzOU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d10471-0c91-498a-2464-08dbefeb6c58
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 08:24:21.6592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GflOs5utvx7EmVpk5lSWWAiUbCoVOSeN8pHHSlmaSAA3KeoCaL9AZFKSN0R6DLrck3ibbR7Rpi6w4g3GVJibaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB7184
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

Thanks for the report, I'll fix the bug as soon as possible.

Regards,
Flavio

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Tuesday, November 28, 2023 8:20 AM
> To: Flavio Suligoi <f.suligoi@asem.it>
> Cc: dri-devel@lists.freedesktop.org
> Subject: [bug report] backlight: mp3309c: Add support for MPS MP3309C
>=20
> Hello Flavio Suligoi,
>=20
> The patch 2e914516a58c: "backlight: mp3309c: Add support for MPS
> MP3309C" from Nov 16, 2023 (linux-next), leads to the following
> Smatch static checker warning:
>=20
> 	drivers/video/backlight/mp3309c.c:277 pm3309c_parse_dt_node()
> 	error: uninitialized symbol 'prop_levels'.
>=20
> drivers/video/backlight/mp3309c.c
>     202 static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
>     203                                  struct mp3309c_platform_data
> *pdata)
>     204 {
>     205         struct device_node *node =3D chip->dev->of_node;
>     206         struct property *prop_pwms, *prop_levels;
>     207         int length =3D 0;
>     208         int ret, i;
>     209         unsigned int num_levels, tmp_value;
>     210
>     211         if (!node) {
>     212                 dev_err(chip->dev, "failed to get DT node\n");
>     213                 return -ENODEV;
>     214         }
>     215
>     216         /*
>     217          * Dimming mode: the MP3309C provides two dimming
> control mode:
>     218          *
>     219          * - PWM mode
>     220          * - Analog by I2C control mode (default)
>     221          *
>     222          * I2C control mode is assumed as default but, if the
> pwms property is
>     223          * found in the backlight node, the mode switches to PWM
> mode.
>     224          */
>     225         pdata->dimming_mode =3D DIMMING_ANALOG_I2C;
>     226         prop_pwms =3D of_find_property(node, "pwms", &length);
>     227         if (prop_pwms) {
>     228                 chip->pwmd =3D devm_pwm_get(chip->dev, NULL);
>     229                 if (IS_ERR(chip->pwmd))
>     230                         return dev_err_probe(chip->dev,
> PTR_ERR(chip->pwmd),
>     231                                              "error getting pwm
> data\n");
>     232                 pdata->dimming_mode =3D DIMMING_PWM;
>     233                 pwm_apply_args(chip->pwmd);
>     234         }
>     235
>     236         /*
>     237          * In I2C control mode the dimming levels (0..31) are
> fixed by the
>     238          * hardware, while in PWM control mode they can be
> chosen by the user,
>     239          * to allow nonlinear mappings.
>     240          */
>     241         if  (pdata->dimming_mode =3D=3D DIMMING_ANALOG_I2C) {
>     242                 /*
>     243                  * Analog (by I2C commands) control mode: fixed
> 0..31 brightness
>     244                  * levels
>     245                  */
>     246                 num_levels =3D ANALOG_I2C_NUM_LEVELS;
>     247
>     248                 /* Enable GPIO used in I2C dimming mode only */
>     249                 chip->enable_gpio =3D devm_gpiod_get(chip->dev,
> "enable",
>     250
> GPIOD_OUT_HIGH);
>     251                 if (IS_ERR(chip->enable_gpio))
>     252                         return dev_err_probe(chip->dev,
>     253                                              PTR_ERR(chip-
> >enable_gpio),
>     254                                              "error getting
> enable gpio\n");
>=20
> prop_levels not initialized on this path.
>=20
>     255         } else {
>     256                 /*
>     257                  * PWM control mode: check for brightness level
> in DT
>     258                  */
>     259                 prop_levels =3D of_find_property(node,
> "brightness-levels",
>     260                                                &length);
>     261                 if (prop_levels) {
>     262                         /* Read brightness levels from DT */
>     263                         num_levels =3D length / sizeof(u32);
>     264                         if (num_levels < 2)
>     265                                 return -EINVAL;
>     266                 } else {
>     267                         /* Use default brightness levels */
>     268                         num_levels =3D
> MP3309C_PWM_DEFAULT_NUM_LEVELS;
>     269                 }
>     270         }
>     271
>     272         /* Fill brightness levels array */
>     273         pdata->levels =3D devm_kcalloc(chip->dev, num_levels,
>     274                                      sizeof(*pdata->levels),
> GFP_KERNEL);
>     275         if (!pdata->levels)
>     276                 return -ENOMEM;
> --> 277         if (prop_levels) {
>                     ^^^^^^^^^^^
> Uninitialized
>=20
>     278                 ret =3D of_property_read_u32_array(node,
> "brightness-levels",
>     279                                                  pdata->levels,
>     280                                                  num_levels);
>     281                 if (ret < 0)
>     282                         return ret;
>     283         } else {
>     284                 for (i =3D 0; i < num_levels; i++)
>     285                         pdata->levels[i] =3D i;
>     286         }
>     287
>     288         pdata->max_brightness =3D num_levels - 1;
>     289
>     290         ret =3D of_property_read_u32(node, "default-brightness",
>     291                                    &pdata->default_brightness);
>     292         if (ret)
>     293                 pdata->default_brightness =3D pdata-
> >max_brightness;
>     294         if (pdata->default_brightness > pdata->max_brightness) {
>     295                 dev_err(chip->dev,
>     296                         "default brightness exceeds max
> brightness\n");
>     297                 pdata->default_brightness =3D pdata-
> >max_brightness;
>     298         }
>     299
>     300         /*
>=20
> regards,
> dan carpenter
