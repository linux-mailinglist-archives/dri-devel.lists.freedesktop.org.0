Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EF3A1A5C7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 15:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D0210E291;
	Thu, 23 Jan 2025 14:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EEmhwczh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1084A10E291
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 14:33:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEneec9oUG9KTgLDlCHSEXXORJGh+Azno9SEXQlucpxWzrWbrIrlkI6J5mjXLJHW/YmKv+1rW7FbMsrFRm0A+wL3p4d2P4pLnBytAkqmODjAMM7wgJJkPFXkhnFvvcc9/hnWLUjE7rMiZZW4CuYd1bVx94lMQNG3unqXYPxR6dwjmsvRP2an4FD/Gc3vHD0sf/pL63bdCveyjCx6rIexV7SQNBmCz6rA5+eSP/ZEBha/0IZ+YgYLMesPhhbcKNdFCn0ZVb63exKuWWnJTBsSpQrhI05OJwYwre89VY/SZEGBC9pY4zA+Mz3QCRxocp91zE2nAgq9V28Ybl5O6nAg0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIn76HisI2ZuGp6SO4crAYg4LOTgKT5ONFeaD41m8vM=;
 b=fJEERFvf9/PNdvwP1HtpfhNxEb7RDeohHdZwCepp7hiK/ESKEBFbG7OSExa1EO2uWQxTYwQ9KwfststjmLrKXLHWMlB11SygcmKNGRKIWZ7KtEEP5FugWZ296YD9ckVn9s3HFowfFt0FWM5m9QoI/fOjB4ShC2uNdhvjdmY4X6dH1fwwrdtMpW9voiUUOrmdZ+ZA4pyyqT8YW5jvgzHIun8K7xFiYQdguE2WJU324w84wKiefD+j8vBhhFbFsTBaVhrKZX70LrG95qrn2EU9S/+inKcUYaVh5OMaR4gScqZ1Q8LmqLqWd7TSHsKVAPAi5qkHrbEuXFHbPqKvDMsQbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIn76HisI2ZuGp6SO4crAYg4LOTgKT5ONFeaD41m8vM=;
 b=EEmhwczhk3R4Ld5gD2WmvT/RFIX7O76QpYLnv/v2ALK0jQ4ZEpjO0PYSBPPxSPEZLu9Uzv7KSX6fP/7MZKeZBPg9hQXd4gO9i9a3jIHsTGzeSCEAkMMcra9JeVq4Nvo3xqZ3/jNCcEgZUFk2b/aocFkKRHfNsb/NfeeRFDXlJ0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB8007.namprd12.prod.outlook.com (2603:10b6:510:28e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 23 Jan
 2025 14:33:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 14:33:05 +0000
Content-Type: multipart/alternative;
 boundary="------------cJLwA8MwdTi4EeWzVA8IMa0U"
Message-ID: <9a36fba5-2dee-46fd-9f51-47c5f0ffc1d4@amd.com>
Date: Thu, 23 Jan 2025 15:32:57 +0100
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
References: <c10ae58f-280c-4131-802f-d7f62595d013@amd.com>
 <20250120175901.GP5556@nvidia.com> <Z46a7y02ONFZrS8Y@phenom.ffwll.local>
 <20250120194804.GT5556@nvidia.com> <Z4_HNA4QQbIsK8D9@phenom.ffwll.local>
 <20250121173633.GU5556@nvidia.com> <Z5DQsyV0vwX3Iabu@phenom.ffwll.local>
 <6612c40d-4999-41a1-a4a5-74d3ff5875c3@amd.com>
 <20250122143744.GF5556@nvidia.com>
 <827315b0-23b6-4a39-88eb-34e756298d67@amd.com>
 <20250123135946.GQ5556@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250123135946.GQ5556@nvidia.com>
X-ClientProxiedBy: FR4P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a55053-60ac-4b32-3713-08dd3bbad948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGVZT0o5N045Q1Zyd0VTbEpTRCtBRmRTeXM2Vk84S0VMbmd6QTZpdjFDMDQv?=
 =?utf-8?B?STBDaUVVYjhLM3F1ZUoyUzJsdmJlVW5YK1Y1S05NNzNyNFF3N1JVc1ZJM1Vq?=
 =?utf-8?B?Smg0Y05CNHk4aHJ3Z0Zyam8rOXBOMDZqcnR5VnBrKzZHaDFSWXN1Ym9aN1Yw?=
 =?utf-8?B?YnUxc2R2aWgzcHRXWXA4STdLa0hSdit1RTVTSkJyTEdIdXNVa0ZiTGxzTDBh?=
 =?utf-8?B?QmN3ZTQ0cVZyWWU1bk43WDNMRVFqeEpMK1krTXMzS0s3VXF3WElJeXNaVVgy?=
 =?utf-8?B?SVpHSER5bkdyMWpsbE5NVXRxaGg0VTBLZlJORW5rTzl0ZUcyRjdXUmlaUm02?=
 =?utf-8?B?OTV6U0pxMWN1am9aaUZPaUxoL2trSXhqOTZNYzR2YWs0Nk5Edk94RFRFWGpU?=
 =?utf-8?B?SXRWL2NieDVlSDEyZkFRczRreUgvTmJaZjR6cEF5Kys4TW81cE5XUWpiazRw?=
 =?utf-8?B?THBhbm1JbFhSMUc2S1dSRjhPMG5LeDlGZnFHZnhTdnVnUjJsKysxcHVkbUNv?=
 =?utf-8?B?S2ZlOEh0N0p3TkwyVVdFOGxVTXIwcUxYbHFsUmxjQS91M042MmtPRnNqTHRO?=
 =?utf-8?B?RE1Xei83cUpEV3YwWm9PcEh0RElWSVFORllGRkd1KzlWcnpvcWNPMFByUjlI?=
 =?utf-8?B?K1RwN3hkek5Eb2lwSHhvNXVadEhJZkt5MGJkNGhaMWZpMmhRVFZpWWFWYjVN?=
 =?utf-8?B?QTVodGZGRTEwYUFRR0pGeXJWdWJpTXQ4dWV6c3dheTIzU1doZDhVaFRJNVEy?=
 =?utf-8?B?V0NJSkRFeDRWUElJcVI1MlFCVEFwNWlmNHF5QUhlR3hPeStra0JjNlBML3lQ?=
 =?utf-8?B?akRORnA5RW40b1FFYjlpaVdTVXpoWTB5K01vQlpKTEVoZnBOa3VVbnlXNjNH?=
 =?utf-8?B?eTRRSnlqR3YzWHRVWmZaYXVzQ1ExVy9ROTBBMkNmd3JBTFNVaStRMUtiODQy?=
 =?utf-8?B?Ri9tN0ZJWmh1dHUvdW5QWjM3VzYxOEdjenplVUZuVlArdFVjMjRFSTBicVlq?=
 =?utf-8?B?UktVRlZ0ZTh1MmRVNHA0ZUNWZkV1dmsyOUJXYmpqT2VodmVTU1JySnk1aU9W?=
 =?utf-8?B?cSsrUTlLWFlvZVV5SFIwc280ZHZpUHFsaXBRcnJoeEVQdW9sRWxGU0tadUph?=
 =?utf-8?B?L3drbUhJY1ZBTFRpVlp0ZXdCZWttNDFVL1k3bHVPL3FhalVMZHNCWmp3ZWJF?=
 =?utf-8?B?ME5ta1I3c2IwVW1pSkwza3VOWm5ldUw5Q2R0bEpNUWVZMW1JTFEvSmgwdTVp?=
 =?utf-8?B?c2JjZVczNnZ5eWVXaFcwQk1ZRGNVcmJzMjJ4dTF5YTZweVI0Q3lSRSs1RkJt?=
 =?utf-8?B?ajZXUTBKZmwrakthYlAxdFV4WU5oSE1nZFR2Z012eFcyWEoyaTRsUy9mU0xP?=
 =?utf-8?B?YStPRUs2UiswcEJneGxETTFXVCtXWEpRdTZlVVhCWGRyRzBtWG1GKzd0ZlU5?=
 =?utf-8?B?SjlIbW5KcG8ySXlzRldGdnJwcnFLYWFNMGF4TWRaUFE1SmVPYmFVYVY2c0hB?=
 =?utf-8?B?bnJ4b0x4Y2dkbFhOcGRUTjEwN0wwUjVMV3EveDJjYUt6alRPT3hueGFhb0pv?=
 =?utf-8?B?MmVJalJVWCs2K2Z3Mk8xL0pZb0RTQ1lhUHhCV3BzSW1FWGVrSm82WEZVa1dU?=
 =?utf-8?B?bStBMXZFcEVyemdiYWlNY2FSeXVERnZGY2pjS0kvdFVSdmlrUTVadXJEdVVV?=
 =?utf-8?B?enRVaGgxVW1XUmovaEVMZXdtdDBpQ1lEYTY2cHkzTXNSb2RHYnplTFN4Wi85?=
 =?utf-8?B?UTljbXAvSzlmUVg3TGYvWVo0NGluaWQ5TFVmMUlGTGVPcXNJWmxGRGJpUVNM?=
 =?utf-8?B?OWt6VnliM2lwWDJTWElRM0VzUnhrRXdPYlNFMFV6SU14R3VsVDFKYmNrc1Js?=
 =?utf-8?Q?jWmtDsg4YSpZV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWFTSFNkcTJheFFWNFhaZmhMWnNodkNRTlJKc0hQWkFNbDV2bXViUWpuU1RO?=
 =?utf-8?B?MXAxVVhrV0diYUtuYjVmVlY4MkZPWWgvT2g1ZXJiRTR4cFpDNTd5NkJQbmJO?=
 =?utf-8?B?aWdodnN3am9zdHBZSERKK0ZKbHNXVWxkKzZ5M2N0TXg4RVpKZ25CenpiajlT?=
 =?utf-8?B?bnNsS0N6K0J2UERDckpFbm55bzRRcmg3b3Nyc3RVRURNQ1JzM3ltUERnWDhZ?=
 =?utf-8?B?T2J5d1JEVzdtbWlMa2R3bnhudXRQaFZFa01SeXYzcUVuNHY5L2h3MTF6Rmtu?=
 =?utf-8?B?M1ovaExVYXg0TGZvUE1xS1NwTnR6cHBxRjd4bnREenlvWDJmYWkycU9YenhP?=
 =?utf-8?B?ZXhkTC8wbGxzekJ5WGVqZGl6aFBvM3dlU2lBdFpsbjVYQ1A5Qkt5THpCbWZQ?=
 =?utf-8?B?dDhITzdJNFAwTjdPUklHaVNmdjhCOXRIMS9hSjY1b2hqYitYelZIaHRPeGEw?=
 =?utf-8?B?YmMxQStQdHM2SkRhSUI0cjFoaEgzamFFK2V2NG5VTlh6NjR1c3dlYmNma0Iz?=
 =?utf-8?B?bVBHcXJJaGd5STQwUTdvMVB4cDdLZlVOb2dIeDRBYUNndXprV0l0dURCUUJ2?=
 =?utf-8?B?dHJOemVJR2pwVExKcUVTTzNzZmlsNHNEdkpJUmlhbUsrdEVqaUFveFpISklM?=
 =?utf-8?B?MkNwcVQ3SUxUWnF6YkhwY1N4UUo1WUxJWkUwZmQ1RVZhby9wMm1FZWxQb1oy?=
 =?utf-8?B?K0FBSmUvY3lLS2dUTGJIeWJnY21wT3hUYWFrZWNLaWovZWRuZzNya1J1N3Vl?=
 =?utf-8?B?d3c1VHgxV2ZINk9vL0wzSE5ZMlBVSlZxemV5UVFrYTNUQlJialNKWkp3cVk1?=
 =?utf-8?B?S0VkaEJGYlY4K2d4QXV5N0FOUjgydHU1b3REc2VmdG5WL0hFNXVXK1YwQnpy?=
 =?utf-8?B?eEV1VmY2RlIwNjRkOVlzY1Q0VFkvUkFIMGFFTlZPSTJwdUg0c05IMUExQmxN?=
 =?utf-8?B?bmN1SnkrZFV6WG1WVjBZSjQ4U0dWS3E5Z1ZGdUNTZEI4MElyL2N0anlpZU9N?=
 =?utf-8?B?YXJLampCODR6bUFhVGtCdmhpSjBSeWgyUlNYOFE5VnBTSThvQkxSbm1ISjI5?=
 =?utf-8?B?SC9LT2lCVWh6Vk5EdG1xa3ZSa1hnaXNTdTNscklxeUdiMkcvNWVyQ0llaUt6?=
 =?utf-8?B?ZDNDYlpBaStpVm5vMHN5V3dLai9oc0JjRXF3dkVQNVM3ejBNbkhVb1dqZzE0?=
 =?utf-8?B?N3RvWEd6elFHbTZPekRLcllZUnFXY01iVmZkOHowMFdWcVRzMTRBMDY4Wkdu?=
 =?utf-8?B?M20xMk5TOWkvelRWZVJkd3BPdmIvaHRmYURLdllvUXh3REFsTUV3NzkxTFNk?=
 =?utf-8?B?dm9uelRzNlJtam5KeENzOWhFaDBFb2NNL2tjcHI4eStIM0RhQTRpNDdlVTRp?=
 =?utf-8?B?dStvdTVLRFdJNXBQM1g2b1RLVVkvZG84MWwvV2Y3LytQS2Q2bVk1M2pZRUdF?=
 =?utf-8?B?NjV0WDdDTktZaDRIYVJsUXE3U2lnbWs4QlY0cXdJQjQwSWY2ODN3bWJiYWVT?=
 =?utf-8?B?YlFvY1NrUGdmc2FBVGV1ZHB2YjBjeFZheGlzV2N0UUg3ZE94T1R3TmdtcTEz?=
 =?utf-8?B?d3NQeWpkM3Zsb1EyMnVpem9PTDZWVE9mdW9KOGFQbExCRWlDNWdSbGNMeDN3?=
 =?utf-8?B?YnJpSnhtRzV3dk8yeGxyUysvc1puUExUZGVuZlhwWHc0eDRWS01YVllQVERI?=
 =?utf-8?B?Q0I3TytOaEFCNUQxSGdpcnFCR1phdExZQUtjalFNUXFBMEZvaU1jeFduRXNM?=
 =?utf-8?B?T3BaYmVRK3ZGVGljNHNXNTAvQmJrOHIrMTRxdlE5SlBvaEtYUXZuNXlCOXBs?=
 =?utf-8?B?TnRab1hycGg2QmZwYjdnZUZTVm1SZXBMeFQ3d0xJcWJ4dVFhVHkrb25JZGZt?=
 =?utf-8?B?Zzc0Q0dueG41RU1rekM3R3NMRWtMQUw5cWRXRU9CYVhuZTc3alVFcmZZbElp?=
 =?utf-8?B?RklrMjZjT1ZVcWp4NTYwM1RNQUFDeDFXSzFPcFJMNWp1QTRkcjBncnFOVnZn?=
 =?utf-8?B?WGp1bDcxTWlIaVlZbXd3QjJQVXNaOE8rS3QvdjBjcHo1bGU4OUNLWUp5TzVx?=
 =?utf-8?B?eTFqNERRWDU4clhOeGFaWGloSkFhU25GMEVaaTZKSXdHQldwTnhOc05HeVBJ?=
 =?utf-8?Q?TwtIpW+GVc45sIbeHNGRXiNfb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a55053-60ac-4b32-3713-08dd3bbad948
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 14:33:05.4349 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: px3zJ+C849m10QhfAaIEjfNmt+KzFI80gHBgqqSWFmN/v3RPqR0DRTSY/t06ci/P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8007
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

--------------cJLwA8MwdTi4EeWzVA8IMa0U
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 23.01.25 um 14:59 schrieb Jason Gunthorpe:
> On Wed, Jan 22, 2025 at 03:59:11PM +0100, Christian König wrote:
>>>> For example we have cases with multiple devices are in the same IOMMU domain
>>>> and re-using their DMA address mappings.
>>> IMHO this is just another flavour of "private" address flow between
>>> two cooperating drivers.
>> Well that's the point. The inporter is not cooperating here.
> If the private address relies on a shared iommu_domain controlled by
> the driver, then yes, the importer MUST be cooperating. For instance,
> if you send the same private address into RDMA it will explode because
> it doesn't have any notion of shared iommu_domain mappings, and it
> certainly doesn't setup any such shared domains.

Hui? Why the heck should a driver own it's iommu domain?

The domain is owned and assigned by the PCI subsystem under Linux.

>> The importer doesn't have the slightest idea that he is sharing it's DMA
>> addresses with the exporter.
> Of course it does. The importer driver would have had to explicitly
> set this up! The normal kernel behavior is that all drivers get
> private iommu_domains controled by the DMA API. If your driver is
> doing something else *it did it deliberately*.

As far as I know that is simply not correct. Currently IOMMU 
domains/groups are usually shared between devices.

Especially multi function devices get only a single IOMMU domain.

> Some of that mess in tegra host1x around this area is not well
> structured, it should not be implicitly setting up domains for
> drivers. It is old code that hasn't been updated to use the new iommu
> subsystem approach for driver controled non-DMA API domains.
>
> The new iommu architecture has the probing driver disable the DMA API
> and can then manipulate its iommu domain however it likes, safely. Ie
> the probing driver is aware and particiapting in disabling the DMA
> API.

Why the heck should we do this?

That drivers manage all of that on their own sounds like a massive step 
in the wrong direction.

> Again, either you are using the DMA API and you work in generic ways
> with generic devices or it is "private" and only co-operating drivers
> can interwork with private addresses. A private address must not ever
> be sent to a DMA API using driver and vice versa.
>
> IMHO this is an important architecture point and why Christoph was
> frowning on abusing dma_addr_t to represent things that did NOT come
> out of the DMA API.
>
>> We have a very limited number of exporters and a lot of different importers.
>> So having complexity in the exporter instead of the importer is absolutely
>> beneficial.
> Isn't every DRM driver both an importer and exporter? That is what I
> was expecting at least..
>
>> I still strongly think that the exporter should talk with the DMA API to
>> setup the access path for the importer and *not* the importer directly.
> It is contrary to the design of the new API which wants to co-optimize
> mapping and HW setup together as one unit.

Yeah and I'm really questioning this design goal. That sounds like 
totally going into the wrong direction just because of the RDMA drivers.

> For instance in RDMA we want to hint and control the way the IOMMU
> mapping works in the DMA API to optimize the RDMA HW side. I can't do
> those optimizations if I'm not in control of the mapping.

Why? What is the technical background here?

> The same is probably true on the GPU side too, you want IOVAs that
> have tidy alignment with your PTE structure, but only the importer
> understands its own HW to make the correct hints to the DMA API.

Yeah but then express those as requirements to the DMA API and not move 
all the important decisions into the driver where they are implemented 
over and over again and potentially broken halve the time.

See drivers are supposed to be simple, small and stupid. They should be 
controlled by the core OS and not allowed to do whatever they want.

Driver developers are not trust able to always get everything right if 
you make it as complicated as this.

Regards,
Christian.

>
> Jason

--------------cJLwA8MwdTi4EeWzVA8IMa0U
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 23.01.25 um 14:59 schrieb Jason Gunthorpe:<br>
    <blockquote type="cite" cite="mid:20250123135946.GQ5556@nvidia.com">
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
        <pre class="moz-quote-pre" wrap="">
Well that's the point. The inporter is not cooperating here.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If the private address relies on a shared iommu_domain controlled by
the driver, then yes, the importer MUST be cooperating. For instance,
if you send the same private address into RDMA it will explode because
it doesn't have any notion of shared iommu_domain mappings, and it
certainly doesn't setup any such shared domains.</pre>
    </blockquote>
    <br>
    Hui? Why the heck should a driver own it's iommu domain?<br>
    <br>
    The domain is owned and assigned by the PCI subsystem under Linux.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20250123135946.GQ5556@nvidia.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">The importer doesn't have the slightest idea that he is sharing it's DMA
addresses with the exporter.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Of course it does. The importer driver would have had to explicitly
set this up! The normal kernel behavior is that all drivers get
private iommu_domains controled by the DMA API. If your driver is
doing something else *it did it deliberately*.</pre>
    </blockquote>
    <br>
    As far as I know that is simply not correct. Currently IOMMU
    domains/groups are usually shared between devices.<br>
    <br>
    Especially multi function devices get only a single IOMMU domain.<br>
    <br>
    <blockquote type="cite" cite="mid:20250123135946.GQ5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">Some of that mess in tegra host1x around this area is not well
structured, it should not be implicitly setting up domains for
drivers. It is old code that hasn't been updated to use the new iommu
subsystem approach for driver controled non-DMA API domains.

The new iommu architecture has the probing driver disable the DMA API
and can then manipulate its iommu domain however it likes, safely. Ie
the probing driver is aware and particiapting in disabling the DMA
API.</pre>
    </blockquote>
    <br>
    Why the heck should we do this?<br>
    <br>
    That drivers manage all of that on their own sounds like a massive
    step in the wrong direction.<br>
    <br>
    <blockquote type="cite" cite="mid:20250123135946.GQ5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">Again, either you are using the DMA API and you work in generic ways
with generic devices or it is &quot;private&quot; and only co-operating drivers
can interwork with private addresses. A private address must not ever
be sent to a DMA API using driver and vice versa.

IMHO this is an important architecture point and why Christoph was
frowning on abusing dma_addr_t to represent things that did NOT come
out of the DMA API.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">We have a very limited number of exporters and a lot of different importers.
So having complexity in the exporter instead of the importer is absolutely
beneficial.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Isn't every DRM driver both an importer and exporter? That is what I
was expecting at least..

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I still strongly think that the exporter should talk with the DMA API to
setup the access path for the importer and *not* the importer directly.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It is contrary to the design of the new API which wants to co-optimize
mapping and HW setup together as one unit.</pre>
    </blockquote>
    <br>
    Yeah and I'm really questioning this design goal. That sounds like
    totally going into the wrong direction just because of the RDMA
    drivers.<br>
    <br>
    <blockquote type="cite" cite="mid:20250123135946.GQ5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">For instance in RDMA we want to hint and control the way the IOMMU
mapping works in the DMA API to optimize the RDMA HW side. I can't do
those optimizations if I'm not in control of the mapping.</pre>
    </blockquote>
    <br>
    Why? What is the technical background here?<br>
    <br>
    <blockquote type="cite" cite="mid:20250123135946.GQ5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">The same is probably true on the GPU side too, you want IOVAs that
have tidy alignment with your PTE structure, but only the importer
understands its own HW to make the correct hints to the DMA API.</pre>
    </blockquote>
    <br>
    Yeah but then express those as requirements to the DMA API and not
    move all the important decisions into the driver where they are
    implemented over and over again and potentially broken halve the
    time.<br>
    <br>
    See drivers are supposed to be simple, small and stupid. They should
    be controlled by the core OS and not allowed to do whatever they
    want.<br>
    <br>
    Driver developers are not trust able to always get everything right
    if you make it as complicated as this.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:20250123135946.GQ5556@nvidia.com">
      <pre class="moz-quote-pre" wrap="">

Jason
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------cJLwA8MwdTi4EeWzVA8IMa0U--
