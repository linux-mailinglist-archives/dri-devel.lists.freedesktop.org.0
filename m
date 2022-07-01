Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34E15629DB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 05:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CF710F001;
	Fri,  1 Jul 2022 03:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60066.outbound.protection.outlook.com [40.107.6.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7FB10F001
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 03:53:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9PEshGBkrY4YN1Al0XCNLZJpU8pFHTDEOtsuq0G/5TijCIaZ0x2ALd5naYg8bvZDf0ms4VmD/2RIjthnxiVPxVDpbpQ++VDNh1kEGxJBOQw3iTt0N0D9JIYUchw1zDGU1d6170bgJqMG3jRjWlgPmu1Z4k93rI/mQcUulOEnKkegRcdw8qat1WOpIycdAK35OLV1sXaD1sT7Y+XENCMO2f9y2gLevMta6G8WxfXfKbb/yJ8B2D4O27WjMgJCAgGvprCmZI9UFXPc+jhSNQgORO7uN6RZE3O8uKNINml0zKdrR5Rk3uUYfGltI56TB25WmSTdpqJ49gJLtjN0sTHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r96jVFTV2zFEq/ROeLqiLPoKFxvQfNQb0N3K9Si3/Gk=;
 b=JvRc3Z6G2Hkb7ntVHIteH8AQpeOunXP+nHbwr1hJfx+PhMUkZBD+U3orrrOit2yejf0SUtKPJXFdV/DQedODQU/gETz9V89FwJCa0spgWW+81MnSdf38HMdbq2J/BAUF2SnjHn2+3Uyh/sEFnBk2F5a9YSgFdhnlvElNzxotfGbPSZ8qsv4TMhKmB+Ah0ukSu6w5qB76GXaQYd2RjorlTR4ydbYDgP3dSW0bJrAujfEHDnOgDkJqup4Rgp+NAoG9UNKCXaybX2KOQP6tTn/+AWRPepiuDg9D1SMt4YZhgeS28bm+WxLiAJAm9TNobSVqAKQZZKh+/b64TFmDB84UYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r96jVFTV2zFEq/ROeLqiLPoKFxvQfNQb0N3K9Si3/Gk=;
 b=OFqi0Lymeb8g2wi14s3Fj0fA01UGXHgWEGg5hhMOIAB4rJId0X2+4AoanjGc89p0cENMQoO7KJiD6lQQMcYziGs47ULQ3PeblJowUkR3v2Y1CJuuRDFkgSs7e92zOFrTcmt9RKPcUBMiTbrNtOiZoPsiTQAZPk9xbKiegKXEk/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9122.eurprd04.prod.outlook.com (2603:10a6:102:22d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Fri, 1 Jul
 2022 03:53:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9%6]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 03:53:46 +0000
Message-ID: <fcdda7ed094979d27e88b282b05f81a7bdf460b8.camel@nxp.com>
Subject: Re: [PATCH 1/4] drm/lcdif: Clean up headers
From: Liu Ying <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 01 Jul 2022 11:53:06 +0800
In-Reply-To: <20220630205728.128127-1-marex@denx.de>
References: <20220630205728.128127-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fb50941-3a05-4590-7e09-08da5b154c98
X-MS-TrafficTypeDiagnostic: PAXPR04MB9122:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jVgcD1izDuZDGnVJXujM5C4Svy9nHq/PxVk0uDYUCUMDrucb6Zmwh8qN99DkV+3uOd3U3DanYNGhpEez4wEqUTR4TlppU5OhWQQDzRhEmXq3UFGS4P9r4jm3FBBo2+wCD6kXogkamiPleOQ6uPDkOGNsBv/b6ouNma8Fs794OBk7AaFhQCxFZrCotVYP7nyjolZCb6DsL3Vl7kCajeM75cvR0dinv2yNekPpk47r6Ge5DCKeo4UOCl7s0klRW8S1AKky9Om05aLaJKHAPhGnf3mVIaLKbD2FDYAeoPoz9RJXRZN/v/LMT5w1YnzCIyo1cvSxlhU/tLkpBCFEvwfeAMB+o3eHd68HhhaPgUgBLylYEO/SG3I5r1KoL2eHF8d0VAuZvZBXFsURD2KvYX78T5tM+HoxIimTdVbGm1cX72RLFKxdU+VAuWc6maPRJeVi38n9arJTf5k1Qoy22v0BEchseqxZy9qkNCGbLcReRKwnndqgLVDzW8iXQjGYrXBxFWSV6MwV7wnz7Ap/CF4deMYJ4W7c9iLnpyr4/QFR5fxmfWTIc/enL/6tHdb1655g3ulBc3CmPykpAgUL7PNm0jnbTFHdI/9IoqjhTyRewgLYWkBgEAe3UdkHDu4n6G5tw/KAxM5sbvOrOyoeGNXdY00Kl+QnboqgCNAtCb8is2SICSVKzK+xtGJt5TMgxnQwDdDb4fWh1obZNJug14oAT1RYmmK4cACGCYy+giTKGJl2lPNhGWkUK+/CvHTjY6mHJLoyv0vZxXm8E0Vv8qD0lH2JYp1fuOuKoIV4FHSNSk/Qwk0NiByfu4YY+T8kESUXdx/aNZN+cXWrM1HHjYVkBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(54906003)(316002)(4326008)(36756003)(38100700002)(86362001)(6666004)(2906002)(5660300002)(41300700001)(186003)(26005)(52116002)(2616005)(4744005)(38350700002)(6512007)(8676002)(66946007)(8936002)(66556008)(478600001)(6506007)(6486002)(66476007)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXBSTHJxejNnV0w3T1lrZ3g2QzVlWkl6TzBpZDQ4SHQxTkp0V0pWdzdXL1R5?=
 =?utf-8?B?VHpwTnpwb3ZJN1ZEZlQrWjV4RDMxbUU5K25tTlRRUk0rOGVtYlpOVmNXbGx6?=
 =?utf-8?B?d0JORGliZ3VsVWdicXBXL0pyVUpqZ1RjZzcwT1RRL0Z1bjZZRlNDOUVUak94?=
 =?utf-8?B?TDhCLzlyaVRFVytyZmJ5QmlnN2QxTWpSTVRBUEtHTldpUmkyOXJjTTM0VFQw?=
 =?utf-8?B?RXZwbEtIdnFoTWNud1RpT280Zm5kQVNyN20ra1VKM0dGRFRwZm1ITXlpUlhz?=
 =?utf-8?B?b1JyU3V5STEzTVpyV2VjMyszaTRROXllRGJZV0NxMy9SQjVYbm03SWx5Q3Jp?=
 =?utf-8?B?MEtRYXU5L1FYaTgwbTBFQmVORzh1ejJPM3JTYnVZbEFqOHFJZm4yTkpNWDBa?=
 =?utf-8?B?NVNsNzZMOHd6MmZCaTlXRmZDRG16b2Zqd1pOQVNhc1BJVGRKOWRHS1NEczZV?=
 =?utf-8?B?WTFLVlZSMGpOL3Q1NVNKZzgvU3ExeExPaVdQZkcvVE5nOWdpb3hFdWw5aEZw?=
 =?utf-8?B?MUhCZ3pPNmFxLzRsNFZIMUlORC9HYXJYWkpFUExTWmJsMEN4alJKTnV4bjk2?=
 =?utf-8?B?UTNpM0RFOWQwK0FFU2hMeUs3T0NLYnArWHlRei8yV1dKdUt2NDcyQ3d4WlVD?=
 =?utf-8?B?RW42Q2k0anI4RE9BSUtUUTN2MkNFVjBxdWNFSnNLbjlSM1A4THhYMitWaFNa?=
 =?utf-8?B?OW9WLytIb3Q4Qk04SXp6bnZHYVpUemV0WWVLSE12cWJmVHZTVS9aOC9JaFVj?=
 =?utf-8?B?WDdJeUQ3d3YwbVhxeG1leSt1Sk4rbmlkNXUreTMzcDZ0RHJRTUNmQlM3K0lE?=
 =?utf-8?B?UmhJSEdndU5naXhDakxBbzdlWWJmZHNad1JZSzZkaDA5ZS85enl1Uy9SS3FL?=
 =?utf-8?B?UHRwYVRuRTFOTU5tL28zUUNab0xtOGFkbkJUTHNHM2lzSXQxMUkzNVgyNjBa?=
 =?utf-8?B?VXAvQ3FoWC9RV05kYjF4ZWUzbzhqck0zek1DaTltc2k2NHZvcXhSWkVWRHBx?=
 =?utf-8?B?Vm1zNm85aFl4ZktCR3FZWmhTZmQwcjhHY0VaNnd6Wk9XcUJRaUZXbllXTUhG?=
 =?utf-8?B?VzhUUDBpTEVmcUIzM3ZtQUk3QVQyTjBkL252dm1QUXlxMEl1NmJWQm1tY1A5?=
 =?utf-8?B?N1hNNVRDT3NwS0M0SFFuWlRvdmd3UVpVS0VZaUJYV28zMmFCUk1DczBBOXVz?=
 =?utf-8?B?RG14VWFjakZhZmRENDE4Z1hkQjZkdGwwR1FyMFZXZVdrVkVXK3JhdlFKayt1?=
 =?utf-8?B?dldjV2c1TTVMSDlseVUzcm9NTnQ0WDVVVmorSEMyWWVlcGR3MHZnUnZYb1NB?=
 =?utf-8?B?c1UxenczNmE1V3RDeXBqWnJHbWV6RWV2WHdrMFh0VWlFaHRDYVBFWEVUWWZt?=
 =?utf-8?B?WmRxU09hRjhLTmxiK2JwZTdhc0Vrc0h6YVF5UmpZQlNoMklXaXVUQ2FIdzEy?=
 =?utf-8?B?cjVPZWJLOEpuK2FMaVdhMnorakxFbzZIRERLK3MxWVk1MERWNmVDWWxhSmRU?=
 =?utf-8?B?OFNVRERlQXQ5TUcrYU5waUtsbENMR1lQMVdscW0wUExDd1ZDaTVKTlBuSjFN?=
 =?utf-8?B?RUN2eFhpN1ZoWkp3VjZycCtMa3FDOE1oeEEydnFoRUxOMjhFbVpvVk4yUDdE?=
 =?utf-8?B?YVFMZ21jRGp1bVJCbzduNGNzeWNFKzVYdlo4ZmNhM01CRkpjVGN2Tmtqamcz?=
 =?utf-8?B?TldFcFJ5RG1nSjRkekM3djdyREV5eHdLY241MWpXV3FML2tzeGFYWHdxVXBR?=
 =?utf-8?B?MTZxU2xMTGhKWXhxamd0RXRpanhaeDlmYVNqNlovTzhIR2tRSkJmQkVrMUp6?=
 =?utf-8?B?N2wvdVEvUkhNRVhjcDlQMisvZWtWMGJWcGlKVEYwcEdyZFFLQWtOaVMrRU4r?=
 =?utf-8?B?UjdzWUEwYUk5SEd1M2srQkJnTEVieXRFSWNSYVdKVElqdHlkOERtNzdLV2Jm?=
 =?utf-8?B?dWFLbER2OWx0dUtwMnVMenBDWklUaS85UGxpOEdIN2wzZ1NHb2ZWQnRYa3Jo?=
 =?utf-8?B?UTBUUmNQZmNsOWFJVkdKNlJMak5VS1F1bkR3ODdoZytDVDlBOEFvRm1tWm1o?=
 =?utf-8?B?NzkzUXE5QkFib0xMKzFQNXpHVU81NGdhVlBYRS9aUldPUUxpSjd1NkVhYUxG?=
 =?utf-8?Q?lvPlArqZ4E2Rv7mfax7LGx1ST?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb50941-3a05-4590-7e09-08da5b154c98
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 03:53:46.6661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyUUOShWmvxBc2otdK0Ie140O57M41pKbZfpMfqnoqh07KsL/eQ6zDM44021Usdvyge5dx5iDAQptWe4d8oOMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9122
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
Cc: Peng Fan <peng.fan@nxp.com>, Martyn Welch <martyn.welch@collabora.com>,
 robert.foss@linaro.org, Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-06-30 at 22:57 +0200, Marek Vasut wrote:
> Drop unneeded headers, sort rest alphabetically, no functional
> change.
> 
> Fixes: 9db35bb349a0e ("drm: lcdif: Add support for i.MX8MP LCDIF
> variant")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Martyn Welch <martyn.welch@collabora.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>

If you want to add my 'Reported-by: Liu Ying <victor.liu@oss.nxp.com>'
tag, you may add it.

Reviewed-by: Liu Ying <victor.liu@nxp.com>

