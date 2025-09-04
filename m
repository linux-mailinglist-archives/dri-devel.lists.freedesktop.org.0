Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D363B4305E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 05:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20DC10E227;
	Thu,  4 Sep 2025 03:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="D4nvps3A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m32122.qiye.163.com (mail-m32122.qiye.163.com
 [220.197.32.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE89810E227
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 03:19:12 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 21a31a7fe;
 Thu, 4 Sep 2025 11:19:06 +0800 (GMT+08:00)
Content-Type: multipart/mixed; boundary="------------d57G0lgZVnIWmw0tVtNeChqU"
Message-ID: <825ff59f-0a97-49a1-a210-a7ee275364bc@rock-chips.com>
Date: Thu, 4 Sep 2025 11:19:05 +0800
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
 <a5e613ba-b404-40ae-b467-0f6f223f5d4c@rock-chips.com>
 <461daea4-5582-4aa2-bfea-130d2fb93717@samsung.com>
 <46f9137e-402d-4c0f-a224-10520f80c8b4@rock-chips.com>
 <ea57ca6e-4000-49f7-8e0b-899f34b7693a@samsung.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <ea57ca6e-4000-49f7-8e0b-899f34b7693a@samsung.com>
X-HM-Tid: 0a9912bc2ef803a3kunm1c585b8daea7e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkNNQ1ZDTUJKSRgZSR1ITxlWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=D4nvps3A9fYL/jQl6+xpUJKtwUf2Ahyh+9wxHSknZkzdbMPsrJtuJsnij2ykt+n4oysFx0m0mCX7V9cfE4VtBrBKpwt2m9NutgKRrkgRJoG8KVYcP63UDBhP8XiRVYgXUTXGl028ggsOD3QUB2lPLhVWIz1+YD2E+qTnJknbSTI=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=LxIQj7w2/mHSnvpBKK9i+kT979AjPrtf+gT7OiIzhcQ=;
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

This is a multi-part message in MIME format.
--------------d57G0lgZVnIWmw0tVtNeChqU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Marek,

On 9/1/2025 6:25 PM, Marek Szyprowski wrote:
> On 01.09.2025 05:41, Damon Ding wrote:
>> On 8/29/2025 4:23 PM, Marek Szyprowski wrote:
>>> On 29.08.2025 10:08, Damon Ding wrote:
>>>> On 8/20/2025 5:20 AM, Marek Szyprowski wrote:
>>>>> On 15.08.2025 04:59, Damon Ding wrote:
>>>>>> On 2025/8/15 5:16, Marek Szyprowski wrote:
>>>>>>> On 14.08.2025 16:33, Marek Szyprowski wrote:
>>>>>>>> On 14.08.2025 12:47, Damon Ding wrote:
>>>>>>>>> PATCH 1 is a small format optimization for struct
>>>>>>>>> analogid_dp_device.
>>>>>>>>> PATCH 2 is to perform mode setting in
>>>>>>>>> &drm_bridge_funcs.atomic_enable.
>>>>>>>>> PATCH 3-6 are preparations for apply drm_bridge_connector helper.
>>>>>>>>> PATCH 7 is to apply the drm_bridge_connector helper.
>>>>>>>>> PATCH 8-10 are to move the panel/bridge parsing to the Analogix
>>>>>>>>> side.
>>>>>>>>> PATCH 11-12 are preparations for apply panel_bridge helper.
>>>>>>>>> PATCH 13 is to apply the panel_bridge helper.
>>>>>>>>
>>>>>>>> This series lacks 'select DRM_BRIDGE_CONNECTOR' in ExynosDP's
>>>>>>>> Kconfig,
>>>>>>>> so it causes build break:
>>>>>>>>
>>>>>>>> drivers/gpu/drm/exynos/exynos_dp.c:177: undefined reference to
>>>>>>>> `drm_bridge_connector_init'
>>>>>>>> make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
>>>>>>>>
>>>>>>>> After adding this dependency, the Exynos DP driver stops
>>>>>>>> working. On
>>>>>>>> Samsung Snow Chromebook I observed following issue:
>>>>>>>>
>>>>>>>> [    4.534220] exynos-dp 145b0000.dp-controller: failed to attach
>>>>>>>> following panel or bridge (-16)
>>>>>>>> [    4.543428] exynos-drm exynos-drm: failed to bind
>>>>>>>> 145b0000.dp-controller (ops exynos_dp_ops): -16
>>>>>>>> [    4.551775] exynos-drm exynos-drm: adev bind failed: -16
>>>>>>>> [    4.556559] exynos-dp 145b0000.dp-controller: probe with driver
>>>>>>>> exynos-dp failed with error -16
>>>>>>>>
>>>>>>>> I will investigate details later in the evening.
>>>>>>>
>>>>>>> The failure is caused by trying to add plat_data->next_bridge twice
>>>>>>> (from exynos_dp's .attach callback, and from analogix' ->bind
>>>>>>> callback).
>>>>>>>
>>>>>>>
>>>>>>> Best regards
>>>>>>
>>>>>> I see. The bridge attachment for the next bridge was not well thought
>>>>>> out. It may be better to move panel_bridge addition a little forward
>>>>>> and remove next_bridge attachment on the Analogix side. Then, the
>>>>>> Rockchip side and Exynos side can do their own next_bridge attachment
>>>>>> in &analogix_dp_plat_data.attach() as they want.
>>>>>>
>>>>>> Could you please help test the following modifications(they have been
>>>>>> tested on my RK3588S EVB1 Board) on the Samsung Snow Chromebook? ;-)
>>>>>
>>>>> Assuming that I properly applied the malformed diff, it doesn't solve
>>>>> all the issues. There are no errors reported though, but the display
>>>>> chain doesn't work and no valid mode is reported:
>>>>>
>>>>> # dmesg | grep drm
>>>>> [    3.384992] [drm] Initialized panfrost 1.4.0 for 11800000.gpu on
>>>>> minor 0
>>>>> [    4.487739] [drm] Exynos DRM: using 14400000.fimd device for DMA
>>>>> mapping operations
>>>>> [    4.494202] exynos-drm exynos-drm: bound 14400000.fimd (ops
>>>>> fimd_component_ops)
>>>>> [    4.502374] exynos-drm exynos-drm: bound 14450000.mixer (ops
>>>>> mixer_component_ops)
>>>>> [    4.511930] exynos-drm exynos-drm: bound 145b0000.dp-controller
>>>>> (ops
>>>>> exynos_dp_ops)
>>>>> [    4.518411] exynos-drm exynos-drm: bound 14530000.hdmi (ops
>>>>> hdmi_component_ops)
>>>>> [    4.529628] [drm] Initialized exynos 1.1.0 for exynos-drm on
>>>>> minor 1
>>>>> [    4.657434] exynos-drm exynos-drm: [drm] Cannot find any crtc or
>>>>> sizes
>>>>> [    4.925023] exynos-drm exynos-drm: [drm] Cannot find any crtc or
>>>>> sizes
>>>>>
>>>>> # ./modetest -c -Mexynos
>>>>> Connectors:
>>>>> id      encoder status          name            size (mm)       modes
>>>>>       encoders
>>>>> 69      0       disconnected    LVDS-1          0x0             0
>>>>>         68
>>>>>      props:
>>>>>            1 EDID:
>>>>>                    flags: immutable blob
>>>>>                    blobs:
>>>>>
>>>>>                    value:
>>>>>            2 DPMS:
>>>>>                    flags: enum
>>>>>                    enums: On=0 Standby=1 Suspend=2 Off=3
>>>>>                    value: 0
>>>>>            5 link-status:
>>>>>                    flags: enum
>>>>>                    enums: Good=0 Bad=1
>>>>>                    value: 0
>>>>>            6 non-desktop:
>>>>>                    flags: immutable range
>>>>>                    values: 0 1
>>>>>                    value: 0
>>>>>            4 TILE:
>>>>>                    flags: immutable blob
>>>>>                    blobs:
>>>>>
>>>>>                    value:
>>>>> 71      0       disconnected    HDMI-A-1        0x0             0
>>>>>         70
>>>>>      props:
>>>>>            1 EDID:
>>>>>                    flags: immutable blob
>>>>>                    blobs:
>>>>>
>>>>>                    value:
>>>>>            2 DPMS:
>>>>>                    flags: enum
>>>>>                    enums: On=0 Standby=1 Suspend=2 Off=3
>>>>>                    value: 0
>>>>>            5 link-status:
>>>>>                    flags: enum
>>>>>                    enums: Good=0 Bad=1
>>>>>                    value: 0
>>>>>            6 non-desktop:
>>>>>                    flags: immutable range
>>>>>                    values: 0 1
>>>>>                    value: 0
>>>>>            4 TILE:
>>>>>                    flags: immutable blob
>>>>>                    blobs:
>>>>>
>>>>>                    value:
>>>>>
>>>>>
>>>>> I will investigate details later this week.
>>>>>
>>>>
>>>> Could you please provide the related DTS file for the test? I will
>>>> also try to find out the reason for this unexpected issue. ;-)
>>>
>>> Unfortunately I didn't find enough time to debug this further. The above
>>> log is from Samsung Snow Chromebook,
>>> arch/arm/boot/dts/samsung/exynos5250-snow.dts
>>>
>>>
>>
>> I compare the differences in the following display path before and
>> after this patch series:
>>
>> exynos_dp -> nxp-ptn3460 -> panel "auo,b116xw03"
>>
>> The issue is likely caused by the &drm_connector_funcs.detect()
>> related logic. Before this patch series, the nxp-ptn3460 connector is
>> always connector_status_connected because there is not available
>> &drm_connector_funcs.detect(). After it, the DRM_BRIDGE_OP_DETECT flag
>> make the connection status depend on analogix_dp_bridge_detect().
>>
>> Could you please add the following patches additionally and try again?
>> (Not the final solution, just validation)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index a93ff8f0a468..355911c47354 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -1491,9 +1491,11 @@ int analogix_dp_bind(struct analogix_dp_device
>> *dp, struct drm_device *drm_dev)
>>                  }
>>          }
>>
>> -       bridge->ops = DRM_BRIDGE_OP_DETECT |
>> -                     DRM_BRIDGE_OP_EDID |
>> +       bridge->ops = DRM_BRIDGE_OP_EDID |
>>                        DRM_BRIDGE_OP_MODES;
>> +       if (drm_bridge_is_panel(dp->plat_data->next_bridge))
>> +               bridge->ops |= DRM_BRIDGE_OP_DETECT;
>> +
>>          bridge->of_node = dp->dev->of_node;
>>          bridge->type = DRM_MODE_CONNECTOR_eDP;
>>          ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
> 
> It is better. Now the display panel is detected and reported to
> userspace, but it looks that something is not properly initialized,
> because there is garbage instead of the proper picture.
> 

I simulated the display path mentioned above on my RK3588S EVB1 Board.
To my slight surprise, it displayed normally with the reported connector 
type DRM_MODE_CONNECTOR_LVDS. ;-)

The modifications included:
1.Synchronized the Analogix DP ralated DT configurations with Samsung 
Snow Chromebook.
2.Skipped the I2C transfers and GPIO operations in nxp-ptn3460 driver.
3.Set the EDID to that of eDP Panel LP079QX1-SP0V forcibly.

Additionally, I added debug logs to verify whether the functions in 
ptn3460_bridge_funcs were actually called.

Did you encounter any unexpected logs during your investigation? I'd 
like to perform additional tests on this issue. :-)

Best regards,
Damon

--------------d57G0lgZVnIWmw0tVtNeChqU
Content-Type: text/plain; charset=UTF-8;
 name="simulation_for_ptn3460_20250904.patch"
Content-Disposition: attachment;
 filename="simulation_for_ptn3460_20250904.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszNTg4cy1ldmIx
LXYxMC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU4OHMtZXZiMS12
MTAuZHRzCmluZGV4IDBkZjNlODBmMmRkOS4uNTFjZTYzZmNlNmVlIDEwMDY0NAotLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL3JvY2tjaGlwL3JrMzU4OHMtZXZiMS12MTAuZHRzCisrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszNTg4cy1ldmIxLXYxMC5kdHMKQEAg
LTI2LDYgKzI2LDE4IEBAIGNob3NlbiB7CiAJCXN0ZG91dC1wYXRoID0gInNlcmlhbDI6MTUw
MDAwMG44IjsKIAl9OwogCisJcGFuZWw6IHBhbmVsIHsKKwkJY29tcGF0aWJsZSA9ICJhdW8s
YjExNnh3MDMiOworCQlwb3dlci1zdXBwbHkgPSA8JnZjYzN2M19sY2RfZWRwPjsKKwkJYmFj
a2xpZ2h0ID0gPCZiYWNrbGlnaHQ+OworCisJCXBvcnQgeworCQkJcGFuZWxfaW46IGVuZHBv
aW50IHsKKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmJyaWRnZV9vdXQ+OworCQkJfTsKKwkJ
fTsKKwl9OworCiAJYWRjLWtleXMgewogCQljb21wYXRpYmxlID0gImFkYy1rZXlzIjsKIAkJ
aW8tY2hhbm5lbHMgPSA8JnNhcmFkYyAxPjsKQEAgLTI0MiwyMSArMjU0LDYgQEAgJmNvbWJw
aHkyX3BzdSB7CiAmZWRwMCB7CiAJZm9yY2UtaHBkOwogCXN0YXR1cyA9ICJva2F5IjsKLQot
CWF1eC1idXMgewotCQlwYW5lbCB7Ci0JCQljb21wYXRpYmxlID0gImVkcC1wYW5lbCI7Ci0J
CQliYWNrbGlnaHQgPSA8JmJhY2tsaWdodD47Ci0JCQlwb3dlci1zdXBwbHkgPSA8JnZjYzN2
M19sY2RfZWRwPjsKLQkJCW5vLWhwZDsKLQotCQkJcG9ydCB7Ci0JCQkJcGFuZWxfaW5fZWRw
OiBlbmRwb2ludCB7Ci0JCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZWRwX291dF9wYW5lbD47
Ci0JCQkJfTsKLQkJCX07Ci0JCX07Ci0JfTsKIH07CiAKICZlZHAwX2luIHsKQEAgLTI2Niw4
ICsyNjMsOCBAQCBlZHAwX2luX3ZwMjogZW5kcG9pbnQgewogfTsKIAogJmVkcDBfb3V0IHsK
LQllZHBfb3V0X3BhbmVsOiBlbmRwb2ludCB7Ci0JCXJlbW90ZS1lbmRwb2ludCA9IDwmcGFu
ZWxfaW5fZWRwPjsKKwlkcF9vdXQ6IGVuZHBvaW50IHsKKwkJcmVtb3RlLWVuZHBvaW50ID0g
PCZicmlkZ2VfaW4+OwogCX07CiB9OwogCkBAIC0yOTAsNiArMjg3LDMzIEBAIGVzODM4ODog
YXVkaW8tY29kZWNAMTEgewogCQlQVkRELXN1cHBseSA9IDwmdmNjXzN2M19zMD47CiAJCSNz
b3VuZC1kYWktY2VsbHMgPSA8MD47CiAJfTsKKworCXB0bjM0NjA6IGx2ZHMtYnJpZGdlQDIw
IHsKKwkJY29tcGF0aWJsZSA9ICJueHAscHRuMzQ2MCI7CisJCXJlZyA9IDwweDIwPjsKKwkJ
ZWRpZC1lbXVsYXRpb24gPSA8NT47CisKKwkJcG9ydHMgeworCQkJI2FkZHJlc3MtY2VsbHMg
PSA8MT47CisJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKworCQkJcG9ydEAwIHsKKwkJCQlyZWcg
PSA8MD47CisKKwkJCQlicmlkZ2Vfb3V0OiBlbmRwb2ludCB7CisJCQkJCXJlbW90ZS1lbmRw
b2ludCA9IDwmcGFuZWxfaW4+OworCQkJCX07CisJCQl9OworCisJCQlwb3J0QDEgeworCQkJ
CXJlZyA9IDwxPjsKKworCQkJCWJyaWRnZV9pbjogZW5kcG9pbnQgeworCQkJCQlyZW1vdGUt
ZW5kcG9pbnQgPSA8JmRwX291dD47CisJCQkJfTsKKwkJCX07CisJCX07CisJfTsKIH07CiAK
ICZpMmM4IHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgv
YW5hbG9naXhfZHBfY29yZS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9h
bmFsb2dpeF9kcF9jb3JlLmMKaW5kZXggYTkzZmY4ZjBhNDY4Li4zNTU5MTFjNDczNTQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhfZHBf
Y29yZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgvYW5hbG9naXhf
ZHBfY29yZS5jCkBAIC0xNDkxLDkgKzE0OTEsMTEgQEAgaW50IGFuYWxvZ2l4X2RwX2JpbmQo
c3RydWN0IGFuYWxvZ2l4X2RwX2RldmljZSAqZHAsIHN0cnVjdCBkcm1fZGV2aWNlICpkcm1f
ZGV2KQogCQl9CiAJfQogCi0JYnJpZGdlLT5vcHMgPSBEUk1fQlJJREdFX09QX0RFVEVDVCB8
Ci0JCSAgICAgIERSTV9CUklER0VfT1BfRURJRCB8CisJYnJpZGdlLT5vcHMgPSBEUk1fQlJJ
REdFX09QX0VESUQgfAogCQkgICAgICBEUk1fQlJJREdFX09QX01PREVTOworCWlmIChkcm1f
YnJpZGdlX2lzX3BhbmVsKGRwLT5wbGF0X2RhdGEtPm5leHRfYnJpZGdlKSkKKwkJYnJpZGdl
LT5vcHMgfD0gRFJNX0JSSURHRV9PUF9ERVRFQ1Q7CisKIAlicmlkZ2UtPm9mX25vZGUgPSBk
cC0+ZGV2LT5vZl9ub2RlOwogCWJyaWRnZS0+dHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9l
RFA7CiAJcmV0ID0gZGV2bV9kcm1fYnJpZGdlX2FkZChkcC0+ZGV2LCAmZHAtPmJyaWRnZSk7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL254cC1wdG4zNDYwLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL254cC1wdG4zNDYwLmMKaW5kZXggN2FjYjExZjE2ZGMx
Li5jYWZiZGNkYTJkMjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvbnhw
LXB0bjM0NjAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL254cC1wdG4zNDYwLmMK
QEAgLTUyLDYgKzUyLDcgQEAgc3RhdGljIGludCBwdG4zNDYwX3JlYWRfYnl0ZXMoc3RydWN0
IHB0bjM0NjBfYnJpZGdlICpwdG5fYnJpZGdlLCBjaGFyIGFkZHIsCiB7CiAJaW50IHJldDsK
IAorCXJldHVybiAwOwogCXJldCA9IGkyY19tYXN0ZXJfc2VuZChwdG5fYnJpZGdlLT5jbGll
bnQsICZhZGRyLCAxKTsKIAlpZiAocmV0IDwgMCkgewogCQlEUk1fRVJST1IoIkZhaWxlZCB0
byBzZW5kIGkyYyBjb21tYW5kLCByZXQ9JWRcbiIsIHJldCk7CkBAIC05MCw2ICs5MSw3IEBA
IHN0YXRpYyBpbnQgcHRuMzQ2MF9zZWxlY3RfZWRpZChzdHJ1Y3QgcHRuMzQ2MF9icmlkZ2Ug
KnB0bl9icmlkZ2UpCiAJaW50IHJldDsKIAljaGFyIHZhbDsKIAorCXJldHVybiAwOwogCS8q
IExvYWQgdGhlIHNlbGVjdGVkIGVkaWQgaW50byBTUkFNIChhY2Nlc3NlZCBhdCBQVE4zNDYw
X0VESURfQUREUikgKi8KIAlyZXQgPSBwdG4zNDYwX3dyaXRlX2J5dGUocHRuX2JyaWRnZSwg
UFROMzQ2MF9FRElEX1NSQU1fTE9BRF9BRERSLAogCQkJcHRuX2JyaWRnZS0+ZWRpZF9lbXVs
YXRpb24pOwpAQCAtMTUyLDYgKzE1NCwyMSBAQCBzdGF0aWMgdm9pZCBwdG4zNDYwX2Rpc2Fi
bGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKIAlncGlvZF9zZXRfdmFsdWUocHRuX2Jy
aWRnZS0+Z3Bpb19wZF9uLCAwKTsKIH0KIAorc3RhdGljIGNvbnN0IHU4IGVkaWRfZGF0YVtd
ID0geworICAgIDB4MDAsIDB4RkYsIDB4RkYsIDB4RkYsIDB4RkYsIDB4RkYsIDB4RkYsIDB4
MDAsIDB4MTYsIDB4ODMsCisgICAgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgw
MCwgMHgwNCwgMHgxNywgMHgwMSwgMHgwMCwKKyAgICAweEE1LCAweDEwLCAweDBDLCAweDc4
LCAweDA2LCAweEVGLCAweDA1LCAweEEzLCAweDU0LCAweDRDLAorICAgIDB4OTksIDB4MjYs
IDB4MEYsIDB4NTAsIDB4NTQsIDB4MDAsIDB4MDAsIDB4MDAsIDB4MDEsIDB4MDEsCisgICAg
MHgwMSwgMHgwMSwgMHgwMSwgMHgwMSwgMHgwMSwgMHgwMSwgMHgwMSwgMHgwMSwgMHgwMSwg
MHgwMSwKKyAgICAweDAxLCAweDAxLCAweDAxLCAweDAxLCAweEVBLCAweDRFLCAweDAwLCAw
eDRDLCAweDYwLCAweDAwLAorICAgIDB4MTQsIDB4ODAsIDB4MEMsIDB4MTAsIDB4ODQsIDB4
MDAsIDB4NzgsIDB4QTAsIDB4MDAsIDB4MDAsCisgICAgMHgwMCwgMHgxOCwgMHgwMCwgMHgw
MCwgMHgwMCwgMHgxMCwgMHgwMCwgMHgwMCwgMHgwMCwgMHgwMCwKKyAgICAweDAwLCAweDAw
LCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLCAweDAwLAorICAg
IDB4MDAsIDB4MDAsIDB4MDAsIDB4RkUsIDB4MDAsIDB4NEMsIDB4NTAsIDB4MzAsIDB4Mzcs
IDB4MzksCisgICAgMHg1MSwgMHg1OCwgMHgzMSwgMHgyRCwgMHg1MywgMHg1MCwgMHgzMCwg
MHg1NiwgMHgwMCwgMHgwMCwKKyAgICAweDAwLCAweEZDLCAweDAwLCAweDQzLCAweDZGLCAw
eDZDLCAweDZGLCAweDcyLCAweDIwLCAweDRDLAorICAgIDB4NDMsIDB4NDQsIDB4MEEsIDB4
MjAsIDB4MjAsIDB4MjAsIDB4MDAsIDB4M0YKK307CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX2VkaWQgKnB0bjM0NjBfZWRpZF9yZWFkKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2Us
CiAJCQkJCQlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQpAQCAtMTc4LDcgKzE5
NSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2VkaWQgKnB0bjM0NjBfZWRpZF9yZWFk
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCiAJCWdvdG8gb3V0OwogCX0KIAotCWRybV9l
ZGlkID0gZHJtX2VkaWRfYWxsb2MoZWRpZCwgRURJRF9MRU5HVEgpOworCWtmcmVlKGVkaWQp
OworCWRybV9lZGlkID0gZHJtX2VkaWRfYWxsb2MoZWRpZF9kYXRhLCBFRElEX0xFTkdUSCk7
CiAKIG91dDoKIAlpZiAocG93ZXJfb2ZmKQpAQCAtMjczLDcgKzI5MSw3IEBAIHN0YXRpYyBp
bnQgcHRuMzQ2MF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogCXB0bl9icmlk
Z2UtPnBhbmVsX2JyaWRnZSA9IHBhbmVsX2JyaWRnZTsKIAlwdG5fYnJpZGdlLT5jbGllbnQg
PSBjbGllbnQ7CiAKLQlwdG5fYnJpZGdlLT5ncGlvX3BkX24gPSBkZXZtX2dwaW9kX2dldCgm
Y2xpZW50LT5kZXYsICJwb3dlcmRvd24iLAorCXB0bl9icmlkZ2UtPmdwaW9fcGRfbiA9IGRl
dm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKCZjbGllbnQtPmRldiwgInBvd2VyZG93biIsCiAJCQkJ
CSAgICAgICBHUElPRF9PVVRfSElHSCk7CiAJaWYgKElTX0VSUihwdG5fYnJpZGdlLT5ncGlv
X3BkX24pKSB7CiAJCXJldCA9IFBUUl9FUlIocHRuX2JyaWRnZS0+Z3Bpb19wZF9uKTsKQEAg
LTI4NSw3ICszMDMsNyBAQCBzdGF0aWMgaW50IHB0bjM0NjBfcHJvYmUoc3RydWN0IGkyY19j
bGllbnQgKmNsaWVudCkKIAkgKiBSZXF1ZXN0IHRoZSByZXNldCBwaW4gbG93IHRvIGF2b2lk
IHRoZSBicmlkZ2UgYmVpbmcKIAkgKiBpbml0aWFsaXplZCBwcmVtYXR1cmVseQogCSAqLwot
CXB0bl9icmlkZ2UtPmdwaW9fcnN0X24gPSBkZXZtX2dwaW9kX2dldCgmY2xpZW50LT5kZXYs
ICJyZXNldCIsCisJcHRuX2JyaWRnZS0+Z3Bpb19yc3RfbiA9IGRldm1fZ3Bpb2RfZ2V0X29w
dGlvbmFsKCZjbGllbnQtPmRldiwgInJlc2V0IiwKIAkJCQkJCUdQSU9EX09VVF9MT1cpOwog
CWlmIChJU19FUlIocHRuX2JyaWRnZS0+Z3Bpb19yc3RfbikpIHsKIAkJcmV0ID0gUFRSX0VS
UihwdG5fYnJpZGdlLT5ncGlvX3JzdF9uKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cC5jCmluZGV4IDgwYmE3MDBkMjk2NC4uZDA0MjJmOTQwMjQ5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2RwLmMKQEAgLTEwNCw3ICsxMDQsNyBAQCBzdGF0aWMgaW50IGV4eW5v
c19kcF9icmlkZ2VfYXR0YWNoKHN0cnVjdCBhbmFsb2dpeF9kcF9wbGF0X2RhdGEgKnBsYXRf
ZGF0YSwKIAkvKiBQcmUtZW1wdCBEUCBjb25uZWN0b3IgY3JlYXRpb24gaWYgdGhlcmUncyBh
IGJyaWRnZSAqLwogCWlmIChwbGF0X2RhdGEtPm5leHRfYnJpZGdlKSB7CiAJCXJldCA9IGRy
bV9icmlkZ2VfYXR0YWNoKCZkcC0+ZW5jb2RlciwgcGxhdF9kYXRhLT5uZXh0X2JyaWRnZSwg
YnJpZGdlLAotCQkJCQkwKTsKKwkJCQkJRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVDVE9S
KTsKIAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7CiAJfQo=

--------------d57G0lgZVnIWmw0tVtNeChqU--
