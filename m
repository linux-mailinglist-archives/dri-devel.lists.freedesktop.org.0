Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BDA7EFFE5
	for <lists+dri-devel@lfdr.de>; Sat, 18 Nov 2023 14:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F73110E064;
	Sat, 18 Nov 2023 13:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061.outbound.protection.outlook.com [40.107.95.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D2D10E064
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Nov 2023 13:32:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGcAMXzLIbKBY5OgO3i3l/0oJd4m9C+fDSneDX6IbOtAo/1iPudAh9l6sre5ywAKhU1umrsNubfekulyBfvi7CLVM0uPzQQakTvGEqmwGflIvDixdJH5lDDLsHiZBz5bXLLwu2nwr0xYf9Mg4wLoXAZmQfG8SORfhWSldJqwYu2hAZ+Ko5vIpIWIvlbcZusyHCbKz4HogycWRY7q8hESvW+KlCzLTywLqqG9g1jfOwBNvaMRDJIwO4BA0xzx7j4x4yKyzQ+dVn1nrqx6vn2TAzRYiK43oSZ9gm2dhwUxWCgFsS0oeAfK1Lz7ZtThgXb7FZdY0zFyLWD9Eo2hG0Cugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P71llE3TLLGblKcDw+LkVADFyyvsXoDoEXt12MGcK2s=;
 b=BYpI9dIPGYJJVfNDt+2+2bx0QyrEB3MTWiFrzowa9calm4YcwPxCjECwY+4jt3JT8p/3p3Nsb2ylf4p4z8onHaMeu6u7Yt+eyLKQpTO/qRFde6L61l21wrvvOSQ8c+EnUiPEz8+peaVUZA/uGpLbRrYLl6bwSVDWMXDgkAgBTdP+d8qJkYPOJbFLRr0IXQgrye/JzwDRIIt4RFyRe6TlbL3IAR87yoX7B3C8LqTCHYkJW1jr9D6FnHRNVM0l/mR/C3f5JScc+UYW1RkDClpCzvf9Fc1WluKmCiEIItijqdT2LVQKvOCTn0jq9jgespD1LmiIaGcXYfoxa5mvd87Iog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P71llE3TLLGblKcDw+LkVADFyyvsXoDoEXt12MGcK2s=;
 b=Xyh5ME9FAZC2WRTA+BY0lUPPHCLav0RQf8kbxUyIMqmXxA5g57MWChF/hnmaQK5dJm/fCJyWeegWNTMNn3odm6W2GunyHTAVdQam8RBoDqrNuyMqaAv9NRubh2J7n3BKmACK2V6IrpCz4SlINEum+XOUDKDZQq3nC3ITcPssZrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by MN2PR12MB4421.namprd12.prod.outlook.com (2603:10b6:208:26c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.25; Sat, 18 Nov
 2023 13:32:44 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::3065:a182:8c3:11c9]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::3065:a182:8c3:11c9%6]) with mapi id 15.20.7002.025; Sat, 18 Nov 2023
 13:32:44 +0000
Message-ID: <199c1fe7-f9a5-0b1e-f94a-6a24379e9340@amd.com>
Date: Sat, 18 Nov 2023 19:02:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 0/8] Improve test coverage of TTM
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org,
 "Somalapuram, Amaranath" <Amaranath.Somalapuram@amd.com>
References: <cover.1700207346.git.karolina.stolarek@intel.com>
 <a9118f8e-782c-4259-8487-7ccc8cae0a3a@amd.com>
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <a9118f8e-782c-4259-8487-7ccc8cae0a3a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::35) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|MN2PR12MB4421:EE_
X-MS-Office365-Filtering-Correlation-Id: 4734895f-e6e3-4816-96bb-08dbe83ad841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t59USKdhZqiDfpDqPYQO/RBnqNbrZtHqXC6tAZisG88t/xAeKQs36m6lSYXaGpZpi8DXIxx6uMeUCRNGyrKn8WEi8c3z1BO7YerT2PnvlA/ebqEPwLkmRGNjddaP4lx2nbkoVBIW78N71tBy/WuAlY1cZUIXaFT8sVikMlVn/nbGMeEo8gG4yA2/X4goesFql74tMyicp3f8UUmaDnIQytm6mEbu3MOyDOgoC6crgytDPXnWhOIT4mDwA5tehmZO+VTHamV/XtDdliZjMg7sDoruRAoFq3IQPu2xg64+Dfm59Q3JpmOx+vtcBv4ZVkfxtDOsuXn0+E2T3lc0/PwV9GAtIt/Dy50y2gBCFfw+S3qZpbxwFzRG6hW6+lxOmFwcWcZ5jh5usR1D/Bumik1Gucs5I3XQSPDEJs1OvAaJ5ZKRJwQUOhNu5X3pLhtT5BUm3VjPor0q8DEG+g0vveZ5zm0m14IJ7/cDUxElLiyclcBPqf/deChbuY1Ezkf8MD4W8g7Zt4hoBqmaMsXAyggMRZe2uqqly+aeYisR/42ke7qqnJYJkst7HcWYPweT6Mn0b8xjjyuLpn9qN6R+Fl7So47PjHQB69s4y2ccELwH6P3yyR/Qr32PgoLLO69yi4j8AmRobq31pNE3MGaHsoK4mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(366004)(396003)(376002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(6512007)(53546011)(26005)(66574015)(38100700002)(110136005)(66946007)(66556008)(316002)(54906003)(6636002)(66476007)(6506007)(2616005)(83380400001)(478600001)(6486002)(8936002)(6666004)(4326008)(8676002)(5660300002)(2906002)(30864003)(31696002)(41300700001)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1hDUTZ2RHRtN2xkTVpvQjRScDRBZjdJWjR3TWk5cldXajRpTW55VUEzR2U4?=
 =?utf-8?B?bmJaeXhGejBENUw0bjNkNjc1OVJSdUlrb2Q3NjR3RW96cUlZSnFXRGxQWXBD?=
 =?utf-8?B?bVM1MXYzQ2tCejNDdVB4S2hGVlRxYlZsamF2aDE0ZTU2YjBGRUtUQk1OU3NJ?=
 =?utf-8?B?cG1SRzdYTDZaL1QrMEQyc1MvMEZqVEhMUHBNdEJGc3VFWS82TTc4TlN1RGpV?=
 =?utf-8?B?SHZEendoejVKeGN3bS9xRkpQTmVtZytsaVV5S0ZnaGJYN1dJNldQbGFxMk1V?=
 =?utf-8?B?WG1RM2NOeTdXd0p3OEduNGRFOXk1WjNjbGkvOHJqZ2hKK1RucExHcmg0aE4v?=
 =?utf-8?B?QTdDeUVqaDFuSTJuandBSmp1d2JiMzJOVnROWWhUbWVJYlkxNVZ5Q213YWE2?=
 =?utf-8?B?cWtSMThyOWpQZ3o0TWpqSWZZbXJSeEJuemFLYUIrQm5UbEdPdXpCZUhlVDY4?=
 =?utf-8?B?dGwybERGNGZjRW1vclduM3Zac0pvM05mSVVieXZ0a2V1dHM0SjQ2d2dMcng0?=
 =?utf-8?B?azRvalpqTmR1ZGRIOStMMjJseE1saEh4SVNKYXQwR29JaHdOQU0rSWdtemJy?=
 =?utf-8?B?dWtyYll6RTgwR2E2aThRNFBYWi9BbnJQTmErU2JOUjduTjZuTUJyRmRncFp0?=
 =?utf-8?B?S0FEeTYvZVIyNFhjVERhVFlYNWZxczgwUVBJOEtsVzFxcDdMNmRlNGNFUnQv?=
 =?utf-8?B?YWd3eWpjTExuWlZIdTBvNWw4bXhENTZpQys3VEdTd1VUTlYyZmNFTDczY0Nu?=
 =?utf-8?B?SHFrVDJzTVo1Yi9VM1N5WjlFWGlRNTBCN3d6MDV1cnlDK1E5a2s3V093RU4v?=
 =?utf-8?B?Wk42QVdiazd2MEUxdnRWeTVUcnBXRkNGYXdkU0pNRW0rQXpjeG9SaGw3Zkla?=
 =?utf-8?B?SkxpZ084bnpNVjhhZC95aURrakhLNjFKZ1NUaHZPRlNTSTk2WUhWM3dhdjdy?=
 =?utf-8?B?c0x6ajlSL3hadVI5Rk00eU5CR09FWFBvTm52UlR4T2tBTzBMaXNkY213S3lL?=
 =?utf-8?B?SFd2ZmdWSDZjbFNSNlJBbkJZaDREdndFaXcyaUduK3piMFhia2tMZ0NtTWJI?=
 =?utf-8?B?TXFvOEZNeEs1YmVmTUVJYXZQVXJFVnJlUnMybVhSRHZKWjRGaXhSU1pZWHc5?=
 =?utf-8?B?UElPQTFSSEIzS0doK2pHK1c3a3p5SUU0QXc4MWFFMXdEalVpcWs3TEdIVmZT?=
 =?utf-8?B?ZFBWM1NvUXRTeWJYenVXb21TUFlhb2pNTlV2RXJmY0N5RWpHcmVXbGJXbUEv?=
 =?utf-8?B?YUR6K0pRM0pvbjRtamp4aUVad2M0Y1REUXlQejdPV2o3YWhhZUp5VldxVFNV?=
 =?utf-8?B?ODJzSWlxUUJXWmprWmVOaWV6aWlvNERvbEZlZDh2NURUUVZuYmpEZDZUSC9x?=
 =?utf-8?B?MWdybWJIT2oyUUR4OGtnNDZZN0dzVmZOTUJDSFVBRzhlNDU0LzB4bTRaa0RJ?=
 =?utf-8?B?UkdKd0xJcmJvZlMyc085RHlCMkZ4OFY3UHJHUEVZOTB1akFWaEIvZW1FME5W?=
 =?utf-8?B?YmFPZ241U0s1QUkvbDc2anQrN1NROWNzRTZUa1hvaWtCaTlMZnNxOFFaaDZr?=
 =?utf-8?B?eDNyV3dTbURYVTJ4RGhEd1Bzd2E2S1hRN1pKM1htRlNyUFBRRzdESEpYSUZm?=
 =?utf-8?B?cC9mQWx6UUk2cDV0NTJSQjBVNEZIY3pFWEgxaHRGdmYvTkE3TWYwSHFsTytQ?=
 =?utf-8?B?NVhsNFlCMElQdUlKK2VGdmZXbEFhckxOMUxRMlJIQ2d4U1d4Yk5nQmJYVjZt?=
 =?utf-8?B?bm81MmhLZWU5TFZpZG41em83TmV0bmFHQ0lkMFN5TVZVWEJkcUFWVUc4Vk95?=
 =?utf-8?B?VjI2WVJRWGZVVnB4YThXR0JuR3BPMWw1TkhOcEJvWWJsckdrODJoZitmUzFY?=
 =?utf-8?B?RVVCSlZXWnQ3WElUQnlOMWVmeFlTbzUvZ1drQjNqQjZFTktGT20va0F5b1I2?=
 =?utf-8?B?T29uM0FVaUswR3Q1ZmVsSlVZZ1V3ZStZdUwwYkRUVjJpTHk2UlJqODliKy9G?=
 =?utf-8?B?MVgzbGhRR21vYkVYcy9Qek0yQmRCTXBsOStQamNHYWpFNVJLV0tGMUJ2WWJv?=
 =?utf-8?B?dG40WndmUk9oSC9oZlNlYzdBUDlvanhWTzgvNHVCc3daSUwxa3lETHRDaWxQ?=
 =?utf-8?Q?uA5GbF+HW68Jg2GAmd+ceoxKG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4734895f-e6e3-4816-96bb-08dbe83ad841
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2023 13:32:44.3919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VeyXwJT+4hDCvjyFpWeSNwSylaeX+9jyFAIoLCSWwFczokBmTg37m2rfrqpgsjq8PhKGFmXGP4rgCyyicIw+Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4421
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/17/2023 7:01 PM, Christian König wrote:
> No idea how you managed to do this, but now Amar is CCed on the 
> patches he already tested and *not* CCed on the new ones and the cover 
> letter :)
>
> @Amar can you pick up the latest patches from the mailing list and 
> give them another round of testing?
>
Looks good.

rtg@rtg-Artic:~/amar/git/drm-misc1$ ./tools/testing/kunit/kunit.py run 
--kunitconfig=drivers/gpu/drm/ttm/tests

[18:57:39] Configuring KUnit Kernel ...
Generating .config ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
[18:57:44] Building KUnit Kernel ...
Populating config with:
$ make ARCH=um O=.kunit olddefconfig
Building with:
$ make ARCH=um O=.kunit --jobs=16
[18:58:41] Starting KUnit Kernel (1/1)...
[18:58:41] ============================================================
[18:58:41] ======================= ttm_device ========================
[18:58:41] [PASSED] ttm_device_init_basic
[18:58:41] [PASSED] ttm_device_init_multiple
[18:58:41] [PASSED] ttm_device_fini_basic
[18:58:41] [PASSED] ttm_device_init_no_vma_man
[18:58:41] ================== ttm_device_init_pools ==================
[18:58:41] [PASSED] No DMA allocations, no DMA32 required
[18:58:41] [PASSED] DMA allocations, DMA32 required
[18:58:41] [PASSED] No DMA allocations, DMA32 required
[18:58:41] [PASSED] DMA allocations, no DMA32 required
[18:58:41] ============== [PASSED] ttm_device_init_pools ==============
[18:58:41] =================== [PASSED] ttm_device ====================
[18:58:41] ======================== ttm_pool =========================
[18:58:41] ================== ttm_pool_alloc_basic ===================
[18:58:41] [PASSED] One page
[18:58:41] [PASSED] More than one page
[18:58:41] [PASSED] Above the allocation limit
[18:58:41] [PASSED] One page, with coherent DMA mappings enabled
[18:58:41] [PASSED] Above the allocation limit, with coherent DMA 
mappings enabled
[18:58:41] ============== [PASSED] ttm_pool_alloc_basic ===============
[18:58:41] ============== ttm_pool_alloc_basic_dma_addr ==============
[18:58:41] [PASSED] One page
[18:58:41] [PASSED] More than one page
[18:58:41] [PASSED] Above the allocation limit
[18:58:41] [PASSED] One page, with coherent DMA mappings enabled
[18:58:41] [PASSED] Above the allocation limit, with coherent DMA 
mappings enabled
[18:58:41] ========== [PASSED] ttm_pool_alloc_basic_dma_addr ==========
[18:58:41] [PASSED] ttm_pool_alloc_order_caching_match
[18:58:41] [PASSED] ttm_pool_alloc_caching_mismatch
[18:58:41] [PASSED] ttm_pool_alloc_order_mismatch
[18:58:41] [PASSED] ttm_pool_free_dma_alloc
[18:58:41] [PASSED] ttm_pool_free_no_dma_alloc
[18:58:41] [PASSED] ttm_pool_fini_basic
[18:58:41] ==================== [PASSED] ttm_pool =====================
[18:58:41] ====================== ttm_resource =======================
[18:58:41] ================= ttm_resource_init_basic =================
[18:58:41] [PASSED] Init resource in TTM_PL_SYSTEM
[18:58:41] [PASSED] Init resource in TTM_PL_VRAM
[18:58:41] [PASSED] Init resource in a private placement
[18:58:41] [PASSED] Init resource in TTM_PL_SYSTEM, set placement flags
[18:58:41] ============= [PASSED] ttm_resource_init_basic =============
[18:58:41] [PASSED] ttm_resource_init_pinned
[18:58:41] [PASSED] ttm_resource_fini_basic
[18:58:41] [PASSED] ttm_resource_manager_init_basic
[18:58:41] [PASSED] ttm_resource_manager_usage_basic
[18:58:41] [PASSED] ttm_resource_manager_set_used_basic
[18:58:41] [PASSED] ttm_sys_man_alloc_basic
[18:58:41] [PASSED] ttm_sys_man_free_basic
[18:58:41] ================== [PASSED] ttm_resource ===================
[18:58:41] ========================= ttm_tt ==========================
[18:58:41] ==================== ttm_tt_init_basic ====================
[18:58:41] [PASSED] Page-aligned size
[18:58:41] [PASSED] Extra pages requested
[18:58:41] ================ [PASSED] ttm_tt_init_basic ================
[18:58:41] [PASSED] ttm_tt_init_misaligned
[18:58:41] [PASSED] ttm_tt_fini_basic
[18:58:41] [PASSED] ttm_tt_fini_sg
[18:58:41] [PASSED] ttm_tt_fini_shmem
[18:58:41] [PASSED] ttm_tt_create_basic
[18:58:41] [PASSED] ttm_tt_create_invalid_bo_type
[18:58:41] [PASSED] ttm_tt_create_ttm_exists
[18:58:41] [PASSED] ttm_tt_create_failed
[18:58:41] [PASSED] ttm_tt_destroy_basic
[18:58:41] ===================== [PASSED] ttm_tt ======================
[18:58:41] ========================= ttm_bo ==========================
[18:58:41] =========== ttm_bo_reserve_optimistic_no_ticket ===========
[18:58:41] [PASSED] Cannot be interrupted and sleeps
[18:58:41] [PASSED] Cannot be interrupted, locks straight away
[18:58:41] [PASSED] Can be interrupted, sleeps
[18:58:41] ======= [PASSED] ttm_bo_reserve_optimistic_no_ticket =======
[18:58:41] [PASSED] ttm_bo_reserve_locked_no_sleep
[18:58:41] [PASSED] ttm_bo_reserve_no_wait_ticket
[18:58:41] [PASSED] ttm_bo_reserve_double_resv
[18:58:41] [PASSED] ttm_bo_reserve_interrupted
[18:58:41] [PASSED] ttm_bo_reserve_deadlock
[18:58:41] [PASSED] ttm_bo_unreserve_basic
[18:58:41] [PASSED] ttm_bo_unreserve_pinned
[18:58:41] [PASSED] ttm_bo_unreserve_bulk
[18:58:41] [PASSED] ttm_bo_put_basic
[18:58:41] [PASSED] ttm_bo_put_shared_resv
[18:58:41] [PASSED] ttm_bo_pin_basic
[18:58:41] [PASSED] ttm_bo_pin_unpin_resource
[18:58:41] [PASSED] ttm_bo_multiple_pin_one_unpin
[18:58:41] ===================== [PASSED] ttm_bo ======================
[18:58:41] ===================== ttm_bo_validate =====================
[18:58:41] ============== ttm_bo_init_reserved_sys_man ===============
[18:58:41] [PASSED] Buffer object for userspace
[18:58:41] [PASSED] Kernel buffer object
[18:58:41] [PASSED] Shared buffer object
[18:58:41] ========== [PASSED] ttm_bo_init_reserved_sys_man ===========
[18:58:41] ============== ttm_bo_init_reserved_mock_man ==============
[18:58:41] [PASSED] Buffer object for userspace
[18:58:41] [PASSED] Kernel buffer object
[18:58:41] [PASSED] Shared buffer object
[18:58:41] ========== [PASSED] ttm_bo_init_reserved_mock_man ==========
[18:58:41] [PASSED] ttm_bo_init_reserved_resv
[18:58:41] ================== ttm_bo_validate_basic ==================
[18:58:41] [PASSED] Buffer object for userspace
[18:58:41] [PASSED] Kernel buffer object
[18:58:41] [PASSED] Shared buffer object
[18:58:41] ============== [PASSED] ttm_bo_validate_basic ==============
[18:58:41] [PASSED] ttm_bo_validate_invalid_placement
[18:58:41] ============= ttm_bo_validate_same_placement ==============
[18:58:41] [PASSED] System manager
[18:58:41] [PASSED] VRAM manager
[18:58:41] ========= [PASSED] ttm_bo_validate_same_placement ==========
[18:58:41] [PASSED] ttm_bo_validate_failed_alloc
[18:58:41] [PASSED] ttm_bo_validate_pinned
[18:58:41] [PASSED] ttm_bo_validate_busy_placement
[18:58:41] ================ ttm_bo_validate_multihop =================
[18:58:41] [PASSED] Buffer object for userspace
[18:58:41] [PASSED] Kernel buffer object
[18:58:41] [PASSED] Shared buffer object
[18:58:41] ============ [PASSED] ttm_bo_validate_multihop =============
[18:58:41] ========== ttm_bo_validate_no_placement_signaled ==========
[18:58:41] [PASSED] Buffer object in system domain, no page vector
[18:58:41] [PASSED] Buffer object in system domain with an existing page 
vector
[18:58:41] ====== [PASSED] ttm_bo_validate_no_placement_signaled ======
[18:58:41] ======== ttm_bo_validate_no_placement_not_signaled ========
[18:58:41] [PASSED] Buffer object for userspace
[18:58:41] [PASSED] Kernel buffer object
[18:58:41] [PASSED] Shared buffer object
[18:58:41] ==== [PASSED] ttm_bo_validate_no_placement_not_signaled ====
[18:58:41] [PASSED] ttm_bo_validate_move_fence_signaled
[18:58:41] ========= ttm_bo_validate_move_fence_not_signaled =========
[18:58:41] [PASSED] Waits for GPU
[18:58:41] [PASSED] Tries to lock straight away
[18:58:41] ===== [PASSED] ttm_bo_validate_move_fence_not_signaled =====
[18:58:41] ================= [PASSED] ttm_bo_validate =================
[18:58:41] ============================================================
[18:58:41] Testing complete. Ran 89 tests: passed: 89
[18:58:41] Elapsed time: 62.274s total, 5.111s configuring, 56.844s 
building, 0.282s running

> I will try to find time to give that some review.
>
> Thanks,
> Christian.
>
> Am 17.11.23 um 09:49 schrieb Karolina Stolarek:
>> Add tests for building blocks of the TTM subsystem, such as 
>> ttm_resource,
>> ttm_resource_manager, ttm_tt and ttm_buffer_object. This series covers
>> basic functions such as initialization, allocation and clean-up of each
>> struct. Testing of ttm_buffer_object also includes locking and unlocking
>> the object for validation, with special scenarios such as an interrupted
>> wait or deadlock.
>>
>> Some of the test cases check the bulk move mechanism and how it 
>> interacts
>> with pinned buffers. This is to be seen if we want to add dedicated 
>> testing
>> for bulk move or not. The resource allocation subtests use 
>> ttm_sys_manager
>> for now. Resources that don't use system memory will be indirectly 
>> tested
>> via tests for ttm_bo_validate()/ttm_bo_init_validate(), using a mock
>> resource manager.
>>
>> Use kunit_tool script to manually run all the tests:
>>
>> $ ./tools/testing/kunit/kunit.py run 
>> --kunitconfig=drivers/gpu/drm/ttm/tests
>>
>> To build a kernel with TTM KUnit tests, first enable CONFIG_KUNIT, and
>> then CONFIG_DRM_TTM_KUNIT_TEST.
>>
>> Many thanks,
>> Karolina
>>
>> v7:
>>   - Drop size argument from ttm_place_kunit_init(), it's no longer 
>> needed
>>   - Delete a TODO comment from ttm_bo_validate_tests.c
>>   - First evict BOs before calling ttm_resource_manager_set_used() in
>>     ttm_mock_manager_fini()
>>   - Stop calling ttm_resource_manager_cleanup() as a part of the mock 
>> manager
>>     fini sequence. It frees a move fence that is allocated via KUnit 
>> allocator,
>>     which gets freed again as a part of the test cleanup
>>   - Set use_tt to true in mock manager and stop passing in the flag 
>> for it
>>   - Make ttm_dev_empty_funcs static
>>     (drivers/gpu/drm/ttm/tests/ttm_tt_test.c:232:25: sparse: sparse:
>>     symbol 'ttm_dev_empty_funcs' was not declared. Should it be static?)
>>   - Cast bo->base.resv->fences to a generic pointer before it's 
>> checked by
>>     KUnit (drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c:98:9:
>>     sparse: sparse: incompatible types in comparison expression 
>> (different
>>     base types))
>>   - Clean up mock managers in ttm_bo_validate_move_fence_not_signaled 
>> subtest
>>
>> v6:
>>    - Include tests for ttm_bo_init_reserved() and ttm_bo_validate(), 
>> with
>>      a mock resource manager (patches 6-8; no eviction testing)
>>    - Add ttm_test_devices_all_init() helper to also init ttm_device 
>> instance
>>    - Remove fpfn and lpfn from ttm_place_kunit_init() helper -- these 
>> fields
>>      are neither used nor tested
>>
>> v5:
>>    - Actually use the page_flags parameter in ttm_tt_simple_create()
>>
>> v4:
>>    - First unreserve the object before calling ww_acquire_fini() in
>>      ttm_bo_reserve_double_resv subtest
>>    - Silence lockdep in ttm_bo_reserve_deadlock subtest (open to 
>> suggestions
>>      how to fix it in a different way)
>>    - Use a genuine GEM object in ttm_buffer_object instead of an 
>> empty one
>>
>> v3:
>>    - Instead of modifying the main TTM Makefile, use
>>      EXPORT_SYMBOL_FOR_TESTS_ONLY() macro for symbols that are tested 
>> but
>>      not widely exported. Thanks to this change, TTM tests can be built
>>      as modules, even when non-exported functions are used
>>    - Change the description of a patch that fixes 
>> ttm_pool_pre_populated()
>>
>> v2:
>>    - Remove Makefile for KUnit tests and move the definitions to the
>>      TTM's one
>>    - Switch on CONFIG_DRM_TTM_KUNIT_TEST=m so the tests and TTM module
>>      are built as one. This allows building the tests as a module, even
>>      if it uses functions that are not exported
>>    - Fix ttm_pool_pre_populated(); a wrong flag was passed to
>>      ttm_tt_kunit_init() function
>>
>> Karolina Stolarek (8):
>>    drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
>>    drm/ttm/tests: Add tests for ttm_tt
>>    drm/ttm/tests: Add tests for ttm_bo functions
>>    drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
>>    drm/ttm/tests: Use an init function from the helpers lib
>>    drm/ttm/tests: Test simple BO creation and validation
>>    drm/ttm/tests: Add tests with mock resource managers
>>    drm/ttm/tests: Add test cases dependent on fence signaling
>>
>>   drivers/gpu/drm/Kconfig                       |   1 +
>>   drivers/gpu/drm/ttm/tests/.kunitconfig        |   1 +
>>   drivers/gpu/drm/ttm/tests/Makefile            |   5 +
>>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 619 ++++++++++++++
>>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 795 ++++++++++++++++++
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 109 ++-
>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   7 +
>>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  | 206 +++++
>>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |  31 +
>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |   3 +-
>>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++
>>   drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 282 +++++++
>>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>>   drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
>>   14 files changed, 2397 insertions(+), 3 deletions(-)
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c
>>
>
