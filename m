Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0507B14A20
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 10:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D7310E1D2;
	Tue, 29 Jul 2025 08:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Q80s3a/t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49226.qiye.163.com (mail-m49226.qiye.163.com
 [45.254.49.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F8B10E1D2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 08:31:33 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1d9827a9b;
 Tue, 29 Jul 2025 16:31:28 +0800 (GMT+08:00)
Message-ID: <7445b3d4-0e88-40e5-bcbd-8ea60c35d5bb@rock-chips.com>
Date: Tue, 29 Jul 2025 16:31:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v3 04/14] drm/bridge: analogix_dp: Add
 &analogix_dp_plat_data.bridge
To: Maxime Ripard <mripard@kernel.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-5-damon.ding@rock-chips.com>
 <20250729-wooden-opalescent-baboon-f24fa2@houat>
Content-Language: en-US
In-Reply-To: <20250729-wooden-opalescent-baboon-f24fa2@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a98554edd1703a3kunma08ba3a841d6e7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkNMGlYaGh1JSElDSR5MTBhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=Q80s3a/tV4F2URBBklVXAzRfnVtfBo4yEdM/EZTEwDhDT0yBlKMCM/g4YkEMUHGcQZuzRB36AwgHJagRlvr2/emhFxN1gxf3dbNEzpE1/e+oHBfC3qFnlFMNZKoKPzivDTWL1SsMk8EJefvVkEZjqfv+ae5P4YR/7x2BVNQkl2g=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=hy5UWCAEJ8QpZLBQjuKhMArV1bapCPsMjvUUWG3LcSY=;
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

Hi Maxime,

On 2025/7/29 15:30, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Jul 24, 2025 at 04:02:54PM +0800, Damon Ding wrote:
>> In order to move the parnel/bridge parsing and attachmenet to the
>> Analogix side, add component struct drm_bridge *bridge to platform
>> data struct analogix_dp_plat_data.
>>
>> The movemenet makes sense because the panel/bridge should logically
>> be positioned behind the Analogix bridge in the display pipeline.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   include/drm/bridge/analogix_dp.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
>> index cf17646c1310..15cb6b706e9f 100644
>> --- a/include/drm/bridge/analogix_dp.h
>> +++ b/include/drm/bridge/analogix_dp.h
>> @@ -27,6 +27,7 @@ static inline bool is_rockchip(enum analogix_dp_devtype type)
>>   struct analogix_dp_plat_data {
>>   	enum analogix_dp_devtype dev_type;
>>   	struct drm_panel *panel;
>> +	struct drm_bridge *bridge;
>>   	struct drm_encoder *encoder;
>>   	struct drm_connector *connector;
>>   	bool skip_connector;
> 
> So it's not the analogix_dp bridge, but the bridge after that if any?
> 
> You should probably change it to next_bridge to avoid any confusion.
> 

Yes, &analogix_dp_plat_data.bridge is intended to be the next bridge 
after analogix_dp bridge.

I will rename it to &analogix_dp_plat_data.next_bridge as suggested and 
update it in the next version.

Best regards,
Damon

