Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D289B52AFF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 10:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE83310EA3B;
	Thu, 11 Sep 2025 08:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="0D03UL2u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11023093.outbound.protection.outlook.com
 [52.101.83.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8A710EA3B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 08:00:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYFW3o+QO9kwYLdobABzNPfrXiXxx0wZ3BLyXlLZHM16AYiJNTwqM5dZ/4eBmFh4g58F0mOeLxVEYDicS/UJGYc4g/jVar8QVX1o00ao2RSQyIUKrkIAyCMLLT63sVzMnvy9IFjGaAjGjVSRFpBQMF7YFixmGrvHFPdq3mkmAeiFqqqodFGPSfZQhAt4x5nlUBYJVXD2meN8mXrMgdKvLdtbKPf4/cL9cUCqyxJ1BP1RCp0WdbjtZ7ZUa/tvmihAn7xPLs3ffaeBk3vQzOCRr8faOJsXhJB/5yz3v5GDMedMRDwW9nPyJWIOnhVT0VROPWtJ2hTuT/RaGwkUbIJ55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3uEXza7a6g5nkWzhF/1MVg3QUXAMCoLVdNgR57ki+g=;
 b=ik0Lruj+ZOIT64S3GU5et+duFu0ZGJbAlVX71RJky0Os0lMhsm1HYsEQhreSxAZGZMFzWs1wbqmW9HB0y/WRm1cXP/E+HSnA5BzUXkyPB3CopekUGF6rnTE2dYqI5mA3oW624HxZqPs2jKRObO7KVX+ZBkp3vg02XfMvA+YIzj1JUdtHWrC7fs/pmrrw7nlrg6xB8yBaTddm/Nh3iWPu0+wtH3cAYaZqSTqG+WshB7XG5GTQUYX8RIqlpHaItXb4Ghc5mZ64rjMo7KDIizJhxlTAgtzBVZLlhFepULFJfacchQtUH6JEBsOKY/Qhv92u1UEU9oVUK0xpkDrBktoCUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3uEXza7a6g5nkWzhF/1MVg3QUXAMCoLVdNgR57ki+g=;
 b=0D03UL2uiy54HX9jG57gMwwX9LX59O83ibX38pWr9MSZbCLTBAEf6Urd1Xx8Pwe+h0ga6XRqiUvVXlJT56aeI1G4A9cV8TkcJOf+y3uzEmgGFNij8LHy2TsmiC8zSq/BqrkrpcKfuCmZ8CUPtBJe3KTyLdS9ox68pXojnaQ9q8RPQ3h67pe/Rq0zeaKa/l2gKGbGjVL3r+fbWCb4MUT3nJrISGl4fpq6XNrh/4yrDr4GzooZzplpATeEoZ3rzl4nYdF6qvCoYaLbFZ9N6scYpyQOwV8GxdtxcC3GQQcBusfNwqzOsoM8Xakpt2Ye4owC+SzcrSZoHTZ9jd7D6ZwzZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by GV2PR04MB11835.eurprd04.prod.outlook.com (2603:10a6:150:2fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Thu, 11 Sep
 2025 08:00:49 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%6]) with mapi id 15.20.9115.015; Thu, 11 Sep 2025
 08:00:48 +0000
Message-ID: <66b609da-328a-4b33-93f8-ff5bb274c765@gocontroll.com>
Date: Thu, 11 Sep 2025 10:00:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] backlight: add max25014atg backlight
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250911-max25014-v3-0-d03f4eba375e@gocontroll.com>
 <20250911-max25014-v3-2-d03f4eba375e@gocontroll.com>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20250911-max25014-v3-2-d03f4eba375e@gocontroll.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0015.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::25) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|GV2PR04MB11835:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b50ad5-7f78-4d1c-ce9b-08ddf1095190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|10070799003|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eW1TbmVTcHovTHVTbHhCU0NRWUI1ZG1SS1Via3U2eEFtcThYRWJOQUI1N0FG?=
 =?utf-8?B?ZlVVZlhZUEdpd1YrU1R2WVI3U2xuTmpwK094T1M5U1pLY0JOSHVkVEhhNU5I?=
 =?utf-8?B?Uy9kaXBDMWR5am9XdkdUTmlaeFRDZmpZa1FSUmM5bmVMaFB6SnFwR2FhZ0pQ?=
 =?utf-8?B?SUhSR3EyUlRwNE1QRXpnSk9acjhnUFpDejNUcWFOckNTU21QL2dGTEl4akph?=
 =?utf-8?B?YUNGdzdDREdydEFlRndBTmxLbnA2bC94ZVNrcU1DbWpSZGdVL1hpamxDMEhi?=
 =?utf-8?B?MzA0M1RGTGhiV3JzSG5OVS9CWW0zUS9Vc3pDWmpPS01wY1JKL2F2dDZ2SVk5?=
 =?utf-8?B?aGk5S05ncVNnT1NtYmNmV0QvcXJqcWhPMVRCR1I3N3hRblh4d0hvbDZLTkZZ?=
 =?utf-8?B?U1lLQ2svZ0NyOHhoY0RvUFYrZXZTYkh1djJGZjgvSjd6cFpFTEdEbytJSk9W?=
 =?utf-8?B?alVLSGRRTnA2QjlzbHUweGFZb0REQ3J5TUZqdVdHRldDZlBLcG9FQ0pyc0ZF?=
 =?utf-8?B?dVBRZ0lIQkdwZUIzKzZud1BZbDhJMk95SGpsajROT1R5TGduNFMrc1BVeXht?=
 =?utf-8?B?TVNKYVhoUFNoRnVLVE1xRml6WjRlRlpFSGFlaTQyNnFOZzBqZzNtMm9kazJl?=
 =?utf-8?B?dXgxNWE3ZkQyd3RQa2xmRDVPWUNZV1dxZmRLOWVBdFpRdUdTT0tEZXc1bmNs?=
 =?utf-8?B?ejNBcG5XUElkUjBpVWV2SmJPcFFpTFU2S2NXMzRDaTcxMVpTOWpETys0dm9C?=
 =?utf-8?B?UFF2dktWL0lvZ3F3Y0R0YVh0RWtnVnMrTVJGOHN0SGMvU1VBaGE2eG01Vkll?=
 =?utf-8?B?N2IvV3RGVXdnTDFFWEFIZXVxby91RHMzbVFUOGphNjc5ajNvKzRxMi9qYVZw?=
 =?utf-8?B?aE0zWFdQclhrZStFaDhRaXViNXpkMFBuVmxMUXNMbEx2Wks0Qm9TWmpJTTlI?=
 =?utf-8?B?TWVJS2VvdUlIenhnMExYcmlRY2tVdjc3aHlsdzMveFdnT3ZmdUpvbWduZGJ2?=
 =?utf-8?B?YlUybGNvaHVoNmx3bTU0bG5DM01Tdi9PbkNjalYxNEpPNGd1aGxmV2EyRzQ1?=
 =?utf-8?B?bUdJNGdxelBraVhNcllPZ25wVWY1SXJhbExXVnlXcEtGMkMrWHdONE16UzU1?=
 =?utf-8?B?c0dFU2t3T0lKckN0aHQyampub1o1bzJGb2RiaExFaFhRWHF4OEtDNHV4V0p3?=
 =?utf-8?B?aFhnNGRjdUdndFQrMWZEVUtQcGhkREhtL05OWXJIVE9VeHhidHB1WmdISFVa?=
 =?utf-8?B?S2FLVXpTRm03ZG5lZWh1WXA1Y2lNUFBwMXR6U212M1d4MjNRbmN3aVArWVlz?=
 =?utf-8?B?SkNLOVJuUnNOVmwvRlBTcXF0czFCbXVieGhXRVZJd2dkUlJDMnc0V2I4WmhR?=
 =?utf-8?B?Y3BCc1lpM2hTQ0JUc2MydUtuRjhtY2RqdFNvSE9aUlZEOS9OSVk5NTFsR3VT?=
 =?utf-8?B?MzQ0bE9sVTNDc2FFV1V1S0VTUUwyVEtHaFZidVVYTms5RERYSHRyaklBTWIv?=
 =?utf-8?B?MjdNZmJITTQxZ3ZJbU1YMGpUTHY5by8wb25WclRWUUpkMkR2eUFkcmdLMG96?=
 =?utf-8?B?S1c0L3Fka2ovaDNjdVYzcVN0ajhNWFhYNEtMSzFIaUNMN0trYVJIVjlFU21T?=
 =?utf-8?B?ZTlUV1l6T0tBWmZVVjZBL3MwVTRZM1dNR2tZQmh4Y2UxQ3RLNVJoR2FtQTZH?=
 =?utf-8?B?TjNqRTVqTzdMc2VUYzJpUWNaNnJiMkpDazVuR2xqN2NNUW1CNnlwWWQ4Skl5?=
 =?utf-8?B?cERMVHRTZ0VpbTNMUmE1TXRnMjM1dEdVQjBBM2QwNHp5YzkzdnpWOUx4Z3dx?=
 =?utf-8?B?Uk9aU1ZyeitleThra1JUeTNBQXVjQnBvN0wyc0ppNitUdjhqaHBoM0VLZTM0?=
 =?utf-8?B?ajd1RWNXL2VXZ3ZuYnZLVkJPTnF3cUxCWjJsTHJrNEk5MHRYMzFkZFdNZ2Yw?=
 =?utf-8?B?Z3lpM0xaQnF2NmhrSXhySXNWaDNIdS9qdkJEWmpPVUI5Q1o3UTZlNTRNcFdP?=
 =?utf-8?B?bVZ4aFJDQ3RBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7630.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(10070799003)(376014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Unc2T0xaS05PT2Q0cllXUXI1MUVuRzNoOC9nZlZtazVZK2FyZnNQVytkMWFZ?=
 =?utf-8?B?VEpXSU1xazlzRk9JcXZIOHRRem91eGNocmNUQ3AybUFZUkd1ZmtnNGR5MUM2?=
 =?utf-8?B?K1pQQ2RTTmZvY1VEWmY4S3JubEQxdU1zN2RDNzVMODJ3ZVAxaUpjamVrL1lR?=
 =?utf-8?B?T2JhM0RiMkl2T1paUnFjTit2SGtKT3Q2cGQxYyt3bElVRnpsWHRhTDJZTnBN?=
 =?utf-8?B?dlpwK2JVMU1sTG5EQU5DbnRNSWp5NmVuQmwyeWVJcE5Ia1l5ZkorTEhrcFM4?=
 =?utf-8?B?QStNQ2ErSUdxNHFMdnlTd3lUZFVRMjgxVHJxdFd5emZjK0RGV3g1Y1FSNDdV?=
 =?utf-8?B?bVlrcVUvR3NDYVlMbDdhalNTdFB6NUwzazhUSVRKQldsSzRJU2dGSnBoSFpD?=
 =?utf-8?B?L0FYMmpIdzBGT3FxSkFscFRCOGs5VDMzVXJpN0tyS1ltNHpUZFlWZDg3N3U2?=
 =?utf-8?B?aExNZEl3WVBXTUxMQ0NsK25FaEdHbmpMMFMySmkxL25BeGc1TzZWWURTRGFO?=
 =?utf-8?B?WTdyQTdyV3paaGFtVUlXVTRhTnc5T3Z0TlZDOWk4bk9QR0hOQkY1WHp0elht?=
 =?utf-8?B?clVLYTNBRTZjcjZnalFsYWNGS3Btcml1K2NBUWU1NEhQUXMrMGRUV0xsd3FJ?=
 =?utf-8?B?V3l1MktpdDJnL0JYNDgwajJPZlVoZ2RCRjdhWjNyWFJ4SmFxSFJLYVk5Nkpp?=
 =?utf-8?B?aVo5LzFQRkt0Y1dqRjVzQVNNZTNuZXJSdUpKVmRxQlY0UjNSa05SRkdOQ3hL?=
 =?utf-8?B?VTRQdkdZTlRWTFpudmgxMERCQktjT1pISEMxMlZ3RG9QVEoyU2xCRjZSemQr?=
 =?utf-8?B?SWlCMmN1anlvYUsrY3MyeHBJTkJjUWtZaU9QcEx1UXRYWVhvTUo5UC9TY1o1?=
 =?utf-8?B?S1ZTWHFJOGtQYm1leDZWbnZJSkNrWlVGMnZGcTFIMk5NRytOV1FpV2tpM2s2?=
 =?utf-8?B?N05aaHU5eUxkeEpOYThXQ1MxVkVtQmVNdG9tYUpLVE93M3MrWWRaYWtRQTRs?=
 =?utf-8?B?SitvSG96MldGWlFHdWRkMEo4N0ppRHlUbnVHZ0dxVXl6TktSQXdZeExWZmVu?=
 =?utf-8?B?MHlMbldsaTZnOGNDdGZXSUJKVnBkR0FTSXNrUllxaWZvN3dEaFh3NnBkUnph?=
 =?utf-8?B?MmxKU1ByM1I0YnJmWDlYL2Q1ZGhGNW1GWUFPQnZ5eFRBYU9Vd1ZsT1h5Mk41?=
 =?utf-8?B?RUNjc3JiREV1bStEOHFyM0JEUzQyam04TDAyZUhWeFZCcUVnU0dLVnhhdEpm?=
 =?utf-8?B?RTM4TmYvdnBJSTlzRnczZFdmeHRHd3pWZkNubjAvR0FDcUpzZjV1NUVUeU4w?=
 =?utf-8?B?RTVVUCtlcWNRaGdxb1gveXZhMVk1ODNiRjYxL3ZLeEpIYXY2ejAvbndPanRz?=
 =?utf-8?B?VzlsR2cvUC9FMnphVGJLb1BGUWtEMmNmczVMTUR6M0p2dC8zdCtINy8wbzJi?=
 =?utf-8?B?ODBMbXp3SzVsVjVtb21CWWNJMFFKNk1hSEtQVSswZDQxNWNpRktpQXVtT2Vp?=
 =?utf-8?B?K2NEamorcExnc2pDVWh6VXB3TlM4VnFlcHU4WWZDTmpOcnNzenBmeHRTeGdY?=
 =?utf-8?B?eUF3OU5hZGNnbzNxZ0hXSnNEUWR1L0JtSXZ0a2J0NHhyYzJOZ3puL1dZVHIw?=
 =?utf-8?B?a1RsM0tlWU1PMGs1aEZRWE1oR2wwRWZWVmorSGwwbzRVVTh6eXFlaEZFWGQ0?=
 =?utf-8?B?MC8zZU1ONEkwU1RJNHlQYjdrNXJIMnZlZlhyY0dzR1FLaGdZNGhZYVJwMGZI?=
 =?utf-8?B?ZHl6NVhIQ1lxZnhhdW1OcDVZUUViaDJhd05saDZiR1NUc1NJYXpFam1YRnB4?=
 =?utf-8?B?YldPQ3NNT3VrOWVFenhYTUZKUjBsVUlYdVZVWk1zWjMrczM3NXBad2ZPTE1a?=
 =?utf-8?B?SU55cUtRaEhQc0kzRWdxVjlWMzVxTWc0K2VabFhTdjBZSGpxcnhkYTBROFdL?=
 =?utf-8?B?aTQ3SFJoKzFMOUlUY3k1RHhXb0dEVmJGT2NSN3BLa1RVOElLV0l0amVsbENu?=
 =?utf-8?B?SW00c0M0ck0vdWpMQWdzcjIzYVB4amo5d2pQeXB2RUlWMHZGOHQ1U0kwMGRi?=
 =?utf-8?B?RW1mc0dRbnMwZ2NWS2pZSjNWTWRRYld0UUI0dk41MDk4OFEyVkwrMlA1NXdj?=
 =?utf-8?B?TUJvaWc1ZlN0N1NibWo5N29ELzdPRWhKaEczUHJzZC8xZHpzUERrY1FSak9s?=
 =?utf-8?B?d00rRGVrdXJVeHhhWDhYTXZzdHRsNktwOGlKMHN1OUFkcytaNjhhRXN0ZXdo?=
 =?utf-8?B?aU4yZnhpV2RKY3VuOStTdFpZSGlnPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b50ad5-7f78-4d1c-ce9b-08ddf1095190
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 08:00:48.4045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3yQyd2Zq3yNjp3js/iZ1Z8s5iU8thep9vJtPEGl7BgmDqaJ68uxNaHcmMXvyPIz/Ies0RL9DFG7nea0m6FFJLhgpcf8fRy4E6yUjHgszxYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11835
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

On 9/11/25 09:53, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> with integrated boost controller.
> 
> Signed-off-by: Maud Spierings maudspierings@gocontroll.com

b4 has been complaining for a bit but I couldn't figure out why, I just 
figured it out. The SoB tag is malformed somehow, the <> around the 
email address is missing. Will fix this in the next version.

Kind regards,
Maud
