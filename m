Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCF3B3B585
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 10:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B951510EB6A;
	Fri, 29 Aug 2025 08:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="hwH9kkBc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49226.qiye.163.com (mail-m49226.qiye.163.com
 [45.254.49.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9722F10EB6A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 08:08:18 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 21096c9d6;
 Fri, 29 Aug 2025 16:08:11 +0800 (GMT+08:00)
Message-ID: <a5e613ba-b404-40ae-b467-0f6f223f5d4c@rock-chips.com>
Date: Fri, 29 Aug 2025 16:08:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Marek Szyprowski <m.szyprowski@samsung.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <CGME20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264@eucas1p2.samsung.com>
 <20250814104753.195255-1-damon.ding@rock-chips.com>
 <a3a2f8be-2c3c-49e7-b27a-72364ea48b06@samsung.com>
 <7cb50c9c-ac41-43b6-8c69-5f184e7c94cf@samsung.com>
 <1ccd3889-5f13-4609-9bd8-2c208e17fc96@rock-chips.com>
 <f2ebfff1-08ab-4f26-98f3-6d6415d58a5e@samsung.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <f2ebfff1-08ab-4f26-98f3-6d6415d58a5e@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98f4deb08703a3kunm8f332bf4240748
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR0dH1ZPTUNKQh9JTE9JT0tWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=hwH9kkBckmzBii1hqAhhizPe98pbe5KInG7k0W+rOcKEJf+ceiFIE1iEoD9RC1XhJTwP3h4fxtrTo2oGzMg2ttdTDMdP8H+NFF3h1jDe1ygwNxtz4OKqcP7OkAWuViImR0xV74XE6P/Ntp/I5R8U//92FzxWhS31wem7u7J2n/s=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=+4nnCSfaVZxfCjorptFVtjUW71ZPzART/mrWJy4dbto=;
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

Hi Marek,

On 8/20/2025 5:20 AM, Marek Szyprowski wrote:
> On 15.08.2025 04:59, Damon Ding wrote:
>> On 2025/8/15 5:16, Marek Szyprowski wrote:
>>> On 14.08.2025 16:33, Marek Szyprowski wrote:
>>>> On 14.08.2025 12:47, Damon Ding wrote:
>>>>> PATCH 1 is a small format optimization for struct analogid_dp_device.
>>>>> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>>>>> PATCH 3-6 are preparations for apply drm_bridge_connector helper.
>>>>> PATCH 7 is to apply the drm_bridge_connector helper.
>>>>> PATCH 8-10 are to move the panel/bridge parsing to the Analogix side.
>>>>> PATCH 11-12 are preparations for apply panel_bridge helper.
>>>>> PATCH 13 is to apply the panel_bridge helper.
>>>>
>>>> This series lacks 'select DRM_BRIDGE_CONNECTOR' in ExynosDP's Kconfig,
>>>> so it causes build break:
>>>>
>>>> drivers/gpu/drm/exynos/exynos_dp.c:177: undefined reference to
>>>> `drm_bridge_connector_init'
>>>> make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
>>>>
>>>> After adding this dependency, the Exynos DP driver stops working. On
>>>> Samsung Snow Chromebook I observed following issue:
>>>>
>>>> [    4.534220] exynos-dp 145b0000.dp-controller: failed to attach
>>>> following panel or bridge (-16)
>>>> [    4.543428] exynos-drm exynos-drm: failed to bind
>>>> 145b0000.dp-controller (ops exynos_dp_ops): -16
>>>> [    4.551775] exynos-drm exynos-drm: adev bind failed: -16
>>>> [    4.556559] exynos-dp 145b0000.dp-controller: probe with driver
>>>> exynos-dp failed with error -16
>>>>
>>>> I will investigate details later in the evening.
>>>
>>> The failure is caused by trying to add plat_data->next_bridge twice
>>> (from exynos_dp's .attach callback, and from analogix' ->bind callback).
>>>
>>>
>>> Best regards
>>
>> I see. The bridge attachment for the next bridge was not well thought
>> out. It may be better to move panel_bridge addition a little forward
>> and remove next_bridge attachment on the Analogix side. Then, the
>> Rockchip side and Exynos side can do their own next_bridge attachment
>> in &analogix_dp_plat_data.attach() as they want.
>>
>> Could you please help test the following modifications(they have been
>> tested on my RK3588S EVB1 Board) on the Samsung Snow Chromebook? ;-)
> 
> Assuming that I properly applied the malformed diff, it doesn't solve
> all the issues. There are no errors reported though, but the display
> chain doesn't work and no valid mode is reported:
> 
> # dmesg | grep drm
> [    3.384992] [drm] Initialized panfrost 1.4.0 for 11800000.gpu on minor 0
> [    4.487739] [drm] Exynos DRM: using 14400000.fimd device for DMA
> mapping operations
> [    4.494202] exynos-drm exynos-drm: bound 14400000.fimd (ops
> fimd_component_ops)
> [    4.502374] exynos-drm exynos-drm: bound 14450000.mixer (ops
> mixer_component_ops)
> [    4.511930] exynos-drm exynos-drm: bound 145b0000.dp-controller (ops
> exynos_dp_ops)
> [    4.518411] exynos-drm exynos-drm: bound 14530000.hdmi (ops
> hdmi_component_ops)
> [    4.529628] [drm] Initialized exynos 1.1.0 for exynos-drm on minor 1
> [    4.657434] exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
> [    4.925023] exynos-drm exynos-drm: [drm] Cannot find any crtc or sizes
> 
> # ./modetest -c -Mexynos
> Connectors:
> id      encoder status          name            size (mm)       modes
>     encoders
> 69      0       disconnected    LVDS-1          0x0             0       68
>    props:
>          1 EDID:
>                  flags: immutable blob
>                  blobs:
> 
>                  value:
>          2 DPMS:
>                  flags: enum
>                  enums: On=0 Standby=1 Suspend=2 Off=3
>                  value: 0
>          5 link-status:
>                  flags: enum
>                  enums: Good=0 Bad=1
>                  value: 0
>          6 non-desktop:
>                  flags: immutable range
>                  values: 0 1
>                  value: 0
>          4 TILE:
>                  flags: immutable blob
>                  blobs:
> 
>                  value:
> 71      0       disconnected    HDMI-A-1        0x0             0       70
>    props:
>          1 EDID:
>                  flags: immutable blob
>                  blobs:
> 
>                  value:
>          2 DPMS:
>                  flags: enum
>                  enums: On=0 Standby=1 Suspend=2 Off=3
>                  value: 0
>          5 link-status:
>                  flags: enum
>                  enums: Good=0 Bad=1
>                  value: 0
>          6 non-desktop:
>                  flags: immutable range
>                  values: 0 1
>                  value: 0
>          4 TILE:
>                  flags: immutable blob
>                  blobs:
> 
>                  value:
> 
> 
> I will investigate details later this week.
> 

Could you please provide the related DTS file for the test? I will also 
try to find out the reason for this unexpected issue. ;-)

> 
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index 0529bfb02884..8a9ce1f31678 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -1573,6 +1573,15 @@ int analogix_dp_bind(struct analogix_dp_device
>> *dp, struct drm_device *drm_dev)
>>                  return ret;
>>          }
>>
>> +       if (dp->plat_data->panel) {
>> +               dp->plat_data->next_bridge =
>> devm_drm_panel_bridge_add(dp->dev,
>> + dp->plat_data->panel);
>> +               if (IS_ERR(dp->plat_data->next_bridge)) {
>> +                       ret = PTR_ERR(bridge);
>> +                       goto err_unregister_aux;
>> +               }
>> +       }
>> +
>>          bridge->ops = DRM_BRIDGE_OP_DETECT |
>>                        DRM_BRIDGE_OP_EDID |
>>                        DRM_BRIDGE_OP_MODES;
>> @@ -1588,22 +1597,6 @@ int analogix_dp_bind(struct analogix_dp_device
>> *dp, struct drm_device *drm_dev)
>>                  goto err_unregister_aux;
>>          }
>>
>> -       if (dp->plat_data->panel) {
>> -               dp->plat_data->next_bridge =
>> devm_drm_panel_bridge_add(dp->dev,
>> - dp->plat_data->panel);
>> -               if (IS_ERR(dp->plat_data->next_bridge)) {
>> -                       ret = PTR_ERR(bridge);
>> -                       goto err_unregister_aux;
>> -               }
>> -       }
>> -
>> -       ret = drm_bridge_attach(dp->encoder,
>> dp->plat_data->next_bridge, bridge,
>> -                               DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> -       if (ret) {
>> -               dev_err(dp->dev, "failed to attach following panel or
>> bridge (%d)\n", ret);
>> -               goto err_unregister_aux;
>> -       }
>> -
>>          return 0;
>>
>>   err_unregister_aux:
>> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c
>> b/drivers/gpu/drm/exynos/exynos_dp.c
>> index 80ba700d2964..d0422f940249 100644
>> --- a/drivers/gpu/drm/exynos/exynos_dp.c
>> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
>> @@ -104,7 +104,7 @@ static int exynos_dp_bridge_attach(struct
>> analogix_dp_plat_data *plat_data,
>>          /* Pre-empt DP connector creation if there's a bridge */
>>          if (plat_data->next_bridge) {
>>                  ret = drm_bridge_attach(&dp->encoder,
>> plat_data->next_bridge, bridge,
>> -                                       0);
>> + DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>                  if (ret)
>>                          return ret;
>>          }
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> index 0862b09a8be2..dfd32a79b94f 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -164,6 +164,24 @@ static int rockchip_dp_powerdown(struct
>> analogix_dp_plat_data *plat_data)
>>          return 0;
>>   }
>>
>> +static int rockchip_dp_attach(struct analogix_dp_plat_data *plat_data,
>> +                                    struct drm_bridge *bridge)
>> +{
>> +       struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
>> +       int ret;
>> +
>> +       if (plat_data->next_bridge) {
>> +               ret = drm_bridge_attach(&dp->encoder.encoder,
>> plat_data->next_bridge, bridge,
>> + DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> +               if (ret) {
>> +                       dev_err(dp->dev, "failed to attach following
>> panel or bridge (%d)\n", ret);
>> +                       return ret;
>> +               }
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>   static int rockchip_dp_get_modes(struct analogix_dp_plat_data
>> *plat_data,
>>                                   struct drm_connector *connector)
>>   {
>> @@ -478,6 +496,7 @@ static int rockchip_dp_probe(struct
>> platform_device *pdev)
>>          dp->plat_data.dev_type = dp->data->chip_type;
>>          dp->plat_data.power_on = rockchip_dp_poweron;
>>          dp->plat_data.power_off = rockchip_dp_powerdown;
>> +       dp->plat_data.attach = rockchip_dp_attach;
>>          dp->plat_data.get_modes = rockchip_dp_get_modes;
>>          dp->plat_data.ops = &rockchip_dp_component_ops;
>>
>>

Best regards,
Damon

