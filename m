Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDA0781163
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 19:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265D189167;
	Fri, 18 Aug 2023 17:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAD110E0B8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 17:15:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APd9Kdz5db99+QfpSGX0sIt0waP+LQRkCZLKep5kKVp0D6G4aKvoPuyqobyMO1O9xtbvemVfu3eYPWZe+A02P0AQokKGBpQwCTGKfkAu/G6yagO9FxF4zt8fTnVfPwAZsZRR/nPvYn4Vw4EophKVYQJhBtD0xgDR1IjBmEHfXXaErfOeF11DML9jyTYz9sJqEzS4PfjA74NDmZOwWUOABlqHat61b6ugGYLgbh9VkHx5W4gellDJ+HU4da0AsI85UYVUdiLvRZ86Q3rjPinc3lae8MhwAYd3yCsS28Uxhm7RpmYBFokqjtSKGaVWUlbS1dX8KBAEONlyDX0AvhprUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ra4i5RaqWWHfQ8ZBrBQLng1HM1MWjhEQVa3/ziYoFUs=;
 b=RlVgo3tAwnAVjM0VNnm6ZiOye3cgk3CNKAXE2ffziFLNaOlWVqE+Vu2F1PwpopcDLBt6ECYQMxEyYD3WL5p1E2zjUF1ymOHgwZU2ciJFw7ZqfhCcpbb3xZkNZ3g10KL1cUM+ESN1P1ADBgDa8Yi56p2VPJBIZz7dvTpTDdMZqt6YRcmTFyCyFUpooosvwHdyajXGwq8GpTArgihKBlhiAW5PX+lXq3S3piPJJOmt9YwuIcc3MODVdpImnoDFMm5tS3LjTMG6pdRjosh7bZNDAa5EVG1gMwePGKA6M9KyqZUoE+MYJVK7qVdW/aV565esqkuTfHPiU5X1wKHKHZJwAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ra4i5RaqWWHfQ8ZBrBQLng1HM1MWjhEQVa3/ziYoFUs=;
 b=vxEZXCcI513fXXV8tab1a0QLsZ1JLUpfqm9SAW+Fiz4X7ZZWEMAnitxMJMn70dMoE/u54SOAlICI1ha2ANELy0e7fNkuTsJeMg7I9Z6IyM3DmrTXSkSAxEsIhDJep0EGCVmzds0sQJ/yTJ/5xhIUNnL5B46bD1mYJuhNBpHjlZI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5524.jpnprd01.prod.outlook.com (2603:1096:604:a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 17:15:03 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2168:623e:e186:4cf0%7]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 17:15:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v2 1/2] drm: bridge: it66121: Extend match support for OF
 tables
Thread-Topic: [PATCH v2 1/2] drm: bridge: it66121: Extend match support for OF
 tables
Thread-Index: AQHZ0fS+CW4XwsF28kSvpVPSEMdrMK/wSUKAgAABQXA=
Date: Fri, 18 Aug 2023 17:15:03 +0000
Message-ID: <OS0PR01MB59227F10D4470A7B638A83F7861BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230818165452.320984-1-biju.das.jz@bp.renesas.com>
 <20230818165452.320984-2-biju.das.jz@bp.renesas.com>
 <ZN+lgzthxaLbOkWi@smile.fi.intel.com>
In-Reply-To: <ZN+lgzthxaLbOkWi@smile.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5524:EE_
x-ms-office365-filtering-correlation-id: f4612b58-9425-4776-0f25-08dba00ea942
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1piVTHGlykNAHVKr9xcsIdunS8APlhXdib26Nk4kORx83hgv8Uzl8KP0X/oE07U2WwOgh8o5VE5AsDVBL9S6GaayDZ1YMSKq2Hc3yMr3BHInegYvKjmXi8NOOkK6+vlLquPnnOOoe2hSsA0lNueA4ajCqgcxzv8XqwSsA2s7gFqYFiB8PrFJmGBboLBfIt1YxV9C5/lyyGxqGX4elvTO50HtMN3Ta3jj39EvYb0S5OHX66n1muxXsw9RqoVgLI0cwNt7yKAWIE+VJf+0xSO8bzbUL2IU2L2ILEEA0QHvnNQGoPAD+v4JHSXLo2V1EOd0LoZwnmFEB1N/iPvYGWi+xNMgTShBW3D0xCek0HiVgp8EYny5X8zBoicF2uKbWOAUp4tJifVntirAC6dSyChO/46Qfp52SmlHBbmWyqtHkjfgEGXtNBQoGkY8Ve7ALA/gZQ2CDjpKzEBFX7+Dzpn9ujtFwsrDrU8DJzT6owT4X/OpppovxX3G5wa9bxZkk6QMXTV4It9Rzl7/x9XkkaeTDFVKcTtumM5tkiI4jENpnIn7NtvCpdO83+c726eWqJ0bKkNIay+MwjAYGL3dC5UG4I6a6KPpU16/TOKCVCmvDmCJ7TKXV8b8mHi+0g75rkP5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199024)(186009)(1800799009)(76116006)(5660300002)(33656002)(41300700001)(4744005)(2906002)(66556008)(316002)(6916009)(66446008)(66946007)(66476007)(64756008)(54906003)(7416002)(8676002)(4326008)(52536014)(8936002)(478600001)(86362001)(71200400001)(38070700005)(9686003)(38100700002)(6506007)(7696005)(122000001)(26005)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SapzZ1z9qYXvMi5pgYGCwyV/2g+gFA7z5skugtPviWKo0BoLmO7OGuGO6YKy?=
 =?us-ascii?Q?qv5AKShJC/NnSmKpY3JTGR+g7WktSzNn+r5pQ0J2G+WawEW0i0s+nY3+i8gX?=
 =?us-ascii?Q?o7epPCw7FS4Q7JgsDHRVDqPmMwsdhnvI5lPcsO+DfO7GE3/9TWsMF7UzEiew?=
 =?us-ascii?Q?/eCbUwDzESdweMKJ+APRLq3MGWzMtn2Fhi/gq/oFdTXOGb0bhhZkXRClSZ8j?=
 =?us-ascii?Q?mN+uH8PCNjJvxis0ttHOiTBnGwQgGpQMeGCRZmMi+HK3TGoaTDzSQqThRA5E?=
 =?us-ascii?Q?SFqyD4I7rLYcsvmcvsgHcQ43CTXNaO4Des7m3DqaKBN19EMtY0QMb/mXFN98?=
 =?us-ascii?Q?mCQpzoETNjrTPCx+a/40IR/0QRKd2/XsHDl6AKrO9T/b6rCnvUqQWA+5kwgH?=
 =?us-ascii?Q?c6kfvT7cyWHuVbyBtyVFs2hj9QlxyMQMjwoFYP89gKR6fpwTrAO6XO5evZaN?=
 =?us-ascii?Q?gfPypqh0njXJPsv8AgNRwVm0XHJesj5sW6lb1izykZaZaNkQKPZixMVvz4n1?=
 =?us-ascii?Q?U01FSLx0j+gdRwvyMi3jaMULdhc+H9NxnEoXg1BVk2+MSA+j/S/Exy/KQl1Y?=
 =?us-ascii?Q?J+6bXQSlPK46YKXtIFkMDpRw0eYlITEmqUJ8o7vmtkEbvzjsYPWOcmlJL8Ys?=
 =?us-ascii?Q?8y1+YhbqqvxF8iQsZIQ5JzfYpyPVQ86FzdvSrRsjbZwQUikcBG9vDgVy4Qbi?=
 =?us-ascii?Q?pDGvGmxfLU4+UlqE6eV95BvcIzCm8ZrSPnY9uEdOmL5PDoX8lWvxuPt0Go3U?=
 =?us-ascii?Q?k8AtNs21bTFfAd/L57lwcXZsSPgi+ksMmbxmd65b4+XZUiTnJ96iZjJh1w1d?=
 =?us-ascii?Q?6Y6XKdRs/e6vc5vFff5KsWcFMH6ON8dJh8Bl+8LtuftLj8Lu186NwXAm0IRZ?=
 =?us-ascii?Q?Un0rMOj30/HJoIz3rvW7lQtV+XkiFOKrPnUY337xdJ0OnfA9JH5b0qm6zqQi?=
 =?us-ascii?Q?I2TO09GA8omXTp62PReMyDTmdSj74UPTjnMdoB441REB3hrskgpHrtOCtBfg?=
 =?us-ascii?Q?Cpv4CX0ONqQcCNSNBrnIk5lE200zImQiOVraF2n1Qd0huawczw0QzckYCu0a?=
 =?us-ascii?Q?SQYQxxF9yw0LryGtNvGQrOniLqn2t3FcqEGWksdkyLBAmkqRQKID2vdgAplN?=
 =?us-ascii?Q?5w1zEy+dWJNQjee7UavPihjiHrwvqmsk4S1L1IqXwfnv97zp8oVzrn7eogc5?=
 =?us-ascii?Q?GgUAOzZUQd7S5WxT8OQv3vMpLMoX3s9EEda4+8i8/KVbkEvcAFho+OTzlJ+k?=
 =?us-ascii?Q?FfctwdlXztoZ/PxI1M9qDAtxjngSXsztx7K8QrDpqD1L9RRJrQDL791A49Sz?=
 =?us-ascii?Q?2UAAKknJcVHKfzCXd58tal8gkgTok/7pbHtvtPAYRR2FFds9L3tRFw80GUON?=
 =?us-ascii?Q?ufneynECo8OtMhyywQ13+8DMEXQaZ2zmqaDywzmuEY3VtsMMHTZipZFpi9Ms?=
 =?us-ascii?Q?J9mMTSMEMMJ6Uzuqogi6BRiWXw7zyeu6gtCJ1FdpS+9HRdnoLH2uJED+6ExQ?=
 =?us-ascii?Q?B1i8xb0CxGnQNywAVgrcf4anvJll0J3YoppseXmi23Q67WAYRfrqjNQKkNmA?=
 =?us-ascii?Q?0DvafXw3FDOSItOoRmChmb1kdKlQrJgrqHquf+DI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4612b58-9425-4776-0f25-08dba00ea942
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 17:15:03.2455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YON67BBP5zfULIyb4VSGKaTLwED1xvGSw1eV5c/S+6RCkWPhaoC590SG2xM1MOJy3GdCZUtB+ca8t2VqRr7gbSR9OJks0mjS2Dw+7FXGLrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5524
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy Shevchenko,

> Subject: Re: [PATCH v2 1/2] drm: bridge: it66121: Extend match support fo=
r
> OF tables
>=20
> On Fri, Aug 18, 2023 at 05:54:51PM +0100, Biju Das wrote:
> > The driver has OF match table, still it uses ID lookup table for
> > retrieving match data. Currently the driver is working on the
> > assumption that a I2C device registered via OF will always match a
> > legacy I2C device ID. The correct approach is to have an OF device ID
> > table using of_device_match_data() if the devices are registered via OF=
.
>=20
> > Fixes: 9a9f4a01bdae ("drm: bridge: it66121: Move VID/PID to new
> > it66121_chip_info structure")
>=20
> What is the problem?
> The match works either way with these compatible and i2c IDs.

OK, will drop fixes tag as nothing is broken.

Cheers,
Biju
