Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2865FC65B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 15:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6B110E516;
	Wed, 12 Oct 2022 13:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3483710E516;
 Wed, 12 Oct 2022 13:24:15 +0000 (UTC)
Received: from kwepemi500024.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MnYFw1dQKz1CDyx;
 Wed, 12 Oct 2022 21:21:40 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 kwepemi500024.china.huawei.com (7.221.188.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 21:24:11 +0800
Message-ID: <86cb39a9-0a77-fddd-5e49-f7f717218245@huawei.com>
Date: Wed, 12 Oct 2022 21:24:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH resend v2] drm/amdgpu: fix enum conversion in
 display_mode_vba
Content-Language: en-US
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <Pavle.Kotarac@amd.com>, <aric.cyr@amd.com>,
 <Nevenko.Stupar@amd.com>, <arnd@arndb.de>, <yang.lee@linux.alibaba.com>
References: <20220922091804.899650-1-zengheng4@huawei.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <20220922091804.899650-1-zengheng4@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500024.china.huawei.com (7.221.188.100)
X-CFilter-Loop: Reflected
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
Cc: liwei391@huawei.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, I just wonder is there any further comment towards this patch? or 
anything needs to be correct?


Greetings,

Zeng Heng


On 2022/9/22 17:18, Zeng Heng wrote:
> Fix below compile warning when open enum-conversion
> option check (compiled with -Wenum-conversion):
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:
> In function ‘dml20_ModeSupportAndSystemConfigurationFull’:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3900:44:
> error: implicit conversion from ‘enum <anonymous>’ to ‘enum odm_combine_mode’ [-Werror=enum-conversion]
>   3900 |     locals->ODMCombineEnablePerState[i][k] = false;
>        |                                            ^
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3904:46:
> error: implicit conversion from ‘enum <anonymous>’ to ‘enum odm_combine_mode’ [-Werror=enum-conversion]
>   3904 |       locals->ODMCombineEnablePerState[i][k] = true;
>        |                                              ^
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3907:46:
> error: implicit conversion from ‘enum <anonymous>’ to ‘enum odm_combine_mode’ [-Werror=enum-conversion]
>   3907 |       locals->ODMCombineEnablePerState[i][k] = true;
>        |                                              ^
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3960:45:
> error: implicit conversion from ‘enum <anonymous>’ to ‘enum odm_combine_mode’ [-Werror=enum-conversion]
>   3960 |      locals->ODMCombineEnablePerState[i][k] = false;
>
> Use the proper value from the right enumerated type,
> dm_odm_combine_mode_disabled & dm_odm_combine_mode_2to1,
> so there is no more implicit conversion.
>
> The numerical values of dm_odm_combine_mode_disabled
> & false and dm_odm_combine_mode_2to1 & true
> happen to be the same, so there is no change in
> behavior.
>
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>   .../amd/display/dc/dml/dcn20/display_mode_vba_20.c   |  8 ++++----
>   .../amd/display/dc/dml/dcn20/display_mode_vba_20v2.c | 10 +++++-----
>   .../amd/display/dc/dml/dcn21/display_mode_vba_21.c   | 12 ++++++------
>   3 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> index d3b5b6fedf04..6266b0788387 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
> @@ -3897,14 +3897,14 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   					mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine = mode_lib->vba.PixelClock[k] / 2
>   							* (1 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
>   
> -				locals->ODMCombineEnablePerState[i][k] = false;
> +				locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>   				mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
>   				if (mode_lib->vba.ODMCapability) {
>   					if (locals->PlaneRequiredDISPCLKWithoutODMCombine > mode_lib->vba.MaxDispclkRoundedDownToDFSGranularity) {
> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>   						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>   					} else if (locals->HActive[k] > DCN20_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] == dm_420) {
> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>   						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>   					}
>   				}
> @@ -3957,7 +3957,7 @@ void dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   				locals->RequiredDISPCLK[i][j] = 0.0;
>   				locals->DISPCLK_DPPCLK_Support[i][j] = true;
>   				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
> -					locals->ODMCombineEnablePerState[i][k] = false;
> +					locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>   					if (locals->SwathWidthYSingleDPP[k] <= locals->MaximumSwathWidth[k]) {
>   						locals->NoOfDPP[i][j][k] = 1;
>   						locals->RequiredDPPCLK[i][j][k] = locals->MinDPPCLKUsingSingleDPP[k]
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> index edd098c7eb92..989d83ee3842 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
> @@ -4008,17 +4008,17 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
>   					mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine = mode_lib->vba.PixelClock[k] / 2
>   							* (1 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
>   
> -				locals->ODMCombineEnablePerState[i][k] = false;
> +				locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>   				mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
>   				if (mode_lib->vba.ODMCapability) {
>   					if (locals->PlaneRequiredDISPCLKWithoutODMCombine > MaxMaxDispclkRoundedDown) {
> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>   						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>   					} else if (locals->DSCEnabled[k] && (locals->HActive[k] > DCN20_MAX_DSC_IMAGE_WIDTH)) {
> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>   						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>   					} else if (locals->HActive[k] > DCN20_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] == dm_420) {
> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>   						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>   					}
>   				}
> @@ -4071,7 +4071,7 @@ void dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode
>   				locals->RequiredDISPCLK[i][j] = 0.0;
>   				locals->DISPCLK_DPPCLK_Support[i][j] = true;
>   				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
> -					locals->ODMCombineEnablePerState[i][k] = false;
> +					locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>   					if (locals->SwathWidthYSingleDPP[k] <= locals->MaximumSwathWidth[k]) {
>   						locals->NoOfDPP[i][j][k] = 1;
>   						locals->RequiredDPPCLK[i][j][k] = locals->MinDPPCLKUsingSingleDPP[k]
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> index 1d84ae50311d..b7c2844d0cbe 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
> @@ -4102,17 +4102,17 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   					mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine = mode_lib->vba.PixelClock[k] / 2
>   							* (1 + mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
>   
> -				locals->ODMCombineEnablePerState[i][k] = false;
> +				locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>   				mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
>   				if (mode_lib->vba.ODMCapability) {
>   					if (locals->PlaneRequiredDISPCLKWithoutODMCombine > MaxMaxDispclkRoundedDown) {
> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>   						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>   					} else if (locals->DSCEnabled[k] && (locals->HActive[k] > DCN21_MAX_DSC_IMAGE_WIDTH)) {
> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>   						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>   					} else if (locals->HActive[k] > DCN21_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] == dm_420) {
> -						locals->ODMCombineEnablePerState[i][k] = true;
> +						locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>   						mode_lib->vba.PlaneRequiredDISPCLK = mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>   					}
>   				}
> @@ -4165,7 +4165,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   				locals->RequiredDISPCLK[i][j] = 0.0;
>   				locals->DISPCLK_DPPCLK_Support[i][j] = true;
>   				for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
> -					locals->ODMCombineEnablePerState[i][k] = false;
> +					locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_disabled;
>   					if (locals->SwathWidthYSingleDPP[k] <= locals->MaximumSwathWidth[k]) {
>   						locals->NoOfDPP[i][j][k] = 1;
>   						locals->RequiredDPPCLK[i][j][k] = locals->MinDPPCLKUsingSingleDPP[k]
> @@ -5230,7 +5230,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
>   			mode_lib->vba.ODMCombineEnabled[k] =
>   					locals->ODMCombineEnablePerState[mode_lib->vba.VoltageLevel][k];
>   		} else {
> -			mode_lib->vba.ODMCombineEnabled[k] = false;
> +			mode_lib->vba.ODMCombineEnabled[k] = dm_odm_combine_mode_disabled;
>   		}
>   		mode_lib->vba.DSCEnabled[k] =
>   				locals->RequiresDSC[mode_lib->vba.VoltageLevel][k];
