Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B5FB26B1C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 17:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F03010E8A5;
	Thu, 14 Aug 2025 15:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hFd5Fkjn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B72C10E8A4;
 Thu, 14 Aug 2025 15:35:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLxOYYDXmr1YgfR+T31/UufjJsAwvD0UDHORhHixFSMsj/gDligm8wzF5xAXzqkeylPOTbzShuxaXykaSmT6N6metFl1Okg2Qxw+G7crr3w8aE/Z0Ff/gB1674oDtnncH+g+FPsTRs7PSc8pZf4Gr4OpHvzimt2M4ZjTjria9Yo8FfIfwzWBOY5Rg35NbbuI6QTwbVlmaqmxrRSIbSNwBoDBk9s15LIY06bExxthZy91QRfTKaQ1RdKWMUSDQF192UT0iQcubZiMe+bxMQyt4t8P6E+EW/ErSqiDARTbHKsur/wZB5v63WKo9or2NtT7iTSouZN+RxlpjulwdZD8pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=396QtFzlkwpolbl1cFtqnDX7ckncSSmY8OFaDqt0qp8=;
 b=WoYU61wGS3GIbxGEU+JRUHs4Xy+qLNxj8U+ZtAWEmb2DsmOPjG/GWEP0TkzDaYHJzQkxQpd86Vn9bWjTUSdX74DA7occ8D8NNygS4/clHDb9mgyalY+1G8BQTwduGPFxCMK+QzwhY/YCXqOpZMBs9znVE2IQGQOqYpXby2hc/+dn0H7PWDvE9ZiEvSOxpFPYV4CWQJZ0JfEO76o7hoR2T/XK7XZjJ8gJoXIIjL7T2sq88Lz1vdiTMBWlG+iNO3ft23FvaH7lO51i95Dvj8D7nYqgv+v4N/0PvNXdkN+b7o8s9PGAnCgm4BMgX44Do2lO0+WUIB0vkuOXVg1hTxLJ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=396QtFzlkwpolbl1cFtqnDX7ckncSSmY8OFaDqt0qp8=;
 b=hFd5Fkjn3QyXdcEUpWPIIm0cgKv0Y/gSS+uqaiCQg+1svlHxI4EVwgI4L1Ulap/fAE7WQBRx4nrpLgkjpvQxHmdcWSxd61JibcfND4wr2yOw8aPBq6u+bdUg5Wu0olR+WilvVphd3GwAR3hBsdJ4KemRR24Y8stSMLyMQc97OeA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SA0PR12MB7464.namprd12.prod.outlook.com (2603:10b6:806:24b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Thu, 14 Aug
 2025 15:35:29 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%4]) with mapi id 15.20.9009.018; Thu, 14 Aug 2025
 15:35:29 +0000
Content-Type: multipart/alternative;
 boundary="------------ZXyKBMF3T8ug5PAaQy54QfP9"
Message-ID: <6a3acd53-cb93-44d5-b950-768f92914e85@amd.com>
Date: Thu, 14 Aug 2025 11:35:27 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/amdkfd: disable HSA_AMD_SVM on LoongArch and
 AArch64
To: Mingcong Bai <jeffbai@aosc.io>, linux-kernel@vger.kernel.org
Cc: Wentao Guan <guanwentao@uniontech.com>, WangYuli
 <wangyuli@uniontech.com>, Huacai Chen <chenhuacai@kernel.org>,
 Kexy Biscuit <kexybiscuit@aosc.io>, Zhang Yuhao <xinmu@xinmu.moe>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250814032153.227285-1-jeffbai@aosc.io>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20250814032153.227285-1-jeffbai@aosc.io>
X-ClientProxiedBy: YT4P288CA0032.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::7) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SA0PR12MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: 9771d867-41b9-46c8-70e9-08dddb4832e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|4053099003|4076899003|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDZxMFJ5RjcyMXVyajBaSUhhS0pHU0l0L0YxbkFRWlZjN0pFRU5BODFlMmFx?=
 =?utf-8?B?cS9QOVBVUnFQRklKaElpSXBJYlVSeTRtSE1FMjg0L0NwbXp6ZEIvN1lRUUQ5?=
 =?utf-8?B?V0piQXlzcTFCbEhmOXd0SzRkT0hqa1F0TzhRYkU4am9uRTZPZGtsNUl1NGE3?=
 =?utf-8?B?SlZVYWFJZ0xNT0xhVmpNTjd5aXpqSnFmQ09XQnhBcFBDRW51L1ovOTFsRGIw?=
 =?utf-8?B?ODZyaDBQZzhFY1VFMVUzL0doQmlQL0NXdGVyT0RGNDkzVit1VTBTZkpaNWZ6?=
 =?utf-8?B?VXlxQktCQTViTFdKZ0wvVzZ3RE5hUExBZEc1RHlCcmN1b1V0clNaeWhweGE1?=
 =?utf-8?B?Z3NaeURlMEIyNXc5cVUzTmd5ZndNbE5qNEorOVhhNUxwbG52dmJrcWZUU09P?=
 =?utf-8?B?YjBBZWE1QVVCVmRtSG9sdmtOOEkvUG0yWXVYT3ZaNlhjREdJWnpRWk5oOC85?=
 =?utf-8?B?bGhqa0JhRERTUDdxT0ZUeG10b25BbmZmaXNVRDYxTlkwMVdZQVRJTW8vaWpY?=
 =?utf-8?B?WHpOUU5ObjR5ZlR0Q3lmRUZhM3ZBY0R4RUQrMWVPRmJtQUhONUoxbkRTSERk?=
 =?utf-8?B?WXJ0TDhRTHlSTGNOTGZjaFdlRTM4RG9jM0lLME9RckQ2U2w4aGc5MWlsKy8w?=
 =?utf-8?B?WjkxSVpvT3N3Z1ZpNlRhUUJhdGlmUFNadjhNM2JkL0p3cjljZFFhSVA1ZVRU?=
 =?utf-8?B?L3I0eVBQdWxrb3l4dEJZbGJXcW5nYStic09MMnVVUklMamhBdVFPSGdVZ01G?=
 =?utf-8?B?QXg0OTRGb2lsaStqa3ZhWG1ZMDJoaVp2SnlyZU1zQmJSaTNhY1FwdkVsL2J2?=
 =?utf-8?B?UkFndmNIOTZBS055dHhyZEUyRDQ0L3NMMTNPSWlGbTBHaWZXTXdyQmNsRFhS?=
 =?utf-8?B?eDFvcUpmeW5idjZKbmRhVnBKWXFyZ0RBbmdpRWIxdk43eXNjdGM1TTJzaWJ5?=
 =?utf-8?B?MlpyK1ZWTU1EV3BjcEkxRzNXWFAxU3lrakU5bkhqdnhxSWsydEcxU3V3azYy?=
 =?utf-8?B?M3o0UC9tUS9YdTRoV2E3a2xoSzlSRVhnVUhnYmZSbzlYUk9IRnpGaEVmRjRj?=
 =?utf-8?B?N2hXVUtodWhPcG5OYmdYLzY0RC8xRFpKZWowaExzdW1MeDNNMG5iS0kzQ1M1?=
 =?utf-8?B?YTFHZHBOT0g1VXFSQVZaTWkyR1JvcklIcWNNRG9ZZktvSFRUL0Vmay9DU3Jn?=
 =?utf-8?B?ZWlqTkpMY3JjcXBRalIwbWh1TGpwZmVZcUozSDhORWZLQjhoRHk3N09Va3Rw?=
 =?utf-8?B?N0cwcU5CUE9GYUlyRFgrTmpDUHYrRDg3bWsyTFdBVzFBZHM2N0NyaFA5OHhI?=
 =?utf-8?B?cDVEaW9MR0l3R0thY3N4cVFkaUhoVmZGOHF2NGIyN1NrZW84TDNpOXBaT2t3?=
 =?utf-8?B?ZnFlYXNHckNIK25kT3lHV0VUd21GTXJKZEJUSDRtVXl5K2hIZDVJS3ZCejdW?=
 =?utf-8?B?K1B0VlJncHE3ZHQyZ3M2ZXAyM0RicTVsQXBRWHQ0VzVMRXp6d28vVjhxZmxU?=
 =?utf-8?B?KzE0cTl1Q1RMdUVoODZEbStlMEJOdlVXWStJbFdTOURMYms2MjVaQWJkRVNv?=
 =?utf-8?B?M1hPb1FZc1poTjc5cHk2cVpmaVlUbkZEa1hNQjRpRDUyejk4Sk02VEVhWXkr?=
 =?utf-8?B?UTFwckJTZUg3YTc2UlJkc0t1NE5RaktITHR2QmJncFkvT1A5cE81S1lxOGZV?=
 =?utf-8?B?NC9UQm9YcmRXZXVBUCsrbHBTd0h5bm93SkZxZWpXQXNlT25xSW52VWpTTGdh?=
 =?utf-8?B?Rlcvd3MycERIL1ZMMG1ma0I2U3JGYUZuVE1XbGUwSGNTMmk4SHFqSUpTUFpw?=
 =?utf-8?B?TVlYVWNvWS9TU2JWT24rZ0tCbVpwb3htSUxIdFpZSi9HdnZWbzVadUVoTmZm?=
 =?utf-8?B?aUVUa1dGVDFXVVAyczBJWGFyY1RFU1RxakpOWCt5SkR4NzdKNXJOUGc2V0FY?=
 =?utf-8?Q?0Qm6K7cZP54=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(4053099003)(4076899003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDF3Z29KM0FDYkM2b25WdWJOL0NBaklITUpXTDhvT01GNGM4NlVYRTBod0VR?=
 =?utf-8?B?VWk0Y3RBZ0ZEcHBvZlk1NVYrQnFySHpJaEkvYzF6aUw0bVFRZkF4djhoNHVT?=
 =?utf-8?B?M2lQNWtFR1BWOVNwT0o0cGF2RmdRNGpmSkRSZGtWdGNPenQwOXF0Z2RTT2gw?=
 =?utf-8?B?dHo1U082QmQ3Mm9jVjBUeStCQkZCcTg2STJnOFNYTUxUOXVwTCtmMGxCbHN1?=
 =?utf-8?B?QUFBYmlKODEyUjNXeG4rUEJZZXBDNG1VY1h4S3ljek1YODZMYkFuUDhxaklX?=
 =?utf-8?B?N09zVnRRQkR4ZkZVcW1GZnMyVmM5UjZkNTFGTlRrR2U2Q2p5NHZMR0JRT1BB?=
 =?utf-8?B?UUlLVjRuMHBYQnFWT3BuVXVGTUZ2SmJRbmZNY0lPKzMxc2tSdjNXYlF2VDlW?=
 =?utf-8?B?WjlpNC9JRi9jZkZYaHJVelJYckdPalY2TVdZT0tzeW1OMlRzZEhUUkVZOFBZ?=
 =?utf-8?B?SzhQcWszUHNDSDJPMUFWR1pVd1RCRUJCdzdxWGJZa29mcjBvZGpBVVpHZ3Fa?=
 =?utf-8?B?UE1kQmlLWDNUN1dacEhBTmhOaXNBbDNPU2dSTG83aWpsd1kvMDlDblgwL0RY?=
 =?utf-8?B?TGNVVkE5c3U0L0VJSnRPTlpBVlVlYkJWSU5MTTRhcHphNmZ5KzdTeWdRMmlw?=
 =?utf-8?B?SUhoanFQOTBUZXJjMGExclFINEVtdHF2SVFVK2N2MVozWS8zdVpISDB6czJW?=
 =?utf-8?B?SVB0TUpHNjVVbzBsbjVoazFhS0hldnBNUGVoUEtva3dmWElCRlZjZkx6T2pD?=
 =?utf-8?B?MElkV2YxUGVuQmxHVTNKekI3VnZyMlV0djNFVVBETUFzM015VklsLy8rMWd1?=
 =?utf-8?B?WTRPK1RBbU0xYTlSSC93a0cwY0c5azYyczBrQ2NvWTRIalFkbmtMRWxDbWxZ?=
 =?utf-8?B?emNuRXNIMzZ4MUMwODVSeHBuYzRsNkhZNWc3OFd4TnFFNVBxa2s3dys5bzNZ?=
 =?utf-8?B?VFp5RWtsQ3BvazRlUUhTSUlvdnhyY1Z1WDIvWUFMMDNWbUtMbEozOWM1Q0Qy?=
 =?utf-8?B?SW1PS1MzWFN2QW9MSVNqTm02UHJYNk40SlBMdjdNc2dYM0VSMEp0c0wwc0dS?=
 =?utf-8?B?TDZUS1NaWkxTcWMvZ3dEOG93RTlKSkszR2s1UmJHcmJ4SGpKa1psQnlWVXlP?=
 =?utf-8?B?MThBV0FUeUEyNld5T3c2dFFoSFc1U1FEQm8vVm9PYytJZXk3QlBwNms4WnlB?=
 =?utf-8?B?OTFzOVUzclZmNVFzQjNEaFQ5a2hFcUdrZTAySkJpUTB2dGllOUFld2ZqZFZF?=
 =?utf-8?B?UVkzK2FXbFdLVk5YRklnTU5peXp4aU9sVHh4WVlISXhlVm1NTFFzMHdoQXdk?=
 =?utf-8?B?bG5pWU0vWFRBSTdkZEJobGdnNzVTcCtmRzBpdWx4bDdrWHo4Z1o3cVgweHFZ?=
 =?utf-8?B?VldMR2lmakpwMFIwbkRZTHZDOHF3R1NZdDIwc0w3MGp6ZkpBc0MvS3lxM2E2?=
 =?utf-8?B?clVvZFNPZUVSTDlhelQ2dHRKNXdUSlN0cmgxdUgvbFh3YXBaQ1pYc1lNYWI1?=
 =?utf-8?B?L1g5VWd1Qmg4TmU4Q29xZW9MM0RxSjBwZ3NNZWtyTzYrNzRacmpaaFF2b0Iy?=
 =?utf-8?B?cDdBY29KK2VhSzFhdGZ5VHJiejZ6NHNWV3E4b2x3QzhKYVdINFZSaDRNSXE0?=
 =?utf-8?B?U0JtaHkwV3VFWS9JYTFYTE03b1hET25aUlVNck5zWCtoVWJmV2Y5WDcrTTRh?=
 =?utf-8?B?Q0lhUXdLTUEreElGbS94TlVQbkl2M1VvZGVDK05YVTF1end0RGY2d0h3d1B2?=
 =?utf-8?B?bVNuMExKdTdDVjRjNExaWDc4Qmpxa1NTRWs0ZVU3cDcxQ0tEUi9lVWt0TUFJ?=
 =?utf-8?B?dS9jZzNxeVJFS0x3NVA2UzF2bUdLQTlqOWJLRFFFVSs2TS92QlBlQng0Zmpz?=
 =?utf-8?B?amlReHpKL1JtTVBBR3JUYlZYdTlqWUF6eTJVTHk4NFZRbHp4YWFFQjlMc21P?=
 =?utf-8?B?ZlZyYUw1ZnlndjZROFdOWEtvY3c3cEJIK3krMVI4bzFMbUpyQTUwekZrS2RQ?=
 =?utf-8?B?UXZEQlg2K3lXenkwb2dBcFJDVmNDTVFFTjFwa0gvL0g5SmRjVnEzT1p2WFFl?=
 =?utf-8?B?d2VlU09tOVk3cnAzVm41dCtMT241am0wKzdKN053SzRHWkVxZ3kzTUZtdXVx?=
 =?utf-8?Q?z7DuFEltJxlO1hw7bFSBKxq7+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9771d867-41b9-46c8-70e9-08dddb4832e9
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 15:35:29.5799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7ppMMLgIL93JfutxLTUcjwWia5awOkymZCesvnG0T14ltwplKF98eE1I6cMDFc2ZibfrMu7lKo+7cZWt5frIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7464
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

--------------ZXyKBMF3T8ug5PAaQy54QfP9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On AArch64 we also noticed problems with HSA_SVM due to virtual address 
limitations on our GPUs. Basically we can only use 47-bit virtual 
addresses for user mode pointers. AArch64 uses 48 bit pointers with 4KB 
pages and even more with 64KB pages.

It should be possible to work around that with "ulimit -v" to limit the 
virtual address space used by the application. Therefore I'd prefer not 
to disable HSA_SVM outright. But instead maybe add address bounds checks 
in svm_range_set_attr.

LoongArch seems to have a different issues. I'd be OK to disable HSA_SVM 
on that arch until more information is available.

Regards,
   Felix


On 2025-08-13 23:21, Mingcong Bai wrote:
> While testing my ROCm port for LoongArch and AArch64 (patches pending) on
> the following platforms:
>
> - LoongArch ...
>    - Loongson AC612A0_V1.1 (Loongson 3C6000/S) + AMD Radeon RX 6800
> - AArch64 ...
>    - FD30M51 (Phytium FT-D3000) + AMD Radeon RX 7600
>    - Huawei D920S10 (Huawei Kunpeng 920) + AMD Radeon RX 7600
>
> When HSA_AMD_SVM is enabled, amdgpu would fail to initialise at all on
> LoongArch (no output):
>
>    amdgpu 0000:0d:00.0: amdgpu: kiq ring mec 2 pipe 1 q 0
>    CPU 0 Unable to handle kernel paging request at virtual address ffffffffff800034, era == 9000000001058044, ra == 9000000001058660
>    Oops[#1]:
>    CPU: 0 UID: 0 PID: 202 Comm: kworker/0:3 Not tainted 6.16.0+ #103 PREEMPT(full)
>    Hardware name: To be filled by O.E.M.To be fill To be filled by O.E.M.To be fill/To be filled by O.E.M.To be fill, BIOS Loongson-UDK2018-V4.0.
>    Workqueue: events work_for_cpu_fn
>    pc 9000000001058044 ra 9000000001058660 tp 9000000101500000 sp 9000000101503aa0
>    a0 ffffffffff800000 a1 0000000ffffe0000 a2 0000000000000000 a3 90000001207c58e0
>    a4 9000000001a4c310 a5 0000000000000001 a6 0000000000000000 a7 0000000000000001
>    t0 000003ffff800000 t1 0000000000000001 t2 0000040000000000 t3 03ffff0000002000
>    t4 0000000000000000 t5 0001010101010101 t6 ffff800000000000 t7 0001000000000000
>    t8 000000000000002f u0 0000000000800000 s9 9000000002026000 s0 90000001207c58e0
>    s1 0000000000000001 s2 9000000001935c40 s3 0000001000000000 s4 0000000000000001
>    s5 0000000ffffe0000 s6 0000000000000040 s7 0001000000000001 s8 0001000000000000
>       ra: 9000000001058660 memmap_init_zone_device+0x120/0x1b0
>      ERA: 9000000001058044 __init_zone_device_page.constprop.0+0x4/0x1a0
>     CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
>     PRMD: 00000004 (PPLV0 +PIE -PWE)
>     EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
>     ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
>    ESTAT: 00020000 [PIS] (IS= ECode=2 EsubCode=0)
>     BADV: ffffffffff800034
>     PRID: 0014d010 (Loongson-64bit, Loongson-3C6000/S)
>    Modules linked in: amdgpu(+) vfat fat cfg80211 rfkill 8021q garp stp mrp llc snd_hda_codec_atihdmi snd_hda_codec_hdmi snd_hda_codec_conexant snd_hda_codec_generic drm_client_lib drm_ttm_helper syscopyarea ttm sysfillrect sysimgblt fb_sys_fops drm_panel_backlight_quirks video drm_exec drm_suballoc_helper amdxcp mfd_core drm_buddy gpu_sched drm_display_helper drm_kms_helper cec snd_hda_intel ipmi_ssif snd_intel_dspcfg snd_hda_codec snd_hda_core acpi_ipmi snd_hwdep snd_pcm fb loongson3_cpufreq lcd igc snd_timer ipmi_si spi_loongson_pci spi_loongson_core snd ipmi_devintf soundcore ipmi_msghandler binfmt_misc fuse drm drm_panel_orientation_quirks backlight dm_mod dax nfnetlink
>    Process kworker/0:3 (pid: 202, threadinfo=00000000eb7cd5d6, task=000000004ca22b1b)
>    Stack : 0000000000001440 0000000000000000 ffffffffff800000 0000000000000001
>            90000000020b5978 9000000101503b38 0000000000000001 0000000000000001
>            0000000000000000 90000000020b5978 90000000020b3f48 0000000000001440
>            0000000000000000 90000001207c58e0 90000001207c5970 9000000000575e20
>            90000000010e2e00 90000000020b3f48 900000000205c238 0000000000000000
>            00000000000001d3 90000001207c58e0 9000000001958f28 9000000120790848
>            90000001207b3510 0000000000000000 9000000120780000 9000000120780010
>            90000001207d6000 90000001207c58e0 90000001015660c8 9000000120780000
>            0000000000000000 90000000005763a8 90000001207c58e0 00000003ff000000
>            9000000120780000 ffff80000296b820 900000012078f968 90000001207c6000
>            ...
>    Call Trace:
>    [<9000000001058044>] __init_zone_device_page.constprop.0+0x4/0x1a0
>    [<900000000105865c>] memmap_init_zone_device+0x11c/0x1b0
>    [<9000000000575e1c>] memremap_pages+0x24c/0x7b0
>    [<90000000005763a4>] devm_memremap_pages+0x24/0x80
>    [<ffff80000296b81c>] kgd2kfd_init_zone_device+0x11c/0x220 [amdgpu]
>    [<ffff80000265d09c>] amdgpu_device_init+0x27dc/0x2bf0 [amdgpu]
>    [<ffff80000265ece8>] amdgpu_driver_load_kms+0x18/0x90 [amdgpu]
>    [<ffff800002651fbc>] amdgpu_pci_probe+0x22c/0x890 [amdgpu]
>    [<9000000000916adc>] local_pci_probe+0x3c/0xb0
>    [<90000000002976c8>] work_for_cpu_fn+0x18/0x30
>    [<900000000029aeb4>] process_one_work+0x164/0x320
>    [<900000000029b96c>] worker_thread+0x37c/0x4a0
>    [<90000000002a695c>] kthread+0x12c/0x220
>    [<9000000001055b64>] ret_from_kernel_thread+0x24/0xc0
>    [<9000000000237524>] ret_from_kernel_thread_asm+0xc/0x88
>
>    Code: 00000000  00000000  0280040d <2980d08d> 02bffc0e  2980c08e  02c0208d  29c0208d  1400004f
>
>    ---[ end trace 0000000000000000 ]---
>
> Or lock up and/or driver reset during computate tasks, such as when
> running llama.cpp over ROCm, at which point the compute process must be
> killed before the reset could complete:
>
>    amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
>    amdgpu 0000:0a:00.0: amdgpu: failed to remove hardware queue from MES, doorbell=0x1202
>    amdgpu 0000:0a:00.0: amdgpu: MES might be in unrecoverable state, issue a GPU reset
>    amdgpu 0000:0a:00.0: amdgpu: Failed to evict queue 3
>    amdgpu 0000:0a:00.0: amdgpu: GPU reset begin!
>    amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
>    amdgpu 0000:0a:00.0: amdgpu: failed to remove hardware queue from MES, doorbell=0x1004
>    amdgpu 0000:0a:00.0: amdgpu: MES might be in unrecoverable state, issue a GPU reset
>    amdgpu 0000:0a:00.0: amdgpu: Failed to evict queue 2
>    amdgpu 0000:0a:00.0: amdgpu: Failed to evict queue 1
>    amdgpu 0000:0a:00.0: amdgpu: Failed to evict queue 0
>    amdgpu: Failed to quiesce KFD
>    amdgpu 0000:0a:00.0: amdgpu: Dumping IP State
>    amdgpu 0000:0a:00.0: amdgpu: Dumping IP State Completed
>    amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
>    [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
>    amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
>    [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
>    amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
>    [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
>    amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
>    [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
>    amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
>    [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
>    amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
>    [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
>    amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
>    [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
>    amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
>    [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
>    amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
>    [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
>    amdgpu 0000:0a:00.0: amdgpu: MODE1 reset
>    amdgpu 0000:0a:00.0: amdgpu: GPU mode1 reset
>    amdgpu 0000:0a:00.0: amdgpu: GPU smu mode1 reset
>    amdgpu 0000:0a:00.0: amdgpu: GPU reset succeeded, trying to resume
>
> Disabling the aforementioned option makes the issue go away, though it is
> unclear whether this is a platform-specific issue or one that lies within
> the amdkfd code.
>
> This patch has been tested on all the aforementioned platform
> combinations, and sent as an RFC to encourage discussion.
>
> Signed-off-by: Zhang Yuhao<xinmu@xinmu.moe>
> Signed-off-by: Mingcong Bai<jeffbai@aosc.io>
> Tested-by: Mingcong Bai<jeffbai@aosc.io>
> ---
>   drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
> index 16e12c9913f94..5d2fa86f60bf8 100644
> --- a/drivers/gpu/drm/amd/amdkfd/Kconfig
> +++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
> @@ -14,7 +14,7 @@ config HSA_AMD
>   
>   config HSA_AMD_SVM
>   	bool "Enable HMM-based shared virtual memory manager"
> -	depends on HSA_AMD && DEVICE_PRIVATE
> +	depends on HSA_AMD && DEVICE_PRIVATE && !LOONGARCH && !ARM64
>   	default y
>   	select HMM_MIRROR
>   	select MMU_NOTIFIER
--------------ZXyKBMF3T8ug5PAaQy54QfP9
Content-Type: multipart/related;
 boundary="------------NVGvP3hSGFHBzuIaddnyBE92"

--------------NVGvP3hSGFHBzuIaddnyBE92
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>On AArch64 we also noticed problems with HSA_SVM due to virtual
      address limitations on our GPUs. Basically we can only use 47-bit
      virtual addresses for user mode pointers. AArch64 uses 48 bit
      pointers with 4KB pages and even more with 64KB pages.</p>
    <p>It should be possible to work around that with &quot;ulimit -v&quot; to
      limit the virtual address space used by the application. Therefore
      I'd prefer not to disable HSA_SVM outright. But instead maybe add
      address bounds checks in <img src="cid:part1.T3asi2AT.NzBhSJHo@amd.com" alt="">svm_range_set_attr.<br>
    </p>
    <p>LoongArch seems to have a different issues. I'd be OK to disable
      HSA_SVM on that arch until more information is available.</p>
    <p>Regards,<br>
      &nbsp; Felix</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2025-08-13 23:21, Mingcong Bai
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250814032153.227285-1-jeffbai@aosc.io">
      <pre wrap="" class="moz-quote-pre">While testing my ROCm port for LoongArch and AArch64 (patches pending) on
the following platforms:

- LoongArch ...
  - Loongson AC612A0_V1.1 (Loongson 3C6000/S) + AMD Radeon RX 6800
- AArch64 ...
  - FD30M51 (Phytium FT-D3000) + AMD Radeon RX 7600
  - Huawei D920S10 (Huawei Kunpeng 920) + AMD Radeon RX 7600

When HSA_AMD_SVM is enabled, amdgpu would fail to initialise at all on
LoongArch (no output):

  amdgpu 0000:0d:00.0: amdgpu: kiq ring mec 2 pipe 1 q 0
  CPU 0 Unable to handle kernel paging request at virtual address ffffffffff800034, era == 9000000001058044, ra == 9000000001058660
  Oops[#1]:
  CPU: 0 UID: 0 PID: 202 Comm: kworker/0:3 Not tainted 6.16.0+ #103 PREEMPT(full)
  Hardware name: To be filled by O.E.M.To be fill To be filled by O.E.M.To be fill/To be filled by O.E.M.To be fill, BIOS Loongson-UDK2018-V4.0.
  Workqueue: events work_for_cpu_fn
  pc 9000000001058044 ra 9000000001058660 tp 9000000101500000 sp 9000000101503aa0
  a0 ffffffffff800000 a1 0000000ffffe0000 a2 0000000000000000 a3 90000001207c58e0
  a4 9000000001a4c310 a5 0000000000000001 a6 0000000000000000 a7 0000000000000001
  t0 000003ffff800000 t1 0000000000000001 t2 0000040000000000 t3 03ffff0000002000
  t4 0000000000000000 t5 0001010101010101 t6 ffff800000000000 t7 0001000000000000
  t8 000000000000002f u0 0000000000800000 s9 9000000002026000 s0 90000001207c58e0
  s1 0000000000000001 s2 9000000001935c40 s3 0000001000000000 s4 0000000000000001
  s5 0000000ffffe0000 s6 0000000000000040 s7 0001000000000001 s8 0001000000000000
     ra: 9000000001058660 memmap_init_zone_device+0x120/0x1b0
    ERA: 9000000001058044 __init_zone_device_page.constprop.0+0x4/0x1a0
   CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
   PRMD: 00000004 (PPLV0 +PIE -PWE)
   EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
   ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
  ESTAT: 00020000 [PIS] (IS= ECode=2 EsubCode=0)
   BADV: ffffffffff800034
   PRID: 0014d010 (Loongson-64bit, Loongson-3C6000/S)
  Modules linked in: amdgpu(+) vfat fat cfg80211 rfkill 8021q garp stp mrp llc snd_hda_codec_atihdmi snd_hda_codec_hdmi snd_hda_codec_conexant snd_hda_codec_generic drm_client_lib drm_ttm_helper syscopyarea ttm sysfillrect sysimgblt fb_sys_fops drm_panel_backlight_quirks video drm_exec drm_suballoc_helper amdxcp mfd_core drm_buddy gpu_sched drm_display_helper drm_kms_helper cec snd_hda_intel ipmi_ssif snd_intel_dspcfg snd_hda_codec snd_hda_core acpi_ipmi snd_hwdep snd_pcm fb loongson3_cpufreq lcd igc snd_timer ipmi_si spi_loongson_pci spi_loongson_core snd ipmi_devintf soundcore ipmi_msghandler binfmt_misc fuse drm drm_panel_orientation_quirks backlight dm_mod dax nfnetlink
  Process kworker/0:3 (pid: 202, threadinfo=00000000eb7cd5d6, task=000000004ca22b1b)
  Stack : 0000000000001440 0000000000000000 ffffffffff800000 0000000000000001
          90000000020b5978 9000000101503b38 0000000000000001 0000000000000001
          0000000000000000 90000000020b5978 90000000020b3f48 0000000000001440
          0000000000000000 90000001207c58e0 90000001207c5970 9000000000575e20
          90000000010e2e00 90000000020b3f48 900000000205c238 0000000000000000
          00000000000001d3 90000001207c58e0 9000000001958f28 9000000120790848
          90000001207b3510 0000000000000000 9000000120780000 9000000120780010
          90000001207d6000 90000001207c58e0 90000001015660c8 9000000120780000
          0000000000000000 90000000005763a8 90000001207c58e0 00000003ff000000
          9000000120780000 ffff80000296b820 900000012078f968 90000001207c6000
          ...
  Call Trace:
  [&lt;9000000001058044&gt;] __init_zone_device_page.constprop.0+0x4/0x1a0
  [&lt;900000000105865c&gt;] memmap_init_zone_device+0x11c/0x1b0
  [&lt;9000000000575e1c&gt;] memremap_pages+0x24c/0x7b0
  [&lt;90000000005763a4&gt;] devm_memremap_pages+0x24/0x80
  [&lt;ffff80000296b81c&gt;] kgd2kfd_init_zone_device+0x11c/0x220 [amdgpu]
  [&lt;ffff80000265d09c&gt;] amdgpu_device_init+0x27dc/0x2bf0 [amdgpu]
  [&lt;ffff80000265ece8&gt;] amdgpu_driver_load_kms+0x18/0x90 [amdgpu]
  [&lt;ffff800002651fbc&gt;] amdgpu_pci_probe+0x22c/0x890 [amdgpu]
  [&lt;9000000000916adc&gt;] local_pci_probe+0x3c/0xb0
  [&lt;90000000002976c8&gt;] work_for_cpu_fn+0x18/0x30
  [&lt;900000000029aeb4&gt;] process_one_work+0x164/0x320
  [&lt;900000000029b96c&gt;] worker_thread+0x37c/0x4a0
  [&lt;90000000002a695c&gt;] kthread+0x12c/0x220
  [&lt;9000000001055b64&gt;] ret_from_kernel_thread+0x24/0xc0
  [&lt;9000000000237524&gt;] ret_from_kernel_thread_asm+0xc/0x88

  Code: 00000000  00000000  0280040d &lt;2980d08d&gt; 02bffc0e  2980c08e  02c0208d  29c0208d  1400004f

  ---[ end trace 0000000000000000 ]---

Or lock up and/or driver reset during computate tasks, such as when
running llama.cpp over ROCm, at which point the compute process must be
killed before the reset could complete:

  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  amdgpu 0000:0a:00.0: amdgpu: failed to remove hardware queue from MES, doorbell=0x1202
  amdgpu 0000:0a:00.0: amdgpu: MES might be in unrecoverable state, issue a GPU reset
  amdgpu 0000:0a:00.0: amdgpu: Failed to evict queue 3
  amdgpu 0000:0a:00.0: amdgpu: GPU reset begin!
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  amdgpu 0000:0a:00.0: amdgpu: failed to remove hardware queue from MES, doorbell=0x1004
  amdgpu 0000:0a:00.0: amdgpu: MES might be in unrecoverable state, issue a GPU reset
  amdgpu 0000:0a:00.0: amdgpu: Failed to evict queue 2
  amdgpu 0000:0a:00.0: amdgpu: Failed to evict queue 1
  amdgpu 0000:0a:00.0: amdgpu: Failed to evict queue 0
  amdgpu: Failed to quiesce KFD
  amdgpu 0000:0a:00.0: amdgpu: Dumping IP State
  amdgpu 0000:0a:00.0: amdgpu: Dumping IP State Completed
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MODE1 reset
  amdgpu 0000:0a:00.0: amdgpu: GPU mode1 reset
  amdgpu 0000:0a:00.0: amdgpu: GPU smu mode1 reset
  amdgpu 0000:0a:00.0: amdgpu: GPU reset succeeded, trying to resume

Disabling the aforementioned option makes the issue go away, though it is
unclear whether this is a platform-specific issue or one that lies within
the amdkfd code.

This patch has been tested on all the aforementioned platform
combinations, and sent as an RFC to encourage discussion.

Signed-off-by: Zhang Yuhao <a class="moz-txt-link-rfc2396E" href="mailto:xinmu@xinmu.moe">&lt;xinmu@xinmu.moe&gt;</a>
Signed-off-by: Mingcong Bai <a class="moz-txt-link-rfc2396E" href="mailto:jeffbai@aosc.io">&lt;jeffbai@aosc.io&gt;</a>
Tested-by: Mingcong Bai <a class="moz-txt-link-rfc2396E" href="mailto:jeffbai@aosc.io">&lt;jeffbai@aosc.io&gt;</a>
---
 drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index 16e12c9913f94..5d2fa86f60bf8 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -14,7 +14,7 @@ config HSA_AMD
 
 config HSA_AMD_SVM
 	bool &quot;Enable HMM-based shared virtual memory manager&quot;
-	depends on HSA_AMD &amp;&amp; DEVICE_PRIVATE
+	depends on HSA_AMD &amp;&amp; DEVICE_PRIVATE &amp;&amp; !LOONGARCH &amp;&amp; !ARM64
 	default y
 	select HMM_MIRROR
 	select MMU_NOTIFIER
</pre>
    </blockquote>
  </body>
</html>
--------------NVGvP3hSGFHBzuIaddnyBE92
Content-Type: image/png; name="XXsRQJouIAi8Ar0m.png"
Content-Disposition: inline; filename="XXsRQJouIAi8Ar0m.png"
Content-Id: <part1.T3asi2AT.NzBhSJHo@amd.com>
Content-Transfer-Encoding: base64

U1dERVYtNTM1MjQ1Cg==

--------------NVGvP3hSGFHBzuIaddnyBE92--

--------------ZXyKBMF3T8ug5PAaQy54QfP9--
