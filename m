Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B61BA4EBADF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 08:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FB010E659;
	Wed, 30 Mar 2022 06:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88EC10E659;
 Wed, 30 Mar 2022 06:36:24 +0000 (UTC)
Received: from [192.168.0.4] (unknown [95.90.232.238])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id F417A61EA192A;
 Wed, 30 Mar 2022 08:36:22 +0200 (CEST)
Message-ID: <7c7ec347-4372-31ac-94ed-5d20602c6ce2@molgen.mpg.de>
Date: Wed, 30 Mar 2022 08:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] drm/amdgpu: fix that issue that the number of the crtc
 of the 3250c is not correct
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Ryan Lin <tsung-hua.lin@amd.com>
References: <20220127081237.13903-1-Tsung-Hua.Lin@amd.com>
 <20220330024643.162230-1-tsung-hua.lin@amd.com>
 <de559e34-3b56-a3d5-cd7a-89bc8f5528d7@molgen.mpg.de>
In-Reply-To: <de559e34-3b56-a3d5-cd7a-89bc8f5528d7@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>,
 leon.li@amd.com, Louis Li <ching-shih.li@amd.corp-partner.google.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 amd-gfx@lists.freedesktop.org, Drew Davenport <ddavenport@chromium.org>,
 =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Cc: Remove undeliverable Chun Ming Zhou <mailto:David1.Zhou@amd.com>]

Am 30.03.22 um 08:34 schrieb Paul Menzel:
> Dear Tsung-Hua,
> 
> 
> Thank you for your patch.
> 
> Am 30.03.22 um 04:46 schrieb Ryan Lin:
> 
> The commit message summary is quite long and confusing. Maybe:
> 
> Use 3 CRTC for 3250c to get internal display working
> 
>> [Why]
>> External displays take priority over internal display when there are 
>> fewer
>> display controllers than displays.
> 
> This causes the internal display to not work on the Chromebook google/zork.
> 
>> [How]
>> The root cause is because of that number of the crtc is not correct.
> 
> The root cause is the incorrect number of four configured CRTCs.
> 
>> The number of the crtc on the 3250c is 3, but on the 3500c is 4.
>> On the source code, we can see that number of the crtc has been fixed 
>> at 4.
>> Needs to set the num_crtc to 3 for 3250c platform.
> 
> Please do not wrap lines after each sentence, and use a text width of 75 
> characters.
> 
>> v2:
>>     - remove unnecessary comments and Id
>>
>> Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>
>>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 40c91b448f7da..455a2c45e8cda 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -2738,9 +2738,15 @@ static int dm_early_init(void *handle)
>>           break;
>>   #if defined(CONFIG_DRM_AMD_DC_DCN1_0)
>>       case CHIP_RAVEN:
>> -        adev->mode_info.num_crtc = 4;
>> -        adev->mode_info.num_hpd = 4;
>> -        adev->mode_info.num_dig = 4;
>> +        if (adev->rev_id >= 8) {
> 
> Is there some define for that number? Maybe add a comment, that it’s for 
> 3250c?
> 
> 
> Kind regards,
> 
> Paul
> 
> 
>> +            adev->mode_info.num_crtc = 3;
>> +            adev->mode_info.num_hpd = 3;
>> +            adev->mode_info.num_dig = 3;
>> +        } else {
>> +            adev->mode_info.num_crtc = 4;
>> +            adev->mode_info.num_hpd = 4;
>> +            adev->mode_info.num_dig = 4;
>> +        }
>>           break;
>>   #endif
>>   #if defined(CONFIG_DRM_AMD_DC_DCN2_0)
