Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCF4857C10
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 12:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BF410EB12;
	Fri, 16 Feb 2024 11:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2ipTV37M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A7C10EB12;
 Fri, 16 Feb 2024 11:49:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofM1flt6xtvqpOczqFu9StCHEcvwmvdo/1T9imIIABjpISU7DDy92EQT2n070aBStZhBLjWimEWp+SSigrusn9YdrS5nJTE4QBzAcq+eTB7u3/qN8FFZXCczTGWkxjNVB9ZYBJDSlC7pensMQUWOqZ4r6spf9OhEbDhkVfG7PU8Kef8T8Qfkwvorcbs7I5sz78mwj3eza3YwfPaKhr8fin+PIKJx6qa4W5kYgTs4mGwQ5WTPwSI7wXexnTjbavad+17TYXpYrB5yJxo/OJIppfo9cJt+9eQ6on/MV4lx8FHvX0dm6vwuzcj7dyG2yYlOT0a8jdvLQCIZL0/r6LmPEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80mVnVQHXiJd8MoHeLFWlbFemgYAMqItgOVBJA/eomQ=;
 b=YyhGL6wdGQcNJGW053LjJjH3cSGTUbmwA3VAUXHUrGU8rQAB1jNPn+BXILbB7TkF170NAsVPPh0SyLHLwD7yy3jPpSJ/gI8zXyxwtkfn9VpaxT8aYNfXKEjSpg+ptf3u5SCDC1ASLktiiq6g51KBDau/XQbuEoPFj5lly5xiRh0r0PJPGKa5vGWRvxaEkzjqRE/XN+dx+bE68AeaA5WCSl3MEawmYInZvGEUDIMXsP6PvSYIHErOu4Z5HKwbjjN17iRD9FwpLY1tZGvgeCvjvm2UV9DQW76D/nc8p5m3Ey8WcqSEJyOOcIS90NkKeHB6axJScgp5vV+JKKF2JiLXLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80mVnVQHXiJd8MoHeLFWlbFemgYAMqItgOVBJA/eomQ=;
 b=2ipTV37MH+hB+zjSwp1p7rapJojNkT2VEbLDsckf1TEEZ2+kVgaOXdvfU5kbE3S/C7gGHXHr8Z7+L8ICZ53AY4uckJYuvhSNwGLJ8+G+SY1HLRgu3bRBLOmq3hMFa+ezad+RoCxOtbn/o30cynEgI74WFTPErm2mdWkuQkO7UOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN0PR12MB6293.namprd12.prod.outlook.com (2603:10b6:208:3c2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Fri, 16 Feb
 2024 11:49:30 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e3ee:6c2c:4e87:a6d6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e3ee:6c2c:4e87:a6d6%5]) with mapi id 15.20.7316.012; Fri, 16 Feb 2024
 11:49:30 +0000
Message-ID: <d4a99b31-f7f0-a26a-e888-f300bf21983b@amd.com>
Date: Fri, 16 Feb 2024 17:19:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 1/3] drm/buddy: Implement tracking clear page feature
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 matthew.auld@intel.com, felix.kuehling@amd.com, mario.limonciello@amd.com
References: <20240208155000.339325-1-Arunpravin.PaneerSelvam@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20240208155000.339325-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::9) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|MN0PR12MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f16a95-1ec7-45fe-1c50-08dc2ee555ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kplFmWI7PJs3YwJMT4mBXOLpaR1U1+HbyU+/4AEShhLm1Fu3QBJPxfAeS73yQVBLLiYJgeVj3L8Rljy7O1BJL7fm8geD0xFMTCqhn69disPx0WIY4L+cUitPBKzaoIYAwMxGcYv5iAMFLNRE2LlC7oZEFlavpt3mnsa6DbS3w8woPVbe60AR+o/uPJNp6W4bYTJSb4c1uOThyREETcZS6GKAUK+w9PKFuV85CzDZFrHrNAZpDcA0yX2nA0S0PpwylEsnZyG+nDxrnTpEs8skaf+M/Wv7i2+dNLS4Y4mA85sRzGl3jvFXZ3GihFWssL9v+v8sZmi3qG4WPVpiPqKMKSSuk+35qP0hE36fGyoWkH+BC2JG7WPEMIX53wYSj/uvCLYkeTH4llUikZDXpy+/PBkhA83e0mnkryT0U4oSJRGjLUGwgHZBhtnJWZCzGLK55Y274C3h3a2wRWkfpEdU9ESLlwB1/5slxxsDalT0r/pppERQoegs7a794jYJtt8O4Aqa9zUn2QgipDKUNcqXfWiLbYWeWsyLguwWyi6NZLV7+1/QeZ312Ry2HcR9tJ+2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(31686004)(6512007)(478600001)(53546011)(2616005)(41300700001)(2906002)(66556008)(5660300002)(30864003)(8676002)(8936002)(66476007)(66946007)(4326008)(6666004)(6506007)(6486002)(26005)(316002)(31696002)(66574015)(83380400001)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEF4QlpRdDdlaHhWLzdyS3pJNi9zR0NDQ3dGSHRFL1c1ZkUzaFRHY2Ewd3I1?=
 =?utf-8?B?UENGWktKYm93QmdsN2NzUkVYQ25vWXp1NURxOGdzT2traTZEOENIdDFueTF2?=
 =?utf-8?B?NjlmQzlITTdkdnR3L1MrL0svZU92YldWOWJXUFIyRXZ1L0IrNjRnajd3T0Q4?=
 =?utf-8?B?d29Yc3p4RXZZYVV5K2N4c0t2R3IzdDNLZjZvVGJGc0RDRCt5cjY4QU83UGd0?=
 =?utf-8?B?aDFSeEY4T2JnV200ZjhXZmNnTUdSUE0wVUVTalh0SExRWWRwVHVNRGJBSWVO?=
 =?utf-8?B?UE5Ubmk2ZVdKdDJDYXlqL0RGMGZpMWFBU3IwNFdkWEp0RzRndFN0WHhtNzZ0?=
 =?utf-8?B?NjNGdHU3dGtHNUY4bnFvNkJ3VWRNcTlsbVlWcXM3SkhKN0txWjNkaVRjOVFt?=
 =?utf-8?B?cTIyKzRBY1VvMVFtQ1liSkRGVnJpbHhLVzJzOVNnNDBHTXBOc1pPWmlBQmM5?=
 =?utf-8?B?VkRLdmRYb3VhWWIwNXhqSzZTQ3ZHUU5wdlFweDJkSnljK3pQOEhhOVYrVUpE?=
 =?utf-8?B?cWZGYjQzRWF0YktDQ1QxcmdkUEJKdXNNZUh3dloxV0ZrQklQRld5R2tjQmlv?=
 =?utf-8?B?anIyNUNPMkRRcmgwZmN3cXNGQWN3Vkl6OTN2YUwwcXVuSzBkNHFWK3RzcHpH?=
 =?utf-8?B?U0RLdUtQVkNIYUd0YTU3YnZTQVZJMTh6L3BTUmI4d21GalhzaklGL3ZZMm9L?=
 =?utf-8?B?YWJaYWZtNG44SS9oNlZFMXZYRmpZeXhhVjE1aXBJSVI1Z1JJVmlXVWc0Qk9o?=
 =?utf-8?B?SVJRc25wSHpVT2UyMFlEeWI4TEJ3eXBYdERoOEZFSXk0eEM2cEtEazJKNExU?=
 =?utf-8?B?dXM3SmVJZnpCUWhKZlU5ODRDUGRlRDF3S3lqQUdib3dKbUZ2UGFYSmN3L0hS?=
 =?utf-8?B?Z2VyVUMwZDAxSFVwQlNBOUxvWXVNeEZSYlRXT1JiSlBjSzBNemV2aXdjSG9x?=
 =?utf-8?B?emJEVm9KTmhIVlB1UzFYL0tZcHNoc0RhczVZTFUrTXBQLzhDUUtNcUNJMjdI?=
 =?utf-8?B?eXZVZitqWGZkMUg3WVFzdkxCZ0xKaDJybG9yQVFqWCttS2U3VmJEM3RDa2NV?=
 =?utf-8?B?TjBscitnL2dobVlIQmF3RHFCZTJQcTRPVytyMU1uaDNNejVYV0F4V1Z1b21X?=
 =?utf-8?B?UnozcUlMRVlXUmxmZU9NWUg4M1ZRNVFZT0ZtYVB1MjhLRTR6RnFYd2pNUXRP?=
 =?utf-8?B?T3U5aXF1R0ovTHZoZmtWdk52U3U3WFliTFJBNHkrZ3hxRUR2TjNFM2V0WWpV?=
 =?utf-8?B?SDNXQzRtRGNCMHFLUGFlK3VUUXcvNXQyeFRlVmRvUnNjQjBQeHBtQmExeUI3?=
 =?utf-8?B?N0EyR1BOM1E4dzJ5d24xbURtQ004Wm5iSHJVMEx2YXRlVGNESmRibTQ1MGdS?=
 =?utf-8?B?MklPTDhLb1h3WWIrYXEvNnlBTXJtcVdKTDRSYzNSVVhmcUhTRkdQaTZMb3du?=
 =?utf-8?B?Zzd3dnJSblhOSUw1SDFrREpzTmR6QTlFdGh6OVNDTEk1dVUrT1p2clUyUW5M?=
 =?utf-8?B?UC9JVHEwNnRsVXhGOEZ6R2Z0RDN6aHRzWnk4c25EaUlBNHRhdWNtQVYwWTlY?=
 =?utf-8?B?Z01iMjhHQ2IwQUx2RlB1QVc3R0ZJMGRnQUg4TCtrOWhqcGRYVzRHeHk3ZVBK?=
 =?utf-8?B?WVBxWGo0bXN0eW0vTGFHUEZqSU5FWG0rVkwvRzAvaXhxTm5BVFJCMXJydVMy?=
 =?utf-8?B?T2xjeFpPOWxBSUpSdThQQ1NkU0VJL3Vrc2dhWVpTWWRmMTJmVlVmM3B5Z1p1?=
 =?utf-8?B?dWJaOEo0dGdHTTJvUlZUYXVZTU95QytrU09HZmF5SXVKeHhlcTk0TjRna29Y?=
 =?utf-8?B?ZXJTU0ZZMlZjTjNmSjNwQzlHeHBBZ0JkNUxjQVVleGhaN2FyUWNoeDB5ZDVu?=
 =?utf-8?B?aTZvUGxCeld0Unc3VDFsMXhWTEE3WDNkOGNvRkl3TzdmOWxuTUtrVkdXRjd2?=
 =?utf-8?B?a3picFhVTU8vYWpUNU5kL0h6Q3JzbEdnTW9ZTEQ2aGY4UXRBNE42ZW85YlpR?=
 =?utf-8?B?TzlYSHZwMENhWFk4U0RYMHRqRXBDVXJEbHhkQjBwamxHM0U0dHQwVnFTRlRz?=
 =?utf-8?B?MlVmc1FMSENzWnpyajJURW9BZnM1S3hPeTl6cDVrdTV2MVBScWZFQjlNd1dC?=
 =?utf-8?Q?33r7M7cjswsJqJvQspRQ/8WDT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f16a95-1ec7-45fe-1c50-08dc2ee555ef
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 11:49:30.6028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEZKh3jEvuN1Nugqomq96T+sp8ZkcI0qQ918ZlnwtuXmQ+iKAlN/YsbieMgvnMdVjats+WdPPTwaDIJrXt0DeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6293
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

Hi Matthew,

Could you review the v6?

Thanks,
Arun.

On 2/8/2024 9:19 PM, Arunpravin Paneer Selvam wrote:
> - Add tracking clear page feature.
>
> - Driver should enable the DRM_BUDDY_CLEARED flag if it
>    successfully clears the blocks in the free path. On the otherhand,
>    DRM buddy marks each block as cleared.
>
> - Track the available cleared pages size
>
> - If driver requests cleared memory we prefer cleared memory
>    but fallback to uncleared if we can't find the cleared blocks.
>    when driver requests uncleared memory we try to use uncleared but
>    fallback to cleared memory if necessary.
>
> - When a block gets freed we clear it and mark the freed block as cleared,
>    when there are buddies which are cleared as well we can merge them.
>    Otherwise, we prefer to keep the blocks as separated.
>
> v1: (Christian)
>    - Depends on the flag check DRM_BUDDY_CLEARED, enable the block as
>      cleared. Else, reset the clear flag for each block in the list.
>
>    - For merging the 2 cleared blocks compare as below,
>      drm_buddy_is_clear(block) != drm_buddy_is_clear(buddy)
>
> v2: (Matthew)
>    - Add a wrapper drm_buddy_free_list_internal for the freeing of blocks
>      operation within drm buddy.
>    - Write a macro block_incompatible() to allocate the required blocks.
>    - Update the xe driver for the drm_buddy_free_list change in arguments.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   6 +-
>   drivers/gpu/drm/drm_buddy.c                   | 192 ++++++++++++++----
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   6 +-
>   drivers/gpu/drm/tests/drm_buddy_test.c        |  10 +-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   4 +-
>   include/drm/drm_buddy.h                       |  18 +-
>   6 files changed, 187 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 8db880244324..c0c851409241 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -571,7 +571,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   	return 0;
>   
>   error_free_blocks:
> -	drm_buddy_free_list(mm, &vres->blocks);
> +	drm_buddy_free_list(mm, &vres->blocks, 0);
>   	mutex_unlock(&mgr->lock);
>   error_fini:
>   	ttm_resource_fini(man, &vres->base);
> @@ -604,7 +604,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>   
>   	amdgpu_vram_mgr_do_reserve(man);
>   
> -	drm_buddy_free_list(mm, &vres->blocks);
> +	drm_buddy_free_list(mm, &vres->blocks, 0);
>   	mutex_unlock(&mgr->lock);
>   
>   	atomic64_sub(vis_usage, &mgr->vis_usage);
> @@ -912,7 +912,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
>   		kfree(rsv);
>   
>   	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, blocks) {
> -		drm_buddy_free_list(&mgr->mm, &rsv->allocated);
> +		drm_buddy_free_list(&mgr->mm, &rsv->allocated, 0);
>   		kfree(rsv);
>   	}
>   	if (!adev->gmc.is_app_apu)
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index f57e6d74fb0e..33ad0cfbd54c 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -57,6 +57,16 @@ static void list_insert_sorted(struct drm_buddy *mm,
>   	__list_add(&block->link, node->link.prev, &node->link);
>   }
>   
> +static void clear_reset(struct drm_buddy_block *block)
> +{
> +	block->header &= ~DRM_BUDDY_HEADER_CLEAR;
> +}
> +
> +static void mark_cleared(struct drm_buddy_block *block)
> +{
> +	block->header |= DRM_BUDDY_HEADER_CLEAR;
> +}
> +
>   static void mark_allocated(struct drm_buddy_block *block)
>   {
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
> @@ -223,6 +233,12 @@ static int split_block(struct drm_buddy *mm,
>   	mark_free(mm, block->left);
>   	mark_free(mm, block->right);
>   
> +	if (drm_buddy_block_is_clear(block)) {
> +		mark_cleared(block->left);
> +		mark_cleared(block->right);
> +		clear_reset(block);
> +	}
> +
>   	mark_split(block);
>   
>   	return 0;
> @@ -273,6 +289,13 @@ static void __drm_buddy_free(struct drm_buddy *mm,
>   		if (!drm_buddy_block_is_free(buddy))
>   			break;
>   
> +		if (drm_buddy_block_is_clear(block) !=
> +		    drm_buddy_block_is_clear(buddy))
> +			break;
> +
> +		if (drm_buddy_block_is_clear(block))
> +			mark_cleared(parent);
> +
>   		list_del(&buddy->link);
>   
>   		drm_block_free(mm, block);
> @@ -295,26 +318,61 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>   {
>   	BUG_ON(!drm_buddy_block_is_allocated(block));
>   	mm->avail += drm_buddy_block_size(mm, block);
> +	if (drm_buddy_block_is_clear(block))
> +		mm->clear_avail += drm_buddy_block_size(mm, block);
> +
>   	__drm_buddy_free(mm, block);
>   }
>   EXPORT_SYMBOL(drm_buddy_free_block);
>   
> -/**
> - * drm_buddy_free_list - free blocks
> - *
> - * @mm: DRM buddy manager
> - * @objects: input list head to free blocks
> - */
> -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects)
> +static void __drm_buddy_free_list(struct drm_buddy *mm,
> +				  struct list_head *objects,
> +				  bool mark_clear,
> +				  bool mark_dirty)
>   {
>   	struct drm_buddy_block *block, *on;
>   
> +	WARN_ON(mark_dirty && mark_clear);
> +
>   	list_for_each_entry_safe(block, on, objects, link) {
> +		if (mark_clear)
> +			mark_cleared(block);
> +		else if (mark_dirty)
> +			clear_reset(block);
>   		drm_buddy_free_block(mm, block);
>   		cond_resched();
>   	}
>   	INIT_LIST_HEAD(objects);
>   }
> +
> +static void drm_buddy_free_list_internal(struct drm_buddy *mm,
> +					 struct list_head *objects)
> +{
> +	/*
> +	 * Don't touch the clear/dirty bit, since allocation is still internal
> +	 * at this point. For example we might have just failed part of the
> +	 * allocation.
> +	 */
> +	__drm_buddy_free_list(mm, objects, false, false);
> +}
> +
> +/**
> + * drm_buddy_free_list - free blocks
> + *
> + * @mm: DRM buddy manager
> + * @objects: input list head to free blocks
> + * @flags: optional flags like DRM_BUDDY_CLEARED
> + */
> +void drm_buddy_free_list(struct drm_buddy *mm,
> +			 struct list_head *objects,
> +			 unsigned int flags)
> +{
> +	bool mark_clear = flags & DRM_BUDDY_CLEARED;
> +
> +	WARN_ON(flags & ~(DRM_BUDDY_CLEARED));
> +
> +	__drm_buddy_free_list(mm, objects, mark_clear, !mark_clear);
> +}
>   EXPORT_SYMBOL(drm_buddy_free_list);
>   
>   static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> @@ -327,10 +385,19 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>   	return s1 <= s2 && e1 >= e2;
>   }
>   
> +static bool block_incompatible(struct drm_buddy_block *block, unsigned int flags)
> +{
> +	bool needs_clear = flags & DRM_BUDDY_CLEAR_ALLOCATION;
> +
> +	return needs_clear != drm_buddy_block_is_clear(block);
> +}
> +
>   static struct drm_buddy_block *
> -alloc_range_bias(struct drm_buddy *mm,
> -		 u64 start, u64 end,
> -		 unsigned int order)
> +__alloc_range_bias(struct drm_buddy *mm,
> +		   u64 start, u64 end,
> +		   unsigned int order,
> +		   unsigned long flags,
> +		   bool fallback)
>   {
>   	struct drm_buddy_block *block;
>   	struct drm_buddy_block *buddy;
> @@ -369,6 +436,9 @@ alloc_range_bias(struct drm_buddy *mm,
>   
>   		if (contains(start, end, block_start, block_end) &&
>   		    order == drm_buddy_block_order(block)) {
> +			if (!fallback && block_incompatible(block, flags))
> +				continue;
> +
>   			/*
>   			 * Find the free block within the range.
>   			 */
> @@ -405,25 +475,52 @@ alloc_range_bias(struct drm_buddy *mm,
>   }
>   
>   static struct drm_buddy_block *
> -get_maxblock(struct drm_buddy *mm, unsigned int order)
> +__drm_buddy_alloc_range_bias(struct drm_buddy *mm,
> +			     u64 start, u64 end,
> +			     unsigned int order,
> +			     unsigned long flags)
>   {
> -	struct drm_buddy_block *max_block = NULL, *node;
> +	struct drm_buddy_block *block;
> +	bool fallback = 0;
> +
> +	block = __alloc_range_bias(mm, start, end, order,
> +				   flags, fallback);
> +	if (IS_ERR(block))
> +		return __alloc_range_bias(mm, start, end, order,
> +					  flags, !fallback);
> +
> +	return block;
> +}
> +
> +static struct drm_buddy_block *
> +get_maxblock(struct drm_buddy *mm, unsigned int order,
> +	     unsigned long flags)
> +{
> +	struct drm_buddy_block *max_block = NULL, *block = NULL;
>   	unsigned int i;
>   
>   	for (i = order; i <= mm->max_order; ++i) {
> -		if (!list_empty(&mm->free_list[i])) {
> -			node = list_last_entry(&mm->free_list[i],
> -					       struct drm_buddy_block,
> -					       link);
> -			if (!max_block) {
> -				max_block = node;
> +		struct drm_buddy_block *tmp_block;
> +
> +		list_for_each_entry_reverse(tmp_block, &mm->free_list[i], link) {
> +			if (block_incompatible(tmp_block, flags))
>   				continue;
> -			}
>   
> -			if (drm_buddy_block_offset(node) >
> -			    drm_buddy_block_offset(max_block)) {
> -				max_block = node;
> -			}
> +			block = tmp_block;
> +			break;
> +		}
> +
> +		if (!block)
> +			continue;
> +
> +		if (!max_block) {
> +			max_block = block;
> +			continue;
> +		}
> +
> +		if (drm_buddy_block_offset(block) >
> +		    drm_buddy_block_offset(max_block)) {
> +			max_block = block;
>   		}
>   	}
>   
> @@ -440,11 +537,29 @@ alloc_from_freelist(struct drm_buddy *mm,
>   	int err;
>   
>   	if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
> -		block = get_maxblock(mm, order);
> +		block = get_maxblock(mm, order, flags);
>   		if (block)
>   			/* Store the obtained block order */
>   			tmp = drm_buddy_block_order(block);
>   	} else {
> +		for (tmp = order; tmp <= mm->max_order; ++tmp) {
> +			struct drm_buddy_block *tmp_block;
> +
> +			list_for_each_entry_reverse(tmp_block, &mm->free_list[tmp], link) {
> +				if (block_incompatible(tmp_block, flags))
> +					continue;
> +
> +				block = tmp_block;
> +				break;
> +			}
> +
> +			if (block)
> +				break;
> +		}
> +	}
> +
> +	if (!block) {
> +		/* Fallback method */
>   		for (tmp = order; tmp <= mm->max_order; ++tmp) {
>   			if (!list_empty(&mm->free_list[tmp])) {
>   				block = list_last_entry(&mm->free_list[tmp],
> @@ -454,10 +569,10 @@ alloc_from_freelist(struct drm_buddy *mm,
>   					break;
>   			}
>   		}
> -	}
>   
> -	if (!block)
> -		return ERR_PTR(-ENOSPC);
> +		if (!block)
> +			return ERR_PTR(-ENOSPC);
> +	}
>   
>   	BUG_ON(!drm_buddy_block_is_free(block));
>   
> @@ -524,6 +639,8 @@ static int __alloc_range(struct drm_buddy *mm,
>   			mark_allocated(block);
>   			total_allocated += drm_buddy_block_size(mm, block);
>   			mm->avail -= drm_buddy_block_size(mm, block);
> +			if (drm_buddy_block_is_clear(block))
> +				mm->clear_avail -= drm_buddy_block_size(mm, block);
>   			list_add_tail(&block->link, &allocated);
>   			continue;
>   		}
> @@ -558,7 +675,7 @@ static int __alloc_range(struct drm_buddy *mm,
>   		list_splice_tail(&allocated, blocks);
>   		*total_allocated_on_err = total_allocated;
>   	} else {
> -		drm_buddy_free_list(mm, &allocated);
> +		drm_buddy_free_list_internal(mm, &allocated);
>   	}
>   
>   	return err;
> @@ -624,11 +741,11 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>   			list_splice(&blocks_lhs, blocks);
>   			return 0;
>   		} else if (err != -ENOSPC) {
> -			drm_buddy_free_list(mm, blocks);
> +			drm_buddy_free_list_internal(mm, blocks);
>   			return err;
>   		}
>   		/* Free blocks for the next iteration */
> -		drm_buddy_free_list(mm, blocks);
> +		drm_buddy_free_list_internal(mm, blocks);
>   	}
>   
>   	return -ENOSPC;
> @@ -684,6 +801,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   	list_del(&block->link);
>   	mark_free(mm, block);
>   	mm->avail += drm_buddy_block_size(mm, block);
> +	if (drm_buddy_block_is_clear(block))
> +		mm->clear_avail += drm_buddy_block_size(mm, block);
>   
>   	/* Prevent recursively freeing this node */
>   	parent = block->parent;
> @@ -695,6 +814,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   	if (err) {
>   		mark_allocated(block);
>   		mm->avail -= drm_buddy_block_size(mm, block);
> +		if (drm_buddy_block_is_clear(block))
> +			mm->clear_avail -= drm_buddy_block_size(mm, block);
>   		list_add(&block->link, blocks);
>   	}
>   
> @@ -782,7 +903,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   		do {
>   			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>   				/* Allocate traversing within the range */
> -				block = alloc_range_bias(mm, start, end, order);
> +				block = __drm_buddy_alloc_range_bias(mm, start, end,
> +								     order, flags);
>   			else
>   				/* Allocate from freelist */
>   				block = alloc_from_freelist(mm, order, flags);
> @@ -808,6 +930,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   
>   		mark_allocated(block);
>   		mm->avail -= drm_buddy_block_size(mm, block);
> +		if (drm_buddy_block_is_clear(block))
> +			mm->clear_avail -= drm_buddy_block_size(mm, block);
>   		kmemleak_update_trace(block);
>   		list_add_tail(&block->link, &allocated);
>   
> @@ -846,7 +970,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   	return 0;
>   
>   err_free:
> -	drm_buddy_free_list(mm, &allocated);
> +	drm_buddy_free_list_internal(mm, &allocated);
>   	return err;
>   }
>   EXPORT_SYMBOL(drm_buddy_alloc_blocks);
> @@ -879,8 +1003,8 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
>   {
>   	int order;
>   
> -	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB\n",
> -		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
> +	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB, clear_free: %lluMiB\n",
> +		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20, mm->clear_avail >> 20);
>   
>   	for (order = mm->max_order; order >= 0; order--) {
>   		struct drm_buddy_block *block;
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index 0d735d5c2b35..942345548bc3 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -126,7 +126,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	return 0;
>   
>   err_free_blocks:
> -	drm_buddy_free_list(mm, &bman_res->blocks);
> +	drm_buddy_free_list(mm, &bman_res->blocks, 0);
>   	mutex_unlock(&bman->lock);
>   err_free_res:
>   	ttm_resource_fini(man, &bman_res->base);
> @@ -141,7 +141,7 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>   
>   	mutex_lock(&bman->lock);
> -	drm_buddy_free_list(&bman->mm, &bman_res->blocks);
> +	drm_buddy_free_list(&bman->mm, &bman_res->blocks, 0);
>   	bman->visible_avail += bman_res->used_visible_size;
>   	mutex_unlock(&bman->lock);
>   
> @@ -345,7 +345,7 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev, unsigned int type)
>   	ttm_set_driver_manager(bdev, type, NULL);
>   
>   	mutex_lock(&bman->lock);
> -	drm_buddy_free_list(mm, &bman->reserved);
> +	drm_buddy_free_list(mm, &bman->reserved, 0);
>   	drm_buddy_fini(mm);
>   	bman->visible_avail += bman->visible_reserved;
>   	WARN_ON_ONCE(bman->visible_avail != bman->visible_size);
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index ea2af6bd9abe..e0860fce9ebd 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -83,7 +83,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
>   							  top, max_order);
>   	}
>   
> -	drm_buddy_free_list(&mm, &holes);
> +	drm_buddy_free_list(&mm, &holes, 0);
>   
>   	/* Nothing larger than blocks of chunk_size now available */
>   	for (order = 1; order <= max_order; order++) {
> @@ -95,7 +95,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
>   	}
>   
>   	list_splice_tail(&holes, &blocks);
> -	drm_buddy_free_list(&mm, &blocks);
> +	drm_buddy_free_list(&mm, &blocks, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> @@ -190,7 +190,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
>   
>   	list_del(&block->link);
>   	drm_buddy_free_block(&mm, block);
> -	drm_buddy_free_list(&mm, &blocks);
> +	drm_buddy_free_list(&mm, &blocks, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> @@ -236,7 +236,7 @@ static void drm_test_buddy_alloc_optimistic(struct kunit *test)
>   							   size, size, &tmp, flags),
>   						  "buddy_alloc unexpectedly succeeded, it should be full!");
>   
> -	drm_buddy_free_list(&mm, &blocks);
> +	drm_buddy_free_list(&mm, &blocks, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> @@ -271,7 +271,7 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
>   						drm_buddy_block_size(&mm, block),
>   						BIT_ULL(mm.max_order) * PAGE_SIZE);
>   
> -	drm_buddy_free_list(&mm, &allocated);
> +	drm_buddy_free_list(&mm, &allocated, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 115ec745e502..1ad678b62c4a 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -196,7 +196,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	return 0;
>   
>   error_free_blocks:
> -	drm_buddy_free_list(mm, &vres->blocks);
> +	drm_buddy_free_list(mm, &vres->blocks, 0);
>   	mutex_unlock(&mgr->lock);
>   error_fini:
>   	ttm_resource_fini(man, &vres->base);
> @@ -214,7 +214,7 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
>   	struct drm_buddy *mm = &mgr->mm;
>   
>   	mutex_lock(&mgr->lock);
> -	drm_buddy_free_list(mm, &vres->blocks);
> +	drm_buddy_free_list(mm, &vres->blocks, 0);
>   	mgr->visible_avail += vres->used_visible_size;
>   	mutex_unlock(&mgr->lock);
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index a5b39fc01003..d81c596dfa38 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -6,6 +6,7 @@
>   #ifndef __DRM_BUDDY_H__
>   #define __DRM_BUDDY_H__
>   
> +#include <linux/bitfield.h>
>   #include <linux/bitops.h>
>   #include <linux/list.h>
>   #include <linux/slab.h>
> @@ -25,15 +26,19 @@
>   #define DRM_BUDDY_RANGE_ALLOCATION		BIT(0)
>   #define DRM_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
> +#define DRM_BUDDY_CLEAR_ALLOCATION		BIT(3)
> +#define DRM_BUDDY_CLEARED			BIT(4)
>   
>   struct drm_buddy_block {
>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>   #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
> +#define DRM_BUDDY_HEADER_CLEAR  GENMASK_ULL(9, 9)
> +
>   #define   DRM_BUDDY_ALLOCATED	   (1 << 10)
>   #define   DRM_BUDDY_FREE	   (2 << 10)
>   #define   DRM_BUDDY_SPLIT	   (3 << 10)
>   /* Free to be used, if needed in the future */
> -#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
> +#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(8, 6)
>   #define DRM_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
>   	u64 header;
>   
> @@ -86,6 +91,7 @@ struct drm_buddy {
>   	u64 chunk_size;
>   	u64 size;
>   	u64 avail;
> +	u64 clear_avail;
>   };
>   
>   static inline u64
> @@ -112,6 +118,12 @@ drm_buddy_block_is_allocated(struct drm_buddy_block *block)
>   	return drm_buddy_block_state(block) == DRM_BUDDY_ALLOCATED;
>   }
>   
> +static inline bool
> +drm_buddy_block_is_clear(struct drm_buddy_block *block)
> +{
> +	return block->header & DRM_BUDDY_HEADER_CLEAR;
> +}
> +
>   static inline bool
>   drm_buddy_block_is_free(struct drm_buddy_block *block)
>   {
> @@ -150,7 +162,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   
>   void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>   
> -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects);
> +void drm_buddy_free_list(struct drm_buddy *mm,
> +			 struct list_head *objects,
> +			 unsigned int flags);
>   
>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>   void drm_buddy_block_print(struct drm_buddy *mm,

