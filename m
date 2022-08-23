Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3210059CD24
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 02:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9C0A7A6A;
	Tue, 23 Aug 2022 00:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 340 seconds by postgrey-1.36 at gabe;
 Tue, 23 Aug 2022 00:21:21 UTC
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74FDD978E5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 00:21:21 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27N0FV6k107065;
 Mon, 22 Aug 2022 19:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1661213731;
 bh=1pvEIPM5APQYIyVk9xEPtDo5fZUVbe90+kCOuMJEMmk=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=Awm180sKAWTrh07acCCEnY52GRYqhnpHRsphg0OJ+jnrF0uHtcBpv532TesA+SuBs
 Xjh56JsdQ9ChlSkV7s58fjW0ZE6SovCBUTMjQKO25fNoSV7CrUR1Gm7QBF5e5tVagt
 5o7ciiVUgIxAyK5vFIZhnb2HcwHEMDCmGaeCP0gM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27N0FVRc046189
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Aug 2022 19:15:31 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 22
 Aug 2022 19:15:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 22 Aug 2022 19:15:30 -0500
Received: from [10.250.35.81] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27N0FUmo067307;
 Mon, 22 Aug 2022 19:15:30 -0500
Message-ID: <c09c1ff3-5be4-71e0-ba76-d96da1e49501@ti.com>
Date: Mon, 22 Aug 2022 19:15:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm: Move radeon and amdgpu Kconfig options into their
 directories
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20220823000111.9765-1-afd@ti.com>
 <a5f03c19-faeb-9a64-a214-8f6a0552e8dc@infradead.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <a5f03c19-faeb-9a64-a214-8f6a0552e8dc@infradead.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

On 8/22/22 7:06 PM, Randy Dunlap wrote:
> Hi--
> 
> On 8/22/22 17:01, Andrew Davis wrote:
>> Most Kconfig options to enable a driver are in the Kconfig file
>> inside the relevant directory, move these two to the same.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   drivers/gpu/drm/Kconfig            | 42 ------------------------------
>>   drivers/gpu/drm/amd/amdgpu/Kconfig | 22 ++++++++++++++++
>>   drivers/gpu/drm/radeon/Kconfig     | 22 ++++++++++++++++
>>   3 files changed, 44 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 6c2256e8474b..24fa9ccd92a4 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -234,50 +234,8 @@ source "drivers/gpu/drm/i2c/Kconfig"
>>   
>>   source "drivers/gpu/drm/arm/Kconfig"
>>   
>> -config DRM_RADEON
>> -	tristate "ATI Radeon"
>> -	depends on DRM && PCI && MMU
>> -	depends on AGP || !AGP
>> -	select FW_LOADER
>> -	select DRM_DISPLAY_DP_HELPER
>> -	select DRM_DISPLAY_HELPER
>> -        select DRM_KMS_HELPER
>> -        select DRM_TTM
>> -	select DRM_TTM_HELPER
>> -	select POWER_SUPPLY
>> -	select HWMON
>> -	select BACKLIGHT_CLASS_DEVICE
>> -	select INTERVAL_TREE
>> -	help
>> -	  Choose this option if you have an ATI Radeon graphics card.  There
>> -	  are both PCI and AGP versions.  You don't need to choose this to
>> -	  run the Radeon in plain VGA mode.
>> -
>> -	  If M is selected, the module will be called radeon.
>> -
>>   source "drivers/gpu/drm/radeon/Kconfig"
>>   
>> -config DRM_AMDGPU
>> -	tristate "AMD GPU"
>> -	depends on DRM && PCI && MMU
>> -	select FW_LOADER
>> -	select DRM_DISPLAY_DP_HELPER
>> -	select DRM_DISPLAY_HDMI_HELPER
>> -	select DRM_DISPLAY_HELPER
>> -	select DRM_KMS_HELPER
>> -	select DRM_SCHED
>> -	select DRM_TTM
>> -	select DRM_TTM_HELPER
>> -	select POWER_SUPPLY
>> -	select HWMON
>> -	select BACKLIGHT_CLASS_DEVICE
>> -	select INTERVAL_TREE
>> -	select DRM_BUDDY
>> -	help
>> -	  Choose this option if you have a recent AMD Radeon graphics card.
>> -
>> -	  If M is selected, the module will be called amdgpu.
>> -
>>   source "drivers/gpu/drm/amd/amdgpu/Kconfig"
>>   
>>   source "drivers/gpu/drm/nouveau/Kconfig"
>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
>> index 7777d55275de..36b1206124cf 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
>> @@ -1,4 +1,26 @@
>>   # SPDX-License-Identifier: MIT
>> +
>> +config DRM_AMDGPU
>> +	tristate "AMD GPU"
>> +	depends on DRM && PCI && MMU
>> +	select FW_LOADER
>> +	select DRM_DISPLAY_DP_HELPER
>> +	select DRM_DISPLAY_HDMI_HELPER
>> +	select DRM_DISPLAY_HELPER
>> +	select DRM_KMS_HELPER
>> +	select DRM_SCHED
>> +	select DRM_TTM
>> +	select DRM_TTM_HELPER
>> +	select POWER_SUPPLY
>> +	select HWMON
>> +	select BACKLIGHT_CLASS_DEVICE
>> +	select INTERVAL_TREE
>> +	select DRM_BUDDY
>> +	help
>> +	  Choose this option if you have a recent AMD Radeon graphics card.
>> +
>> +	  If M is selected, the module will be called amdgpu.
>> +
>>   config DRM_AMDGPU_SI
>>   	bool "Enable amdgpu support for SI parts"
>>   	depends on DRM_AMDGPU
>> diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
>> index 52819e7f1fca..3248d12c562d 100644
>> --- a/drivers/gpu/drm/radeon/Kconfig
>> +++ b/drivers/gpu/drm/radeon/Kconfig
>> @@ -1,4 +1,26 @@
>>   # SPDX-License-Identifier: MIT
>> +
>> +config DRM_RADEON
>> +	tristate "ATI Radeon"
>> +	depends on DRM && PCI && MMU
>> +	depends on AGP || !AGP
>> +	select FW_LOADER
>> +	select DRM_DISPLAY_DP_HELPER
>> +	select DRM_DISPLAY_HELPER
>> +        select DRM_KMS_HELPER
>> +        select DRM_TTM
> 
> Would you change those 2 lines above to use one tab + 2 spaces
> for indentation, please?
> 


Sure, I just copy/paste exactly as they are in the top level Kconfig,
white-space issues and all, to make it easy to see that nothing was changed.

I can fix the indent issue in a followup patch if that work better.
Whichever works better.

Andrew


>> +	select DRM_TTM_HELPER
>> +	select POWER_SUPPLY
>> +	select HWMON
>> +	select BACKLIGHT_CLASS_DEVICE
>> +	select INTERVAL_TREE
>> +	help
>> +	  Choose this option if you have an ATI Radeon graphics card.  There
>> +	  are both PCI and AGP versions.  You don't need to choose this to
>> +	  run the Radeon in plain VGA mode.
>> +
>> +	  If M is selected, the module will be called radeon.
>> +
>>   config DRM_RADEON_USERPTR
>>   	bool "Always enable userptr support"
>>   	depends on DRM_RADEON
> 
