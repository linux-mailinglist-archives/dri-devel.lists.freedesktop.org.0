Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACDC814A2B
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 15:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7494910EA26;
	Fri, 15 Dec 2023 14:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B18310EA26
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 14:13:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMAm/m+8EPHP8wz3MMxJTpxVe2K+aOMPhWeFN0Nt6m/zAubVgefVMup/J2+oCsJP8l3MvmbHhzNGjDMntARFOp+cy+C353lDiTDrVO6IR+Vl6oEWddXkzCAxjOsiIV5+s4uLM2rJXrS1p5RExPCcO6Wn5spha9pk5sy+uyJphWvPYWyoeNA3I55n2GMKXaKbQSP/RK9IV3qH7xY9gsgIc8rik29Ex15sGChWKOKALBvkoC6IxgjIUaArmy13aBUSY9Uf/62V5O4cv3Rgo6EY7pPO1kS3df9rNY1UvgvfdRiitArMom2bDz//NZ7BtPvGlpB2Ml/Ef/es0J+SaP17KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZAItlpNNAyo5ubtDPtrX73Mb4cIpjn1AeNWc3LfjPo=;
 b=PM+ZuWdXbGYqXwLs/7szfXkKKoDsqtAOnO3UUcw/xwu6pLRJVxlsBnEmqvc6hcaAPejfcooNeNyj3aCbIi/IxHebwWyDHmm6CW5EyPNFmFNXoV9noPAv5wGZ1EYGNOD3RGgKUOXP8/5etKZFA/0PMKIniz7tILRHrswZyUwUMkV6b2Ko3SYkCZpjnbwoLEKCU+NrKLo0ek01u9UVOhJKMrsyEjanVPylDlVbGsiIe2yOZ8Mwn5moL1eIfMu4gSOz2h4p6jiwJJOyaMyNH5/3r9dO+EYn6zbTqu3XvgZPCqaUFWra9xhimamJSx0gqfZz1mivqGxkRz5jAv9stS2oBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZAItlpNNAyo5ubtDPtrX73Mb4cIpjn1AeNWc3LfjPo=;
 b=lFhTmbUuPuD1lCvwI4XRPKti9Qn19U8a1FrHvCZLqawo/O37bULaeY/8HpuIXkSk32keBf6yn12OhdhMgPsK2BDHObP3JzgyLhyevW7prn+9rJDOeczEF1RU1e3ZkeY1kKbXlwKjwAiFPk8ci3kQQiw6TpbdfXRERF9xAkAc3e4=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by GV1PR01MB8642.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:29::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.31; Fri, 15 Dec
 2023 14:13:01 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::6938:4551:b9e4:d8f7]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::6938:4551:b9e4:d8f7%4]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 14:13:01 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v1 1/2] backlight: mp3309c: Make use of device properties
Thread-Topic: [PATCH v1 1/2] backlight: mp3309c: Make use of device properties
Thread-Index: AQHaLscIv6DR3vMcLEye2ja2iHV/JbCqYzIw
Date: Fri, 15 Dec 2023 14:13:00 +0000
Message-ID: <DU2PR01MB80342EF46ACF023E66869A62F993A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20231214195158.1335727-1-andriy.shevchenko@linux.intel.com>
 <20231214195158.1335727-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231214195158.1335727-2-andriy.shevchenko@linux.intel.com>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|GV1PR01MB8642:EE_
x-ms-office365-filtering-correlation-id: baa3b59e-3f8b-4fcb-4399-08dbfd77f23b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XWeSOhcGUDwC8/uiI+IPgmzTgpdAiZ/iqPPv2tXLujuG+sN/KLe7H5T9aFgBE2PYEtau6gCv1Li1OtmIqWITbHlJY3ClM1xJyCJtC3rVM79SRZEPNRvAdhw5T8qbiH2fxiRR/pFC1LTG7gfbJcGtkNsDMyNSzozH8DswEe0kp45/L8rrDU+xMp9YGQzEoMdVaX2DYLpPA2piJmjKwqBJAiWZ4jbrN62zFp7O0xqtOU+3Iqxd0o6yU2UgLOTbq1eM7l/lw8YybHOc0Ur8OufsYQgpg2UWYZq6DSoitNrb/xk6DVYThBg9Ht0Z4oaHWgDEF3NzH7+bzoaIzoLYkpSAGym30I7sEewe/bGgbI3tUFaRzKYyhMy4gfp1+s+FKY7elmaj/OmBN1UkCr+GJDIaY7Cb+eIjfGWJn9zG9sxFPARyz93NRRntYEuf4Q8lcXlAGDjNzHN2XYdyt3Nh1CVZZiM1HmddAaqCLJGiOGKlujSHiitS+uEuBIvohKwA3qfha6Wte2zyApyK7X48ADCGnxMXzQuysuyVXcnuRRo9VRMTqeM3zy9YK29gaiHf4X1ZiYADVSlMWoxqviEkTuZ3mMksLKqaTvUwBGpg7DXmiYSlkg7a1K2cdm2XsMkZCffX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39850400004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(55016003)(26005)(7696005)(6506007)(33656002)(38070700009)(86362001)(38100700002)(122000001)(83380400001)(4326008)(52536014)(5660300002)(9686003)(71200400001)(76116006)(6916009)(316002)(66946007)(8676002)(8936002)(54906003)(66556008)(66476007)(66446008)(64756008)(2906002)(4744005)(41300700001)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tM9MjmJgZT/hx0NM7ykt3gu2Zy4Ic37l5Gj4RMry7cr0fxBamAjRO/wj6ibi?=
 =?us-ascii?Q?SFWkLhPjG1EZvTOhqTtg9JwhLangDDfLrymm8HYkXwtsTHshRicdg5eBkCqW?=
 =?us-ascii?Q?ppel3xAIjvMGPrO8h3cdacoA5wz+Fg/2NDYR1cIRps7mwns/MPhPOH2i1Azy?=
 =?us-ascii?Q?aus8y8KmUUDrz34bdTVdAj7w1u9tpNZGxRoovInt8hjdEUqdFOYZd2wZeyQ4?=
 =?us-ascii?Q?/s9PEFqQjel6EHDjVjF6hztyKybRkuxBIyebkZCAIxoI/yAsrku9KyXcJObo?=
 =?us-ascii?Q?yqjnm5Os7STqQDl69fMz1QAgWimzKE+guYe9HHH4lVf2VGsFU4gKn7wjppgr?=
 =?us-ascii?Q?Ii+r5IDFCnZIxU19Aody8y4mgGFptGQmZ64qnWFp+aynxrz7QgGCFIQ7R5Zr?=
 =?us-ascii?Q?T9JsA6vRGqo+vOQ5fdeS5N4CZVp4o7pwYduI6g/Ar9/p9hwLwYtqIaEFd+Rx?=
 =?us-ascii?Q?28aT5JGE3GP3QLx5M0KdpJaNnYOy7lzOWCvCNxO8CfSEVhXmockZlcXo2aam?=
 =?us-ascii?Q?YI1UpcONaLdM7SWV/UpOm0daZC0FjGPfETR4S1+Sp4+//EuRtU0z4wUgcUBw?=
 =?us-ascii?Q?UYGrl8DnITD0bzBEK5FbBw+GNRqpAKTT5TjGvqM+OoMv/w9YJ8rsEU141v62?=
 =?us-ascii?Q?tuyO4CoIqiWMY50jLzvFtnqNANi0MwtJKMzEaz8VN4/PZP4OuZYztEWFCtAb?=
 =?us-ascii?Q?9DpV/ZicN+D6e90JFn9InO6JpHGIU1B+Idd2JR5edkI4YMZOrfjhIGZcGv/X?=
 =?us-ascii?Q?4ZRM9UDIlwfP7QKm8HKmdgF5nPqXNI4TvAdnC5BUSzdEFp9xHUTmEmzTSYnP?=
 =?us-ascii?Q?eZDsEwfH1GEqnre/KNOHa7Jp6v5TCURE/tgr1b+8y+7fU2ARgCBor343Qu2z?=
 =?us-ascii?Q?qWouNuIf9tT7Nu0huCufzI2S7PFYSeWzVQ+hED4PmL2KUwhMncBnmm9MngQ+?=
 =?us-ascii?Q?8minh9tEsJTs9APc2Sh4xUlgp0zJ2XcmVE32qUt2/ShoOHB3ClPxeTl219+W?=
 =?us-ascii?Q?QfveDzTb3hq7SP3BklSkU14KCZ+/7qkRsZo2UXoJsKdtGlRcZ/bB/Oj0g2E7?=
 =?us-ascii?Q?TCCcfT/bKLAcsQNOKsQHlCjc4dXL+IV6+gZSkSdmRAiD4OKW8gFYdd9fkva1?=
 =?us-ascii?Q?kDRN7YZZF89jPetnu8IHsvjPdB2aLxiO4nvtwiyXg3E5WmBLOkjGc/NzwOMx?=
 =?us-ascii?Q?P2KOJ4Aj1eW1B8Vqdbm8u9K14c5QICuT/3PMUs3+CB5Ctkt42VFweOgWtDY5?=
 =?us-ascii?Q?+s9KQbks6B8ZFRcZVN3VZoij6ltWrPSEtpiTq42/4ahVDQkLPapPHXSDChNC?=
 =?us-ascii?Q?S4aSppACtKvYGunGSJ31UY1HXU+p0OcsLNvO/hYfLkCB/bCkuoXMBgGUkney?=
 =?us-ascii?Q?vM+/e6fYLH3s54PIzL8GEcez8/mCwb/LJONz2OmkkZeWDMoDagmpcr2OeLxS?=
 =?us-ascii?Q?jbASqadzeR1Jf/KK4magQTtDVbaMyKBgXgh0OxgzqAIC8YB/fGpO/FzJf423?=
 =?us-ascii?Q?TwX0XpHj9ouvSiZnE3cuM3K9i0SDNt4rdhXAdp9jHVBlrF3d/JEeH5tywhyI?=
 =?us-ascii?Q?lyazQHox6XwIoTtZaFc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa3b59e-3f8b-4fcb-4399-08dbfd77f23b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2023 14:13:00.9701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WinrVQb5lUs9iK9H0TC3GWhW4zmPMKV3cUzvO8M9XBWYSco6dEzrtzgT6IiVaeYXf9rtpeRrgKmR7mZZ6XHRPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR01MB8642
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Subject: [PATCH v1 1/2] backlight: mp3309c: Make use of device
> properties
>=20
> Convert the module to be property provider agnostic and allow
> it to be used on non-OF platforms.
>=20
> Add mod_devicetable.h include.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/video/backlight/mp3309c.c | 38 ++++++++++++-------------------
>  1 file changed, 15 insertions(+), 23 deletions(-)

Hi Andy,

I tested the patch in both pwm and analog-ic dimming-mode and everything is=
 ok.
Thanks for the optimizations!

Tested-by: Flavio Suligoi <f.suligoi@asem.it>

