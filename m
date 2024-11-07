Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479199C015A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 10:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AD710E203;
	Thu,  7 Nov 2024 09:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LP2+8tDJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C23210E203;
 Thu,  7 Nov 2024 09:44:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=idUk/Ko1JsABrXDhW7GwPAEU8mGABLzTyaIowLsGse9mQTZKc39V20yhsFdQib8tBm6tAeiv+uaYft5NA6QYXZGmDHV8N/ve7Eh8QLNaHQAZY4uSvMRXv18h0C2HFlQXklMIFTrb3pNUggNlQCDZVoSTh8ddINBJOb4T7IvrAmAAgs3gsEh+AHjF3JubZ3vIiW9EKx38kmezMA0d5Zfp/T/STUqrN2j4Hwghp1BZqZAnKX54SsUSkHzQyyGq3yGxKMSwMgtfOJuLonvurBiuNVb9CffpQzgxC1X/m9+kQxoRxSiv7IxoXnJkrhZxHWnKQnZxdw1zuZVJKZgvtc0/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=My0u6sDoEy82gA3IVg5hU4PoeN7/MgEhBDedsvmabgY=;
 b=mHxa+zys/izv5h+djrGCEweVHbZkiWyONWCXPiAmBrxM13oeaA35NFhG9RumSp4t62wQq6ut0DdzN0PtSJ45IunOmhEMRmCPiSU9zdeinYSbH1iBZvlgdwYMXzs/lDmdyusxseiCKT9f29yhOtdjCnnLYE1LTekNqbIXPPNlQGIUNvCyjNNbAc0VXVdgMRD68WlKmnZ/rRqEpGzMhoCAA/pMeK4r4zxAbhZ70OpCrNE0Pmsm2sBOEJ0ojDTICQvhtfjzXa0cLsBntop5p2TuMeVBvGFRRZHPx2de9tPvfuk2yxcsI/W0hiivQi0BUFFvRBwlQnMmGs0iFl/EDOkflw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=My0u6sDoEy82gA3IVg5hU4PoeN7/MgEhBDedsvmabgY=;
 b=LP2+8tDJYwXyTV2VcvCmMB4yTxQmxZi8DtfCtxZI1IaTZSvr2dbRMEhQZmWtpTse5A8+IEDknDYNZbaNHMmrqMIGKoSuNpcZU9s9q0T1Sm+dkq2yrn6W+IXP/NX2ERKnOXUkLOEnXkCs4V5b9uQfc8uTzm8i22SEOXmrvAj8WEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by PH7PR12MB9255.namprd12.prod.outlook.com (2603:10b6:510:30c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 09:44:40 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%6]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 09:44:40 +0000
Content-Type: multipart/alternative;
 boundary="------------c3IyX6Kjo3hUi4y2sa9lWP9A"
Message-ID: <85859dc3-cca3-4396-8c75-a726437fb81e@amd.com>
Date: Thu, 7 Nov 2024 10:44:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com
References: <20241031181048.2948948-3-matthew.brost@intel.com>
 <ZyQWF/k9VFo99tDB@lstrano-desk.jf.intel.com> <ZykFrJIx9M204Weg@intel.com>
 <02ec3d6a-4727-4535-a384-4c6789fa4ef4@gmail.com>
 <ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com>
 <c76830ae-c6f9-47a2-8087-32d9f7c3df2c@amd.com>
 <ZyplgNBaZ93UUdxY@lstrano-desk.jf.intel.com>
 <88ceb558-89d1-4d10-be8a-9ce2f3178fa5@amd.com>
 <ZyuKTFxCD0SusZpt@lstrano-desk.jf.intel.com>
 <34d18085-7e23-4632-9287-65eff6651bba@amd.com>
 <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|PH7PR12MB9255:EE_
X-MS-Office365-Filtering-Correlation-Id: 205983a9-ef28-455a-4347-08dcff10ccd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDgxZmRyY3NuaEV0R3VnNjBWT3dPQnUwVXBkUG9RM3UvZk12UFVUaGtFdmNJ?=
 =?utf-8?B?Y3RCdlJCcUVuZ3djdy94azgzVXowbDZiSlBzUDRzakRmY0R4WWRTR2t0YmZp?=
 =?utf-8?B?VUlrT2RoQW9pcGN4Ym4rblRxT0VKcVhseC94ZjFOdnFwS0szbVVxQVBQUkFP?=
 =?utf-8?B?M0VkQ01MNTk4dkVZTWtSNnAyckZwZkVadFUyZTFPdkxiQUZTWFRqdGlZNEYy?=
 =?utf-8?B?WVM0dGdyOHl4ZUk2T2VxenFjU2tldWFnWW04SzdkeG5oSHdXWG9Oa0RtRkNE?=
 =?utf-8?B?emxCMjZ4NG1KcFFBRm9teTdzZHh3V0VRSkIvUStsOWZwMjBXMmEyZnM3SUda?=
 =?utf-8?B?NHljemZNekhCeDVTa0o4MW9zSXZnTXhmVm92VWRlMDE2cVczZGV5NkNxSk9G?=
 =?utf-8?B?alFaSDhkMnVvbWVBZDRZZjhlWkhnaTBxMmg1R2MxWm9WSDE4ZDNBSWgzK2ll?=
 =?utf-8?B?dGJtWDFYYjFUampRa0dFQkE0c1N2NVhwQTkyWFcrbUc5dDRUbzZlQjBEbXYr?=
 =?utf-8?B?RWJhVVVxTXJLTGxhbmxqVmVtU1JrTTloU1htRTdLWXNuY1B2bW51V0ptc0cw?=
 =?utf-8?B?eStOeU1SWjBrWkNvMmRMTHVvbjlHcXNGUmQzQ1ovbG9VRHRXWFlTcHdQWlF6?=
 =?utf-8?B?cGVhaThNWFhrOGgySWp1dXlXQTdUZVR6RjVVZnBkTkNxVm1JV2JOSEZoU0lF?=
 =?utf-8?B?OXpHTGlsWW5oVDZ6K1NsUXRZMlQwZUxsWHQwL1hFMzNUTW9DR3Y3R1RoaDNG?=
 =?utf-8?B?bklCQjdZZEtEM281emF0ZTV0bmFZS09ZWHd5WUluc2F1SmNsVXNYMTFpK3hw?=
 =?utf-8?B?Q3ErUzBwbERTK0d0VGV5L3h1aStaUVlWbnUyQmJJZGJoMWk2WFJMeE41aVd3?=
 =?utf-8?B?SGtpTERzTDN2d0xFU3Y1OCtOT2hIVWZ4UFkzc1JZckVmeHZNK0JyOWRpUUtV?=
 =?utf-8?B?czk0Mm82dXBROUtTTXVINVZmOXVEdFBMenNJL1VnQ1ZoVzFqdzI3dm1zQUVR?=
 =?utf-8?B?a3FvL05KVmhnaWl5OTFmeTIvRFZZTzlvL0MyVzJNMGp0K041TUdTNXd3Zm5V?=
 =?utf-8?B?U1FVWjYrTEd2bWpaejdVNFRDQXE4dU11WWkxbFZMRjNPN1U5SHliZElmMkw2?=
 =?utf-8?B?TStuSTh5YnFGamlTTEM1Ukx6WmI2RHpDR3pVSFQxY0t0OE03YW9KN3QrSWFJ?=
 =?utf-8?B?TGlBaXN5L0lGNjlEbWdaRGZuWjdESWZOSzZhN255dmxqejBWWm80KzBlQTV5?=
 =?utf-8?B?QVdTcllpdFBLMW9oRjM2RXE3OFV4V2VNMUk4YUthNGZtVURkbmgybENQU3hU?=
 =?utf-8?B?Z1pYQmtLVU85UXdjYUM4NW9xdG9wQWhsaDNDV3ZaMkw5Y2MrNGhqekQzSFpT?=
 =?utf-8?B?UU9odUlidTFTdFl3anVUUVplNm5XZGZzUnlsMU43cG5JeFJOT2dPNFFsZlkx?=
 =?utf-8?B?cFlyZk9NUmw5dml4QWhzKyt1WXMrTzd3cTdVUjVqY3QySE03QllXL0ZRcmlh?=
 =?utf-8?B?eE40aHQ0Q09PTS8zUFB6ZjkyMmk1czdmZ00zbjRwTmljc1J4bnVDWFNZYTdi?=
 =?utf-8?B?RDRXSEs1K3dtR2Z3d3VyTTc4M2c4OUhmQm5FMDU3YllwbDBkSk1sdThSQTRy?=
 =?utf-8?B?bXk3ZUdCWkJ6OWdZRzFEQ2RLb2txRXprN0ZOUDlaeHQxV2hYUUpoSkMrNDVh?=
 =?utf-8?Q?ARDyqJY92KcONsOyKu13?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEl5UXMvdGVrSnQ4VncrQVN2NHlQYW1DNURhc05qVnN4d3JhZzdES2lRZFcw?=
 =?utf-8?B?cCtzdzRTbEdTMm84QVZPTnlQNEdWVTRoODFYL1dOOWlvaUZXRnpwWDY3UXQ3?=
 =?utf-8?B?dVZTbXp2alZrMERGL3VLdE1xRERmWm5WQUg3Z21Cc01xd1VjaHZxVSs3REhu?=
 =?utf-8?B?Q2VYMFVXcFp1TG8zbnpjM1lWaUJLa3BXMWplRFA5dlBtQ2lNbFIvMG9Xa0VM?=
 =?utf-8?B?c3Yzb3QrNTZWMjNkOUNtRnoyemw5QXRZblRUN2VXNmJoclNqbG4vMGFyOHFQ?=
 =?utf-8?B?cTh2R2dxMnJMd1REd1Z5QTZlTjh6SHZtOWgxSVBOR21Yd1lJTTQrOEdQdWJS?=
 =?utf-8?B?Y2NkdUNjd0lGS00vQlF3SWNlUE5oL3llL3hjRE1kNURqM2RtTDdJU214VDY0?=
 =?utf-8?B?VVV4Uld1MjlaTnFZODRCaUFJUzNMdU9vbCt6dVVMWXZVcE00TG5rbHhKSFVJ?=
 =?utf-8?B?TFFkaTBrc1FqMHpmendjYytuZ1pUYXhuTGFPS3lHS09WNk52NjM2MlM5QWtQ?=
 =?utf-8?B?Ny9iNnVkQU8vTG5zTS9Pc2tIL0pHMlpRK3g3RTljdWpGYjNncEFpOVQwODdr?=
 =?utf-8?B?Q1dDdEQzMGlRcFRXUHpXNkZXZUFwUm1FWGVySHNocVJrMkRpTzZzZ0pjZ3hR?=
 =?utf-8?B?MmhpSkRtK21tWU5XL0hjY0RMV3hEcm53VFRWdFBSVzdlZ0RWK2R2T0E4VEZl?=
 =?utf-8?B?M0oyL0pGaFFkbktrMG52NnJNN056cEJSTjJ2ZzVndVluZ1Q0WHhCS1A3ZVpS?=
 =?utf-8?B?VnJiMDBVeEpzSU5wWVZsZmFHQUMvaGpxMDlwa3kzRjNCUHBjNWF0azlmOHN6?=
 =?utf-8?B?WG9ydFVsNUlrSldaOHNMcEgrM1MvalNLbEVWYzh4Vjh0eEZQU3cyaVprVVll?=
 =?utf-8?B?ZUVUcWZKSzJSamxXRTArVTFLUGI5akJMenlHV1dWd0lIS2VRUDZRbllMYm44?=
 =?utf-8?B?M0dYZS9waEhIakN4YXBYU2dIbmQwTUY4Q0NLdFdZdjduUDBGMWxCUjRWcjFF?=
 =?utf-8?B?Y0ZWTHRHaGNWTmNyMzV3R0dlR2plRDRQblE1L2ZKbng3SlU5QzBlSUpHdTl5?=
 =?utf-8?B?WDdoVGJuT2ViL3JDdXNOVy9ubzhHQjZSSVFwVUVrOTVlVXlHWHF0bFBidmI2?=
 =?utf-8?B?QmZHYmhWVXBBV3JkKzJqVmk4UmlxelVna240Nm0yaGsxdWJrNktNT0xRSUlT?=
 =?utf-8?B?a2xMUm1FVzAvclh2c3A5Rzl4UWFhNXRKMkZTNHl0THdaWE5EVTVSUEVSQjJE?=
 =?utf-8?B?emxnWmF6V01RaVpXbmVZZHJRNmZaYUtQTHlOYUFROWpKbWJuTmNKWGxETHpD?=
 =?utf-8?B?bjA4ejNvRWlaTW1sZGhHTWJ2RTg4ZFkxZWlNd2xSc0RSZ0xMSzRUekVnazVq?=
 =?utf-8?B?Q2ltOEVDL0laS2wrSUtzNWNJNFVaNURhR2lTT1djSjN2ei9oK05sWWZMdEFz?=
 =?utf-8?B?SlJYbjREVmFJNjJuSlcxWU93KzZqQnpyVExNK0RVVGp3WkUraE4vTFN2UGtK?=
 =?utf-8?B?dGpieVhOaUpQdmNKR3BpWHVZR2U2V2s1MHlITERxMW1BRWloNUtlVDBHcU5q?=
 =?utf-8?B?STlhbUxPVEFOWlBHekdURUtZSkczY2JDTldJcGs3aWk2K1VhQzZtV3YvNG1Z?=
 =?utf-8?B?TEhPdC9yM28ydFp2WGhBbWdLZlV3VGlQK21QWnhiYU5pYnA5YW5DZjVRQTIv?=
 =?utf-8?B?Y1RwZ253UkwvaVZtck11dHVVYkRPLzg4R1dUSm1HNG81aTJZTWdnRGM1WmJt?=
 =?utf-8?B?Mkxsai9EMkdLUnNmRGtFTDVUUmlWQWVhdExBMTM5U2RBNXBpTmlreGZmSVo0?=
 =?utf-8?B?NVVnTU56emoybXA2L1BkZDRzeW1kc2tuNGlDWDlaVG4xeTk4L1IzR3ZFQWNZ?=
 =?utf-8?B?bFB1a2Z6N01IQXozTHZZeVQ2bnJQMnRvRWVXSlM3eExjN3FvWUhsUXBmMUVH?=
 =?utf-8?B?L1V0QTFyazMxN2JMNzZrWkRBOUNMVnhYWVk3QlF1aWx1UWdTQW5Ld3JJNHNq?=
 =?utf-8?B?R0xiSnhFUm9aMHZpVGdOUnIyNHFvQkRselhjTUFzdy8rdXdqZTlYbDNwUTFx?=
 =?utf-8?B?NkxSQkF1b29TOHBGT1BTemZRV0k0WDRsa2VUVWt2bU9NbURNMVk0cEF1djda?=
 =?utf-8?Q?mX9G4PUNPnLrb+ByRFYdMgVGX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205983a9-ef28-455a-4347-08dcff10ccd1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 09:44:40.3063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBre9ZAA3vAPtRIyyJ7D4E9Dcdsr9BIfG3fx0/1oIk2+kSB9kLLxN23CrKdli0Ko
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9255
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

--------------c3IyX6Kjo3hUi4y2sa9lWP9A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 06.11.24 um 18:00 schrieb Matthew Brost:
> [SNIP]
> This is not a generic interface that anyone can freely access. The same
> permissions used by ptrace are checked when opening such an interface.
> See [1] [2].
>
> [1]https://patchwork.freedesktop.org/patch/617470/?series=136572&rev=2
> [2]https://patchwork.freedesktop.org/patch/617471/?series=136572&rev=2

Thanks a lot for those pointers, that is exactly what I was looking for.

And yeah, it is what I feared. You are re-implementing existing 
functionality, but see below.

>>> kmap/vmap are used everywhere in the DRM subsystem to access BOs, so I’m
>>> failing to see the problem with adding a simple helper based on existing
>>> code.
>> What#s possible and often done is to do kmap/vmap if you need to implement a
>> CPU copy for scanout for example or for copying/validating command buffers.
>> But that usually requires accessing the whole BO and has separate security
>> checks.
>>
>> When you want to access only a few bytes of a BO that sounds massively like
>> a peek/poke like interface and we have already rejected that more than once.
>> There even used to be standardized GEM IOCTLs for that which have been
>> removed by now.
>>
>> If you need to access BOs which are placed in not CPU accessible memory then
>> implement the access callback for ptrace, see amdgpu_ttm_access_memory for
>> an example how to do this.
>>
> Ptrace access via vm_operations_struct.access → ttm_bo_vm_access.
>
> This series renames ttm_bo_vm_access to ttm_bo_access, with no code changes.
>
> The above function accesses a BO via kmap if it is in SYSTEM / TT,
> which is existing code.
>
> This function is only exposed to user space via ptrace permissions.
> In this series, we implement a function [3] similar to
> amdgpu_ttm_access_memory for the TTM vfunc access_memory. What is
> missing is non-visible CPU memory access, similar to
> amdgpu_ttm_access_memory_sdma. This will be addressed in a follow-up and
> was omitted in this series given its complexity.
>
> So, this looks more or less identical to AMD's ptrace implementation,
> but in GPU address space. Again, I fail to see what the problem is here.
> What am I missing?

The main question is why can't you use the existing interfaces directly?

Additional to the peek/poke interface of ptrace Linux has the 
pidfd_getfd system call, see here 
https://man7.org/linux/man-pages/man2/pidfd_getfd.2.html.

The pidfd_getfd() allows to dup() the render node file descriptor into 
your gdb process. That in turn gives you all the access you need from 
gdb, including mapping BOs and command submission on behalf of the 
application.

As far as I can see that allows for the same functionality as the 
eudebug interface, just without any driver specific code messing with 
ptrace permissions and peek/poke interfaces.

So the question is still why do you need the whole eudebug interface in 
the first place? I might be missing something, but that seems to be 
superfluous from a high level view.

It's true that the AMD KFD part has still similar functionality, but 
that is because of the broken KFD design of tying driver state to the 
CPU process (which makes it inaccessible for gdb even with imported 
render node fd).

Both Sima and I (and partially Dave as well) have pushed back on the KFD 
approach. And the long term plan is to get rid of such device driver 
specific interface which re-implement existing functionality just 
differently.

So you need to have a really really good explanation why the eudebug 
interface is actually necessary.

Regards,
Christian.

>
> Matt
>
> [3]https://patchwork.freedesktop.org/patch/622520/?series=140200&rev=6
>
>> Regards,
>> Christian.
>>
>>> Matt
>>>
>>>> Regards,
>>>> Christian.
--------------c3IyX6Kjo3hUi4y2sa9lWP9A
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 06.11.24 um 18:00 schrieb Matthew Brost:<br>
    <blockquote type="cite" cite="mid:ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com">[SNIP]<span style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap="">
This is not a generic interface that anyone can freely access. The same
permissions used by ptrace are checked when opening such an interface.
See [1] [2].

[1] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/617470/?series=136572&amp;rev=2">https://patchwork.freedesktop.org/patch/617470/?series=136572&amp;rev=2</a>
[2] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/617471/?series=136572&amp;rev=2">https://patchwork.freedesktop.org/patch/617471/?series=136572&amp;rev=2</a></pre>
    </blockquote>
    <br>
    Thanks a lot for those pointers, that is exactly what I was looking
    for.<br>
    <br>
    And yeah, it is what I feared. You are re-implementing existing
    functionality, but see below.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">kmap/vmap are used everywhere in the DRM subsystem to access BOs, so I’m
failing to see the problem with adding a simple helper based on existing
code.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
What#s possible and often done is to do kmap/vmap if you need to implement a
CPU copy for scanout for example or for copying/validating command buffers.
But that usually requires accessing the whole BO and has separate security
checks.

When you want to access only a few bytes of a BO that sounds massively like
a peek/poke like interface and we have already rejected that more than once.
There even used to be standardized GEM IOCTLs for that which have been
removed by now.

If you need to access BOs which are placed in not CPU accessible memory then
implement the access callback for ptrace, see amdgpu_ttm_access_memory for
an example how to do this.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Ptrace access via vm_operations_struct.access → ttm_bo_vm_access.

This series renames ttm_bo_vm_access to ttm_bo_access, with no code changes.

The above function accesses a BO via kmap if it is in SYSTEM / TT,
which is existing code.

This function is only exposed to user space via ptrace permissions.</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">In this series, we implement a function [3] similar to
amdgpu_ttm_access_memory for the TTM vfunc access_memory. What is
missing is non-visible CPU memory access, similar to
amdgpu_ttm_access_memory_sdma. This will be addressed in a follow-up and
was omitted in this series given its complexity.

So, this looks more or less identical to AMD's ptrace implementation,
but in GPU address space. Again, I fail to see what the problem is here.
What am I missing?</pre>
    </blockquote>
    <br>
    The main question is why can't you use the existing interfaces
    directly?<br>
    <br>
    Additional to the peek/poke interface of ptrace Linux has the
    pidfd_getfd system call, see here
    <a class="moz-txt-link-freetext" href="https://man7.org/linux/man-pages/man2/pidfd_getfd.2.html">https://man7.org/linux/man-pages/man2/pidfd_getfd.2.html</a>.<br>
    <br>
    The pidfd_getfd() allows to dup() the render node file descriptor
    into your gdb process. That in turn gives you all the access you
    need from gdb, including mapping BOs and command submission on
    behalf of the application.<br>
    <br>
    As far as I can see that allows for the same functionality as the
    eudebug interface, just without any driver specific code messing
    with ptrace permissions and peek/poke interfaces.<br>
    <br>
    So the question is still why do you need the whole eudebug interface
    in the first place? I might be missing something, but that seems to
    be superfluous from a high level view.<br>
    <br>
    It's true that the AMD KFD part has still similar functionality, but
    that is because of the broken KFD design of tying driver state to
    the CPU process (which makes it inaccessible for gdb even with
    imported render node fd).<br>
    <br>
    Both Sima and I (and partially Dave as well) have pushed back on the
    KFD approach. And the long term plan is to get rid of such device
    driver specific interface which re-implement existing functionality
    just differently. <br>
    <br>
    So you need to have a really really good explanation why the eudebug
    interface is actually necessary.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ZyugmXt7v+JeKuN9@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">

Matt

[3] <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/622520/?series=140200&amp;rev=6">https://patchwork.freedesktop.org/patch/622520/?series=140200&amp;rev=6</a>

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Matt

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Regards,
Christian.
</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------c3IyX6Kjo3hUi4y2sa9lWP9A--
