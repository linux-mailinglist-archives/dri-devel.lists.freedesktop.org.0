Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897CAA1B1AF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 09:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD01210E43A;
	Fri, 24 Jan 2025 08:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="OYTYvei2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3277.qiye.163.com (mail-m3277.qiye.163.com
 [220.197.32.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9BA10E43A
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2025 08:26:53 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 996fdf6b;
 Fri, 24 Jan 2025 16:26:49 +0800 (GMT+08:00)
Message-ID: <c1718efc-85de-4356-aa15-2296a0780b2f@rock-chips.com>
Date: Fri, 24 Jan 2025 16:26:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/14] drm/bridge: analogix_dp: support to get
 &analogix_dp_device.plat_data and &analogix_dp_device.aux
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-7-damon.ding@rock-chips.com>
 <y4yzgkvcmvmphviuoroijaaotd2zdworbs5tfhdxh74kchirk6@dgoqwoksckiz>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <y4yzgkvcmvmphviuoroijaaotd2zdworbs5tfhdxh74kchirk6@dgoqwoksckiz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQklMHlZOSE9DSUxNGh9DQkhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94976bc3a103a3kunm996fdf6b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MU06Mzo4OTIXHiFLMDBKCA82
 F1YwCxZVSlVKTEhMTEtMSUpKT09CVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQ0pLNwY+
DKIM-Signature: a=rsa-sha256;
 b=OYTYvei2Jt0VQn6+xbTs8MyEcoB25VtrUR7lof7WSmjRXwxJEUCpdeds8/R8FPtylnCqhMnxEYfnwWe8lhF4tAhafN/OQ4GNnzOSdhxEy1abwkDbtmF4hEXF63QkK1mmAn5qGwbNW9EOHOAF24wqZRsOfWhLaNR2Zq2sBlFtpoM=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=/8oAL6qTbQWJkj8r9VXN/YNw8cpkGC6GOUpg2XwzQs8=;
 h=date:mime-version:subject:message-id:from;
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

Hi Dmitry,

On 2025/1/23 19:19, Dmitry Baryshkov wrote:
> On Thu, Jan 23, 2025 at 06:07:39PM +0800, Damon Ding wrote:
>> Add two new functions: one to find &analogix_dp_device.plat_data via
>> &drm_dp_aux, and the other to get &analogix_dp_device.aux. Both of them
>> serve for the function of getting panel from DP AUX bus, which is why
>> they are included in a single commit.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 14 ++++++++++++++
>>   include/drm/bridge/analogix_dp.h                   |  4 ++++
>>   2 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index b05f5b9f5258..8251adfce2f9 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -1794,6 +1794,20 @@ int analogix_dp_stop_crc(struct drm_connector *connector)
>>   }
>>   EXPORT_SYMBOL_GPL(analogix_dp_stop_crc);
>>   
>> +struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux)
>> +{
>> +	struct analogix_dp_device *dp = to_dp(aux);
>> +
>> +	return dp->plat_data;
>> +}
>> +EXPORT_SYMBOL_GPL(analogix_dp_aux_to_plat_data);
>> +
>> +struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp)
>> +{
>> +	return &dp->aux;
>> +}
>> +EXPORT_SYMBOL_GPL(analogix_dp_get_aux);
>> +
>>   MODULE_AUTHOR("Jingoo Han <jg1.han@samsung.com>");
>>   MODULE_DESCRIPTION("Analogix DP Core Driver");
>>   MODULE_LICENSE("GPL v2");
>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
>> index 6002c5666031..1b119b547988 100644
>> --- a/include/drm/bridge/analogix_dp.h
>> +++ b/include/drm/bridge/analogix_dp.h
>> @@ -7,6 +7,7 @@
>>   #ifndef _ANALOGIX_DP_H_
>>   #define _ANALOGIX_DP_H_
>>   
>> +#include <drm/display/drm_dp_aux_bus.h>
> 
> Nit: it should be enough to just forward-declare struct drm_dp_aux
> instead.
> 

I will move the header file to the driver of Rockchip Analogix DP and 
just use the forward-declare here in the next version.

>>   #include <drm/drm_crtc.h>
>>   
>>   struct analogix_dp_device;
>> @@ -48,4 +49,7 @@ void analogix_dp_unbind(struct analogix_dp_device *dp);
>>   int analogix_dp_start_crc(struct drm_connector *connector);
>>   int analogix_dp_stop_crc(struct drm_connector *connector);
>>   
>> +struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct drm_dp_aux *aux);
>> +struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp);
>> +
>>   #endif /* _ANALOGIX_DP_H_ */
>> -- 
>> 2.34.1
>>
> 

Best regards,
Damon

