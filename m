Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246A3AAD765
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 09:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5132610E044;
	Wed,  7 May 2025 07:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ZCRQgrbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013014.outbound.protection.outlook.com [52.101.67.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4017C10E044
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 07:18:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oV1itgU0u8z+wP7tacYM7NaAIq4Xy6+49xbomeF9+aSMo0ILkB6ml9bYD5A8cvGvRXvNYgTAbRBe6gk0UREgDDZJaflwqKDt9/IQiyWB/9yFckVxXglpJgaMUJc6R4hd5qqRTtUYIV0XSRk9+6d7Uywon8NmmhLWwpjHIJm1QyTWt6/xpI8DCakOGghQQtxbijkPW+P5lCrCe9pXaqw4Fe67KzbpnTxCjQUj5oNRPC3pM5eiEY7LxVG/WJTVaDB0vbNzq/F7M5MSbqzVFOSXcbhgPuLdMRMhOAVSJfUkPJ8Veb3KxRerOb46FHVVx38C+ZZI5dOTOFinolJ+El3wCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCVO6AAj65a6sdwjJh75X/buxXimkj7zOwSvxcpxA28=;
 b=v8odstdublsMJKzMDBLGHh+SI5ncdAMyj/lyL6ZuHn6GwW8bAfwixcY/nqEV1nElAq41+oNeUXjNhl/EfQjwI5BRsRszTQf3f+3dUApxB2D5n4uU0w93Rjy8vhDkmdaoUyiZRSpnHl8q+v11rOxf59Rxw+yFev1hGrZqSYira2wjVHFMkHWNGK8F+YmxDWdjv8c6U8CbbcxR4jXfiEDlqYDHCRC3FXICAFzqapP/7p+qB1JdyqyR1pVQGEh+VgnmXFRtSid2oDegTbF68+ppaM/aatoCtPTAoe4PilWCe0Qp++GGE0Whu51R3YgGrapwttTpangFkv9yTI/tBYECkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCVO6AAj65a6sdwjJh75X/buxXimkj7zOwSvxcpxA28=;
 b=ZCRQgrbTLhvPfBUPb37bgAvlCl/obnZ/G6VhS/I25vsiUTvkZDTseuQLozmGweWu47KIyTgmD7gJhclLwNRIJ3Y5qR3VJRYvm342ejzhG9udWA1k9c7qBy0RSVCRzPC+X2OC4i3JaWOEdFDkExnhzXJRFymtbqTUCfLwjnYdpYSMhdBrr3VboVr9lSO0g7Ncj5ZqHYoleT/kyxAcyfR0PezD+4NMAUBJs8GnLoSb7FRmyJDrTfIlId8l3g+8Z+2UmPHQmrOBE1cGDQwQXwJmO7kymWww7BJbv/kVoN/ZsZRq0lciiKIeP3JqYu3sN9NQElVwdXwJK2nkipkqH8xYuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9439.eurprd04.prod.outlook.com (2603:10a6:102:2ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 7 May
 2025 07:18:24 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 07:18:24 +0000
Message-ID: <9253e2cb-8e39-4b3b-adb2-48a9693a6e5f@nxp.com>
Date: Wed, 7 May 2025 15:19:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/19] Add Freescale i.MX8qxp Display Controller support
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 Frank.Li@nxp.com, lumag@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 u.kleine-koenig@baylibre.com, francesco@dolcini.it,
 dmitry.baryshkov@linaro.org
References: <20250414035028.1561475-1-victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250414035028.1561475-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9439:EE_
X-MS-Office365-Filtering-Correlation-Id: ed29efe0-05e8-4be0-6bd5-08dd8d375a7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWs5SjFNUitZT1J5N2dLbmQrTjVDU2tnVVQ1QmhiWHhDRUlhajljdndPSGlz?=
 =?utf-8?B?RkdLVTk3bEVnQzhhVVhBd0Fhb3c0SlZqTllzMDQzY1V4eWZkeUNkK1Y3d3ZI?=
 =?utf-8?B?RjF5eUdCWEFwN25zM1ZzY0RPb2JtRzJ5TzV5emE0UHpMektBM0JRWC94Vjln?=
 =?utf-8?B?c3gyakpUVUgwYzZHVFdMWmwxS0hndXcxNyt6R0JmbFFUWDB4WkdKajF4cnhT?=
 =?utf-8?B?N0htdm5lQ0xvanhaWGtpaWNySytUSkhaa2xpTnptUVkwWmNPbUFPMHRLN2sz?=
 =?utf-8?B?Qlg0cnIvY2dnaW1BRDZUZHJNeUNnc1BFaTV5ajN6TlpTWGdmUnlPVnFEZDgy?=
 =?utf-8?B?M2NOMDVNeWRrck05aFVPaGJyNDErMUFEdEs1VFg4bnlXYlZ6anRyTnoxNjZU?=
 =?utf-8?B?bFJXeXhyK2J3N25vNnlLK3pQTjlHTTVqYi94WWhuUUpUS054dHlINnAzc1BS?=
 =?utf-8?B?aFVNc1B4NU00dW12MFV0eUZDdDh5OEd4bFRmZCsvL2hWUUplR2crSmNaUDQz?=
 =?utf-8?B?MGFUcXBFd3d6NkhVM3JGVFkzWERaODdaVFZ3dnE5WmlBWjQ2eEtodmN0dWdT?=
 =?utf-8?B?aHU1cC9qNTB0bGhhZEJXZDBLRVhvTHk3YmpKQ25ZeW5HaEZCOFJQODdZMkJX?=
 =?utf-8?B?Zlk2M3lNZFBPbFE5R2NQQUJOVFlYOTUvNmFET3F2R0VsbjE2NTE2L3RTWXZn?=
 =?utf-8?B?bk5iWHdFMksrWHR3dnJiMTh3azAzZTNMYmRSUDJud3pQYzFLZEpKRHZzNktF?=
 =?utf-8?B?TWdnTHpiZVcwYVlMdGYxb245NUVwbld0SXNGdzdjR3JHak9UWUNjMHJlRWZX?=
 =?utf-8?B?TVpnRTlRZUZxYzRITUlHZFp6WXNKeFJ3QXM1dit5MU1xbk1mNWU0ZG9rZ2xj?=
 =?utf-8?B?SUxDNXE1MUVaWFl3MmphdlJLYXNPQUttbXQxeCtLcjhBZzV1eXlwN3hKcnNX?=
 =?utf-8?B?S2g5aHg0STFwMTM0dHVPR2VMNzhRS2hYa3dVMFBtejNTaWFsdlY4STVvdkRI?=
 =?utf-8?B?cWcrUFR6WHJ3bmdRblA5WitrNnZacFpxMFpSa1pDWGgyeGptRk5JaitWSHlE?=
 =?utf-8?B?ZEJwZ1pWL3BXU0dnVTV4RWdLK3NTUVlUUDBtMHFYVDJra0VFa0dhSTVpeXVN?=
 =?utf-8?B?a045dW9nZndGWks2TjdqNE1Nem1yaCtNaTZEcDQzdy9SMEJuYmE2WUpoaUhN?=
 =?utf-8?B?TXZTZVBFbmVUU3NOSUZHODBjcUplL2tySS9DTHlKLzdVc2FtRi9lMjhwbWl5?=
 =?utf-8?B?a2dKaC9SWkFKOVJSdzZ6TXVGaW1TTlFXS0hjQ0tFRStMQmE3bTFnSUdpSkFE?=
 =?utf-8?B?VFJqUHRMZkRCMUwxYlpHRW1odis4TjU3cDl6dEFPclZla0RkUm5RQVN6WEJB?=
 =?utf-8?B?K29QSVVLNmZCRWZxNW9ua0E3Sm1kdEJpdHRGZU9qL2gzbnd5NjlkejFjdnNY?=
 =?utf-8?B?dlBJTGRJVldEcENBNTJQYVFyNHEzVG9KOU1sbDlxa0lqV0YySm1iWnpsK0E4?=
 =?utf-8?B?RHhrY1JaNk1kZ0dra0c2QnBaYjMySkpFclFCZ1pCVEg4WUtFdmQ3dUY3S1FD?=
 =?utf-8?B?V2FKSUpqaGRNVkdVeTFPTk9WbDV1UEdaN0d0VVk3QTBXbHAwbXZRRXMxMXN0?=
 =?utf-8?B?aVN6ZmpvYUxZWGtWblVjZFZpeGhqalduUnZDeU5KZU1kWGhGWW10ZEltV3dG?=
 =?utf-8?B?UXZpdFlMQldlUU43bCtEWE1YYmlUazcrdDJwakZoNnJJUFdxbWJ6bEVGTG5P?=
 =?utf-8?B?MDhXY2FiZmZyNjNmc21JQ0dTaFl5ZHhhdXBQc2o0eXlxRUx1UlYzbE9LMEg3?=
 =?utf-8?Q?8aVw1q/1T7WOjegdvyCVG6JcDbz+SKewPvhIE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q05ud013RzhSR3hDZzVZOEFaOVdoTms5cmZ1OGFkbjhONHY4UE5LSUpPL0I4?=
 =?utf-8?B?QUxBbFhxSnlKdTYyM011ZjA0R3IzalpnK2pPV0MvL25BbVhOUWxPNDFiSXRo?=
 =?utf-8?B?aFRsTjFqY1VCTzdjQ0xDQjgwV2JvcDcrWGt2MHhSeFNtZTcwMzV4cWxaUkd5?=
 =?utf-8?B?bHk3eTlHSy91RjJkbElhcSt5c1o3Y2ttdHM0TVR3YW9VUEJYeXU1VmJqUFZm?=
 =?utf-8?B?SU1TZ0dLWmZURFQyVlJLQTlrWkMvZ3o4QWpyK2dwbWhlTEkvM0dnWGtEVW5C?=
 =?utf-8?B?Q08ydG1PbkxRd3BSZytaL1lCdkpobnExeGhrckdYSGsvczBSNjJTU2ppQVhs?=
 =?utf-8?B?WUxkVTRhbVZkazBZTytiYnlkbVdqbGY3ZXRPdXExV2ptdWtTWS80dStXM29U?=
 =?utf-8?B?U0FldDhJSjhmODVWcGFIOVRTQWhXRjFGTnZOK2hNUEp1UWtwZTNHRGptNUt4?=
 =?utf-8?B?Q0FVeVptd2pEbFFiTlc3bm93RGp4UTRHdmR1aytiWk5GM1hTblZWWnNib0pu?=
 =?utf-8?B?cDdldEZINVp5MHlqM3paVmhQVCtTYnJwdDRSbG9wVTZ3YU5QdnBDMnBQejND?=
 =?utf-8?B?M2J3UC9YSmRvOUpteGppOUc0THliSW40ekNleU5EYzFhQklVY3ZvQmhrekth?=
 =?utf-8?B?bzA3TlBDTGM5YisxRGF1SzBZQnVTMlh1UklnR0VaUTZWaTR1U2lvNnVzS1BV?=
 =?utf-8?B?aTFRb2I0NXFQbU1OUnAwYU41bnMzeXhEdXZIREtTdVZ1Y3BIaHBpSUw4ekZB?=
 =?utf-8?B?aVlXWkRnTEc3cWZLZXZiYWtRaFVCVXk3ejFiNFE5eEEvM0lEZzNLQ2d1NkFU?=
 =?utf-8?B?S0FxTzgzTHhyZ2UrQ3FwYXF3eHo5Z1RyU0J5ZVkzSWp4SnhKZFp3NDFoYUFZ?=
 =?utf-8?B?VEswVE54dC84OXZvbW0zaVdxYUJYRlVqcUN0UmhvZWIyNWpmRUhVMmlYZlZN?=
 =?utf-8?B?NHpxVlo2a3JGNFk1T0tmd01QYUhnTWtPWElDYmszL0FDMTBaMjU5c2dPS1Ns?=
 =?utf-8?B?eEQ3cGtORVFmNHNCdGlMWHUySHpzc0l6eE9WUUo3QldmeW00aXhiOU9Cck1U?=
 =?utf-8?B?RkEyOTlzTU81U01wQXBHLzFGQUJHWUh5VlczM2hpU0V0RVJkNTA5VC9nQzND?=
 =?utf-8?B?WTFUKzZVR1creXpOUFRtam9SbXZIVkhnSXJwd2IzK0xsSnliaEFpdGhmWVd3?=
 =?utf-8?B?MDRUbXZ3SjNTZ3cvNEJEUU5KYkdJSFdWRXRYY2dncEp3WWIwU2hPdElVY0Mw?=
 =?utf-8?B?S0l0NXl2RXNhNHhKVFlwWDI4NU5CYS9iUUgybWwxTFV2c3Nzay9zMlQwcTJS?=
 =?utf-8?B?bFU3d0g0T2dDbkNQSDI2N1hCMWFocWlrRjdaTHNnZm5lZ2pRZFo5eWJKYnRU?=
 =?utf-8?B?YzQwR28wUjdpOG5Qc1hLbFhlMGVhQUU0TitBWGxmbjl1czRMNE42SFBRMVZi?=
 =?utf-8?B?dkdPSXhvRThwSFloZVBqOCtvY3NBaUVGUExqSENoT1REeUp3NVRSbEtwbjJ5?=
 =?utf-8?B?NGdwYVhPVTBrOWM1bmZLSlJBb1N6dHcvb3lHcTRKaHVvWXQ5UkRtbW05TGo3?=
 =?utf-8?B?OG04cW52LzBvZmgvZTVBRTFWNnlRekJ4RkxVMy9rKzcrWW8vRnMzWEFPaURy?=
 =?utf-8?B?NlEzYU5CNVNXT1Y2VnE1MCs0TWdHcjZ6MVNydVZaMXZmaFNBYU9zV1o3VFJr?=
 =?utf-8?B?ajZRM1pWdDlIWVRMNUo3MnUzZkVpNmNacVhnOW9WaG4zRkFvMzZmSEVZRUZS?=
 =?utf-8?B?NVZRR2puMldSVG1IOW5lNWkxT1dES2hyb0dqUVQzbXVBemwzT3JwbmZ0RU1n?=
 =?utf-8?B?WFQ0OGRUL0swSjVxL1hNdmpLdXhNUmdEeHY0SXFJSEJRL1gxZy9ad2ZGQXUr?=
 =?utf-8?B?a0x5WFg5Z2J5b3BHeEJaZVllVlViZThCUmFjdWNtQW1sanZLcTBob3VMQzRM?=
 =?utf-8?B?TEV1ZnYyK281RnZCWjdvUGpqOGltZG9hR0I5WlZIOGJZUnMwUUtWMFNLNys5?=
 =?utf-8?B?amRzQXVvcGE1aXhtMkdDL01XTjNoOFhobjJ6ZlhqWWQ0azgrbXdqcmM1ZlRz?=
 =?utf-8?B?M2RwSkVXMG4wUkZHM3ovRUpiTDViaXFXVnZiaFlNOVRBYlVKcGdrWnJwVjd5?=
 =?utf-8?Q?DT18Legx7IWJZBGI7vSv1eTzI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed29efe0-05e8-4be0-6bd5-08dd8d375a7e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 07:18:23.9359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qekOQT4km29m4Xhmw7tDMDHB+Y+eH9NluHcp/HS9iYH19sUQRwHA1J20z4ds1NZZh0NkCbVNfaDT1B3Bm9ZC7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9439
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

Hi Maxime, drm/misc maintainers,

On 04/14/2025, Liu Ying wrote:
> Hi,
> 
> This patch series aims to add Freescale i.MX8qxp Display Controller support.
> 
> The controller is comprised of three main components that include a blit
> engine for 2D graphics accelerations, display controller for display output
> processing, as well as a command sequencer.
> 
> Previous patch series attempts to do that can be found at:
> https://patchwork.freedesktop.org/series/84524/
> 
> This series addresses Maxime's comments on the previous one:
> a. Split the display controller into multiple internal devices.
>    1) List display engine, pixel engine, interrupt controller and more as the
>       controller's child devices.
>    2) List display engine and pixel engine's processing units as their child
>       devices.
> 
> b. Add minimal feature support.
>    Only support two display pipelines with primary planes with XR24 fb,
>    backed by two fetchunits.  No fetchunit dynamic allocation logic(to be done
>    when necessary).
> 
> c. Use drm_dev_{enter, exit}().
> 
> Since this series changes a lot comparing to the previous one, I choose to
> send it with a new patch series, not a new version.
> 
> To follow up i.MX8qxp TRM, I changed the controller name to "Display Controller"
> instead of the previous "DPU".  "DPU" is only mentioned in the SoC block
> diagram and represents the whole display subsystem which includes the display
> controller and prefech engines, etc.
> 
> With an additional patch[1] for simple-pm-bus.c, this series facilitates
> testing a LVDS panel on i.MX8qxp MEK.
> 
> Please do NOT merge patch 14-19.  They are only used to facilitate testing
> the LVDS panel.
> 
> Maxime, patch 1-13 have already been reviewed by maintainers, can you please
> consider to land patch 1-13?

Gentle ping. Do you think it's ok to land patch 1-13?
I may try to push them to drm/misc if needed.

> 
> [1] https://lkml.org/lkml/2023/1/25/120
> 
> v9:
> * Rebase on v6.15-rc1.
> * Collect Rob's R-b tag on patch 6.
> * Collect Dmitry's R-b tags on patch 9&10.
> * Collect Maxime's R-b tag on patch 13.
> 
> v8:
> * Drop instance numbers from display controller internal devices' compatible
>   strings. This means switching back to patches for DT bindings in v4. So, add
>   Rob's previous R-b tags back on patches for DT bindings. (Dmitry)
> * Get display controller internal device instance numbers through register
>   start addresses of the devices in patch 9&10, instead of compatible strings.
>   (Dmitry)
> * s/shdld/shdload/ for IRQs in patch 9/10/12. (Dmitry)
> * Drop dc_plane_check_no_off_screen() from patch 12. (Dmitry)
> * Drop id member from struct dc_de from patch 9. (Dmitry)
> * Add dc_{de,pe}_post_bind() to patch 9&10, to avoid dependency on the
>   component helper's way of implementing component binding order. (Dmitry)
> * Add dev_warn() to dc_lb_pec_dynamic_{prim,sec}_sel() in patch 10. (Dmitry)
> * Drop lb_links[] and dc_fetchunit_all_fracs[] arrays from patch 10. (Dmitry)
> * Collect Dmitry's R-b tags on patch 11&12.
> 
> v7:
> * Drop using DT aliases for display controller internal devices and add
>   instance numbers to display controller internal devices' compatible
>   strings. Drop Rob's R-b tags on some DT bindings patches. (Rob)
> * Drop using typeof in macros and explicitly define variable types in patch 12.
>   (Dmitry)
> * Add a comment for disable_irq_nosync() to explain why _nosync in patch 12.
>   (Dmitry)
> * Inline dc_crtc_check_clock() in patch 12. (Dmitry)
> * Use global drm_dc->pe in patch 12. (Dmitry)
> * Drop dc_crtc_disable_at_unbind() from KMS driver in patch 12. (Dmitry)
> * Add kernel doc for struct dc_{crtc,drm_device,plane} in patch 9/10/12.
>   (Dmitry)
> * Define common IRQ handlers separately for each IRQs in patch 12. (Dmitry)
> * Rebase this series upon next-20241220, so drop date entry from drm_driver
>   and correctly include drm/clients/drm_client_setup.h.
> * Fix regmap_config definitions for display controller internal device drivers
>   in patch 9/10/11 by correcting name field, correcting read ranges and setting
>   max_register field.
> * Get instance numbers from device data(compatible strings) instead of OF
>   aliases in display controller internal device drivers in patch 9/10/11.
> * Collect Maxime's R-b tags on interrupt controller driver and display drivers.
> * Trivial tweaks.
> 
> v6:
> * Fix build warning by expanding sizeof(fu->name) from 13 to 21 in patch 10.
>   (kernel test robot)
> 
> v5:
> * Document display controller device's and some display controller internal
>   devices' aliases in DT bindings. Hence, drop collected R-b tags from some
>   patches for DT bindings. (Maxime)
> * Replace .remove_new with .remove in all drivers. (Uwe)
> * Select REGMAP and REGMAP_MMIO options in patch 9.
> * Fix patch 9 & 10's commit message to state that display engine driver and
>   pixel engine driver are component drivers instead of master/aggregate drivers.
> 
> v4:
> * Collect Rob's R-b tags on DT binding patches(patch 1-5).
> * Replace "fsl,iram" property with standard "sram" property in
>   fsl,imx8qxp-dc-command-sequencer.yaml in patch 6. (Rob)
> * Use regmap to define register map for all registers. (Dmitry)
> * Use regmap APIs to access registers. (Dmitry)
> * Inline some small functions. (Dmitry)
> * Move dc_fg_displaymode(), dc_fg_panic_displaymode() and dc_lb_blendcontrol()
>   function calls from KMS routine to initialization stage. (Dmitry)
> * Drop dc-crtc.h and dc-plane.h header files and move relevant defines to
>   appropriate .h header files or .c source files. (Dmitry)
> * Drop futile "else" clause from dc_crtc_common_irq_handler(). (Dmitry)
> * Drop dc_drm->pe_rpm_count. (Dmitry)
> * Drop DC_{CRTCS,ENCODERS,PRIMARYS} macros and only use DC_DISPLAYS. (Dmitry)
> * Drop drmm_kcalloc() function call to allocate an array for storing IRQs.
>   Instead, put it in struct dc_crtc.  (Dmitry)
> * Call devm_request_irq() to request IRQs, instead of using drmm action.
>   (Dmitry)
> * Call devm_drm_of_get_bridge() to find the next bridge. (Dmitry)
> * Select DRM_CLIENT_SELECTION due to rebase.
> * Select the missing DRM_DISPLAY_HELPER and DRM_BRIDGE_CONNECTOR.
> * Use devm_kzalloc() to drmm_kzalloc() to allocate dc_* data strutures.
> * Drop unnecessary private struct dc_*_priv from DC internal device drivers.
> * Set suppress_bind_attrs driver flag to true in DC internal device drivers
>   to avoid unnecessary sys interfaces to bind/unbind the drivers.
> * Make some fetch unit operations be aware of fractional fetch unit index(0-7).
> * Take DC interrupt controller driver as a standalone driver instead of a
>   component driver.
> * Replace drmm_kcalloc() with devm_kcalloc() to allocate an array for
>   struct dc_ic_entry.
> * Call platform_get_irq() from DC interrupt controller driver to make sure
>   parent interrupt controller driver is probed first.
> * Use DRM_FBDEV_DMA_DRIVER_OPS due to rebase.
> * Replace drm_fbdev_dma_setup() with drm_client_setup_with_fourcc() due to
>   rebase.
> * Replace drmm_add_action_or_reset() with devm_add_action_or_reset() to
>   register dc_drm_component_unbind_all() action.
> * Request interrupts in dc_crtc_post_init() after encoder initialization to
>   make sure next bridge is found first.
> * Trivial tweaks.
> 
> v3:
> * Collect Rob's R-b tag on the patch for adding fsl,imx8qxp-dc-intc.yaml.
> * Combine fsl,imx8qxp-dc-fetchunit-common.yaml,
>   fsl,imx8qxp-dc-fetchlayer.yaml and fsl,imx8qxp-dc-fetchwarp.yaml
>   into 1 schema doc fsl,imx8qxp-dc-fetchunit.yaml. (Rob)
> * Document all processing units, command sequencer, axi performance counter
>   and blit engine. (Rob)
> 
> v2:
> * Drop fsl,dc-*-id DT properties from fsl,imx8qxp-dc*.yaml. (Krzysztof)
> * Move port property from fsl,imx8qxp-dc-display-engine.yaml to
>   fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
> * Drop unneeded "|" from fsl,imx8qxp-dc-intc.yaml. (Krzysztof)
> * Use generic pmu pattern property in fsl,imx8qxp-dc.yaml. (Krzysztof)
> * Fix register range size in fsl,imx8qxp-dc*.yaml.
> * Use OF alias id to get instance id from display driver.
> * Find next bridge from TCon's port from display driver.
> * Drop drm/drm_module.h include from dc-drv.c.
> * Improve file list in MAINTAINERS. (Frank)
> * Add entire i.MX8qxp display controller device tree for review. (Krzysztof)
> * Add MIPI/LVDS subsystems device tree and a DT overlay for imx8qxp
>   MEK to test a LVDS panel as an example. (Francesco)
> 
> Liu Ying (19):
>   dt-bindings: display: imx: Add i.MX8qxp Display Controller processing
>     units
>   dt-bindings: display: imx: Add i.MX8qxp Display Controller blit engine
>   dt-bindings: display: imx: Add i.MX8qxp Display Controller display
>     engine
>   dt-bindings: display: imx: Add i.MX8qxp Display Controller pixel
>     engine
>   dt-bindings: display: imx: Add i.MX8qxp Display Controller AXI
>     performance counter
>   dt-bindings: display: imx: Add i.MX8qxp Display Controller command
>     sequencer
>   dt-bindings: interrupt-controller: Add i.MX8qxp Display Controller
>     interrupt controller
>   dt-bindings: display: imx: Add i.MX8qxp Display Controller
>   drm/imx: Add i.MX8qxp Display Controller display engine
>   drm/imx: Add i.MX8qxp Display Controller pixel engine
>   drm/imx: Add i.MX8qxp Display Controller interrupt controller
>   drm/imx: Add i.MX8qxp Display Controller KMS
>   MAINTAINERS: Add maintainer for i.MX8qxp Display Controller
>   dt-bindings: phy: mixel, mipi-dsi-phy: Allow assigned-clock*
>     properties
>   dt-bindings: firmware: imx: Add SCU controlled display pixel link
>     nodes
>   arm64: dts: imx8qxp: Add display controller subsystem
>   arm64: dts: imx8qxp: Add MIPI-LVDS combo subsystems
>   arm64: dts: imx8qxp-mek: Enable display controller
>   arm64: dts: imx8qxp-mek: Add MX8-DLVDS-LCD1 display module support
> 
>  ...sl,imx8qxp-dc-axi-performance-counter.yaml |  57 ++
>  .../imx/fsl,imx8qxp-dc-blit-engine.yaml       | 204 +++++++
>  .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  41 ++
>  .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  44 ++
>  .../imx/fsl,imx8qxp-dc-command-sequencer.yaml |  67 +++
>  .../imx/fsl,imx8qxp-dc-constframe.yaml        |  44 ++
>  .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 152 +++++
>  .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  45 ++
>  .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  72 +++
>  .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 141 +++++
>  .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  43 ++
>  .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  64 ++
>  .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  32 +
>  .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  39 ++
>  .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  44 ++
>  .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 250 ++++++++
>  .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  43 ++
>  .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 ++
>  .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  83 +++
>  .../display/imx/fsl,imx8qxp-dc-signature.yaml |  53 ++
>  .../display/imx/fsl,imx8qxp-dc-store.yaml     |  96 +++
>  .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  45 ++
>  .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 236 ++++++++
>  .../devicetree/bindings/firmware/fsl,scu.yaml |  20 +
>  .../fsl,imx8qxp-dc-intc.yaml                  | 318 ++++++++++
>  .../bindings/phy/mixel,mipi-dsi-phy.yaml      |   5 -
>  MAINTAINERS                                   |   8 +
>  arch/arm64/boot/dts/freescale/Makefile        |   2 +
>  .../arm64/boot/dts/freescale/imx8-ss-dc0.dtsi | 408 +++++++++++++
>  .../imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso | 183 ++++++
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  34 ++
>  .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     | 240 ++++++++
>  .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 437 ++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |   7 +-
>  drivers/gpu/drm/imx/Kconfig                   |   1 +
>  drivers/gpu/drm/imx/Makefile                  |   1 +
>  drivers/gpu/drm/imx/dc/Kconfig                |  13 +
>  drivers/gpu/drm/imx/dc/Makefile               |   7 +
>  drivers/gpu/drm/imx/dc/dc-cf.c                | 172 ++++++
>  drivers/gpu/drm/imx/dc/dc-crtc.c              | 555 ++++++++++++++++++
>  drivers/gpu/drm/imx/dc/dc-de.c                | 177 ++++++
>  drivers/gpu/drm/imx/dc/dc-de.h                |  59 ++
>  drivers/gpu/drm/imx/dc/dc-drv.c               | 293 +++++++++
>  drivers/gpu/drm/imx/dc/dc-drv.h               | 102 ++++
>  drivers/gpu/drm/imx/dc/dc-ed.c                | 288 +++++++++
>  drivers/gpu/drm/imx/dc/dc-fg.c                | 376 ++++++++++++
>  drivers/gpu/drm/imx/dc/dc-fl.c                | 185 ++++++
>  drivers/gpu/drm/imx/dc/dc-fu.c                | 258 ++++++++
>  drivers/gpu/drm/imx/dc/dc-fu.h                | 129 ++++
>  drivers/gpu/drm/imx/dc/dc-fw.c                | 222 +++++++
>  drivers/gpu/drm/imx/dc/dc-ic.c                | 282 +++++++++
>  drivers/gpu/drm/imx/dc/dc-kms.c               | 143 +++++
>  drivers/gpu/drm/imx/dc/dc-kms.h               | 131 +++++
>  drivers/gpu/drm/imx/dc/dc-lb.c                | 325 ++++++++++
>  drivers/gpu/drm/imx/dc/dc-pe.c                | 158 +++++
>  drivers/gpu/drm/imx/dc/dc-pe.h                | 101 ++++
>  drivers/gpu/drm/imx/dc/dc-plane.c             | 224 +++++++
>  drivers/gpu/drm/imx/dc/dc-tc.c                | 141 +++++
>  58 files changed, 7928 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-cf.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-ed.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fl.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fw.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-ic.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-lb.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.h
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
> 

-- 
Regards,
Liu Ying
