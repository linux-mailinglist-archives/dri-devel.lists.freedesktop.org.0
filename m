Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43672940BED
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 10:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C6610E1EA;
	Tue, 30 Jul 2024 08:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="XLpoUlUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8612B10E1EA
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 08:41:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLMUCKRTbz00+1vyLxPceC4BxTRjA6Hdz6yUtGRMw4V3N7SGK8qrURKmBbVZ9uqeImBKgxoFT1Kc74XQGAdC9cclA+LQ2p+ALDIxXWBRNFDSJny+bN6porxGKKqisoZRZX8peZ5NZ8eIlMKBMfCR2lgQRUEwlzNbkQSbEbULAB3l8bAaTFyupYs28WKQk+tOvwiC1oi0mFMBhKNWAGS3qremN3WsQZ3JfcKwZM6hZis1Av1hhqm2EBmpVyVICxeJnJsDwM2bvwjhCNdF6wFH9hkbtqq9R4NO5/C1sxEa4GLAKtvRzXEGOwXlblJj9VPnoX+rVoDCXCbSVB1ydopBDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3ziwvcj0ZmvG5mHe9O+hAXIRptooor/Ie3mdZw/MIk=;
 b=t9GaDmlOia5Hvl1ObwTvLhoL0MXEilFIIi74lrkMzkzQnaKe6ImYzF4O3WNRIvxXOwYOBPW/lXWwKE9+geI/Hq2SnMQeWRB/mwbbnn4Gr9YcVoGDJJvfhDBHBtdk3cyY3BQwa6rNa3Q74HeyH7J3DWEn+1C8xAtvqe78uUDqD9gp0zDgL4v0/9hbBAtiOGy7Os8oQz6fJJAT5ZNFIaF5r38rmxAvlhoKSswsNcvzHL7RnjkYMmxUBB/qGH/FK67Dn0iBsqe+0kRY/Fq58eV1K3i7r/oImenzaPXFbfxQKx4fUoQLXh0rUeqrMu73y6KB/xmPFvtFeJJWrgCN+aVk3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3ziwvcj0ZmvG5mHe9O+hAXIRptooor/Ie3mdZw/MIk=;
 b=XLpoUlUNUeBkoJV8vz9ec7dahV91oKVEz0nG7RlB9wJEYqxg+evfwD/tS/iOov58soshwZoyJkwbp7mf/pS5AN8f7UB88ytDDS+IkPk3edX93rx2zT5dGXtTvAZ57+U65bjZWf4IDqULhvL1ctXzBLvqaYVt93ehAxULAj2s1I55rOero3jHgYZSsbCZWZaoRlqi2I2juSRjBfKy98LsowohkV0JNaFbvRBXd3jCVaUxllv+X9H4ZtG3rhUBDUjXjbStbRwcfOKwxTTMciA9ClzrhfqgWLA5X3DafPdKTnLq/A7ySv5q2toc+0f9ApYGO1aAT9/1Tfj1r/y7SPhKSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7589.eurprd04.prod.outlook.com (2603:10a6:20b:291::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 08:41:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 08:41:43 +0000
Message-ID: <e407affd-84a8-4556-8707-65ec79455317@nxp.com>
Date: Tue, 30 Jul 2024 16:42:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/19] Add Freescale i.MX8qxp Display Controller support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com
References: <20240724092950.752536-1-victor.liu@nxp.com>
 <wky3mjl7fn773myatyrdsea6oc2xebkvrgmigmmoj36eswgqry@2kox5ad5dynl>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <wky3mjl7fn773myatyrdsea6oc2xebkvrgmigmmoj36eswgqry@2kox5ad5dynl>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR03CA0095.apcprd03.prod.outlook.com
 (2603:1096:4:7c::23) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7589:EE_
X-MS-Office365-Filtering-Correlation-Id: 63bb8d8e-49f6-4058-52cf-08dcb0737066
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlVMOWZqQUsvblFKNHZzY2RWM2JvUjRFT2hVRmJGMkJKNnlYTTNQQVAwNGF0?=
 =?utf-8?B?cE4zZnY4TTRGQXNIc2dFWnBNMWVKK0hSY0NvdS9CY2NiZ1FHVVRjSzZUMnNR?=
 =?utf-8?B?N3lEeEhkcFU4VlNRc2NtNDExbXlBWVJ3L0tORWt4Z2l2VDQyZDE3MHR4bm01?=
 =?utf-8?B?ZmZnMk5taVNOOUFJRVh0L2N4MGJONDdHcCs0YmphSHlOQmVuSUdGK0NEb0RH?=
 =?utf-8?B?aVVJekd0cnJaeDRuWUlQOCtadEJvc2U0cnhtRXBrSC9VNytTb3RpallUM1VX?=
 =?utf-8?B?eDAranF6RGt1RDNqZWFtMEQwTlF3ZDJlSTY0b282TXQ2ZkNTM0NqdkZJUWk1?=
 =?utf-8?B?ZnFITnh6d0ZKWklpNGRETUhtS21ueXE5QXhvcHpNZmFjU0Q5QkdCUk5ZYnlp?=
 =?utf-8?B?N0tSNFB5c3RDdTlrQXJNQlA4YkVwbWNoZlRjWDFLRW1mSW1VdFh3T3d1L0xO?=
 =?utf-8?B?T25hc29VQTVrQTJsUEJ4NlRDNWhVR0tyZlhmNVFiWFNjREhlUmdZNmhIcnNv?=
 =?utf-8?B?K1FmQkRJazNIdldNMVdIQmNxd3hjVmltbTVyamFVdXNsenRhZzAxZmZIdm8v?=
 =?utf-8?B?WC9aT1FPeXN2MGkwRjhrZ0pFTU1HclBCUHh3UStsRXRCVzF2MmZLRlVDcDY5?=
 =?utf-8?B?VDY2d0hERkhRUzJLc3Vtc3pGUloveEluV2JtbjQ4ayt2NHpIdmRNRnNZb0J4?=
 =?utf-8?B?ZFp4bnNoMnlzd1lmR3hFSXlpSWlrNEpyajJtTkRHN2cvWmljc1ZCOUFrUnRa?=
 =?utf-8?B?ck1BNU5oVXo2bU1mMUdCMHdvWDZNVVhYcitwRWRHb3poT2M3aVFrMU00a1h0?=
 =?utf-8?B?NGtMZEpSM0ZXelBOSGJWR0p0amJ3eUgzbkRRRUZGU3NvSWZGbVpuVGZQREVk?=
 =?utf-8?B?SlREcTRXV3VoWWtIRmJleG5aVkNDa3UrVGVuYW1QdFRkU1ZTc1FjdFJrMGxI?=
 =?utf-8?B?UzlOaUswOGduRXk4NGlJVHlweE5jajAvZTVLVXpMUi85RnphUS9CU01SaVF2?=
 =?utf-8?B?TzZVVzlaS2lFWFFId1A3T21qVURhM0sraG45UVh1RzdZNXU4eHZEMkMrcDVq?=
 =?utf-8?B?WDV2aXVwZVBYWTZZYk1Ob2hiMHh6dHRLenBQdUlVcFBzalBjaENvczQwaGZv?=
 =?utf-8?B?YkFQOFNReFh5RS82UTVPNjkyalZmMVBzMHlvSjFNL2EwbFdrNlNRRnU1Q0lO?=
 =?utf-8?B?cDZGR2lSN3RZNEVnRkVnYms1MWtSSkJVMFdRRG5nLzY0MzVCVzl6NzlnQ2ZR?=
 =?utf-8?B?a2VRSnlkQ3JyVVRPTGthNEN5azcydHYva2pWT1l0bVhRYVNUWHFSVVBINGZS?=
 =?utf-8?B?anIrYk5HSTRjYVp6c3dodmZ2MS9NeGxHaS9kQ3FEcTNrVWRNL3R4R01hdU9I?=
 =?utf-8?B?aHVzNVJ4SnpSQTR3UlltUm84dklmTVhWWXcycUJ1Szk0SGdXYW5FQlpGSkRR?=
 =?utf-8?B?TUVvMW15azVwVmxlai9IMGU1ay9UcWNOL3h1akhKYURsUS83UWlrbm96ckFH?=
 =?utf-8?B?TjlXTkpST2xtR3BVMG1xWUpSVnVxK0FWNzYwL3RPK3ZJNFZYQkd0bWhvVUlz?=
 =?utf-8?B?aEk1MFhDODFRYUVMaS94OEp0S1dLUGUxTWxoSDU5Vzc3STJCSzdudHdGanBw?=
 =?utf-8?B?OENaM3RYL21QYUNlazZUZmF4R1dDMVZycC9NdHNnWVFkUERwVUYyRXlHNWxK?=
 =?utf-8?B?UE92RXRSWHdCOHFBRmNiZjJWeUl3a1NXdGM5clV6ZGVrRCtrRGlIVWVFYWUz?=
 =?utf-8?Q?CY+mxPYlRee+Vz6sxE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFNBSTdSblFwengwdjVpemlqeGlDc3pyVkJLaURBRmtYZkFicFk0YkgwbWZO?=
 =?utf-8?B?dlNSbWp5WFNiMlYwSGhBSU5aZVNaVHJNeWFYN1lOWGlsQWk0eTdzNThMQzJK?=
 =?utf-8?B?ZWZDQ1dKbU1kZHROc2Y2S2wvZnJZVXlNWTRYWXNQcWNTeURCSGZJZzdTbVpq?=
 =?utf-8?B?a1dUWG44Um84MUhFUWV5U01RNEhFSDl3VDhXZ2tXRTNWTURLY1l6czJtR3N6?=
 =?utf-8?B?d05TdHhsSU4ycFRpS3lneTRWZWRkUGNHbHhvcXhhWUU0WHV5ekJkWXgxNnNP?=
 =?utf-8?B?OWNuMUQ5a3NlMXNKSi9RdENnNjQ0cENISGNsZEgrY0hmMGhYYVluR1J0Q3JU?=
 =?utf-8?B?ZzVzeEFObURxbkNnTm5lL25jU1dLSlFzVjQ5OU9PRWViR3RoZVM4dGkxcHVG?=
 =?utf-8?B?dnRWYjViYllDOS9jRyszWVRORC9aNk9pb0tWQkg4TUEvV2grbGxrblE4MWRW?=
 =?utf-8?B?bWhnRkl2MkFQTGFQSVAxMmZBdXZhUjhCelg5VWpZNHpOcjFuZFF1OFpocWRt?=
 =?utf-8?B?S1N3bUUwdm93TENsSy9jK2RKbVhLV0xwUXNpQVlPbzRkcnR5WExITmZFL2lx?=
 =?utf-8?B?RzN5Y3ZIZ3dqc294cEd0RlI0eVlmSGhsU1JOOHBZaFIxWmY3dmFSU3V2dUJW?=
 =?utf-8?B?N3hhTkt6RDJnbVlQcEwyTEJuMzQ1blFyQmxCSlJmR3k4SERzK21BSmlYQ0tv?=
 =?utf-8?B?R2NyZUl2ODVsenRtakF5anZpTFhYKy9IZ0IvZXh1YUkxdWZwaWJQNE1zdGhX?=
 =?utf-8?B?TE1JMC9NU25RMmZjNFI5dGhCMjFnQThuNjNsclBkQzViM01KT2VmRXo3cytW?=
 =?utf-8?B?SC9nTkM1U2RNdWZhd3BZNEtTeTIrcjNHM21YZmdFUWUzdlB1NEp4MitzWVJU?=
 =?utf-8?B?MTMyRWYydHA5ZTJEdjZ0ZktzQXFXYzRJUjVJNVV6NDd0VTNmcFBIMUpGc0dq?=
 =?utf-8?B?R1JMYzFPV2Z1VlhVSzlwZmxsd1NWQ0k1L1BNU2lMcDVJTDVGYlRhT1BOZUV5?=
 =?utf-8?B?SG5wNHFhalc4bk5WMVQzakhqcHQxM1MrOVppbkQ5eUNnVUcwUjNGUGg5ODRG?=
 =?utf-8?B?dy92cjJVL29QU1JuSitMaWM0c25ZS2FmMEFZU1c4V1R1UTcvUTd3c08yU3Q3?=
 =?utf-8?B?dHRNUGtoazVrWWtuVXBORUZBTndiSThYa2E2ZlQ1S1hxV1Y5MUh5VVNzVUFm?=
 =?utf-8?B?Y2wwb0J6RlBqNDUrYW9RMkUyT08yemQzdzRHbDVrQWNBWGttdFBwSGg1clJr?=
 =?utf-8?B?V1VxMWZTQzJ0Q1NZclBuTndESDBSR0c3d214eEhQUnhuN0FSeG9uQm13a2tk?=
 =?utf-8?B?R0FZaTBHdFlPRTZjenFpTUZZNXdtNlJpdkpWczZ1ajdSN1JtZjRTTm9UNzZ5?=
 =?utf-8?B?V0VhK1JTNUt1dUdDdW50QSt3NVdyYnZ2aFFVVzdOdndtd3A1MEVVeXhKcExQ?=
 =?utf-8?B?dERTUTlFS2pqVnA4RlVqS2Y4d3lPRnExQjNlUGxCQllXdlpZV09hRmlNVTJO?=
 =?utf-8?B?QlUxYmJ5VWdjQy9wbCsrdjlhQU5wdG5UVCt0TENOWEhTVDljMm9CYlZJZXRX?=
 =?utf-8?B?Um1UWHVwajJYNWpTOUd2QzE4M1RzUGVUaXlITlVyRHQ5MTFCY0d2a3laTmor?=
 =?utf-8?B?OExMdE5mVEsvaG5PS3hvNU9WTnYyK1pINWNyRFVtVUN3YnhnSFdwMUYydzRT?=
 =?utf-8?B?ZFNsMDJYZURCeWdEeFlwWnhjck9jRFY3c044K2l6cEw2cENybzVkUmEyeUtI?=
 =?utf-8?B?aDJ6NzBUTE5hRU05WStOc3d0bDFjVUVtTWhaUG1ocSsrU05rMEZGOS84UkIx?=
 =?utf-8?B?VHlic3poZGltUHNqbmNDZ0h3dFhTcjk1Y3crc0JxM0dENW1yUWFhSndSYzBm?=
 =?utf-8?B?MEc0OGMvOVRLbXZsVDM1a2w4MHdaV01HUE9nVzQwQ2U5Uk9rdG1jT2RqaVEr?=
 =?utf-8?B?TW9VOTQ0VDYrSWo1L0g4NVdTekVub3pjckVtMVlkc3ovTXVxRUN2WFQ3dkRT?=
 =?utf-8?B?dTk5MUVTUlBrMDJ1L1hOUDZyL2lVNjRiK05wZGp3T0Q2bW90cmM5VU9Kb2Yy?=
 =?utf-8?B?OXZwckJ4RHpWU2MyZHpJaW9JWkkza25UNTMwWllMR3NPYi81Sng2S3NnK2d1?=
 =?utf-8?Q?2euPgy9y1AaNMxdFDCQMN2FaC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bb8d8e-49f6-4058-52cf-08dcb0737066
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 08:41:43.4354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsFnvKCsQtXgR75frWw+A4Siwx+qYkIkBogNlknv5vahF6qPooih5wze3uMqjVgkY/tBTzswELUSL783ohnxGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7589
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

On 07/28/2024, Dmitry Baryshkov wrote:
> On Wed, Jul 24, 2024 at 05:29:31PM GMT, Liu Ying wrote:
>> Hi,
>>
>> This patch series aims to add Freescale i.MX8qxp Display Controller support.
>>
>> The controller is comprised of three main components that include a blit
>> engine for 2D graphics accelerations, display controller for display output
>> processing, as well as a command sequencer.
>>
>> Previous patch series attempts to do that can be found at:
>> https://patchwork.freedesktop.org/series/84524/
>>
>> This series addresses Maxime's comments on the previous one:
>> a. Split the display controller into multiple internal devices.
>>    1) List display engine, pixel engine, interrupt controller and more as the
>>       controller's child devices.
>>    2) List display engine and pixel engine's processing units as their child
>>       devices.
>>
>> b. Add minimal feature support.
>>    Only support two display pipelines with primary planes with XR24 fb,
>>    backed by two fetchunits.  No fetchunit dynamic allocation logic(to be done
>>    when necessary).
>>
>> c. Use drm_dev_{enter, exit}().
>>
>> Since this series changes a lot comparing to the previous one, I choose to
>> send it with a new patch series, not a new version.
> 
> I'm sorry, I have started reviewing v2 without noticing that there is a
> v3 already.

I've replied your comments on v2.

Thanks for your review!

> 
> Let me summarize my comments:
> 
> - You are using OF aliases. Are they documented and acked by DT
>   maintainers?

As I replied in v2, I may document them if needed.
No Nack/Ack from DT maintainers as of now.

> 
> - I generally feel that the use of so many small devices to declare
>   functional blocks is an abuse of the DT. Please consider creating
>   _small_ units from the driver code directly rather than going throught
>   the components. Also please describe how everything fits together in
>   the cover letter.

As I replied in v2, they are modelled as separated devices and kinda
accepted by Maxime and Rob.

I'll try to describe more in cover letter.

> 
> - I assume that there more functional units that you are cunrretly
>   adding and there is more versatility. Please describe that in the
>   commit messages.

I've documented all processing units and the other devices in the
main display controller, nothing more.

I'll list all processing units in commit message in next version.

> 
> - I see a lot of small functions, which can be inlined without the lost
>   of code clarify. Please consider self-reviewing your code from this
>   perspective.

Can you please point out typical ones in patches in question?

> 
> - There were other small comments, but I think they are less important
>   now. You might still consider them for v4.

Thanks again for your review.

> 
>> To follow up i.MX8qxp TRM, I changed the controller name to "Display Controller"
>> instead of the previous "DPU".  "DPU" is only mentioned in the SoC block
>> diagram and represents the whole display subsystem which includes the display
>> controller and prefech engines, etc.
>>
>> With an additional patch[1] for simple-pm-bus.c, this series facilitates
>> testing a LVDS panel on i.MX8qxp MEK.
>>
>> Please do NOT merge patch 14-19.
>>
>> [1] https://lkml.org/lkml/2023/1/25/120
>>
>> v3:
>> * Collect Rob's R-b tag on the patch for adding fsl,imx8qxp-dc-intc.yaml.
>> * Combine fsl,imx8qxp-dc-fetchunit-common.yaml,
>>   fsl,imx8qxp-dc-fetchlayer.yaml and fsl,imx8qxp-dc-fetchwarp.yaml
>>   into 1 schema doc fsl,imx8qxp-dc-fetchunit.yaml. (Rob)
>> * Document all processing units, command sequencer, axi performance counter
>>   and blit engine. (Rob)
>>
>> v2:
>> * Drop fsl,dc-*-id DT properties from fsl,imx8qxp-dc*.yaml. (Krzysztof)
>> * Move port property from fsl,imx8qxp-dc-display-engine.yaml to
>>   fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
>> * Drop unneeded "|" from fsl,imx8qxp-dc-intc.yaml. (Krzysztof)
>> * Use generic pmu pattern property in fsl,imx8qxp-dc.yaml. (Krzysztof)
>> * Fix register range size in fsl,imx8qxp-dc*.yaml.
>> * Use OF alias id to get instance id from display driver.
>> * Find next bridge from TCon's port from display driver.
>> * Drop drm/drm_module.h include from dc-drv.c.
>> * Improve file list in MAINTAINERS. (Frank)
>> * Add entire i.MX8qxp display controller device tree for review. (Krzysztof)
>> * Add MIPI/LVDS subsystems device tree and a DT overlay for imx8qxp
>>   MEK to test a LVDS panel as an example. (Francesco)
>>
>> Liu Ying (19):
>>   dt-bindings: display: imx: Add i.MX8qxp Display Controller processing
>>     units
>>   dt-bindings: display: imx: Add i.MX8qxp Display Controller blit engine
>>   dt-bindings: display: imx: Add i.MX8qxp Display Controller display
>>     engine
>>   dt-bindings: display: imx: Add i.MX8qxp Display Controller pixel
>>     engine
>>   dt-bindings: display: imx: Add i.MX8qxp Display Controller AXI
>>     performance counter
>>   dt-bindings: display: imx: Add i.MX8qxp Display Controller command
>>     sequencer
>>   dt-bindings: interrupt-controller: Add i.MX8qxp Display Controller
>>     interrupt controller
>>   dt-bindings: display: imx: Add i.MX8qxp Display Controller
>>   drm/imx: Add i.MX8qxp Display Controller display engine
>>   drm/imx: Add i.MX8qxp Display Controller pixel engine
>>   drm/imx: Add i.MX8qxp Display Controller interrupt controller
>>   drm/imx: Add i.MX8qxp Display Controller KMS
>>   MAINTAINERS: Add maintainer for i.MX8qxp Display Controller
>>   dt-bindings: phy: mixel,mipi-dsi-phy: Allow assigned-clock* properties
>>   dt-bindings: firmware: imx: Add SCU controlled display pixel link
>>     nodes
>>   arm64: dts: imx8qxp: Add display controller subsystem
>>   arm64: dts: imx8qxp: Add MIPI-LVDS combo subsystems
>>   arm64: dts: imx8qxp-mek: Enable display controller
>>   arm64: dts: imx8qxp-mek: Add MX8-DLVDS-LCD1 display module support
>>
>>  ...sl,imx8qxp-dc-axi-performance-counter.yaml |  57 ++
>>  .../imx/fsl,imx8qxp-dc-blit-engine.yaml       | 204 +++++++
>>  .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  41 ++
>>  .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  44 ++
>>  .../imx/fsl,imx8qxp-dc-command-sequencer.yaml |  67 ++
>>  .../imx/fsl,imx8qxp-dc-constframe.yaml        |  44 ++
>>  .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 152 +++++
>>  .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  45 ++
>>  .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  72 +++
>>  .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 141 +++++
>>  .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  43 ++
>>  .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  64 ++
>>  .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  32 +
>>  .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  39 ++
>>  .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  44 ++
>>  .../imx/fsl,imx8qxp-dc-pixel-engine.yaml      | 250 ++++++++
>>  .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  43 ++
>>  .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 ++
>>  .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  83 +++
>>  .../display/imx/fsl,imx8qxp-dc-signature.yaml |  53 ++
>>  .../display/imx/fsl,imx8qxp-dc-store.yaml     |  96 +++
>>  .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  45 ++
>>  .../bindings/display/imx/fsl,imx8qxp-dc.yaml  | 236 +++++++
>>  .../devicetree/bindings/firmware/fsl,scu.yaml |  20 +
>>  .../fsl,imx8qxp-dc-intc.yaml                  | 318 ++++++++++
>>  .../bindings/phy/mixel,mipi-dsi-phy.yaml      |   5 -
>>  MAINTAINERS                                   |   8 +
>>  arch/arm64/boot/dts/freescale/Makefile        |   4 +
>>  .../arm64/boot/dts/freescale/imx8-ss-dc0.dtsi | 408 +++++++++++++
>>  .../imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso | 183 ++++++
>>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts |  34 ++
>>  .../boot/dts/freescale/imx8qxp-ss-dc.dtsi     | 240 ++++++++
>>  .../dts/freescale/imx8qxp-ss-mipi-lvds.dtsi   | 437 +++++++++++++
>>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  28 +-
>>  drivers/gpu/drm/imx/Kconfig                   |   1 +
>>  drivers/gpu/drm/imx/Makefile                  |   1 +
>>  drivers/gpu/drm/imx/dc/Kconfig                |   8 +
>>  drivers/gpu/drm/imx/dc/Makefile               |   7 +
>>  drivers/gpu/drm/imx/dc/dc-cf.c                | 157 +++++
>>  drivers/gpu/drm/imx/dc/dc-crtc.c              | 578 ++++++++++++++++++
>>  drivers/gpu/drm/imx/dc/dc-crtc.h              |  67 ++
>>  drivers/gpu/drm/imx/dc/dc-de.c                | 151 +++++
>>  drivers/gpu/drm/imx/dc/dc-de.h                |  65 ++
>>  drivers/gpu/drm/imx/dc/dc-drv.c               | 275 +++++++++
>>  drivers/gpu/drm/imx/dc/dc-drv.h               |  54 ++
>>  drivers/gpu/drm/imx/dc/dc-ed.c                | 266 ++++++++
>>  drivers/gpu/drm/imx/dc/dc-fg.c                | 366 +++++++++++
>>  drivers/gpu/drm/imx/dc/dc-fl.c                | 136 +++++
>>  drivers/gpu/drm/imx/dc/dc-fu.c                | 241 ++++++++
>>  drivers/gpu/drm/imx/dc/dc-fu.h                | 129 ++++
>>  drivers/gpu/drm/imx/dc/dc-fw.c                | 149 +++++
>>  drivers/gpu/drm/imx/dc/dc-ic.c                | 249 ++++++++
>>  drivers/gpu/drm/imx/dc/dc-kms.c               | 143 +++++
>>  drivers/gpu/drm/imx/dc/dc-kms.h               |  15 +
>>  drivers/gpu/drm/imx/dc/dc-lb.c                | 300 +++++++++
>>  drivers/gpu/drm/imx/dc/dc-pe.c                | 140 +++++
>>  drivers/gpu/drm/imx/dc/dc-pe.h                |  91 +++
>>  drivers/gpu/drm/imx/dc/dc-plane.c             | 227 +++++++
>>  drivers/gpu/drm/imx/dc/dc-plane.h             |  37 ++
>>  drivers/gpu/drm/imx/dc/dc-tc.c                | 137 +++++
>>  60 files changed, 7598 insertions(+), 6 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-axi-performance-counter.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-command-sequencer.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-pixel-engine.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc.yaml
>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
>>  create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
>>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek-mx8-dlvds-lcd1-lvds0-odd.dtso
>>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-dc.dtsi
>>  create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-mipi-lvds.dtsi
>>  create mode 100644 drivers/gpu/drm/imx/dc/Kconfig
>>  create mode 100644 drivers/gpu/drm/imx/dc/Makefile
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-cf.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-crtc.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-de.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-drv.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-ed.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fg.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fl.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fu.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-fw.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-ic.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-kms.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-lb.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-pe.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.c
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-plane.h
>>  create mode 100644 drivers/gpu/drm/imx/dc/dc-tc.c
>>
>> -- 
>> 2.34.1
>>
> 

-- 
Regards,
Liu Ying

