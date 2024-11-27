Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346C29DAD6A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 19:53:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3834A10E072;
	Wed, 27 Nov 2024 18:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ESDYRkZJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com
 [95.215.58.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4AB10E072
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 18:53:41 +0000 (UTC)
Message-ID: <ae294204-1521-48bd-ad05-83f64b54e784@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1732733619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eFfZMvUEv5H/XPgbo+Swk3LmEVZvK0Snci/xhRPwRFc=;
 b=ESDYRkZJUvCkK60/QUwqIWQ3oz3ghhK1m/i3bF4XOuPCWuCq73YwaSduoNI5Cu8QeNku2Q
 GCH75N5dPvxT9VeiANqELTa2QMcD3k+Ss5z9B3j4b9PPlfq0IThm4bjStmm+DAlbk3ZgI4
 lkhnJw3PJxrXwo7DKHFkhSnt+JzGnYg=
Date: Thu, 28 Nov 2024 02:53:29 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] drm/hibmc: Drop dependency on Aarch86
To: Thomas Zimmermann <tzimmermann@suse.de>, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, kong.kongxinwei@hisilicon.com,
 sumit.semwal@linaro.org, yongqin.liu@linaro.org, jstultz@google.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20241127133732.470414-1-tzimmermann@suse.de>
 <3f503233-394e-49de-9ad1-c6c4ff5fb085@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <3f503233-394e-49de-9ad1-c6c4ff5fb085@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/11/27 21:38, Thomas Zimmermann wrote:
> s/Aarch86/AArch64
>

Or just 'arm64'.


>
> Am 27.11.24 um 14:37 schrieb Thomas Zimmermann:
>> There exists x86-based hardware with HiSilicon BMC chipsets. This
>> driver works well on these systems. Drop the dependency on ARM64.
>>
>> Tested on RH1288 V3.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>


Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>


>> ---
>>   drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/Kconfig 
>> b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
>> index 80253d39664a..93b8d32e3be1 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/Kconfig
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/Kconfig
>> @@ -1,7 +1,7 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   config DRM_HISI_HIBMC
>>       tristate "DRM Support for Hisilicon Hibmc"
>> -    depends on DRM && PCI && (ARM64 || COMPILE_TEST)
>> +    depends on DRM && PCI
>>       depends on MMU
>>       select DRM_CLIENT_SELECTION
>>       select DRM_KMS_HELPER
>
-- 
Best regards,
Sui

