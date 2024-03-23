Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D108877E7
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 11:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8018A10E24B;
	Sat, 23 Mar 2024 10:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="eiaz3UiV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 454 seconds by postgrey-1.36 at gabe;
 Sat, 23 Mar 2024 10:18:18 UTC
Received: from mail-m24125.xmail.ntesmail.com (mail-m24125.xmail.ntesmail.com
 [45.195.24.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F2C10E24B
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 10:18:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=eiaz3UiV0uPVF2QFBinLXWWWvz2WaL40BQXlEdwQrk7Q6yHgnLRWJnPTMAynR0C6BcmSXnBxv6ublAjKBN5I1Yyz8/PdCga067rseDQQTELTkIAzb98hELqkyHWPeDf3DAbDNRXfST+X6BMOTspz4eOj9iC4vmjoFMr6Dkihoow=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
 bh=F4JueNQpmRpoZ37/dDuh/QnjrtryA6hyAuvn6ICYLVY=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTPA id 1CDA884017E;
 Sat, 23 Mar 2024 18:10:35 +0800 (CST)
Message-ID: <38d576a3-0f4e-4410-aa9b-74e06e1fceb1@rock-chips.com>
Date: Sat, 23 Mar 2024 18:10:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rockchip: vop2: Remove AR30 and AB30 format support
To: Heiko Stuebner <heiko@sntech.de>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: heiko@sntech.de, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20240304100952.3592984-1-andyshrk@163.com>
 <ZeWlAWLvlW3NdKS_@pengutronix.de>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <ZeWlAWLvlW3NdKS_@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx5OSFYZSkIaShodGBlJGE5VEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk5MSUpJVUpLS1VKQl
 kG
X-HM-Tid: 0a8e6aca6f4c03a4kunm1cda884017e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pgg6Ghw4HjMVEgg*Ii5OUSlI
 Ci4aFBVVSlVKTEpKSkNDTUhOTENNVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSU1OSzcG
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

Hi Heiko,

Could you please  to take a look at this patch?

On 3/4/24 18:40, Sascha Hauer wrote:
> On Mon, Mar 04, 2024 at 06:09:52PM +0800, Andy Yan wrote:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> The Alpha blending for 30 bit RGB/BGR are not
>> functioning properly for rk3568/rk3588, so remove
>> it from the format list.
>>
>> Fixes: bfd8a5c228fa ("drm/rockchip: vop2: Add more supported 10bit formats")
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>> ---
> 
> Acked-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> Sascha
> 
>>
>>   drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
>> index 48170694ac6b..18efb3fe1c00 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
>> @@ -17,9 +17,7 @@
>>   
>>   static const uint32_t formats_cluster[] = {
>>   	DRM_FORMAT_XRGB2101010,
>> -	DRM_FORMAT_ARGB2101010,
>>   	DRM_FORMAT_XBGR2101010,
>> -	DRM_FORMAT_ABGR2101010,
>>   	DRM_FORMAT_XRGB8888,
>>   	DRM_FORMAT_ARGB8888,
>>   	DRM_FORMAT_XBGR8888,
>> -- 
>> 2.34.1
>>
>>
> 
