Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A52B05BDDBD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 09:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A34B10E2F5;
	Tue, 20 Sep 2022 07:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE87210E562;
 Mon, 19 Sep 2022 07:59:41 +0000 (UTC)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MWH6G2sFXzlW0P;
 Mon, 19 Sep 2022 15:55:34 +0800 (CST)
Received: from [10.174.179.163] (10.174.179.163) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 15:59:37 +0800
Message-ID: <72469bf0-4f57-79c6-bfd6-d37030ba1753@huawei.com>
Date: Mon, 19 Sep 2022 15:59:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] gpu: dc: fix enum conversion in display_mode_vba
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <alexander.deucher@amd.com>, <Xinhui.Pan@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <Nevenko.Stupar@amd.com>, <Pavle.Kotarac@amd.com>,
 <aric.cyr@amd.com>
References: <20220919014125.3295213-1-zengheng4@huawei.com>
 <9b7f030f-eedf-9a14-b442-6afa0c67c5f7@amd.com>
From: Zeng Heng <zengheng4@huawei.com>
In-Reply-To: <9b7f030f-eedf-9a14-b442-6afa0c67c5f7@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.163]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 20 Sep 2022 07:03:14 +0000
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

the correct prefix is "drm/amdgpu: ...."

Got it, and I would notice that point at the next letter.


在 2022/9/19 15:44, Christian König 写道:
> Am 19.09.22 um 03:41 schrieb Zeng Heng:
>> Fix below compile warning when open enum-conversion
>> option check (compiled with -Wenum-conversion):
>>
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c: 
>>
>> In function ‘dml20_ModeSupportAndSystemConfigurationFull’:
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3900:44: 
>>
>> error: implicit conversion from ‘enum <anonymous>’ to ‘enum 
>> odm_combine_mode’ [-Werror=enum-conversion]
>>   3900 |     locals->ODMCombineEnablePerState[i][k] = false;
>>        |                                            ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3904:46: 
>>
>> error: implicit conversion from ‘enum <anonymous>’ to ‘enum 
>> odm_combine_mode’ [-Werror=enum-conversion]
>>   3904 |       locals->ODMCombineEnablePerState[i][k] = true;
>>        |                                              ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3907:46: 
>>
>> error: implicit conversion from ‘enum <anonymous>’ to ‘enum 
>> odm_combine_mode’ [-Werror=enum-conversion]
>>   3907 |       locals->ODMCombineEnablePerState[i][k] = true;
>>        |                                              ^
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:3960:45: 
>>
>> error: implicit conversion from ‘enum <anonymous>’ to ‘enum 
>> odm_combine_mode’ [-Werror=enum-conversion]
>>   3960 |      locals->ODMCombineEnablePerState[i][k] = false;
>>
>> Use the proper value from the right enumerated type,
>> dm_odm_combine_mode_disabled & dm_odm_combine_mode_2to1,
>> so there is no more implicit conversion.
>>
>> The numerical values of dm_odm_combine_mode_disabled
>> & false and dm_odm_combine_mode_2to1 & true
>> happen to be the same, so there is no change in
>> behavior.
>
> In the subject line the correct prefix is "drm/amdgpu: ....", but 
> apart from that looks good to me as well.
>
> But our DC team has to take a closer look.
>
> Thanks,
> Christian.
>
>>
>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>> ---
>>   .../amd/display/dc/dml/dcn20/display_mode_vba_20.c   |  8 ++++----
>>   .../amd/display/dc/dml/dcn20/display_mode_vba_20v2.c | 10 +++++-----
>>   .../amd/display/dc/dml/dcn21/display_mode_vba_21.c   | 12 ++++++------
>>   3 files changed, 15 insertions(+), 15 deletions(-)
>>
>> diff --git 
>> a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c 
>> b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
>> index d3b5b6fedf04..6266b0788387 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
>> @@ -3897,14 +3897,14 @@ void 
>> dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib 
>> *mode_l
>> mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine = 
>> mode_lib->vba.PixelClock[k] / 2
>>                               * (1 + 
>> mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
>>   -                locals->ODMCombineEnablePerState[i][k] = false;
>> +                locals->ODMCombineEnablePerState[i][k] = 
>> dm_odm_combine_mode_disabled;
>>                   mode_lib->vba.PlaneRequiredDISPCLK = 
>> mode_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
>>                   if (mode_lib->vba.ODMCapability) {
>>                       if 
>> (locals->PlaneRequiredDISPCLKWithoutODMCombine > 
>> mode_lib->vba.MaxDispclkRoundedDownToDFSGranularity) {
>> - locals->ODMCombineEnablePerState[i][k] = true;
>> + locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>>                           mode_lib->vba.PlaneRequiredDISPCLK = 
>> mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>>                       } else if (locals->HActive[k] > 
>> DCN20_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] == dm_420) {
>> - locals->ODMCombineEnablePerState[i][k] = true;
>> + locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>>                           mode_lib->vba.PlaneRequiredDISPCLK = 
>> mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>>                       }
>>                   }
>> @@ -3957,7 +3957,7 @@ void 
>> dml20_ModeSupportAndSystemConfigurationFull(struct display_mode_lib 
>> *mode_l
>>                   locals->RequiredDISPCLK[i][j] = 0.0;
>>                   locals->DISPCLK_DPPCLK_Support[i][j] = true;
>>                   for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes 
>> - 1; k++) {
>> -                    locals->ODMCombineEnablePerState[i][k] = false;
>> +                    locals->ODMCombineEnablePerState[i][k] = 
>> dm_odm_combine_mode_disabled;
>>                       if (locals->SwathWidthYSingleDPP[k] <= 
>> locals->MaximumSwathWidth[k]) {
>>                           locals->NoOfDPP[i][j][k] = 1;
>>                           locals->RequiredDPPCLK[i][j][k] = 
>> locals->MinDPPCLKUsingSingleDPP[k]
>> diff --git 
>> a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c 
>> b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
>> index edd098c7eb92..989d83ee3842 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
>> @@ -4008,17 +4008,17 @@ void 
>> dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib 
>> *mode
>> mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine = 
>> mode_lib->vba.PixelClock[k] / 2
>>                               * (1 + 
>> mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
>>   -                locals->ODMCombineEnablePerState[i][k] = false;
>> +                locals->ODMCombineEnablePerState[i][k] = 
>> dm_odm_combine_mode_disabled;
>>                   mode_lib->vba.PlaneRequiredDISPCLK = 
>> mode_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
>>                   if (mode_lib->vba.ODMCapability) {
>>                       if 
>> (locals->PlaneRequiredDISPCLKWithoutODMCombine > 
>> MaxMaxDispclkRoundedDown) {
>> - locals->ODMCombineEnablePerState[i][k] = true;
>> + locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>>                           mode_lib->vba.PlaneRequiredDISPCLK = 
>> mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>>                       } else if (locals->DSCEnabled[k] && 
>> (locals->HActive[k] > DCN20_MAX_DSC_IMAGE_WIDTH)) {
>> - locals->ODMCombineEnablePerState[i][k] = true;
>> + locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>>                           mode_lib->vba.PlaneRequiredDISPCLK = 
>> mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>>                       } else if (locals->HActive[k] > 
>> DCN20_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] == dm_420) {
>> - locals->ODMCombineEnablePerState[i][k] = true;
>> + locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>>                           mode_lib->vba.PlaneRequiredDISPCLK = 
>> mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>>                       }
>>                   }
>> @@ -4071,7 +4071,7 @@ void 
>> dml20v2_ModeSupportAndSystemConfigurationFull(struct display_mode_lib 
>> *mode
>>                   locals->RequiredDISPCLK[i][j] = 0.0;
>>                   locals->DISPCLK_DPPCLK_Support[i][j] = true;
>>                   for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes 
>> - 1; k++) {
>> -                    locals->ODMCombineEnablePerState[i][k] = false;
>> +                    locals->ODMCombineEnablePerState[i][k] = 
>> dm_odm_combine_mode_disabled;
>>                       if (locals->SwathWidthYSingleDPP[k] <= 
>> locals->MaximumSwathWidth[k]) {
>>                           locals->NoOfDPP[i][j][k] = 1;
>>                           locals->RequiredDPPCLK[i][j][k] = 
>> locals->MinDPPCLKUsingSingleDPP[k]
>> diff --git 
>> a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c 
>> b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
>> index d40d32e380f4..f15e82492381 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
>> @@ -4102,17 +4102,17 @@ void 
>> dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib 
>> *mode_l
>> mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine = 
>> mode_lib->vba.PixelClock[k] / 2
>>                               * (1 + 
>> mode_lib->vba.DISPCLKDPPCLKDSCCLKDownSpreading / 100.0);
>>   -                locals->ODMCombineEnablePerState[i][k] = false;
>> +                locals->ODMCombineEnablePerState[i][k] = 
>> dm_odm_combine_mode_disabled;
>>                   mode_lib->vba.PlaneRequiredDISPCLK = 
>> mode_lib->vba.PlaneRequiredDISPCLKWithoutODMCombine;
>>                   if (mode_lib->vba.ODMCapability) {
>>                       if 
>> (locals->PlaneRequiredDISPCLKWithoutODMCombine > 
>> MaxMaxDispclkRoundedDown) {
>> - locals->ODMCombineEnablePerState[i][k] = true;
>> + locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>>                           mode_lib->vba.PlaneRequiredDISPCLK = 
>> mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>>                       } else if (locals->DSCEnabled[k] && 
>> (locals->HActive[k] > DCN21_MAX_DSC_IMAGE_WIDTH)) {
>> - locals->ODMCombineEnablePerState[i][k] = true;
>> + locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>>                           mode_lib->vba.PlaneRequiredDISPCLK = 
>> mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>>                       } else if (locals->HActive[k] > 
>> DCN21_MAX_420_IMAGE_WIDTH && locals->OutputFormat[k] == dm_420) {
>> - locals->ODMCombineEnablePerState[i][k] = true;
>> + locals->ODMCombineEnablePerState[i][k] = dm_odm_combine_mode_2to1;
>>                           mode_lib->vba.PlaneRequiredDISPCLK = 
>> mode_lib->vba.PlaneRequiredDISPCLKWithODMCombine;
>>                       }
>>                   }
>> @@ -4165,7 +4165,7 @@ void 
>> dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib 
>> *mode_l
>>                   locals->RequiredDISPCLK[i][j] = 0.0;
>>                   locals->DISPCLK_DPPCLK_Support[i][j] = true;
>>                   for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes 
>> - 1; k++) {
>> -                    locals->ODMCombineEnablePerState[i][k] = false;
>> +                    locals->ODMCombineEnablePerState[i][k] = 
>> dm_odm_combine_mode_disabled;
>>                       if (locals->SwathWidthYSingleDPP[k] <= 
>> locals->MaximumSwathWidth[k]) {
>>                           locals->NoOfDPP[i][j][k] = 1;
>>                           locals->RequiredDPPCLK[i][j][k] = 
>> locals->MinDPPCLKUsingSingleDPP[k]
>> @@ -5230,7 +5230,7 @@ void 
>> dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib 
>> *mode_l
>>               mode_lib->vba.ODMCombineEnabled[k] =
>> locals->ODMCombineEnablePerState[mode_lib->vba.VoltageLevel][k];
>>           } else {
>> -            mode_lib->vba.ODMCombineEnabled[k] = false;
>> +            mode_lib->vba.ODMCombineEnabled[k] = 
>> dm_odm_combine_mode_disabled;
>>           }
>>           mode_lib->vba.DSCEnabled[k] =
>> locals->RequiresDSC[mode_lib->vba.VoltageLevel][k];
>
