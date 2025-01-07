Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9955A035A7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 04:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A68E10EA65;
	Tue,  7 Jan 2025 03:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="LYaCAU+R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m32112.qiye.163.com (mail-m32112.qiye.163.com
 [220.197.32.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81E010EA65
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 03:02:21 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 7e9abd46;
 Tue, 7 Jan 2025 11:02:15 +0800 (GMT+08:00)
Message-ID: <96f8310f-93f1-4bcb-8637-137e1159ff83@rock-chips.com>
Date: Tue, 7 Jan 2025 11:02:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/17] phy: phy-rockchip-samsung-hdptx: Add support for
 eDP mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-8-damon.ding@rock-chips.com>
 <shr7ak7keqza3gw6wra2zra35qht2cxlzkvtuhzl3swzf2fwxy@i2v4o53lhese>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <shr7ak7keqza3gw6wra2zra35qht2cxlzkvtuhzl3swzf2fwxy@i2v4o53lhese>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkIaSFYZGE1KHUtLSxpMGBhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a943eb680b303a3kunm7e9abd46
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PS46Fhw*ITIOTBwQATFWSxkZ
 NBIKCQFVSlVKTEhNSUpDQkhMSU9KVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPQkhDNwY+
DKIM-Signature: a=rsa-sha256;
 b=LYaCAU+RlzanzYmS6Fd7fwnVehf05WEHutrgvrenWPyUEsaiZoZEsMipp8elxtDCC+wzA6v7ql0TSWw9AKlHiKohmW9N5CAfCBVcnQW1M4A6VpxWJOoYFsxunQQ97cOjqaU4shWbirYweHC6d6UwR89l9L7ZcTD/gaWdYlxUAOg=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=j4WHIo9pquJ7g/2ENU41c9ttOjw9RexpamwpH2bk1DY=;
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

On 2024/12/30 20:45, Dmitry Baryshkov wrote:
> On Thu, Dec 26, 2024 at 02:33:03PM +0800, Damon Ding wrote:
>> Add basic support for RBR/HBR/HBR2 link rates, and the voltage swing and
>> pre-emphasis configurations of each link rate have been verified according
>> to the eDP 1.3 requirements.
> 
> Well... Please describe what's happening here. That the HDMI PHY on your
> platform also provides support for DP / eDP. Please document any design
> decisions that you had to make.
> 

Yes, I will add more relevant descriptions in the next version.

>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
>>
>> Changes in v2:
>> - Add the module author
>>
>> Changes in v3:
>> - Split this patch into two, one for correction and the other for
>>    extension
>>
>> Changes in v4:
>> - Add link_rate and lanes parameters in struct rk_hdptx_phy to store the
>>    phy_configure() result for &phy_configure_opts.dp.link_rate and
>>    &phy_configure_opts.dp.lanes
>> ---
>>   .../phy/rockchip/phy-rockchip-samsung-hdptx.c | 896 +++++++++++++++++-
>>   1 file changed, 889 insertions(+), 7 deletions(-)
>>
>> @@ -933,9 +1484,339 @@ static int rk_hdptx_phy_power_off(struct phy *phy)
>>   	return rk_hdptx_phy_consumer_put(hdptx, false);
>>   }
>>   
>> +static int rk_hdptx_phy_set_mode(struct phy *phy, enum phy_mode mode,
>> +				 int submode)
>> +{
>> +	return 0;
>> +}
> 
> No need for the stub, please drop it. The host controller driver can
> still call phy_set_mode() / _ext(), the call will return 0.

Without the &phy_ops.set_mode(), the phy driver can not get phy_mode to 
distinguish between HDMI and DP mode via the phy_get_mode(), even if the 
host driver calls phy_set_mode() / _ext(). Additionally, the previous 
discussion [0] also mentioned future considerations for dynamic 
switching. Indeed, I should add a related comment before the 'return 0;' 
to enhance understandability.

> 
>> +
>> +static int rk_hdptx_phy_verify_config(struct rk_hdptx_phy *hdptx,
>> +				      struct phy_configure_opts_dp *dp)
>> +{
>> +	int i;
>> +
>> +	if (dp->set_rate) {
>> +		switch (dp->link_rate) {
>> +		case 1620:
>> +		case 2700:
>> +		case 5400:
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	if (dp->set_lanes) {
>> +		switch (dp->lanes) {
>> +		case 0:
> 
> Is it really a valid config to have 0 lanes?

The case of 0 lanes is indeed unnecessary.

> 
>> +		case 1:
>> +		case 2:
>> +		case 4:
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	if (dp->set_voltages) {
>> +		for (i = 0; i < hdptx->lanes; i++) {
>> +			if (dp->voltage[i] > 3 || dp->pre[i] > 3)
>> +				return -EINVAL;
>> +
>> +			if (dp->voltage[i] + dp->pre[i] > 3)
>> +				return -EINVAL;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
> 
> [..]
> 
>> +
>> +static int rk_hdptx_phy_configure(struct phy *phy, union phy_configure_opts *opts)
>> +{
>> +	struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
>> +	enum phy_mode mode = phy_get_mode(phy);
>> +	int ret;
>> +
>> +	if (mode != PHY_MODE_DP)
>> +		return -EINVAL;
> 
> I'd say, return 0;

Yes, it is really not an error.

> 
>> +
>> +	ret = rk_hdptx_phy_verify_config(hdptx, &opts->dp);
>> +	if (ret) {
>> +		dev_err(hdptx->dev, "invalid params for phy configure\n");
>> +		return ret;
>> +	}
>> +
>> +	if (opts->dp.set_rate) {
>> +		ret = rk_hdptx_phy_set_rate(hdptx, &opts->dp);
>> +		if (ret) {
>> +			dev_err(hdptx->dev, "failed to set rate: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	if (opts->dp.set_lanes) {
>> +		ret = rk_hdptx_phy_set_lanes(hdptx, &opts->dp);
>> +		if (ret) {
>> +			dev_err(hdptx->dev, "failed to set lanes: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	if (opts->dp.set_voltages) {
>> +		ret = rk_hdptx_phy_set_voltages(hdptx, &opts->dp);
>> +		if (ret) {
>> +			dev_err(hdptx->dev, "failed to set voltages: %d\n",
>> +				ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct phy_ops rk_hdptx_phy_ops = {
>>   	.power_on  = rk_hdptx_phy_power_on,
>>   	.power_off = rk_hdptx_phy_power_off,
>> +	.set_mode  = rk_hdptx_phy_set_mode,
>> +	.configure = rk_hdptx_phy_configure,
>>   	.owner	   = THIS_MODULE,
>>   };
>>   
>> @@ -1149,5 +2030,6 @@ module_platform_driver(rk_hdptx_phy_driver);
>>   
>>   MODULE_AUTHOR("Algea Cao <algea.cao@rock-chips.com>");
>>   MODULE_AUTHOR("Cristian Ciocaltea <cristian.ciocaltea@collabora.com>");
>> +MODULE_AUTHOR("Damon Ding <damon.ding@rock-chips.com>");
>>   MODULE_DESCRIPTION("Samsung HDMI/eDP Transmitter Combo PHY Driver");
>>   MODULE_LICENSE("GPL");
>> -- 
>> 2.34.1
>>
> 

Best regards
Damon

[0]https://patchwork.kernel.org/project/linux-rockchip/patch/20241127075157.856029-5-damon.ding@rock-chips.com/

