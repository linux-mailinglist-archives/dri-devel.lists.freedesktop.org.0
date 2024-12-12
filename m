Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3439EE21E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 10:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2A810E05D;
	Thu, 12 Dec 2024 09:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Bm2MQOWk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m127106.qiye.163.com (mail-m127106.qiye.163.com
 [115.236.127.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E1B10E05D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 09:00:26 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 587970be;
 Thu, 12 Dec 2024 16:55:19 +0800 (GMT+08:00)
Message-ID: <f6fd6efe-73bb-4aa2-a075-9a03c39951df@rock-chips.com>
Date: Thu, 12 Dec 2024 16:55:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/10] drm/bridge: analogix_dp: Add support for phy
 configuration.
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, conor+dt@kernel.org,
 algea.cao@rock-chips.com, rfoss@kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, kever.yang@rock-chips.com,
 linux-rockchip@lists.infradead.org, vkoul@kernel.org,
 andy.yan@rock-chips.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
References: <20241127075157.856029-1-damon.ding@rock-chips.com>
 <20241127075157.856029-7-damon.ding@rock-chips.com>
 <twhosvpoyafo472gqsblpvxmuewe2lkqufxabp2q7o636uinfm@unzyfv2pchqn>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <twhosvpoyafo472gqsblpvxmuewe2lkqufxabp2q7o636uinfm@unzyfv2pchqn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk1DT1YYHk1DQkkaHUtOGUpWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93ba14685803a3kunm587970be
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MzI6Qjo4FTIPOjQOCTcYCB0h
 DS8wCT9VSlVKTEhIQkJITElKQ09MVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFMTE1JNwY+
DKIM-Signature: a=rsa-sha256;
 b=Bm2MQOWkXjx8Pf9F3W4LsD7hTW78m7eB7oq2XDcJbwtsVGle3yaMemLVAEN+zVoWZx1sSiKi07Y1Rcxs8X+7lH/hi9FsqJO5eqOVWzogYs3zRK3doeb9Kv0vTMPvpyP88zoti2YuAe7NHqy+LN/uRRr11+USss2pTU7MU1cFiqk=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=FoVNNZh4L/GMNtlxTr6ggp+PnIEfUziJ14W8Sk9sycA=;
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

On 2024/11/30 16:53, Dmitry Baryshkov wrote:
> On Wed, Nov 27, 2024 at 03:51:53PM +0800, Damon Ding wrote:
>> Add support to configurate link rate, lane count, voltage swing and
>> pre-emphasis with phy_configure(). It is helpful in application scenarios
>> where analogix controller is mixed with the phy of other vendors.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../drm/bridge/analogix/analogix_dp_core.c    |  4 +-
>>   .../drm/bridge/analogix/analogix_dp_core.h    |  2 +
>>   .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 90 +++++++++++++++++++
>>   3 files changed, 94 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 6f10d88a34c5..7624ed13cdbf 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -1672,7 +1672,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_probe);
>>   
>>   int analogix_dp_suspend(struct analogix_dp_device *dp)
>>   {
>> -	phy_power_off(dp->phy);
>> +	analogix_dp_phy_power_off(dp);
> 
> Why?
> 
>>   
>>   	if (dp->plat_data->power_off)
>>   		dp->plat_data->power_off(dp->plat_data);
>> @@ -1696,7 +1696,7 @@ int analogix_dp_resume(struct analogix_dp_device *dp)
>>   	if (dp->plat_data->power_on)
>>   		dp->plat_data->power_on(dp->plat_data);
>>   
>> -	phy_power_on(dp->phy);
>> +	analogix_dp_phy_power_on(dp);
> 
> Why?
> 

These changes for phy_power_on()/phy_power_off() may be unnecessary. I 
will just put the phy_set_mode() before phy_power_on() in next version.

>>   
>>   	analogix_dp_init_dp(dp);
>>   
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> index 774d11574b09..a76079d61768 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
>> @@ -232,5 +232,7 @@ int analogix_dp_send_psr_spd(struct analogix_dp_device *dp,
>>   			     struct dp_sdp *vsc, bool blocking);
>>   ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
>>   			     struct drm_dp_aux_msg *msg);
>> +void analogix_dp_phy_power_on(struct analogix_dp_device *dp);
>> +void analogix_dp_phy_power_off(struct analogix_dp_device *dp);
>>   
>>   #endif /* _ANALOGIX_DP_CORE_H */
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> index 3afc73c858c4..809bb0c72d18 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
>> @@ -11,6 +11,7 @@
>>   #include <linux/gpio/consumer.h>
>>   #include <linux/io.h>
>>   #include <linux/iopoll.h>
>> +#include <linux/phy/phy.h>
>>   
>>   #include <drm/bridge/analogix_dp.h>
>>   
>> @@ -513,10 +514,27 @@ void analogix_dp_enable_sw_function(struct analogix_dp_device *dp)
>>   void analogix_dp_set_link_bandwidth(struct analogix_dp_device *dp, u32 bwtype)
>>   {
>>   	u32 reg;
>> +	int ret;
>>   
>>   	reg = bwtype;
>>   	if ((bwtype == DP_LINK_BW_2_7) || (bwtype == DP_LINK_BW_1_62))
>>   		writel(reg, dp->reg_base + ANALOGIX_DP_LINK_BW_SET);
>> +
>> +	if (dp->phy) {
>> +		union phy_configure_opts phy_cfg = {0};
>> +
>> +		phy_cfg.dp.lanes = dp->link_train.lane_count;
> 
> You can drop this, .set_lanes is false.
> 
>> +		phy_cfg.dp.link_rate =
>> +			drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;
>> +		phy_cfg.dp.set_lanes = false;
>> +		phy_cfg.dp.set_rate = true;
>> +		phy_cfg.dp.set_voltages = false;
> 
> You don't need to set those to false, it's cleared by = {0};
> 
>> +		ret = phy_configure(dp->phy, &phy_cfg);
>> +		if (ret && ret != -EOPNOTSUPP) {
>> +			dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
>> +			return;
>> +		}
>> +	}
>>   }
>>   
>>   void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
>> @@ -530,9 +548,24 @@ void analogix_dp_get_link_bandwidth(struct analogix_dp_device *dp, u32 *bwtype)
>>   void analogix_dp_set_lane_count(struct analogix_dp_device *dp, u32 count)
>>   {
>>   	u32 reg;
>> +	int ret;
>>   
>>   	reg = count;
>>   	writel(reg, dp->reg_base + ANALOGIX_DP_LANE_COUNT_SET);
>> +
>> +	if (dp->phy) {
>> +		union phy_configure_opts phy_cfg = {0};
>> +
>> +		phy_cfg.dp.lanes = dp->link_train.lane_count;
>> +		phy_cfg.dp.set_lanes = true;
>> +		phy_cfg.dp.set_rate = false;
>> +		phy_cfg.dp.set_voltages = false;
> 
> Likewise
> 
>> +		ret = phy_configure(dp->phy, &phy_cfg);
>> +		if (ret && ret != -EOPNOTSUPP) {
>> +			dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
>> +			return;
>> +		}
>> +	}
>>   }
>>   
>>   void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
>> @@ -546,10 +579,39 @@ void analogix_dp_get_lane_count(struct analogix_dp_device *dp, u32 *count)
>>   void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp)
>>   {
>>   	u8 lane;
>> +	int ret;
>>   
>>   	for (lane = 0; lane < dp->link_train.lane_count; lane++)
>>   		writel(dp->link_train.training_lane[lane],
>>   		       dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL + 4 * lane);
>> +
>> +	if (dp->phy) {
>> +		union phy_configure_opts phy_cfg = {0};
>> +
>> +		for (lane = 0; lane < dp->link_train.lane_count; lane++) {
>> +			u8 training_lane = dp->link_train.training_lane[lane];
>> +			u8 vs, pe;
>> +
>> +			vs = (training_lane & DP_TRAIN_VOLTAGE_SWING_MASK) >>
>> +			     DP_TRAIN_VOLTAGE_SWING_SHIFT;
>> +			pe = (training_lane & DP_TRAIN_PRE_EMPHASIS_MASK) >>
>> +			     DP_TRAIN_PRE_EMPHASIS_SHIFT;
>> +			phy_cfg.dp.voltage[lane] = vs;
>> +			phy_cfg.dp.pre[lane] = pe;
>> +		}
>> +
>> +		phy_cfg.dp.lanes = dp->link_train.lane_count;
>> +		phy_cfg.dp.link_rate =
>> +			drm_dp_bw_code_to_link_rate(dp->link_train.link_rate) / 100;
> 
> You can drop these two.

Indeed, all the needless assignments for phy_configure() will be deleted 
in next version.

> 
>> +		phy_cfg.dp.set_lanes = false;
>> +		phy_cfg.dp.set_rate = false;
>> +		phy_cfg.dp.set_voltages = true;
>> +		ret = phy_configure(dp->phy, &phy_cfg);
>> +		if (ret && ret != -EOPNOTSUPP) {
>> +			dev_err(dp->dev, "%s: phy_configure() failed: %d\n", __func__, ret);
>> +			return;
>> +		}
>> +	}
>>   }
>>   
>>   u32 analogix_dp_get_lane_link_training(struct analogix_dp_device *dp, u8 lane)
>> @@ -1053,3 +1115,31 @@ ssize_t analogix_dp_transfer(struct analogix_dp_device *dp,
>>   
>>   	return -EREMOTEIO;
>>   }
>> +
>> +void analogix_dp_phy_power_on(struct analogix_dp_device *dp)
>> +{
>> +	int ret;
>> +
>> +	ret = phy_set_mode(dp->phy, PHY_MODE_DP);
>> +	if (ret) {
>> +		dev_err(dp->dev, "%s: phy_set_mode() failed: %d\n", __func__, ret);
>> +		return;
>> +	}
>> +
>> +	ret = phy_power_on(dp->phy);
>> +	if (ret) {
>> +		dev_err(dp->dev, "%s: phy_power_on() failed: %d\n", __func__, ret);
> 
> There is already a dev_err() call in phy_power_on().
> 
>> +		return;
>> +	}
>> +}
>> +
>> +void analogix_dp_phy_power_off(struct analogix_dp_device *dp)
>> +{
>> +	int ret;
>> +
>> +	ret = phy_power_off(dp->phy);
>> +	if (ret) {
>> +		dev_err(dp->dev, "%s: phy_power_off() failed: %d\n", __func__, ret);
> 
> There is already a dev_err() call in phy_power_off().
> 
>> +		return;
>> +	}
>> +}
>> -- 
>> 2.34.1
>>
>>
>> _______________________________________________
>> Linux-rockchip mailing list
>> Linux-rockchip@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 

Best regards,
Damon

