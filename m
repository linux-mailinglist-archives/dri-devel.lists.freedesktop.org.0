Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F73452F45B
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 22:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E89010E6AF;
	Fri, 20 May 2022 20:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1553C10E6AF
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 20:26:10 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.149]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MlwFp-1nQko02GYt-00izR1; Fri, 20 May 2022 22:25:59 +0200
Message-ID: <3dd4e0cb-8ba5-e0c7-cde5-29c56a5caa95@i2se.com>
Date: Fri, 20 May 2022 22:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: vc4: Couldn't stop firmware display driver during boot
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <69c4f25d-7b48-081b-f609-8e1fd5f950cb@i2se.com>
 <df9d739d-7dff-4e2b-d1cd-66a5c5887cab@i2se.com>
 <42f24a68-391a-e6c8-25a7-511e91a5c7f9@i2se.com>
 <20220411073511.l5v7aqwbg6sdedjf@houat>
 <16571256-de30-db4e-6eea-268b0ef00103@i2se.com>
In-Reply-To: <16571256-de30-db4e-6eea-268b0ef00103@i2se.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Af3foRJuVI0i9SagbwpHAytRJgD4FCM+VS7RKtJ0jCrjalneqNn
 abAJQ6PlpOSzt8d/5pUbYaLP/vykccI+8coj0+VF9UWJo8YdZkrcGX5TPE0Q4HpunXkiPZm
 7X0queLTqogakW+jq+W+sDMCKx/BkTt8m6iFuNtNiYwyd5e0JFgInVeVrIVQwHj2TntPvZ2
 vhE6FP/1F+cBjubHS/O/A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TnXbdVGvW90=:IW7+P3xJl8STuRhxSn5tf7
 6qYmwMm2UtqfxiNaMdZAqVFvQ3vpTZraMUjinpfLpybIDjuUXaVDfEygcmEdTzugY5tWkaRHU
 qd6aX9Q/T3VMhK0JPbZYmngNM1SKPhwLC1kWZWSQBSmg4JrIXBm6pCEBi6NXRIdSjUM5jrBCY
 jBomWWwyhtltCF4lpqOWHsz9Pdvlf3SpoasXm6MnXrQRCd6W7MZjEDxG8wp9H88fubDKaSKEd
 L2ckIIDRZWcPd1TvoQrJC+0dUrzTeW2EmYsegDckYB5qEwVB+nrPryfA8AYy4RDNApKLpEil1
 ViJcokBLNBqzaVwsIbKOAbUYmpBWnQI/JVRbQAZQoJfSUFtbBqTXiITndzlhZIVr/h+FzKcwb
 iB2qq31I8rHKo1dyxO8fvMCeFbj9AQzm9ytbpmIEdhlWrx6RwXgJRhI+tDEVYG+6HG+0PDAQT
 gYLnlHzjvgffYCUGRO+e3i3BRhMYg4xmFfsHRalFYaD4MPx5zV2Wr5A57MR2jFlhImGCXOmip
 HzpldoFaq4acld1PnzggPq21cC1goYwb1UHnR/A6EwxjVax1miUjYVkb01bKCXIA9rir7Ey5q
 /meHsl3wPLGkky2+KP+3kXEVEDJNpBcTSxYPQPIUatlvDlbb/91XiMIKgxRe69C1VNs1WZKlE
 RimVNP3ckRhy5cdMIeMNG91kIu9jbySqdeNqPEWAnIgFEs4GWTSqo7xcJA3hcnFv4BPL/rf+A
 W14uWXPKomOXvvt4qY8treszBb7FZK8zfKRdq54UZwqrcp21tz8s3dXZO2w=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am 11.04.22 um 13:00 schrieb Stefan Wahren:
> Hi Maxime,
>
> Am 11.04.22 um 09:35 schrieb Maxime Ripard:
>> Hi Stefan,
>>
>> On Sun, Apr 10, 2022 at 02:32:02AM +0200, Stefan Wahren wrote:
>>> Am 09.04.22 um 21:25 schrieb Stefan Wahren:
>>>> Hi,
>>>>
>>>> today i tested Linux 5.18-rc1 on my Raspberry Pi 400 connected to my
>>>> HDMI display (multi_v7_defconfig + CONFIG_ARM_LPAE, firmware:
>>>> 2021-01-08T14:31:16) and i'm getting these strange errors from
>>>> raspberrypi-firmware driver / vc4 during boot:
>>>>
>>>> [   13.094733] fb0: switching to vc4 from simple
>>>> [   13.110759] Console: switching to colour dummy device 80x30
>>>> [   13.120691] raspberrypi-firmware soc:firmware: Request 0x00030066
>>>> returned status 0x80000001
>>>> [   13.120715] vc4-drm gpu: [drm] Couldn't stop firmware display 
>>>> driver:
>>>> -22
>>> This is a new error which was introduced with Linux 5.18-rc1 
>>> (c406ad5e4a85
>>> "drm/vc4: Notify the firmware when DRM is in charge"). 0x00030066 
>>> stands for
>>> the new firmware property RPI_FIRMWARE_NOTIFY_DISPLAY_DONE. And i 
>>> guess the
>>> firmware from January 2021 doesn't support it?
>> If I remember well, this was added some time in the middle of last year,
>> so it wouldn't surprise me that your firmware doesn't support it.
>>
>> It's not really harmful, but it might still be a good idea to upgrade
>> your firmware. The display pipeline has an unflushable FIFO between
>> devices and if we don't take special care when disabling all the devices
>> in that pipeline, we end up with a shift of one pixel for the rest of
>> the system's life.
>>
>> We have some code to deal with the transition between the firmware and
>> the kernel, but we couldn't make it work reliably so we ended up asking
>> the firmware instead.
>>
>> So.. Yeah, it's bad if you want to use the displays output, but it not
>> critical either.
>
> I understand. I think it would be nice to give the user a more helpful 
> warning how to possible fix this, because we cannot assume that every 
> system has the latest firmware.
>
> Also i'm not sure if should give this warning once or on every probing 
> attempt.

while chasing a vchiq performance regression, i was possibly able to 
crash the VPU firmware (2021-04-30T13:47:07) during boot of my Raspberry 
Pi 3B+ based on 3d7285a335ed + the bcm2835 clock fix. So this is just a 
warning, it's not totally harmless:

    10.172282] raspberrypi-firmware soc:firmware: Request 0x00030066 
returned status 0x80000001
[   10.172321] vc4-drm soc:gpu: [drm] Couldn't stop firmware display 
driver: -22
[   10.172452] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
[   10.200134] Bluetooth: hci0: BCM4345C0 'brcm/BCM4345C0.hcd' Patch
[   10.222634] usbcore: registered new interface driver lan78xx
[   10.225538] raspberrypi-firmware soc:firmware: Request 0x00030066 
returned status 0x80000001
[   10.225563] vc4-drm soc:gpu: [drm] Couldn't stop firmware display 
driver: -22
[   10.225645] vc4-drm soc:gpu: bound 3f400000.hvs (ops 
vc4_drm_unregister [vc4])
[   10.298306] raspberrypi-firmware soc:firmware: Request 0x00030066 
returned status 0x80000001
[   10.298354] vc4-drm soc:gpu: [drm] Couldn't stop firmware display 
driver: -22
[   10.298485] vc4-drm soc:gpu: bound 3f400000.hvs (ops 
vc4_drm_unregister [vc4])
[   10.305977] brcmfmac: brcmf_fw_alloc_request: using 
brcm/brcmfmac43455-sdio for chip BCM4345/6
[   10.306214] brcmfmac mmc1:0001:1: Direct firmware load for 
brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.bin failed with error -2
[   10.311775] raspberrypi-firmware soc:firmware: Request 0x00030066 
returned status 0x80000001
[   10.311808] vc4-drm soc:gpu: [drm] Couldn't stop firmware display 
driver: -22
[   10.311924] vc4-drm soc:gpu: bound 3f400000.hvs (ops 
vc4_drm_unregister [vc4])
[   10.357778] brcmfmac mmc1:0001:1: Direct firmware load for 
brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt failed with error -2
[   10.508333] brcmfmac: brcmf_fw_alloc_request: using 
brcm/brcmfmac43455-sdio for chip BCM4345/6
[   10.534262] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/6 wl0: 
Jan  4 2021 19:56:29 version 7.45.229 (617f1f5 CY) FWID 01-2dbd9d2e
[   10.705127] snd_bcm2835: module is from the staging directory, the 
quality is unknown, you have been warned.
[   10.721668] mc: Linux media interface: v0.10
[   10.746851] videodev: Linux video capture interface: v2.00
[   10.783077] bcm2835_mmal_vchiq: module is from the staging directory, 
the quality is unknown, you have been warned.
[   10.813073] bcm2835_v4l2: module is from the staging directory, the 
quality is unknown, you have been warned.
[   11.049270] Bluetooth: hci0: BCM43455 37.4MHz Raspberry Pi 3+
[   11.049294] Bluetooth: hci0: BCM4345C0 (003.001.025) build 0342
[   11.837093] ------------[ cut here ]------------
[   11.837113] WARNING: CPU: 2 PID: 40 at 
drivers/firmware/raspberrypi.c:63 rpi_firmware_property_list+0x1ac/0x250
[   11.837142] Firmware transaction timeout
[   11.837144] Modules linked in: bcm2835_v4l2(C+) snd_soc_hdmi_codec 
bcm2835_mmal_vchiq(C) videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 
videobuf2_common videodev mc snd_bcm2835(C+) brcmfmac brcmutil vc4 
microchip snd_soc_core ac97_bus snd_pcm_dmaengine snd_pcm sha256_generic 
libsha256 lan78xx sha256_arm cfg80211 snd_timer hci_uart snd btbcm 
soundcore crc32_arm_ce drm_cma_helper bluetooth ecdh_generic 
raspberrypi_hwmon ecc libaes bcm2835_thermal vchiq(C)
[   11.837252] CPU: 2 PID: 40 Comm: kworker/u8:1 Tainted: G         
C        5.18.0-rc7-00121-g3d7285a335ed-dirty #49
[   11.837260] Hardware name: BCM2835
[   11.837265] Workqueue: events_unbound deferred_probe_work_func
[   11.837286]  unwind_backtrace from show_stack+0x10/0x14
[   11.837300]  show_stack from dump_stack_lvl+0x40/0x4c
[   11.837313]  dump_stack_lvl from __warn+0x144/0x148
[   11.837326]  __warn from warn_slowpath_fmt+0x70/0xb4
[   11.837336]  warn_slowpath_fmt from 
rpi_firmware_property_list+0x1ac/0x250
[   11.837347]  rpi_firmware_property_list from 
rpi_firmware_property+0x60/0x8c
[   11.837358]  rpi_firmware_property from vc4_drm_bind+0x150/0x234 [vc4]
[   11.837423]  vc4_drm_bind [vc4] from 
try_to_bring_up_aggregate_device+0x15c/0x1b4
[   11.837469]  try_to_bring_up_aggregate_device from 
component_master_add_with_match+0xc4/0xf8
[   11.837479]  component_master_add_with_match from 
vc4_platform_drm_probe+0xa8/0xcc [vc4]
[   11.837523]  vc4_platform_drm_probe [vc4] from platform_probe+0x5c/0xb8
[   11.837568]  platform_probe from really_probe+0xc0/0x278
[   11.837578]  really_probe from __driver_probe_device+0x84/0xe4
[   11.837590]  __driver_probe_device from driver_probe_device+0x34/0xd4
[   11.837601]  driver_probe_device from __device_attach_driver+0x88/0xb4
[   11.837612]  __device_attach_driver from bus_for_each_drv+0x54/0xb4
[   11.837624]  bus_for_each_drv from __device_attach+0xdc/0x148
[   11.837635]  __device_attach from bus_probe_device+0x84/0x8c
[   11.837646]  bus_probe_device from deferred_probe_work_func+0x7c/0xa8
[   11.837657]  deferred_probe_work_func from process_one_work+0x228/0x4fc
[   11.837671]  process_one_work from worker_thread+0x40/0x544
[   11.837682]  worker_thread from kthread+0xd8/0xf4
[   11.837693]  kthread from ret_from_fork+0x14/0x2c
[   11.837702] Exception stack(0xf090dfb0 to 0xf090dff8)
[   11.837709] dfa0:                                     00000000 
00000000 00000000 00000000
[   11.837716] dfc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[   11.837722] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   11.837726] ---[ end trace 0000000000000000 ]---
[   11.837746] vc4-drm soc:gpu: [drm] Couldn't stop firmware display 
driver: -110
[   11.837846] vc4-drm soc:gpu: bound 3f400000.hvs (ops 
vc4_drm_unregister [vc4])
[   12.877131] raspberrypi-clk raspberrypi-clk: Failed to change 
fw-clk-arm frequency: -110
[   13.917073] hwmon hwmon1: Failed to get throttled (-110)

>
> Best regards
> Stefan
>
>>
>> Maxime
