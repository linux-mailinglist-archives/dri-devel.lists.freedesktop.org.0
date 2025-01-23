Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BB2A1A74C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 16:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B6010E855;
	Thu, 23 Jan 2025 15:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wfsZYbxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519B810E855
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 15:48:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nh9EOSZ1mClMSMUeE22up5PLEk25Fn+wOOtZpMRuCf7+NYaV0e/MFw0GISyBd0wWZgmd9CMc8aOIv/SZ1Ip93rXrYsu3kt5JIYLX6WXbd5224zZ6wzFAVYk+WKKBLrx0yV+A2dt/g1I0QBsxgCB6sUsN6UvjASL8WLDKrP7lLE3FleQyJndigGvpVvLvtAl0cZ5vyIjTTjD5Jj0guYGnSF6sYFEUpmDJSKmQ21RBowaEFn7YeFuTL5EmA5xQ+13mgDiOpvaWwDyqt5onmL4UT8dr1jpqN8t6ubJKmCO+j0YScaiqgOcjSlGifw0RRfg348wdQEd7cKrAghQa0nt0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=id+1OxM8KUnHYddOpzUvb/kMVXdhhI1U4dfR4zcbCPs=;
 b=rw5jB7F3eEpanicRRXLh/TfUWlRl6xFLjegmSBhpyIcIXut8YplWvk2zOVNif1qI8+hJ5vGju1wQGQxQ84nEQvisRnpBuADL18aKXNIXhefgblLrpPKZw8J0uOtCCoAVbcW05v2vdrnWh4niM6b4701FkZZpiIeGM+CBor3qtXfz3tPFLiPYrATOqWgUdopbF33X4UifpfjbxDHtB/RLedylpivqt+bRQwEZAb07FDl7HLegQQeVjesRxXZDBZPWGVeovi8NaBpd5mzfhaSEYpmodVooriyuCS2mD8hdbC55MBMDjoU9OT0jEcXHm2S+ob3h/SQ+XiYHVBFj3+K7AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=id+1OxM8KUnHYddOpzUvb/kMVXdhhI1U4dfR4zcbCPs=;
 b=wfsZYbxtUfka3QiK/JgLcqbc4IgZE5bfKYWNRIAl/lAtEBJhhThfhBVXE93adb0XuogC8JOFJNZ0Ip/IFsJ8dB23CFIldfidU6kBkTlu+xnqM+XGgvkmyxNpqcUUHQ96vmDKLyTX+jZrjk8UgiloH2/4ZCuL+CnusdyaYATKVcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6861.namprd12.prod.outlook.com (2603:10b6:806:266::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Thu, 23 Jan
 2025 15:48:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 15:48:37 +0000
Content-Type: multipart/alternative;
 boundary="------------fSPdt74M2jedUfdxKfQE05wR"
Message-ID: <89f46c7f-a585-44e2-963d-bf00bf09b493@amd.com>
Date: Thu, 23 Jan 2025 16:48:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <20250120194804.GT5556@nvidia.com>
 <Z4_HNA4QQbIsK8D9@phenom.ffwll.local> <20250121173633.GU5556@nvidia.com>
 <Z5DQsyV0vwX3Iabu@phenom.ffwll.local>
 <6612c40d-4999-41a1-a4a5-74d3ff5875c3@amd.com>
 <20250122143744.GF5556@nvidia.com>
 <827315b0-23b6-4a39-88eb-34e756298d67@amd.com>
 <20250123135946.GQ5556@nvidia.com>
 <9a36fba5-2dee-46fd-9f51-47c5f0ffc1d4@amd.com>
 <97db03be-df86-440d-be4a-082f94934ddf@amd.com>
 <20250123150212.GR5556@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250123150212.GR5556@nvidia.com>
X-ClientProxiedBy: FR0P281CA0193.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bd9c53d-784d-4bdc-dda3-08dd3bc5665e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SllRNmtPMWN1cmZmTUc3d0tmSlJrbDV2QUtQejE0bjdqa1pBMjAzcmp3bkxC?=
 =?utf-8?B?U0hkM1k3MTMyUncyYWQvRy9scWY1dk8wdkZqK3lTdFNSNUduY2ZFYlRuTzBt?=
 =?utf-8?B?VFQ1dWRtQnEvUTljSS94Z3lPWHhQSExLMnF2UHBBQW03SVV5c1IyeVpWTXdH?=
 =?utf-8?B?amNJazV5V1RhNEI0SkVoeWl2Qk0zTWwzR3BhYU1qQTNyWHUzczMySzBPZmVx?=
 =?utf-8?B?WllqZ09UT01WKzFHakFpSU4zZDFzaWowdnQxRDl1Tk5mMUJzQ2o0dGcvQXBu?=
 =?utf-8?B?WmNYQ203TFJDY3FIL1poWUxucU9NbSs1Z0VCRkhrQTI0c2luUHExUVZtMkpm?=
 =?utf-8?B?cnB5UkRaMkJyelFnbzRhazRVMmhPVXR6TWZna1g5K2d6WG9qaDFtMmhEcElz?=
 =?utf-8?B?aEdMUmVRTWxFM05YVXVTZ0N2Y3ZNMTZoQUpQY1BVNzgvamZEZW9HNEZPUWsv?=
 =?utf-8?B?SDFSMmdVU09TM2pha2h2R08zYkZwM093b1MzWGtGaEF6NEJkWTVwamc4L3Av?=
 =?utf-8?B?VVZRdFdRYWpSUWx4MXZ0b3ByV01yRXNRUG01cHpQRTFXUm0xUHg2NWJydnZz?=
 =?utf-8?B?S1NVUHkwNHZlZ3Q3SVlnNGs3VVdwWWRKTHRHS0JXdHMzK3Y5UTl4Y3BENkJs?=
 =?utf-8?B?MU1KczByNEtqYXRoOWRGYU9iNHlkT1F6cVBvNkZocnNpb0tOdjRUdWxFUUdW?=
 =?utf-8?B?eERZNTNGRGRMTnZJRzE4aVErQkVEMXNZVmpkcXUyeXd2Yk8ydGU2N1BQL0JF?=
 =?utf-8?B?cFQwQjlrRnIxQzJLSnlNNWZaWmNTM0NVMjJTM2hOTXZUNG5oU0o1aWdCVHRT?=
 =?utf-8?B?WXpUNEtSSUZ4UzZscFFNaFB5bUVhU3ptdXNwNUhNZnArbGtucEZiOXJRRFR3?=
 =?utf-8?B?QjdWN3RSdDNMK3RhYjlsWFkwakFIME0rNVkzd0pVNE5xRGRCc25RamY3K2xO?=
 =?utf-8?B?ekx0dGM3ckhpdm1zWFNIZGluSjFnY29YYUlZeGNFcGUvQ1lGcHZLeTgvNHRy?=
 =?utf-8?B?T1ZHcVJPSUNDM1FzU0d3WUpESDBhYVpaamVzTUtFYXNUNGJGZUNBM2ZkaW1X?=
 =?utf-8?B?cVcxcDRqL2NkamNsOVF3QVlJTkM4RVFUZXl5eWFxclBmbHQ2TWExb2lGaTRk?=
 =?utf-8?B?NEx0SVo1L1RMMnFxeWllZzBXbDZMdlZydmcrK0lKWTA5dCtSRXJWTmF4K3Uz?=
 =?utf-8?B?WldnOVUrMFpreVhzMExiZUhUR201NHN0TmpkNmd0U05qSFU0Zk13VWZFdHI5?=
 =?utf-8?B?eU0yRzJWUmZqam8vTm9neGFKck4xZ3dyS0R0OUdGMjVkMC9sWElhandldkhR?=
 =?utf-8?B?NVg0ZnhmYWZZZWxoT25PcTNNNGhtam4xOEIvclB0UUF5OXpIY0w4ZlQ4cHRl?=
 =?utf-8?B?Q0Nld2s3My8vQUt2MGcrdCtiNjVNSHdpN2xFaUhaVjk4SlZxYk43b2RVdkln?=
 =?utf-8?B?bmV6c3l1M1U5aFRIQm5oa1JScXZZSDNBWHZrNDZmWVdpT1ZGbys0MVJodkFu?=
 =?utf-8?B?c0EzcVN2TVY1emZLdWRkdEFsMjd0ZnJaV0tLRkErd3NxcENNSkQzYlp4T3lX?=
 =?utf-8?B?cFYvMDl0NG9WekszRFg3VkJxNUlLbUxaN3dPN1NhMitBL2JBZ1NkL0RyQzBq?=
 =?utf-8?B?Q2JlcTVxbmx0TDlvaWduZW93blVkbTFvOVdLd0xraUU4bEJoSkExRXR2Ny81?=
 =?utf-8?B?Z2h0VU1ldVVMN0JvTGRwUHhURGJGQ0JCSS9TZ3JpTnJhZWFLM001VldsL3F6?=
 =?utf-8?B?M1lIUTZZZFFmZ3dkbElQaFRYWVI4Vk1SMkVhRUh0cmd0UjIwWjY0Y3FRYXRp?=
 =?utf-8?B?UjFQR0hESklQTldKVlpEZDVwelNaTzJjM083L3l2eTloR2F1ZDhTMFhBSW9N?=
 =?utf-8?Q?/cYWq7SU1IPgG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHgzQURVcEN2S1FwTFRoaEdoK1NpVVE2bFdZam9QMk9jMGNEcUFpUmVoQXIv?=
 =?utf-8?B?QUVqVU84WGREeFdvNnNKRjhyMEhzc0RYczBHZm8rbnh4U3J4bk0wUkVPTmNY?=
 =?utf-8?B?dTgzWjB2dE9FMGZPVm5JRWc1ZndYVmhxYVI5b0hzMmVGT3FVZDJ0bStPVjJo?=
 =?utf-8?B?YkcxWEhBVzJrWGFJNXUxOXpDTnJOallpdzc3SzV6bFVzNXhaczQ1RlNVMVht?=
 =?utf-8?B?NWd5aHFWeENTcVlLTW1MN0RVdHJRTjlUVXozamZiN0JmTDRSRTBITDB5NTgv?=
 =?utf-8?B?MXVSU21vSVdDR3RlVGJlVHBIdjlHZ051d1FwZWl6Q3VUOGhRY3ZaM3ZHK2dR?=
 =?utf-8?B?Qk9VSHdONTdhSGdqbERUeFNlR0hoQUpVcDhVczlvOE1QRXdzOEtaSHQ3N29G?=
 =?utf-8?B?cW5Ndml3VFM0U252YnZaaHdya0FSb3I2V2lnMHB5MW5CbDgrSlRNcUlSbjFC?=
 =?utf-8?B?SWFRUlRWWXVIVnpxbkJRL3pIT09rblU3NG9uUGx4YTN4Yy9JMTYzSksrY2xO?=
 =?utf-8?B?MWZEb2dyV3A3Z0V5QzlqeDdpUUJKeHJONUttdjg5OU9BVW9aYitSUGZEdkxy?=
 =?utf-8?B?MmVpamVMeGxONWo4Wm15UjF0cnZPUE5uUWpUWkJXQmwvNFRJMHZ0d1VqbTFL?=
 =?utf-8?B?K1YxWGtzQnVlZFQ1RCtrYXBGeUd1Q016WklvVzkrMjlKTGVqTUQrcmwvWjV5?=
 =?utf-8?B?U0NPR0tXV3BOeTBnOXlWWktWdkVNZnUrTmZpTXlPWnRQSUt6ekFIanlNVk9t?=
 =?utf-8?B?c3NDeFJGeE5sY2ZQb1NKWW9WU1pIS0dIR3VIbnAwRDR6bnJMY1V5aXpoWW9X?=
 =?utf-8?B?YjJJdTluQXZyWmYvU0RKMzdkMHN2RFZSYjdieTFoL0d4T1k0WkFYV1B4NDNs?=
 =?utf-8?B?Snh6dzlTUFpjQnFSUVJrUTh3OFlmRE93dkZOeGhYQWIrYVFaNFl5dHNQS09i?=
 =?utf-8?B?MmlmSjNPaXpKaU44NzlCZDgvbWFuZG5HdEE4a0dLNy83OUZPV0RTSm4xUHQ0?=
 =?utf-8?B?VWJ2QUZPbHduN1hIRkppVElNWUhIYys5TU5qb2F5UXIrb2xzNkQvZlZYYmxC?=
 =?utf-8?B?ZXVxQjZYbEMzaEkzK29zMWVnU0NHNWlubHBKNWd4YXhkOVprVUhYaTBHOU5Z?=
 =?utf-8?B?OFpFWTNybENKMHp0OVRkemcxcVdIODVBczZ4ZzVaaDZxb1BFc2J6dmdwN1JV?=
 =?utf-8?B?UVQxQStjVm9ScDFHbXU0K2FqN3BtcXNTbC9kWSsyc0NkMlpDMkxEc3J6U2Uv?=
 =?utf-8?B?WDJRMlhQemhkNXRwcXBHblZuMW1Mcm9WZGpTNWUwU1l2VUZzaWlkbm44UXlO?=
 =?utf-8?B?dHZyNHZ3VTJOTlVzKzJFSFRFUGR2Ulh2RnVhY01zMGloNzdyU0F1bElucVhq?=
 =?utf-8?B?RTdPSGhMNDBTVHdXeWtoT1Q4UzVTVjJ1ZTU5bStoZjBiYUwyTWRnMGR0UWNW?=
 =?utf-8?B?RHM2dE10d0xHQmdsTFIxU0Q5MzNHN056NTJ6Wis5TXlMK0ZNRlpUZFpjQndM?=
 =?utf-8?B?Zis2T3FzUlVVMzcycXFzYzlZUm1CUWdLMTNqcG9GaUpVNFZGVXBNTjlhYlZk?=
 =?utf-8?B?RGFPeWRXUVlNUkxiR3hXSlYvQ0MxMVdHNldjZU1nR2dSQnlxQ3NiWHhlc1RV?=
 =?utf-8?B?UTd0OHRCaGxLcklOQmI3YXVBcDFMZHJuamwyZzJ5aHhESkNDY2ZlQllHdTNI?=
 =?utf-8?B?RzdLb0x5Y0NUN05ObDduV29IQ0FwTlJWczRVNkpBYUpCRktBN0tqNng4Qy8z?=
 =?utf-8?B?ZTFUU1hQRll4MFYwRWFjelJpMWorTEQyN3EyWjFKQk8vRnlRUEI2VTQ0cUpa?=
 =?utf-8?B?cjlTczE1NmJVT1VjckcxRnFINkhJdHJSKzIwS2FJdkdFZDZaRkF3U2lwVnEv?=
 =?utf-8?B?ZnZTOVM3ZWxxNFJ6Sk1jU0VHM2U4ZWE3eE5KL1NKWjZnSWhLS0VPcDR0R0VW?=
 =?utf-8?B?QTlIS0RjOGFNVkpnZXYzSnQzbUpmaFg1VkpGZTVJUjI1K3lnYkNod3Fmd2hP?=
 =?utf-8?B?MEN3Y1ZFZ2VhbngyZkZUajc0YWRxNWtpaXhNTGp3b3c1YkZjcGx1elpBVS93?=
 =?utf-8?B?UkVIVGJSMGdXSy8rUEg5L3BHTDB3dkN4SWwyWHlBcDk5ODB4YmxlS3Buenln?=
 =?utf-8?Q?QSZf3xrzo3PCtoykFvTJGbMJ9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd9c53d-784d-4bdc-dda3-08dd3bc5665e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 15:48:36.9994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKgu+AkWxYrA8q0Yxr3fdFSOaPH/MYnxI8E1UNGdXEJt0rYG+8FyoTxk8vy1chOd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6861
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

--------------fSPdt74M2jedUfdxKfQE05wR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 23.01.25 um 16:02 schrieb Jason Gunthorpe:
> On Thu, Jan 23, 2025 at 03:35:21PM +0100, Christian König wrote:
>> Sending it as text mail once more.
>>
>> Am 23.01.25 um 15:32 schrieb Christian König:
>>> Am 23.01.25 um 14:59 schrieb Jason Gunthorpe:
>>>> On Wed, Jan 22, 2025 at 03:59:11PM +0100, Christian König wrote:
>>>>>>> For example we have cases with multiple devices are in the same IOMMU domain
>>>>>>> and re-using their DMA address mappings.
>>>>>> IMHO this is just another flavour of "private" address flow between
>>>>>> two cooperating drivers.
>>>>> Well that's the point. The inporter is not cooperating here.
>>>> If the private address relies on a shared iommu_domain controlled by
>>>> the driver, then yes, the importer MUST be cooperating. For instance,
>>>> if you send the same private address into RDMA it will explode because
>>>> it doesn't have any notion of shared iommu_domain mappings, and it
>>>> certainly doesn't setup any such shared domains.
>>> Hui? Why the heck should a driver own it's iommu domain?
> I don't know, you are the one saying the drivers have special shared
> iommu_domains so DMA BUF need some special design to accommodate it.
>
> I'm aware that DRM drivers do directly call into the iommu subsystem
> and do directly manage their own IOVA. I assumed this is what you were
> talkinga bout. See below.

No, no there are much more cases where drivers simply assume that they 
are in the same iommu domain for different devices. E.g. that different 
PCI endpoints can use the same dma_addr_t.

For example those classic sound devices for HDMI audio on graphics cards 
work like this. It's a very long time that I looked into that, but I 
think that this is even a HW limitation.

In other words if the device handled by the generic ALSA driver and the 
GPU are not in the same iommu domain you run into trouble.

>>> The domain is owned and assigned by the PCI subsystem under Linux.
> That domain is *exclusively* owned by the DMA API and is only accessed
> via maps created by DMA API calls.
>
> If you are using the DMA API correctly then all of this is abstracted
> and none of it matters to you. There is no concept of "shared domains"
> in the DMA API.

Well it might never been documented but I know of quite a bunch of 
different cases that assume that a DMA addr will just ultimately work 
for some other device/driver as well.

Of hand I know at least the generic ALSA driver case, some V4L driver 
(but that might use the same PCI endpoint, not 100% sure) and a multi 
GPU case which works like this.

> You call the DMA API, you get a dma_addr_t that is valid for a
> *single* device, you program it in HW. That is all. There is no reason
> to dig deeper than this.
>>>>> The importer doesn't have the slightest idea that he is sharing it's DMA
>>>>> addresses with the exporter.
>>>> Of course it does. The importer driver would have had to explicitly
>>>> set this up! The normal kernel behavior is that all drivers get
>>>> private iommu_domains controled by the DMA API. If your driver is
>>>> doing something else *it did it deliberately*.
>>> As far as I know that is simply not correct. Currently IOMMU
>>> domains/groups are usually shared between devices.
> No, the opposite. The iommu subsystem tries to maximally isolate
> devices up to the HW limit.
>
> On server platforms every device is expected to get its own iommu domain.
>
>>> Especially multi function devices get only a single IOMMU domain.
> Only if the PCI HW doesn't support ACS.

Ah, yes that can certainly be.

>
> This is all DMA API internal details you shouldn't even be talking
> about at the DMA BUF level. It is all hidden and simply does not
> matter to DMA BUF at all.

Well we somehow need to support the existing use cases with the new API.

>>>> The new iommu architecture has the probing driver disable the DMA API
>>>> and can then manipulate its iommu domain however it likes, safely. Ie
>>>> the probing driver is aware and particiapting in disabling the DMA
>>>> API.
>>> Why the heck should we do this?
>>>
>>> That drivers manage all of that on their own sounds like a massive step
>>> in the wrong direction.
> I am talking about DRM drivers that HAVE to manage their own for some
> reason I don't know. eg:
>
> drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c:             tdev->iommu.domain = iommu_domain_alloc(&platform_bus_type);
> drivers/gpu/drm/msm/msm_iommu.c:        domain = iommu_paging_domain_alloc(dev);
> drivers/gpu/drm/rockchip/rockchip_drm_drv.c:    private->domain = iommu_paging_domain_alloc(private->iommu_dev);
> drivers/gpu/drm/tegra/drm.c:            tegra->domain = iommu_paging_domain_alloc(dma_dev);
> drivers/gpu/host1x/dev.c:               host->domain = iommu_paging_domain_alloc(host->dev);
>
> Normal simple drivers should never be calling these functions!
>
> If you are calling these functions you are not using the DMA API, and,
> yes, some cases like tegra n1x are actively sharing these special
> domains across multiple devices and drivers.
>
> If you want to pass an IOVA in one of these special driver-created
> domains then it would be some private address in DMABUF that only
> works on drivers that have understood they attached to these manually
> created domains. No DMA API involvement here.

That won't fly like this. That would break at least the ALSA use case 
and potentially quite a bunch of others.

>>>>> I still strongly think that the exporter should talk with the DMA API to
>>>>> setup the access path for the importer and *not* the importer directly.
>>>> It is contrary to the design of the new API which wants to co-optimize
>>>> mapping and HW setup together as one unit.
>>> Yeah and I'm really questioning this design goal. That sounds like
>>> totally going into the wrong direction just because of the RDMA
>>> drivers.
> Actually it is storage that motivates this. It is just pointless to
> allocate a dma_addr_t list in the fast path when you don't need
> it. You can stream the dma_addr_t directly into HW structures that are
> necessary and already allocated.

That's what I can 100% agree on.

For GPUs its basically the same, e.g. converting from the dma_addr_t to 
your native presentation is just additional overhead nobody needs.

>>>> For instance in RDMA we want to hint and control the way the IOMMU
>>>> mapping works in the DMA API to optimize the RDMA HW side. I can't do
>>>> those optimizations if I'm not in control of the mapping.
>>> Why? What is the technical background here?
> dma-iommu.c chooses an IOVA alignment based on its own reasoning that
> is not always compatible with the HW. The HW can optimize if the IOVA
> alignment meets certain restrictions. Much like page tables in a GPU.

Yeah, but why can't we tell the DMA API those restrictions instead of 
letting the driver manage the address space themselves?

>>>> The same is probably true on the GPU side too, you want IOVAs that
>>>> have tidy alignment with your PTE structure, but only the importer
>>>> understands its own HW to make the correct hints to the DMA API.
>>> Yeah but then express those as requirements to the DMA API and not move
>>> all the important decisions into the driver where they are implemented
>>> over and over again and potentially broken halve the time.
> It wouild be in the DMA API, just the per-mapping portion of the API.
>
> Same as the multipath, the ATS, and more. It is all per-mapping
> descisions of the executing HW, not global decisions or something
> like.

So the DMA API has some structure or similar to describe the necessary 
per-mapping properties?

Regards,
Christian.

>
> Jason

--------------fSPdt74M2jedUfdxKfQE05wR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 23.01.25 um 16:02 schrieb Jason Gunthorpe:<br>
    <blockquote type="cite" cite="mid:20250123150212.GR5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">On Thu, Jan 23, 2025 at 03:35:21PM +0100, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Sending it as text mail once more.

Am 23.01.25 um 15:32 schrieb Christian König:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Am 23.01.25 um 14:59 schrieb Jason Gunthorpe:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Wed, Jan 22, 2025 at 03:59:11PM +0100, Christian König wrote:
</pre>
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">For example we have cases with multiple devices are in the same IOMMU domain
and re-using their DMA address mappings.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">IMHO this is just another flavour of &quot;private&quot; address flow between
two cooperating drivers.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Well that's the point. The inporter is not cooperating here.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">If the private address relies on a shared iommu_domain controlled by
the driver, then yes, the importer MUST be cooperating. For instance,
if you send the same private address into RDMA it will explode because
it doesn't have any notion of shared iommu_domain mappings, and it
certainly doesn't setup any such shared domains.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Hui? Why the heck should a driver own it's iommu domain?
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't know, you are the one saying the drivers have special shared
iommu_domains so DMA BUF need some special design to accommodate it.

I'm aware that DRM drivers do directly call into the iommu subsystem
and do directly manage their own IOVA. I assumed this is what you were
talkinga bout. See below.</pre>
    </blockquote>
    <br>
    No, no there are much more cases where drivers simply assume that
    they are in the same iommu domain for different devices. E.g. that
    different PCI endpoints can use the same dma_addr_t.<br>
    <br>
    For example those classic sound devices for HDMI audio on graphics
    cards work like this. It's a very long time that I looked into that,
    but I think that this is even a HW limitation.<br>
    <br>
    In other words if the device handled by the generic ALSA driver and
    the GPU are not in the same iommu domain you run into trouble.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250123150212.GR5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">The domain is owned and assigned by the PCI subsystem under Linux.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That domain is *exclusively* owned by the DMA API and is only accessed
via maps created by DMA API calls.

If you are using the DMA API correctly then all of this is abstracted
and none of it matters to you. There is no concept of &quot;shared domains&quot;
in the DMA API.</pre>
    </blockquote>
    <br>
    Well it might never been documented but I know of quite a bunch of
    different cases that assume that a DMA addr will just ultimately
    work for some other device/driver as well.<br>
    <br>
    Of hand I know at least the generic ALSA driver case, some V4L
    driver (but that might use the same PCI endpoint, not 100% sure) and
    a multi GPU case which works like this.<br>
    <br>
    <blockquote type="cite" cite="mid:20250123150212.GR5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">You call the DMA API, you get a dma_addr_t that is valid for a
*single* device, you program it in HW. That is all. There is no reason
to dig deeper than this.<span style="white-space: pre-wrap"> </span></pre>
    </blockquote>
    <blockquote type="cite" cite="mid:20250123150212.GR5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">The importer doesn't have the slightest idea that he is sharing it's DMA
addresses with the exporter.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Of course it does. The importer driver would have had to explicitly
set this up! The normal kernel behavior is that all drivers get
private iommu_domains controled by the DMA API. If your driver is
doing something else *it did it deliberately*.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
As far as I know that is simply not correct. Currently IOMMU
domains/groups are usually shared between devices.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
No, the opposite. The iommu subsystem tries to maximally isolate
devices up to the HW limit.

On server platforms every device is expected to get its own iommu domain.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Especially multi function devices get only a single IOMMU domain.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Only if the PCI HW doesn't support ACS.</pre>
    </blockquote>
    <br>
    Ah, yes that can certainly be.<br>
    <br>
    <blockquote type="cite" cite="mid:20250123150212.GR5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">

This is all DMA API internal details you shouldn't even be talking
about at the DMA BUF level. It is all hidden and simply does not
matter to DMA BUF at all.</pre>
    </blockquote>
    <br>
    Well we somehow need to support the existing use cases with the new
    API.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250123150212.GR5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">The new iommu architecture has the probing driver disable the DMA API
and can then manipulate its iommu domain however it likes, safely. Ie
the probing driver is aware and particiapting in disabling the DMA
API.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Why the heck should we do this?

That drivers manage all of that on their own sounds like a massive step
in the wrong direction.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I am talking about DRM drivers that HAVE to manage their own for some
reason I don't know. eg:

drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c:             tdev-&gt;iommu.domain = iommu_domain_alloc(&amp;platform_bus_type);
drivers/gpu/drm/msm/msm_iommu.c:        domain = iommu_paging_domain_alloc(dev);
drivers/gpu/drm/rockchip/rockchip_drm_drv.c:    private-&gt;domain = iommu_paging_domain_alloc(private-&gt;iommu_dev);
drivers/gpu/drm/tegra/drm.c:            tegra-&gt;domain = iommu_paging_domain_alloc(dma_dev);
drivers/gpu/host1x/dev.c:               host-&gt;domain = iommu_paging_domain_alloc(host-&gt;dev);

Normal simple drivers should never be calling these functions!

If you are calling these functions you are not using the DMA API, and,
yes, some cases like tegra n1x are actively sharing these special
domains across multiple devices and drivers.

If you want to pass an IOVA in one of these special driver-created
domains then it would be some private address in DMABUF that only
works on drivers that have understood they attached to these manually
created domains. No DMA API involvement here.</pre>
    </blockquote>
    <br>
    That won't fly like this. That would break at least the ALSA use
    case and potentially quite a bunch of others.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250123150212.GR5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">I still strongly think that the exporter should talk with the DMA API to
setup the access path for the importer and *not* the importer directly.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">It is contrary to the design of the new API which wants to co-optimize
mapping and HW setup together as one unit.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Yeah and I'm really questioning this design goal. That sounds like
totally going into the wrong direction just because of the RDMA
drivers.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Actually it is storage that motivates this. It is just pointless to
allocate a dma_addr_t list in the fast path when you don't need
it. You can stream the dma_addr_t directly into HW structures that are
necessary and already allocated.</pre>
    </blockquote>
    <br>
    That's what I can 100% agree on.<br>
    <br>
    For GPUs its basically the same, e.g. converting from the dma_addr_t
    to your native presentation is just additional overhead nobody
    needs.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250123150212.GR5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">For instance in RDMA we want to hint and control the way the IOMMU
mapping works in the DMA API to optimize the RDMA HW side. I can't do
those optimizations if I'm not in control of the mapping.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Why? What is the technical background here?
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
dma-iommu.c chooses an IOVA alignment based on its own reasoning that
is not always compatible with the HW. The HW can optimize if the IOVA
alignment meets certain restrictions. Much like page tables in a GPU.</pre>
    </blockquote>
    <br>
    Yeah, but why can't we tell the DMA API those restrictions instead
    of letting the driver manage the address space themselves?<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250123150212.GR5556@nvidia.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">The same is probably true on the GPU side too, you want IOVAs that
have tidy alignment with your PTE structure, but only the importer
understands its own HW to make the correct hints to the DMA API.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Yeah but then express those as requirements to the DMA API and not move
all the important decisions into the driver where they are implemented
over and over again and potentially broken halve the time.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It wouild be in the DMA API, just the per-mapping portion of the API.

Same as the multipath, the ATS, and more. It is all per-mapping
descisions of the executing HW, not global decisions or something
like.</pre>
    </blockquote>
    <br>
    So the DMA API has some structure or similar to describe the
    necessary per-mapping properties?<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:20250123150212.GR5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">

Jason
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------fSPdt74M2jedUfdxKfQE05wR--
