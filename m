Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144A6BA7D11
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 04:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5D310E1FB;
	Mon, 29 Sep 2025 02:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FZKT9rlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010062.outbound.protection.outlook.com [52.101.69.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F7210E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 02:40:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRxh18ZpVIbMI2XnMoHgAOy3vU9G0NitrEAQslKiB8x9I4wmCnHGs2MWjAku2zbM7dRCaOz+/H4T/TJMOn2AxukpAGIo20tbtYFMqZ6aqwrQ8i/eVmjkvlu0jv4NUji9mdMJtKSDaTUOBbqlecR45p69eMog6pVvuG11YUXeEK9zMc5Dui2jNE/k5RZAw4qTb9hVub7g1FGFBW3qcbzkpqXULeoDfuGDFWdq6PAdB4DjxmFH4nhuxSmXZ0a2ZZnYuwibh/qNKE7bdTudNN/G46D/u12kle3Udwx3alKCJPSAbAQRGLuDUHQvyqsiPz0Rgr9Q81Su1Rt/HkPpdfII1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJDWuUoMeRaW1CEUs/x2kC9u1WcRhDUCnVdtmZwAPBs=;
 b=Wp01hO5dfZQ3wYCgLfTVpzTaHD3M0+o7Z3UmM4jjh/rK+bfkaDrVscl5R61JMF/NLSiCtuf6TbAJHyOI7UsR14ZTJ10j8PwAuWJJ+ppPmDZKtBQ0c8UcoRqKzT54AARdqV0l84htWt1dYoYA7q9PPfJKMPTWLvJbZV2z/T8VoPpxioNrXCFEyIOMdifBAAhv39AHP1rhLp0aLHRm9X7VdEB48Y3eWfw0XpilWKkpv6p3Lzf8H+YUZ8QSCr8MGAPzXPcYuS1U+GvlHtXD67rOTeoWnVDxH0BrsLGeAMnLa2FhVBwhEcnYW+AaOx04ztzGhthYuhIYIJFE5I+H3WavvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJDWuUoMeRaW1CEUs/x2kC9u1WcRhDUCnVdtmZwAPBs=;
 b=FZKT9rlCmvzK7xMK3tamqp4bU3pmhx1bYmzcK5ZFu4Btt0Wvh2DPo3NpUzF0d3VRjFpH0ywcznWj9PpHsLA8Bf2gQKGiEs+rNHlo60EsUOHekAc5/Nq3vvsUVasPlN5QpZAv95fMMmhomAHiGHHP8v7zdHUZEwno7MYBjKg3zb+lgKGQZToh8dNlZcWVed/NuEhgKZwKVkLMjrA0EdJzRHiVBXR50qcDY5f+vIw5vTdNaTJO6Ua0cA+0m/scNX4guR+PHwrKreo2MRyHiRGm6GX46QBw2YtSV+ppVYkiI54ogPsNlheKzmXUL9TQp/m1sqaB1r94mjEpjBi4fFlmKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11722.eurprd04.prod.outlook.com (2603:10a6:800:2ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Mon, 29 Sep
 2025 02:40:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 02:40:55 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 29 Sep 2025 10:41:40 +0800
Subject: [PATCH v3 05/14] drm/imx: dc-crtc: Disable at boot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-imx8-dc-prefetch-v3-5-c01d0608add2@nxp.com>
References: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
In-Reply-To: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11722:EE_
X-MS-Office365-Filtering-Correlation-Id: d49dc5d7-291a-4e7c-eb16-08ddff019cfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UElMTjJ6MnNkdFA2QXRtbjZOazdac1JpY0l0R2hSVDYyNHMyT0M1dzRYRGFj?=
 =?utf-8?B?b1Q5YkwzNGNXTlhQb3ptanVUUTZvSXJqUjFmUFhqNXNXK1pRRTNOT3ZzYlRM?=
 =?utf-8?B?N05VU3ZIb25aRVFLOE9BR3p0MGZsd2NEL2taUjMzRXFsUXlER0J6VVppVVBp?=
 =?utf-8?B?RVpONFR5dzhHdC8xK3hrSm53WGN3M1ZuWjVWQUVBdVZOcjZwNmhGSENzcFlk?=
 =?utf-8?B?SHJMS3BueExsS2dBTXVJcGEzd0kxbThrc3NydGw1dmY4aFg2YVdQblc5eHJB?=
 =?utf-8?B?eWp5ZitwQS9GRE96RU9zQlFtU1lJelVMNDhsZGE0NEVBN0xqUkZwT0xjYitJ?=
 =?utf-8?B?QnZNZnFXUHBzajFibjk2bUZrbnRaeHExNnpreVUyR05qaFl6WXg1cHdWUmhv?=
 =?utf-8?B?T0ZlRlJNcFdvZnp6OFFIOFVJTGFnc1VsdmRCMktuTGZDWXZEY3c2SXozVDd0?=
 =?utf-8?B?NTBuVFFwY3RvNjFJUldNSWxaQ04vazJXbVRPa0ljY3E0M2wxRDhEY2E0ZlZT?=
 =?utf-8?B?azV2VWQ2RkhnbUdQN0RweU1zeGRYWjd2RU9XajZ0UTZLZDN3V0d4K2NNV1Vw?=
 =?utf-8?B?ZkJCSzB1eGxEMFhLK2JCUVlMMm9VTGZHRjRrTnk4L1BYMk5Qd3BCbzRiLzRV?=
 =?utf-8?B?MVBDakhPQnFSOVZvMXRocnZkbGZGZjZ0NlFwTmNzaFFHQWJUVFlIQm15dmdP?=
 =?utf-8?B?WEg2ekZ1a0RVa2QxVTJZRmFyajMydUh1RTk2RE1iaEIrdm9aV1ZtMkU1eWtk?=
 =?utf-8?B?RnVleWtPSnhHUFRuUUpFZkN5cktMWFV6QUR0WlhVRlBTaXorRE5GL0VmS250?=
 =?utf-8?B?b3JpL1pRL0NLY0NJc0puL2pZN3dtN3BobTZDRDc3TndrdUg0NFRSaUNIVUR0?=
 =?utf-8?B?Tmk2b29rcVQ1RUVPc0wva2tTa2Y1enhyRmtkLzNWZmVxVzgvNE1hanNoZEly?=
 =?utf-8?B?UWd3dllOdnZyekdBTG93Zm9GNTd1ZzNsK2wwSkh4UDluTHk2TWdGMzRjbGVO?=
 =?utf-8?B?NHpLcVZvWXQ4WHYxMEtKdTNJQUc4RlVBN3MvZ045WnFZcGl1VW1IMmFDd3JB?=
 =?utf-8?B?aHhZeWNWTFovdEVlb1VKZk50ZHFleUI5SzFwMHlJYklYWVdJbnB6RmkxaUVW?=
 =?utf-8?B?MFpUeWt1NVgxOHJqbzk0R2Y5U1BQbXk4QWZuSmhnQlJEL2ZSVWI2NFpXM1gx?=
 =?utf-8?B?dk1oV3diUW12VTFObmRRTUpZcFNjY1RPZ0hJaFZRVWNYVUtwTGx1cEg0QjJ4?=
 =?utf-8?B?ck9xZ1A2YjZMbWVhajY5Sng4UXhJOTlWMGJZOHd6U2c3TjlYN0xleUVkaXNl?=
 =?utf-8?B?TFQ2Y2FFSkUrcjNsM29jZUt5QVBkWlB2YVFKRVJXUGIxMGd5UWZDOG9ET0t4?=
 =?utf-8?B?a1hoZmZMdEtmN1U3U1AzY2ozT0Ric2JVZFNQOFBQQXlwYkJrKzdLcTBORDJV?=
 =?utf-8?B?OUJKMi9Dei8xY0EvclZwbjZQektPeXZ1VytSS2xMYVZaNE5RZDl3VjQzVlVC?=
 =?utf-8?B?aHlZa1VjMFQ4WUwyb1I5QUZGVHZkNDZtSkVGT1ZvVmNndU9HU254VjdIaFNB?=
 =?utf-8?B?NGxicHdCMXNqcEVBNDlvZzFZSHRRT0xmQVJxbHMzVGk3dWM4K0k0VWsybHE0?=
 =?utf-8?B?SnFDU1JVNmllY0Z4VnIxUXBjKy8rS2RFeE10R2FyeW5EL0h5bW9UNVB3YlFL?=
 =?utf-8?B?aEp2U0MzRy94VjNDVnV1c1NvclN2Mm5ISlJlcGtLOGluaTNKZGJKa0dac21Y?=
 =?utf-8?B?NitncmRHNStudEdFOE9jcnN2MnkzMGw2Q3REUFRwdDZ4UDFid3RPcU9kOXdF?=
 =?utf-8?B?Qkx4MHdobUlYSTladm9UZnlpWGdQQlBlcGJCU2pTNkVRMVBhVWQ2WEZlMDE0?=
 =?utf-8?B?cUJxVzcwWEFHdXo3Y0RERG5HV1VkbTRSU01jREI5SVVBVjMrK01tMmpESnkv?=
 =?utf-8?B?WXMwUEU1bmhMZkhsNHR0a3Nnd1FMbVBLTG9wSTBTb05Gc1BIMlBpSUZJL1pO?=
 =?utf-8?B?d1lnbEtXYU9EaENqcTgvQ1hYcE9YUHdmYUxGZ3pmWHRjRU5BTnFLVy9kZVph?=
 =?utf-8?B?ODZpSVhlbUpQVDV4SVNSbmZzWXFpamc5TWpLZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ai9jdVIxdFNwT2cxdmZpb1daK3hYYVFRZzg3OHRWOHZNNWFIODNoU2pxNXN4?=
 =?utf-8?B?U090M0QzV1BQR3FrQk8rdmY3TlA4VWF6QWN1bGlaRFpQcWY1TlNlZEJIRU5I?=
 =?utf-8?B?YXRHcWxSYU9ScVpxYXJUUnhVak9BMjM3cXFzaDBOMy85OUZzZmpKaXVuWis1?=
 =?utf-8?B?eVdiMVQyRDlpRjU4aExuNnIvVVByZzUrMnNmU2x2RUVkSXFPU2dqcCt6bFIx?=
 =?utf-8?B?S2FOZmM2VGxUR0M1bE94dlRNSGEzMGFHRzE2M2RaUDlwMTZxWUVtZ3VqTEVn?=
 =?utf-8?B?VjY3S0FTcTdlQTd5TVlrNkw2YUNnRVF0d0pZU0gyZ1I4ZldwNUxMY0l3UUo3?=
 =?utf-8?B?bHRHb0JBanVBNzRDVTNORGg5b0RkVTltS0FyZFJBb0RMSXNSYll2dE16UFhO?=
 =?utf-8?B?Skx3Ui9yT3U2NmNIT21NdHI5VStzdXd4U0VGNDcya2EwUW5mMzdvT3BUNU4v?=
 =?utf-8?B?bkZGRHFXOUNIUTlpTDVnWSttU1pkZUZSSmdUdUVYeGtZUDNGM1pwZUlvTXB1?=
 =?utf-8?B?U2RjMm5ZNFFYakQvNnVPbHF4citkblNBQitGd1AySmx6d0ZVOU9ubGVHV2FM?=
 =?utf-8?B?VzBSVzNwaGJlZFExRXNSeURJSDFKZXBEdWdvbm0rVTFHdWVaTytKd2J3QUVS?=
 =?utf-8?B?SmtkanYycDNrbHZ6S25pSFhKb1E5MGJtZWJBa3BSV0tkbFZYOHk5dWNCUFhr?=
 =?utf-8?B?M2Q5YXpqTU9lVldxcnQwSnNhQjQ1TlBoZ01IVEtDN1hxajlvMFkxdVJxTTBr?=
 =?utf-8?B?Umx3RFRUcFVLTDFncUhlNXhFUURhdysrQ2F0K2JxVlRMdTdLRWhRSjQ1cWJO?=
 =?utf-8?B?ZlJYWUllZjVtK29DclBzVVIyaEp3K3U1Uyt1d0ZNOVlkRDIwVVp2Z1JXNEFw?=
 =?utf-8?B?Vmtrd0JMQXJzc1N6R0cyWVI3bHBnOXFtRVNQTzNHeDB4ZkUrUEc0eGE3clZn?=
 =?utf-8?B?bVoyNXRkM2FTZTVwSnBTU3ROQThSTVFsamFTRnpDbytOUUhxR3dwWEh1RUk3?=
 =?utf-8?B?RHI2dm1iZEVXNjJ4TldGcTFUVThKVkRaVXZ5ZjZYLzcyQTdsdnFjbFlTaGdi?=
 =?utf-8?B?ZExqQ1ZQclpkUWpqUXRyNENxV2s1T1htMlBqTFM4bVJQL3VjZTNVWERTbTRF?=
 =?utf-8?B?aFZtdXBNeUllcHZpbUljdUpyZDdhSGxJalJHU1JxWGE0TDhDMjB4N0hxQWRh?=
 =?utf-8?B?NUFDVStIM0IwNU8xc01ldXRvSTJVVXNuOUdVRXluKzBFRjZmUVVnd2xEVWRn?=
 =?utf-8?B?UEszSWFPbGlMMjBSSXorNTBQZUR1MDQ2T3hRblh2SzNtaWVGVDFDcHhCT0FO?=
 =?utf-8?B?TmdjVXZnUmZvenQ2d0ZaZ2FweEE5elQveDkyZkNSVHZ5S1VUaC9PaHpnL2Rk?=
 =?utf-8?B?Vk81eXRqWncvRkxGS21aMzFTeDlYUitaREJoZjg3ZE0xQ0hyeDMzZ2ZCeFc1?=
 =?utf-8?B?WW9td2pjdmQ4dlo5dGM4WXovNzZoMkVLWXlGcWNpRTFic250MzZTUmtIa1lG?=
 =?utf-8?B?ZERrZkpUVGNRb2lGWlNPRnFWTWdwN0VOWVlodFJrWnRDcjA3ZnlZTFZKTTh0?=
 =?utf-8?B?dEozR3JOZmR4MEY4TTJTUzVsRC9oNDhISHJoeTZmdHRzY1VpK24zNGk5bnVr?=
 =?utf-8?B?WjlqTi9HU0VxaFNIWkRJaFgyNWVmT0g5Uy9TZ1JiaytYWGc5Y2ErTDVGVS9B?=
 =?utf-8?B?WDY1UHd5Tm52c3NKT3dFS3hrMkxZNWpMWmcvU0tYWCt2Rmt2OHpKayt6bzhK?=
 =?utf-8?B?czFDZ3NkQllPN3hrRHFweSthYmJGTitwN3MxOUo4ZzZrVThHeFpkdFlCTWx0?=
 =?utf-8?B?Znh5WjEzTEt1M1ZXaFpmT1Ixcnk1Y01PbmRrekdTV1RVa2tSTEF6T0lWZ3pu?=
 =?utf-8?B?M3NjVGxvd2FKSTlvN0dqUCtSaHdBYWNkTjROOTRacW5lSGVDTTB5OWRMNThi?=
 =?utf-8?B?cG1qRVJPVVBpSlZlMDVlS2xnUkp2bHV2YTFqRU9pQlg2MVVhNU5QK2VPMnBz?=
 =?utf-8?B?bmhtNW84SmdiSkJzV20vdnRjTG9NRHdWL3lVdGtZclFYMWc4UmJpY1cxN2N6?=
 =?utf-8?B?RThjZ053RVVNOVBad0NhRGsrMkgyZVRVYUJTemVESi80K20ydDhUVVlMa1M0?=
 =?utf-8?Q?LBtO79IngkDIxVtcKo7UjBSOR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d49dc5d7-291a-4e7c-eb16-08ddff019cfe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 02:40:55.7415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMfMQIoILTwUXUbPZXgnmGV+/Ss1NmnjUv0gw70ep5xSz+w7RoBkiuYN1ol3pzsjWZ+2qWzUO39LomQd6Ibg5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11722
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

CRTC(s) could still be running after the DRM device is unplugged by
calling drm_dev_unplug(), because the CRTC disablement logic is
protected and bypassed by the drm_dev_enter()/drm_dev_exit() pair.
Hence, Pixel Engine's AXI clock use count(managed by Pixel Engine
driver's runtime PM) and pixel clock use count could be inbalanced
after removing and re-installing the driver module.  To fix this,
add a helper dc_crtc_disable_at_boot() and call it to properly
disable all CRTCs before advertising DRM device to user-space by
calling drm_dev_register().

Fixes: 711a3b878366 ("drm/imx: Add i.MX8qxp Display Controller KMS")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-crtc.c | 50 ++++++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/imx/dc/dc-drv.c  |  5 ++++
 drivers/gpu/drm/imx/dc/dc-drv.h  |  3 +++
 3 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
index 31d3a982deaf7a0390937285c9d5d00100323181..45a87df1ad6a8bd768aa5ed38d6f03f14052b3d7 100644
--- a/drivers/gpu/drm/imx/dc/dc-crtc.c
+++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
@@ -293,6 +293,16 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	dc_crtc_queue_state_event(new_crtc_state);
 }
 
+static inline void __dc_crtc_disable_fg(struct drm_crtc *crtc)
+{
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+
+	enable_irq(dc_crtc->irq_dec_seqcomplete);
+	dc_fg_disable(dc_crtc->fg);
+	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
+	disable_irq(dc_crtc->irq_dec_seqcomplete);
+}
+
 static void
 dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
@@ -305,11 +315,7 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	if (!drm_dev_enter(crtc->dev, &idx))
 		goto out;
 
-	enable_irq(dc_crtc->irq_dec_seqcomplete);
-	dc_fg_disable(dc_crtc->fg);
-	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
-	disable_irq(dc_crtc->irq_dec_seqcomplete);
-
+	__dc_crtc_disable_fg(crtc);
 	dc_fg_disable_clock(dc_crtc->fg);
 
 	/* request pixel engine power-off as plane is off too */
@@ -337,6 +343,40 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 	spin_unlock_irq(&crtc->dev->event_lock);
 }
 
+void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
+{
+	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
+	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dc_crtc->de->dev);
+	if (ret < 0) {
+		dc_crtc_err(crtc, "failed to get DC display engine RPM: %d\n",
+			    ret);
+		return;
+	}
+
+	if (!dc_fg_wait_for_frame_index_moving(dc_crtc->fg)) {
+		dc_crtc_dbg(crtc, "FrameGen frame index isn't moving\n");
+		goto out;
+	}
+
+	dc_crtc_dbg(crtc, "disabling at boot\n");
+	__dc_crtc_disable_fg(crtc);
+	dc_fg_disable_clock(dc_crtc->fg);
+
+	if (!dc_drm->pe_clk_axi_disabled) {
+		clk_disable_unprepare(dc_drm->pe->clk_axi);
+		dc_drm->pe_clk_axi_disabled = true;
+	}
+
+out:
+	ret = pm_runtime_put(dc_crtc->de->dev);
+	if (ret < 0)
+		dc_crtc_err(crtc, "failed to put DC display engine RPM: %d\n",
+			    ret);
+}
+
 static bool dc_crtc_get_scanout_position(struct drm_crtc *crtc,
 					 bool in_vblank_irq,
 					 int *vpos, int *hpos,
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.c b/drivers/gpu/drm/imx/dc/dc-drv.c
index 04f021d2d6cfc93972aa8d9073be24d347152602..f93766b6bfbfae8510db05278d104820ca0719c4 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.c
+++ b/drivers/gpu/drm/imx/dc/dc-drv.c
@@ -17,6 +17,7 @@
 
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
@@ -96,6 +97,7 @@ static int dc_drm_bind(struct device *dev)
 	struct dc_priv *priv = dev_get_drvdata(dev);
 	struct dc_drm_device *dc_drm;
 	struct drm_device *drm;
+	struct drm_crtc *crtc;
 	int ret;
 
 	dc_drm = devm_drm_dev_alloc(dev, &dc_drm_driver, struct dc_drm_device,
@@ -118,6 +120,9 @@ static int dc_drm_bind(struct device *dev)
 	if (ret)
 		return ret;
 
+	drm_for_each_crtc(crtc, drm)
+		dc_crtc_disable_at_boot(crtc);
+
 	ret = drm_dev_register(drm, 0);
 	if (ret) {
 		dev_err(dev, "failed to register drm device: %d\n", ret);
diff --git a/drivers/gpu/drm/imx/dc/dc-drv.h b/drivers/gpu/drm/imx/dc/dc-drv.h
index eb61b8c7626933adc7688f046139e2167665dad1..68e99ba7cedbca1b8bdc0d8ced7a610a1056bfc7 100644
--- a/drivers/gpu/drm/imx/dc/dc-drv.h
+++ b/drivers/gpu/drm/imx/dc/dc-drv.h
@@ -50,6 +50,8 @@ struct dc_drm_device {
 	struct dc_pe *pe;
 	/** @tc: tcon list */
 	struct dc_tc *tc[DC_DISPLAYS];
+	/** @pe_clk_axi_disabled: disablement flag at boot */
+	bool pe_clk_axi_disabled;
 };
 
 struct dc_subdev_info {
@@ -96,6 +98,7 @@ static inline int dc_subdev_get_id(const struct dc_subdev_info *info,
 	return -EINVAL;
 }
 
+void dc_crtc_disable_at_boot(struct drm_crtc *crtc);
 void dc_de_post_bind(struct dc_drm_device *dc_drm);
 void dc_pe_post_bind(struct dc_drm_device *dc_drm);
 

-- 
2.34.1

