Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA9889E97F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 07:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C0910EF88;
	Wed, 10 Apr 2024 05:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MZDbi5Ka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2129.outbound.protection.outlook.com [40.107.236.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1101010EF88
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 05:12:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELv0wzdJ2akCgGdPiHuSeEhErpLBqorQpDsjedvBOjpIzhhWIDF1HtvIbDA+qhiYAF18B+P3LB18eehKVJrB8Y8oQwGWIGLf7XZfGdH16CC8tFtH6CEe/JxZca9NLXoF3/voblp0xRDwp4unOSJ2O+Sj539veLls+RX0E5t6bmMp0RTO2EQQ2GOUW5cCdSwTjjs8LBxD2avWMTzgLYE/h47/+MHIr8ce8Im4WLwTOxX9ELEJ/O8f35RWhVDpoawwcGgzrjC9d0guWEN/YLPfome/HbZEgMihdFD+/kh2iEPiIs9insoCBRKdZleoWbdu4Y7MUjBlpJFsW9tnum+4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+6VDBpbi2yf0ENAeLh9ZYeu8RAU7emYbL3QvRxevww=;
 b=ING5D6ehPf26t5R3snWpfeZ4oDlK22DyPJ7DteVlsY6Nbe8bBJ2DznG7vpa79QyRmxAK6cpBuGynI5nm4OkmP5h5+FJU6C7G3CCJhN5Ytrw1lK3/1oVDP/zI8QPvbINfizF+yc18jfOzjTgniFrmdY/NJTf+XavOG1ZJx1vr/+jCw1la6HsyZueG1qY595LjvHUGMdkJS/uWXb87m8hFpx6AwZvl547yrvHudzJzvnCcRP6shLoKWglpTwS9DtTguvaLqJ7hikhsb9HpEuIbCY1NqChLw9mAjXzaw2qDmwtxvILnBFgJVhtBlR9uGHZ4PRSodXGClJ23hbVTvSoLNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+6VDBpbi2yf0ENAeLh9ZYeu8RAU7emYbL3QvRxevww=;
 b=MZDbi5KapzExXj+XSh4/Yo8XYMzDtOyehpJCmnGYtnJGIFgmMKybvXib4L+uZkyMYZVhA5JpejthIqywerOOFDkFE1WW9P6h1YiDt0Zr6wkP15XjRt4ETJMDJfzUNxAQD0VqCyRHGGEnOKqHztfh0wlqKGSsFAZTT4QimaNcxLo=
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by CY8PR12MB8193.namprd12.prod.outlook.com (2603:10b6:930:71::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.53; Wed, 10 Apr
 2024 05:12:37 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df%7]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 05:12:37 +0000
Message-ID: <9c3e6665-141e-09a5-52db-1158e21f85d5@amd.com>
Date: Wed, 10 Apr 2024 10:42:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 0/9] Improve test coverage of TTM
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
 <ebbf7cca-f3e3-66b5-9e35-62b839c08949@amd.com>
 <5afd352e-0f42-4969-89bc-5256ccf05bd5@intel.com>
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <5afd352e-0f42-4969-89bc-5256ccf05bd5@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0136.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::21) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|CY8PR12MB8193:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jAtAGMmoaqOIu3c45c5iv778qZtvCkOwja/lKuhId3oG0YhCfpM/dkzAT50dX6/ORgatolEYUBx4XuahSKCcScOIKXohcocpKJ9+rOotlcoTAlX/1poqr27ZhpNbAdjatvcyeX3d0IMyFd/qe0u/VfL7Kx2gmDVCM19eZEqLxBwIH+XlMifkQMNT65QWi27M3G3h4S5PY+6dZnAO1un7w3S7/SQ9P+wk9IRsk8RCAmXRIF/q2ydoXtOYvugZuLmejHVwx9pn8R0lBKfRC568R58wggxuCWvskA3LQvbpUgcei51VN6TtAihivzYeoJz1KY61jNR+bXQswJvcrJY4HSq7HNBSd4eqWqG7fnoBWDZxRtiRlxhcMDxq+lN86pq8eBwOtDfmKx1DWu2qtdcOx5/wyU3nnJsY9CVvvt/SLjfht20F633o1nviIdI5Zcva5Jv/lmXtYQZVIerpYE4ulDZmr48ogiTqcn//WRfADbVyPe0fA5dKxDSJMl4ZlheCPUU6CHsIO7ufPQBrHJoV6fZMFJKINCyAkEGTO3MqOtVmu/+9jHKhE3Rey59MusjS/84hXXktMFnDDVLY2zpg+mwoecVJE02kDGuc96gs+1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zi9CUHM5ajl2TlU4Q290ZUNhSHZDRjFFdFdueWI0K2xza1lRTkg2a2hJZTE0?=
 =?utf-8?B?bnhLRWRiZHhlVVpEYmRLbk1Sa1VtQy9xcnhsU1l1SURaUzFEcy9HejBlYTB0?=
 =?utf-8?B?N3ZFSkthcDdNWUNHcUZkZzVxZE44OHhrR0xXRlN0VnVhV1hTTUkxQ0FjcXV1?=
 =?utf-8?B?aXNmTVJxbm9xVWlyWmxRUWNuaVYyREVRdCtrNUYzQ2RWK0wzVW9aQkVNbmJk?=
 =?utf-8?B?d1hNdW81SW1DWmpQYzNwRk1jOVlWTTJUSFBhak5IbStYSGU4RGZ0YVNLS0RH?=
 =?utf-8?B?SjdhQWtsdkRZNkJDVlJCeXdUTUYzQ1ZRSVBISDZYdDRPQjZCS013czR3Vmt1?=
 =?utf-8?B?THk3OVdJVXVhekZldVBFbW15THhMQ0llS2d6ZnVjZUZEZTUyQVNOZEFnK1Jh?=
 =?utf-8?B?L3R2S0NveXo3TlNEckFtbCtJcVJRZkIxOFZLaVlPZUgwTzl4VFZONTFzdlZH?=
 =?utf-8?B?bTBiMFlXVlBsOFdJdVU4bm1IK1VjUWVUY1ZhT2VYVEJKckRBRnFQdUtJdGNT?=
 =?utf-8?B?bTBrT3B5MElBYzlFWTEvckY1NkFSOEpEVzFxQmVuQjF2UDZlQmQ0WUdxU1dm?=
 =?utf-8?B?UnUxODJWK0ZSSjNxUjdDL1dIV2tES053dUo4cHNnSWpLUnVadUptZ2VyUk9J?=
 =?utf-8?B?akIwMjZuMEVtRkQvL3YyeU9KK29YQkVQY01aeGdRSXVqSDU0RWhFYlI3TEta?=
 =?utf-8?B?aTFmUnd5S0hrdVNCMysvcStkTUxBZTBmYjVnOEV5Q245NTdRaEdMWDVYeXlQ?=
 =?utf-8?B?RVNOaE5jd3lHc29kVE5BR29ORUVndW1vNHpkM0NyL0VNRGx6SjV6WUY5bW5p?=
 =?utf-8?B?UzRUMkVoOUxrSlVkUDJrSmNsWWZnTm1uTXBSam1BaC9VWDRwSllSTEgzdjAv?=
 =?utf-8?B?cUpONUpqOURzdGkycWtKT1dPWGxXMVd4OUpQSy9lZzgvM2JudXVtVkw1YjBx?=
 =?utf-8?B?dHlzWFFoTzBLVGo0T0ZTV3BWaml2Q1FFekNBSGtCU0w3NUlDVUd2RFMwcm5w?=
 =?utf-8?B?TUE5Z3dJMGlsT2xZUGcrNk5lQk1UNndEdE5XUjVpZ3BpNG5aOFRtTlBxMkJG?=
 =?utf-8?B?QU5xSjk0V3hIZ0Q1YllKekxRS0NhMUNzQ1VpdVROblp6VHUxYm1SVGxDNjJ3?=
 =?utf-8?B?TnBmL2d6NDdJTWN2NEZ3Z0RUWFpvTTVpbGlBNmoxeTBHb3VNdm1STEMySlBY?=
 =?utf-8?B?bWdvc1JMaHU2M1BINUVtbUdWcGVXTnhxclBBZTVmSDI2a210NTBsUU9zY2ZU?=
 =?utf-8?B?OW5ZK3VKZ0lqaGF2dGxUWFZpNU52clN4VWY2QnZZZXNJbHRyRTVZSHEvWGpk?=
 =?utf-8?B?YnFydjBWclNDMVcrSDdodjUyWHVvNXBwRGREVlhJMmtRS1Z4Q3lHU0ZuS3Q5?=
 =?utf-8?B?ZXBDMWxXRldnR00yY1pxOWVoVVdheGJuaCtzejAzSmRPMFFuZVFZMTc3c0hR?=
 =?utf-8?B?MUZ0WmtOUXdiOXVtamt2SnFPNWtEREQ2SisvU2RCdngvVFJER0h4d0lsUkJB?=
 =?utf-8?B?aWZTSFFPNWhJR3FKTlBMYWIyRVQrbjZIN0NwMDVLNWFFM1MzWHJuL3NPYkI4?=
 =?utf-8?B?dHRjUFlGOXJmZjRmNGxNaE9aR1lJQ0pIRjNIRGVELzR5QVB0N3c2SjNpTml3?=
 =?utf-8?B?WG9zN1Nqb3hUZnRYYVVqek1wTDJGS3JwVHhFR09ieWtzSzNLQTg1ZFNpckJj?=
 =?utf-8?B?d3RCZXlQRUpuU0MxN2UwUm84MDc2VUo2UEdaSk1GZllXVVUrTjBHbjBKZGw5?=
 =?utf-8?B?NjU1N3BjUW5hMEUrcDFRd0tqdGFka2VKOFZWMDkyZU1oemJHd3RFT2gwOFRn?=
 =?utf-8?B?UEFVbWFsVzJSVVVzaW9CcXQwaDJZSWR3UXg5R0EvaXE3MGpFTWU3eXg5b0Mz?=
 =?utf-8?B?V1lnWHI0TnVuZFlMYWlVL3RNYmpHb25hT3RZR3R5MzA4MVRKQThSc2RsdUI2?=
 =?utf-8?B?d1JpSmdQV0VRMVk3RHZ2K3NtSVBHRk9ZbGp5cFhObkpETFFoZnhMQ1NBY3hh?=
 =?utf-8?B?NERQR040Y1MxKzNDRnNNS0lCcDFDZXo0WEJXSWx0YVN0WUlzSy81a0pIdk5p?=
 =?utf-8?B?cndLT1JGTm05RUZ6TGM1eUdMN25LdkhhU1RKSzhqUml2R29XSmNKRXQ5VXFC?=
 =?utf-8?Q?cGUUl1zXjftyFitt9xL9mxq5R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acee792f-c43c-4b50-f12e-08dc591cd66b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 05:12:37.4185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxzchFtm6yYO1KCHGJu7UpvjYL7yxBacLlLL+/HY+hDA1ykKxn3V38O7CvDktjCQQ4HRBhjMCwe9HQIIIrKeyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8193
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

With the latest pull, tests are running.

Regards,
S.Amarnath


$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
[10:39:23] ================= ttm_device (5 subtests) ==================
[10:39:23] [PASSED] ttm_device_init_basic
[10:39:23] [PASSED] ttm_device_init_multiple
[10:39:23] [PASSED] ttm_device_fini_basic
[10:39:23] [PASSED] ttm_device_init_no_vma_man
[10:39:23] ================== ttm_device_init_pools ==================
[10:39:23] [PASSED] No DMA allocations, no DMA32 required
[10:39:23] [PASSED] DMA allocations, DMA32 required
[10:39:23] [PASSED] No DMA allocations, DMA32 required
[10:39:23] [PASSED] DMA allocations, no DMA32 required
[10:39:23] ============== [PASSED] ttm_device_init_pools ==============
[10:39:23] =================== [PASSED] ttm_device ====================
[10:39:23] ================== ttm_pool (8 subtests) ===================
[10:39:23] ================== ttm_pool_alloc_basic ===================
[10:39:23] [PASSED] One page
[10:39:23] [PASSED] More than one page
[10:39:23] [PASSED] Above the allocation limit
[10:39:23] [PASSED] One page, with coherent DMA mappings enabled
[10:39:23] [PASSED] Above the allocation limit, with coherent DMA 
mappings enabled
[10:39:23] ============== [PASSED] ttm_pool_alloc_basic ===============
[10:39:23] ============== ttm_pool_alloc_basic_dma_addr ==============
[10:39:23] [PASSED] One page
[10:39:23] [PASSED] More than one page
[10:39:23] [PASSED] Above the allocation limit
[10:39:23] [PASSED] One page, with coherent DMA mappings enabled
[10:39:23] [PASSED] Above the allocation limit, with coherent DMA 
mappings enabled
[10:39:23] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[10:39:23] [PASSED] ttm_pool_alloc_order_caching_match
[10:39:23] [PASSED] ttm_pool_alloc_caching_mismatch
[10:39:23] [PASSED] ttm_pool_alloc_order_mismatch
[10:39:23] [PASSED] ttm_pool_free_dma_alloc
[10:39:23] [PASSED] ttm_pool_free_no_dma_alloc
[10:39:23] [PASSED] ttm_pool_fini_basic
[10:39:23] ==================== [PASSED] ttm_pool =====================
[10:39:23] ================ ttm_resource (8 subtests) =================
[10:39:23] ================= ttm_resource_init_basic =================
[10:39:23] [PASSED] Init resource in TTM_PL_SYSTEM
[10:39:23] [PASSED] Init resource in TTM_PL_VRAM
[10:39:23] [PASSED] Init resource in a private placement
[10:39:23] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[10:39:23] ============= [PASSED] ttm_resource_init_basic =============
[10:39:23] [PASSED] ttm_resource_init_pinned
[10:39:23] [PASSED] ttm_resource_fini_basic
[10:39:23] [PASSED] ttm_resource_manager_init_basic
[10:39:23] [PASSED] ttm_resource_manager_usage_basic
[10:39:23] [PASSED] ttm_resource_manager_set_used_basic
[10:39:23] [PASSED] ttm_sys_man_alloc_basic
[10:39:23] [PASSED] ttm_sys_man_free_basic
[10:39:23] ================== [PASSED] ttm_resource ===================
[10:39:23] =================== ttm_tt (15 subtests) ===================
[10:39:23] ==================== ttm_tt_init_basic ====================
[10:39:23] [PASSED] Page-aligned size
[10:39:23] [PASSED] Extra pages requested
[10:39:23] ================ [PASSED] ttm_tt_init_basic ================
[10:39:23] [PASSED] ttm_tt_init_misaligned
[10:39:23] [PASSED] ttm_tt_fini_basic
[10:39:23] [PASSED] ttm_tt_fini_sg
[10:39:23] [PASSED] ttm_tt_fini_shmem
[10:39:23] [PASSED] ttm_tt_create_basic
[10:39:23] [PASSED] ttm_tt_create_invalid_bo_type
[10:39:23] [PASSED] ttm_tt_create_ttm_exists
[10:39:23] [PASSED] ttm_tt_create_failed
[10:39:23] [PASSED] ttm_tt_destroy_basic
[10:39:23] [PASSED] ttm_tt_populate_null_ttm
[10:39:23] [PASSED] ttm_tt_populate_populated_ttm
[10:39:23] [PASSED] ttm_tt_unpopulate_basic
[10:39:23] [PASSED] ttm_tt_unpopulate_empty_ttm
[10:39:23] [PASSED] ttm_tt_swapin_basic
[10:39:23] ===================== [PASSED] ttm_tt ======================
[10:39:23] =================== ttm_bo (14 subtests) ===================
[10:39:23] =========== ttm_bo_reserve_optimistic_no_ticket ===========
[10:39:23] [PASSED] Cannot be interrupted and sleeps
[10:39:23] [PASSED] Cannot be interrupted, locks straight away
[10:39:23] [PASSED] Can be interrupted, sleeps
[10:39:23] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[10:39:23] [PASSED] ttm_bo_reserve_locked_no_sleep
[10:39:23] [PASSED] ttm_bo_reserve_no_wait_ticket
[10:39:24] [PASSED] ttm_bo_reserve_double_resv
[10:39:24] [PASSED] ttm_bo_reserve_interrupted
[10:39:24] [PASSED] ttm_bo_reserve_deadlock
[10:39:24] [PASSED] ttm_bo_unreserve_basic
[10:39:24] [PASSED] ttm_bo_unreserve_pinned
[10:39:24] [PASSED] ttm_bo_unreserve_bulk
[10:39:24] [PASSED] ttm_bo_put_basic
[10:39:24] [PASSED] ttm_bo_put_shared_resv
[10:39:24] [PASSED] ttm_bo_pin_basic
[10:39:24] [PASSED] ttm_bo_pin_unpin_resource
[10:39:24] [PASSED] ttm_bo_multiple_pin_one_unpin
[10:39:24] ===================== [PASSED] ttm_bo ======================
[10:39:24] ============== ttm_bo_validate (22 subtests) ===============
[10:39:24] ============== ttm_bo_init_reserved_sys_man ===============
[10:39:24] [PASSED] Buffer object for userspace
[10:39:24] [PASSED] Kernel buffer object
[10:39:24] [PASSED] Shared buffer object
[10:39:24] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[10:39:24] ============== ttm_bo_init_reserved_mock_man ==============
[10:39:24] [PASSED] Buffer object for userspace
[10:39:24] [PASSED] Kernel buffer object
[10:39:24] [PASSED] Shared buffer object
[10:39:24] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[10:39:24] [PASSED] ttm_bo_init_reserved_resv
[10:39:24] ================== ttm_bo_validate_basic ==================
[10:39:24] [PASSED] Buffer object for userspace
[10:39:24] [PASSED] Kernel buffer object
[10:39:24] [PASSED] Shared buffer object
[10:39:24] ============== [PASSED] ttm_bo_validate_basic ==============
[10:39:24] [PASSED] ttm_bo_validate_invalid_placement
[10:39:24] ============= ttm_bo_validate_same_placement ==============
[10:39:24] [PASSED] System manager
[10:39:24] [PASSED] VRAM manager
[10:39:24] ========= [PASSED] ttm_bo_validate_same_placement ==========
[10:39:24] [PASSED] ttm_bo_validate_failed_alloc
[10:39:24] [PASSED] ttm_bo_validate_pinned
[10:39:24] [PASSED] ttm_bo_validate_busy_placement
[10:39:24] ================ ttm_bo_validate_multihop =================
[10:39:24] [PASSED] Buffer object for userspace
[10:39:24] [PASSED] Kernel buffer object
[10:39:24] [PASSED] Shared buffer object
[10:39:24] ============ [PASSED] ttm_bo_validate_multihop =============
[10:39:24] ========== ttm_bo_validate_no_placement_signaled ==========
[10:39:24] [PASSED] Buffer object in system domain, no page vector
[10:39:24] [PASSED] Buffer object in system domain with an existing page 
vector
[10:39:24] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[10:39:24] ======== ttm_bo_validate_no_placement_not_signaled ========
[10:39:24] [PASSED] Buffer object for userspace
[10:39:24] [PASSED] Kernel buffer object
[10:39:24] [PASSED] Shared buffer object
[10:39:24] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[10:39:24] [PASSED] ttm_bo_validate_move_fence_signaled
[10:39:24] ========= ttm_bo_validate_move_fence_not_signaled =========
[10:39:24] [PASSED] Waits for GPU
[10:39:24] [PASSED] Tries to lock straight away
[10:39:24] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[10:39:24] [PASSED] ttm_bo_validate_swapout
[10:39:24] [PASSED] ttm_bo_validate_happy_evict
[10:39:24] [PASSED] ttm_bo_validate_all_pinned_evict
[10:39:24] [PASSED] ttm_bo_validate_allowed_only_evict
[10:39:24] [PASSED] ttm_bo_validate_deleted_evict
[10:39:24] [PASSED] ttm_bo_validate_busy_domain_evict
[10:39:24] [PASSED] ttm_bo_validate_evict_gutting
[10:39:24] [PASSED] ttm_bo_validate_recrusive_evict
[10:39:24] ================= [PASSED] ttm_bo_validate =================
[10:39:24] ============================================================
[10:39:24] Testing complete. Ran 102 tests: passed: 102
[10:39:24] Elapsed time: 25.090s total, 0.001s configuring, 24.520s 
building, 0.443s running

On 4/3/2024 1:47 PM, Karolina Stolarek wrote:
>
> Hi Amaranath,
>
> Thanks for checking this.
>
> On 2.04.2024 15:35, Somalapuram, Amaranath wrote:
>
>> /usr/bin/ld: 
>> drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0xa0): undefined 
>> reference to `drm_atomic_helper_crtc_reset'
>> /usr/bin/ld: 
>> drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0xf0): undefined 
>> reference to `drm_atomic_helper_crtc_duplicate_state'
>> /usr/bin/ld: 
>> drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0xf8): undefined 
>> reference to `drm_atomic_helper_crtc_destroy_state'
>> /usr/bin/ld: 
>> drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0x1f8): undefined 
>> reference to `drm_atomic_helper_plane_reset'
>> /usr/bin/ld: 
>> drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0x208): undefined 
>> reference to `drm_atomic_helper_plane_duplicate_state'
>> /usr/bin/ld: 
>> drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0x210): undefined 
>> reference to `drm_atomic_helper_plane_destroy_state'
>> /usr/bin/ld: 
>> drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0x300): undefined 
>> reference to `drm_atomic_helper_check'
>> /usr/bin/ld: 
>> drivers/gpu/drm/tests/drm_kunit_helpers.o:(.rodata+0x308): undefined 
>> reference to `drm_atomic_helper_commit'
>> /usr/bin/ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in 
>> function `drm_dp_mst_duplicate_state':
>> drm_dp_mst_topology.c:(.text+0x3164): undefined reference to 
>> `__drm_atomic_helper_private_obj_duplicate_state'
>> /usr/bin/ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in 
>> function `drm_dp_delayed_destroy_work':
>> drm_dp_mst_topology.c:(.text+0x39d6): undefined reference to 
>> `drm_kms_helper_hotplug_event'
>> /usr/bin/ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in 
>> function `drm_dp_mst_up_req_work':
>> drm_dp_mst_topology.c:(.text+0x930d): undefined reference to 
>> `drm_kms_helper_hotplug_event'
>> /usr/bin/ld: drivers/gpu/drm/display/drm_dp_mst_topology.o: in 
>> function `drm_dp_mst_link_probe_work':
>> drm_dp_mst_topology.c:(.text+0xacda): undefined reference to 
>> `drm_kms_helper_hotplug_event'
>> collect2: error: ld returned 1 exit status
>> make[3]: *** [../scripts/Makefile.vmlinux:37: vmlinux] Error 1
>> make[2]: *** [/home/rtg/amar/git/drm-misc/Makefile:1162: vmlinux] 
>> Error 2
>> make[1]: *** [/home/rtg/amar/git/drm-misc/Makefile:240: __sub-make] 
>> Error 2
>> make: *** [Makefile:240: __sub-make] Error 2
>>
>> rtg@rtg-prash-navi22:~/amar/git/drm-misc$
> These linker errors were fixed in a patch[1] merged to
> drm-misc-next-fixes and it took some time to propagate it back back to
> drm-misc-next. It looks like it went back in on March 31st, which is
> after commit 4c4f33be7e4d (dated March 25th, if I'm not mistaken). I
> checked the series on the drm-misc-next with head commit 45c734fdd43d
> and it passes (omitted UML warnings in the listing to improve 
> readability):
>
> $ [drm-misc-next] ./tools/testing/kunit/kunit.py run 
> --kunitconfig=drivers/gpu/drm/ttm/tests
> [10:11:06] Configuring KUnit Kernel ...
> [10:11:06] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=um O=.kunit olddefconfig
> Building with:
> $ make ARCH=um O=.kunit --jobs=8
> [10:11:55] Starting KUnit Kernel (1/1)...
> [10:11:55] ============================================================
> Running tests with:
> $ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
> [10:11:55] ================= ttm_device (5 subtests) ==================
> [10:11:55] [PASSED] ttm_device_init_basic
> [10:11:55] [PASSED] ttm_device_init_multiple
> [10:11:55] [PASSED] ttm_device_fini_basic
> [10:11:55] [PASSED] ttm_device_init_no_vma_man
> [10:11:55] ================== ttm_device_init_pools ==================
> [10:11:55] [PASSED] No DMA allocations, no DMA32 required
> [10:11:55] [PASSED] DMA allocations, DMA32 required
> [10:11:55] [PASSED] No DMA allocations, DMA32 required
> [10:11:55] [PASSED] DMA allocations, no DMA32 required
> [10:11:55] ============== [PASSED] ttm_device_init_pools ==============
> [10:11:55] =================== [PASSED] ttm_device ====================
> [10:11:55] ================== ttm_pool (8 subtests) ===================
> [10:11:55] ================== ttm_pool_alloc_basic ===================
> [10:11:55] [PASSED] One page
> [10:11:55] [PASSED] More than one page
> [10:11:55] [PASSED] Above the allocation limit
> [10:11:55] [PASSED] One page, with coherent DMA mappings enabled
> [10:11:55] [PASSED] Above the allocation limit, with coherent DMA 
> mappings enabled
> [10:11:55] ============== [PASSED] ttm_pool_alloc_basic ===============
> [10:11:55] ============== ttm_pool_alloc_basic_dma_addr ==============
> [10:11:55] [PASSED] One page
> [10:11:55] [PASSED] More than one page
> [10:11:55] [PASSED] Above the allocation limit
> [10:11:55] [PASSED] One page, with coherent DMA mappings enabled
> [10:11:55] [PASSED] Above the allocation limit, with coherent DMA 
> mappings enabled
> [10:11:55] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
> [10:11:55] [PASSED] ttm_pool_alloc_order_caching_match
> [10:11:55] [PASSED] ttm_pool_alloc_caching_mismatch
> [10:11:55] [PASSED] ttm_pool_alloc_order_mismatch
> [10:11:55] [PASSED] ttm_pool_free_dma_alloc
> [10:11:55] [PASSED] ttm_pool_free_no_dma_alloc
> [10:11:55] [PASSED] ttm_pool_fini_basic
> [10:11:55] ==================== [PASSED] ttm_pool =====================
> [10:11:55] ================ ttm_resource (8 subtests) =================
> [10:11:55] ================= ttm_resource_init_basic =================
> [10:11:55] [PASSED] Init resource in TTM_PL_SYSTEM
> [10:11:55] [PASSED] Init resource in TTM_PL_VRAM
> [10:11:55] [PASSED] Init resource in a private placement
> [10:11:55] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
> [10:11:55] ============= [PASSED] ttm_resource_init_basic =============
> [10:11:55] [PASSED] ttm_resource_init_pinned
> [10:11:55] [PASSED] ttm_resource_fini_basic
> [10:11:55] [PASSED] ttm_resource_manager_init_basic
> [10:11:55] [PASSED] ttm_resource_manager_usage_basic
> [10:11:55] [PASSED] ttm_resource_manager_set_used_basic
> [10:11:55] [PASSED] ttm_sys_man_alloc_basic
> [10:11:55] [PASSED] ttm_sys_man_free_basic
> [10:11:55] ================== [PASSED] ttm_resource ===================
> [10:11:55] =================== ttm_tt (15 subtests) ===================
> [10:11:55] ==================== ttm_tt_init_basic ====================
> [10:11:55] [PASSED] Page-aligned size
> [10:11:55] [PASSED] Extra pages requested
> [10:11:55] ================ [PASSED] ttm_tt_init_basic ================
> [10:11:55] [PASSED] ttm_tt_init_misaligned
> [10:11:55] [PASSED] ttm_tt_fini_basic
> [10:11:55] [PASSED] ttm_tt_fini_sg
> [10:11:55] [PASSED] ttm_tt_fini_shmem
> [10:11:55] [PASSED] ttm_tt_create_basic
> [10:11:55] [PASSED] ttm_tt_create_invalid_bo_type
> [10:11:55] [PASSED] ttm_tt_create_ttm_exists
> [10:11:55] [PASSED] ttm_tt_create_failed
> [10:11:55] [PASSED] ttm_tt_destroy_basic
> [10:11:55] [PASSED] ttm_tt_populate_null_ttm
> [10:11:55] [PASSED] ttm_tt_populate_populated_ttm
> [10:11:55] [PASSED] ttm_tt_unpopulate_basic
> [10:11:55] [PASSED] ttm_tt_unpopulate_empty_ttm
> [10:11:55] [PASSED] ttm_tt_swapin_basic
> [10:11:55] ===================== [PASSED] ttm_tt ======================
> [10:11:55] =================== ttm_bo (14 subtests) ===================
> [10:11:55] =========== ttm_bo_reserve_optimistic_no_ticket ===========
> [10:11:55] [PASSED] Cannot be interrupted and sleeps
> [10:11:55] [PASSED] Cannot be interrupted, locks straight away
> [10:11:55] [PASSED] Can be interrupted, sleeps
> [10:11:55] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
> [10:11:55] [PASSED] ttm_bo_reserve_locked_no_sleep
> [10:11:55] [PASSED] ttm_bo_reserve_no_wait_ticket
> [10:11:55] [PASSED] ttm_bo_reserve_double_resv
> [10:11:55] [PASSED] ttm_bo_reserve_interrupted
> [10:11:55] [PASSED] ttm_bo_reserve_deadlock
> [10:11:55] [PASSED] ttm_bo_unreserve_basic
> [10:11:55] [PASSED] ttm_bo_unreserve_pinned
> [10:11:55] [PASSED] ttm_bo_unreserve_bulk
> [10:11:55] [PASSED] ttm_bo_put_basic
> [10:11:55] [PASSED] ttm_bo_put_shared_resv
> [10:11:55] [PASSED] ttm_bo_pin_basic
> [10:11:55] [PASSED] ttm_bo_pin_unpin_resource
> [10:11:55] [PASSED] ttm_bo_multiple_pin_one_unpin
> [10:11:55] ===================== [PASSED] ttm_bo ======================
> [10:11:55] ============== ttm_bo_validate (22 subtests) ===============
> [10:11:55] ============== ttm_bo_init_reserved_sys_man ===============
> [10:11:55] [PASSED] Buffer object for userspace
> [10:11:55] [PASSED] Kernel buffer object
> [10:11:55] [PASSED] Shared buffer object
> [10:11:55] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
> [10:11:55] ============== ttm_bo_init_reserved_mock_man ==============
> [10:11:55] [PASSED] Buffer object for userspace
> [10:11:55] [PASSED] Kernel buffer object
> [10:11:55] [PASSED] Shared buffer object
> [10:11:55] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
> [10:11:55] [PASSED] ttm_bo_init_reserved_resv
> [10:11:55] ================== ttm_bo_validate_basic ==================
> [10:11:55] [PASSED] Buffer object for userspace
> [10:11:55] [PASSED] Kernel buffer object
> [10:11:55] [PASSED] Shared buffer object
> [10:11:55] ============== [PASSED] ttm_bo_validate_basic ==============
> [10:11:55] [PASSED] ttm_bo_validate_invalid_placement
> [10:11:55] ============= ttm_bo_validate_same_placement ==============
> [10:11:55] [PASSED] System manager
> [10:11:55] [PASSED] VRAM manager
> [10:11:55] ========= [PASSED] ttm_bo_validate_same_placement ==========
> [10:11:55] [PASSED] ttm_bo_validate_failed_alloc
> [10:11:55] [PASSED] ttm_bo_validate_pinned
> [10:11:55] [PASSED] ttm_bo_validate_busy_placement
> [10:11:55] ================ ttm_bo_validate_multihop =================
> [10:11:55] [PASSED] Buffer object for userspace
> [10:11:55] [PASSED] Kernel buffer object
> [10:11:55] [PASSED] Shared buffer object
> [10:11:55] ============ [PASSED] ttm_bo_validate_multihop =============
> [10:11:55] ========== ttm_bo_validate_no_placement_signaled ==========
> [10:11:55] [PASSED] Buffer object in system domain, no page vector
> [10:11:55] [PASSED] Buffer object in system domain with an existing 
> page vector
> [10:11:55] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
> [10:11:55] ======== ttm_bo_validate_no_placement_not_signaled ========
> [10:11:55] [PASSED] Buffer object for userspace
> [10:11:55] [PASSED] Kernel buffer object
> [10:11:55] [PASSED] Shared buffer object
> [10:11:55] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
> [10:11:55] [PASSED] ttm_bo_validate_move_fence_signaled
> [10:11:55] ========= ttm_bo_validate_move_fence_not_signaled =========
> [10:11:55] [PASSED] Waits for GPU
> [10:11:55] [PASSED] Tries to lock straight away
> [10:11:55] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
> [10:11:55] [PASSED] ttm_bo_validate_swapout
> [10:11:55] [PASSED] ttm_bo_validate_happy_evict
> [10:11:55] [PASSED] ttm_bo_validate_all_pinned_evict
> [10:11:55] [PASSED] ttm_bo_validate_allowed_only_evict
> [10:11:55] [PASSED] ttm_bo_validate_deleted_evict
> [10:11:55] [PASSED] ttm_bo_validate_busy_domain_evict
> [10:11:55] [PASSED] ttm_bo_validate_evict_gutting
> [10:11:55] [PASSED] ttm_bo_validate_recrusive_evict
> [10:11:55] ================= [PASSED] ttm_bo_validate =================
> [10:11:55] ============================================================
> [10:11:55] Testing complete. Ran 102 tests: passed: 102
> [10:11:55] Elapsed time: 49.333s total, 0.002s configuring, 48.814s 
> building, 0.417s running
>
> All the best,
> Karolina
>
> --------------
> [1] - https://patchwork.freedesktop.org/series/131077/
