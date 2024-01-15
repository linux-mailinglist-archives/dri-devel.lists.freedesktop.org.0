Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F190982D8A3
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 12:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7220D10E287;
	Mon, 15 Jan 2024 11:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6C910E277
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 11:56:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmxJ//gth2xFFpXpxRnyt351Kd1Q8Jk3kmqdgSiBfPw2Q32NZ3DOR5IlLW6QolwVR9uCNF0EpFrWlXQUTyXmD1WENQ5j3M+X9HdsguXT1rxu5k2O0uR19JMcKcDt2F7Kmr6tlttqfpHEJTbug4hHz1JYj43ssg7E/BBGT5QViF3b5uvUcgG6fE6aX8CXVM3/kOEv8Gpz55DahSe2R2blZ0nRF8zKv4xruyVFH+dMfD1z3+S5L1FAA/9IAPFsuRVn93Abzm3tQHrLBTMpR7hXp9iwrqiy3VkvJW26Fpl5dEoQCt13YL2gP0XBqt1GdEKNjjsJE74w9NyeSG4V/ccmcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9RgzCkg+HxpxvLfKcyml2Hx9q6bWEgDCE0yHOepCfs=;
 b=kWFekhFyJnvJ6KufXFWJAdTuYyxcATYZuVsHyb7AoxQwxWAB60un56+1m3S1+Nv8He35z5J5JBbMLv1qAR6XbPAau7e+QBK2JYeryfVOwGJ9etaE9lFl1rm12vjfQEwPqPcidKoxGpu+mmndeFZWzVeYsxHIPwdDoYmwzur2FTTlCSL7GTYJBitMoRXUay7oYq6fRwlHS5bf4FYB4W7i356SsD6yptyxk4mwM7XT0VSlMadvbT1clTn63HxTJgW8gWAw3sVAsw8gntNMNPJFm29oBTmQqkY7R87+zNJnfGq80BSNFPGvYpWDBJxp92zV6Zp6N+pbNL/2cxRqy5xW3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9RgzCkg+HxpxvLfKcyml2Hx9q6bWEgDCE0yHOepCfs=;
 b=q1b7YQ6/R4QkRudH8y/HatvCM2WBu6+joIRqp+1RqLqLfK1ToLTe3tROc0TtYY4RiyD2KSDln3D7ad663HODexURlD8JYXcXaiFLE0XcFApRDbCEMkQLDIhOfIFVSxRz/ARZbu1UM7T8Rs7zZSaYfWA4kKRwNDuGS5poMcOYyqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by MN2PR12MB4317.namprd12.prod.outlook.com (2603:10b6:208:1d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 11:56:47 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::3065:a182:8c3:11c9]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::3065:a182:8c3:11c9%7]) with mapi id 15.20.7181.022; Mon, 15 Jan 2024
 11:56:47 +0000
Message-ID: <b306703d-65aa-ed06-98a4-3610918f9d9f@amd.com>
Date: Mon, 15 Jan 2024 17:26:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH RESEND v9 1/8] drm/ttm/tests: Fix argument in
 ttm_tt_kunit_init()
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1704959786.git.karolina.stolarek@intel.com>
 <db34f34a039cf951c5933e8ae046b4ed72d20dcb.1704959786.git.karolina.stolarek@intel.com>
 <c0cf8ae9-7915-4102-97a2-2159ac6b69d1@amd.com>
Content-Language: en-US
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <c0cf8ae9-7915-4102-97a2-2159ac6b69d1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0126.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::16) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|MN2PR12MB4317:EE_
X-MS-Office365-Filtering-Correlation-Id: 5092429c-c30f-47a4-3e64-08dc15c10c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dgxXR+7auVNhiwPVXUuZ6bmzPNrJQMOT+lutumaRI0rsYGwGygon0zkLPETi73C2PfBu+SC89Yaw1YvjVkQb4cdAY4ywIgtp8LHxJdo4b+Z6su6XyHMgJEUaGElwpMt0VuWNSA8QjhoAhlQj4HgAyNVKJLwQxTYbE/U3nrT4BhwkDBXK4HVun0XlKUJ6LNY/besNc+cGocDJRqw5gItcpB/rZNZTsDYEMfGhm3b6eCbZLDQYLy9R8QSqPJZ9ZV6sM8NSQQEtpyffgr2lwPOwCf07yyGC43edHh8Vbmx5emgajrFCK5tg/aXKIQwTsZ05UgjMAQYqNvg/lpWu52bAGIKmk3GQYq5D9L+mUUxmAEMs6PU6OlVZJROkJCYv7rjX74CX2QBKvEkvtI1q0ro8saEadykD6hsRGvA+4YUFgq4q/Y37Rkfkvo4uqSbuoF3W9XWuGG/tzXYeHqChNLaj/0NuhsBzawG44jgLwtVEbfVYvPARlMiKHnNGlPojfDTCcF8zCt9axk74UV1WhhNVOZMWQN2NF67ig6iaxHzE4CrEGwnLW871YsM+FNgxB3OvCpLq4MKGvXOZa+sgQtXs3W6RZZ0HsJh56EcRgH5Rze5q69gcU0iaTG7VNs5veRzzMPxKJ2ia1v4yrSYhqSuP/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(366004)(396003)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(5660300002)(30864003)(2906002)(8936002)(4326008)(8676002)(53546011)(6512007)(6666004)(54906003)(316002)(110136005)(66476007)(66556008)(66946007)(6506007)(6486002)(41300700001)(478600001)(31696002)(31686004)(36756003)(38100700002)(26005)(2616005)(66574015)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L244UU9ueUU4M3lJSERudWptWmdhQjFxVTJBaVBnUVpiZWw0T29Eemo1QkZX?=
 =?utf-8?B?Mkx6T00yVGFIRCtwS3hLVUZoVFpmaDNNaldoRFVlRmlNOEoyaWtHaEVna00w?=
 =?utf-8?B?M2hNRU9QZzlUVWsvSVpUelBsUHE4ZzU4NmdFM1BQWGwzYkg3b0F5ZUh1Tysw?=
 =?utf-8?B?dUlDb2RNQTBEWjFLKzhUQTJKekEwZTlLcVFGT2xpWk9lZUd0cU9tTTNQTVJB?=
 =?utf-8?B?NGxFQlNXemxaUkxvcGxxV3RQMEhWeGptbzlpWUFKcWE2SHh2bWZBUU9sNlpG?=
 =?utf-8?B?QWRzSGdiTzZXaWRoazlwdXc2Wlk2M3ZjMzc1cEI0Qnp6ekxrT3ptT0VlVVBh?=
 =?utf-8?B?MEp5SFlTQU9ibHBxSXhvU0FoajV3Wlo2Tjc3QVBJaGtlL1lub29sZlZmbyt2?=
 =?utf-8?B?UnBOR2tFQTFYSVhNajVjcWtjY3Y3dTZCdkUrL1ZvSTBmUThoZXNQWTlxYkNE?=
 =?utf-8?B?MERhLytlbkJYdDYxdEp4RHlrRlB6N1EyVStycnAwMk9MZnFKN1BLTU5RdVZh?=
 =?utf-8?B?Nk5reXhSVGJtWVZJYjZrRkFDc0JQOEx0c1JuV2tOWVB2Q0t4YWhTM2JUTmtM?=
 =?utf-8?B?RU0yaCtsV0cxZ1F4bFdxVnJodGdsdmxEZUpFQ1lrdEUvV0lickhqcTd5Q0FQ?=
 =?utf-8?B?cEY5RGtYSldXNzZxSGV6UW5KRDVxMEgzWkxEU1gxZUpRWEM3dGo1ZUdHWWVN?=
 =?utf-8?B?UERKRENOZ2ZRM2tqUGV6RlFTNWhuTVZ5bEVEN09WT1QwRldEUGVobmxUV3V3?=
 =?utf-8?B?RDlONis4WHRiejFvUTRlWncveVViSklTSCthOGplUVhzU3JmVWJQUzg2UzBQ?=
 =?utf-8?B?bGNIMm5WY2RrQTJGbXFUSkZTMllySWwyRGVGSmJEYTFUY0NuZHI4V1NWOUto?=
 =?utf-8?B?Zm1zZVo4OHFPMGZ2STBvcC9mdDJiUFJPN0hYOVplcldHTDBsaC9uNDQzVGUw?=
 =?utf-8?B?anBFUHVLb2dQRThDeDR3TTBxdi9WLzRDMzdWeURWVlAyQlBndUZtQklEN1Nt?=
 =?utf-8?B?c0RmOUVmZXExbm0wVEowYTByNDF2UFVWYXIxcHJ3L1R5TFhSZE1wT2FpakNR?=
 =?utf-8?B?K1RjZ2xNYUU0cmFBeU5Idy9WOVFvdEp0Zlkvc3A5NFJRR0s3YkFHV2tGWDBS?=
 =?utf-8?B?czVSNHRLckRGUThhbURPWXI0eEtSTHR5S0k0eUYzQW90UDVvYXk1TjZnRDRM?=
 =?utf-8?B?YzZmSit5VWxrNVlqS3BGTEhSYUllbUMrckFBZnZ4Wm5pR1pNVkJLYkk4TFl1?=
 =?utf-8?B?dkFOR1hkQXIweElWYjdIYjQvdGc2cDZKYTc1L2x4R1VxbkoyYldXU0xuMWlW?=
 =?utf-8?B?Z0JIdWttU042cE1HWTdvOXNnMURhVlNHQ1NaTjMyaG55Y1h6d01mOWx0Q200?=
 =?utf-8?B?azQzLzVLY2ExeGlMK2ZMNUMyS2VEZW5DaGFVQmFaNVVMaUZNYzdxSTJYK3hT?=
 =?utf-8?B?T0JDUytET0gzeUNxa2ZNa21nSWw4aVJuckxZVmptZlN1T3pJczhaQlVXZUts?=
 =?utf-8?B?RjdraC9MK0h2TmtPVFRGQVd4b25hOXcyNWFTck8zK09sSjVITkZWdm92ZWMv?=
 =?utf-8?B?eWJBZ1ExNnArTkdyaEVFdkZqSm9lVmxFamlUang4dzJnOXNEUUNRZE9Dcjc5?=
 =?utf-8?B?MDlRTk04SGJkbWJCUzNQZzEyWVZPU1BOVjZJSjF5cHgrZ2xjcXVCL1A5NE5G?=
 =?utf-8?B?UDduZGw2djBZaWVPcDd3MEJDclA3cmJWMlFxSzJkVzd1b0pGRGVvV3JqRmR4?=
 =?utf-8?B?cE54N3pxa3RFNnZUemN2eEpYWXhMdTJ6MlVtWG9QaGxhZDBHSFgrd1pCc25E?=
 =?utf-8?B?Y1E0eHdRUWNsUFBHVEljS1ZaZWl4NXp2bm5GbDE5WHVGNXJTazJPQVVzdE9N?=
 =?utf-8?B?ZlFEdkQzZzFYeEVINnFXbUZPRFZ1cHpRbjNkSnB0RjZrME5xZEptbWgzZVIv?=
 =?utf-8?B?ZDZsRm5ZTi80NitnaXdmU0RWZzZoVmVoN05RRU5qN01XVFZLUktEUHRSZ0to?=
 =?utf-8?B?NGt2WEcvZHJGbVIvVXVLeU5wMitLckJzbk1OWjhDYmozSDJ5dUhScDNDN2dp?=
 =?utf-8?B?aUw4a1ZGYkk0OU0weHVvSnFhNVIxV3BIZUdPZEMzdGdYRXR3c2xsRXp0dktM?=
 =?utf-8?Q?6IdoK9ZZw7RLkeCVdSuoLSdua?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5092429c-c30f-47a4-3e64-08dc15c10c9c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 11:56:46.8719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvBNA5w9DPToZzq5lCN0yM2iFk3Wok5+qVjlYFO/SFgXoZ7e2Y3FAxtpUoLT0tpeqXb9I2tdRbhwO8TcqFRpHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4317
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
Cc: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=c4=85tkowski?= <dominik.karol.piatkowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/11/2024 8:29 PM, Christian König wrote:
> I've gone ahead and pushed this one to drm-misc-next.
>
> Going to take a look at the rest as well.
>
> @Amar could you run another test round with those? And maybe ping 
> Kenny if we can integrate them into the CI.
>
> Thanks,
> Christian.
>
Look's good:

Regards,
S.Amarnath

rtg@rtg-Artic:~/amar/git/drm-misc$ ./tools/testing/kunit/kunit.py run 
--kunitconfig=drivers/gpu/drm/ttm/tests
[17:21:52] Configuring KUnit Kernel ...
Regenerating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[17:21:55] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=16
[17:22:23] Starting KUnit Kernel (1/1)...
[17:22:23] ============================================================
[17:22:23] ======================= ttm_device ========================
[17:22:23] [PASSED] ttm_device_init_basic
[17:22:23] [PASSED] ttm_device_init_multiple
[17:22:23] [PASSED] ttm_device_fini_basic
[17:22:23] [PASSED] ttm_device_init_no_vma_man
[17:22:23] ================== ttm_device_init_pools ==================
[17:22:23] [PASSED] No DMA allocations, no DMA32 required
[17:22:23] [PASSED] DMA allocations, DMA32 required
[17:22:23] [PASSED] No DMA allocations, DMA32 required
[17:22:23] [PASSED] DMA allocations, no DMA32 required
[17:22:23] ============== [PASSED] ttm_device_init_pools ==============
[17:22:23] =================== [PASSED] ttm_device ====================
[17:22:23] ======================== ttm_pool =========================
[17:22:23] ================== ttm_pool_alloc_basic ===================
[17:22:23] [PASSED] One page
[17:22:23] [PASSED] More than one page
[17:22:23] [PASSED] Above the allocation limit
[17:22:23] [PASSED] One page, with coherent DMA mappings enabled
[17:22:23] [PASSED] Above the allocation limit, with coherent DMA 
mappings enabled
[17:22:23] ============== [PASSED] ttm_pool_alloc_basic ===============
[17:22:23] ============== ttm_pool_alloc_basic_dma_addr ==============
[17:22:23] [PASSED] One page
[17:22:23] [PASSED] More than one page
[17:22:23] [PASSED] Above the allocation limit
[17:22:23] [PASSED] One page, with coherent DMA mappings enabled
[17:22:23] [PASSED] Above the allocation limit, with coherent DMA 
mappings enabled
[17:22:23] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[17:22:23] [PASSED] ttm_pool_alloc_order_caching_match
[17:22:23] [PASSED] ttm_pool_alloc_caching_mismatch
[17:22:23] [PASSED] ttm_pool_alloc_order_mismatch
[17:22:23] [PASSED] ttm_pool_free_dma_alloc
[17:22:23] [PASSED] ttm_pool_free_no_dma_alloc
[17:22:23] [PASSED] ttm_pool_fini_basic
[17:22:23] ==================== [PASSED] ttm_pool =====================
[17:22:23] ====================== ttm_resource =======================
[17:22:23] ================= ttm_resource_init_basic =================
[17:22:23] [PASSED] Init resource in TTM_PL_SYSTEM
[17:22:23] [PASSED] Init resource in TTM_PL_VRAM
[17:22:23] [PASSED] Init resource in a private placement
[17:22:23] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[17:22:23] ============= [PASSED] ttm_resource_init_basic =============
[17:22:23] [PASSED] ttm_resource_init_pinned
[17:22:23] [PASSED] ttm_resource_fini_basic
[17:22:23] [PASSED] ttm_resource_manager_init_basic
[17:22:23] [PASSED] ttm_resource_manager_usage_basic
[17:22:23] [PASSED] ttm_resource_manager_set_used_basic
[17:22:23] [PASSED] ttm_sys_man_alloc_basic
[17:22:23] [PASSED] ttm_sys_man_free_basic
[17:22:23] ================== [PASSED] ttm_resource ===================
[17:22:23] ========================= ttm_tt ==========================
[17:22:23] ==================== ttm_tt_init_basic ====================
[17:22:23] [PASSED] Page-aligned size
[17:22:23] [PASSED] Extra pages requested
[17:22:23] ================ [PASSED] ttm_tt_init_basic ================
[17:22:23] [PASSED] ttm_tt_init_misaligned
[17:22:23] [PASSED] ttm_tt_fini_basic
[17:22:23] [PASSED] ttm_tt_fini_sg
[17:22:23] [PASSED] ttm_tt_fini_shmem
[17:22:23] [PASSED] ttm_tt_create_basic
[17:22:23] [PASSED] ttm_tt_create_invalid_bo_type
[17:22:23] [PASSED] ttm_tt_create_ttm_exists
[17:22:23] [PASSED] ttm_tt_create_failed
[17:22:23] [PASSED] ttm_tt_destroy_basic
[17:22:23] [PASSED] ttm_tt_populate_null_ttm
[17:22:23] [PASSED] ttm_tt_populate_populated_ttm
[17:22:23] [PASSED] ttm_tt_unpopulate_basic
[17:22:23] [PASSED] ttm_tt_unpopulate_empty_ttm
[17:22:23] [PASSED] ttm_tt_swapin_basic
[17:22:23] ===================== [PASSED] ttm_tt ======================
[17:22:23] ========================= ttm_bo ==========================
[17:22:23] =========== ttm_bo_reserve_optimistic_no_ticket ===========
[17:22:23] [PASSED] Cannot be interrupted and sleeps
[17:22:23] [PASSED] Cannot be interrupted, locks straight away
[17:22:23] [PASSED] Can be interrupted, sleeps
[17:22:23] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[17:22:23] [PASSED] ttm_bo_reserve_locked_no_sleep
[17:22:23] [PASSED] ttm_bo_reserve_no_wait_ticket
[17:22:23] [PASSED] ttm_bo_reserve_double_resv
[17:22:23] [PASSED] ttm_bo_reserve_interrupted
[17:22:23] [PASSED] ttm_bo_reserve_deadlock
[17:22:23] [PASSED] ttm_bo_unreserve_basic
[17:22:23] [PASSED] ttm_bo_unreserve_pinned
[17:22:23] [PASSED] ttm_bo_unreserve_bulk
[17:22:23] [PASSED] ttm_bo_put_basic
[17:22:23] [PASSED] ttm_bo_put_shared_resv
[17:22:23] [PASSED] ttm_bo_pin_basic
[17:22:23] [PASSED] ttm_bo_pin_unpin_resource
[17:22:23] [PASSED] ttm_bo_multiple_pin_one_unpin
[17:22:23] ===================== [PASSED] ttm_bo ======================
[17:22:23] ===================== ttm_bo_validate =====================
[17:22:23] ============== ttm_bo_init_reserved_sys_man ===============
[17:22:23] [PASSED] Buffer object for userspace
[17:22:23] [PASSED] Kernel buffer object
[17:22:23] [PASSED] Shared buffer object
[17:22:23] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[17:22:23] ============== ttm_bo_init_reserved_mock_man ==============
[17:22:23] [PASSED] Buffer object for userspace
[17:22:23] [PASSED] Kernel buffer object
[17:22:23] [PASSED] Shared buffer object
[17:22:23] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[17:22:23] [PASSED] ttm_bo_init_reserved_resv
[17:22:23] ================== ttm_bo_validate_basic ==================
[17:22:23] [PASSED] Buffer object for userspace
[17:22:23] [PASSED] Kernel buffer object
[17:22:23] [PASSED] Shared buffer object
[17:22:23] ============== [PASSED] ttm_bo_validate_basic ==============
[17:22:23] [PASSED] ttm_bo_validate_invalid_placement
[17:22:23] ============= ttm_bo_validate_same_placement ==============
[17:22:23] [PASSED] System manager
[17:22:23] [PASSED] VRAM manager
[17:22:23] ========= [PASSED] ttm_bo_validate_same_placement ==========
[17:22:23] [PASSED] ttm_bo_validate_failed_alloc
[17:22:23] [PASSED] ttm_bo_validate_pinned
[17:22:23] [PASSED] ttm_bo_validate_busy_placement
[17:22:23] ================ ttm_bo_validate_multihop =================
[17:22:23] [PASSED] Buffer object for userspace
[17:22:23] [PASSED] Kernel buffer object
[17:22:23] [PASSED] Shared buffer object
[17:22:23] ============ [PASSED] ttm_bo_validate_multihop =============
[17:22:23] ========== ttm_bo_validate_no_placement_signaled ==========
[17:22:23] [PASSED] Buffer object in system domain, no page vector
[17:22:23] [PASSED] Buffer object in system domain with an existing page 
vector
[17:22:23] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[17:22:23] ======== ttm_bo_validate_no_placement_not_signaled ========
[17:22:23] [PASSED] Buffer object for userspace
[17:22:23] [PASSED] Kernel buffer object
[17:22:23] [PASSED] Shared buffer object
[17:22:23] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[17:22:23] [PASSED] ttm_bo_validate_move_fence_signaled
[17:22:24] ========= ttm_bo_validate_move_fence_not_signaled =========
[17:22:24] [PASSED] Waits for GPU
[17:22:24] [PASSED] Tries to lock straight away
[17:22:24] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[17:22:24] [PASSED] ttm_bo_validate_swapout
[17:22:24] [PASSED] ttm_bo_validate_happy_evict
[17:22:24] [PASSED] ttm_bo_validate_all_pinned_evict
[17:22:24] [PASSED] ttm_bo_validate_allowed_only_evict
[17:22:24] [PASSED] ttm_bo_validate_deleted_evict
[17:22:24] [PASSED] ttm_bo_validate_busy_domain_evict
[17:22:24] [PASSED] ttm_bo_validate_evict_gutting
[17:22:24] [PASSED] ttm_bo_validate_recrusive_evict
[17:22:24] ================= [PASSED] ttm_bo_validate =================
[17:22:24] ============================================================
[17:22:24] Testing complete. Ran 102 tests: passed: 102
[17:22:24] Elapsed time: 31.810s total, 2.810s configuring, 28.277s 
building, 0.563s running

> Am 11.01.24 um 11:28 schrieb Karolina Stolarek:
>> Remove a leftover definition of page order and pass an empty flag value
>> in ttm_pool_pre_populated().
>>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> Tested-by: Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>
>> Reviewed-by: Dominik Karol Piątkowski 
>> <dominik.karol.piatkowski@intel.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c 
>> b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> index 2d9cae8cd984..b97f7b6daf5b 100644
>> --- a/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> +++ b/drivers/gpu/drm/ttm/tests/ttm_pool_test.c
>> @@ -78,10 +78,9 @@ static struct ttm_pool 
>> *ttm_pool_pre_populated(struct kunit *test,
>>       struct ttm_test_devices *devs = priv->devs;
>>       struct ttm_pool *pool;
>>       struct ttm_tt *tt;
>> -    unsigned long order = __fls(size / PAGE_SIZE);
>>       int err;
>>   -    tt = ttm_tt_kunit_init(test, order, caching, size);
>> +    tt = ttm_tt_kunit_init(test, 0, caching, size);
>>       KUNIT_ASSERT_NOT_NULL(test, tt);
>>         pool = kunit_kzalloc(test, sizeof(*pool), GFP_KERNEL);
>
