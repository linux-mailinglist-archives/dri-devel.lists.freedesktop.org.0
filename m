Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPHLHiWFeWnGxQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 04:40:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86D39CCB1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 04:40:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103CA10E613;
	Wed, 28 Jan 2026 03:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Qz3fRz8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011040.outbound.protection.outlook.com [52.101.65.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951BE10E613
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 03:40:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWqgOSAahCFKOc3TsjXvJQ7u9Hakq1oGbGK/rxTrPJmtRkZTVp4dTRGBKWBUvBl5/DuJpduWpEygc4jE3b7wIC3eGdavKdonpa1ay5rZ20TbDAwXDnPmSpUBaXmFcN+hY00wevcoYPEJotN4zLBlGFtxB3zvqz9+b8Yrf/3C+18XTCoB+vG8sROJrSb1+Fr70/lm5UtWZ7Gxq/b3RQQQxbkYjp9YHaX7cfwy4s606jycjTw8Q5Atc3n5NNg58CMZeJCc5XTGcSaqaximmluQ6ZVtsjVC9CUj2O5pHKWTrYIWyrPo4hyAs1b+w9l78Gbw55XOgzJWXx6ZbmZmmniAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQIY7XMGl19KHa1iqnxhjg1DnR0g1dtShJ6O/fTl2Ck=;
 b=twwcSgi7XKSvkYHGtqYu9fJrc7mTLMtz5UGCDdC2IUXkcB4pF2L6MvIwMoUlM9vcR9KeBsmIOHkxz9u0N+3ZI4+Z7iWSlY3Zi3ln+ZnTjys7x1Xu9qwIMG8hTZZbaM4Y8gywrl9hvOUdcNpzCJqtqcoIuXn52TnWw7AsS0WB9viDnDd0ksBZE7y5xB/x9Ca1zS/x05lrCwHhZNDkYPoXZKSb0D245wUsjb+GVEsvMVRkvKTLO+rZE2R63sSHqCjABr0iw7wLtUmlb45bJwW4ndIjTQCKoIyrJEH/NurbiG9exYakua1xXSzPTIwLNE0IWY+nHViV55OS25KjpvkrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQIY7XMGl19KHa1iqnxhjg1DnR0g1dtShJ6O/fTl2Ck=;
 b=Qz3fRz8lInKzbHQpxbhaeTt1ob462baHfrCFHHvN4Ygw6be+XGiQ7B+2GAoDHmzBvuMoGNfJFpK3XBnz6wohFc+8ICPvsr8V/qFV9rxTL4Zy0NLFk6ii+otuPcJdqgcGd0nbT/JKBJE4fd9WBWHXj8SwgPCM87BqgFUvu55j0N9Hb68+4J9/yKJTzMNqAFlaZ3aHWqQ19h7tqPRE/TK1HPaAmpRP1XH3HW9G+gR10LtNU8SjDCn8axSioOYBc0cxiLO6V+t8cDEgAE2vlqYzhdy9129hO765DFKIiJSMMU9/LiwSe/8GkuTqDJN9ZRHAxt1XH6ALSpTge/6GwhXXkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10490.eurprd04.prod.outlook.com (2603:10a6:150:1e2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 03:40:14 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.015; Wed, 28 Jan 2026
 03:40:14 +0000
Message-ID: <556b54da-6910-4cfb-8581-40fd092ad920@nxp.com>
Date: Wed, 28 Jan 2026 11:41:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/bridge: fsl-ldb: Allow the termination
 resistor to be enabled
To: Fabio Estevam <festevam@gmail.com>
Cc: marek.vasut@mailbox.org, neil.armstrong@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, frank.li@nxp.com,
 Fabio Estevam <festevam@nabladev.com>
References: <20260120231930.2782444-1-festevam@gmail.com>
 <20260120231930.2782444-2-festevam@gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260120231930.2782444-2-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0211.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10490:EE_
X-MS-Office365-Filtering-Correlation-Id: 34acda4d-3598-4ffe-e763-08de5e1ef27b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|19092799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVJZYms3S2JnRGhGcmRwd0h3K3VKdDBHTHFTVVMwQ1hwWG5wd2pZd29KZThD?=
 =?utf-8?B?cExSWWkvS0Q4bEhBS3dweW5oNGhmNEhZeGlxVkdxSk1PMWtLTmVPMklUNjkx?=
 =?utf-8?B?OWg3a2xGNDQ2ZVFXTHNoRW5GdGhqNVNwRjRCTktnbUx3VWVCRUFVOS9Gc2Rh?=
 =?utf-8?B?L3E3ZmVRTnFZVkd4VVBqSVFCdnRwRWxuSzBrcHRHa24rZnFxaVFDYzgrSXpr?=
 =?utf-8?B?SUtJYWErQ3czbmR4TVJpUUFKTnNHK0JLeFhEL1V0TXF3ZnhFa1VONXFhQ3NQ?=
 =?utf-8?B?dndOZkExandrRVBPNkZQTE1mODc4OFBCdHFQM1ZCQWpGSFlXZGg4NldYeWNV?=
 =?utf-8?B?QVlmTVA5UTdSQ1NZTkIrYzJ0YVltOTh6OWExUkM3cHVHb1MzTlR1QTE0anZF?=
 =?utf-8?B?N2xBZGt2RDBRUFF5V0ZhYnl0dGZuM2VQWXNtN1hjVWJZR0FaUGxMM3dOenky?=
 =?utf-8?B?NHRQRnlXazFncncrSnphK1dqMTgxWCtSSlo3UjltMmIyaG5LRGV2OW92emxS?=
 =?utf-8?B?RmUyelJ5dHNSMzI5RGNaMERHdnplcmw3c1hTcTBjc3d3NFlXbDkwcTVZalF6?=
 =?utf-8?B?WHQrSmFqQ0MxQUEySE91dU42TlF2K1V2TVpWd29QSzdBaXZwbmUvbGRaNkU5?=
 =?utf-8?B?dFhNdDErZWJQYzdNcmk3Zkp4SjFob2dWZHo2NnlyWXBodzlyNUxybHpDZVFG?=
 =?utf-8?B?Ym9HZUcxUUlNOFA1NytjVUJWTCtvQWpUWjR6OUs5a1F3Ymc0S3dIR3EyYWMz?=
 =?utf-8?B?blcyZFVXTE8raWIvOFN6SUJYM04rUGlWcUh2YTUvem5Md2FneGNRS2hiSWtW?=
 =?utf-8?B?QTJVUEJaRFpsVVpPRjZNbEVTaHFYd0x4SENxcVZEanErNG5nRy81blFadi85?=
 =?utf-8?B?U1hxTE9sZEdxVWlRMTFNdlNzNDIzM0tDcGVLU2YvQWRYTG9tVnV1WmN6QkdM?=
 =?utf-8?B?VHNMdjVHRmNVYlBubjdrSVhOOFRjem1SaXRCV3Y3eS9wOGF5eVU0dWxRY2hu?=
 =?utf-8?B?YWY3aUMrcXA1M3YyMjVjQWFNQUloSzhYTks1eWJmaXQraGpPVmM2NHAwYlNH?=
 =?utf-8?B?K28vN0FRanJtNnpkbjR1aWJLaUtxTlM3OGsyVm9kNUFYK3YySytmSnJJaURR?=
 =?utf-8?B?MmRzWndpVzAybnM1SzNONzZneEZZeStpRTEwWmp4aURFM1VOaE9YQUNjUmw4?=
 =?utf-8?B?bys2aGg0Q25SVkpKNTBIMHFPM1N0UWxXRCtpZWtVcW5XSmhWNDVUZ1gzZGNQ?=
 =?utf-8?B?NEJHT2dDMWFnOVUvM1J5NnJvZXhEbHVJMkhaeVRxeXB3ZFBJeXNwY01sSjVC?=
 =?utf-8?B?Y0QvWk4vUkM2STRBbXpPOEE3OWpSMXM4V0d0VGxKOXlvbEZjQjNyRmtHOHBX?=
 =?utf-8?B?MnVjS05tN1lKWGlLWEh6NXNkR0prN1NqOWdwOFNzQnlJenQreDNCN2kwaWxi?=
 =?utf-8?B?SitHTzBoeGh3S1haZHhWckd4cVA2OGE5OW1URVZzUkt3aE5zNXZnR2RReThZ?=
 =?utf-8?B?TlpQUDdRWjkyMXBBeDNiUHBVMWp5MnA1dU1lZitGSndlSVlLZ3pYVXRSSHFF?=
 =?utf-8?B?RnFFTVJQMVVwM0d0aVUxWTd1SWNUMEVRbzlJK2NuMEVua2h3UlU0VmFaUGVP?=
 =?utf-8?B?ZHJtU1JUZ1lRK2lNNXdHdFBBUGRINWpVZC9mQ3NkQVRCSW85cFluZXlqTnp5?=
 =?utf-8?B?OU4rejhRYXNCSDZRNm95Ym1yUFdqOFpsSnpKVXUwVFRjbGZMRDN0bzRDUVJ2?=
 =?utf-8?B?ZWRnVTZLcHB6dmMzZC9oNjZyNzFaVlF2d01vOGZaekZVSHYwU2dzeEV0aGFC?=
 =?utf-8?B?aXRWaUJVQy9PbGZYZzBkRGFNRmJhQlo2SkxDWG9SS1NDeDFYeS9YU1A4aXpG?=
 =?utf-8?B?cmQ2Q3poMk9IK3V1OTNOSVJuQkhyYWFiaTFRdW9TQldlRWlWTHdRTWV2dnBU?=
 =?utf-8?B?MFJRVVhYbS9JZ0JISno5eHRSUG01VFpTZU1oNmx4d2Jkdy96dW5mUkNpQ0Yr?=
 =?utf-8?B?Vmp1ajFvd082TGhjT0dnalpVRG56UUlFVTFiZ2xyWUNGT2RlVzNrOW50bjhz?=
 =?utf-8?B?TWpkM2Y4ZExQbjZ3RVN2bkJremg3ZzN1cHF1SUh1Q2YwcGsvZlB2Y3FIVU1s?=
 =?utf-8?Q?EPEw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(19092799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b000VGdlQ3pUL0VXMWN0eWUxemwyK05VclFMaEc3RFBxdFhZVk03eGFKR0JF?=
 =?utf-8?B?dmNFT2NaYzIyQUs3bEFjRFBtOHlnOFBSV3MwV21ZMThqeUVtWjd4WW9tMWlw?=
 =?utf-8?B?b2pKOCsxeG9TdWdBQU5ETDkyb09PZHlLbUZlaVBFU0dhOXNVMXlaKyt2aTJP?=
 =?utf-8?B?cEttUmgxQzlwZTBpTHRrT3hOUW40aGtCWVRoM3Yva3laMUhTTnBwYXNZb0NL?=
 =?utf-8?B?M1h6a3ZlakN3MVp1K081ZG0wZnhnUWh2ZWdJekE0RFRPMGZGdzE0NGRqeHl6?=
 =?utf-8?B?RUVvTzBzZnZodi9MU0t3MTJnczFQWFdRSzh5T3FSVWNZYWxqYTVCM3VTdnY2?=
 =?utf-8?B?QWZWR2xBRHBTNWZXb1VHMGU1S09yZUt5cE5raU9hcXhxcXNOcG5ETXlBckhJ?=
 =?utf-8?B?RllQSmJKQjdMZlBLNzJJMS9aRHcyZEp3bUMzVmhlS0dqY2cvR0JWZTB5UjBR?=
 =?utf-8?B?ZnF6RStLNVI1cG0vUGlCV3FuZHdHcGsxZXJFa0xHbzc3bmVSQm9sbi9waHBu?=
 =?utf-8?B?ZGtNcTFDNi9ja1lDNmJJS0FlUURIVlZ6WGw5dlpVWnBMMWFoMkkrRDM0NEMv?=
 =?utf-8?B?ZENOQVQ5QXpFS1A0N3QzbXlpSktNaUhZM1o3Y2QzZDhmM0ZjbG1XakM0bThx?=
 =?utf-8?B?bHMyYnIrU1ZNZ0kyVUxaMjFWdFVSbnpVOFNQOHladjRERTMvVEY0c05aL3Qv?=
 =?utf-8?B?TkRHUW1uTEpMalpOblUvMDFnS1c5SDdmczdsSlNoWEZBZzZNbjNYd0srMmlM?=
 =?utf-8?B?eXNhVjNObzVZRkdDQ0RRdHBlbDJBeVQwamVQRTJETERjTEdYajFiVWo4RjBG?=
 =?utf-8?B?WGZYVkhvYzR4Ly8zU2c2K0oyeExCdnVSYVM0bXhsSUpCMEFTY3dmNXV1RjVF?=
 =?utf-8?B?eFcrckxBMUU4eWtPMU44Mkk5RW40QVQvem5kK0VZUTI1bWNMMjZWQjhSOGVO?=
 =?utf-8?B?RHAwZm80dXlyUklYK21NT0hQT3pIQUVZRFRjOHI1KzQvV09vaUVYaUZ5OVBN?=
 =?utf-8?B?ZmI3eWhQMmJ2d1N3dC96UVlOYlNqNmZiUmxJM0xOMmo2dStMSzJtMGJ1Zk4x?=
 =?utf-8?B?UVpOQUZ4SkVRUmdFS05WZTNUU1dFb3BuLzZ2SG1vLzdJZjQ2Nkc1UWtzdEc1?=
 =?utf-8?B?U1RCVExrNVJqcWpiV3Y3THlWbG0yNzJ3dUxuMWt1cHZnRU5oVmdNME5UYVhC?=
 =?utf-8?B?RmZCeDI5blpjenVSMlVXc2RWaUJsVnhqVGxaSTd0dEgrSCtYVUxDOWlYVXc3?=
 =?utf-8?B?ZUY0MlhWcGxvU3R6SzNTM3ZZODloLzBzOFNlNW5vZCthcEJZLzRQR09XR3B4?=
 =?utf-8?B?WEVEblJOUC8rcXBtNkZaTCthSVJYWFo1RFVsNHZkdDNPWEdiQlJuSjR1RlNz?=
 =?utf-8?B?L2VSM3VlOVlOcTFKNE1ZeFF4L2dVOE15dlozNWdVeC9WdEI4RE4wa1FKTHdm?=
 =?utf-8?B?UjhLbTZQbzY2ODFnQ05uMFRuSERBdjY1TkF3UXlFMHJOUElhemNnektvaitv?=
 =?utf-8?B?T0pTenhpeFl3ZEo2VVRWRlBaZW1NOE0rNHQvWjJ2UThTL2c2YnQzVVNGd0tq?=
 =?utf-8?B?bER2eE8xdVkvRWZyR1hUalozbkdDWGVVRjUzeldxTnROZHJPN05RNDJuZHF4?=
 =?utf-8?B?cm1XRjM3TTlXRHdyK3VyUnhENVFTOWVJSUtreVhLdndrdFhlRjNoYy9HdzhZ?=
 =?utf-8?B?Ykk3Mk5yQkczYURLUy9EM1V5L1crdGQvQnRhbXoxbHNwRWVwaTZoTnlnd0RQ?=
 =?utf-8?B?Q3pVYyttL0VhYjk2NjJ5d1dsdVg2ZXVqZ1pIb00xdlFRZEpydGVFYjdZYUhw?=
 =?utf-8?B?V0duSkhrZUtXc1E1SFp4TFh3Q053bitCdkZoZDZWNmVQUFA0TStiMDNZaVUw?=
 =?utf-8?B?bVlDREp6VmQ0VDl0dTlUeVA5V2ZLcUI0ZUxOb01JQVlidWJ6a2RIM241d3dX?=
 =?utf-8?B?MXcrNWJIdVUzQXVONnRuUEsvRUdKVTJ5YmcvMzJucnhFUG41UXJaR0RuVDcr?=
 =?utf-8?B?NjVGY0tITGM5OEI5RXZ3WmkweFFYNXBJVFN0WDdGcDM3UUpjSTJJUFFBdTF4?=
 =?utf-8?B?ejJuelJaMGFxY0d1TmVHMFR3dEpCdzRtNktQMXFSb0ZIcW1sV1RZaWEvWEFD?=
 =?utf-8?B?R3JmYnNmdWlTSkJkTmdVSGVQVW1rcHZxczRyM2k1bnZFcGRIb1lPRXdudXc5?=
 =?utf-8?B?eitXQ09JOHVjMW95ZVdFM0o3czdkWjR6YU5xeUs0Zkc5ZXJaUDZ3OEVNemd0?=
 =?utf-8?B?RWhveSsvTnJ2dHNmU2JWOWR6aVRHY3h4Y05rdDhNZTBsd2xZVE5rM0ZpY2Ns?=
 =?utf-8?B?Um53MmlzbDBRMGJDL2RzaU01VG4vT2VwbkIvNHNuVHRtTWFyOWxmZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34acda4d-3598-4ffe-e763-08de5e1ef27b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 03:40:14.5802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdUEqNiHh04ZHG08nqhBCjZFkqrhyMIlGZoo8OyCnk1v1b3vpojI9x1kZducn82A3/MDflDECG5nQQDWTbsDjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10490
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:festevam@gmail.com,m:marek.vasut@mailbox.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:frank.li@nxp.com,m:festevam@nabladev.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[victor.liu@nxp.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nabladev.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D86D39CCB1
X-Rspamd-Action: no action



On Tue, Jan 20, 2026 at 08:19:30PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> The LVDS Control Register (LVDS_CTRL) register has an HS_EN bit that allows
> the 100 Ohm termination resistor in the chip to be enabled.
> 
> Add support to setting the HS_EN bit when the optional property
> "nxp,enable-termination-resistor" is present.
> 
> The motivation for introducing this property was a custom i.MX8MP board
> that was showing visual artifacts. After enabling the 100 Ohm termination
> resistor the LVDS signal quality improved causing the artifacts to
> disappear.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v2:
> - Rename variable to 'use_termination_resistor'. (Liu Ying)
> - Remove clearing the LVDS_CTRL_HS_EN bit. (Liu Ying)
> - Use dev->of_node. (Liu Ying)
> 
>  drivers/gpu/drm/bridge/fsl-ldb.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 5c3cf37200bc..7b71cde173e0 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -92,6 +92,7 @@ struct fsl_ldb {
>  	const struct fsl_ldb_devdata *devdata;
>  	bool ch0_enabled;
>  	bool ch1_enabled;
> +	bool use_termination_resistor;
>  };
>  
>  static bool fsl_ldb_is_dual(const struct fsl_ldb *fsl_ldb)
> @@ -212,6 +213,9 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
>  	/* Program LVDS_CTRL */
>  	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
>  	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
> +
> +	if (fsl_ldb->use_termination_resistor)
> +		reg |= LVDS_CTRL_HS_EN;
>  	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
>  
>  	/* Wait for VBG to stabilize. */
> @@ -340,6 +344,9 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	if (IS_ERR(panel))
>  		return PTR_ERR(panel);
>  
> +	if (of_property_present(dev->of_node, "nxp,enable-termination-resistor"))
> +		fsl_ldb->use_termination_resistor = true;
> +
>  	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
>  	if (IS_ERR(fsl_ldb->panel_bridge))
>  		return PTR_ERR(fsl_ldb->panel_bridge);

Applied to misc/kernel.git (drm-misc-next).  Thanks!

-- 
Regards,
Liu Ying
