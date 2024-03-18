Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492BF87E2AF
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 05:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2E010EF08;
	Mon, 18 Mar 2024 04:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 937 seconds by postgrey-1.36 at gabe;
 Mon, 18 Mar 2024 04:01:06 UTC
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2128.outbound.protection.partner.outlook.cn [139.219.17.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957D310EEFE
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 04:01:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0gFyX3mZVA1OQBgZlBfCcBxGV+aei85zeZTCmYLoFSFIgCw4DbAtYbiak1SudhJZioFs/UzS+MPBSQX3g6c/gY6ZsfC2eb82P1b3aqxs7N/JaQT7d2e00ssOjKvudiuhKfnzCEUEu79jGuWBIbhdtKoskx6MKn26aDh/lAbx6lb7ExtPHXyMn7Gl9mKC/eUdo6Y8+Z+yVtgW1Jm07j0qgwQ0TBoSYJq6QZoEd/42XEyg0azi+N3lW/CqdL3uAsKqL3Lj28uQFiXl/+LzQtU6tMl+/xEutI0UnV8dwhqLWzwdSKg6P1ZR1ckWZGCoTLD0IcnTUZeyaIfcrXmyxHaQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzn/TtYl43MricZZ//5KvhwxfXnKlNdDqqBFr05YU9M=;
 b=CXsbpQ8DRvsifsflEJevVCWZzfXeGEWNTJDZi+UXjNOze3KoCACjIYY++qOIr8Nrr92nOZsEmxpj48uTKohy+X2W7bQMb7BYNB0hxGAUhdhH89c8GG+dxOkVR3qIaBXVf/ArbgB9IgsiWAN+35YSHpTsgzUwOi2xXY7EMXD2vUjJ5GQO7iOEt8eLnoZc7HaMlV8EBgKywFjEx+a3d/2XnjYQPVfiFOpcEHMO3o7qMa4IWDxPq64n9k05a9jS5471gCkXpdXmzaeMXibTcuAWI5d1LWqZIGq0BjrUNkDQJBkxzX1GpHadME+zTKWaubxL9wTkUbzV+WK/sjqOUIjunA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) by NT0PR01MB1039.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:2::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Mon, 18 Mar
 2024 03:45:24 +0000
Received: from NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 ([fe80::d810:3fdf:422c:75d2]) by
 NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn ([fe80::d810:3fdf:422c:75d2%6])
 with mapi id 15.20.7386.016; Mon, 18 Mar 2024 03:45:24 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "aford173@gmail.com" <aford173@gmail.com>, "agx@sigxcpu.org"
 <agx@sigxcpu.org>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "steven.price@arm.com"
 <steven.price@arm.com>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>, Keith Zhao
 <keith.zhao@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 0/2] Add StarFive JH7110 SoC DSI support
Thread-Topic: [PATCH v4 0/2] Add StarFive JH7110 SoC DSI support
Thread-Index: AQHaa3skQAyiC1xqJ0qDDKfqniAsTbE88lSA
Date: Mon, 18 Mar 2024 03:45:24 +0000
Message-ID: <NT0PR01MB10706470AE4A0654E45D747CEF2DA@NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn>
References: <20240301015222.93114-1-shengyang.chen@starfivetech.com>
In-Reply-To: <20240301015222.93114-1-shengyang.chen@starfivetech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1070:EE_|NT0PR01MB1039:EE_
x-ms-office365-filtering-correlation-id: f9b4efe9-6620-484d-0d3d-08dc46fdd835
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zykz14hlt7BEs3pmw9yNTUxUql+XsPqkZe5tX7dontJyWBy5uUyJxM+Qlan7Zn8Z0hGt8KQ83UgkRUYmA/0pKfeMw4q129tdFW5vK/WOlU9oqjgO0V0JMJ12XwUJjY26Na3MbydCxONSoQILgZy7+/EWgG8gd8h9oyxsHIB/OjEpm73nSg7vjHnTP8x1FYXpZUuKu/PnkEH0LrQEgtZB8XCuB59fiDgGFy9ibFVkn2f+6Zmp7AHeS4JytUKy6ywuUi8uxXYke7yg4ny0z1GYAyybuGeIc0uHNbg+tLUFXkDjmHtcGKL2dtp+Uf3r51Jx+NhAbfXkgxZe1LsAcU1EQ/gW2O5QUmFQQJMH0EMoX38RXoexzSZsKd6JGbjlGcfNxJxsctpnncdEWdLtmVAvNE840ghrFzYUs+kivuaeMC8+L94e01wZShsF+xlNYuPPJTSEZJd44+2QzWhECHw5aFzO/R5YgqFPpaMAnV8rdkWHT5CtmqbqMbNCVmEFJAiHYREFzetMuYkAADwbmSd8b3yiLuebF/y6mhlkcb5tIL5B1VjAzxCb6TC9hwOLw2POJ8hmVp2Udbp+TTnTFBWvRX7lJeSUt89HAOAeDBS/AeI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(41320700004)(1800799015)(7416005)(366007)(38070700009); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1xS6rC2F00GOGprTYu7bUyRzixDdhwo0oDGeZMCGCtwD2tpOhk0FWioFhhMB?=
 =?us-ascii?Q?6QYjxvorB5gIUtxki0YtZGVa956sCZwW2qen7dR62qFxiuClrGumVM0WBfjs?=
 =?us-ascii?Q?gtu+HnlvfaxbjEbsY0xsUmeV+NMJWBBjEECU2iv3xphaoyFfeuJ4CF3fi2rf?=
 =?us-ascii?Q?iIbWF6BglC0eYSl9xVclq7qTvovYFFJjZHmr7ZUg5ogyyiouSIYHLb27Ev+1?=
 =?us-ascii?Q?IdOQxF3vhN+musccbhKrIZGKx1IX00yQNxrJEpjyqxXIJy96zFmJoO+Bnu01?=
 =?us-ascii?Q?Dh59ZbneRfcN8VyWPjAyfSsSwEdEL9reaAKYg4DAYbD/iJIESpQrXjXnbskg?=
 =?us-ascii?Q?S6xMfrw6/1B5npGjJ9GDbeFkbyrU0yanletlH1OgJSyKzJr+lT5nr2BUw668?=
 =?us-ascii?Q?MD42KoekswrRWhgZPcRb85eQBrgYlWry7PCtf67R5MHGo6LVlM/KrdGhDjqN?=
 =?us-ascii?Q?cMkXzuz08ODtJH+SF6srPBjbtTz8LPc32mARz7RW2t7uTxf67Bc4DX66dG72?=
 =?us-ascii?Q?S6D2f27T+ASkRpeXokpmvGqzrpWNrc9U1+maxz1976kKDyVjNNSBf1BrU7fh?=
 =?us-ascii?Q?IxGFIHBRLM1lj4S5AXMHxRQXHCh6C3VU8i6rL2mHNM1J7uZZgbRJk6fgrtjn?=
 =?us-ascii?Q?u1aMJgAnN15LxrmcbrvolVjKscDP8gXATB+jlP0wA2KcHhyYf2CXqF4ysWEy?=
 =?us-ascii?Q?iUNSxE86s7ox4ASiwNWty23XBfeKTr92wE5ELeWim0SSnfkvl1CTJWoESmWG?=
 =?us-ascii?Q?90S88w0ACxnJkmYaPPusaeKe789yrcilm/jh2d86Ks5Oyiq5b7DNkpSu+DE1?=
 =?us-ascii?Q?ID/uWpTtOCWPjCr2Aw2Mlr6swa2nLhVd0OKjJT3dxF0LUSnXim47Vd8VoSYS?=
 =?us-ascii?Q?drmLK4Myar8Ous7RkT3psNkhLquT6+YGOjzjWM8LkLCz7zaBZQ4zieEESVp0?=
 =?us-ascii?Q?2/G3l24tp7N0OY9f2oeM7PDXJzkUEraMEep8ulr7fnqGuleZ0xbHDypK/4Wi?=
 =?us-ascii?Q?ieSwBD/olBhi0Lk/yYnK71owDPAx4YkaTBCWnXI3zkoEeXJjYMk2PaRC2CrV?=
 =?us-ascii?Q?Ukg+bCrGtqq7hCvhB21DIYqO8BX6Y5R7ao65DvPyzBaFsN/8gA0g+Si1yTSA?=
 =?us-ascii?Q?R8uOFD0cCQ2F8/NAUN1NjA9WCZx9HdPssI/kd41DnOkjmkyjd/xz14Z/VpuC?=
 =?us-ascii?Q?xSJPIsKkoAgfp735K9vtPV8imhbbUGL3wI5doHNpJfZIZdHOaoz/kkwJ6Bmw?=
 =?us-ascii?Q?xg0VbuHunkd9zGGXt52BQx4z7dWJwstsIznXpbZDKqFVmW3Vfh6mEoR/Wbvq?=
 =?us-ascii?Q?NjAyNwwXduAIxxREU2TubNc5eGdje9wUq170TCSGrzolfrgEBpcQwgjAj/le?=
 =?us-ascii?Q?L7P6ZBfz0KL9EoYXxLiFyQdZpXsAqe/qiIJzgYUGa03iWmhS8K12gx5QXZ/x?=
 =?us-ascii?Q?1Qrnl4VHCr+IvCjuyOY88WGw0XtoFyeJdNvXXiGLjUhf1fjcfPIg4vt9wOnu?=
 =?us-ascii?Q?7GT96ZvTK54cyTmaLfFFVriNRAz/75GwtgcA0pCWNGKgv+9MvYEOzi1Dodlm?=
 =?us-ascii?Q?lhXBB0hzc+OG9G8OASOZWUPSasPPH5vaahN4KqLNJITtStDSJmxRASnzP6du?=
 =?us-ascii?Q?bg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b4efe9-6620-484d-0d3d-08dc46fdd835
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2024 03:45:24.7656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lAC680O2t2QZal+OBfxx7v82Fizhd2upnupIxr/vQ6xvxhjuBI5ZjsQiDGhvzBe15q51TV+fH/tGXI7xIngKUFAryo1zgttYGZakBHXOvIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1039
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> This series is the series that attempts to support the CDNS DSI driver us=
ed to
> converts DPI to DSI.
> CDNS DSI is embedded in StarFive JH7110 SoC.
> The series has been tested on the VisionFive 2 board.
>=20
>=20
Hi, Andrzej, Neil, Robert, Laurent, Jonas and Jernej

Could you please help to review and give me some suggestions for this patch=
 series? Thank you for your time.

Best regards,
Shengyang
