Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B769952E6C0
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBB011B7AC;
	Fri, 20 May 2022 07:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2124.outbound.protection.outlook.com [40.107.215.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A9311A8A0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 02:29:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVFcM8ufIc1KznVcHRq7zHMPXTpJ+5cGjEGUCvtF1DhX6c+6gkOvB+NOnls9qXUxZhjIuci+P0WeGK5z5McsW5HzY649UI3otB7DNoCQQ9YpuGMNwHqRYPf7NNaNPO5Be9UbneDo3+I9JDMtgBuDmc37+/5J6BT8MkQGar3SVNNy0wg+Q6e3zgP+G5YGlH0y50MrMvBdCsI+apwg1zQ8R+O7Ddck7IbG8Z/VaBeoKTjVKzTfah/1cz7w2HD89O+Xmt/Ge34BuAkwL0Qf/JqsVlJCWXgkXxG7XbqITvNCd/eZUTcsMo4jIN3bM4Hui9XpL/flIQ7cyekOyb8f9J5kuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYIQe7wYPq+CieZrYepinsCVCEuFJR9q0WQdSkl0X8A=;
 b=dVxRzYDOQaYdGiZP8Jr3dwRbNkqfMszhn7prr+npLThUkw0t+2SAyx9ICe75kCZg6O3cDpvG4PJkWmcRwLQbZDKlRUgpbI2/fCKMy5Bu9lUsWXb5MbV97V2xAoCSSmCY04Owzqo9+eg/589UCdyYjtY/W7ErmR6LUb1hXdY62ttHJAS8xxnQcd1RBR97FyP3DpPmz4BLk8YNWz66AMZ2e2f/5DUDpdOGHlew4Cztymv+vJ9GgjG0RSVR3jNMxgy4jAbNTnVgR7tB97Fk6Qdc4kCz4uCqPLqoaSqRw1O24L9Nw4CrKNEHKDE3urPTmwcTJUMq++J9L49eJ19kwlsv+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYIQe7wYPq+CieZrYepinsCVCEuFJR9q0WQdSkl0X8A=;
 b=QwkD1f09CZ43RI8sWwC4anrmC6FQ3WhnmU6HCI5tY9wAJzTDR7muQp4iFX/hriQeTqxlbd5Gr5noOLwzho3324tS3Ny2nx3sdqR/2B5feE/uH44CknCJpIwOS5fXqfgB9N3wl02loi55llxqlK2IhLNT1EjLjCl8W/SK7rHBayTC6QL/I7tJMccrfqCf9zlsu/Fy65dBmoU1vyaBt4xornwQOEpXwCRkj0Jw3fUvRGa1taTWjh7RdJDxtuWS47tkqqpQ0Rye8fUqYouXDywmqnW1tCHg1VjW0Ef5ZTLVosBPa6IkC3v7r4EIEptGMIJCLOYNI8QBeVItelrEe+FpRQ==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by TY2PR06MB3456.apcprd06.prod.outlook.com (2603:1096:404:fc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 02:29:36 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8%7]) with mapi id 15.20.5250.020; Fri, 20 May 2022
 02:29:36 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v3 1/3] usb: gadget: add Aspeed ast2600 udc driver
Thread-Topic: [PATCH v3 1/3] usb: gadget: add Aspeed ast2600 udc driver
Thread-Index: AQHYan9t0ehEszq6CEa8UANcF9oVAa0mXPUAgACwUEA=
Date: Fri, 20 May 2022 02:29:36 +0000
Message-ID: <HK0PR06MB32020AEF88CFFD4296762B2880D39@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <20220518062043.1075360-1-neal_liu@aspeedtech.com>
 <20220518062043.1075360-2-neal_liu@aspeedtech.com>
 <YoZoouI4EbnNYE6h@kroah.com>
In-Reply-To: <YoZoouI4EbnNYE6h@kroah.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f75f5e5-cd97-4c89-1623-08da3a089519
x-ms-traffictypediagnostic: TY2PR06MB3456:EE_
x-microsoft-antispam-prvs: <TY2PR06MB3456680516559663F957262A80D39@TY2PR06MB3456.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QRcV0MPBBWjzFn3HpwzEXqp3Z7+3FNdrUeMi8T4XBavjnuQUhrlqGq03hsCIq42NfY41GV9FS5S3dsNYePYfE09wGdi3zHfjSM2ownxEAOJfT2qukMG+//q0n3BNZNeHRvnFzlwm4cujFva6T8hz3thiO80r11PdoV9Kt2tffkpFFi6RM1eEmMoRIqGHi0Glt0gC/NU0hzE5ynR4KM+jDil3BKEEvEf01Fqbp6HpLy9wAj/koWhID7SNHoc7+wCZnQ1xGfu1SORg0FP0Z6Lrw5D/2QEDW17LWB8AbJo+Toh9atSc6u2O5PXATB+2K4+T/6/bQKFF92g4Spg2pfaDJWdSfMqWUB8ByNqrhhv/EgensqkTo2E/y/9ZTlShXKUrMZPdUX0KcyPfcAL6ClgqkuKlTN5IoWGH68pUxtm94dGOdF9UhcZYFpzC5IFxm4CQmKebepeQAx3FCs2HN5ZhSDWWBwfbgYz4idvXrngQcC3KMmwgr7JvTgdE0Vwq6bou1r4tkrf1lY2Otlg6jwDCwMuDlgbQEWv9AjBelrK9WyGPaoVYi/kiW2UokkIGEPUMonvTG9XE+vNj4a8EWw6shtiUpuUVdz+hZXwcSw4U5qExEZ+MaChiOx+uPI5BPWnfHA2hHPJTIEQpKc4JNj5FQkQ2pQvi+zRndzA/+ikzzi9t93Aq4+iy3YU0BHOYMI4n4ycYVohW0UWjgdGfYiyxiQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3202.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(376002)(39850400004)(396003)(346002)(136003)(83380400001)(71200400001)(5660300002)(86362001)(508600001)(38070700005)(186003)(41300700001)(7416002)(52536014)(8936002)(66574015)(38100700002)(6916009)(54906003)(55016003)(53546011)(316002)(7696005)(6506007)(33656002)(122000001)(2906002)(66556008)(76116006)(9686003)(66946007)(66476007)(66446008)(4326008)(8676002)(26005)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?mf9Ny96U1rhqyZMj8tpmL0UYxg+fI/Qz7Cee23lM1Kb1B/6f52upyittUL?=
 =?iso-8859-1?Q?HPa4qbv7AEWSY0IgJZo3Grat7PUaoBgTUTs7fC+Ue2Pev+x3Dp1fSwxoLF?=
 =?iso-8859-1?Q?P8B2lli4kwjDWsptMGNRpkj6sI1PtQ8zo13cwTkycyDis4xPVQhkP/l+P+?=
 =?iso-8859-1?Q?WmDaUvH+HO8CLwpxqomzl0slUYV3NJZCx8nI3QlGHiR8DsoQXqmXT8j9v1?=
 =?iso-8859-1?Q?Hg/6ze/MOEZQ6RQT6VDVOyU/NXN59jUMpVJGefT+iORzPp0gTBegQhMitc?=
 =?iso-8859-1?Q?7Ii4gEvhVWUseYooWUJMy0AoJ8OsfZqt3sb/GnJcMyhqHUXCl4W5FbFhop?=
 =?iso-8859-1?Q?hM1Lpa9YS7UjR9TIThhHBvN8C1+lm8H8pVsFMep5l40h51nVjkehuC83Q0?=
 =?iso-8859-1?Q?4QLDx/QOzZw/8Fx1D7w76FX4QRBYBV8eaJ7dyV+whkKNyTDNf4LwpYbxdu?=
 =?iso-8859-1?Q?hWZwmd0Js9wEM2TyHLKY7s45CH/cBUymYKq/zsLevcORMqWkRWMO1pLzxe?=
 =?iso-8859-1?Q?NZl6HL3YkmaV1bU5WjFYuNcTPs5fhaWkF1ooPkE36P4cmAVaB5TwxbZmu6?=
 =?iso-8859-1?Q?IgWTLNkCIYiGwKJ77D7cC9Ss4DeZ2Uwp6XwR1mNFUuzv7hk8NA6AefsAAs?=
 =?iso-8859-1?Q?G+jOHhVPokWbkSm8TroB+VWjTYihqMOwP/bV/XXFQU4IQBcfyxQf6YaAgP?=
 =?iso-8859-1?Q?m+/+8kU7UPg4e+cGlUvgMO7GZ1Wtk79MyBQK14McZVj6RVJS0s4sTNZxmi?=
 =?iso-8859-1?Q?2syt2hN8CV8HNhRzZa2XG+HzA/UHN1fcrjpIm8jN+H1BaVy0HGdtMBNbON?=
 =?iso-8859-1?Q?86WTQcfgKjq32ETASqMApcc+NcEwbSdrGTsxPkvkc3w8YmcNK7hQjVjB0l?=
 =?iso-8859-1?Q?l7RND/kLjd+I79VKlkQbsIjJiMiujf9uSlrCGBgc67P5/rGaHJfAaM5qby?=
 =?iso-8859-1?Q?r3AO7N779DrYf2ZSzNoVs3FhS/3yoWj2IRXkK5ii5RJMMKdUfNRiVNFpGh?=
 =?iso-8859-1?Q?pvDmZapTzvPnjnxKqk3k2OcbVhZgzm0Nrxczjtp21l2zmqXNGrMb8LTmC8?=
 =?iso-8859-1?Q?QPKYt6xtvavJr+BuKBMH4XWmw5Mwbpvxhr4KecU+DCgNp/HIJlwd1kcznC?=
 =?iso-8859-1?Q?5adYulLzccikMmkQ8ZQYPc+BMeJQWrAUxnS5wmXWs2VH8jf58b+vQDUHIA?=
 =?iso-8859-1?Q?5HwEMAyrHo1axjA2YjAvf7C0TMEpdajyZEUQ0mlUDg8AH2iU9gc/wkA+gR?=
 =?iso-8859-1?Q?wr8Q9m7UCO/u9OI96ILD1rncOHQP0b2EdxLffGEXP24AbOd12Iy91IOSie?=
 =?iso-8859-1?Q?IxLL0la/5gRoBDLjLdtC57IHClAUsasw4qN0WQWtZRUfJMM7LgbVr7GMeV?=
 =?iso-8859-1?Q?1HB6WwpcER1BabP/t1XdIbkqLR1PKbNJQ91pxL9K7geFQujhGey7BxoaKP?=
 =?iso-8859-1?Q?V44OE2EiSKFG/Dd5N/zF5+a8k18Wrfzsmy2dMQ0GqOCi0oJhsizA7yDkg6?=
 =?iso-8859-1?Q?lrFM6NyEGJzfjCJJMCKdBF+XX7FlPEO7d5XLm8UQxiwVZ/EynolMN8+685?=
 =?iso-8859-1?Q?ZTYuwLQSA6gkzXLvIjlqG0fLqYQfYscgCYrGDRps1990vIOAkNA7AYgQx/?=
 =?iso-8859-1?Q?V9tOMaEf66hC6YiMUsDU84uB1fee8l6mZyu3d7M1ZWBRgXPTYoWNbgkxab?=
 =?iso-8859-1?Q?DWzs8Jtx35zF+EYocMCpXdAuf3by/ygp+iU17xfACV47LXeuBhp4B9YLSp?=
 =?iso-8859-1?Q?tfA29mGJKZ5Z9oqUNkDz8S+AbpBkX/1ARyIPwlTGiD9b+7MegPmQbndzpw?=
 =?iso-8859-1?Q?8XDrcjC4EQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f75f5e5-cd97-4c89-1623-08da3a089519
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 02:29:36.1788 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UvA4pYgWESlG6DaCqz424qlkgdG5tQTiY+eGWD5BbiT/WecW596tmNaagRGWS2/49A+x10o3CJ4FVQte3xxxdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB3456
X-Mailman-Approved-At: Fri, 20 May 2022 07:59:06 +0000
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
Cc: Felipe Balbi <balbi@kernel.org>, kernel test robot <lkp@intel.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Li Yang <leoyang.li@nxp.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Thursday, May 19, 2022 11:56 PM
> To: Neal Liu <neal_liu@aspeedtech.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Andre=
w
> Jeffery <andrew@aj.id.au>; Felipe Balbi <balbi@kernel.org>; Sumit Semwal
> <sumit.semwal@linaro.org>; Christian K=F6nig <christian.koenig@amd.com>;
> Geert Uytterhoeven <geert@linux-m68k.org>; Li Yang <leoyang.li@nxp.com>;
> linux-aspeed@lists.ozlabs.org; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; linux-media@vger.kernel.org;
> dri-devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org; kernel t=
est
> robot <lkp@intel.com>
> Subject: Re: [PATCH v3 1/3] usb: gadget: add Aspeed ast2600 udc driver
>=20
> On Wed, May 18, 2022 at 02:20:41PM +0800, Neal Liu wrote:
> > Aspeed udc is compliant with USB2.0, supports USB High Speed and Full
> > Speed, backward compatible with USB1.1.
> >
> > Supports independent DMA channel for each generic endpoint.
> > Supports 32/256 stages descriptor mode for all generic endpoints.
> >
> > This driver supports full functionality including single/multiple
> > stages descriptor mode, and exposes 1 UDC gadget driver.
> >
> > Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> > Reported-by: kernel test robot <lkp@intel.com>
>=20
> The kernel test robot did not report that you needed to add a new driver =
:(

I had received auto build test WARNING on usb/usb-testing reported from ker=
nel test robot.
It still mentioned that if the issue is fixed, I can kindly add this tag.
Would you prefer not to add this tag for the first coming driver?
Thanks

-Neal

