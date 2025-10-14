Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F99BDA80A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 17:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC0210E1BC;
	Tue, 14 Oct 2025 15:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OrC9icVR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013005.outbound.protection.outlook.com
 [40.93.196.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B5D10E1BC;
 Tue, 14 Oct 2025 15:54:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvAsHujDRLic/20poXDFJDLobC0vYZUHm/USMon3olUpMId1PG5qayy+xEKC4v3UcjEdPjGvyTDNWicJ94dbmVaGzQ1+XFQUeOJxwXkh84DzFFJPItdjvrmBBFhIWRNoOk2ISd/jdKua7dyEjeL8UPa9u7coBR+UYbtYDy0CwhafeDGiifTmw9i2LO15YY0idapqCsVK1fY/9z2IzCerz8jDRyjB4AuLdYQGk1REdPalQSq92HhQR54Jgij6zIKgqWDZwaaQUk+WLE/dZ7Ka/dhYl6nr/1phDfIhTx+SgufyNWBNFbhnSd7D7yQ8xLtNT/2WA2H3+KqkTeU9QX3QWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uxvSQy1/SGsWpiSwJnMiDeTXCPluY2raPAK/CR2paM=;
 b=Wr0NkHctb+SK2qfMvNKSyDHdAn0F2Mp64nEKYbbDnVq1Rrt5kxZ3nrztkmOMGOVAynmX3Su4iqQQmvvOLAG9iur/xQDWjeffkNNe0Vjemdrf8z9qgkCW3YHZGo7Pj8tgtRU0oWSR2GWV6wQ2XzGEnWKolfPIE+U/e5oxPiTs9iQhR4Y+wZvJthur8u5YZB4OHAbqfCOE/w6Yz+lnXAgWQPXfiJ/8cMIctdKkUfDxUD9AYjSX445heWkGw/7y3Q0xe8C3HKdsZ3MFysc1h4cYuiSvDlG2ZxjiJwn3nMJ1OJF6FT4mn8lnFWWgOr/JaOHMMW5FABcaCAnOVmdnim5vRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uxvSQy1/SGsWpiSwJnMiDeTXCPluY2raPAK/CR2paM=;
 b=OrC9icVRiXdtqYEm5qqNv5OyvRCeEDaCqVURZSWpA61dZfDbssnsS/0hA6jBPwrb+BgtUvYFToj+aB5K6UOGFiYCyRfDRmLieVv5hKHIVANciVeNfNVxTci7szyJjQRegorplGSnvVZ2xS6Lh2gpN6S8b9RQrhXo8jXH43wvxrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9028.namprd12.prod.outlook.com (2603:10b6:610:123::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 15:54:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:54:26 +0000
Message-ID: <c5ee86a8-3c6d-462b-b435-e25e8a925bde@amd.com>
Date: Tue, 14 Oct 2025 17:54:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Independence for dma_fences!
To: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251013143502.1655-1-christian.koenig@amd.com>
 <15b2f86e8d6cb1df93edf73001fda2c378926016.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <15b2f86e8d6cb1df93edf73001fda2c378926016.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0361.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9028:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ba6480f-9e44-4275-9833-08de0b39f376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFhubWVBeEthTDZRT0pjdlI5MkE1Qmw0KzBEQzg4TlpFNjhzbFZtbmQ1YjEr?=
 =?utf-8?B?SjBPb3NOKzBBL3pZZE5OSG5TUnZScFIzcHVCYkFjN2t0K0tlTnJYU3JFRlBC?=
 =?utf-8?B?QUd4cVFGUEFLRW02b1lUTWQ5ejhHM0Frek9DU2NQdHNhRFpKOFZjS25WaEhu?=
 =?utf-8?B?U2Z5WDN0Q3pUUyt2MFJLWUl6YXkvMjlQcWJkSUh0MmZGL2JCbHlJTUo1ams1?=
 =?utf-8?B?bVRFRG1xYXlCUE9vaStKTVNocHozR2VXbjFYZWlxL252SnpCcWFydTVuQS9j?=
 =?utf-8?B?eTVJNERFRVNkMnU5Q29JZkZYbVNNajFaclgxOWdLMVpUNXIxa2tvcTJZTm9q?=
 =?utf-8?B?ZEdCeGk3ZDh4ZExXWWZuVSs0SVprVkM5Q1RwNkRDYTE4enRNb2M1cmxDcHdU?=
 =?utf-8?B?WDkyWHl6S1Rrd3pheUtsd0hDVlhLdWRIM2dXc2I4dTRpeEJWcTM5UE1JSHJr?=
 =?utf-8?B?MGQycDFaVkRZeEFVcXNUVHJDdkd5N3Q3cmlzMDNLR1NQU3FwWFRTbkZJWldS?=
 =?utf-8?B?VU91YVRxNm9ablMxNlFXNnRrdEpiemJQTTdqRjlhZ1VMSGhpRnJSbFBzeVMx?=
 =?utf-8?B?OVdvUjNyKzZ4UXJzOUNYVnlubGhybXRpb2kzN3UrNG1Ld1VvNzZBZHdPUitK?=
 =?utf-8?B?SFhEMDZlVFFBaHhMUWh2RTl6S29wK0JBSDZCNEdCUnRtOWRtN2FzQllSMWtH?=
 =?utf-8?B?Y3B0UWJxdTcva0JMUWRZUUdjRUdFeUc0SWY0cCs2SHJObXk5KytjVSt0UlFp?=
 =?utf-8?B?R0lIRGZ5QTA3NzhuRWIxb3ZTK1k3eEFUZU9tRnJzVHMvSkQ3SmhLdEQzY1Bm?=
 =?utf-8?B?UVVwK1ZCL24xYUVKdDdqQW8zcHROcmlBbG5jYVA3NDE3dC9SaVFISEViN3F2?=
 =?utf-8?B?UTBwd1YwdVQvK3pMYlRvWjc2cHl5MlNiN0p1Y0tGZmROaSs5V082ZzVwRmk4?=
 =?utf-8?B?VzBiSFR0OFJKYkJFMXVNZ3hwQVlIbER1SGovKzlIRk83R2R2SVhLaDI2a0ZU?=
 =?utf-8?B?NjVEVmdhRnZrYTZpb21Ybm9EUkx5eHNaMGFocWJ5VXpPcndDM0tZbTR3VHZJ?=
 =?utf-8?B?WmV4encrNXA1V05IeUhaQ3prZ2gza2x0dko1a1VqQ3dYWXFOMDhPL0hHZ0xF?=
 =?utf-8?B?eUNYRmI0UWJVVm4wcEE0T0xCbCt0dGJobGFPTjJOL2lacTltd1pObTdoRXVw?=
 =?utf-8?B?c2piM0FyRTZ6WEZIZHB1NXdMSFVOR01yTlRKYm9FVVVIeWwycmI0RDdqWi9O?=
 =?utf-8?B?Y3FTdjgwWUZOM1FVdTl0NHo0QVhsS3c5dFRSUERXR2RVdGdmVUxvbC80VmtM?=
 =?utf-8?B?Sy90cnNwVjgzN2hPN1lldkg2L0RCTUJPSFhmR052VHhqSkxnQnJtZ2dNRUZZ?=
 =?utf-8?B?bGlRRjZtcGlhSS9kV0xMcnVQT0V1clk2V2FlQnpSMllKL3NWbFNXUHZYVlFx?=
 =?utf-8?B?SzhKR3RmMEN6UUxDeEpZWktlK1EvK1VOQ1hldjBEdDJ0ZTBpVlFHQjFjanht?=
 =?utf-8?B?TDJja0RwdDh4aTJqbk1zMElNc1ZpZmJuazNrdmZtVTQrQjdWQThEUHFDdG1m?=
 =?utf-8?B?cW9IUFNGVWhUeC9KeU1HQmpQSzQ5YmNJbWl6WHJEMG1HL0NZOW5TeWV5R09D?=
 =?utf-8?B?OENmWVRoVml3RHBpbEJqQ3d3SlhYQ3NaLzlJVm5hSkhJSldPQUVNNER3eTNR?=
 =?utf-8?B?MFBRT2MvZ1d1N3BwYVlPZktFeGpjZWpVRk55bG9Oc1hxOU9SbGN6bVkrb0VR?=
 =?utf-8?B?eloyTk40TW1yMnVsQzNxa1RaTUN3OENLanVlbko0VmZGZitsKzVPQlJ2bTFT?=
 =?utf-8?B?d3dMeGhsblMvNko2ZHIyVVZFVlNQYjk2c0pFeG1SeFZFdE9ib0w4TWpwSDV3?=
 =?utf-8?B?c09zbmYydS8ybUd2MW9LOEFsZ2dNL1gvb0hmaGRhdWtBY2taTVozSytGUkVz?=
 =?utf-8?Q?kNAjeJboevM42YNk4AAQtwmBVmX6tm/M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0JIYzd5aDhEYmVjOW9pWHZHOTJ0ano1NFF2VDZVb1o4M2dNNmVINzlNNnhL?=
 =?utf-8?B?a1NVUC9EbjN0Z3MvSTQ3cVJKWEg5a3cyMFlpTkdDWEU3ZEtLbExaYWdsUjZk?=
 =?utf-8?B?cXFBZXBXVTY0MjdUakFsSjNKT1NUdnVCQkplclJ2VnZ3OCtoQXk4c2hsVGN2?=
 =?utf-8?B?VHIrL0RudmR5WHBYRDFxbjlJWkJqNGhyVkdEeW9hVEZpbzhieGw0LzF1Sytm?=
 =?utf-8?B?Zmg4eE16eXF4a05UcFRvM09ncWVUSEg5enA0QUFDZlFGVStVK3dRalNNSDBK?=
 =?utf-8?B?YnNZSzVpbUZVNncyUVVDdlc3SC9Yb05BenN0ZVF5Ylh5dU9DMHJxZ24vYlhF?=
 =?utf-8?B?MllHclBRMjdZRTBKQjRKSFJUQ21iMVdzZUMrYkl6cVlmSFZ4TVBsb1hJeVhm?=
 =?utf-8?B?SmZybEJVUVFmWlVvVUc2RFVYUDBYbHB6RWxpeFQ2clRJbC9zVlF3YXQ3RjQ2?=
 =?utf-8?B?MDZxZTdKb3FlckZ2aVN5MVlmYnZwVHNHTUYrMjd5V0R0aVV0NnVRWUcvc1Vy?=
 =?utf-8?B?OTBRbnk1Y29Na2dzS2ZRQ1B3cU5MSFBISjJXODVFREZ5YUhsQVFxalNSemRl?=
 =?utf-8?B?QTlMK01rMDhQek5xQzcxNXFoNE5kT1pTM1o0U1BpYkE0L3BEeEZKWmZVNHlx?=
 =?utf-8?B?cG42c2xXVEdKRllRVE1sb3U4SmMyNlAxcm8zK0NEQTBtWU9zREpVY3k0b0Zm?=
 =?utf-8?B?U1ZRM3RjZXBBSlhjUzZMY0k0aDk5QlFURGJMNEViUW5pL0g5ZTg3MnBCc3p2?=
 =?utf-8?B?QVdOTmdQZUl3SVdpVnZuODBxazZBSGh0bzEybDFpVmpRL1dBSnEycVcxUkdI?=
 =?utf-8?B?VWZrem9QRHVRa04vV1ZqVVFSdUpIcFVIdjBjb2Z3bFNwNllwb3UrVjRTeExY?=
 =?utf-8?B?S1ErdGRmSk1haVQ4eDRicGdTS2QvUzNMczRmZDgwalBPYU9tMHkwZVUvZVZu?=
 =?utf-8?B?cVpOVFNTRU1JZmtiRzV5SkQzdE4zaVRDNElZS25kU2tLcmxTbGZSSjhMUHo1?=
 =?utf-8?B?U0gzQWFXclRROFg1cFl5amRrSkdTOXNPbTd6VjJTK2JUYmF1VTFPNXVyTlpK?=
 =?utf-8?B?c1ZFOFhXb2JNRWNJdDY1NGdnajdmMGhCdlVuU21rTFA5dFN2bmFrSDlNTkNF?=
 =?utf-8?B?dldJWWdJYlBLbmgvRGF2WkVwZnJLYjU3UklPeVlQRFJBdFpuUFB4K3MxTGxx?=
 =?utf-8?B?MzBrcVhmelNXRDY0Zk9wdGptT2JhRVB6UXdqN1hsalZZU3diQVlxTlU1ZUlG?=
 =?utf-8?B?UVY5S3A2bWlzV3JvU3N2QTVUMkxybTkxNDJsUVNFMENVM0EzejRwNGh2QzU5?=
 =?utf-8?B?anJRWmpWbFY5VGJUZUtNZEtPKzVST1hNbmtRRDIyQ1NyTVAzNVlnL3hRRUFk?=
 =?utf-8?B?bWc1OUl0cTIvQzlWRkh2amordlNZdUdpQ05iOGZZWm1qSDRacTRpV1MxN3lq?=
 =?utf-8?B?SnpTNlBmZ2NTTjZkQzM4NkM5UTEvUnlXaXkzMGRLWmN0dkdvL1FYZFJHVzE1?=
 =?utf-8?B?OVlLMFRVV2d0WjRjaFZvTVJMN2lRSUM3bTVOWU1XTS9vT2ZmWkVUREpYdWRY?=
 =?utf-8?B?VzBQTUI0WGkvWEdsbkwvWllhYkRNUzVhVkVSK3N4WS9LZU9JcDVqUjJxb2Uw?=
 =?utf-8?B?ZlVQYjNqcitpNmc2djd4U3B1dnpBQ09mL1J2S0lLcmJrZkRTNVNzNVRvRVd0?=
 =?utf-8?B?a1AzQTJ6aEhhc28yTmx6QkNSejMzeUF4V3N6Uk5ralBrOW91VHQ5UnJHVHUr?=
 =?utf-8?B?bWZreWljU2Z1UER0N21EdThXTUZMREtDT3dXYjhBbk5rbXlVSXE3WXBPMng2?=
 =?utf-8?B?dURGVWFIcnR2TmJxVW5iSDF0eVovd2kxbTdTdDhNUVdLOUhnaFdJcDRJZ0wx?=
 =?utf-8?B?TUY1NC94LytWV0FiSVIvZHY2UFdFVVZvQU5ZVmdGbWtFcE5NUGZqdVpLRTd5?=
 =?utf-8?B?Qk1HS3NFQVVEamsrSk43aFZYOXNFK2hJMkhTck9NWUdOR2pRbUZDZWR0RU0r?=
 =?utf-8?B?b1JkRnpub25RbWFzU3hic213bG96REhsNnJsTWVBWUVoQ0NqaVdTMDB5QXhw?=
 =?utf-8?B?RWV0TEtZU3VYSStnc1poeUgwZEI1N3p1OVRINWRaOElYUXo1MnYrU0Z1eUgr?=
 =?utf-8?Q?yVTSjGd8xatKYgz3r7pA/PJ8s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba6480f-9e44-4275-9833-08de0b39f376
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:54:26.2257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIX4M/Sq9P80Ydzo0UrCEa2wU4g3XBo7/ju/LkWvGUHIlY8ae9Fg1kY9vG047Bmq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9028
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

On 13.10.25 16:54, Philipp Stanner wrote:
> On Mon, 2025-10-13 at 15:48 +0200, Christian König wrote:
>> Hi everyone,
>>
>> dma_fences have ever lived under the tyranny dictated by the module
>> lifetime of their issuer, leading to crashes should anybody still holding
>> a reference to a dma_fence when the module of the issuer was unloaded.
>>
>> But those days are over! The patch set following this mail finally
>> implements a way for issuers to release their dma_fence out of this
>> slavery and outlive the module who originally created them.
>>
>> Previously various approaches have been discussed, including changing the
>> locking semantics of the dma_fence callbacks (by me) as well as using the
>> drm scheduler as intermediate layer (by Sima) to disconnect dma_fences
>> from their actual users.
>>
>> Changing the locking semantics turned out to be much more trickier than
>> originally thought because especially on older drivers (nouveau, radeon,
>> but also i915) this locking semantics is actually needed for correct
>> operation.
>>
>> Using the drm_scheduler as intermediate layer is still a good idea and
>> should probably be implemented to make live simpler for some drivers, but
>> doesn't work for all use cases. Especially TLB flush fences, preemption
>> fences and userqueue fences don't go through the drm scheduler because it
>> doesn't make sense for them.
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
> 
> Allowing for an embedded lock, is that actually necessary for the goals
> of this series, or is it an optional change / improvement?

It is kind of necessary because otherwise you can't fully determine the lifetime of the lock.

The lock is used to avoid signaling a dma_fence when you modify the linked list of callbacks for example.

An alternative would be to protect the lock by RCU as well instead of embedding it in the structure, but that would make things even more complicated.

> If I understood you correctly at XDC you wanted to have an embedded
> lock because it improves the memory footprint and because an external
> lock couldn't achieve some goals about fence-signaling-order originally
> intended. Can you elaborate on that?

The embedded lock is also nice to have for the dma_fence_array, dma_fence_chain and drm_sched_fence, but that just saves a few cache lines in some use cases.

The fence-signaling-order is important for drivers like radeon where the external lock is protecting multiple fences from signaling at the same time and makes sure that everything stays in order.

While it is possible to change the locking semantics on such old drivers, it's probably just better to stay away from it.

Regards,
Christian.

> 
> P.
> 
> 
>>
>> The new approach is then applied to amdgpu allowing the module to be
>> unloaded even when dma_fences issued by it are still around.
>>
>> Please review and comment,
>> Christian.
>>
> 

