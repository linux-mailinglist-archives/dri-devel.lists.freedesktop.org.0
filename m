Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E5AC64DEB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 16:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F042D10E3CB;
	Mon, 17 Nov 2025 15:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XlzsVzoW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900F210E38A;
 Mon, 17 Nov 2025 15:28:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2uQY17PnqxKn2BgorbHRqXhznl99vHw+aTkjzvf8Mdw9uD/kR425xhFQSv+qrC61KG3mzjcL/aS8F0YuqfpzmVvM8yrmUGG6KyVGZeIYWImkW1H+Fn5D5qhjmZYLEE6LkMlHiIwlW0qGiSv2xlxsZKNdUtzwCCi2q33neRQ9NcWoOA7u+6ry7svm/v1+9QvqGwtgMw2XfTP06wtouPQF4gWOjAxwwfrpObBAEbJdvkU/j4RQZXBmX8qkTma8jLbci6qxh/m+aJj/4PEuvQr023bdYpLSlBOz8PKI5TChXol23batqSjHZLHa5j2Eus62BwS+ucjiedoDrCwFe+sHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nl+OWzJlf5pDhM6Tf/b4leQ/nkSLq2S30Z7FXAa2lX4=;
 b=QcOPzJszwvWpTOvf+IzW+cHste9W6TE8sGZHbOv/bqFB2zL7nz4/qMRKsMM9EKgyetp2dmny9cKtp0EDfp8iC4C78dfxtu68JSN7C3Im3TcTzcJZq1wCctcmVmdvbPknx1dVzIWpzFLvEG7xVCiuJNXybgoT8ryK56j7sGMXnFaA7UVlfZFJPWQmgubwcb19QGg6BeZWNlEVlqBe/oeFgrDOEcfzevODZJN2Un5qr8nz/Cb6Veb7GcokCeTeOPjOH7AX+0mu/kh3ER5i2MsGjt/tnJIPE1DjhYlkw6xpvBBR+aGAeYkgC5hH3qTft2wHsJjiQZZuHWpGuYMi7uPaFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nl+OWzJlf5pDhM6Tf/b4leQ/nkSLq2S30Z7FXAa2lX4=;
 b=XlzsVzoW/tnPdsG06FS79VzwRZ/ufCvKZPbT1T0ZdVU5jZD/9D2d+WSBA0ARCcsiv/6K1Iaao4XDc554pD23/UJIkP1mCSLvuvL8NmA5gCfqmhr59kudNxsLcplckLgTJWOXgAbdrpv0+Hp/dDMBQrMlw4BOnLzq24cNmMMkkaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6115.namprd12.prod.outlook.com (2603:10b6:208:3e9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 15:28:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 15:28:12 +0000
Message-ID: <2c43d30f-c8b4-4c75-8b2f-331366716552@amd.com>
Date: Mon, 17 Nov 2025 16:28:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Independence for dma_fences! v3
To: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <26a1379427d97e969654061224fb36d37e87af24.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <26a1379427d97e969654061224fb36d37e87af24.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: 842bcf60-87f3-4e91-f0bc-08de25edeb92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2NUSnJmNEFYaFJVaEFhOGVyRWNVVmh2QWZ6NWZLNFh2VC9hK082eWhHeDNC?=
 =?utf-8?B?MzRMY3J5M3ZwcVVEV2JvSjQwUmpLQ0xDQktueGpNRWo4Sk9LNDllY2ZycVdK?=
 =?utf-8?B?ZEltYWhLVnJncm5ocEhzUC9lWEE4bkloOTdmK0RKdEUwZkR0T0hWT3JMNGlz?=
 =?utf-8?B?N1NqQXhicGgrdVVZQXRqVVozemVacVQzeFdDUDkyd3l2b25GMnhmVmxUQU1V?=
 =?utf-8?B?eTY2bFB6QkYxYmY1UXhaVTVuRnpYU0FwZXJxYXNOL0svanBNeWxkaFBkWE9m?=
 =?utf-8?B?RWlkRjN4MlhNNW56a3pKNXMyY0Y4a2NibkRQUjdLakpIcDhxRUJIN0RrbHNJ?=
 =?utf-8?B?ZmozQWR5d3g4VWIxb05tVkhHWXByQlBwenN0UklyWW9NOTkyTHN4bUdueUd5?=
 =?utf-8?B?cHRjRmw0UWMxRmxKa1MzY2h4QVpjbFdBQTJFeG1rWWhwUmd2Ry9pM29pd1V0?=
 =?utf-8?B?YmRudkI4VFpPRFQ5d1JzS0tzYlhEbDc0N2VydFVBemNJNnpxVlZ2MXQxT3gx?=
 =?utf-8?B?WmdVRlJOQzVVdzF6ZjZ5S3pqdTNvbE1NM1Q4SGlMYzFlN3hSSTJLSW1MUHRz?=
 =?utf-8?B?U1FkbXgvTjRiQ1N3S0JkSkk3aGpBWHN6ODNTbFhLaXloUWZnUHEyM3dKZnhy?=
 =?utf-8?B?eVRqRStvUXhycklpSUFRdytTNnB1cVhrQ1c1T2tuZzcyckJUcjZzbmtyRWRE?=
 =?utf-8?B?WER3VlIxOGc1S0JaTEE3SXU4eC91cCtyT0o5QkphSHUveldLb0pxamdtWEpL?=
 =?utf-8?B?S0pMaHJEYWdQTG1SOVhJWTVEVkV3d2l4NWpyYTVtM2ovVTVXK0dTTDZtaStS?=
 =?utf-8?B?dW1uQjlPbW56YWV0RlJJQWxSWG9NSXREQUtJb0h4NGdKQVVLUXNKUkxyVWlE?=
 =?utf-8?B?TkFQUWdqWXhLM0E0dlE4eFZCd0NVNVV3N1BBcEZDc3htME1DYk5tS0xLOTll?=
 =?utf-8?B?OVYvTFZyaXg3ZmRvY29tS3JVb1hHYUxYUnl5c0FpeEQzSUVabENmN01ZSkUv?=
 =?utf-8?B?U3p2MFN2bStsZUhPbUg5Yk5JYjdMd1gySkk2aHI4SGpLOEtEZXhKVmtSL09M?=
 =?utf-8?B?aFUyQUtGOVR4NkZYTnF5Wkphcno1N29JNjRWUlJmWWQzT3F1UDBLWVF6ZVhr?=
 =?utf-8?B?NVpoa2oxZWFpN0ZFWFR4ZTNhZU9BSmRDZWYvQ0NPRHhhNFcwWGhrVE1CQ0I3?=
 =?utf-8?B?V3lhMFdXTHAwNk4vaTllNkwrbTVUNm9GTTVmUkRiOGRhY1QyNDhoS1A5RnFR?=
 =?utf-8?B?dlAxOWE1MG55U0t0RFFXTW0vRjVtVkJBdU12S2pjcFFobU5QWkM3MjRtdHht?=
 =?utf-8?B?LzZnbzhLK040ZnhHQmJ6V1ExSW5ZZU03TkNoRi9SQmJKOGxtbS9mR0RDbUJj?=
 =?utf-8?B?QjQxUlZ1aUpNZS9TeUdnZWNTUlFGQkNZZEhrNk85RlRSOUxUb0wvK3gybFla?=
 =?utf-8?B?S2pGWGVUeUF3eFdQdnIzUHUwazZvM2Qxb3NEdFpVOFlWWXJyMEhGWUIyMWdk?=
 =?utf-8?B?elJXTnF4OG9WdmF0ZDhqeDlnMk80TlhqczlQR2Q0M2wvTUVpNzUvd0JmRTlC?=
 =?utf-8?B?L2RoY1JMWnlhV3dZbTJJNWRBRTBXb0Rqa3FHQ3k0azBGNlFVU1ZlcVhuZ2tL?=
 =?utf-8?B?ZWMzMnM2bXV5b3FkUDlUd2JYU3BTRDJjT1pWM0V0NHVKV0RlVmo3NzhWeElT?=
 =?utf-8?B?L0hhTldmYVJzZE1xQlZ6byt4YS9OSWhoWWw3UlBVS2pSbmVmeDVEMmJWL0pN?=
 =?utf-8?B?dDN0NldhT0ZacjMxRXdWR085dFJSeXh1VUE2Q2VoYWZ5VkVEdHVMZExWN1dy?=
 =?utf-8?B?UmYxNG9ORUloejYyc3NuOEJ3TDkwNDVCK2ZXY2tQNjlWcVBjYnpIdTgwZCtn?=
 =?utf-8?B?dWNXTi9KanY2cy92T1hNUmJVWFdRbkovTXVBTjdhYUJRbDUxd28xTHNsNFdz?=
 =?utf-8?Q?oFUEF8i+XeXsBxf5HJBWg+Nfp876aP1v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFJ1L1N2am53enQzWFVSaTFMdy90Qk9pZ2hJTVZMTE1VVktLM0lPT2NRNkhV?=
 =?utf-8?B?WDQyRmp0M2QxZ2JYMEtGRkt1WVYvRVJKUjlyQVUxcGJEa3BzbUIzNzdlY2RF?=
 =?utf-8?B?R0ptTnEybjJOTEZQbHczamE0VjZYWXpEWkRGajE5VFVkNXpkK1dGT2V5aWQy?=
 =?utf-8?B?bFQ2OTRLNnZQWENSWlYzVm5xblRlaTAzM1VxM1B0dHhZVVFtTDRIN1pzUzhU?=
 =?utf-8?B?ZFNOemR5Mzc4MlV6THA4UEhpWkt2aVllQWVXbjROV0hhOTBZTi9yMlAzeEsr?=
 =?utf-8?B?UnJoZ0Z2RzlIVWFvaHFLUURFa2ZyWmZPYk9yTWNDTGtic2UyalkyREEyN2tp?=
 =?utf-8?B?TEJzVTdyempNN2k4WkZwdFpMWEM5bjliMXFYU3JFV002cExhTW9HOEdNUGRk?=
 =?utf-8?B?NHRpbHpWMGJhUmQ5SVA0OEd6QzRtS2FuRHR5aUJYZkxMeWNReTcySzcyUGRK?=
 =?utf-8?B?a1UxQURyWFhLUHV0VG5Id0RmdUZYWVFTZzd6MkxrZlJpWUo4S3pmT1lQdENC?=
 =?utf-8?B?NEgrWGlLOHphUjZXaTVXV1lCRmNRMHFwdE1YcXVucWRmNEg0ZlpTTStoR1VP?=
 =?utf-8?B?cEhoUmljakhvc3lCczNYb2EwTkNKdk5WQ3dESk5vZVVwcWhvUDNHUEh6eGly?=
 =?utf-8?B?YVd0MUtwc2xtTTdLOSt0czVjeFloT3I3aFpUYXhZZVNhWmQyOXh1RlE5dkxQ?=
 =?utf-8?B?NURaTGlSQ3RiKy9wN2pMWG9uZEU2ekFHU0dwUis4RUYrRUNKM2VpdGluSFBQ?=
 =?utf-8?B?UXJ3dXNVQzRtNTVGMWtmdlhPa25OTGJhdzRKc1kzaTNURE1mUlVJVk8xdGQx?=
 =?utf-8?B?emNxZWM1MXg1U3JPbFlYNjJVdWlhRU9kOTh0MEJmTHEweWtNcXVwSlFsRjhS?=
 =?utf-8?B?NVJ6NTVxRVh2L2VYVFpWcnJCWTRFM3pWK0JNZUo4cTlXN0o1R25HMGdPZDhP?=
 =?utf-8?B?TDlYVU1iMDVlellZUFVBVzBxLzRyckpFMm5KcGRoa2MrdzRPeVIxdy9xL2xZ?=
 =?utf-8?B?cFJGOU5KU3kzTXdHNDVQMnN6MmxjZURIdUxhU1NGM3RyNGp3NzZtRWZwTzVJ?=
 =?utf-8?B?QXpkSmpjZ3gvcUx5Zm1EQUlJL1BEWS9rSE1IdUVLVnB1Yk93QTQydXUwTFU0?=
 =?utf-8?B?MWQ1V21EWXJ1dStKR2JKT2dyMG5LTTkycG1jRDh1L2RSUkFXeWs5QkZ3WGxt?=
 =?utf-8?B?RC9BZXBEdE8vUlVROE1aM1J3MlhZZHo3RXVnL2t2cnUzVVBsd2hwWUdPaVRZ?=
 =?utf-8?B?b0cvT3FaVHp0NHN3S05OajN0eEl4YUNEcjNnVE9scEE1TW85ekhhejFXRVhK?=
 =?utf-8?B?Y0hTbUh6ajJZRWNRN2NhVXo3VG9ObnMxaXNnNEgvU3NvdmRBSXAxNXFtaHhz?=
 =?utf-8?B?bVdjK2dpLzZJWVBtQmU3Um44VmlLTDlIaE5DNzZlR3R1dHlYWWhSQ1FyY1VH?=
 =?utf-8?B?Q25wLzdpaXVFcnhwczA5NnpCU2duVHg2KzNSSmtBczRoSnhrTXJ0TVJEMTNq?=
 =?utf-8?B?R2tpL1Nqc3hvcS9HbjhHcnk5R1BnOWFqUjA1ck9BUVBhd0U5dFZMTXc3dlMy?=
 =?utf-8?B?ckMwT2U3VHFETWJLUzNRNnZqU0ZZM2VON1JSZTZKUGp1MTJtUUwwREYxTVAy?=
 =?utf-8?B?cHRHR2IwREpPSjhCL1FuRW9nODY2RGRuc0hvRFdFVSt3eDlPWkJsT3N2b0hX?=
 =?utf-8?B?ZnY4VHFicjBURmNpTnh3b3padWVHMHcrUDh6WE0rdDkrWDR3VDdzWG81Y2JU?=
 =?utf-8?B?ZFRqTWFrQnAyY0ZDNXkvK3RiNmxva3hQb1Q0SmJQRUFIeWZrN3BsRXR0ZDZS?=
 =?utf-8?B?azZ2SUNnVE9DQjIvVUJhblRoYm03ZTZIbXdFQXdBQkRXTGdBN09YN3h0YXVF?=
 =?utf-8?B?amVZMm9MOVp3cWVOaVpyMDhDaFFjTkFQWk1NMENILzZZUk5RWHlNRzhuNFJv?=
 =?utf-8?B?b05vREpkRytjV3hyNzFGaGt6VEtXN1B3VnpVcnFpa1NGUlFZVy9sSm5BNUtF?=
 =?utf-8?B?VkMvSzIyMGRCaHFzRUt2N00zT0g1Qlpjb0RTbGYxMHNBZkR2N0ViNVZWdTJG?=
 =?utf-8?B?MzNLWXhYNWVla3laUWJtN1Y4aUZQWXgrZi9MbmhOdGVpbjg2WitLSGdFaGYv?=
 =?utf-8?Q?i48BQgPWxE21ESOo+J/AZ7LZB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842bcf60-87f3-4e91-f0bc-08de25edeb92
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 15:28:12.6014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56gfVXAQwC5ei7e1Kvyp3/E27j2UtqT94ciVrr8aVbWpNanR3o/UZscqkggY/i22
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6115
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

On 11/13/25 17:20, Philipp Stanner wrote:
> On Thu, 2025-11-13 at 15:51 +0100, Christian König wrote:
>> Hi everyone,
>>
>> dma_fences have ever lived under the tyranny dictated by the module
>> lifetime of their issuer, leading to crashes should anybody still holding
>> a reference to a dma_fence when the module of the issuer was unloaded.
>>
>> The basic problem is that when buffer are shared between drivers
>> dma_fence objects can leak into external drivers and stay there even
>> after they are signaled. The dma_resv object for example only lazy releases
>> dma_fences.
>>
>> So what happens is that when the module who originally created the dma_fence
>> unloads the dma_fence_ops function table becomes unavailable as well and so
>> any attempt to release the fence crashes the system.
>>
>> Previously various approaches have been discussed, including changing the
>> locking semantics of the dma_fence callbacks (by me) as well as using the
>> drm scheduler as intermediate layer (by Sima) to disconnect dma_fences
>> from their actual users, but none of them are actually solving all problems.
>>
>> Tvrtko did some really nice prerequisite work by protecting the returned
>> strings of the dma_fence_ops by RCU. This way dma_fence creators where
>> able to just wait for an RCU grace period after fence signaling before
>> they could be save to free those data structures.
>>
>> Now this patch set here goes a step further and protects the whole
>> dma_fence_ops structure by RCU, so that after the fence signals the
>> pointer to the dma_fence_ops is set to NULL when there is no wait nor
>> release callback given. All functionality which use the dma_fence_ops
>> reference are put inside an RCU critical section, except for the
>> deprecated issuer specific wait and of course the optional release
>> callback.
>>
>> Additional to the RCU changes the lock protecting the dma_fence state
>> previously had to be allocated external. This set here now changes the
>> functionality to make that external lock optional and allows dma_fences
>> to use an inline lock and be self contained.
>>
>> This patch set addressed all previous code review comments and is based
>> on drm-tip, includes my changes for amdgpu as well as Mathew's patches for XE.
>>
>> Going to push the core DMA-buf changes to drm-misc-next as soon as I get
>> the appropriate rb. The driver specific changes can go upstream through
>> the driver channels as necessary.
> 
> No changelog? :(

On the cover letter? For dma-buf patches we usually do that on the individual patches.

Christian.

> 
> P.
> 
>>
>> Please review and comment,
>> Christian.
>>
>>
> 

