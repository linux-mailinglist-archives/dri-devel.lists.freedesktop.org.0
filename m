Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E20B134EB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 08:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912CF10E335;
	Mon, 28 Jul 2025 06:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="Sukd44TU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11020079.outbound.protection.outlook.com [52.101.69.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C117710E335
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 06:33:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFWHrRFk+5u6d7gUG15ptiQlPHs52AnVg5POzUqMpT9p1K3482lk0QrpqSHn3Z+lzUKmLMeY3AFA3LMiNISz8SFA65ziPeQaOeToiGHgGcd5O066a+5jQRz2P7Kuddx5/NYeQn1WYXCJzctnvPyj/9jVed9aygPg14HjslL8ivjM+8GHeABsBM0++2aZ43PP/OIXgoF9RuxYucK1BUFNp0PNtxQXwCut7VL0a5OmCiaCj7YhtzwhelvwPnpXXhu0iPIoLsZdyn+eTWsMY8/CzyiOmCAOwcHiB5q8i2VSYuD74NsIszR/ACEQmnaniaMGYHdvqbDalVLGvi6n76rZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZxAnS9hPnm5itigStgwqVXvrn55VwmvYrb7VcYMn34=;
 b=KwSiNyEo/VGwO9wJcGGb3Ox6bpnWbGKteDa75WrcW1TvP4uFZjsjx7lYKQqaYmeDOXUX7jUtrqRLk6m/Hndw76iDvOyQZkWAqY8KnVWEBbWL9elP1gjdbDLH/cBV8vxwe9uD9V9HW6heUM3QXUlRLt7jHSmO2zR95Nee/Abrh4HNO3/HhNSlUxguhqQGqF/+0U3A7m/4I5ITCerKJFWcmr1ZJOdqQ8UyXRsX+SBSQ7+1cYxoLG25Wu5KaEJbbZ7k7zWjFL1isWZfK8teWR6uVKVhwTs640sE2I3HhGggslmY+tXN5hse1DiRFZLsBfJMq07p+YF5OZct+gSbQp6BPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZxAnS9hPnm5itigStgwqVXvrn55VwmvYrb7VcYMn34=;
 b=Sukd44TUn6a81mcgH4A8pby46boXZLJVjKa+sux4eIChNmteeQ1mWEmek06hsUqWmQX7HuNVIRmQR7WJ5T3SAtv/pPNjgD2cgEJ1HO7TbMNo/eRxl0rMLbrTmyddQM2yNiisRaRYvE5EMJEquMZAWRVxsdyf+D1gDkaIvQWrPtGq2VnjQuS2WjBuogaeQvkFu9YciLUigOUwxkSFsHWXJZYMoBPCTMD0n4I8xjE1LRdkMINylqhw/vv51MLE1VoUk9bvqpt/EIw04vfL8v7OsmwHj5VzPPQi3PMIYc29aGzWv7A1V31vLLmc93OmiGP/I9o0MOyeuTZGsT4wVS8yKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by DU4PR04MB11410.eurprd04.prod.outlook.com (2603:10a6:10:5cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 06:33:06 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.8922.037; Mon, 28 Jul 2025
 06:33:06 +0000
Message-ID: <ab112eef-e9c1-4d26-adea-69cf85634413@gocontroll.com>
Date: Mon, 28 Jul 2025 08:33:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: backlight: Add max25014 bindings
To: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 Pavel Machek <pavel@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>
References: <20250725-max25014-v1-0-0e8cce92078e@gocontroll.com>
 <20250725-max25014-v1-1-0e8cce92078e@gocontroll.com>
 <175345006903.1002291.4212198267952446360.robh@kernel.org>
 <03096180-1e33-4dd0-b027-cc18a5010e46@gocontroll.com>
 <20250725195143.GA1735522-robh@kernel.org>
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20250725195143.GA1735522-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0022.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::20) To PA4PR04MB7630.eurprd04.prod.outlook.com
 (2603:10a6:102:ec::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7630:EE_|DU4PR04MB11410:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6ff130-56bb-48e3-9c9d-08ddcda09c71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eURseWtDYjV6dFVVK3B3L0oxdWdNeXVzcTdFV0luRzYrVkdseThNT3lYZUE2?=
 =?utf-8?B?VXlLbXdWdTlMc1pvbytkaTlrM09aOVdHNCtycFgySWFISjcyc1dkZ014cDNN?=
 =?utf-8?B?MGFyZmVsSTlBbFJ1UzM0eTIwU3NLcjhKNE16d3BqL0NlUmliaDZkc0hwOGNv?=
 =?utf-8?B?anc5NlBGOG00bkhjN1JCNVMvOWN1RjZSNkFkZGhnMWVNY0JKV21INFg0dVBT?=
 =?utf-8?B?S3NaekxFTTlFaU5yZlYyNWVpUGY0SlRMRk9zY2tjanRQTVZrUDdYQ3JnSmQ5?=
 =?utf-8?B?VjZlT2krTERDQnIvNmNmcUt0WVVlYXk4Q1Q0TlYyV2xTeC85dUlLbk5Wdjd4?=
 =?utf-8?B?WnZKRVJKWkR5K2U4bG9MR2lKU0hsOUhCQWtWRU5UMlh4ekZmUnFMdU84R1RQ?=
 =?utf-8?B?am00dVNrdUFSZG44clhrNGtaRUdYdnV3cjFCOHA1VHM0VmlnYzIzNUpFV1pk?=
 =?utf-8?B?VWsxaEo5UGdsU3U0WmV0cTZ0Sm54d1U4R2c2MTZjaWNtcVd6UFFwS1E2ZE54?=
 =?utf-8?B?eFg5ZDNTWTFyR0M5Sk0zMWJmL053MUxwRnd1RFE2dFdXdW1ZVnVhUjJ2ZEg5?=
 =?utf-8?B?cnJJYXdkYTRDVHdUTFhSek1RSVU3RU9WWjNPazQvTjhqSU96Q09kMTA3ZnJu?=
 =?utf-8?B?VmNkVmxpWHBsYldWdVFlSXliN24ycm03Y3EzUS9DSGdCUWtzZUVFTGUwN3E4?=
 =?utf-8?B?MlNOeFhxditpdGJUYXZSWVpUdy9GNUs3d2R2YUxWL0diQkZ1ZXhrbGNVM0lF?=
 =?utf-8?B?bCtqVERRMW9ua2x1NmtnUndKaGJVaVFZQm9DR0JGV2NTY2d0eWFGaWV0RTN0?=
 =?utf-8?B?YUJPZmpnVCtFVEI3ZFR2US84bVVaYXpRM1FraWRMZFBlUEV1aFlnMno5QzB0?=
 =?utf-8?B?Vm1qT1NWRG1zNnRNL0JEZmEySEk3NlI2SmxzOVd5cnVLR2IxZE9xbi9vMWIr?=
 =?utf-8?B?NitwcDA4ck1iTFhRbDVMaSttdUZ5SjV2YXpUb0NBWHhMZU1JSU1vT2tiNExP?=
 =?utf-8?B?OGh0RDNPaGM4enRUMFJMWnZOT3RMN0cxdzFLRXhFNVFTM0pEK3o4SkJWNis5?=
 =?utf-8?B?bEZsY1RQZzBnSTdTZ0VUMnU1TGpwQUpqQXJrditCMUt2Z3NTUWxBK0JKc2Zt?=
 =?utf-8?B?eG5RenR0TUVQV2NxZ0UrZHZzTWdZT1ZmUGhRaVl6TjdMUGk2TzNoZGFhVmxH?=
 =?utf-8?B?Qm9CR2JKRGtiQzYwKzl3ZGlGbEtXVUpBYUlBNmJOelJzWHQ5ZW5DU0U5RFRz?=
 =?utf-8?B?Tml2TmVhWXdsSTZkWnFCUjVaRjVkU2c2US91SHBtbzl3UWxlejFtNEpLK1dj?=
 =?utf-8?B?dWhEOEJhM0EycFFjR3RValFjOVVwL2hmNW9OdDczTDFYQWpZRWF2ayt0OGtx?=
 =?utf-8?B?SnVqbkRrRWlCYkZoWTAxVnBrMjJVWjAwQUtqanV5M3JVWUVnQWF2bElsSys4?=
 =?utf-8?B?bU1LN3ZJVURhUXVCSWYwUWdxd2s1ZjRqaWxDM3ZLZlBmekhTcURMMUY2ZXE3?=
 =?utf-8?B?WlZwMjYyME9leTQrdjZtQjhZRWJaZmtvRFVadVJiU0ZaWHcvcUIvUk1LWU9G?=
 =?utf-8?B?KzI5Q21mdTBqbDhPSCtKZCtVVEUvaUpMa05SbjZSYm1Zb3B1bHpFOC9XdXJX?=
 =?utf-8?B?UDdLeFpCNCttYUo1Qng5UVdJRUdVSEpkR1k1cXFtUjBiWUIxU2hLdlNlNElu?=
 =?utf-8?B?aHFoR2hndlFYZUdtRHo2clRnOW12eGhUVDR1ZFlsODhsRDJ1S0ZTZmMyYXNq?=
 =?utf-8?B?WmpFQzZBUm0rQ0thSGpSK0RwTHFFTzd6WUdaNVh6WXBIWklBSDJ6QlBNNTJw?=
 =?utf-8?B?TmRkYUZnd3J3bHVaWFFNTXF2WmtoRkNCZ25la2dXSzJ0a2RnNVB0V1dJRUFp?=
 =?utf-8?B?ZWd6aTg5dTJhNXNITXdsdUt3Nm5qWC9BY3hHTEl1RUprcXhxRWREVXh3bHVD?=
 =?utf-8?Q?KC/ZhZr82ko=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7630.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmt2Wm9Rc2NYWG9SMXdiMkMyWFJ5L1JuU1dLNEJFeGVhcnByRk5nd2xhZnhZ?=
 =?utf-8?B?YnRTNmp3cTlTMUh4YnJ0SXowUC9HbmpFUTFVK1o5NVJFSmVkMW5nUGhVS2ll?=
 =?utf-8?B?U29DUHErdTJDRDhnZmhLSUpFWmZISGdhT21RWnRRdUswQzBkaFptenV6VUZi?=
 =?utf-8?B?bWw2b2doZDhKdjVjS1BBYjJoYjkxTlNVdC8xUW9sdnA5YTR0Y1diTHNTWDVk?=
 =?utf-8?B?MGF0aFNtWHd3NDF3Z08vbzJFNW5CTWw0Sjl5cXhMMlhlclZ4eW1YTW5KTjZk?=
 =?utf-8?B?eXVaOWtlbjVPakdYRXpSSUluOG1mbi9LY1l4eDlNMmJWL2F1ZnhhYlpCSkNF?=
 =?utf-8?B?NjgwN3lxTjFzcmtwR0ducXdZaEZOcGw4TDFSQW9CaGU0Y2RVSExqcGtNSGk1?=
 =?utf-8?B?cUp5Z0JXOXBTWGFJTXhZQUI4akxHejMzbjdMN2x3UW5sa05MeTU0emxVYVpz?=
 =?utf-8?B?QkV4amtYQzFOSTNIZEVFR3NUTXlEcm5nSk41MUtnZVljekV6VVJ2bDljVTE0?=
 =?utf-8?B?OWttNHpFOGtBekc3ZnJJS0Q5UWxYQ0Zuc2xSTzUxRXo5Wk9OSGsyc0taaUJi?=
 =?utf-8?B?YjluM21jTng2S2JkYytMcnM0MkcvVUplb1BkUUYwZFBnUWtzYkN4ZmpDUVlV?=
 =?utf-8?B?VEYybXA0cW80VDB1R0RiYWdzQTVOVzg2Qk42T1BLWTNqZzZzMXFuT1p4cUc1?=
 =?utf-8?B?ZHMrWXZqZXpKRDdBa1psMGRGR2J1L0o3NXZHMWNZRjZBOFlGdGpaNklCZ00x?=
 =?utf-8?B?b3Y0aFpvUXVGN1FJWkJibzUwclNvVVB5UTJ6MWFqeTFQSXo5VVg1S1Y0eERW?=
 =?utf-8?B?eS9mYmM4TTRKMEJNV1JSaGlad3dDTzd3T3B4V3JlMStnK014VlpvdXlsOFM3?=
 =?utf-8?B?Tng0NkxnL3lwSzJzU2grR0pESDJtcmZlUEV2NnRkUS9qRGNiT1VYUUsycldw?=
 =?utf-8?B?TVoza3p2R21BQWJQTEp2L0RuMXVMbk1ZdmVsWkpEWmlrbVBBeDRFKzE4RU84?=
 =?utf-8?B?RHp3NjczcHN4djRaREpkR3ZFaVVENnlITlc1VFhvcjl0bWVwc2toOFQ3dkc3?=
 =?utf-8?B?SmE0MFUyc2t0Q3kzQnoweURCV2EvT2srcnpWZ3FyazBWamN4ODZJYnRrdDAw?=
 =?utf-8?B?cnRGRllBNGYrVkdNU0N6MXp3c3hTemFUcHFOV3RTdFB6SmUwRkNJRmJ1U2o3?=
 =?utf-8?B?ZmJBVk4rUGpxSnJ2UU5oWkwxZVJnVDQ0bm9OcmVIb21FVC8wQkM2N24raHFP?=
 =?utf-8?B?YXdDVFNRV3VremdVT2JSTXQyaGtyNDgxWloya2dpb1VuVFgvbzRPaytOeGd0?=
 =?utf-8?B?N0dUd2ppazF0M0Jtb1B5U3R0NVhSN21SM04vaDY3bE1HYlFLTkV1bHFKZEVU?=
 =?utf-8?B?L3dqd1NWVE9vbUo2REIrS3hqbUV1eVZab09LS2YraUVKY0xZZTIvcnFpa05S?=
 =?utf-8?B?ZXhTRTNzbHRFUFRWR2FoKzcyVGNUQyt2dElnK1FBU0t1Q3kzUGlKeWVwVlFF?=
 =?utf-8?B?WERhRlgyYzFZcG1ld3BHRkJXVW5YTXV5RDMzL2VUVzRXTkNRRUdDN2s0Q3p6?=
 =?utf-8?B?Z3Y4SjYzUUt0aGpLYUVtR3BPMVlsNnNtalRYTWJsY01TRlVJQ1doZCtNSkxN?=
 =?utf-8?B?VEZrOGM2bGRVV2htVzZqMVVJRGU1QkpSNWNrOE5HM1U0N2sxMjVGdnVIQmdS?=
 =?utf-8?B?UTBWSmlXdHgzRDhOYUZSOTFTS2pZOU1wVkUzZCtxcEZEOXcxOENyeU5FbDVZ?=
 =?utf-8?B?VjJpcFN5V2JaSmt3ekRFbUpsYWJNUXo5RW96bWVZT1ZwdFpRYkJFdDJNVm1W?=
 =?utf-8?B?Ry9POGZkZklUam5LbkJXRCtranhVZ0pNN0p0NXVRSEZ0Ui9NTGhNZDVzclNq?=
 =?utf-8?B?N3B5MGI2SFBFK2dlNnJZYWZDdjZULzB3K1VnOWZEMHJEZFNyRDhTSVNLbHQr?=
 =?utf-8?B?TlJPbmRrZHBYMjBCVU5HelZLS3piR0VSTTlXWHhYL045aGs0NVNtb1hsNGow?=
 =?utf-8?B?KytNSnBVTWFhQkJYTHNVazdpQmZ2N2tUb21QZnowcmdFbTlTYzVCZnF6ZXFT?=
 =?utf-8?B?bllRNlBaQ3pRMkprZUxCdkdMcXJ5V1puTTU4NHNUcGpFZllIbW5HZ0QxejBm?=
 =?utf-8?B?YnYrU3MwRU1vdklYZ05LMlIzV2JnQVBCZlppbW1QQkpwVFkvclpWMStUTlRT?=
 =?utf-8?B?SFllcm9CQy9Ubi9KQlBBZ2k4ejZLTVNZUElMQTZ2Q3MyVW5JRjhRSlpDcklY?=
 =?utf-8?B?Mlg1d05sWEppeEVISzFwVDVnWElRPT0=?=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6ff130-56bb-48e3-9c9d-08ddcda09c71
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 06:33:06.1608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8POtSvwVwy9G8+eSyd5R9diKPlzzDhlrQrUHIgbxlc/WKBk3K7aN656tj5Hyn77eEE963vNn+vUbzIwNAVaCRpWR+/8SAAnBYyZYvTWtp4k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11410
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



On 7/25/25 21:51, Rob Herring wrote:
> On Fri, Jul 25, 2025 at 04:06:45PM +0200, Maud Spierings wrote:
>>
>>
>> On 7/25/25 15:27, Rob Herring (Arm) wrote:
>>>
>>> On Fri, 25 Jul 2025 13:09:23 +0200, Maud Spierings wrote:
>>>> The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
>>>> with intgrated boost controller.
>>>>
>>>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>>>> ---
>>>>    .../bindings/leds/backlight/maxim,max25014.yaml    | 78 ++++++++++++++++++++++
>>>>    MAINTAINERS                                        |  5 ++
>>>>    2 files changed, 83 insertions(+)
>>>>
>>>
>>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> Pretty sure I did that, but I've never gotten those tools to work quite
>> right, I'll look at it for v2
> 
> What's the issue?

I'm on arch, and I believe there is some specific version dependencies 
in some of the libraries used, so I have a venv for doing kernel work 
but it still doesn't seem quite happy sometimes. I may have just messed 
something in that part and thought I did it correctly, but didn't.

I think I have it working properly now though, just did a quick test and 
it worked as intended.

