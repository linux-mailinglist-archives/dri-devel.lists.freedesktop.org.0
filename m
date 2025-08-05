Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366F7B1B086
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 10:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B90510E258;
	Tue,  5 Aug 2025 08:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="J+Qg/3GD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013031.outbound.protection.outlook.com [52.101.72.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E2610E258
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 08:54:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phJ5S0PkjyoJArs2BYlOxs4/swYj+oLP5P+PtwumBBLIfDXoN7UZ40Y2GWwDMp+PcYyMK9+mkhNCH3+30uWvAvS+Xri9zK/BSfH9wtF5z3Ogk91t/z/yf13mOvTHhXV4bhrw/q7l594MOQjgdkEY1RMe1zOWcnVe4BMJ74oWVANityBnptO3zCZxZRXN4UQoJag+/Kn1jNvUvfBYKhN8DKDFgv+oo98toJvdIbter8sEKYzEeuR+Dshwv8Px2J1MBuM0wiR6evjLEwHtt91ydMCJhzB8E0W3FgKoa2txGbcVfkWBqMPkgttK4NHnTcugJzST8lXoRy+hPJYsNbUszA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+z+5YrBY0UnUmkDytOmFesreyiTNr4q+IhS+A+kLcew=;
 b=efPFrmaJJmsQto24E72NMgEP/zCfZKX2HNLMmqoJEN59LbJ2UtuE7yb9TGmCpDQUpwECk0Yx2PuCc6kPLySUEI3sULv+Yk97vH5zP6hKLeLpJogerAewDkwrn1mOHh65bX9pXPVTVlnTgbuG7hjTvDMjyP43s8KLb8b1BKMQ3CNId8hDAbocOEjFQIw8nhd2c8XCSUCrmj9mr2+TFfZ0zS/qCAN46gRudJCJCaSm/xmvei2GwxNeOAaHZMKv8/Sv7lFDArRFUmUXdCAODjK6t9uMnItOBz+wuSGwBJfANUZRoP8ntbxGx3tcocKBCOOG4tmT8V25XLqlnqnPZdYu9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+z+5YrBY0UnUmkDytOmFesreyiTNr4q+IhS+A+kLcew=;
 b=J+Qg/3GDTfm5V/S/uwtaL05o0UZCOERn8bpnUGpVZNv13vyRmpRLtbgT/PgLSzsvav8GsIRxutL29n/7SG7fXNp+WN5Oai2stf2wmd/4KFyZ2844LLv4s5v5Z0sJLnimKaTN6XhbiUeMaGkB4TkkN+o2b0mIyjOTEK2q8huTOi2m4Hx366idZo3A5W+IEH+tIqIuH0crn6Dfo5IvhjNvUMx+rO4AeMVhuztlu5f0daj8dpt4mkVYJbe2cc4q+ZQ8eAcB92r6W4BczlIImwKPVvm3ieZWKUoFWVUFSV7dms0zqde/vllow8u9oCLMloDbnMF6XNI18GbeasvWrEa2xA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10845.eurprd04.prod.outlook.com (2603:10a6:150:20d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Tue, 5 Aug
 2025 08:54:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 08:54:40 +0000
Message-ID: <fa455148-a071-4433-8c9c-26add3872604@nxp.com>
Date: Tue, 5 Aug 2025 16:56:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org, cristian.ciocaltea@collabora.com,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-6-shengjiu.wang@nxp.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250804104722.601440-6-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0193.apcprd04.prod.outlook.com
 (2603:1096:4:14::31) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10845:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ba7f88f-d471-4198-e6ba-08ddd3fdb6ee
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|19092799006|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1puRVVwdFJHRjNhQ0J2Rmw3L1EyRXRVeDFJcUdVbld3RHFxUm1iUHJCMjBh?=
 =?utf-8?B?aFhWWVFVN2Z4WktUdGlQOFJqZ0ZVaWJSd2Vrc1BQaFdEaTVCVkV4d0ZSNGV0?=
 =?utf-8?B?RXRZQ3RwbElzYmQxdUsvUmJ4SGVvMm1vb1ZlVDcxSlhyZVR6Uyt0eUZlMWlF?=
 =?utf-8?B?bWNHSUpsWGx4aXhVL3BCWS9ZQ0NJQ1lkeTVJb04vdDF1TlNKKzJSNzd5Zjl1?=
 =?utf-8?B?K25VekFjaVpxVUZQbmxGRWVjRnJQcHI4VEdrZ2hFQld4WjdGMFYvdGYvb0Jt?=
 =?utf-8?B?OGdoUDd6OWw2amRpTE45TGF0TWpFVUg2cDVhMW85aUVDcE9WbHFoam1TTzcx?=
 =?utf-8?B?RG95a05qR1VJYTVrMEQxcWRvNGpLMGx3cTRlRUo2dEJPc1lkeXNoSEY2UXI4?=
 =?utf-8?B?MTk4UE5xNHBCTDJ3MklLUENkYzI3akJwTkFSeGJXY3VGRmM4dG9QZTgrRFNU?=
 =?utf-8?B?UmVTSUZuZExCUFBncnBxQ2loYkFKNXE2OEp1U2Rqd1JPbjRGZkg5RTZGalN3?=
 =?utf-8?B?SXFwYUZ1MVF6NGxsMHZqbjJrZzdJVWRqQWFxdFNUR2FET2lWZUcyUmpDQUYw?=
 =?utf-8?B?bmpYajU5NjBNTG0vdUNqWEJoYkkzdWdGc3BwbG1DQjc1STBtYzl3aUJZaHdn?=
 =?utf-8?B?NUh1TGVnZy9OWExDVEhtdDVQR0NqOFgySFlmR1BEKzQyQW9sUDVWVGM5WlJI?=
 =?utf-8?B?cUs0N3JQdnYyM0diQXpwLzMrdkNPUERlT2lGOVo3UVY4clMyYkJZTDZlaFBZ?=
 =?utf-8?B?OEpabEdERzJqbGhUWjlhZjB3QjFrd2tsalEvTW5QTVgxY2N1bmJ3ZHZZUWhV?=
 =?utf-8?B?V054SDR5SWN1T1IrNXovdXVUcWFiSkhReGEzVDcwWHR5Rkk4b3ZXdXBPT2Q1?=
 =?utf-8?B?T1B2czVpRUZvcTBTTG1KVHBaS1ZNOEliSFZtUkFTbFhhWDl6S2Q1S3hCNHhE?=
 =?utf-8?B?cmU4NXRKOFNHTFQ4dk93VTVKK0tQSE9XalRjRXV6YktWMFFwaGpqYzNaSDRM?=
 =?utf-8?B?aXhxa1g5UXpaMFpBalRpU2Y1RndxeUJSZWhOYXd4S1JRSk82Y0RybTcxc3dV?=
 =?utf-8?B?NjZqL2Q4MnQ3ZVhnazR1UTBSVFQzZGZMYUFIbUNmc25pejhSdlA1TlhudEtt?=
 =?utf-8?B?d1hjMlY4U2I3QlIxYzNXcEFYUXA4Si82TitNVmd6ZFVza0VHajYyaFdvRGh5?=
 =?utf-8?B?bUhuQzZKQ2w5YnpDbVVhNkxZdmd4bkVsUVNUZmlKc210QTlYM0ZUMUQ3emtV?=
 =?utf-8?B?eWxza3FqZmlmZi9BdU02ODk2enBoUHYxWlVVZTVEQUJUYktYa2k0YjgyQ090?=
 =?utf-8?B?MWZ3Q2RhNE5MYnkxc3lNQlZ1SG1pd0FleW5NUlZEeWVqWVlxeENMRCtQL2k2?=
 =?utf-8?B?ZFF1NjVnRXdQSmpJclgzaWJoVHdwQjBYc3hOeEIxOWp5WXF3bUlCb2MveDFR?=
 =?utf-8?B?dnZmWmRGclc5MkVmOHRYUkRvbnJBRGhmSEw1bHBpSTNucG90amNrMGIrc1Rx?=
 =?utf-8?B?Q2xsVkJqa3NtMmVJTk0rLzZvdVdvWHoyTDVxcXM4eURqVnN2L3kxK1drWEQy?=
 =?utf-8?B?ZDFXTHJ2aVdWRVdGNHltWGhzTXNnMlJQTk9IWWpXRXpSTG9ZeElmNk9vay8x?=
 =?utf-8?B?YmdPUFJCVCtsY0M5N2h2TkNaay92U3lQTWp5bVBta0ZCRDBCWVVoSUdRWVRZ?=
 =?utf-8?B?ajUzOFJNcGUwNTVWVS9rTWpSMGZGeUQ3SlBBREZUSUlkeUtYejZhRHh5ajM5?=
 =?utf-8?B?MUhpSUc3SUhYL3RQcGlHdGlGQ001OW5ESGw5TE9qY3NYd0ZiOTU1SHh5d2Fv?=
 =?utf-8?B?MXNKV3lQb2xUYXRZQlI2VnVIQ2ZtVzc5VG50WkZ0S0ZGRC9tTlptMUpPTlFE?=
 =?utf-8?B?RC9qeVBabVFOcVgxMlFWNVg0MVd4YUtCMk1uaVFNeXEyMW0yZm11cHBzSy9T?=
 =?utf-8?B?ZWZuYnd1TXVHbGwwWjBMWEwvS3ZkdmJNd1crVjQzZmhTZnVMbjZlcGRxaVRz?=
 =?utf-8?B?eGkyS2szbTdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDVjYk0vSWhpSnNmTnlzbkVIYTZ0TFg2SVZoYWtSZnE4ajJFazFlNFB0cWt3?=
 =?utf-8?B?RkZoSUVEbVhZSU80MENPOHJTKzRJdkZxcnl3MkpEbnNWV2NxRFExaDM1QjJ6?=
 =?utf-8?B?THpqUTJlVXFSSWpyZ1o0TDZydEJuaW16b0pyN2dhN1RQQ1FiTU9xcVU5bmxQ?=
 =?utf-8?B?UndJdUlDSEE4WTZZRWQwQWJMd3NzK3JmSGRaSVhzMXI3NXRhd0F3OUNWcWM5?=
 =?utf-8?B?WTlVdmJYR0FlSStDRkpDMGxZM09BYW95czdSVk5iYmVFd0dtd2N1WFd5b3ZC?=
 =?utf-8?B?V1FyanM2L1BhdGdmbmNDSGduVTlZUnNWTllWNkM1elFoeW9pditpUE9tZlZ0?=
 =?utf-8?B?eDd3Ykg4bjZsTWxqVjJOdndCV0FpbEhHc2U5dkFNbDZrREdvT1JZbnFwNGM0?=
 =?utf-8?B?bEM4UU5zclp4c2hXaUlUZkhMb28vU1F6T25GUCtMNTVVL3NWOXh0RWcwMklU?=
 =?utf-8?B?RTZhZDJPUjd2NTdwTFlrZE9LbDlhTU1PRHlKSDhoSTBUMHlVUzBmUW8rcHdI?=
 =?utf-8?B?bHdjb1pxaHhON0FBdHl2eStyd0g5TGJlcHpTU3ZuSEVGbzZXWUZPR2hiQzhw?=
 =?utf-8?B?WWNBRlkxVXlRTUNFdmtzbzhoWUlSMGl6K25rWnhMVmxQNDd5ckFvVUkwaExH?=
 =?utf-8?B?cmNVLzVQUldqZjdNRlZTQklSWjJ2dnFRNW5EOTNBRndCU0Zva096VEVsMUNo?=
 =?utf-8?B?KzBrODNFRlljRnMzc2ZDU1dUVTF3U29EMW1IcUpDeGErdkluQ2Frd2dSY3Mw?=
 =?utf-8?B?bzFqVllOcTNoRzBOQ1dLTTA4aExtZmNaL3Vabjd2UHQ5cUxPTjl0a1E0MTFI?=
 =?utf-8?B?RFE3K3lpK0tqb3pMckppUlh4TVJKRklqbGRzTGNYWUllT0lFU2lBUk5FUkEx?=
 =?utf-8?B?endWeGsrQ0NqZmFxdUFRdEkrYlI4U2NXMTFUUDl0ODFBenViaXpxRXJmK0Ur?=
 =?utf-8?B?R3poTzl0SU9uMFV1S2xsUVp1VFRWSWtNNmIzTkJYK0VlZ0xSQ1lubVhmL1di?=
 =?utf-8?B?Z0dKSlNjU2tZbUJYUlhXUTdDQkRETlNSMEhveUV5TlA0VDk4NGR1UXNqWVpj?=
 =?utf-8?B?MGs4UkhFNUF3Y0hqVVRLeHU4RU1HMWVGV080MUY5dkx4N3pqMnp4YVp5dm4y?=
 =?utf-8?B?NFJpY2IzQnRVcWozWGJjRjFyRE8yUjJveVg2aU1YNkxJSmMwUktjYnkzODc4?=
 =?utf-8?B?ME9veGh0dUc4VEw5Uk9qdHRhUmplSUluaGZIMllYZ3hiZ05rTTZuZjdMWEc2?=
 =?utf-8?B?YmFuT3NuTTdvYzdjbmRrUjJ1aktudUV4dWxLaFBWeExGbUN3Z3lILzhlSEdM?=
 =?utf-8?B?cStoUXQyaUt2Mk5yOERxR05oblRsVTExZFJsQmpwSGNZVVlLV2hNTnFBZ2Zw?=
 =?utf-8?B?WEVxKzhyRGFzUnIyRXBGNXhURjB0UjJDUHZDdmM2eW1pMFNQZ0N1TEJiWm94?=
 =?utf-8?B?MjFvckIyU3FWTXJzNG54dGNzYlArMEZHRUpKZFJzUS93L0F1NlYwd1g4NkE4?=
 =?utf-8?B?WHdJQW5FdWs2ZkdKQ1hlS0hlaXBxRmdycVV1T2l3cWkxOC9LcFNPT1daMndT?=
 =?utf-8?B?cFZKSzBlY1ZLa1RueldFVDJtSGJHTHFlbmhvam42dzB2OVVvZ3JHdC9zRlBi?=
 =?utf-8?B?bFZGR3p5cjVFZGFoUUZITUFqZnUzTmFTbDhIejFzNVhPSnNtZUtGWExTYUp4?=
 =?utf-8?B?Q0JYekExNVJxR0RXNHUvem85YjdZVUUrUXpaalpFMkZvdjMzb1ROazhJTCtJ?=
 =?utf-8?B?eVNTN0FqZXJuOHpzQmRPbU5rZzhPMmlFMFlKZW9iZjdQWktsd2pWTVJLdG9u?=
 =?utf-8?B?ejNRUWovdUx0SXAzWnh4cHFYY3h3K3FVQlB4eUcvU3RtdE9RbUVhckx2V1hX?=
 =?utf-8?B?YWNieHU2TlRubEQrTm1qZURqbEd0aG5LN2ZUdW8rdjFqMVgxY2FuVERSUVNB?=
 =?utf-8?B?Y3RJRjVEaUp0ZnJkaEVySi9ZcnF0eHM2U3JUTEdMMWxUYjhlazFJeGdHU2do?=
 =?utf-8?B?WFlPaVVwV2pYV3htZHhXNEdMT25yTjBMb2IxU2N0VXo0UXZYbW4yL2hGMjZY?=
 =?utf-8?B?VzFuanNaanpnYjZKaHRpaU5TTytab1dhYjBSd1A3d3hVY3laNDh4cGpueTVk?=
 =?utf-8?Q?kyt3Nxx94Fc4IWCHheuQBRKPZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba7f88f-d471-4198-e6ba-08ddd3fdb6ee
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 08:54:40.7910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+Cns20eBVb2PA7h9D0Tc6fiVS//x5WXJGpM4GwQwUS4Vlz0i3k2ROcFlg2KIZkiQ8M7GYNlOuBsnGMOv5Jyrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10845
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

On 08/04/2025, Shengjiu Wang wrote:
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
> 
> Data received from the audio subsystem can have an arbitrary component
> ordering. The HTX_PAI block has integrated muxing options to select which
> sections of the 32-bit input data word will be mapped to each IEC60958
> field. The HTX_PAI_FIELD_CTRL register contains mux selects to
> individually select P,C,U,V,Data, and Preamble.
> 
> Use component helper that imx8mp-hdmi-tx will be aggregate driver,

s/that/so that/

> imx8mp-hdmi-pai will be component driver, then imx8mp-hdmi-pai can use
> bind() ops to get the plat_data from imx8mp-hdmi-tx device.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig           |   8 +
>  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 205 +++++++++++++++++++
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c  |  55 +++++
>  include/drm/bridge/dw_hdmi.h                 |   6 +
>  5 files changed, 275 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 9a480c6abb85..6c1a8bc5d4a0 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -18,12 +18,20 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>  	depends on OF
>  	depends on COMMON_CLK
>  	select DRM_DW_HDMI
> +	imply DRM_IMX8MP_HDMI_PAI
>  	imply DRM_IMX8MP_HDMI_PVI
>  	imply PHY_FSL_SAMSUNG_HDMI_PHY
>  	help
>  	  Choose this to enable support for the internal HDMI encoder found
>  	  on the i.MX8MP SoC.
>  
> +config DRM_IMX8MP_HDMI_PAI
> +	tristate "Freescale i.MX8MP HDMI PAI bridge support"
> +	depends on OF

select REGMAP
select REGMAP_MMIO

> +	help
> +	  Choose this to enable support for the internal HDMI TX Parallel
> +	  Audio Interface found on the Freescale i.MX8MP SoC.
> +
>  config DRM_IMX8MP_HDMI_PVI
>  	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index dd5d48584806..8d01fda25451 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -1,6 +1,7 @@
>  obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
>  obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) += imx-legacy-bridge.o
>  obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi-tx.o
> +obj-$(CONFIG_DRM_IMX8MP_HDMI_PAI) += imx8mp-hdmi-pai.o
>  obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o
>  obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
>  obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> new file mode 100644
> index 000000000000..9002974073ca
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/component.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>

#include <linux/regmap.h>

> +#include <drm/bridge/dw_hdmi.h>
> +#include <sound/asoundef.h>
> +
> +#define HTX_PAI_CTRL			0x00
> +#define   ENABLE			BIT(0)
> +
> +#define HTX_PAI_CTRL_EXT		0x04
> +#define   WTMK_HIGH_MASK		GENMASK(31, 24)
> +#define   WTMK_LOW_MASK			GENMASK(23, 16)
> +#define   NUM_CH_MASK			GENMASK(10, 8)

Add NUM_CH(n) and use it when programming HTX_PAI_CTRL_EXT.
#define NUM_CH(n)			FIELD_PREP(NUM_CH_MASK, (n - 1))

> +#define   WTMK_HIGH(n)			FIELD_PREP(WTMK_HIGH_MASK, (n))
> +#define   WTMK_LOW(n)			FIELD_PREP(WTMK_LOW_MASK, (n))
> +
> +#define HTX_PAI_FIELD_CTRL		0x08
> +#define   B_FILT			BIT(31)
> +#define   PARITY_EN			BIT(30)
> +#define   END_SEL			BIT(29)

The above 3 bits are unused.  Drop.

> +#define   PRE_SEL			GENMASK(28, 24)
> +#define   D_SEL				GENMASK(23, 20)
> +#define   V_SEL				GENMASK(19, 15)
> +#define   U_SEL				GENMASK(14, 10)
> +#define   C_SEL				GENMASK(9, 5)
> +#define   P_SEL				GENMASK(4, 0)
> +
> +#define HTX_PAI_STAT			0x0c
> +#define HTX_PAI_IRQ_NOMASK		0x10
> +#define HTX_PAI_IRQ_MASKED		0x14
> +#define HTX_PAI_IRQ_MASK		0x18

The above 4 registers are not pratically used.  Drop.

> +
> +struct imx8mp_hdmi_pai {
> +	struct device	*dev;
> +	struct regmap	*regmap;
> +};
> +
> +static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
> +				   int width, int rate, int non_pcm,
> +				   int iec958)
> +{
> +	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
> +	struct imx8mp_hdmi_pai *hdmi_pai = (struct imx8mp_hdmi_pai *)pdata->priv_audio;

I don't think you need to convert type explicitly.  Same for the other
explicit conversions in this driver.

> +	int val;
> +
> +	/* PAI set control extended */
> +	val =  WTMK_HIGH(3) | WTMK_LOW(3);
> +	val |= FIELD_PREP(NUM_CH_MASK, channel - 1);
> +	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL_EXT, val);
> +
> +	/* IEC60958 format */
> +	if (iec958) {
> +		val = FIELD_PREP_CONST(P_SEL,
> +				       __bf_shf(IEC958_SUBFRAME_PARITY));
> +		val |= FIELD_PREP_CONST(C_SEL,
> +					__bf_shf(IEC958_SUBFRAME_CHANNEL_STATUS));
> +		val |= FIELD_PREP_CONST(U_SEL,
> +					__bf_shf(IEC958_SUBFRAME_USER_DATA));
> +		val |= FIELD_PREP_CONST(V_SEL,
> +					__bf_shf(IEC958_SUBFRAME_VALIDITY));
> +		val |= FIELD_PREP_CONST(D_SEL,
> +					__bf_shf(IEC958_SUBFRAME_SAMPLE_24_MASK));
> +		val |= FIELD_PREP_CONST(PRE_SEL,
> +					__bf_shf(IEC958_SUBFRAME_PREAMBLE_MASK));
> +	} else {
> +		/* PCM choose 24bit*/
> +		val = FIELD_PREP(D_SEL, width - 24);

Why 'width - 24'?  Can it be expressed by a helper or macro?

> +	}
> +
> +	regmap_write(hdmi_pai->regmap, HTX_PAI_FIELD_CTRL, val);
> +
> +	/* PAI start running */
> +	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, ENABLE);
> +}
> +
> +static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
> +{
> +	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
> +	struct imx8mp_hdmi_pai *hdmi_pai = (struct imx8mp_hdmi_pai *)pdata->priv_audio;
> +
> +	/* Stop PAI */
> +	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
> +}
> +
> +static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct dw_hdmi_plat_data *plat_data = (struct dw_hdmi_plat_data *)data;
> +	struct imx8mp_hdmi_pai *hdmi_pai;
> +
> +	hdmi_pai = dev_get_drvdata(dev);
> +
> +	plat_data->enable_audio = imx8mp_hdmi_pai_enable;
> +	plat_data->disable_audio = imx8mp_hdmi_pai_disable;
> +	plat_data->priv_audio = hdmi_pai;
> +
> +	return 0;
> +}
> +
> +static void imx8mp_hdmi_pai_unbind(struct device *dev, struct device *master, void *data)
> +{
> +	struct dw_hdmi_plat_data *plat_data = (struct dw_hdmi_plat_data *)data;
> +
> +	plat_data->enable_audio = NULL;
> +	plat_data->disable_audio = NULL;
> +	plat_data->priv_audio = NULL;

Do you really need to set these ptrs to NULL?

> +}
> +
> +static const struct component_ops imx8mp_hdmi_pai_ops = {
> +	.bind   = imx8mp_hdmi_pai_bind,
> +	.unbind = imx8mp_hdmi_pai_unbind,
> +};
> +
> +static bool imx8mp_hdmi_pai_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case HTX_PAI_IRQ_NOMASK:
> +	case HTX_PAI_IRQ_MASKED:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static bool imx8mp_hdmi_pai_writeable_reg(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case HTX_PAI_CTRL:
> +	case HTX_PAI_CTRL_EXT:
> +	case HTX_PAI_FIELD_CTRL:
> +	case HTX_PAI_IRQ_NOMASK:
> +	case HTX_PAI_IRQ_MASKED:
> +	case HTX_PAI_IRQ_MASK:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const struct regmap_config imx8mp_hdmi_pai_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = HTX_PAI_IRQ_MASK,
> +	.volatile_reg = imx8mp_hdmi_pai_volatile_reg,
> +	.writeable_reg = imx8mp_hdmi_pai_writeable_reg,
> +};
> +
> +static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct imx8mp_hdmi_pai *hdmi_pai;
> +	struct resource *res;
> +	void __iomem *base;
> +
> +	hdmi_pai = devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
> +	if (!hdmi_pai)
> +		return -ENOMEM;
> +
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	hdmi_pai->dev = dev;
> +
> +	hdmi_pai->regmap = devm_regmap_init_mmio(dev, base, &imx8mp_hdmi_pai_regmap_config);

Now that DT binding says there is an APB clock, use devm_regmap_init_mmio_clk()
to ensure registers can be accessed with clock enabled even via debugfs.

> +	if (IS_ERR(hdmi_pai->regmap)) {
> +		dev_err(dev, "regmap init failed\n");
> +		return PTR_ERR(hdmi_pai->regmap);
> +	}
> +
> +	dev_set_drvdata(dev, hdmi_pai);
> +
> +	return component_add(dev, &imx8mp_hdmi_pai_ops);

Imagine that users could enable this driver without enabling imx8mp-hdmi-tx
driver, you may add the component in this probe() callback only and move all
the other stuff to bind() callback to avoid unnecessary things being done here.

> +}
> +
> +static void imx8mp_hdmi_pai_remove(struct platform_device *pdev)
> +{
> +	component_del(&pdev->dev, &imx8mp_hdmi_pai_ops);
> +}
> +
> +static const struct of_device_id imx8mp_hdmi_pai_of_table[] = {
> +	{ .compatible = "fsl,imx8mp-hdmi-pai" },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pai_of_table);
> +
> +static struct platform_driver imx8mp_hdmi_pai_platform_driver = {
> +	.probe		= imx8mp_hdmi_pai_probe,
> +	.remove		= imx8mp_hdmi_pai_remove,
> +	.driver		= {
> +		.name	= "imx8mp-hdmi-pai",
> +		.of_match_table = imx8mp_hdmi_pai_of_table,
> +	},
> +};
> +module_platform_driver(imx8mp_hdmi_pai_platform_driver);
> +
> +MODULE_DESCRIPTION("i.MX8MP HDMI PAI driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> index 1e7a789ec289..ee08084d2394 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> @@ -5,11 +5,13 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/component.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <drm/bridge/dw_hdmi.h>
>  #include <drm/drm_modes.h>
> +#include <drm/drm_of.h>
>  
>  struct imx8mp_hdmi {
>  	struct dw_hdmi_plat_data plat_data;
> @@ -79,11 +81,46 @@ static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_ops = {
>  	.update_hpd	= dw_hdmi_phy_update_hpd,
>  };
>  
> +static int imx8mp_dw_hdmi_bind(struct device *dev)
> +{
> +	struct dw_hdmi_plat_data *plat_data;
> +	struct imx8mp_hdmi *hdmi;
> +	int ret;
> +
> +	hdmi = dev_get_drvdata(dev);
> +	plat_data = &hdmi->plat_data;
> +
> +	ret = component_bind_all(dev, plat_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "component_bind_all failed!\n");

As component_bind_all() would bind imx8mp-hdmi-pai and hence set
{enable,disable}_audio callbacks, you need to call dw_hdmi_probe() after
component_bind_all() instead of too early in probe() callback.

> +
> +	return 0;
> +}
> +
> +static void imx8mp_dw_hdmi_unbind(struct device *dev)
> +{
> +	struct dw_hdmi_plat_data *plat_data;
> +	struct imx8mp_hdmi *hdmi;
> +
> +	hdmi = dev_get_drvdata(dev);
> +	plat_data = &hdmi->plat_data;
> +
> +	component_unbind_all(dev, plat_data);
> +}
> +
> +static const struct component_master_ops imx8mp_dw_hdmi_ops = {
> +	.bind   = imx8mp_dw_hdmi_bind,
> +	.unbind = imx8mp_dw_hdmi_unbind,
> +};
> +
>  static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct dw_hdmi_plat_data *plat_data;
> +	struct component_match *match;

As Alexander pointed out, this needs to be set to NULL.
See how other drivers which are component masters do.

> +	struct device_node *remote;
>  	struct imx8mp_hdmi *hdmi;
> +	int ret;
>  
>  	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
>  	if (!hdmi)
> @@ -108,6 +145,22 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, hdmi);
>  
> +	/* port@2 is for hdmi_pai device */
> +	remote = of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
> +	if (remote && of_device_is_available(remote)) {

Doesn't of_graph_get_remote_node() ensure that remote is avaiable?

> +		drm_of_component_match_add(dev, &match, component_compare_of, remote);
> +
> +		of_node_put(remote);
> +
> +		ret = component_master_add_with_match(dev, &imx8mp_dw_hdmi_ops, match);
> +		if (ret)
> +			dev_warn(dev, "Unable to register aggregate driver\n");
> +		/*
> +		 * This audio function is optional for avoid blocking display.
> +		 * So just print warning message and no error is returned.

No, since PAI node is available here, it has to be bound.  Yet you still need
to properly handle the case where PAI node is inavailable.

> +		 */
> +	}
> +
>  	return 0;
>  }
>  
> @@ -115,6 +168,8 @@ static void imx8mp_dw_hdmi_remove(struct platform_device *pdev)
>  {
>  	struct imx8mp_hdmi *hdmi = platform_get_drvdata(pdev);
>  
> +	component_master_del(&pdev->dev, &imx8mp_dw_hdmi_ops);
> +
>  	dw_hdmi_remove(hdmi->dw_hdmi);
>  }
>  
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 095cdd9b7424..336f062e1f9d 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -143,6 +143,12 @@ struct dw_hdmi_plat_data {
>  					   const struct drm_display_info *info,
>  					   const struct drm_display_mode *mode);
>  
> +	/*
> +	 * priv_audio is specially used for additional audio device to get
> +	 * driver data through this dw_hdmi_plat_data.
> +	 */
> +	void *priv_audio;
> +
>  	/* Platform-specific audio enable/disable (optional) */
>  	void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
>  			     int width, int rate, int non_pcm, int iec958);


-- 
Regards,
Liu Ying
