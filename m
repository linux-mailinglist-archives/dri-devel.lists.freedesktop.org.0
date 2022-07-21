Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A966957D3BD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 20:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086A611A3CA;
	Thu, 21 Jul 2022 18:58:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F7611326E;
 Thu, 21 Jul 2022 18:58:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=offJwp28+BT5UmMaKUXnbPErXO9uU6eZlDqpTssar7O379QLM4VrLW0FA8r8E6XbTDDDDNZ3Y4Kf3MI7w1SslcC18uIyu4/L8VxH5uf7Pu9LYD2Yr4Y+15a1Uwa2RSmN4cysTLO9tVC4HlgfNAO5lEATIzcCfUX5P7CdsPAtHRaYkHsHPJRqQ/ON5ZnVJwN1Fbciq6NZlsgJWCdobN2/G+mVHEghIPLKZIp9QAREi5pkyTcDQuw7yiWyJZ+Na1V0Kacu+ynhn8itULFvOpfGO3183KAhsaYpRgugo3rrmLEvzP5VgIX/tLLTaFAGKbI4WqLvO+5R+LhM+h8RxFaQwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8mKIogGoTaMpxbB4299vpJnMshpJ39aLaf26MUsoSo=;
 b=EohJm2eNTyr1Uf7riakqRHXsnTW/pfP2uF1/BvoHPGNv3We9JG8QEMbaAvJ5zovW3p9Lml7s42dlKH1P+tCd17ENcVrkVn1MlU9jrVAOlIn/OinQmA/pyf7fysAkwGXwi+K7gSCAtRXao8GoDyC+6ImiOZG3XqiJvwpSuNjawK0K2iHkoM9zcCkIyn+ifIkl7ukG8YOn1ft5w2j+drmqNu7RdCGnCOR2Ymjt3Bb/GCULnWuuHO/qMx/2ayIDY7LylAuS5N9RcrM9WrtEt31L1uJC6PcjPVlfVVM9MKyyPCqz9H1FPyNUw93mDXRWZlwZj03L1Bech+z4Jl7X6U8EDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8mKIogGoTaMpxbB4299vpJnMshpJ39aLaf26MUsoSo=;
 b=f9jbtOGsXtRcKXWQVl5DyANRHL+ND0VfAA0HGfUtuKFdIAMaUCHPv+rcwmUpNHFhQ7+XzV27urZvBlTcLdUMeRZrovrzzzeejbscEfm2ieQO6buVvu2ZFbdgYNnf5ZYrS8/bSY5lshdG+i48ichZZ60yBYW9ebL8gnMEYFh6suk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB2941.namprd12.prod.outlook.com (2603:10b6:208:a9::12)
 by DM6PR12MB3356.namprd12.prod.outlook.com (2603:10b6:5:38::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Thu, 21 Jul
 2022 18:58:43 +0000
Received: from MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43]) by MN2PR12MB2941.namprd12.prod.outlook.com
 ([fe80::d122:1dae:8445:2e43%7]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 18:58:43 +0000
Message-ID: <cf4fb10d-f0f0-3cd2-3ccb-1f1cb0594295@amd.com>
Date: Thu, 21 Jul 2022 14:58:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/5] drm/amd/display: move FPU code from dcn30 clk mgr to
 DML folder
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220720193208.1131493-1-mwen@igalia.com>
 <20220720193208.1131493-5-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20220720193208.1131493-5-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR17CA0007.namprd17.prod.outlook.com
 (2603:10b6:610:53::17) To MN2PR12MB2941.namprd12.prod.outlook.com
 (2603:10b6:208:a9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce9ed2b2-63a8-4311-1a48-08da6b4b0831
X-MS-TrafficTypeDiagnostic: DM6PR12MB3356:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6BI7OQoBZFouiVkaUt317F/JGmhArzu/BbxcDxiCUULecKHkq1QkMt3oObLFv0jzIAXwhd9KBvewY6zWqc/oCnd90c+OhZMjsL7x7qhNdi7fLc+qXio8d2LjjKyZuVZV6bI/8cNwMfOPn3sJJZPUDSY/hKl2XqyGedzAaEQMgA9mhimBPnA0m4e06T5zpP+v+9TgOh8GQ5BD/XC8AkcOiqZDr1IkqNpKxdjKpWmn5dHpA8C7Jurtamx+IXgRI1kUvmpdMM6MThlJKz7/ALpzPemiKGFC6LpG+O2MoC7PnVl/CqHYazU/ogVrk36u1YZCfUlIivYLwb85xo4z6gyOUO58jKhg8Sfgl1tzrxEjOUprfmdzpuZJ6E0g3itDC5UqFNCN2AHtBvuqwoxNG+/VAPNajwarhPuTcTuvPeLMc4hWsweS3A6TrOhvi5q4Jxb1w/vRpL0Ngfua91LBL6+VIa0e8BspWB05hkkHh84KixKJlvM4O2/B4MNo7sbONGbKlyqKZkVb2bnuBVdB6AgH9KPMcwAh5lNJUAuVLnOp6xiImY5RfdzBHiFSxlBdpTTHqfdhOnfPR7XoAq0raFG2Al/UCPTVthTwDmf05qvnEy2eI9h2dQjmM9rZ5vhGz9DlpJRARVbTqRzv0alRWlKzsmgwR+fLbObTAgdM4ceLXmtQY0Sc9iN+cPA25PaAMEdAgCkeQxJ9ih43koug7pZmic86Dz9HMUXh9mm1/xGILu2nChernvil61LACcmHAmzMXElBqKq+4icsfonJ7Ea8whVArZXDwQbS6m1T5QpYKG5PAzZV69tZ90rJlxqmfHZIbr9ZBv+EK3ukfV+qcFmCXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB2941.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(53546011)(6506007)(54906003)(5660300002)(30864003)(26005)(478600001)(6512007)(8936002)(2616005)(41300700001)(31686004)(2906002)(6486002)(186003)(66476007)(31696002)(86362001)(83380400001)(38100700002)(66556008)(316002)(8676002)(66946007)(4326008)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTI4UXZFdTREUFRnMzZtWlNLdDkrMlA1OENRb2lUcThwUGY3elErSHF1VmR1?=
 =?utf-8?B?RTlsdzJjaDlrZnBrOFhLdE45bWtPZWxLTk53aUJ3dGEwQ1dJTDRMRkYweHVV?=
 =?utf-8?B?ZDdJb2c4eWFKRzBrU3JQV2VZbkNHZU1RdVdvYzZpbTkwNnhFYVpxL2ZNYnY4?=
 =?utf-8?B?dVRRQnM3c2FRYjBhYTUrVU8zUmVLMkg1aityOHQwNWtDSWJkZW1KZTZIRHFY?=
 =?utf-8?B?ZWx3SVNya0lCRnRWc1k0WkN0R0tzR01SdHNiMzVqSEluVGErTlZmKzVPZUk1?=
 =?utf-8?B?YVBXNkxld000Vnovd05ISWNLbmNJNWVhTlZlbGtwRUc1ZGkzSWxjSXRZR3pE?=
 =?utf-8?B?TXE3K0cza3ZRM0hJcHBRM3l1bmJhUHQ2Q050Tjc5ZmVsbkw5Z2RudC9qS0pO?=
 =?utf-8?B?WGpVdksrVjRUQ05pSWlRQ0IyeDN3d1UyNy9wT0JQYy9qckFPYVJMQkFEanVu?=
 =?utf-8?B?a3dOUTFzVGFVS085SGVXS0pwQ25BTEZUZEJYNVkwcldEVTE0U3ZvSlozREhk?=
 =?utf-8?B?ZXJsUTNIa09yaWdJeVRyZUJERC8xZ2E4UFNuL0V3KzEwUjdiZjFVOVlJczVV?=
 =?utf-8?B?NjF1OUs3UFhsL2JwY2FQQkdCaXFJNHRIL1pxQVJQelZFem5HUU9KMHV1d3Rn?=
 =?utf-8?B?eHZtOTZaR1ROOS91U1hMOVh0ajd1T0RKb3F1Q0ErOE1sK29pV01WRUxKelZz?=
 =?utf-8?B?NEZtZFp4MTF6a3JuVm40UjVjNUxjWVVNLyt2bGQ2Y2pFMmRSb2Y5akZZSGR0?=
 =?utf-8?B?N21RcjNMS1prVW9EeGQyZkRQcjZBRGYwREIzTDFuTkNETUlsZVZxb1IyQ0RV?=
 =?utf-8?B?QVJTTURSQjQxYmlXM3hXVjBobEU2bjRpL09SRXMvYmdqNTRhTFI4SWhERzcz?=
 =?utf-8?B?SVBtZHNzQS9mbWp5YXFkSTFtMTlwUXI0VkM5aFlobVlIK0NuTWYyNmhJK0FL?=
 =?utf-8?B?ZjJNcThyKzE4TzdZR1lhUy9NNHVkZUhSR0RxYUZnMmNVK0hROUNic294Umhw?=
 =?utf-8?B?STVxRDhEeXUzbGNCb0tIZ3FIZW9takNkQWVuSnFQMmlqUTlYc2tOZmpjSllu?=
 =?utf-8?B?bGVJOUNhMC8rQ0hma3hXaSsrcElCbGlNSHZibEt3YTJkWEtmTmhNMkVFU0dw?=
 =?utf-8?B?bUtKME5UcExreUxjOGFzK3pzTXRUdXZWRHRuWFVpTXUrN2g5UmdQSno0SzNQ?=
 =?utf-8?B?WHhBZmRFd0JPN3Q5TUhWTVdUaHRCaStRSmdLeDJiMU92VXVhdkF0S3QzTUVm?=
 =?utf-8?B?aUxSSUFrdzAzUDM5N29uNnZhcWU3b3ZaWW80ZzB4MzJWbklDRVpZRXdRQ0h5?=
 =?utf-8?B?WXp6N200MTVMTE9oSnhRMFdkM0JBQ0ptMUZrZW9yaG1BeXh1TkdJWGZ0Y1ZV?=
 =?utf-8?B?WUlCQ29sbm5wWDBSb3FwYTdqdStoTkhwbFFQVjljYWV2aExIeGVKOHBoRlp1?=
 =?utf-8?B?TFVUOTlVeWhJa2JvYm9MNFFzc2xxTWxGelJ3a0lGUVU0SE9pN2xydXVIaVF6?=
 =?utf-8?B?RFZiYVZXREZBSWlhL3NsdS9IeEdsYXMxWFV3RTlmU3RETk5LVm4zYkFMTkZT?=
 =?utf-8?B?T2RvU1hGUFV2OTNrOW8vdE5TdUR0MndpZVVLK0kvWStpMG9XU1pFNWFxZlhv?=
 =?utf-8?B?SWx3b0YzZFhvYk56RHNuZ1VhQUZaMEVQaXRxcHJDalBCREpPWnRHbSs3Vzc0?=
 =?utf-8?B?NzNkaS9sWTJtN2VxMkJCZlI2UnhYeG4vTUVKQTh6ZnJkTDRjUHpPdlpKalhx?=
 =?utf-8?B?eTJqU1dmb2Y3ZVpwVC9lM3NKenY5WENCQVRHN3cwa1YxQzRaQWQwLzBBYWQz?=
 =?utf-8?B?ajlvUTFSTDFmb05LVm9tSERVTmFSQk95QlBrOEN6T3R5bFZCNkJxRG5QcnJR?=
 =?utf-8?B?ZHVKT05ZbjBObUVhSVcwMGg2cFJTOEtFT0dFWTNDRitHWGVScW9GZjdWNG1r?=
 =?utf-8?B?OTlSc0s1aUV5bFpTd1hCWVRSZVpHQlJPRVJQb25xYXZDY1puQWdoN3VOaGdo?=
 =?utf-8?B?MExGbGpHK3RFVDZ1bHM3WG1Za0pSdnpNSDFCWnpSb2VuU0RCcHBQNFlRclFB?=
 =?utf-8?B?cnprdkZZQzBSVDM0bng1VmQrc1R1elNqTndUTGZ4NWxETk40aU54RWZ2RDYy?=
 =?utf-8?Q?PZgg54qCd7/lIT6U49sqJ8jE8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9ed2b2-63a8-4311-1a48-08da6b4b0831
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB2941.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 18:58:43.1907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oc4s5UAD+NE+jt3WxtMU3n/n4dVzrUbeeAjYT+9vxHp7xCSfOIxu7G+tk9ziwLlvnkg9iu1d3C43W5SqFo4Z4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3356
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-07-20 15:32, Melissa Wen wrote:
> The -mno-gnu-attribute option in clk mgr makefile for dcn30 hides a soft
> vs hard fp error for powerpc. After removing this flag, we can see some
> FPU code remains there:
> 
> gcc-11.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o uses
> hard float,
> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.o
> uses soft float
> 
> Therefore, remove the -mno-gnu-attribute flag for dcn30/powerpc and move
> FPU-associated code to DML folder.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |  6 --
>   .../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c  | 63 ++-----------------
>   .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.c  | 63 ++++++++++++++++++-
>   .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.h  |  1 +
>   4 files changed, 68 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
> index 66dc02c426e9..15b660a951a5 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
> @@ -115,12 +115,6 @@ AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN21)
>   ###############################################################################
>   CLK_MGR_DCN30 = dcn30_clk_mgr.o dcn30_clk_mgr_smu_msg.o
>   
> -# prevent build errors regarding soft-float vs hard-float FP ABI tags
> -# this code is currently unused on ppc64, as it applies to VanGogh APUs only
> -ifdef CONFIG_PPC64
> -CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn30/dcn30_clk_mgr.o := $(call cc-option,-mno-gnu-attribute)
> -endif
> -
>   AMD_DAL_CLK_MGR_DCN30 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn30/,$(CLK_MGR_DCN30))
>   
>   AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN30)
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
> index 914708cefc79..3ce0ee0d012f 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
> @@ -29,6 +29,7 @@
>   #include "dcn20/dcn20_clk_mgr.h"
>   #include "dce100/dce_clk_mgr.h"
>   #include "dcn30/dcn30_clk_mgr.h"
> +#include "dml/dcn30/dcn30_fpu.h"
>   #include "reg_helper.h"
>   #include "core_types.h"
>   #include "dm_helpers.h"
> @@ -97,65 +98,11 @@ static void dcn3_init_single_clock(struct clk_mgr_internal *clk_mgr, uint32_t cl
>   	}
>   }
>   
> -static noinline void dcn3_build_wm_range_table(struct clk_mgr_internal *clk_mgr)
> +static void dcn3_build_wm_range_table(struct clk_mgr_internal *clk_mgr)
>   {
> -	/* defaults */
> -	double pstate_latency_us = clk_mgr->base.ctx->dc->dml.soc.dram_clock_change_latency_us;
> -	double sr_exit_time_us = clk_mgr->base.ctx->dc->dml.soc.sr_exit_time_us;
> -	double sr_enter_plus_exit_time_us = clk_mgr->base.ctx->dc->dml.soc.sr_enter_plus_exit_time_us;
> -	uint16_t min_uclk_mhz = clk_mgr->base.bw_params->clk_table.entries[0].memclk_mhz;
> -
> -	/* Set A - Normal - default values*/
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].valid = true;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us = pstate_latency_us;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.sr_exit_time_us = sr_exit_time_us;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.wm_type = WATERMARKS_CLOCK_RANGE;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_dcfclk = 0;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_dcfclk = 0xFFFF;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_uclk = min_uclk_mhz;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_uclk = 0xFFFF;
> -
> -	/* Set B - Performance - higher minimum clocks */
> -//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].valid = true;
> -//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].dml_input.pstate_latency_us = pstate_latency_us;
> -//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].dml_input.sr_exit_time_us = sr_exit_time_us;
> -//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
> -//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.wm_type = WATERMARKS_CLOCK_RANGE;
> -//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.min_dcfclk = TUNED VALUE;
> -//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.max_dcfclk = 0xFFFF;
> -//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.min_uclk = TUNED VALUE;
> -//	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.max_uclk = 0xFFFF;
> -
> -	/* Set C - Dummy P-State - P-State latency set to "dummy p-state" value */
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].valid = true;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.pstate_latency_us = 0;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.sr_exit_time_us = sr_exit_time_us;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.wm_type = WATERMARKS_DUMMY_PSTATE;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.min_dcfclk = 0;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.max_dcfclk = 0xFFFF;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.min_uclk = min_uclk_mhz;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.max_uclk = 0xFFFF;
> -	clk_mgr->base.bw_params->dummy_pstate_table[0].dram_speed_mts = 1600;
> -	clk_mgr->base.bw_params->dummy_pstate_table[0].dummy_pstate_latency_us = 38;
> -	clk_mgr->base.bw_params->dummy_pstate_table[1].dram_speed_mts = 8000;
> -	clk_mgr->base.bw_params->dummy_pstate_table[1].dummy_pstate_latency_us = 9;
> -	clk_mgr->base.bw_params->dummy_pstate_table[2].dram_speed_mts = 10000;
> -	clk_mgr->base.bw_params->dummy_pstate_table[2].dummy_pstate_latency_us = 8;
> -	clk_mgr->base.bw_params->dummy_pstate_table[3].dram_speed_mts = 16000;
> -	clk_mgr->base.bw_params->dummy_pstate_table[3].dummy_pstate_latency_us = 5;
> -
> -	/* Set D - MALL - SR enter and exit times adjusted for MALL */
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].valid = true;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].dml_input.pstate_latency_us = pstate_latency_us;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].dml_input.sr_exit_time_us = 2;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].dml_input.sr_enter_plus_exit_time_us = 4;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.wm_type = WATERMARKS_MALL;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.min_dcfclk = 0;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.max_dcfclk = 0xFFFF;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.min_uclk = min_uclk_mhz;
> -	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.max_uclk = 0xFFFF;
> +	DC_FP_START();
> +	dcn3_fpu_build_wm_range_table(&clk_mgr->base);
> +	DC_FP_END();
>   }
>   
>   void dcn3_init_clocks(struct clk_mgr *clk_mgr_base)
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
> index a8db1306750e..c00f759fdded 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.c
> @@ -29,7 +29,7 @@
>   #include "dcn20/dcn20_resource.h"
>   #include "dcn30/dcn30_resource.h"
>   
> -
> +#include "clk_mgr/dcn30/dcn30_smu11_driver_if.h"
>   #include "display_mode_vba_30.h"
>   #include "dcn30_fpu.h"
>   
> @@ -616,4 +616,65 @@ void dcn30_fpu_update_bw_bounding_box(struct dc *dc,
>   
>   }
>   
> +void dcn3_fpu_build_wm_range_table(struct clk_mgr *base)
> +{
> +	/* defaults */
> +	double pstate_latency_us = base->ctx->dc->dml.soc.dram_clock_change_latency_us;
> +	double sr_exit_time_us = base->ctx->dc->dml.soc.sr_exit_time_us;
> +	double sr_enter_plus_exit_time_us = base->ctx->dc->dml.soc.sr_enter_plus_exit_time_us;
> +	uint16_t min_uclk_mhz = base->bw_params->clk_table.entries[0].memclk_mhz;
>   
> +	dc_assert_fp_enabled();
> +
> +	/* Set A - Normal - default values*/
> +	base->bw_params->wm_table.nv_entries[WM_A].valid = true;
> +	base->bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us = pstate_latency_us;
> +	base->bw_params->wm_table.nv_entries[WM_A].dml_input.sr_exit_time_us = sr_exit_time_us;
> +	base->bw_params->wm_table.nv_entries[WM_A].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
> +	base->bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.wm_type = WATERMARKS_CLOCK_RANGE;
> +	base->bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_dcfclk = 0;
> +	base->bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_dcfclk = 0xFFFF;
> +	base->bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_uclk = min_uclk_mhz;
> +	base->bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_uclk = 0xFFFF;
> +
> +	/* Set B - Performance - higher minimum clocks */
> +//	base->bw_params->wm_table.nv_entries[WM_B].valid = true;
> +//	base->bw_params->wm_table.nv_entries[WM_B].dml_input.pstate_latency_us = pstate_latency_us;
> +//	base->bw_params->wm_table.nv_entries[WM_B].dml_input.sr_exit_time_us = sr_exit_time_us;
> +//	base->bw_params->wm_table.nv_entries[WM_B].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
> +//	base->bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.wm_type = WATERMARKS_CLOCK_RANGE;
> +//	base->bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.min_dcfclk = TUNED VALUE;
> +//	base->bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.max_dcfclk = 0xFFFF;
> +//	base->bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.min_uclk = TUNED VALUE;
> +//	base->bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.max_uclk = 0xFFFF;
> +
> +	/* Set C - Dummy P-State - P-State latency set to "dummy p-state" value */
> +	base->bw_params->wm_table.nv_entries[WM_C].valid = true;
> +	base->bw_params->wm_table.nv_entries[WM_C].dml_input.pstate_latency_us = 0;
> +	base->bw_params->wm_table.nv_entries[WM_C].dml_input.sr_exit_time_us = sr_exit_time_us;
> +	base->bw_params->wm_table.nv_entries[WM_C].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
> +	base->bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.wm_type = WATERMARKS_DUMMY_PSTATE;
> +	base->bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.min_dcfclk = 0;
> +	base->bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.max_dcfclk = 0xFFFF;
> +	base->bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.min_uclk = min_uclk_mhz;
> +	base->bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.max_uclk = 0xFFFF;
> +	base->bw_params->dummy_pstate_table[0].dram_speed_mts = 1600;
> +	base->bw_params->dummy_pstate_table[0].dummy_pstate_latency_us = 38;
> +	base->bw_params->dummy_pstate_table[1].dram_speed_mts = 8000;
> +	base->bw_params->dummy_pstate_table[1].dummy_pstate_latency_us = 9;
> +	base->bw_params->dummy_pstate_table[2].dram_speed_mts = 10000;
> +	base->bw_params->dummy_pstate_table[2].dummy_pstate_latency_us = 8;
> +	base->bw_params->dummy_pstate_table[3].dram_speed_mts = 16000;
> +	base->bw_params->dummy_pstate_table[3].dummy_pstate_latency_us = 5;
> +
> +	/* Set D - MALL - SR enter and exit times adjusted for MALL */
> +	base->bw_params->wm_table.nv_entries[WM_D].valid = true;
> +	base->bw_params->wm_table.nv_entries[WM_D].dml_input.pstate_latency_us = pstate_latency_us;
> +	base->bw_params->wm_table.nv_entries[WM_D].dml_input.sr_exit_time_us = 2;
> +	base->bw_params->wm_table.nv_entries[WM_D].dml_input.sr_enter_plus_exit_time_us = 4;
> +	base->bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.wm_type = WATERMARKS_MALL;
> +	base->bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.min_dcfclk = 0;
> +	base->bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.max_dcfclk = 0xFFFF;
> +	base->bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.min_uclk = min_uclk_mhz;
> +	base->bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.max_uclk = 0xFFFF;
> +}
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h
> index dedfe7b5f173..c2024052a497 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/dcn30_fpu.h
> @@ -63,5 +63,6 @@ void dcn30_fpu_update_bw_bounding_box(struct dc *dc,
>   	unsigned int *dcfclk_mhz,
>   	unsigned int *dram_speed_mts);
>   
> +void dcn3_fpu_build_wm_range_table(struct clk_mgr *base);
>   
>   #endif /* __DCN30_FPU_H__*/

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

