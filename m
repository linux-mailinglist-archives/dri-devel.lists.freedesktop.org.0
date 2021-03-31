Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C1E34F89F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 08:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48076E17B;
	Wed, 31 Mar 2021 06:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923926E17B
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 06:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YroWpSqfUofDMHLvmhfO6PbLH9UAtBro53GkDXBDI+nXKGNbDRlUknx2VNxbUAELNUuEBiRsdsNdMRJd7MhanUNB0M1GhNFeRwoVSfP6Y3Nh5gNLIgD2nweURknwkEET+4Qfgrr0xS2x92Vvu14howIfVdRKiSlvLYXhW0NUE9jn4r27NOU7GCl4HO5MGUgXCb5i/FkiRnVJ9dzvaxnwT/zd+NJMdPKeRK3lv0Pa01KxSEBrvXOVyDtdGdWLkBAsO4gzKboONRqyxPg1gf1iBzSwDD/ko9K4qbkKuPAIYcBn2LDuCVWxzmJs0976RVG+d+08yOo+ZkOLsItFqrKNHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHUsTyO1EeSKPKo7DeMGSYF2z3Xviuf5wIRCLsehXso=;
 b=eqpMdxnH/XpZG4lnnAmkUF2FVOB71fsgCxp1bnfvsHlJX4QcmbaCFk3UugaXzvS1045ezLE+7TG63m6dUOzLD3ZxQ3xFYoZDGOEWRglQpgG2KXnGgi6q6xk4G25VOJYuI3yAfc7PI/UjV47HSxPLJG6IH+l8Ay8wAAv6x2D/lor6XH20cTNzj8wPjeTrhgZZ1LApXevdlD7KKZdkIdwnpJfpe6qbhf56PCQfPhDibIjpHOLABue3iTLVy/dh1esJ5yNm/o1PYPROcUG7zKcnbfs7GzkurL9V5nNLAcSJEgt6R0lLWh5EpTdaBNYQx7x2lgdMpfSkEaVIOB/8z/ldrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHUsTyO1EeSKPKo7DeMGSYF2z3Xviuf5wIRCLsehXso=;
 b=C8M5WpHShSb5pJdiqy/HHKDxE20XAgSBkHdBNPii6BpHM8X+kql3FKQFmjDZ+nZ13JF5yBxTG0t4WNnE5j5Q81Csi5Di6dj1LQ7mWBJZdFC3mmjdPW4H7+JdFzJRI3/Vgo1bvajd9W7MBGAw/En9iupqEZ0/uZwxGUshVd/jFCA=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Wed, 31 Mar
 2021 06:21:55 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 06:21:55 +0000
Message-ID: <6e7ba08f65fb3ab80ebde330d061524eb6377131.camel@nxp.com>
Subject: Re: [PATCH v6 10/14] drm/bridge: imx: Add LDB driver helper support
From: Liu Ying <victor.liu@nxp.com>
To: Robert Foss <robert.foss@linaro.org>
Date: Wed, 31 Mar 2021 14:20:17 +0800
In-Reply-To: <CAG3jFyumkoNDEJ7hZGmHUj_YqMXXmR0emiFGH4-vK3jJH7Y=vg@mail.gmail.com>
References: <1615952569-4711-1-git-send-email-victor.liu@nxp.com>
 <1615952569-4711-11-git-send-email-victor.liu@nxp.com>
 <CAG3jFyumkoNDEJ7hZGmHUj_YqMXXmR0emiFGH4-vK3jJH7Y=vg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0195.apcprd02.prod.outlook.com
 (2603:1096:201:21::31) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 HK2PR02CA0195.apcprd02.prod.outlook.com (2603:1096:201:21::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27 via Frontend Transport; Wed, 31 Mar 2021 06:21:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fcb757b7-39ed-497b-e909-08d8f40d47ad
X-MS-TrafficTypeDiagnostic: VE1PR04MB7312:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB73123C91DB994163C75F4DA1987C9@VE1PR04MB7312.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I69fGWOG0iWNM9glgspIWXXS7SsSM+2czKiPWpHyJa6yH6mL9Denm/tBEX2aPjBYb5RcagzG8wCiTJFRNZjmc/NL8k25eT0DluUuKoJ9M/q73cLUOzxRrVHFAgG6GLTza5b+YEvGTezRNsmmtyQ5N8WCRhK0tY4IpeB6kBySzu9+XP5CyVwVj8Bmk6epCNMRq/Yu3srB7JtL1BfsR8PSW0Ew7mLnOHa18SMte59IcXksXnPa79J9OhRUS15wK2Iw1N2EnWqXb49GYy5YzzGyy3846iLugn0jxDwbDSKjgiR0uO4Yuzfwjpay2ADa2HHnXXkbfBODtHnXEXq7s4E9DSpqo17TCO2a8GBgH/1xrH8kfY0oFgIgP6XKwj83K9tyHxN1EogF2YuGiSrYjDKB/v5XAOD5cY9P0rCN6fgb/uNI5wreSE3OOdnpGCiYqleQNMk0HwaRNcpY2m6Wt3xWPQ6diF73hfJRCo82lBwo2V7xlNPe5mAAUdptSqbm0QmVUJP8Vqm8H0uLnKl+vQQF7O9XRBXCX3/mnsLliObqhIU/q9nUfKW8//zhE9RjUzsJ8GY4i3YUap0W3TrOprLZvjl81nlePHDs+kp8vbJPPrUtKcpQU906enWkpu+nUjF6eEmuCCIzRNBjZ7N9oDT/nCdSzoDplpB97RVwghZ1P5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(26005)(478600001)(186003)(86362001)(6486002)(52116002)(8936002)(2616005)(38100700001)(5660300002)(316002)(54906003)(8676002)(4744005)(2906002)(956004)(6916009)(4326008)(66556008)(66946007)(6496006)(66476007)(6666004)(7416002)(36756003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y2VxcXJ0OXF1YldoUDZQQTVvdE5rS0FGQmJUa1BEOEd4S05UdzdUZC9PT24z?=
 =?utf-8?B?cWs5QWJiMXp1RFJuU1lKd3Z5czFURm93MHo3YjFuZldRVWhOTkNTNm1aNHo0?=
 =?utf-8?B?SmcyWjJFbzVsNVMwU2cvQ2xOL3VNcGp2YXRRQWlqMC9OdWtxbXZVWUkyRndn?=
 =?utf-8?B?ei9RdDdUaitHM2JyeE5LeFN0UW03dFpRSm5OTkdzVnNPeUlHQzVjRXl0UHhk?=
 =?utf-8?B?ZTZsZG9LMFRPV1BKUDNibnNXZWQxMm9JT1dXdWFpSTNscWhNM0UzVnhsVEdE?=
 =?utf-8?B?QjlsQWZSNmdld21nMDFaWU00WUwvMlg2SFIxU05ESC80eVJ1ckpCckR6djhG?=
 =?utf-8?B?YWEyc1dOdXYxbVpRUUpTRmZQZkpxbWhwMUN1MTZyc3lZZzdNMmdZdkdnNWh1?=
 =?utf-8?B?c1dOS0pSMnBqR1lwSS9HaVIwcFVaTGhEeDNMZitrbU9INS9ycjBDL0hzaWE2?=
 =?utf-8?B?VzJiRDZ1S1VXWSthMjBDa0lnKzV6aStDNkNnaTNlQ2RXeWh6VkZXV2o1NkUr?=
 =?utf-8?B?algyS3EzdGYvdks4a2dJYnpXYUk3UjgrR1JIdERSZ2xnYUtPeXdqaEptdmJN?=
 =?utf-8?B?MVEvZU9vVWVMa09OT2hrS0RzVUwwK2xaa1B6RDFkaXYvYmZRL0piVURLdm5u?=
 =?utf-8?B?a0JXaWxQZTMybHdWc2RNOWVHYUpLWFlWSVd5aVZyZ2JsK1g2dGV2NDRZazF5?=
 =?utf-8?B?OUJJWFR2NnUwWU4zUmNpUU45UWQ2bEJ1QlRhZXdNbUNqRGI4SlREaXVITk5o?=
 =?utf-8?B?Tkp4ZDhnbDlpRmRmb0EwOGlsY2h4MVJPQnFjczRCbnZGK3pFdDVwSElLd2ds?=
 =?utf-8?B?UjROWW8xeEI1bW1WYWw2NUtUTDJPb1VuWEZ0K3cyWlFJSHRUekhqUXVlZlB2?=
 =?utf-8?B?ZllIdVhsSko5RUI0K08xM2RIVlZMZGZrbkRJc0JkQnVjNHhMZHhSMG16eVFq?=
 =?utf-8?B?WmdoQUtUdWZwMHluQ0JEQUQ3UXJhdXB2QncvSGJNd3k3aXVIVjhzRERRWTUy?=
 =?utf-8?B?QjNEWFBSMXR3Q0x1RjVCUkhxL0FPTzhnN0xUNTdHa3o3dnNLMWtsOS9jRjgy?=
 =?utf-8?B?RWptYjJCTlE5RmR0Q2dISS9PWHF5aEFiV3puSEl1bm1EMm9xSzN2ZGx6bk50?=
 =?utf-8?B?OHJZdnBCYnFlNFRSNzZzQ0RBYVBIUHJ0WGVSL3IvMDZFa1VxZ3ZXalJDRU90?=
 =?utf-8?B?UXJhZHE0QzczRXQxTDRoZlIxTGFKTitkek9HVFB5OXJabzBURm1lZlA1NWps?=
 =?utf-8?B?VHpyVVBydjIxSWRXM0ZUbmk5K1JKT1pLQmxIWElyWFRRMUMyamFoMHprMzZp?=
 =?utf-8?B?d2poamU4SzVhMnU3UjhORDRYdTYwU1ZBWlB6QzdyZjRrSFE0WDJmTmMyRW42?=
 =?utf-8?B?dEJDdy9mYllJY0FXWHBNbjZhTFptTnNOeURkekJJNVFqWkJ5N2h6UW9CL0hu?=
 =?utf-8?B?V24vU1pka1NoYlZoM0pFaUtqdjQ3dG9MT0lCWnBVL1g4U1ZnVG5nTzBqTU5W?=
 =?utf-8?B?TFpYc3I2ZmlJM0JUdS93cmQ4SHFsRDNmQkZFSWhuS0EyYjVhSCtTVnNkNUwy?=
 =?utf-8?B?NklEamQ5K2tCL3ZibXM0T3VDTmNlME9xTzlrcm4xdVVKOEs5bkJtTDdIYWs0?=
 =?utf-8?B?bVR1VFlTcTBFMG82dnNocHhJQy9RNytLMnROU1NCcDVieVNKakZ3MWxFa2dG?=
 =?utf-8?B?cEZpV0hzKzJpc2l5MkFTK0Vsb25HMDlyS2Y1WmdUWnVaRktSSkt4SUw2by9n?=
 =?utf-8?Q?4PLJppdwRioSemgMoZ64oIsPY34wmfKZQshSK1+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb757b7-39ed-497b-e909-08d8f40d47ad
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:21:55.0145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hIIEmZDeb8XIdFTWHb8XTPdZw4MbWUPnHrLYHX7qlqzIhpwIVMJ5d/CK4elHMcBv6DGpwaS+6+LcCxTH74PXuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, lee.jones@linaro.org,
 kishon@ti.com, linux-imx@nxp.com, linux-media <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, s.hauer@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 kernel@pengutronix.de, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robert,

On Tue, 2021-03-30 at 11:46 +0200, Robert Foss wrote:
> Hey Liu,
> 
> checkpatch --strict is listing some nits for this patch, with those
> fixed feel free to add my r-b.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>

Thanks for your review.

Will fix those nits in the next version.

Liu Ying

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
