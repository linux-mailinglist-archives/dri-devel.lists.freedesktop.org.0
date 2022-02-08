Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE574AD602
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 12:12:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33A710E604;
	Tue,  8 Feb 2022 11:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5E710E1F6;
 Tue,  8 Feb 2022 11:12:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAQ8k8rjhiqMbf6M5kAV3r+JGAoXCsPKY01SNL7FEdWawNoU9U3sVfnhQwj7T12C9C2ZUSAK+CphHsaRnteq9uO/tpb5LXBfPqrC2vMrm9h0w3bwI4CQ1bYAM3biBUx3isUC0tZERMR+arCEBl/gghYga8GShvLtNBhtcE+C7Vwt3nAsvKSazTdxHTFljLJ4k3LGogmwWrpcX8hFtgFO2otw8Ipx0p9+jGV7m+racXIlt7tmysPPbsObk3ZlkyXN4USuHZ9mbWgyLFn9UqozJ0Gdp9xJQGtV28/BcPV83Dix/6YrYbFc1LGas4Yzpui3Eicm2Vj6Af3mWHpHESTS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6L7JBXE4C5yqcPXiQJvmIUtxMvOkrfwR6mkukpMSI4=;
 b=fiL3hyZkCLRT4nrdXCceWYOXvx7MJ1SfBVr9dR+0o1l+YL0RpwPcPyMVjzho2y2FXCEMF+w3H5iSmQLdZFKhDMTYDeEEQ1dI0yTvxuVF9lRSFUFtf5SfhTSM3fd22tsAy7ddfYTQn3FzlWIHKKsbUa4TMiwAsEK0ZWtrH/laWqmDSaBRd8wWDX/rgbmTQsCMGQXXB5RdghzQ02i4ZkGUWfWigacK5fKXolPPIaxQzid6McRuRXx5M71PCsyDSM+dkMtasNND2VcvTs37x4pCjymsFK8uTzwSFqt+ys8o9B5jzGiF1CRU4vUhcpBcTizl9EKAetBIxKsB7lUH3866aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6L7JBXE4C5yqcPXiQJvmIUtxMvOkrfwR6mkukpMSI4=;
 b=fJWO/Mj4Ak8nhutOD3diwreNyNp/dFN9pL9jIwvtyipknL6W3UDViwAFhC04ewIcj8n8a8BoAjpSFbDUtgITmd9MMPEA00OG7lwDt+OepOf2cIPjYunNJn1e1rvlT3N00/sHfv2S2UW71zhF0VTzZiiGXgYXq3PjkcGxgdO3xWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB3085.namprd12.prod.outlook.com (2603:10b6:208:c5::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Tue, 8 Feb
 2022 11:12:38 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c411:8d69:9007:aed6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c411:8d69:9007:aed6%5]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 11:12:38 +0000
Message-ID: <46c843dd-3171-9448-3a7e-590c8c23844d@amd.com>
Date: Tue, 8 Feb 2022 16:50:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v11 5/5] drm/amdgpu: add drm buddy support to amdgpu
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20220127141107.173692-1-Arunpravin.PaneerSelvam@amd.com>
 <20220127141107.173692-5-Arunpravin.PaneerSelvam@amd.com>
 <CAM0jSHOdMDQvWxGyHfW01UAe-x_eefFQSJnzU43=t6qL_Ec77g@mail.gmail.com>
 <c842bcfc-80ff-fafa-7242-cfca3ed65087@amd.com>
 <b9d3da49-a02e-82d4-66c5-d95f824873cd@gmail.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <b9d3da49-a02e-82d4-66c5-d95f824873cd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::36) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0889650e-e0c1-4a77-02ef-08d9eaf3ea14
X-MS-TrafficTypeDiagnostic: MN2PR12MB3085:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB30854D41BEB7AC52E9115170E42D9@MN2PR12MB3085.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ixkOhKSwxRedGIgMwo8I0V3pzeWybacN/suvK8a5WT1uFkbs2NS8Xm3osyMHVIBVOak7mliFtgyDYuCXoHReI6jzEBu70+Mgf/N1sozPHMJq+dq0i9aKGnd/EQseehUNP5XTolOd4pSOnvX2ccqN7dfHv49TGoi36A521N7n5/YLF+8toaptK0GEhgULd49mFHnMfr11D7ff1RsQhpnzsxf7W3mRrYJQZLCOzmjvlCQL9Yf/0HvtK5ODGRJIUkwerqBklwr83Fz75zDPUi2DNgza6L4sn+g0gNkEj8VT76zfv6GR+kEQk9Me9/8u+mOPoixujFIL02HoYatBs1/tQjnXYi4BakQOQNt5YdGZ9nhC2OuYSpvO3dTD+6nKb0KKHwv19gmCTS4HHUksccHnhjZl9LfYY9Hw9cN4BGS21lFS1uaTwhLtSPYACz+VsWS0OcWQFkiBp0K+Q6QWIfvzdPknCXmEVaXDQQtfS7x1sNKMDTGCj1Cvol1MKKgRs04W/Z89X5FDYa0OSykrutJrzcR2Y3iIpgRNNCo+hfPBBMDNTa+JHBZFr67RtTDoj93ttrxUyjHobYw9YIQj/Hgd+w1VdMOrtot56HlzDUwufflh042g7IKRw+GGtLHMn7of4s2ZlmIF0LA1BiAmTTmufAV92vBSfCMhBDb0nMR5UgzQZ/vM3Qp/d7Wy682oRK+Sn7RxeJvtUxybdWNuLCKdF1uv1KJrUWa9ruHlA6KHZE0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(508600001)(53546011)(6486002)(5660300002)(54906003)(86362001)(31696002)(66574015)(110136005)(316002)(8936002)(6666004)(6512007)(6506007)(4326008)(38100700002)(66476007)(83380400001)(66946007)(8676002)(2906002)(26005)(186003)(2616005)(66556008)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDFkQi8rMlFWakVJdlp6NGZNVXlFNUNpRU1yVEZHTGUzTXZpK3FTVXNFZUFp?=
 =?utf-8?B?R2JRYWpSdFdTVTlVd21wdVRnR0QrcXh2SHF5VFFPRnYxQm4yYnF3QUFJd3Nz?=
 =?utf-8?B?dnNiaG1qaFFCZjZ4ZUR1K0dZL1dxTTNBMXlUc2RBMWljaFJqWXY0bURwSEhW?=
 =?utf-8?B?elg2ampoNTZWeER3MU5rbU4wSVNjNG9lMWlRelNMOVg4bkJlT0JrNXBzV25p?=
 =?utf-8?B?MkZYWFdsQkhqZzVhVEpRZnI4aEJvMmFTZHBTSjUvQUZhWmx1ZG5TL2IweHhH?=
 =?utf-8?B?S1FiSkczNUtSeG92UW1MSDhBSXFZWFNGK0NDamJ0UjJSeHZEWXBjV1Z1azVJ?=
 =?utf-8?B?R2swZEh1S1JBeTB0MFlzV29WVnZnMXRianJ6eGZkdU5lNEswYjcva2tUYnhk?=
 =?utf-8?B?OXg5YVFLdng4bDQ2Rjc3L1hQUXVjTUJkUitRWWRKVC9FWlF4OEpRR3NtTFNM?=
 =?utf-8?B?WkVMZGhCaVVsWHJES2h1SklocFh1cmF0T1FPb25aWm1rR2VKR0xFaXpSbDBF?=
 =?utf-8?B?QUhNZnJMeVJyQUlCSFJOSTJWZjJjbmR5MExiSjBFZ3pybC9WcGQ4bWltTENH?=
 =?utf-8?B?VVo3OURyeFJSc2cwcG5zYks2bVBvRU13cFhmUzN1TnJLT1l3ejNKbnFYbFl6?=
 =?utf-8?B?QzhNTDAvR05HWitoV2RoQVROcVYxaENEZWRJVU9SdW1kcWt3L3hNaXRaVUVL?=
 =?utf-8?B?elF2Y3NuNnZxZ09yeHpTcVk3ZUJTUllPN0xhSjAwMDN0OEplT0R4ODJGZFpN?=
 =?utf-8?B?b0sxK0t6d1ZhZDgxVlFQM3FBNjliWk5Jd01McGtDcTllR1VmYkZrMWY1NzQv?=
 =?utf-8?B?Q2U3OGVIZ1Z3aU5ZNlMvcllNMExVWUdaVy9MZ2o3VERwZkw2eElmK0VEbjNz?=
 =?utf-8?B?bFE3amVoM0VBek9nQzY1NkZjQVZRR2Z1WmVhY05XcFZjc1dZMmt2ckNQd0VQ?=
 =?utf-8?B?eDhJUDYybkJqY1JYWDd5NzhEdnhuanU3L1pmd1JZRVZBb3Q3c3dOMGh2WFhj?=
 =?utf-8?B?ZDQwU0dWcTZYVVFqVWc0YTl0NTMvVWdUeUpCVTI5RzFXSkFuRlg1TzBqeU8w?=
 =?utf-8?B?TXRVWmtNdjdoR3FUbG1vSncrajBqa01YWkpGNnN3bGU5ek5sZEtxalkxSzRG?=
 =?utf-8?B?M1haOHllQ0gwbG9IQVZ4NUpNQ0xSV0F3cUJwVHRPb3lKcm50V1hPNlNvRVdx?=
 =?utf-8?B?VUZLaWtGWEhsNXZ5ZmRGdGxqNEpnb0YwcTFyR0pNMVJRYjdhd0N3OFJ0Ujk1?=
 =?utf-8?B?TDRpRmk4d3M2Wjhzajk5TXM3REdHSEIwREE1aURoOEh6VFc2ZloxRTZnQ3JI?=
 =?utf-8?B?K1N5Ym9PL29tc29rVjFoZ3ZxbHpXY0J2OEFIRVBxT01IcVdPcTlqcWt6Tjhj?=
 =?utf-8?B?K2J2OTNmL2hLS3BwTTd5eWp1WDRmcVV6WUs5NFpBbUpLdTBzRVJRb3JUQ3lL?=
 =?utf-8?B?VjBpd2VVNEpmbDdvQVlJTXVUQXErVzVYNzdmc09sLzc3NG9HYmJJYUhYM1J2?=
 =?utf-8?B?RFZTMkdhbVA4SUVWdnVSckZYOW03UC9aVEZBNWZZcHpMcURZOWg3TFdscThv?=
 =?utf-8?B?MGhmMjZrNDFqUWJOdVpGUHI1SnI5UG5UcnJZc3B2N3lvK0RxMXdnWmp5aTR3?=
 =?utf-8?B?eHZVU1IxNUxVcGdUUW1ZK0Fsa01SNUJLK2xKMG5NVlF0SzZ2Vk9aL2N6M0w0?=
 =?utf-8?B?VWFTWG9FK2tyZWNZYTBwQU5ub3kzZGlxems3TW1Zc3V5RmtrRFNiS09EeThu?=
 =?utf-8?B?K21OTEpPSHJlLzFyNHZrSmEvWXNaT2V5amQ0NTNnNlZyeDh5c0xHWWE5QTJ0?=
 =?utf-8?B?ZmtQL0xNV0NwM252SXlLMVpqZnhNSE53aEZ2T3BMdW4vUUxwR1lJc05sSzk3?=
 =?utf-8?B?bDRJMUQ2L3MwZ0hNNEVMOGpMVHpId2g2VVdsTDkwSWxQMkRkMy91bnlRR0VR?=
 =?utf-8?B?SFRybXkvRkhkdFRvaFArOHBld3ArZ210ZlRuOTZwcG9TKzV3ZHVpT2piYUhW?=
 =?utf-8?B?VkEvRmdtdndLT2RBSFNSNm00MUFIdmhBQUN4YmRDRFVHSUtlNlAvbnlpaE5q?=
 =?utf-8?B?V3F6QTdFNDY2VDUzUlFUaVlWWTRhelc4MjhuQzNEUjhZUnJTdWZyQVY2eWtn?=
 =?utf-8?B?WEVUUEIvQkVtSFMvZnZBMlloY2ttSGJlU2FidGJMckN3QndIODFkZW5MbVdw?=
 =?utf-8?Q?kvwAk8GZTRZM5Hi/4Oy9mz8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0889650e-e0c1-4a77-02ef-08d9eaf3ea14
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 11:12:38.0380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WrIVDOmfoPjtPiIFo2NQpbtAlbamPH/XWWu2eUe330Acet8WlVU2rNNYa3z2/nN+zYWP9iVrjyhR4JQYxZEAFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3085
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, tzimmermann@suse.de,
 alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04/02/22 6:53 pm, Christian König wrote:
> Am 04.02.22 um 12:22 schrieb Arunpravin:
>> On 28/01/22 7:48 pm, Matthew Auld wrote:
>>> On Thu, 27 Jan 2022 at 14:11, Arunpravin
>>> <Arunpravin.PaneerSelvam@amd.com> wrote:
>>>> - Remove drm_mm references and replace with drm buddy functionalities
>>>> - Add res cursor support for drm buddy
>>>>
>>>> v2(Matthew Auld):
>>>>    - replace spinlock with mutex as we call kmem_cache_zalloc
>>>>      (..., GFP_KERNEL) in drm_buddy_alloc() function
>>>>
>>>>    - lock drm_buddy_block_trim() function as it calls
>>>>      mark_free/mark_split are all globally visible
>>>>
>>>> v3(Matthew Auld):
>>>>    - remove trim method error handling as we address the failure case
>>>>      at drm_buddy_block_trim() function
>>>>
>>>> v4:
>>>>    - fix warnings reported by kernel test robot <lkp@intel.com>
>>>>
>>>> v5:
>>>>    - fix merge conflict issue
>>>>
>>>> v6:
>>>>    - fix warnings reported by kernel test robot <lkp@intel.com>
>>>>
>>>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/Kconfig                       |   1 +
>>>>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  97 +++++--
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |   7 +-
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 259 ++++++++++--------
>>>>   4 files changed, 231 insertions(+), 133 deletions(-)
>>> <snip>
>>>
>>>> -/**
>>>> - * amdgpu_vram_mgr_virt_start - update virtual start address
>>>> - *
>>>> - * @mem: ttm_resource to update
>>>> - * @node: just allocated node
>>>> - *
>>>> - * Calculate a virtual BO start address to easily check if everything is CPU
>>>> - * accessible.
>>>> - */
>>>> -static void amdgpu_vram_mgr_virt_start(struct ttm_resource *mem,
>>>> -                                      struct drm_mm_node *node)
>>>> -{
>>>> -       unsigned long start;
>>>> -
>>>> -       start = node->start + node->size;
>>>> -       if (start > mem->num_pages)
>>>> -               start -= mem->num_pages;
>>>> -       else
>>>> -               start = 0;
>>>> -       mem->start = max(mem->start, start);
>>>> -}
>>>> -
>>>>   /**
>>>>    * amdgpu_vram_mgr_new - allocate new ranges
>>>>    *
>>>> @@ -366,13 +357,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>>>                                 const struct ttm_place *place,
>>>>                                 struct ttm_resource **res)
>>>>   {
>>>> -       unsigned long lpfn, num_nodes, pages_per_node, pages_left, pages;
>>>> +       unsigned long lpfn, pages_per_node, pages_left, pages, n_pages;
>>>> +       u64 vis_usage = 0, mem_bytes, max_bytes, min_page_size;
>>>>          struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>>>>          struct amdgpu_device *adev = to_amdgpu_device(mgr);
>>>> -       uint64_t vis_usage = 0, mem_bytes, max_bytes;
>>>> -       struct ttm_range_mgr_node *node;
>>>> -       struct drm_mm *mm = &mgr->mm;
>>>> -       enum drm_mm_insert_mode mode;
>>>> +       struct amdgpu_vram_mgr_node *node;
>>>> +       struct drm_buddy *mm = &mgr->mm;
>>>> +       struct drm_buddy_block *block;
>>>>          unsigned i;
>>>>          int r;
>>>>
>>>> @@ -391,10 +382,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>>>                  goto error_sub;
>>>>          }
>>>>
>>>> -       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>>> +       if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>>>>                  pages_per_node = ~0ul;
>>>> -               num_nodes = 1;
>>>> -       } else {
>>>> +       else {
>>>>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>>>                  pages_per_node = HPAGE_PMD_NR;
>>>>   #else
>>>> @@ -403,11 +393,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>>>   #endif
>>>>                  pages_per_node = max_t(uint32_t, pages_per_node,
>>>>                                         tbo->page_alignment);
>>>> -               num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
>>>>          }
>>>>
>>>> -       node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
>>>> -                       GFP_KERNEL | __GFP_ZERO);
>>>> +       node = kzalloc(sizeof(*node), GFP_KERNEL);
>>>>          if (!node) {
>>>>                  r = -ENOMEM;
>>>>                  goto error_sub;
>>>> @@ -415,9 +403,17 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>>>
>>>>          ttm_resource_init(tbo, place, &node->base);
>>>>
>>>> -       mode = DRM_MM_INSERT_BEST;
>>>> +       INIT_LIST_HEAD(&node->blocks);
>>>> +
>>>>          if (place->flags & TTM_PL_FLAG_TOPDOWN)
>>>> -               mode = DRM_MM_INSERT_HIGH;
>>>> +               node->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>>>> +
>>>> +       if (place->fpfn || lpfn != man->size)
>>>> +               /* Allocate blocks in desired range */
>>>> +               node->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>>>> +
>>>> +       min_page_size = mgr->default_page_size;
>>>> +       BUG_ON(min_page_size < mm->chunk_size);
>>>>
>>>>          pages_left = node->base.num_pages;
>>>>
>>>> @@ -425,36 +421,61 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>>>          pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
>>>>
>>>>          i = 0;
>>>> -       spin_lock(&mgr->lock);
>>>>          while (pages_left) {
>>>> -               uint32_t alignment = tbo->page_alignment;
>>>> -
>>>>                  if (pages >= pages_per_node)
>>>> -                       alignment = pages_per_node;
>>>> -
>>>> -               r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
>>>> -                                               alignment, 0, place->fpfn,
>>>> -                                               lpfn, mode);
>>>> -               if (unlikely(r)) {
>>>> -                       if (pages > pages_per_node) {
>>>> -                               if (is_power_of_2(pages))
>>>> -                                       pages = pages / 2;
>>>> -                               else
>>>> -                                       pages = rounddown_pow_of_two(pages);
>>>> -                               continue;
>>>> -                       }
>>>> -                       goto error_free;
>>>> +                       pages = pages_per_node;
>>>> +
>>>> +               n_pages = pages;
>>>> +
>>>> +               if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>>> +                       n_pages = roundup_pow_of_two(n_pages);
>>>> +                       min_page_size = (u64)n_pages << PAGE_SHIFT;
>>>> +
>>>> +                       if (n_pages > lpfn)
>>>> +                               lpfn = n_pages;
>>>>                  }
>>>>
>>>> -               vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
>>>> -               amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
>>>> +               mutex_lock(&mgr->lock);
>>>> +               r = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>>>> +                                          (u64)lpfn << PAGE_SHIFT,
>>>> +                                          (u64)n_pages << PAGE_SHIFT,
>>>> +                                          min_page_size,
>>>> +                                          &node->blocks,
>>>> +                                          node->flags);
>>>> +               mutex_unlock(&mgr->lock);
>>>> +               if (unlikely(r))
>>>> +                       goto error_free_blocks;
>>>> +
>>>>                  pages_left -= pages;
>>>>                  ++i;
>>>>
>>>>                  if (pages > pages_left)
>>>>                          pages = pages_left;
>>>>          }
>>>> -       spin_unlock(&mgr->lock);
>>>> +
>>>> +       /* Free unused pages for contiguous allocation */
>>>> +       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>>> +               u64 actual_size = (u64)node->base.num_pages << PAGE_SHIFT;
>>>> +
>>>> +               mutex_lock(&mgr->lock);
>>>> +               drm_buddy_block_trim(mm,
>>>> +                                    actual_size,
>>>> +                                    &node->blocks);
>>>> +               mutex_unlock(&mgr->lock);
>>>> +       }
>>>> +
>>>> +       list_for_each_entry(block, &node->blocks, link)
>>>> +               vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
>>>> +
>>>> +       block = list_first_entry_or_null(&node->blocks,
>>>> +                                        struct drm_buddy_block,
>>>> +                                        link);
>>>> +       if (!block) {
>>>> +               r = -ENOENT;
>>>> +               goto error_free_res;
>>>> +       }
>>>> +
>>>> +       node->base.start = amdgpu_node_start(block) >> PAGE_SHIFT;
>>> Hmm, does this work? It looks like there are various places checking
>>> that res->start + res->num_pages <= visible_size, which IIUC should
>>> only return true when the entire object is placed in the mappable
>>> portion. i915 is doing something similar. Also it looks like
>>> ttm_resource_compat() is potentially relying on this, like when moving
>>> something from non-mappable -> mappable in
>>> amdgpu_bo_fault_reserve_notify()?
>>>
>>> Perhaps something like:
>>>
>>> if (vis_usage == num_pages)
>>>      base.start = 0;
>>> else
>>>      base.start = visible_size;
>>>
>>> Otherwise I guess just keep amdgpu_vram_mgr_virt_start()?
>>>
>> hmm, I wonder how it works, may be we didn't go through the corner case
>> where res->start + res->num_pages > visible_size
>>
>> in amdgpu if AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED flag is enabled, we
>> set the ttm_place.lpfn = visible_pfn at
>> amdgpu_bo_placement_from_domain(). Hence, in amdgpu_vram_mgr_new()
>> function DRM_BUDDY_RANGE_ALLOCATION flag is enabled, which calls the
>> alloc_range_bias() in drm_buddy.c.
>>
>> Here we get blocks chained together in random order complying
>> visible_pfn range. say for instance num_pages = 13
>> we may get,
>> Block 1 addr - 500 (order-3)
>> Block 2 addr - 400 (order-2)
>> Block 3 addr - 600 (order-0)
>>
>> I think currently base.start = Block 1 start address fetched from the
>> list and the address 500 assigned to it, which is good for the resource
>> access since we access the blocks using the list link
>>
>> But for the check res->start + res->num_pages <= visible_size in few
>> places, this doesn't work. AFAIK, keeping amdgpu_vram_mgr_virt_start()
>> doesn't work since the function looks for nodes in continuous address to
>> calculate the start address. AFAIK, assigning the start address (400 +
>> num_pages <= visible_size) mislead in our case since we use linked list
>>
>> how about replacing the check with a bool type return function which
>> checks the each block start address + block size <= visible_size?
> 
> Yeah, we already have that in the TTM code. It's just not used 
> everywhere IIRC.

Hi Christian,
here we have a problem, many places in ttm and amdgpu, we are using the
tbo->resource->start + bo->resource->num_pages operation, this doesn't
work in case of drm buddy since it allocates blocks in different
locations which are chained together using linked list.
> 
> The node->start can just be set to the invalid offset for now and should 
> be removed as soon as we don't need it any more.
Assigning the start block offset to resource->start doesn't work,
If we set node->start to invalid offset, we get an incorrect value?
> 
> Regards,
> Christian.
