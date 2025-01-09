Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FB6A06FA7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68ABD10E44A;
	Thu,  9 Jan 2025 08:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="udL4+Jz6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D095410E44A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 08:04:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OgHI++p6FUAkxs7tXAa6xbGeb9y11Of/zCLit1tQfyUVoxup2b2Rh+dWmjXpw+GaGT4cXVFg5KG7nfFYwfWEL59SZeEQvIn+V04wv13jp9GgCvBiC/cIab5h3jqCDW2CFL5jmmJS33BW0pIqsdSFV6RoRqwbVeW3Q8qwrK0fpHdsRhgYHA4O3u1AoViLSem9JhT5419w6D6N9/CvB6obOiml7G9FeAgonaxYa68lvTYCkkITowd8DieNXysGmpZxaQcwH36k05dcKSY395A24/eJ0f39G795lVKPp+SqNDbMgKhgMjHw6JCfIHVaETNF5icXpEfG/6vTCOHHC0xy6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSyygSWwbGx83uvfzHjRWixiwPPriXept9ewEl0PKsM=;
 b=WQnbMaTZqYFH3KAOQ2hxsUd8cVf0Q1cVN6ds4Xk9SXBvovi7g9vKPV5F6/lQYNKHeu/cPB/mlG34hmufRS9PbxO94wSOylaxbiYgFBoo1uyT3K9ZEZ/9KqeJwGqivezIOKWuTq3kByi0HuOnwbQchtQOwnF8Wh+XQXsifKaPnvg5nlLJcPSu1AgMvZwMQaxoTJ/88paIBatYh62aSoz/LLttwuJ+18Scepj5koU+oMvJf988WnJc6DSdcpWGygY2nFaUclFZqDlbfINkYRRKjMNsgo+kooTyhAeDBbeYVvYr61a2i263hN8y41ouwTN5dw/YxjPW/VyVtBAjty+H+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSyygSWwbGx83uvfzHjRWixiwPPriXept9ewEl0PKsM=;
 b=udL4+Jz6fV87UsHk3AUNK+3Z4dio37tXoqKrvqwLBJklACG6Ez5QHwBboRatcbIYnm4IOMvLM0bEyRGzX5RuHEicwY3O6SQT68w/vYEBnEySpeFmXj6fwevcVEiGDRzCe9Iw5eegAD5dfcH3q/uS9sC1G4czdldfoMgS9QsqVmY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8057.namprd12.prod.outlook.com (2603:10b6:806:34a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 08:04:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 08:04:09 +0000
Content-Type: multipart/alternative;
 boundary="------------2sUZvlyhl7eK1QMRPm49eYsn"
Message-ID: <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
Date: Thu, 9 Jan 2025 09:04:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
To: Xu Yilun <yilun.xu@linux.intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
 <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com> <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: FR0P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c0516e-bc6f-4948-859b-08dd30843226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TW8wVWErSDZIOUxRL1M1dzNDbWpNZ2k3N3hJUFhhckU1dldCYmtlTERWY2NI?=
 =?utf-8?B?UUZaSnVMYVpTVG1oeXdrZG16QnNHWXpXQ1VXTmFiaTd6TkxUT3c0NzBtSS9X?=
 =?utf-8?B?eUJJRTJicU85Y0JrOThzekN2K0tCdVM2ZWt5REdDOCtUTVlBanJiczJHWWRW?=
 =?utf-8?B?dEFPczd0TXdCbDU0RWhEejdDZ2hLc2NBRDBiU1QzejZnVVZwUFpwUVNRUTJo?=
 =?utf-8?B?VFJKbHB1S0lCTFdFakt4S29weXlaR0Z4aGJRVWp4VysrNjV4TnNib011YjI1?=
 =?utf-8?B?QmExbUZPTGNTUXBVY3ZTbWhUTm1EWndxZHBucXZhM2ZvMWgwajdvOHZuNlZj?=
 =?utf-8?B?czJoVnlTaWdzK1c3QUNTUkZKWHA1UlB0MXZnQTFPU3Y0ajZiY3J3UDdsN2pW?=
 =?utf-8?B?UlZHSkM5YTZjckIvc0t2eFBHMWxuc2NRU2g2MTV1c3VqMFNUK2NzMGFoOEZV?=
 =?utf-8?B?WDRHR1gwbW9seUZ5S0Y5bW1QcGRJaE5JbUNrSjB3QXRSV0tGYnh3YVJFNGd5?=
 =?utf-8?B?V0duMUNZUW5GTWlsdHVVcVk5MmNjQWROY3FmSWdqd1ZFSHZSMytZZ1QvWnZJ?=
 =?utf-8?B?cXczd0lvZ20wOTJwenliSS8zTjVORG5YZy80OFVmYXNXcjJ3V0lRRi9hdjVU?=
 =?utf-8?B?bkdPSzVyeTg2QjVwQ1c1LzRLL0lzRjZrajI4MFJGd0ZpOURCaUplNDA4T2Iw?=
 =?utf-8?B?ZjZBQ21NOEU0UUVPcE9aZU9INHZUTGdaWGZjNzBON2FDeVVnWFI3TWwwaktC?=
 =?utf-8?B?cjBpQUxZTEdnKzc0RkxmNERyVWxWR0ZMZkdla1NTd0VLVC9wT2VYVTBuZTBT?=
 =?utf-8?B?ak9sWDE1QTIra0FPNDNteGY1dUthSjB1MHhVNGVsK1FkdUtEay9yMFZtQVoz?=
 =?utf-8?B?RDIxcGR3K0RSVnNuSnh0Y3NTMnJmK1U2M0krZGFhbEVaSUlCa09YWU0zMUEy?=
 =?utf-8?B?M016WDBheFNVMWY2WUNmKzN6dGRRaHBLR2REK0EzeERuMnA4U2NpbEJJMW53?=
 =?utf-8?B?NXh4cDNpamo4M2FjTCt2SElsTHl1YTRNazdMVkMyaHJOQ0tjeHhGcWRiYzhz?=
 =?utf-8?B?RFpIK3Zjdy9CM1BzRWh5dytIYjdiL1NBR2R2ZCs5aGpYcVJlcFVaMllIdGhW?=
 =?utf-8?B?VWtvNG1UVUtsTlpYRmtwcVVtdm5nMWZFZjA1eGxDNVUvelByVHRZdXhwMUlD?=
 =?utf-8?B?Q0x0WEF3VlRRb2pmNmNDZzltbVZvaWt3ZWJ5a25mUjI4TFZIRW5NNGtYdzhM?=
 =?utf-8?B?OC9zRnBNM1UzZ3NETkhtdnY5cVVUTGlzTVAxRmZuUVl4c2hSd0lzckpUcDRt?=
 =?utf-8?B?VTZKNFhBMWs0d0F6Nm9Mc1U1U1ZpRzVabjJBMzFkdkFyZ2UyMExsZVJPeU5F?=
 =?utf-8?B?ZUpuTnV5UEdBVm1qM01VeEFlSHNYbGZ4aTRpMDZETG5QVS9iSUovV2JBdXZp?=
 =?utf-8?B?WjllR2RJNm1IQXRlQ0tYRlMyektKbUxQZlBGb3RHckttNHpFS2lMN0h4MXA1?=
 =?utf-8?B?SjBqditNdUZlOTdiOWZiRlFiL1duVWlpbTdscEJYcDJOV0ZTRjlDc1c5M0Zk?=
 =?utf-8?B?TFN2NXZYY1ZjQkV4QTJnVE14K1c2Q2FZQ2lycUNLdWhIdEM5M0RkeW1SNjNK?=
 =?utf-8?B?WTNWUGx0N1haTE8xaHJXc202a0MwbDAxNVFIQkplZEZqbFNRUVhTSHNucTl5?=
 =?utf-8?B?VThlNFh1SjBOOXVQWG5yY3ptUStOUllBc2dwZ3h4THdVbmpOM2JpTlByNzdl?=
 =?utf-8?B?TkZRTlh4NVBDRFRHdE4zNnk1NEo1NnRINWh2TjFlWStnQytsVyttZ2RYd1ln?=
 =?utf-8?B?dzdDWEFOaDlWVnJ6QS8xd3p2cHVQZ3NYUUUwQU9qMmhySTFCWFJGZForY0kw?=
 =?utf-8?Q?QZ7qSUJvv3mnL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXp3S1NkVXo0TERMcTkrZmRLa1hpaDN6SlExT3U5c29VaWY4TlpwTUV3ZVpt?=
 =?utf-8?B?ZlBya1d6SlNSdDEzaEx6NXR0R0VxRVpaM0xuU2lOdnJtNXc1VFZBSUFWM1Fk?=
 =?utf-8?B?RlZPaTczakFjVzBxSlZCQWMyZ2dVRStCeHlKMDI1SWEwUkxrNDNVVmVvY05N?=
 =?utf-8?B?M3MwanNFMzE5VG1CUlZRU0xKc3RmTUREQkpVc3ZPbWlqNHU0azRoY2RzT0NU?=
 =?utf-8?B?cHZvTlFYR1dLcVpTSndLaGdCQmtad2swdUFCY0ljekh3d0dEeGphOWZGVnpD?=
 =?utf-8?B?b21YMWg5dklkWHVjbGt6ZkRSU0owN1FCOE9yUWhPM1FhQ09LcVRRSE9NdmZW?=
 =?utf-8?B?dzdGNHhteUVUOEJMQkJtOHhsMStoSjVYQ01qT3dIR2tjQXd1NWhXbStqOFN2?=
 =?utf-8?B?ZUdOQVhDc25xajBtdno1UE03a2dzWFpXU1U4bEQ0SW9kc1ZQS3RSRTM0RGtl?=
 =?utf-8?B?c1l4S2tPOFkvUS9rSDZhd08zeVJqZ0RlSUZVKzRVVUlzRmIvb0ZCS200UVpy?=
 =?utf-8?B?SG1RYWQybFNXdmNmZXdrdnQ4UFFsRHhvSXFqRy9QYlYrRFJuU2dRM1ZPYzFr?=
 =?utf-8?B?R3I0SzdSUGpiQUJrVXQ0TGsxeHhXWWYwKyt0TW9rbEpyZ00rVXUvSHB5MExN?=
 =?utf-8?B?S01UZFV4dUhlUnN0TFdCL2hHZkRpbE1xMVlQSTAzOHpsdGxiQ1JpQytMaXM4?=
 =?utf-8?B?TVNBZmNtMHpuV3NoaElTNVhEa0tSbnZTall0bW1VTEFtdlg2ZjlvcC92Vnh1?=
 =?utf-8?B?Z1V6YmhmL0M4STZaL0czMmgvNGNwUGFndEplR2RoQW5BUlpNTVlFa0tMdUMx?=
 =?utf-8?B?U1R3TmtXMzdDcXRiZnB4WEh4V2RTbGo5MjhCajJ0UlJvT0ozS2hZVjB0bkd4?=
 =?utf-8?B?MDNCK0pDYUh1L1lFd1dlUklvS3JDY0ZCVWpmNVFpSytZRnJPY1ZKbVM0cWNt?=
 =?utf-8?B?Z0hFMzA2SkQzR2Q5OHJoV0NpN2ZpZElqSUsxZUw1MlZnUE9LZDluamVBd29w?=
 =?utf-8?B?NGVtQnVmVGpuRDVCc2FTdjFJNlVTM0NTdlRTOEkyQUdNSmUrUWlVUW1naFRo?=
 =?utf-8?B?RTB2dlg1cHgrSGUyaUhMZUdjRTF6V0RFMm0wVURWV2xYazc1TnZOdVVCMnFi?=
 =?utf-8?B?TUE0dGFBWUJHUWNkTmpHNkZzc1lKM243ODlySE1qUjJKclhtQmdjdDdRajNW?=
 =?utf-8?B?YUx4czkwaWUwYWpGN1dIMVhmKzgyT3Bxd1ozb0tiV2FrSW56RkNlZzlLUkpo?=
 =?utf-8?B?cHZiSjlaSkRLQ2UxN1FxaExpOTNNUnQ2VjJsaVFka2NpTG95RW5HeDhCbmJw?=
 =?utf-8?B?eUtER2dyeFZFazNwa29SMkZ2djQvaDh5MUhmWEJJdzl5VGMwb0p5MFNpWGNk?=
 =?utf-8?B?QnhjRk44UnZnU2ZFeTU5ZE4rTlFiZEtNb0tWZGRLRjVtMlI2emVJeUNTMnJD?=
 =?utf-8?B?L2JoTUxpR3N2TEVQdUpmK2h3U1Ftem1DWTlBNlhpRm5iU3U3QlllNmtmQnNq?=
 =?utf-8?B?QVVtWkVjZFJ4RDdvNHE4VVBQcHRlK0NUa09kNGhNRGxydWhwMG5QRHhpNlNq?=
 =?utf-8?B?Zi8vTTlEWW9sVDJlUTFVZS9qaHlTRUo1WTRSOFZTWHhhczZUYWxDekRWd3pX?=
 =?utf-8?B?eGU4OTFNaHBhd3padnl5cVh3aFo1WGhjWEFnMkdXNVBUNVpVY053TWxrNU9r?=
 =?utf-8?B?V0E5SmpNR0dBZjh0VEpEKzh3akhwVW5VK0tuT3cvclBJclA4cG50YTZSWEV2?=
 =?utf-8?B?bDljaTg3MzlNMnQ1b0JWQjBqbmVjMzdQRDdVRGc1c0NuK29WNEQvdUFiN0px?=
 =?utf-8?B?NXBOOXFLV20xUGZjallMdCtqT0pvWVdWTXpWeUtWNVhFUDFSUEpJWXBMZHpW?=
 =?utf-8?B?d3pmRmpDMHlXOTlHbWxXRGhsYXhpakRCT2VkbkRsekJjV0ttRTNqQVZVL0ho?=
 =?utf-8?B?TDZidFhYcml1VXBIdmsxR09JWDB3TWVIZy9wSkJ1dStjVEZmc1pVcGZqaXBK?=
 =?utf-8?B?My9uVURKS1E2azlkemhmelZYRTNkV1F3ZzN5UW1kWG9BU0hqK2ZqOVQ5WEJy?=
 =?utf-8?B?YmNiWjJweWk3ellRUU9DMXVUY0RtU3BCOEV6amYxUmxXci9HM0JRU0tiM1pY?=
 =?utf-8?Q?thgqK8vliCr7+Tsnnzv/OpMA3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c0516e-bc6f-4948-859b-08dd30843226
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 08:04:09.3230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1FobMKGPbIIlelYoojt/tLHVhV1VeeILPNkyysTOV0UVzKUq+HzVE1zwU016s94
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8057
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

--------------2sUZvlyhl7eK1QMRPm49eYsn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 08.01.25 um 20:22 schrieb Xu Yilun:
> On Wed, Jan 08, 2025 at 07:44:54PM +0100, Simona Vetter wrote:
>> On Wed, Jan 08, 2025 at 12:22:27PM -0400, Jason Gunthorpe wrote:
>>> On Wed, Jan 08, 2025 at 04:25:54PM +0100, Christian König wrote:
>>>> Am 08.01.25 um 15:58 schrieb Jason Gunthorpe:
>>>>> I have imagined a staged approach were DMABUF gets a new API that
>>>>> works with the new DMA API to do importer mapping with "P2P source
>>>>> information" and a gradual conversion.
>>>> To make it clear as maintainer of that subsystem I would reject such a step
>>>> with all I have.
>>> This is unexpected, so you want to just leave dmabuf broken? Do you
>>> have any plan to fix it, to fix the misuse of the DMA API, and all
>>> the problems I listed below? This is a big deal, it is causing real
>>> problems today.
>>>
>>> If it going to be like this I think we will stop trying to use dmabuf
>>> and do something simpler for vfio/kvm/iommufd :(
>> As the gal who help edit the og dma-buf spec 13 years ago, I think adding
>> pfn isn't a terrible idea. By design, dma-buf is the "everything is
>> optional" interface. And in the beginning, even consistent locking was
>> optional, but we've managed to fix that by now :-/

Well you were also the person who mangled the struct page pointers in 
the scatterlist because people were abusing this and getting a bloody 
nose :)

>> Where I do agree with Christian is that stuffing pfn support into the
>> dma_buf_attachment interfaces feels a bit much wrong.
> So it could a dmabuf interface like mmap/vmap()? I was also wondering
> about that. But finally I start to use dma_buf_attachment interface
> because of leveraging existing buffer pin and move_notify.

Exactly that's the point, sharing pfn doesn't work with the pin and 
move_notify interfaces because of the MMU notifier approach Sima mentioned.

>>>> We have already gone down that road and it didn't worked at all and
>>>> was a really big pain to pull people back from it.
>>> Nobody has really seriously tried to improve the DMA API before, so I
>>> don't think this is true at all.
>> Aside, I really hope this finally happens!

Sorry my fault. I was not talking about the DMA API, but rather that 
people tried to look behind the curtain of DMA-buf backing stores.

In other words all the fun we had with scatterlists and that people try 
to modify the struct pages inside of them.

Improving the DMA API is something I really really hope for as well.

>>>>> 3) Importing devices need to know if they are working with PCI P2P
>>>>> addresses during mapping because they need to do things like turn on
>>>>> ATS on their DMA. As for multi-path we have the same hacks inside mlx5
>>>>> today that assume DMABUFs are always P2P because we cannot determine
>>>>> if things are P2P or not after being DMA mapped.
>>>> Why would you need ATS on PCI P2P and not for system memory accesses?
>>> ATS has a significant performance cost. It is mandatory for PCI P2P,
>>> but ideally should be avoided for CPU memory.
>> Huh, I didn't know that. And yeah kinda means we've butchered the pci p2p
>> stuff a bit I guess ...

Hui? Why should ATS be mandatory for PCI P2P?

We have tons of production systems using PCI P2P without ATS. And it's 
the first time I hear that.

>>>>> 5) iommufd and kvm are both using CPU addresses without DMA. No
>>>>> exporter mapping is possible
>>>> We have customers using both KVM and XEN with DMA-buf, so I can clearly
>>>> confirm that this isn't true.
>>> Today they are mmaping the dma-buf into a VMA and then using KVM's
>>> follow_pfn() flow to extract the CPU pfn from the PTE. Any mmapable
>>> dma-buf must have a CPU PFN.
>>>
>>> Here Xu implements basically the same path, except without the VMA
>>> indirection, and it suddenly not OK? Illogical.
>> So the big difference is that for follow_pfn() you need mmu_notifier since
>> the mmap might move around, whereas with pfn smashed into
>> dma_buf_attachment you need dma_resv_lock rules, and the move_notify
>> callback if you go dynamic.
>>
>> So I guess my first question is, which locking rules do you want here for
>> pfn importers?
> follow_pfn() is unwanted for private MMIO, so dma_resv_lock.

As Sima explained you either have follow_pfn() and mmu_notifier or you 
have DMA addresses and dma_resv lock / dma_fence.

Just giving out PFNs without some lifetime associated with them is one 
of the major problems we faced before and really not something you can do.

>> If mmu notifiers is fine, then I think the current approach of follow_pfn
>> should be ok. But if you instead dma_resv_lock rules (or the cpu mmap
>> somehow is an issue itself), then I think the clean design is create a new
> cpu mmap() is an issue, this series is aimed to eliminate userspace
> mapping for private MMIO resources.

Why?

>> separate access mechanism just for that. It would be the 5th or so (kernel
>> vmap, userspace mmap, dma_buf_attach and driver private stuff like
>> virtio_dma_buf.c where you access your buffer with a uuid), so really not
>> a big deal.
> OK, will think more about that.

Please note that we have follow_pfn() + mmu_notifier working for KVM/XEN 
with MMIO mappings and P2P. And that required exactly zero DMA-buf 
changes :)

I don't fully understand your use case, but I think it's quite likely 
that we already have that working.

Regards,
Christian.

>
> Thanks,
> Yilun
>
>> And for non-contrived exporters we might be able to implement the other
>> access methods in terms of the pfn method generically, so this wouldn't
>> even be a terrible maintenance burden going forward. And meanwhile all the
>> contrived exporters just keep working as-is.
>>
>> The other part is that cpu mmap is optional, and there's plenty of strange
>> exporters who don't implement. But you can dma map the attachment into
>> plenty devices. This tends to mostly be a thing on SoC devices with some
>> very funky memory. But I guess you don't care about these use-case, so
>> should be ok.
>>
>> I couldn't come up with a good name for these pfn users, maybe
>> dma_buf_pfn_attachment? This does _not_ have a struct device, but maybe
>> some of these new p2p source specifiers (or a list of those which are
>> allowed, no idea how this would need to fit into the new dma api).
>>
>> Cheers, Sima
>> -- 
>> Simona Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

--------------2sUZvlyhl7eK1QMRPm49eYsn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 08.01.25 um 20:22 schrieb Xu Yilun:<br>
    <blockquote type="cite" cite="mid:Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050">
      <pre class="moz-quote-pre" wrap="">On Wed, Jan 08, 2025 at 07:44:54PM +0100, Simona Vetter wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Wed, Jan 08, 2025 at 12:22:27PM -0400, Jason Gunthorpe wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Wed, Jan 08, 2025 at 04:25:54PM +0100, Christian König wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Am 08.01.25 um 15:58 schrieb Jason Gunthorpe:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">I have imagined a staged approach were DMABUF gets a new API that
works with the new DMA API to do importer mapping with &quot;P2P source
information&quot; and a gradual conversion.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
To make it clear as maintainer of that subsystem I would reject such a step
with all I have.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
This is unexpected, so you want to just leave dmabuf broken? Do you
have any plan to fix it, to fix the misuse of the DMA API, and all
the problems I listed below? This is a big deal, it is causing real
problems today.

If it going to be like this I think we will stop trying to use dmabuf
and do something simpler for vfio/kvm/iommufd :(
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
As the gal who help edit the og dma-buf spec 13 years ago, I think adding
pfn isn't a terrible idea. By design, dma-buf is the &quot;everything is
optional&quot; interface. And in the beginning, even consistent locking was
optional, but we've managed to fix that by now :-/</pre>
      </blockquote>
    </blockquote>
    <br>
    Well you were also the person who mangled the struct page pointers
    in the scatterlist because people were abusing this and getting a
    bloody nose :)<br>
    <br>
    <blockquote type="cite" cite="mid:Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Where I do agree with Christian is that stuffing pfn support into the
dma_buf_attachment interfaces feels a bit much wrong.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
So it could a dmabuf interface like mmap/vmap()? I was also wondering
about that. But finally I start to use dma_buf_attachment interface
because of leveraging existing buffer pin and move_notify.</pre>
    </blockquote>
    <br>
    Exactly that's the point, sharing pfn doesn't work with the pin and
    move_notify interfaces because of the MMU notifier approach Sima
    mentioned.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">We have already gone down that road and it didn't worked at all and
was a really big pain to pull people back from it.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Nobody has really seriously tried to improve the DMA API before, so I
don't think this is true at all.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Aside, I really hope this finally happens!</pre>
      </blockquote>
    </blockquote>
    <br>
    Sorry my fault. I was not talking about the DMA API, but rather that
    people tried to look behind the curtain of DMA-buf backing stores.<br>
    <br>
    In other words all the fun we had with scatterlists and that people
    try to modify the struct pages inside of them.<br>
    <br>
    Improving the DMA API is something I really really hope for as well.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">3) Importing devices need to know if they are working with PCI P2P
addresses during mapping because they need to do things like turn on
ATS on their DMA. As for multi-path we have the same hacks inside mlx5
today that assume DMABUFs are always P2P because we cannot determine
if things are P2P or not after being DMA mapped.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
Why would you need ATS on PCI P2P and not for system memory accesses?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
ATS has a significant performance cost. It is mandatory for PCI P2P,
but ideally should be avoided for CPU memory.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Huh, I didn't know that. And yeah kinda means we've butchered the pci p2p
stuff a bit I guess ...</pre>
      </blockquote>
    </blockquote>
    <br>
    Hui? Why should ATS be mandatory for PCI P2P?<br>
    <br>
    We have tons of production systems using PCI P2P without ATS. And
    it's the first time I hear that.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">5) iommufd and kvm are both using CPU addresses without DMA. No
exporter mapping is possible
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
We have customers using both KVM and XEN with DMA-buf, so I can clearly
confirm that this isn't true.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Today they are mmaping the dma-buf into a VMA and then using KVM's
follow_pfn() flow to extract the CPU pfn from the PTE. Any mmapable
dma-buf must have a CPU PFN.

Here Xu implements basically the same path, except without the VMA
indirection, and it suddenly not OK? Illogical.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
So the big difference is that for follow_pfn() you need mmu_notifier since
the mmap might move around, whereas with pfn smashed into
dma_buf_attachment you need dma_resv_lock rules, and the move_notify
callback if you go dynamic.

So I guess my first question is, which locking rules do you want here for
pfn importers?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
follow_pfn() is unwanted for private MMIO, so dma_resv_lock.</pre>
    </blockquote>
    <br>
    As Sima explained you either have follow_pfn() and mmu_notifier or
    you have DMA addresses and dma_resv lock / dma_fence.<br>
    <br>
    Just giving out PFNs without some lifetime associated with them is
    one of the major problems we faced before and really not something
    you can do.<br>
    <br>
    <blockquote type="cite" cite="mid:Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
If mmu notifiers is fine, then I think the current approach of follow_pfn
should be ok. But if you instead dma_resv_lock rules (or the cpu mmap
somehow is an issue itself), then I think the clean design is create a new
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
cpu mmap() is an issue, this series is aimed to eliminate userspace
mapping for private MMIO resources.</pre>
    </blockquote>
    <br>
    Why?<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">separate access mechanism just for that. It would be the 5th or so (kernel
vmap, userspace mmap, dma_buf_attach and driver private stuff like
virtio_dma_buf.c where you access your buffer with a uuid), so really not
a big deal.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
OK, will think more about that.</pre>
    </blockquote>
    <br>
    Please note that we have follow_pfn() + mmu_notifier working for
    KVM/XEN with MMIO mappings and P2P. And that required exactly zero
    DMA-buf changes :)<br>
    <br>
    I don't fully understand your use case, but I think it's quite
    likely that we already have that working.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050">
      <pre class="moz-quote-pre" wrap="">

Thanks,
Yilun

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
And for non-contrived exporters we might be able to implement the other
access methods in terms of the pfn method generically, so this wouldn't
even be a terrible maintenance burden going forward. And meanwhile all the
contrived exporters just keep working as-is.

The other part is that cpu mmap is optional, and there's plenty of strange
exporters who don't implement. But you can dma map the attachment into
plenty devices. This tends to mostly be a thing on SoC devices with some
very funky memory. But I guess you don't care about these use-case, so
should be ok.

I couldn't come up with a good name for these pfn users, maybe
dma_buf_pfn_attachment? This does _not_ have a struct device, but maybe
some of these new p2p source specifiers (or a list of those which are
allowed, no idea how this would need to fit into the new dma api).

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
<a class="moz-txt-link-freetext" href="http://blog.ffwll.ch">http://blog.ffwll.ch</a>
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------2sUZvlyhl7eK1QMRPm49eYsn--
