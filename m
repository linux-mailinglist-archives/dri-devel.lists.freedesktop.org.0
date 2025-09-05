Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBD0B4533C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 11:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8383010EB4C;
	Fri,  5 Sep 2025 09:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="kAOYdpff";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973174.qiye.163.com (mail-m1973174.qiye.163.com
 [220.197.31.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EC910EB4C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 09:34:59 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 21d2c3c57;
 Fri, 5 Sep 2025 17:34:52 +0800 (GMT+08:00)
Message-ID: <650e213a-211f-416b-95bc-89d7a9ed4413@rock-chips.com>
Date: Fri, 5 Sep 2025 17:34:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/13] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250814104753.195255-1-damon.ding@rock-chips.com>
 <20250814104753.195255-8-damon.ding@rock-chips.com>
 <incxmqneeurgli5h6p3hn3bgztxrzyk5eq2h5nq4lgzalohslq@mvehvr4cgyim>
 <62dfbe1d-3e36-4bc5-9b25-a465e710f23b@rock-chips.com>
 <ghp33yxo24gaubn6pijks3wnuch3fpbmi5z27cq7pk3siffiox@jb2zw3lt35hk>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <ghp33yxo24gaubn6pijks3wnuch3fpbmi5z27cq7pk3siffiox@jb2zw3lt35hk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99193a904f03a3kunmdf24c53e283457
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhpDTVZPSU9JH0tKQ00eQ01WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=kAOYdpffEavcsJTDlmLshRgtwzagM4aWc0ztcWnlnzGkJKUtbJVaCFUFrm9tfwOH7XCAzrEacZ/NFvHre3e0MOZRnY9aBFWPs7eAlvrg0DRahjQLezuIdVBkYb6+2t2mGB88hiuJFediDlK8RUhUbHJyxOTHRXQDq9S+t71OvVA=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=EMIHjCKBnajiLAfmELItVXkWkmFIn79aD77lcUYFqFg=;
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

On 8/29/2025 4:48 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:18:13PM +0800, Damon Ding wrote:
>> Hi Dmitry,
>>
>> On 8/17/2025 12:43 AM, Dmitry Baryshkov wrote:
>>> On Thu, Aug 14, 2025 at 06:47:47PM +0800, Damon Ding wrote:
>>>> Apply drm_bridge_connector helper for Analogix DP driver.
>>>>
>>>> The following changes have been made:
>>>> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>>>>     and &drm_connector_helper_funcs.
>>>> - Remove unnecessary parameter struct drm_connector* for callback
>>>>     &analogix_dp_plat_data.attach.
>>>> - Remove &analogix_dp_device.connector.
>>>> - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
>>>>     &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
>>>> - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
>>>>     &drm_bridge_funcs.edid_read().
>>>>
>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>>
>>>> ------
>>>>
>>>> Changes in v2:
>>>> - For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
>>>>     DRM_BRIDGE_OP_EDID.
>>>> - Add analogix_dp_bridge_edid_read().
>>>> - Move &analogix_dp_plat_data.skip_connector deletion to the previous
>>>>     patches.
>>>>
>>>> Changes in v3:
>>>> - Rebase with the new devm_drm_bridge_alloc() related commit
>>>>     48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc()
>>>>     API").
>>>> - Expand the commit message.
>>>> - Call drm_bridge_get_modes() in analogix_dp_bridge_get_modes() if the
>>>>     bridge is available.
>>>> - Remove unnecessary parameter struct drm_connector* for callback
>>>>     &analogix_dp_plat_data.attach.
>>>> - In order to decouple the connector driver and the bridge driver, move
>>>>     the bridge connector initilization to the Rockchip and Exynos sides.
>>>>
>>>> Changes in v4:
>>>> - Expand analogix_dp_bridge_detect() parameters to &drm_bridge and
>>>>     &drm_connector.
>>>> - Rename the &analogix_dp_plat_data.bridge to
>>>>     &analogix_dp_plat_data.next_bridge.
>>>> ---
>>>>    .../drm/bridge/analogix/analogix_dp_core.c    | 145 ++++++++----------
>>>>    .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
>>>>    drivers/gpu/drm/exynos/exynos_dp.c            |  18 ++-
>>>>    .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  11 +-
>>>>    include/drm/bridge/analogix_dp.h              |   3 +-
>>>>    5 files changed, 88 insertions(+), 90 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> index 7876b310aaed..a8ed44ec8ef5 100644
>>>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>>>> @@ -947,24 +947,16 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>>>>    	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
>>>>    }
>>>> -static int analogix_dp_get_modes(struct drm_connector *connector)
>>>> +static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
>>>>    {
>>>> -	struct analogix_dp_device *dp = to_dp(connector);
>>>> -	const struct drm_edid *drm_edid;
>>>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>>>    	int num_modes = 0;
>>>> -	if (dp->plat_data->panel) {
>>>> +	if (dp->plat_data->panel)
>>>>    		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
>>>> -	} else {
>>>> -		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
>>>> -		drm_edid_connector_update(&dp->connector, drm_edid);
>>>> -
>>>> -		if (drm_edid) {
>>>> -			num_modes += drm_edid_connector_add_modes(&dp->connector);
>>>> -			drm_edid_free(drm_edid);
>>>> -		}
>>>> -	}
>>>> +	if (dp->plat_data->next_bridge)
>>>> +		num_modes += drm_bridge_get_modes(dp->plat_data->next_bridge, connector);
>>>
>>> If there is a next bridge which provides OP_MODES, then
>>> drm_bridge_connector will use it for get_modes() and skip this one
>>> completely. I'm not sure what's the value of this call.
>>
>> Following your advice, it is really a good idea to distinguish the
>> drm_bridge_ops between the panel and the bridge. Will add it in v5.
>>
>>>
>>>>    	if (dp->plat_data->get_modes)
>>>>    		num_modes += dp->plat_data->get_modes(dp->plat_data, connector);
>>>> @@ -972,51 +964,39 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
>>>>    	return num_modes;
>>>>    }
>>>> -static struct drm_encoder *
>>>> -analogix_dp_best_encoder(struct drm_connector *connector)
>>>> +static const struct drm_edid *analogix_dp_bridge_edid_read(struct drm_bridge *bridge,
>>>> +							   struct drm_connector *connector)
>>>>    {
>>>> -	struct analogix_dp_device *dp = to_dp(connector);
>>>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>>> +	const struct drm_edid *drm_edid = NULL;
>>>> -	return dp->encoder;
>>>> -}
>>>> +	drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
>>>> +	if (dp->plat_data->get_modes)
>>>> +		dp->plat_data->get_modes(dp->plat_data, connector);
>>>
>>>
>>> So, we have DDC, but we still want to return platform modes? What is the
>>> usecase for that?
>>>
>>> There might be some, but I think it deserves a comment in the source
>>> file.
>>>
>>
>> For Rockchip side, since RK3588 and RK3576 can support YUV formats while the
>> other can not, the &analogix_dp_plat_data.get_modes() help filter out YUV
>> formats for some platforms(The YUV feature support may not be fit for this
>> patch series and will come later).
> 
> Note, get_modes() here adds modes rather than filtering them. You can
> use .mode_valid in order to filter out YUV modes.
> 

Yeah，I will move it to &drm_bridge_funcs.mode_valid() in a new separate 
commit.

>>
>> For Exynos side, I think &analogix_dp_plat_data.get_modes() can help
>> parse the video mode set in the eDP DT node when there is no available panel
>> or bridge.
> 
> I think this should be handled by a separate bridge. E.g. see how the
> imx-legacy-bridge is implemented.
> 

It can make the codes more consistent. Will do in the next version.

>>
>> I will add some comments about it in the next version.
>>
> 

Best regards,
Damon

