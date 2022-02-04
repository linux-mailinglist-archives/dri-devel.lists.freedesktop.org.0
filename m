Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631F04A9842
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 12:15:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D5010EF45;
	Fri,  4 Feb 2022 11:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC60C10ECC8;
 Fri,  4 Feb 2022 11:14:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWCZVwbTqpJlksxedLv4ns/O1BYZuRQ2nAoGH3ctKfix0pZ6+w+WtSlxBJjRT6SQWI7Dy4TpoxPvepoedS/w++BGi1GerkrYbtwdccvfsYozQawpYRNHXcl5u2ztO8FCKxG9vG/lSaOqPYoj7RPgZkGT34s50/kfz3DG1lE9JnOnB8CHHPQhsDU7a3Wz1eLyUXwBepYIfIBZt5B7sN5ks0ASzOrOlrUPzaEbF7hNokAQnIs3PF9SWJ+f6dvDAvR7DE1wNFocQAWjR1cKXJgvblpsYhSDKe+hJRpU8D3dmMkOQNLR5Jy+//2mF86E+KRJdds081GgOFOpr2r558FB8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrKFOTv6FZmTq/tNRObrLYsddWnQ5Feklq0Z/L2rA9c=;
 b=gDx7aimyZzbCok0NMJ32awj2RFSZgIHZ71nKbdYpbbTM5fJyAwa2JpdJ4ja+942BnvZiX2pHKXQlhlETl0uFxmqgvnXitZ/A/nbkxL6KQssIPyRR5t8/sw4pWChvUxkzxtK7Z22D+BHBPb8RylkIe4cs7Mr5Kkvs19j9EijumJUpCpikne/xVo8XNORBSPhpTAJLP8xX7yr3LdCqjPFIAtCbPxwga2DDcjtYKlTwtj91oOWG0lNOsWcmm2ty8Sa1Mad3XOKJfD/7vBC7Aal57lvesPTGwVJJG/lA9PLhBRNaGbtnH7R4YM2AZi0OMBCZKro0Fq6Jn+ZGUx6bdq4ivQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrKFOTv6FZmTq/tNRObrLYsddWnQ5Feklq0Z/L2rA9c=;
 b=p+h3dEu7M29n8KaPYIG25rcvxBLcfdTgD5kBTTKdZ5LEg9S+AFQEXVo3UnQtW3b/eP59chQErN0h8RcgCnBvYhsuMLk6ZBgJvCYrsSLHjXZrvvtDwxn38UhE66iFhLnOPju41PLp7E1sA35+n/IKb19RRRSV05KNYc/qGsoDhaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SA0PR12MB4511.namprd12.prod.outlook.com (2603:10b6:806:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 11:14:52 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c411:8d69:9007:aed6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c411:8d69:9007:aed6%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 11:14:51 +0000
Message-ID: <c842bcfc-80ff-fafa-7242-cfca3ed65087@amd.com>
Date: Fri, 4 Feb 2022 16:52:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v11 5/5] drm/amdgpu: add drm buddy support to amdgpu
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20220127141107.173692-1-Arunpravin.PaneerSelvam@amd.com>
 <20220127141107.173692-5-Arunpravin.PaneerSelvam@amd.com>
 <CAM0jSHOdMDQvWxGyHfW01UAe-x_eefFQSJnzU43=t6qL_Ec77g@mail.gmail.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <CAM0jSHOdMDQvWxGyHfW01UAe-x_eefFQSJnzU43=t6qL_Ec77g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::12) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03437584-d233-446e-023d-08d9e7cf904d
X-MS-TrafficTypeDiagnostic: SA0PR12MB4511:EE_
X-Microsoft-Antispam-PRVS: <SA0PR12MB451162CA65EB6492EF99A1FBE4299@SA0PR12MB4511.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R1TH6AXlxJAibg00kjArZ2f/svbyGH0aflD73pmaQb3us7bw8N/Js89QlVOPNsxirj2F4ZiVYc6DXiwz3HnhRthdw/UNVqS57HMiwEZ8awsxVLpx8IB0pKkkKoIfjsXfMpCDwWTYHLtNgd5rm6vPSynSaLXufGG7koRiEIekUpvRVBFi5OZ4T1F6+cFq/Ye+p0mJF8jFtbi0u1q9M2YXAChIBd5JVOkGWL3P0AcXNktewdAbioBvRBkVOy/5Xr2mUjHZ9foXu8CNAm93rhEOe8aT1+gmFEntYzwJjPoOOBd3g6V6wp0m4K8RvPWIGbHe7HnnotpkmHoDu652w71E2DWCY7IlQGNA7b3ZHWA2wL8XIKbvfvmyhJ0i+H+E18jmnkmY7tfwMqgEJCSYqkLG5PKTr0vTNL2H4dgW94lAT0Z+3qRnArIbfOE+lf0aigDLlSCpB3b75wmdEaFNOBm52eO4fG3oGoPa506llmHyRCzbi4O/UF5O6Si/4TBUOfXS41kFpywotnioTwTns++SzMdP3cVT4ZxWHsd9gSjUsihuoh+F90wHsQBLjvWFN5SWr1l+rEXuGoYNIeW0Igyk/Hn1e1AGQk5p3cOyZh4CPA1EUgXUQQipo1rfhwo31fYgLXKm/5XL8Pe2OfzP7mc0Y4ALFCWSSov0I334mq3PKuJwND+EKIUW2hnqHAuiZqPEnZSKdMqvkjMBrBvKZHJ788otorfbradkNVR81Nd2g6+QOceZZTU6F3BqVKzL0q2Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(2616005)(83380400001)(186003)(38100700002)(86362001)(31696002)(6486002)(31686004)(8936002)(8676002)(4326008)(66476007)(2906002)(36756003)(508600001)(66556008)(6916009)(316002)(54906003)(6512007)(66946007)(5660300002)(53546011)(6506007)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0pRWkRkd3NCU0p1NktGbGVMcDBQU0s4bkUrYU9Sdk1nZjdWaHZjaE5OcWZC?=
 =?utf-8?B?UWVpeXVyWjZSRDZLczdMekVoT3h0RHNlNENEUHcxb2x3emg2bVhWb0k4R29C?=
 =?utf-8?B?NkRSY3hoa2xxN1MvWDV5Z1V0a1dpc0NPN2FpZ1pQdVZXZHlIU3BjRGRnZzZi?=
 =?utf-8?B?em5QT2piVUJ4Ymx0NXlnVFora3pyOS9hOWFlS0c5d1lVV3diNGI2eFIxWDFo?=
 =?utf-8?B?SEllaWlDWkJnQ2YrdjkzQituTG5ISVdsR1lYUm9JSzlkWGZ3VFdxKy9lc1k3?=
 =?utf-8?B?RFdjc0ZQMFRyWC8wd3llb0ZlNUlYZno0Yk9vS2wrcFJtN3QrRmFMUjFzYWtZ?=
 =?utf-8?B?VnR2Q2xoejlZQ0VHQzM1VGQ5L3FDQkdFSm5FYzhOTWh4aWtLdFMzQ29lcVlz?=
 =?utf-8?B?QWd0Z0k3azJpSmU1VklLeHIxMjlVVnBadVFzVnJnRi9YZ1JiNWR3N29kZkJs?=
 =?utf-8?B?NVJhUjcyTm1Ta2Yzb1M2ZktFUWgzS2tnZU9UR3hvZkFjYkJ4QitaUkxFOFl5?=
 =?utf-8?B?UnhOQWhHcEJTTmxyZmJYQ3ZaNnk2OThET0VsRjRIOHNqbWI1MVFHNGNpZ2VE?=
 =?utf-8?B?OHYwTWQvT3hjQmh3YWN2cFFnbFhyOE0yM21KR0JYWkZWUnB4Tmx5bDVvRXc5?=
 =?utf-8?B?ay9QV1dOR2FFWkRFQm9sODI3YzBFMlVWVzByb093cWFWTG52dHFEaEFwM0pj?=
 =?utf-8?B?RXBHL0Fxako1UVk3dDFJOVpucVFqaUgvdkx1dHNCelN3ZFAvbVEyUnF4Qm1O?=
 =?utf-8?B?dGRIS2dVUEVsZGI4UnkydENqRGtMNmdKR0JSRjFSSzJUYzFsb1FadWZEbjNu?=
 =?utf-8?B?ZVJub25NZnZVMDd1eFlHSlMzQlZiN1dud3R6TWZ6a05IV2tUUTlxM1lVZnYz?=
 =?utf-8?B?alRENEl3cGgrcWtBejVHK0x4WUJ5MW9hZGdCYXFCRmFxODhYVnh3UEZtZHJJ?=
 =?utf-8?B?NG84aUtqbUNmZG8zMHQ1TUNaYTlna2RQeCtqYUV3VXROWTQ4aDhTVHdSSG53?=
 =?utf-8?B?Q21aUnFiWmR1MVdJOUljVUh6QmNUdXR0b1lTRHA5blJtbUVOWHZLUFliejNz?=
 =?utf-8?B?NHRmVGYyanJ6NG9KTVFUNldXVDlQOVlacnhSMEY1cDlzVFZXekRTa0wwNWVr?=
 =?utf-8?B?aDJGSUZuVUJJWkVMUXhFR3N1ejl0Sk9ZZFRDSUFicVY1aDJPVzRLQXJ6VlUy?=
 =?utf-8?B?YVBBRUN6eFZmb2JwaitJbTFLZlR2YlYxNy9YZU91azRuMW52NG85RXVlUDUv?=
 =?utf-8?B?WXdjYXJ5MHJvMHNoSGwyUUNzTi91QXdsc2JsQjdXblZRd1dTaTEyZWJPSXNr?=
 =?utf-8?B?YkFISHZNNXlUeGxvQ3Q2RUxqdEkxYW5RZTQ3VVRwdk5MdjgrbXpBMEFIeC9N?=
 =?utf-8?B?K0ZhTWNVdDZEOUM3SU9CdDNJRjdxa1Rhb041U1BacGpBL0MrQ3JFeWlGaVNZ?=
 =?utf-8?B?cVFaZzR3Unc0RXpWTm40cXZTNWRGcVI0dmRTTEZVUnYwVVhaeldDb3REcDNo?=
 =?utf-8?B?WmprQ0JwSi9NdEEwaFJMTlhSNzFrOW9Vc2cxYXlUTWI1dDZ5bml6cTBaZnYz?=
 =?utf-8?B?aTVxV3R4M25oY204dmIyUkdHbjBOS0lZK2JZZTN6V0pybk5nMjNSVFRMUXdN?=
 =?utf-8?B?ckZxbHhkQ3J1SHNnUWZjYTJCbkhnT2hhN2hOZCtBcDFUR0dYaFB0UXl6SFdv?=
 =?utf-8?B?UE9ycGY5OWp1amg5MytUc0gyNXNwSVV0d21XeXNiTjV6bWpCU3hhWGpWWUVM?=
 =?utf-8?B?SHhEd016S0hnQUowVk8ydjRXRWhTY3Q5MVJkUmlIN2VEZ1k5SysyVGRhL04w?=
 =?utf-8?B?REVSL25jbENMWDFEYytCVTh4ZU5ZUGtKOUFTZ1FqSld5T055UjRrTDRFNXhk?=
 =?utf-8?B?TVdLMFpTdWZIZTBZMU1lMmxtSDBIdmU3N3M4cXFTRHVlc2tmM01rU0F3eUxF?=
 =?utf-8?B?MG9td3EwYWJ4dTZ6VmlINHNmOUc0b0taYVJuNWE2TCtDQ3crTXpaQXI1YjRG?=
 =?utf-8?B?ZWw3QzFQYWRhQ2VnaUlueDNqNUNTRFg4UHJoUXVYb2FrMTNURkFaZHpHUC9I?=
 =?utf-8?B?K1NQSDV0RnpnUUFTdG9oT1g0TEZ0SG1Hajdqa0JoWWR2clMvQXdmQjhJRlh5?=
 =?utf-8?B?OG9KeDRMRFVSbUUvMlhVc0h6Qk1oUU0zR3QwZDNHOHpVcnBTVWp4Wi9iUTJO?=
 =?utf-8?Q?GScg+GotsR98EloT5vAIdYM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03437584-d233-446e-023d-08d9e7cf904d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 11:14:51.9066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSMvxvApW1yEva5J5kfZAn4q5jBw22Y+2OMbXG8dK3isU69sDq8nYzNPnhmdlKuybA1lx6a0Fa+mcw5Bsuawjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4511
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, tzimmermann@suse.de,
 alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28/01/22 7:48 pm, Matthew Auld wrote:
> On Thu, 27 Jan 2022 at 14:11, Arunpravin
> <Arunpravin.PaneerSelvam@amd.com> wrote:
>>
>> - Remove drm_mm references and replace with drm buddy functionalities
>> - Add res cursor support for drm buddy
>>
>> v2(Matthew Auld):
>>   - replace spinlock with mutex as we call kmem_cache_zalloc
>>     (..., GFP_KERNEL) in drm_buddy_alloc() function
>>
>>   - lock drm_buddy_block_trim() function as it calls
>>     mark_free/mark_split are all globally visible
>>
>> v3(Matthew Auld):
>>   - remove trim method error handling as we address the failure case
>>     at drm_buddy_block_trim() function
>>
>> v4:
>>   - fix warnings reported by kernel test robot <lkp@intel.com>
>>
>> v5:
>>   - fix merge conflict issue
>>
>> v6:
>>   - fix warnings reported by kernel test robot <lkp@intel.com>
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>  drivers/gpu/drm/Kconfig                       |   1 +
>>  .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  97 +++++--
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |   7 +-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 259 ++++++++++--------
>>  4 files changed, 231 insertions(+), 133 deletions(-)
> 
> <snip>
> 
>>
>> -/**
>> - * amdgpu_vram_mgr_virt_start - update virtual start address
>> - *
>> - * @mem: ttm_resource to update
>> - * @node: just allocated node
>> - *
>> - * Calculate a virtual BO start address to easily check if everything is CPU
>> - * accessible.
>> - */
>> -static void amdgpu_vram_mgr_virt_start(struct ttm_resource *mem,
>> -                                      struct drm_mm_node *node)
>> -{
>> -       unsigned long start;
>> -
>> -       start = node->start + node->size;
>> -       if (start > mem->num_pages)
>> -               start -= mem->num_pages;
>> -       else
>> -               start = 0;
>> -       mem->start = max(mem->start, start);
>> -}
>> -
>>  /**
>>   * amdgpu_vram_mgr_new - allocate new ranges
>>   *
>> @@ -366,13 +357,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>                                const struct ttm_place *place,
>>                                struct ttm_resource **res)
>>  {
>> -       unsigned long lpfn, num_nodes, pages_per_node, pages_left, pages;
>> +       unsigned long lpfn, pages_per_node, pages_left, pages, n_pages;
>> +       u64 vis_usage = 0, mem_bytes, max_bytes, min_page_size;
>>         struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>>         struct amdgpu_device *adev = to_amdgpu_device(mgr);
>> -       uint64_t vis_usage = 0, mem_bytes, max_bytes;
>> -       struct ttm_range_mgr_node *node;
>> -       struct drm_mm *mm = &mgr->mm;
>> -       enum drm_mm_insert_mode mode;
>> +       struct amdgpu_vram_mgr_node *node;
>> +       struct drm_buddy *mm = &mgr->mm;
>> +       struct drm_buddy_block *block;
>>         unsigned i;
>>         int r;
>>
>> @@ -391,10 +382,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>                 goto error_sub;
>>         }
>>
>> -       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> +       if (place->flags & TTM_PL_FLAG_CONTIGUOUS)
>>                 pages_per_node = ~0ul;
>> -               num_nodes = 1;
>> -       } else {
>> +       else {
>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>                 pages_per_node = HPAGE_PMD_NR;
>>  #else
>> @@ -403,11 +393,9 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>  #endif
>>                 pages_per_node = max_t(uint32_t, pages_per_node,
>>                                        tbo->page_alignment);
>> -               num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
>>         }
>>
>> -       node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
>> -                       GFP_KERNEL | __GFP_ZERO);
>> +       node = kzalloc(sizeof(*node), GFP_KERNEL);
>>         if (!node) {
>>                 r = -ENOMEM;
>>                 goto error_sub;
>> @@ -415,9 +403,17 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>
>>         ttm_resource_init(tbo, place, &node->base);
>>
>> -       mode = DRM_MM_INSERT_BEST;
>> +       INIT_LIST_HEAD(&node->blocks);
>> +
>>         if (place->flags & TTM_PL_FLAG_TOPDOWN)
>> -               mode = DRM_MM_INSERT_HIGH;
>> +               node->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
>> +
>> +       if (place->fpfn || lpfn != man->size)
>> +               /* Allocate blocks in desired range */
>> +               node->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>> +
>> +       min_page_size = mgr->default_page_size;
>> +       BUG_ON(min_page_size < mm->chunk_size);
>>
>>         pages_left = node->base.num_pages;
>>
>> @@ -425,36 +421,61 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>>         pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
>>
>>         i = 0;
>> -       spin_lock(&mgr->lock);
>>         while (pages_left) {
>> -               uint32_t alignment = tbo->page_alignment;
>> -
>>                 if (pages >= pages_per_node)
>> -                       alignment = pages_per_node;
>> -
>> -               r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
>> -                                               alignment, 0, place->fpfn,
>> -                                               lpfn, mode);
>> -               if (unlikely(r)) {
>> -                       if (pages > pages_per_node) {
>> -                               if (is_power_of_2(pages))
>> -                                       pages = pages / 2;
>> -                               else
>> -                                       pages = rounddown_pow_of_two(pages);
>> -                               continue;
>> -                       }
>> -                       goto error_free;
>> +                       pages = pages_per_node;
>> +
>> +               n_pages = pages;
>> +
>> +               if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> +                       n_pages = roundup_pow_of_two(n_pages);
>> +                       min_page_size = (u64)n_pages << PAGE_SHIFT;
>> +
>> +                       if (n_pages > lpfn)
>> +                               lpfn = n_pages;
>>                 }
>>
>> -               vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
>> -               amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
>> +               mutex_lock(&mgr->lock);
>> +               r = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>> +                                          (u64)lpfn << PAGE_SHIFT,
>> +                                          (u64)n_pages << PAGE_SHIFT,
>> +                                          min_page_size,
>> +                                          &node->blocks,
>> +                                          node->flags);
>> +               mutex_unlock(&mgr->lock);
>> +               if (unlikely(r))
>> +                       goto error_free_blocks;
>> +
>>                 pages_left -= pages;
>>                 ++i;
>>
>>                 if (pages > pages_left)
>>                         pages = pages_left;
>>         }
>> -       spin_unlock(&mgr->lock);
>> +
>> +       /* Free unused pages for contiguous allocation */
>> +       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> +               u64 actual_size = (u64)node->base.num_pages << PAGE_SHIFT;
>> +
>> +               mutex_lock(&mgr->lock);
>> +               drm_buddy_block_trim(mm,
>> +                                    actual_size,
>> +                                    &node->blocks);
>> +               mutex_unlock(&mgr->lock);
>> +       }
>> +
>> +       list_for_each_entry(block, &node->blocks, link)
>> +               vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
>> +
>> +       block = list_first_entry_or_null(&node->blocks,
>> +                                        struct drm_buddy_block,
>> +                                        link);
>> +       if (!block) {
>> +               r = -ENOENT;
>> +               goto error_free_res;
>> +       }
>> +
>> +       node->base.start = amdgpu_node_start(block) >> PAGE_SHIFT;
> 
> Hmm, does this work? It looks like there are various places checking
> that res->start + res->num_pages <= visible_size, which IIUC should
> only return true when the entire object is placed in the mappable
> portion. i915 is doing something similar. Also it looks like
> ttm_resource_compat() is potentially relying on this, like when moving
> something from non-mappable -> mappable in
> amdgpu_bo_fault_reserve_notify()?
> 
> Perhaps something like:
> 
> if (vis_usage == num_pages)
>     base.start = 0;
> else
>     base.start = visible_size;
> 
> Otherwise I guess just keep amdgpu_vram_mgr_virt_start()?
> 

hmm, I wonder how it works, may be we didn't go through the corner case
where res->start + res->num_pages > visible_size

in amdgpu if AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED flag is enabled, we
set the ttm_place.lpfn = visible_pfn at
amdgpu_bo_placement_from_domain(). Hence, in amdgpu_vram_mgr_new()
function DRM_BUDDY_RANGE_ALLOCATION flag is enabled, which calls the
alloc_range_bias() in drm_buddy.c.

Here we get blocks chained together in random order complying
visible_pfn range. say for instance num_pages = 13
we may get,
Block 1 addr - 500 (order-3)
Block 2 addr - 400 (order-2)
Block 3 addr - 600 (order-0)

I think currently base.start = Block 1 start address fetched from the
list and the address 500 assigned to it, which is good for the resource
access since we access the blocks using the list link

But for the check res->start + res->num_pages <= visible_size in few
places, this doesn't work. AFAIK, keeping amdgpu_vram_mgr_virt_start()
doesn't work since the function looks for nodes in continuous address to
calculate the start address. AFAIK, assigning the start address (400 +
num_pages <= visible_size) mislead in our case since we use linked list

how about replacing the check with a bool type return function which
checks the each block start address + block size <= visible_size?
