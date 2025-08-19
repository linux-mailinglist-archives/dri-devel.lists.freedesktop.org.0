Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21FDB2BEFE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 12:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDA210E078;
	Tue, 19 Aug 2025 10:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="WD+Lsdcc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021100.outbound.protection.outlook.com
 [40.107.130.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12AE10E078
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 10:33:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAtkbFxtNmJr9DkIAtqveq7OmBI5MBgyfe2TbUjQVPdNIJP3MJ+fJd6TBv+AGjTTcBkPfDf4OWH1bXHhXJVPViFuo40N/MBCxAfGsmP4rR1JXAwllfhmjVnirEsbHudLQGlhQSpk8CDoa4S/dn7ILiuhkjxb+XV3rcx7H5yZpEbqYIaU5fuXt6hQYQgWW3ob+ULcKFIUU2UMu185ykhZJ81hQRPBtym4k5YdpCTXBbpuNnjNVwAiPXx+DLV8nz00O5vatoLVHKfb1yaK8B9bUso/y0eo3rKwYmgKtv9ChsEMTSZ1PxAcp4Ry4Wk2AIhqElgVbOpd2HLzERhqiyTsUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfRXL3BZGRwJ5LsFXfDruERl7AbfHmmEspYGs0bqCYA=;
 b=jXBaNYMpqnh4chiQQzG65h8y7+7X1RE1zWN4pd6mbSN5zVQPnTsNEzXPy2Yh2I0YpmjTuFoZiIeB7IjP+fpLQuSzqek0baxRTfSWGaqd8OJx2QI0h79M63zzUPu0EYT39XNUhhWgCFGpcNbvNiFJqjlQLdLRcIejtl7cUChb68lzzUZGm5DVKJajh+7b7Sl8ZFfGJ8AWXyC+Pycxrre7yD18B7lJkGd0oEuGm8IPZ2hSZUMSoA/k4oUyqqsuWjqdrMUEcUY0SWt3kG7UmpfLeQ2I5mayqpKyXnTDYDMgF1FDN3XETKVjGLf4PpaaPd6S6ug6SU7Ghp9iipFX8LJN1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfRXL3BZGRwJ5LsFXfDruERl7AbfHmmEspYGs0bqCYA=;
 b=WD+LsdcceRP4zhMtlQ950psKRO64RZCm/jJeiuwuP1iWbPxM4R834vdJPpJkJ9BinRC1lNtruqk0yzdOAaXC9dnwBzCeeYUnrmR3wYg8wvg0GpkHZnEaM63tugP+/jODkp6XbUCg5awPf2A1DNKEs3lsatYS/SPPCed4bjudjZ+kFEg7RWP+m8mw6c0n2krR2G7MFhAc4+j81HMQXn61NymBRyrWNgpy3hzk0k+U1WTsd8+TSU8PdaSbwuW2qoI3FKJ9GE3gz0HBj4d5tqKIT65YraEhq97wi2+eKVXCRTL7thgEJ1c1JZbyXFjpEqBX8N57a0zZlAaCVD25MkQmVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by DB9PR04MB9675.eurprd04.prod.outlook.com (2603:10a6:10:307::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 10:33:06 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.9031.014; Tue, 19 Aug 2025
 10:33:06 +0000
Message-ID: <3887eb47-0e30-4adb-8698-e964fe4d22d9@gocontroll.com>
Date: Tue, 19 Aug 2025 12:33:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] backlight: add max25014atg backlight
To: Daniel Thompson <daniel@riscstar.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 MaudSpieringsmaudspierings@gocontroll.com
References: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
 <20250725-max25014-v1-2-0e8cce92078e@gocontroll.com>
 <aJn6_c79tvy_1dhU@aspen.lan>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <aJn6_c79tvy_1dhU@aspen.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0069.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::7) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|DB9PR04MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: ef429e1d-cc09-4993-98ec-08dddf0bc8eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S1RCaFdabkU0TWdzSnZCWHh4RFpYRFQzVGxRK1dTT1RRbTcvYXEyd3M2NGxk?=
 =?utf-8?B?YXBSRW9nN04xSndmTFVSZEozWFh1WHBsbDQ5MjU5RmdXeGV0YUpzNGdGRGtX?=
 =?utf-8?B?KzVJMG1VOUozTTFhVHZ3K1MwcHlvVVhoMU9ZS3lROS8xWUhrcHNubVpmbnc3?=
 =?utf-8?B?am1FVHcrSGxuaVpxZG40cFhQb0NiMzFvckpCbVorNEFMQWdZb2VQWFVGbWZP?=
 =?utf-8?B?aEQ2NW5UZ3EvSDF1eHVkOHlEVTFXYldkODVJQXV6TTNoOG11bTQxYVRybklS?=
 =?utf-8?B?dXd0VHdtaXJtOFpLYS96bVdBaUVQb3FHYmlyeVFlM1FLL2VJdmNkV3pBRzhP?=
 =?utf-8?B?NmZUMWZUWlI4ZHIydjA3azRDN2tySk1nTlNaVkVMb2s1anF2QUowQjhhN09G?=
 =?utf-8?B?Ym5RMWxmbjJPd1dmNnBycFJ3R1VzVE9OYU5aTVhtaHV0dlZFYlJ6SGRlSHcz?=
 =?utf-8?B?UUVFQk1oODhGN2J6K0RTR0JWd09WV21uMDVoN2hCeVlOQ1dObjFlZ2RFNC84?=
 =?utf-8?B?b2pQUnJVeTBDdkZQWVArWVZxVzEyZ1RGWldjS1lkMElBR0ZvV0dPUDhoNTFT?=
 =?utf-8?B?c1hMcWkyNUxrUUJUeG43K1RNZ3p1VlRQTW9yZW5XY0FldHdjNGNjc0U1ZDFU?=
 =?utf-8?B?QVY2Y1BsYXRjcldDYVR3bnFwTUR3amVXQU5zYzdxR1dtbHlmQ0hHZHlMenMy?=
 =?utf-8?B?ZUpCUkt1bWVwcGxzaDl3TUkwRnZuYUJ5aHNoSTRYWGN2cHRaaWdvMURQNGd4?=
 =?utf-8?B?NmtLcExUUWpIeXJSSjJCWENCUktsWmlFMzg5eTdIVkZSQm44bDZwdHZ0YUZn?=
 =?utf-8?B?Mk56N1E2dUtCbnN0d2JPaTFjUFlrek9EdlRxM3BmOUdmSXJ3MTdMQVF4SFRR?=
 =?utf-8?B?MUFrUkpQSjRHeUZFTVBTa2JjQUFpc0IwTHVwREZtV29uVzFRcS80ek9HUmlZ?=
 =?utf-8?B?SnZ5RnovS0lJZXFtV2NoYXF5OC82cEUwaFhkZ1VBakdtUitOUGJUdThyTXhD?=
 =?utf-8?B?ZnZNSkwwOU1XaTVYSER2bDNFbmJyMjNFODB3dXAwa2VHenVaYlNIOHl3WXky?=
 =?utf-8?B?UHBQTkIzU0dwMmI5QjYvWXorVlR3alJIckFLNGYvWXZmMVhZMDFlUGhhZ1hT?=
 =?utf-8?B?b2FQUkxLUjRRVDNmemlWQ3ZiUDd4SUNYcGNFYmIrdzE4L3l4YjY5ZEorbG5n?=
 =?utf-8?B?M0JkSGQ5cHBWQ0k2VTFibURwTlNBMEpjUE43TlNQcHRGQ0RVUXFqVVVhajBz?=
 =?utf-8?B?RTlBdUlENDJKak9PeGVKVDRnbWIvSzZOVFEvVXhBejg1RkdHak1mQUs0RE5M?=
 =?utf-8?B?ZHpOOFNtRUlxNTRMckhhM1B6bEpLdGZ4eit4dzlsVUFta2VjampuQnRJOUg2?=
 =?utf-8?B?RFZtSUZsNmVIb0xmV1NFdVMrdk54UTJjUmlKbThtVHFoSnlxME9rVzMrSHRk?=
 =?utf-8?B?eitDVlFVaURiRnQ2SnQ0bmdqdnBmZXpGVTBDNk9OKzVTNTdVaDRrcE5FaExh?=
 =?utf-8?B?ajRvSlF6c2t0OG5IT3MvblVZdm15b0J0WW5LaThQYk8yWVR2UVNPamFYcm5u?=
 =?utf-8?B?N1FyTUtDc3VWUXNYV1RMYWEvM1V0dEFrNk5IVDY5am1sbExwa2dLR1VPTFhr?=
 =?utf-8?B?dWpkOUJYanNONUtibkF4ZVhxVlJuazAxOTdvcjlCcXJNcWJwT21CKzZiYVQw?=
 =?utf-8?B?NW9veHhBL2dTZTJnQnpydkFLekJ0LzNCUmRVTlhla2FZR2lMOC9zSklnMTFB?=
 =?utf-8?B?bVhRSWxZL0I5aGVLdjFIOE15cEhxU3BWdEM2MlM5ZERGc2sra0lKZjRGSUdo?=
 =?utf-8?B?a0tpZk5XekJOUTJ1Q0thL0NGdEtOODc0dDY4anQyY1g5R1J0VVhQM2JZZlJo?=
 =?utf-8?B?N2cwYTNWN1Z3bWg4N1Izb1hINWlEcG53ZFZFQ3RLNkhpUlU3cCtMcFduVmp6?=
 =?utf-8?Q?4Q3Q16E4G/0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7630.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnM4QTNhSVNGNUFtRWN5a1pCWDloTzNpNis3R25DdnNFQVM0OUZXY1llbDFQ?=
 =?utf-8?B?NkhHdTUwQVFzRU1BWkdZZHJyZVpLWVR6bnh6VXo3SUtLb3J5ekZ4M3d4dFZZ?=
 =?utf-8?B?K2FKUEhQODV4S29LOTV5SkhkSDZQU0xsUlY0SVJEajQ3N1ZJZXE2VThDejFW?=
 =?utf-8?B?eVZzcUdaRmZHcUZxcm5hTVBZbGFkL1dkcXk1VkU5d3cwbjdRa0oyalVFdWJ1?=
 =?utf-8?B?dC84SGJwVlVRSURuMFRBajFBbWl1cWRMN2pFcHZQSlJuQTBrRWNUV0Y3RTRG?=
 =?utf-8?B?RDhWcHgwUGxucGpKZVhnZC9IUkx0bEgzMEtZUE5pRnhBTWJRa2hvTXozby9E?=
 =?utf-8?B?SFJLSWhXeVBtOXdkRzU2c2t2R3hxWUpGWkRKKzZ3cFFJMVp1bUFETzRpZGhR?=
 =?utf-8?B?TWkrUDZPR2xyUHBXYmpJNDlQQ2gxQU1LeTNwdjE1OXZ1TXFBeXRjZ3JIZlFI?=
 =?utf-8?B?aTU0c09nQjdsdkVvL0NJdVNGaUNYVkFEYllUZXJ2VjdPTkRiWFlkREFpV2h3?=
 =?utf-8?B?UC9kektDbXBuZkttc245QjJqbHF4QW9nQmV5R2orY05sTnc0WVQ0dGU2N2tD?=
 =?utf-8?B?TFhZMjdKcHVxNkRUa1lTT2x0Y25jMXhMaUVGUGNNVkIySTlSUElLcU93U0ZC?=
 =?utf-8?B?bWY4RThsaGVCRHk1TVM2aDRZVkt4R2NTYk5PemN6am8ybFdOYzBVTmFVNjBa?=
 =?utf-8?B?L2xnZ2FFbXRGN0pkNDZsVk5RVm10alFUSm9ubGJIaGRrSUlQekJ1QkZORUMx?=
 =?utf-8?B?NXF1anNocmt4R3RmTHR4S2I0TXY3TVpYeStCVG5Mb0Z5YXI3SkNnVk5FVWR6?=
 =?utf-8?B?WjF1aWw4R296aCtJREpTTjBJSTNydTJFWHJDVHR0ZGNQUHhlb250MDdldVlZ?=
 =?utf-8?B?YnRTTXhhT3JRczZ4MHRva2N4dE5oWHBnaFBsa091enR5MG5sL0NzMHJESFRE?=
 =?utf-8?B?dkZuWk5MU1lHUXJDYVMrRVZ5cjhNaHN5MnNLUVBqcmR3SmY0WVRYUVVFY2xI?=
 =?utf-8?B?VkxJUjBOeGRvMEtOeitERlBxUXZTZWk4MFFJZ0dVSUZtbVBvMGl4RW9yWHI0?=
 =?utf-8?B?WVdSM05iZzY5ajAvQVV2SklTQ1U1UEUyaFM4OVM4MGdHR1JmRHRpZnBYcm5m?=
 =?utf-8?B?MXgzOVNMcFo5SkFjUVp0cVBXR2J0b1J5WlJ5OXdiMzBReFRhZ292cC9iRDZ2?=
 =?utf-8?B?YStsSkpyakgvQWJhdEpVTVNWUjdUMVA1N0NHaEtGWWVXMWFkVUhmdlFJTmJt?=
 =?utf-8?B?ZCtKekVCWHNRU3Fkbm5jb2lpeVNqbTVDa0RoMkNWaVRBVDJhaUozWmh3b2xP?=
 =?utf-8?B?d2Q0SGEzanJlNm8rbE1MbFREZGVYQ0NjeWI2Rmk5NThMNUFBdnNSdmp1QXdo?=
 =?utf-8?B?d3VWKys4bXRCQ1U2aWpiWlJ5Nmxvb0c5V0hBbTAvbytONUV1VDNBL05OVkFE?=
 =?utf-8?B?VUQwY1R4WEUzTXh2K0pyK1JlbWJOcGw2amp5TWorZVpEdFFTeUU3amxpWGs2?=
 =?utf-8?B?OEIrK1FUT0pscGM2K3VYVTVaR3BqZm1meDBsVzRaVjQzWlE1UE5mWllqKzNN?=
 =?utf-8?B?anVUaTdUUStnd2JpdWl3NGJmUlFvOVJkY0RKRmM1K25hcnRISHJkaWhwRzB6?=
 =?utf-8?B?TzVidWo0a2RCRXRMK0tITTE4b1dtTlVzelVQZ2VzMXI1dmllMGJ2K2x5VGhx?=
 =?utf-8?B?blc0cW9HVTBrQWlFalp4WS9Ib1V0K2wzSUZPZjV1R0Z1UnV0L2JUTVQxZzZ1?=
 =?utf-8?B?czhVUlZUTzhLYi83NU42VkFqa1lyc1NyamVhZEJpUmFtVEJ5SUVqVTEvempX?=
 =?utf-8?B?Y1BhZXdMNDVkaXNRTU81L3VNUWFGMkkyMXFsald5bVc5R2wzT1BUd3pnVFVO?=
 =?utf-8?B?YnJHVkJST1Iwb3ZLZ2VlWk01cC9TYm5sRDJaaTNma216L1l1eDR3MHY4Z3lU?=
 =?utf-8?B?bnBVa0F5aGRKVU53SitGdWw0NDlSeDU1MXJXU3RzYSt0cXRQbm01QkFLVzFa?=
 =?utf-8?B?MlNtKzNxTlJCS0QyNFovYTRuNGE4aFRyZXhEYkx4MC9mNjF3dzdmQnozT2g3?=
 =?utf-8?B?R0Q3emMxUWpHeHJmUVovUWZCMVU2MVY0Zm5DRWxaanBXYTRPR3hRSnIrRTV1?=
 =?utf-8?B?M3ZKeUxRL1RucnR0NGlORFdpM2ljempibUlYbTlESW5za2NGWUdBUnlOREN2?=
 =?utf-8?B?cUx5RE4rbURic1BYdDVNZVV0WmQ5Q1l3bXhjZ1FLV2JPRnlJN2krK0lZbGo1?=
 =?utf-8?B?U0Z1eDZQZU8vRC84L1RxSWNTQnNBPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef429e1d-cc09-4993-98ec-08dddf0bc8eb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 10:33:06.6508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSzOC1jTGkPLM1/SCyTXQujMzfH871YjJaRTZPEJY/INbBB0VP1YUE0DxXk06AvfDNw33ZW0ys7u78Ei80zAAKeIgQ2v53UL5nKRJv7dgyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9675
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

Hi Daniel,

Thank you very much for your review, for some reason it ended in my spam 
box, so I only saw it just now.

On 8/11/25 16:15, Daniel Thompson wrote:
> On Fri, Jul 25, 2025 at 01:09:24PM +0200, Maud Spierings via B4 Relay wrote:
>> From: Maud Spierings <maudspierings@gocontroll.com>
>>
>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>> with intgrated boost controller.
>>
>> Signed-off-by: Maud Spierings maudspierings@gocontroll.com
>> ---
>>   MAINTAINERS                            |   2 +
>>   drivers/video/backlight/Kconfig        |   7 +
>>   drivers/video/backlight/Makefile       |   1 +
>>   drivers/video/backlight/max25014.c     | 449 +++++++++++++++++++++++++++++++++
>>   include/linux/platform_data/max25014.h |  24 ++
> 
> Who else included this header file? Can the code here simply be included
> in the C file?

That was my instinct too, I was following a clearly incorrect pattern 
from another driver, merged the fields from that struct into the main 
max25014 struct.

> 
>> diff --git a/drivers/video/backlight/max25014.c b/drivers/video/backlight/max25014.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..371b6017953ae5955f4dfef921980dfdedd65d85
>> --- /dev/null
>> +++ b/drivers/video/backlight/max25014.c
>> @@ -0,0 +1,449 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Backlight driver for Maxim MAX25014
>> + *
>> + * Copyright (C) 2025 GOcontroll B.V.
>> + * Author: Maud Spierings <maudspierings@gocontroll.com>
>> + */
>> +
>> +#include <linux/backlight.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/i2c.h>
>> +#include <linux/platform_data/max25014.h>
>> +#include <linux/regmap.h>
>> +#include <linux/slab.h>
>> +
>> +#define MAX25014_ISET_DEFAULT_100 11U
>> +#define MAX_BRIGHTNESS (100U)
>> +#define MIN_BRIGHTNESS (0U)
>> +#define TON_MAX (130720U) /* @153Hz */
>> +#define TON_STEP (1307U) /* @153Hz */
>> +#define TON_MIN (0U)
>> +
>> +#define MAX25014_DEV_ID         (0x00U)
>> +#define MAX25014_REV_ID         (0x01U)
>> +#define MAX25014_ISET           (0x02U)
>> +#define MAX25014_IMODE          (0x03U)
>> +#define MAX25014_TON1H          (0x04U)
>> +#define MAX25014_TON1L          (0x05U)
>> +#define MAX25014_TON2H          (0x06U)
>> +#define MAX25014_TON2L          (0x07U)
>> +#define MAX25014_TON3H          (0x08U)
>> +#define MAX25014_TON3L          (0x09U)
>> +#define MAX25014_TON4H          (0x0AU)
>> +#define MAX25014_TON4L          (0x0BU)
>> +#define MAX25014_TON_1_4_LSB    (0x0CU)
>> +#define MAX25014_SETTING        (0x12U)
>> +#define MAX25014_DISABLE        (0x13U)
>> +#define MAX25014_BSTMON         (0x14U)
>> +#define MAX25014_IOUT1          (0x15U)
>> +#define MAX25014_IOUT2          (0x16U)
>> +#define MAX25014_IOUT3          (0x17U)
>> +#define MAX25014_IOUT4          (0x18U)
>> +#define MAX25014_OPEN           (0x1BU)
>> +#define MAX25014_SHORT_GND      (0x1CU)
>> +#define MAX25014_SHORT_LED      (0x1DU)
>> +#define MAX25014_MASK           (0x1EU)
>> +#define MAX25014_DIAG           (0x1FU)
> 
> Forcing all these constants to be unsigned is unusual. Is it really
> needed?

Removed all the U's

> 
>> +#define MAX25014_IMODE_HDIM     BIT(2)
>> +#define MAX25014_ISET_ENABLE    BIT(5)
>> +#define MAX25014_ISET_PSEN      BIT(4)
>> +#define MAX25014_DIAG_HW_RST    BIT(2)
>> +#define MAX25014_SETTING_FPWM   GENMASK(6, 4)
>> +
>> +struct max25014;
> 
> This is redundant. Remove.

Thats an interesting leftover, removed.

>> +
>> +struct max25014 {
>> +	const char *chipname;
> 
> Why keep this value around? It is only used during the probe.
> 
>> +	struct i2c_client *client;
>> +	struct backlight_device *bl;
>> +	struct device *dev;
> 
> It is necessary to cache this, is it just a copy of client->dev)?

yep completely unnecessary, removed.

> 
>> +	struct regmap *regmap;
>> +	struct max25014_platform_data *pdata;
>> +	struct gpio_desc *enable;
>> +	struct regulator *vin; /* regulator for boost converter Vin rail */
>> +};
>> +
>> +static const struct regmap_config max25014_regmap_config = {
>> +	.reg_bits = 8,
>> +	.val_bits = 8,
>> +	.max_register = MAX25014_DIAG,
>> +};
>> +
>> +/**
>> + * @brief get the bit mask for the DISABLE register.
>> + *
>> + * @param strings the led string configuration array.
>> + * @return uint8_t bits to set in the register.
>> + */
>> +static uint8_t strings_mask(struct max25014 *maxim)
>> +{
>> +	uint8_t res, i;
>> +
>> +	for (i = 0; i < 4; i++) {
>> +		if (maxim->pdata->strings[i] == 0)
>> +			res |= 1 << i;
>> +	}
>> +	return res;
> 
> Could this converison have happened during DT parsing?

inlined it, changed the strings field in to strings_mask and only store 
the mask it calculates.

>> +}
>> +
>> +/**
>> + * @brief control the brightness with i2c registers
>> + *
>> + * @param regmap trivial
>> + * @param brt brightness
>> + * @return int
>> + */
>> +static int max25014_register_control(struct regmap *regmap, uint32_t brt)
>> +{
>> +	uint32_t reg = TON_STEP * brt;
>> +	int ret;
>> +	/*
>> +	 * 18 bit number lowest, 2 bits in first register,
>> +	 * next lowest 8 in the L register, next 8 in the H register
>> +	 * Seemingly setting the strength of only one string controls all of
>> +	 * them, individual settings don't affect the outcome.
>> +	 */
>> +
>> +	ret = regmap_write(regmap, MAX25014_TON_1_4_LSB, reg & 0b00000011);
>> +	if (ret != 0)
>> +		return ret;
>> +	ret = regmap_write(regmap, MAX25014_TON1L, (reg >> 2) & 0b11111111);
>> +	if (ret != 0)
>> +		return ret;
>> +	return regmap_write(regmap, MAX25014_TON1H, (reg >> 10) & 0b11111111);
>> +}
>> +
>> +static int max25014_check_errors(struct max25014 *maxim)
>> +{
>> +	uint8_t i;
>> +	int ret;
>> +	uint32_t val;
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_OPEN, &val);
>> +	if (ret != 0)
>> +		return ret;
>> +	if (val > 0) {
>> +		dev_err(maxim->dev, "Open led strings detected on:\n");
>> +		for (i = 0; i < 4; i++) {
>> +			if (val & 1 << i)
>> +				dev_err(maxim->dev, "string %d\n", i + 1);
>> +		}
>> +		return -EIO;
>> +	}
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
>> +	if (ret != 0)
>> +		return ret;
>> +	if (val > 0) {
>> +		dev_err(maxim->dev, "Short to ground detected on:\n");
>> +		for (i = 0; i < 4; i++) {
>> +			if (val & 1 << i)
>> +				dev_err(maxim->dev, "string %d\n", i + 1);
>> +		}
>> +		return -EIO;
>> +	}
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_SHORT_GND, &val);
>> +	if (ret != 0)
>> +		return ret;
>> +	if (val > 0) {
>> +		dev_err(maxim->dev, "Shorted led detected on:\n");
>> +		for (i = 0; i < 4; i++) {
>> +			if (val & 1 << i)
>> +				dev_err(maxim->dev, "string %d\n", i + 1);
>> +		}
>> +		return -EIO;
>> +	}
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_DIAG, &val);
>> +	if (ret != 0)
>> +		return ret;
>> +	/*
>> +	 * The HW_RST bit always starts at 1 after power up.
>> +	 * It is reset on first read, does not indicate an error.
>> +	 */
>> +	if (val > 0 && val != MAX25014_DIAG_HW_RST) {
>> +		if (val & 0b1)
>> +			dev_err(maxim->dev, "Overtemperature shutdown\n");
>> +		if (val & 0b10)
>> +			dev_warn(maxim->dev,
>> +				 "Chip is getting too hot (>125C)\n");
>> +		if (val & 0b1000)
>> +			dev_err(maxim->dev, "Boost converter overvoltage\n");
>> +		if (val & 0b10000)
>> +			dev_err(maxim->dev, "Boost converter undervoltage\n");
>> +		if (val & 0b100000)
>> +			dev_err(maxim->dev, "IREF out of range\n");
>> +		return -EIO;
>> +	}
>> +	return 0;
>> +}
>> +
>> +/*
>> + * 1. disable unused strings
>> + * 2. set dim mode
>> + * 3. set initial brightness
>> + * 4. set setting register
>> + * 5. enable the backlight
>> + */
>> +static int max25014_configure(struct max25014 *maxim)
>> +{
>> +	int ret;
>> +	uint32_t val;
>> +
>> +	ret = regmap_write(maxim->regmap, MAX25014_DISABLE,
>> +			   strings_mask(maxim));
>> +	if (ret != 0)
>> +		return ret;
>> +
>> +	ret = regmap_write(maxim->regmap, MAX25014_IMODE, MAX25014_IMODE_HDIM);
>> +	if (ret != 0)
>> +		return ret;
>> +
>> +	max25014_register_control(maxim->regmap,
>> +				  maxim->pdata->initial_brightness);
>> +
>> +	ret = regmap_read(maxim->regmap, MAX25014_SETTING, &val);
>> +	if (ret != 0)
>> +		return ret;
>> +
>> +	ret = regmap_write(
>> +		maxim->regmap, MAX25014_SETTING,
>> +		val & ~MAX25014_SETTING_FPWM);
>> +	if (ret != 0)
>> +		return ret;
>> +
>> +	ret = regmap_write(maxim->regmap, MAX25014_ISET,
>> +			   maxim->pdata->iset | MAX25014_ISET_ENABLE | MAX25014_ISET_PSEN);
>> +	return ret;
>> +}
>> +
>> +static int max25014_update_status(struct backlight_device *bl_dev)
>> +{
>> +	struct max25014 *maxim = bl_get_data(bl_dev);
>> +
>> +	if (bl_dev->props.state & BL_CORE_SUSPENDED)
>> +		bl_dev->props.brightness = 0;
>> +
>> +	return max25014_register_control(maxim->regmap, bl_dev->props.brightness);
>> +}
>> +
>> +static const struct backlight_ops max25014_bl_ops = {
>> +	.options = BL_CORE_SUSPENDRESUME,
>> +	.update_status = max25014_update_status,
>> +};
>> +
>> +static int max25014_backlight_register(struct max25014 *maxim)
>> +{
>> +	struct backlight_device *bl;
>> +	struct backlight_properties props;
>> +	struct max25014_platform_data *pdata = maxim->pdata;
>> +
>> +	memset(&props, 0, sizeof(props));
>> +	props.type = BACKLIGHT_PLATFORM;
>> +	props.max_brightness = MAX_BRIGHTNESS;
>> +
>> +	if (pdata->initial_brightness > props.max_brightness)
>> +		pdata->initial_brightness = props.max_brightness;
> 
> Handle this during DT parsing.

It is already handled there, this is double, so dropped.

>> +
>> +	props.brightness = pdata->initial_brightness;
>> +
>> +	bl = devm_backlight_device_register(maxim->dev, maxim->chipname, maxim->dev,
>> +					    maxim, &max25014_bl_ops, &props);
>> +	if (IS_ERR(bl))
>> +		return PTR_ERR(bl);
>> +
>> +	maxim->bl = bl;
>> +
>> +	return 0;
>> +}
> 
> Can max25014_backlight_register() be moved into the probe function?
> There is no special control flow here so this function doesn't make the
> probe function any simpler.

Done.

>> +
>> +#ifdef CONFIG_OF
>> +static int max25014_parse_dt(struct max25014 *maxim)
>> +{
>> +	struct device *dev = maxim->dev;
>> +	struct device_node *node = dev->of_node;
>> +	struct max25014_platform_data *pdata;
>> +
>> +	int res;
>> +
>> +	if (!node) {
>> +		dev_err(dev, "no platform data\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>> +	if (!pdata)
>> +		return -ENOMEM;
>> +
>> +	res = of_property_count_u32_elems(node, "maxim,strings");
>> +	if (res == 4) {
>> +		of_property_read_u32_array(node, "maxim,strings", pdata->strings, 4);
>> +	} else {
>> +		dev_err(dev, "strings property not correctly defined\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	pdata->initial_brightness = 50U;
>> +	of_property_read_u32(node, "default-brightness", &pdata->initial_brightness);
>> +	pdata->iset = MAX25014_ISET_DEFAULT_100;
>> +	of_property_read_u32(node, "maxim,iset", &pdata->iset);
>> +
>> +	if (pdata->iset < 0 || pdata->iset > 15) {
>> +		dev_err(dev,
>> +			"Invalid iset, should be a value from 0-15, entered was %d\n",
>> +			pdata->iset);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (pdata->initial_brightness < 0 || pdata->initial_brightness > 100) {
>> +		dev_err(dev,
>> +			"Invalid initial brightness, should be a value from 0-100, entered was %d\n",
>> +			pdata->initial_brightness);
>> +		return -EINVAL;
>> +	}
>> +
>> +	maxim->pdata = pdata;
>> +
>> +	return 0;
>> +}
>> +#else
>> +static int max25014_parse_dt(struct max25014 *maxim)
>> +{
>> +	dev_err(maxim->dev,
>> +		"CONFIG_OF not configured, unable to parse devicetree");
>> +	return -EINVAL;
>> +}
> 
> What is the point of this method? New drivers shouldn't support platform
> data so CONFIG_OF is required for this driver to work at all.

I think it is me following a bad pattern again, dropped the ifdef.

>> +#endif
>> +
>> +static int max25014_probe(struct i2c_client *cl)
>> ...

Kind regards,
Maud

