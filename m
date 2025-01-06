Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB02A023CD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 12:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5C710E625;
	Mon,  6 Jan 2025 11:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="O4iWLR2m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49207.qiye.163.com (mail-m49207.qiye.163.com
 [45.254.49.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7664C10E625
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 11:04:14 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 7d7b0b78;
 Mon, 6 Jan 2025 19:04:10 +0800 (GMT+08:00)
Message-ID: <e2a18f8c-dc38-4b12-968e-dd369cb34cb4@rock-chips.com>
Date: Mon, 6 Jan 2025 19:04:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/17] drm/bridge: analogix_dp: Convert
 &analogix_dp_device.aux into a pointer
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
 <20241226063313.3267515-14-damon.ding@rock-chips.com>
 <e52pbjnusvuoqiyoorjr5msrfmgeqs2jt5sk6zcesvzy7cszzk@fzrtpsjoklgu>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <e52pbjnusvuoqiyoorjr5msrfmgeqs2jt5sk6zcesvzy7cszzk@fzrtpsjoklgu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0tLSVZDS0NCSxhKGkofS0hWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
 NVSktLVUpCS0tZBg++
X-HM-Tid: 0a943b49590403a3kunm7d7b0b78
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pgg6EQw4DDINKR4eEDJKEShL
 Kx0KFBZVSlVKTEhNSk1KT05KQklMVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJTEpLNwY+
DKIM-Signature: a=rsa-sha256;
 b=O4iWLR2mvf8gW6QrD6uiWKKWfEubi4Xv418QKLOFVVODdPN0nrxq/xAJw1I1hx9LMfpEMn1jUXRd/nM5VynrtZOzMJG1Pi5KQbhHVXNPUb+KNLoKh8N7dsPcOFMqCuNy4i6GaiYBIcihV8fNO0k8P/1sZVVt8Rm8HLOhp0ywR64=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=1OhHA3tQesHAm8R0yHAK/Yz9C8LSErY0JbzzLjsKDBE=;
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

On 2024/12/30 21:35, Dmitry Baryshkov wrote:
> On Thu, Dec 26, 2024 at 02:33:09PM +0800, Damon Ding wrote:
>> With the previous patch related to the support of getting panel from
>> the DP AUX bus, the &analogix_dp_device.aux can be obtained from the
>> &analogix_dp_plat_data.aux.
>>
>> Furthermore, the assignment of &analogix_dp_plat_data.connector is
>> intended to obtain the pointer of struct analogix_dp_device within the
>> analogix_dpaux_transfer() function.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../drm/bridge/analogix/analogix_dp_core.c    | 92 ++++++++++---------
>>   .../drm/bridge/analogix/analogix_dp_core.h    |  2 +-
>>   .../gpu/drm/bridge/analogix/analogix_dp_reg.c |  2 +-
>>   3 files changed, 50 insertions(+), 46 deletions(-)
>>
> 
> [...]
> 
>> @@ -1127,6 +1128,7 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
>>   
>>   	if (!dp->plat_data->skip_connector) {
>>   		connector = &dp->connector;
>> +		dp->plat_data->connector = &dp->connector;
>>   		connector->polled = DRM_CONNECTOR_POLL_HPD;
>>   
>>   		ret = drm_connector_init(dp->drm_dev, connector,
>> @@ -1535,7 +1537,9 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
>>   static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
>>   				       struct drm_dp_aux_msg *msg)
>>   {
>> -	struct analogix_dp_device *dp = to_dp(aux);
>> +	struct analogix_dp_plat_data *plat_data = to_pdata(aux);
>> +	struct drm_connector *connector = plat_data->connector;
>> +	struct analogix_dp_device *dp = to_dp(connector);
> 
> I see that Analogix DP driver doesn't support
> DRM_BRIDGE_ATTACH_NO_CONNECTOR, but at the same time I don't think this
> is the step in the right direction. Instead please keep the AUX bus on
> the Analogix side and add an API to go from struct drm_dp_aux to struct
> analogix_dp_plat_data. Then your done_probing() callback can use that
> function.
> 

It is truly a more concise way.

In the next version, I will add the following functions on the Analogix 
side in order to get the pointers of struct analogix_dp_plat_data and 
struct drm_dp_aux on the Rockchip side. And the way has already been 
verified.

struct analogix_dp_plat_data *analogix_dp_aux_to_plat_data(struct 
drm_dp_aux *aux)
{
	struct analogix_dp_device *dp = to_dp(aux);

	return dp->plat_data;
}
EXPORT_SYMBOL_GPL(analogix_dp_aux_to_plat_data);

struct drm_dp_aux *analogix_dp_get_aux(struct analogix_dp_device *dp)
{
	return &dp->aux;
}
EXPORT_SYMBOL_GPL(analogix_dp_get_aux);

>>   	int ret;
>>   
>>   	pm_runtime_get_sync(dp->dev);
>>
> 

Best regards
Damon

