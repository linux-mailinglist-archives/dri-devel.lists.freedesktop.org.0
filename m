Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F655817987
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2756A10E250;
	Mon, 18 Dec 2023 18:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2071.outbound.protection.outlook.com [40.107.6.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD5710E147
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:21:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtFMRrx9UcB1gqH+smDSuie+yFU3zI6rHUvAf8WIvHdQgrh6K/aYW59o0ejirqEi+XaQaNEw3K7n9D8vOWWHWK5BLJ6Gwzmmg8dnPilq5xrZNq3SFzfh4vo6vk15sC73sakGAqQ2pWVZdBRQQmT2gH3ouh1nr2mqEAaGFiLYbZm782nK+zQE7jGtOYojjT9nYiKI6x2UomcM0aUdRM4aFpTHwy9ZkgkF+abLld96mmMa7cKoTGsmW4+ZVK2epdCbXVgUMNyaYIPzxFRZeVC1Bvnff5C2aFUV5VGjNxdjOpCg0vmUjIGb7M3MAjGzIAbLBnebMwBjkSdXcXUJ14FZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zl7h4IrPGmkNtm3g2//nq/QafC1OEJeeGhFLRI/FFLk=;
 b=Xa8RsjPCzyXgUGLw8FnIsUI9dkUOZglu39u1dYO53ki9RR5fihVvIP9koBQmU9yic6MmxQsqJrRl1P6zc77SwJqJRI1ENyZ9J+0U/91BJMSOHxKNWUc/BCML98Zo4TxBrgTPl0sGq8onF3A2sZrbz5Mduy//VpzUhdaQy5mKW5ikSVKq4vSWZD3/vvobmTdLY0ew7PoQVw3yvOvMI6bMWD4yF1LGeDael82/+1fjmvZTuzTH4MO6ZUTVEH0M/BKiZLFBrv4tFcEx32fKRELbaEeazXs0uhHAaYtlIPRKCxnOBecBdpU7NsrIKKwpq5Qo3ndeKvwzeSwI2OT4g+0o9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zl7h4IrPGmkNtm3g2//nq/QafC1OEJeeGhFLRI/FFLk=;
 b=ctBeRNXWCwVD6F/fT6d/H/rpye5Q+0omEaRM7hNXPuMS6WkybozrS+7jekt1xpAL1cigpD2W8dxp/2IWlGvwICbLv3NIBEI33lAfSut0vHcLnOnm4gZA97sSmuzSI6CdyUpNer3Y2weZgqz4LgW2bLhKTE+d5Dxf3nnaUbteuPA=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by PAXPR01MB10395.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:246::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 07:58:45 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::6938:4551:b9e4:d8f7]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::6938:4551:b9e4:d8f7%4]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 07:58:45 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Daniel Thompson <daniel.thompson@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v1 1/2] backlight: mp3309c: Make use of device properties
Thread-Topic: [PATCH v1 1/2] backlight: mp3309c: Make use of device properties
Thread-Index: AQHaLscIv6DR3vMcLEye2ja2iHV/JbCqhQoAgAQs2gA=
Date: Mon, 18 Dec 2023 07:58:45 +0000
Message-ID: <DU2PR01MB80345FD736DD9957D4CD6F6AF990A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20231214195158.1335727-1-andriy.shevchenko@linux.intel.com>
 <20231214195158.1335727-2-andriy.shevchenko@linux.intel.com>
 <20231215161102.GA662726@aspen.lan>
In-Reply-To: <20231215161102.GA662726@aspen.lan>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|PAXPR01MB10395:EE_
x-ms-office365-filtering-correlation-id: f5bc24e8-a5a4-4bd2-05ad-08dbff9f28b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lY/05cjtwZkAzE11baQJY1/jKnToDJ3PMQHZz7YfIZfmC1wE1NUsjo10Gu1hHXp2n76mPc/TXLbQfFD9+ee4q3uVq3Tw5g6HNTdAwwppFg2RuzvvSxJamOdUE2wiea5mV0xa0fyNRUBdYUGAQozj5urafbiOM+YAodKyOouf13wk021LMRr2VyeQj3md1Tui3vfdfbIF3GrAxNtgFEQstU9C5LnwYXbcZYZQZoJTxXa+t+6/0xDP4fpzZGTUxaDbjPoB+8b/HE3jKS6xK8HqPkrw940snHLfjZgVx6VApOHR7mBjoLgHAauxEBzaVl/7HJ09bVrd9g5CJQKdfFHU7FUOOyN/p8EK04n0bcTIEzC2/Hki4NCtl0gr7UGssl9VAjLgmfHfaHgz+dl3Z767acC4kxWe+2RTZFz+3Q+U2zeqjQx5cNjNxAGWIi9giZ98R3yE6zYcizQX2HhE7GxJceu93pAZ6S40ojuBtHaQDvKfatMDuan59axiHW8FlkxYf3DqhwYylw7aOegaQNzrB5q/Pr/qp/pabH74NAhGWP0KgfugqyYtREEPj6MzGIt+SAdGTsR3HoDv6xU9gl8DjzyFfTBe3JfvdhjUUj+UP43S8kxM74gBX/I5xKd8UyDG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(396003)(39840400004)(366004)(376002)(136003)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(8676002)(8936002)(41300700001)(4326008)(86362001)(52536014)(6506007)(76116006)(66446008)(66476007)(66556008)(54906003)(316002)(110136005)(64756008)(66946007)(38100700002)(2906002)(33656002)(55016003)(122000001)(4744005)(38070700009)(26005)(9686003)(7696005)(71200400001)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mEHVsy3Q1bxQjJ9Ve/9hTrB7Yqi9grdLR6/q1PFDy4pEk2iSE+WlYuuD+1/R?=
 =?us-ascii?Q?lb+dGOebiCB/WUYq8nDmdBU02wlZ3qerq+1032x40vnqvLj0QeXEv+JVMMgz?=
 =?us-ascii?Q?JXAIMqhw3Blzkz19hBYY8oP8bUP85s8KMWp+o0LvueKfjfgcWi1T9rkWWnZ6?=
 =?us-ascii?Q?g9JLMOTAFTx75Li8Y5b5qX58JBnj4P0hx0aclABVmnlHfNAFh+m5bR2lgDn+?=
 =?us-ascii?Q?fG8H/nIfTlOjQ19czCtbX1QHSXdrlJh72w/Gu2IrqesgWNrGzl/124nnhH2D?=
 =?us-ascii?Q?VLQYUGEiugLZLfkyr5Eqq6Fi4mPmXuH/UXkRSjjbS5+s7uDmqrn1QATElCuG?=
 =?us-ascii?Q?oeA61M1hd0PSj8NaIMMctYhKnCVBSxkj4NTJPaebThpeuiyol8x8Ow4icE9s?=
 =?us-ascii?Q?UD1GEzIbTvj94vMR640Kn5R7fnrgerccR8b0/sTkYqD2OKzSCiYt5Xp00l4w?=
 =?us-ascii?Q?VgvvECzTo/qILf9fg3ce3we6KctFrukWUwAGtjFcw4R21ThLo1/JuYudJdRg?=
 =?us-ascii?Q?4nsLDSYwG76cPPuS/mGlhdkBfzLiPS38kloFlG8nGxVk3QnPm2xSBpJO+8RJ?=
 =?us-ascii?Q?PDyf5geGpVEK45MHyNOpxwSI1GYiV2woAZMpvGuQjNP0rY/ss4w0DFRGHMy0?=
 =?us-ascii?Q?1g3Ut5ZjsZ7KCwMWQR89w+9Z/DdyV/Bzcark1M+6Lt3lO+kdm9Qi1+VxcSbM?=
 =?us-ascii?Q?yn6LpqPgdpOKPQWcOm66F++gvclyJ3dleHXF9s2jSuuODBrd1P7a2ellp39W?=
 =?us-ascii?Q?D7yRW9JDHE9q2lo7AQ1JC2CGA1LvwvYUMwmdaowWArpWcJJyMNa8PQxr9iuU?=
 =?us-ascii?Q?quFbhYMw8MT5idpePxSt6iRLM5Flwiwu2QF4vG1vLQPmae++bSQlI3vFSgHM?=
 =?us-ascii?Q?XEkvFg7G/eg449yTjFVTCQnxkoAiI87OYF1Q1iO/kFoXmHQdXpPWcpUrZeDH?=
 =?us-ascii?Q?4YHfHiFqZp4RVnVjf/aXr0qGHqMDiZKs4grZkk5njW1w558zJBRnThKQmeXL?=
 =?us-ascii?Q?GosGg5t3d3JqzJbMkndj1dGtJ2vreS6sVDtH42r27k0pZ4z+3FV7AYj1Go8K?=
 =?us-ascii?Q?tiqT/WHfk1BMTHwDkF1r2++oTR3i/+RdHQkDT/ocT9TMJw4UCJYNOcgHRJsV?=
 =?us-ascii?Q?912F/m3HV1/2Ddzf/mLitoRnTtXPTtQL5czXjhNfxVqX8D0xetOyT/reJBD3?=
 =?us-ascii?Q?Bjw7f75Z0tHXfvhSlbFJHBlwCX24Uzb00OPjVzpHnDQ67mb1kW+hTvTAYDjv?=
 =?us-ascii?Q?cxMYOjDbvoAImIxMq7jjV0pGR43WBDu3JWf7j2p1nzImxH+bwdpLetblANiv?=
 =?us-ascii?Q?OdeBT6RBbtCChpm0dHsb+NuAbfcsLsNUhTLghroUXNvXmW6gYw7siXVTYjnf?=
 =?us-ascii?Q?qFSS+S6eOZZLWgtEMnY10NpCH1aVnPShiT1V2/F450SVuCfKSljjq/usJcKu?=
 =?us-ascii?Q?QI80NgwZylsn+3HFjLgQJ9NFVeUoh951+oBSSvrWwk5r+r4w7cgcWcC3ZsK4?=
 =?us-ascii?Q?NMcC8ljZdKVOZQg68WXzUuIpOBEVHpmPQbMUpOlXUzHSZ9Q1P9TxT5EdYyet?=
 =?us-ascii?Q?I6iNAMJaMjahdDYTOHo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5bc24e8-a5a4-4bd2-05ad-08dbff9f28b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2023 07:58:45.0706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k0z62BpPFBAinoTbfrGYzGK1qiQFXPn6omdfOUJIJJPMoHcEqnnNV/N37IqaaHLHrCi10c9AkSAs91r0vvKMbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10395
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

...

> Subject: Re: [PATCH v1 1/2] backlight: mp3309c: Make use of device
> properties
> > +++ b/drivers/video/backlight/mp3309c.c
> > @@ -15,6 +15,8 @@
> >  #include <linux/delay.h>
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/property.h>
> >  #include <linux/pwm.h>
> >  #include <linux/regmap.h>
> >
> > @@ -202,15 +204,12 @@ static const struct backlight_ops mp3309c_bl_ops
> =3D {
> >  static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
>=20
> Pretty minor... but I wonder if it should be renamed:
> mp3309c_parse_fwnode().

Right! It was my oversight!
Thanks!

>=20
>=20
> Daniel.

Flavio
