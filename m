Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CA9A8ACBB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 02:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB4D10E030;
	Wed, 16 Apr 2025 00:30:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.b="ZOv3TV2n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from omta38.uswest2.a.cloudfilter.net
 (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374C110E030
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 00:30:38 +0000 (UTC)
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
 by cmsmtp with ESMTPS
 id 4lUxuJvn5Afjw4qffuCU2v; Wed, 16 Apr 2025 00:30:31 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
 id 4qfeulTY5Z6h14qfeuwHUE; Wed, 16 Apr 2025 00:30:30 +0000
X-Authority-Analysis: v=2.4 cv=ergUzZpX c=1 sm=1 tr=0 ts=67fefa26
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=B3fuDwYyW55wTQKIj88FGw==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=UN1T-_8jpz6L_PNgig8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oKBjP8juYoC9d3TnLW3yOOR8GjWDwl8kbWpULuM2oic=; b=ZOv3TV2nYLymDuavxSj0Plctwq
 cl+gt/u9mnaX9R+CgiRs/33/m3ra+AjnxHukcNnk2YrHM6/hXfTsu6V+3OG/OaTvOQ03fP0CGy3AD
 OvXhqNwFtnInRtk78ljEiM0tWzvUysYI+0M7xSuxJhrH7hFd2JKAVi5EwoAEX5zbSinEulAPeZqWh
 sDVzgh05jTDi9sfyqfHOUvOAn314Xbx0eH0G9OSeEOPrsaxrDDRnuq9pLYw/9NxiMiPpQtIUJeMV5
 ovMswtsbAyrAvsX3HNk/ihoZfZj+zI6f96ss1JmZ9EPsN+cu5B+dagInndCHoAVVpnMslRlxOl0TB
 ZIFK4Xmg==;
Received: from [201.172.174.147] (port=43583 helo=[192.168.15.14])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.1)
 (envelope-from <gustavo@embeddedor.com>) id 1u4qfc-00000001dP6-3MLK;
 Tue, 15 Apr 2025 19:30:29 -0500
Message-ID: <217b00f5-d03d-4624-9ba9-d838199ef7b9@embeddedor.com>
Date: Tue, 15 Apr 2025 18:30:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/amd/pm: Avoid multiple
 -Wflex-array-member-not-at-end warnings
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kenneth Feng <kenneth.feng@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Kees Cook <keescook@chromium.org>
References: <Z678TNhCbTk363Tw@kspp>
 <864c7dd5-0deb-4adb-a1cf-c8a809514d7e@embeddedor.com>
Content-Language: en-US
In-Reply-To: <864c7dd5-0deb-4adb-a1cf-c8a809514d7e@embeddedor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.174.147
X-Source-L: No
X-Exim-ID: 1u4qfc-00000001dP6-3MLK
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.14]) [201.172.174.147]:43583
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 23
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMqzB2jdncMFr3UqOYYWsnz10Sj1Gf2hBNcekySGqy/XzaL31i4MiYBA6OjHmEmyJV4HmTehsX5m2pMCGK0eeBU46MhaxG5mVeNacjaRTMqgwH9UDepN
 z8qYqMZkaDtA+55uNsWPlEzKDASL3xOZyi1Ww2rMVF4F6av+TkRvFQCMmuLOerE0aVl5UaKgVVl6hoNVjioDztPxJA9J0aF2RQBxaad2DRnqCnWvlMyOdU+0
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

Hi all,

Friendly ping (second one): who can take this patch, please? 🙂

Thanks!
-Gustavo

On 11/03/25 02:10, Gustavo A. R. Silva wrote:
> Hi all,
> 
> Friendly ping: who can take this, please? :)
> 
> Thanks!
> -- 
> Gustavo
> 
> On 14/02/25 18:48, Gustavo A. R. Silva wrote:
>> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
>> getting ready to enable it, globally.
>>
>> So, in order to avoid ending up with a flexible-array member in the
>> middle of other structs, we use the `struct_group_tagged()` helper
>> to create a new tagged `struct NISLANDS_SMC_SWSTATE_HDR` (and `struct
>> SISLANDS_SMC_SWSTATE_HDR`). This structures group together all the
>> members of the flexible `struct NISLANDS_SMC_SWSTATE` (and `struct
>> SISLANDS_SMC_SWSTATE`) except the flexible array.
>>
>> As a result, the array is effectively separated from the rest of the
>> members without modifying the memory layout of the flexible structure.
>> We then change the type of the middle struct members currently causing
>> trouble from `struct NISLANDS_SMC_SWSTATE` to `struct
>> NISLANDS_SMC_SWSTATE_HDR` (and from `struct SISLANDS_SMC_SWSTATE` to
>> `struct SISLANDS_SMC_SWSTATE_HDR`).
>>
>> We also want to ensure that when new members need to be added to the
>> flexible structure, they are always included within the newly created
>> tagged struct. For this, we use `static_assert()`. This ensures that
>> the memory layout for both the flexible structure and the new tagged
>> struct is the same after any changes.
>>
>> This approach avoids having to implement `struct NISLANDS_SMC_SWSTATE_HDR`
>> (and `struct SISLANDS_SMC_SWSTATE_HDR`) as a completely separate structure,
>> thus preventing having to maintain two independent but basically identical
>> structures, closing the door to potential bugs in the future.
>>
>> We also use `container_of()` whenever we need to retrieve a pointer to
>> the flexible structure, through which we can access the flexible-array
>> member, if necessary.
>>
>> So, with this changes, fix the following warnings:
>>
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/sislands_smc.h:218:49: warning: structure containing a flexible array member is not at the end of another 
>> structure [-Wflex-array-member-not-at-end]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.h:819:41: warning: structure containing a flexible array member is not at the end of another structure [- 
>> Wflex-array-member-not-at-end]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.h:818:41: warning: structure containing a flexible array member is not at the end of another structure [- 
>> Wflex-array-member-not-at-end]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.h:817:41: warning: structure containing a flexible array member is not at the end of another structure [- 
>> Wflex-array-member-not-at-end]
>> drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.h:816:41: warning: structure containing a flexible array member is not at the end of another structure [- 
>> Wflex-array-member-not-at-end]
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>> ---
>>   drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c    |  7 ++++--
>>   drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.h    | 23 +++++++++++--------
>>   .../gpu/drm/amd/pm/legacy-dpm/sislands_smc.h  | 15 ++++++++----
>>   3 files changed, 29 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
>> index a87dcf0974bc..2c9d473d122f 100644
>> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
>> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
>> @@ -5234,7 +5234,8 @@ static int si_init_smc_table(struct amdgpu_device *adev)
>>       table->driverState.flags = table->initialState.flags;
>>       table->driverState.levelCount = table->initialState.levelCount;
>> -    table->driverState.levels[0] = table->initialState.level;
>> +    container_of(&table->driverState, SISLANDS_SMC_SWSTATE, __hdr)->levels[0] =
>> +                                table->initialState.level;
>>       ret = si_do_program_memory_timing_parameters(adev, amdgpu_boot_state,
>>                                SISLANDS_INITIAL_STATE_ARB_INDEX);
>> @@ -5755,7 +5756,9 @@ static int si_upload_sw_state(struct amdgpu_device *adev,
>>       int ret;
>>       u32 address = si_pi->state_table_start +
>>           offsetof(SISLANDS_SMC_STATETABLE, driverState);
>> -    SISLANDS_SMC_SWSTATE *smc_state = &si_pi->smc_statetable.driverState;
>> +    SISLANDS_SMC_SWSTATE *smc_state =
>> +        container_of(&si_pi->smc_statetable.driverState,
>> +                 SISLANDS_SMC_SWSTATE, __hdr);
>>       size_t state_size = struct_size(smc_state, levels,
>>                       new_state->performance_level_count);
>>       memset(smc_state, 0, state_size);
>> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.h b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.h
>> index 11cb7874a6bb..62530f89ebdf 100644
>> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.h
>> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.h
>> @@ -784,12 +784,17 @@ typedef struct NISLANDS_SMC_HW_PERFORMANCE_LEVEL NISLANDS_SMC_HW_PERFORMANCE_LEV
>>   struct NISLANDS_SMC_SWSTATE
>>   {
>> -    uint8_t                             flags;
>> -    uint8_t                             levelCount;
>> -    uint8_t                             padding2;
>> -    uint8_t                             padding3;
>> -    NISLANDS_SMC_HW_PERFORMANCE_LEVEL   levels[];
>> +    /* New members MUST be added within the struct_group() macro below. */
>> +    struct_group_tagged(NISLANDS_SMC_SWSTATE_HDR, __hdr,
>> +        uint8_t                             flags;
>> +        uint8_t                             levelCount;
>> +        uint8_t                             padding2;
>> +        uint8_t                             padding3;
>> +    );
>> +    NISLANDS_SMC_HW_PERFORMANCE_LEVEL   levels[];
>>   };
>> +static_assert(offsetof(struct NISLANDS_SMC_SWSTATE, levels) == sizeof(struct NISLANDS_SMC_SWSTATE_HDR),
>> +          "struct member likely outside of struct_group_tagged()");
>>   typedef struct NISLANDS_SMC_SWSTATE NISLANDS_SMC_SWSTATE;
>> @@ -813,10 +818,10 @@ struct NISLANDS_SMC_STATETABLE
>>       uint32_t                            lowSMIO[NISLANDS_MAX_NO_VREG_STEPS];
>>       NISLANDS_SMC_VOLTAGEMASKTABLE       voltageMaskTable;
>>       PP_NIslands_DPM2Parameters          dpm2Params;
>> -    NISLANDS_SMC_SWSTATE                initialState;
>> -    NISLANDS_SMC_SWSTATE                ACPIState;
>> -    NISLANDS_SMC_SWSTATE                ULVState;
>> -    NISLANDS_SMC_SWSTATE                driverState;
>> +    struct NISLANDS_SMC_SWSTATE_HDR        initialState;
>> +    struct NISLANDS_SMC_SWSTATE_HDR        ACPIState;
>> +    struct NISLANDS_SMC_SWSTATE_HDR        ULVState;
>> +    struct NISLANDS_SMC_SWSTATE_HDR        driverState;
>>       NISLANDS_SMC_HW_PERFORMANCE_LEVEL   dpmLevels[NISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE - 1];
>>   };
>> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h b/drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h
>> index 90ec411c5029..1711e3e35e80 100644
>> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h
>> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/sislands_smc.h
>> @@ -172,12 +172,17 @@ struct SISLANDS_SMC_HW_PERFORMANCE_LEVEL {
>>   typedef struct SISLANDS_SMC_HW_PERFORMANCE_LEVEL SISLANDS_SMC_HW_PERFORMANCE_LEVEL;
>>   struct SISLANDS_SMC_SWSTATE {
>> -    uint8_t                             flags;
>> -    uint8_t                             levelCount;
>> -    uint8_t                             padding2;
>> -    uint8_t                             padding3;
>> +    /* New members MUST be added within the struct_group() macro below. */
>> +    struct_group_tagged(SISLANDS_SMC_SWSTATE_HDR, __hdr,
>> +        uint8_t                             flags;
>> +        uint8_t                             levelCount;
>> +        uint8_t                             padding2;
>> +        uint8_t                             padding3;
>> +    );
>>       SISLANDS_SMC_HW_PERFORMANCE_LEVEL   levels[];
>>   };
>> +static_assert(offsetof(struct SISLANDS_SMC_SWSTATE, levels) == sizeof(struct SISLANDS_SMC_SWSTATE_HDR),
>> +          "struct member likely outside of struct_group_tagged()");
>>   typedef struct SISLANDS_SMC_SWSTATE SISLANDS_SMC_SWSTATE;
>> @@ -215,7 +220,7 @@ struct SISLANDS_SMC_STATETABLE {
>>       struct SISLANDS_SMC_SWSTATE_SINGLE    initialState;
>>       struct SISLANDS_SMC_SWSTATE_SINGLE    ACPIState;
>>       struct SISLANDS_SMC_SWSTATE_SINGLE    ULVState;
>> -    SISLANDS_SMC_SWSTATE            driverState;
>> +    struct SISLANDS_SMC_SWSTATE_HDR        driverState;
>>       SISLANDS_SMC_HW_PERFORMANCE_LEVEL    dpmLevels[SISLANDS_MAX_SMC_PERFORMANCE_LEVELS_PER_SWSTATE];
>>   };
> 

