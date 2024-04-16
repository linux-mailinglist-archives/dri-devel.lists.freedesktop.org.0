Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5B38A6AD0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7212310F002;
	Tue, 16 Apr 2024 12:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nDE7nNKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2088.outbound.protection.outlook.com [40.107.93.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C743910F002
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:22:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bu79hwoV6qtmk8i5vZzrqxIhuaIBnUPtmIyM/OSds6FUYxkZ3w6B4ZFVaheH/PR0WTOHekFORTD4MzPWQsbCAVMbNqAVmvwBB0gnE/SAqwZmwMbe1abK0Ye//ZsGz/D/0VleezmKd7WCO3GhS17o7jqtbwtPeZFFb2d/APrvU14pBqhmarRdBBfpWmH+kdgS1t4PoYa4Y9ky2ll7y74F8Z/guhH2qEer+lnzFG5A2R2hKVa1FhLX0CMrBHca9p1xlmdQFez+P+7oCdt7UfABm0AQJZLl19qQve0Zcp/TlMpUPzlca0W+70zMwNVwJhlU+J0EEH3MxdMwe3eVqxpifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmwuJvhs2nlX/5XSXaMUIb9ArEfbacMkyAkAf/yOHsc=;
 b=IhZgwYzrJ2Ny69x54zY1z3MVkFHBwKLUXrVRkY1rspEcGc6VUCIErb0WKuJNdTBk+K8iV2rF+quOPKLrUVdWC5GajrfdUSthv0wEYo3thgsInWEAtKZq8vZ+UKaNYQ9u6uii/VHPtNxodESq67nfxAlp3avyzIGfrlDhF2eOSjgmwtYOeavwJStXLBkIpEIjX+oI5jsaPqoogn8kavHRMphPrAe9o/i0FzJv861ZzRaI/2hl8RcAAnp6U7TtOlMLCBzzBNHpQKNdtzi0Q8G+PfnJmXgEHI3j+xPT0mJrCj5CBeSFPz9Bl6NSoadVxa0inPNiSzzdNaSaoGKx9bq09w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmwuJvhs2nlX/5XSXaMUIb9ArEfbacMkyAkAf/yOHsc=;
 b=nDE7nNKKzDHF/AOxowf4bmBn3XhQsH1wGiobiSpvivMRo5pWtjLTCG8E/92NLrF2SQyRidEuFLbtJ0EBbXBUxHn97wTZZcirLRk+RA3BI8hUFo9ZBaWc31w6gg8M36ocGLmGzV6UMRGIuJOcuGrBBI36DF11iriwHHsf6BdjbyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 12:22:49 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df%7]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 12:22:49 +0000
Message-ID: <0dfe0d91-ad85-bf3f-07a9-9feb73e19899@amd.com>
Date: Tue, 16 Apr 2024 17:52:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 6/9] drm/ttm/tests: Add eviction testing
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
 <8dce0b871861fc1161932adf74d22cf192d8ef15.1711117249.git.karolina.stolarek@intel.com>
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <8dce0b871861fc1161932adf74d22cf192d8ef15.1711117249.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::16) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d69d48-c46a-4107-5360-08dc5e0fee38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fhwk1K7tTFp5Viw2KtJcn9cZo/LhNHwQ8A/asYfluz0qW9MK4+ZnE4cO44MOPPdMHAQ3AqZha65dzu+1KBwL+jSID6qG7BCQpvihCOqIehfJiHNLTIWIVnDTjyGkvgAfBisYhHmouzEah8u7XyF6D4naLoiA4sn0lbTNGqbjvnv0NauHXTfB156iO0ye8ZQ5K5eqdgqHnWHveqCkkzJ2E2iDYPGHUvnf4hNY+XG2eZ7ZHpt45Zy10pzXSuIC3u35C3wcMKoLzDPA2Bo43HcE+EHJeGGA+Y1zo6SdGz/c5yUvK8RZNGYVnt8FBVzuT7yR5dMpPaci2WSkgsIxtBX4KYdXz3UbwLIviDII3fXSyb7KMwKXn42yY2WVheiUPw4IpRMZ7pdsbuY/afVzfdDBS8aHuJWztqwtTKzfv/4v2oc+aBz8eViNO6EDPp5N2VoRh8B+ZJjs8xPfjqP6nMy4Qb49NeE8kx5fmbBqtBGZNSsbZx14oxzMmmi19kImzLnm6xWlcEZ+wzZMjLp07rgcS++6PzVhnOJ00xjGJseUBi/ZRrWxN94pX66+Fyn3+rGuKwhHfAoMP8e7/DLVTvEIJYm3QI66vEMm0JR2iGPVnm/5vUNWptIyH8PHuxvD/JWCzyI85Ywyo8FlJh/MypSijpSi/3gXF8YvhPXMrLX0wSs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWs5ZGNQbmtUdERYQ3lITCtwTFIrMUhCYmJSTVlQVkxsOExJdVA0VmtYeTl0?=
 =?utf-8?B?WHJMOGtWendVa2gxOFB5TEtMNU1QdjZhbHYrZnNPTzJoVTlRYVcwZk1XK3Fn?=
 =?utf-8?B?blQxa1JwSEtqUC9GR0ppR2pMUUFZbjcrL2ZEVmtyR2ZmVVRzaHdnSEt6UTFw?=
 =?utf-8?B?TzdsWEpVK01tdEQ3RmdJZUpvTG5aNy9hLy9DajA2SXh2aWZ2V3I1OUVOZ2JM?=
 =?utf-8?B?MmdENkIrelp3UmR0NUFsaUxaTFZ3ak5VaWZBT1Jzdk5ibmZwV1NGQlg0NXRx?=
 =?utf-8?B?OVZURTRLdWVodlhqT0gyeENYVk01RGY5anlQUTl0ck56aGZvWVZRYnNHbjZr?=
 =?utf-8?B?YjdVNW1rV0ltRzIxN3U4N2JTU2RrcGFGZ2dVMHU3Tjl4MEpwQ3BtYWtvTmta?=
 =?utf-8?B?VFM2d0c4eTFHZnJZZmVUNlZPaHJQYVFvbWNyV2Z6MzB4NEQweWkxL2Q2RXRm?=
 =?utf-8?B?a0FacW0rd1JxRWM5bm1ESkN5ejJVdmIzemZZSitvV05nVzVsRTdHeGdwcXVm?=
 =?utf-8?B?WEsvbnE1c013K2czUFdrdTUydmhvNDFsT3d0bTBKRmNuZHp0WnU5SksrU1JY?=
 =?utf-8?B?U2RkNjQwOGVGNjE4WVpGL1J2cWs4RlJHWXA5dGtxRzFQZDVpS0ZPS0d4TEV3?=
 =?utf-8?B?U01YUmdIb2VTNEVFNFg1TWVIQ1EvYStsMVYvaG1McUdkNExFZUxmbENVcEtJ?=
 =?utf-8?B?UlFLTVJuNXZYWFVLb2NpV01ab3FFMDQ2NlJZZGFrVlhwVlVNUytDdVlCeDdP?=
 =?utf-8?B?cjZsYzY2eWNvRENOc0V1UUdybDhEenFrQlpkeEZaN2JWKzhnRVNFd3RsNng0?=
 =?utf-8?B?eS9scEIwVnJPeTk4NmpzajZmdllDczI1Yk1jVTJxRFU5UlAwalJqQ3FZZllU?=
 =?utf-8?B?dE5yK1lLSE0wNGFXdTk5QlBPVGRWK2s1ZitGS3Z4b0ZTaTczL01FOXgvVTNv?=
 =?utf-8?B?eWlUNHJoYTU3QnM0ck1WRDJMcUxRVnY3NUJWMUJyZWJ0SkIrRVNIQTdZd21Y?=
 =?utf-8?B?RnFQbHcvbG5zclEvUUdMMlJqbmhaU3hEcVZLL2MrOUlDZUFCOTI2WUdSaGNN?=
 =?utf-8?B?VmgwRk10NlQ0WVExTkFzc1ZLUUpzZ0xXRTBqMjdVVlhxaUd4dU55NkhuSUFs?=
 =?utf-8?B?bHpTVVVJRW1hekdVWTkzMzNhWm5zM1E2Mlg2ck5ydWNzZWcrZHl1SVRoNHli?=
 =?utf-8?B?UUcvQW1uS2MwbFhUSnBvZ1AyZnJzWUs5SmRUTFJwTHRxNFRLQXF4QVEydjBX?=
 =?utf-8?B?elR3eDF4a0hwZTN6eHBZTXJRODBUU1NZTVlhNEVwV3lmTVZPRU5qTXJuclRG?=
 =?utf-8?B?dEdzZXM1d0VTTG1kbDYrQ3JBbmY2U25UWGlROFN4dkxnU2l6YS84WnI5dEsz?=
 =?utf-8?B?L2hlcGNpRXBrWUVsTzBmOVhWaVc2U1loVVQzb2ROWW9hazhWZmplQTVIRmVB?=
 =?utf-8?B?SUZQNUs3Tkxqc3NNU0l2RkpRWUtzSGZxajZHU2p0djhyNStCSGxNZEJsblhz?=
 =?utf-8?B?bm12T0J1eU9CKzZFMGd0QWFIVHoydUVocVdkVVVZYkhCYkJqTXFjcDRtQ1Bp?=
 =?utf-8?B?N0YwbFpGWHZ2MmE3REtDR09UR290empwQTI4ZzdnSDhHczVkMGlrVnE4T2sr?=
 =?utf-8?B?UHFKRWdhNCtPYWcxckJqYzEyMFZOTmpXNitzNGhuTmFHVjRoNHlwTmdBbGp2?=
 =?utf-8?B?bkMyTGtyUDBHaWo3azhvSHZiNmQxbnVNb29aVEVrRGVDRGI2MEhsaXRGMFh5?=
 =?utf-8?B?dWVVM21GZXB5ZWo3S0hMbnVtb2lhaE1QZEx3b0o3bHU4aXBwQjBrV0tSWjli?=
 =?utf-8?B?bnFhcFFTc2IxejlDdUNkTENWT2UyTWh2QW5SRndiVEdaR2tiM0RJT211blRR?=
 =?utf-8?B?TThpVnJUVmwzWkl0Y2dpby9GR0xLZkF5bmUvZHIvUTNsMW4yeDRZZktPYkV5?=
 =?utf-8?B?a2R1LzllVXZJejRHQmRtNkd1QVhQajVCWVlWQnZWSm91Q1REYlJPeTZxWmJ2?=
 =?utf-8?B?VzMwWkd5bGtoaUtJWWNBTkY3STY1d3A0R0g4T2pPV3BVNXZZaHNrQUNFa1M2?=
 =?utf-8?B?OFA0bVJ6alRxU2gyNXVEa2p2WG1ZNXFGZDQwdTlKbXNYVVJjRWhsOElnV1Nk?=
 =?utf-8?Q?kzAsLyWmEvqQX0wTGsH/VtNWR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d69d48-c46a-4107-5360-08dc5e0fee38
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 12:22:49.7356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8imd9fRXkp2EBSFVtDKEq56xt5z+iLGeiJbNXAH5Z2U5y+3+XOm1NJehwOjLdM8GuQarTX/ZRAxoTzCY5+GlOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136
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


On 3/22/2024 7:59 PM, Karolina Stolarek wrote:
> Add tests for ttm_bo_validate that focus on BO eviction and swapout.
> Update device funcs definition with eviction-related callbacks. Add
> alternative funcs where evict_flags() routes eviction to a domain
> that can't allocate resources (dubbed "busy manager" in the tests).
> Extract the common path of ttm_device init into a function.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
Reviewed-by: Somalapuram, Amaranath <asomalap@amd.com>
