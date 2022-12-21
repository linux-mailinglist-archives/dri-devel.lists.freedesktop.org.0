Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9251D653739
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 20:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE68C10E4A0;
	Wed, 21 Dec 2022 19:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 316 seconds by postgrey-1.36 at gabe;
 Wed, 21 Dec 2022 19:51:34 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A554810E49A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 19:51:34 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.22]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MeCd5-1oZIaK3Fp9-00bK6A; Wed, 21 Dec 2022 20:46:03 +0100
Message-ID: <47a25f27-a3a1-5ec3-0c63-e68d05dff94e@i2se.com>
Date: Wed, 21 Dec 2022 20:46:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: WARNING: CPU: 2 PID: 42 at drivers/gpu/drm/drm_modeset_lock.c:276
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BHn6JvFLmmnM8VytzmPeEjK8b1zSAS4y63BGplHFRgVm43vxfkP
 7I0uNbek8pgnL3BZ0pEzrd2Gm/hjnultua/EBuJrRe8AcSRalTjnR3DWAUaIbr9srBHCzpt
 pZMwEkVHCKwY/rINQetCWM3cG61xF/eepvxiB2JuxsX6zPvmZDEOND4epVU6Mdl7GblNUlo
 5VkUFH9QcMX+XcumFBYgQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wph/CYJ+sZw=;K/D5rijjCe+Y+v0H/jgwo+QaCfj
 vnVzglKB5etpDMQOQQ+B7O/g3d6WzprD98//ugMxNQ/Cl4iT1ML1K0zff0bnaqxbLqHVn46iv
 JQvyjfWup7FxVdUys1pr8K7rqqWTBFjKJr5enhHefPrZfl747GvqFbYNE0Attbqha9IlPk489
 qq7oVOEsdwAE9ZGVL9UxLB2QZRnHfOSDUySqjxOoSMqQqpOwsIjhI4UIum39RtmTYTgNHF2U/
 MBoGlVwU3gghjYpHS8LRDge6pMIDeg9gmRk+SoTMvc1fqSKJR4nTL3fnVA7pp0eLXnUhP8v7Z
 hzAHuweNDDp0RwDRAgbJSTuArOlRdOeVDWQb9AL60zlhcd7IG1xzVxjMF14AFKaD/10v3mjxx
 GRmnfYFR9cU6H6HfPcuosy6kABlZkRGxtbEzfZTD8SkEyG2KN9Awg/SNgHeHoE9PmLy0YJvcE
 c4M4HpVCry2renYaCJhcA9P3e6hvr6c220R5ADtDw67lkpHCR+bZvnyLnYX84mkR4QmUly5C5
 p0EfbX77asd6862HMImM48G6ywjB9wMh1u4pNmmZ2Ln/GC/uKaGZLdR5aF+aWukRT+CIVIEF+
 wFA7ZxUOz/EuKwgcC7o8W/c/JNdYjV/iWacgXek+1iuIOWQURZu6S4nbaboueb/BohaJRQ1Qk
 EIiK51T5Ay79pyIHeU2C8b7B+LksGH9ci3V485C7ZQ==
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

if i enable PROVE_LOCKING on the Raspberry Pi 3 B+ 
(arm/multi_v7_defconfig) using v6.1 (didn't test older versions) i'm 
getting the following warning:

[  204.043396] WARNING: CPU: 2 PID: 42 at 
drivers/gpu/drm/drm_modeset_lock.c:276 drm_modeset_drop_locks+0x6c/0x70
[  204.043426] Modules linked in: aes_arm aes_generic cmac 
bcm2835_v4l2(C) bcm2835_mmal_vchiq(C) videobuf2_vmalloc videobuf2_memops 
videobuf2_v4l2 videobuf2_common videodev mc snd_bcm2835(C) crc32_arm_ce 
brcmfmac brcmutil vc4 snd_soc_hdmi_codec sha256_generic libsha256 
snd_soc_core ac97_bus snd_pcm_dmaengine snd_pcm sha256_arm snd_timer 
cfg80211 onboard_usb_hub snd hci_uart raspberrypi_hwmon soundcore 
drm_dma_helper btbcm bluetooth ecdh_generic bcm2835_thermal ecc libaes 
vchiq(C) microchip lan78xx
[  204.043820] CPU: 2 PID: 42 Comm: kworker/2:1 Tainted: G C         
6.1.0-00007-g22fada783b9f #31
[  204.043833] Hardware name: BCM2835
[  204.043842] Workqueue: events output_poll_execute
[  204.043866]  unwind_backtrace from show_stack+0x10/0x14
[  204.043886]  show_stack from dump_stack_lvl+0x58/0x70
[  204.043903]  dump_stack_lvl from __warn+0xc8/0x1e8
[  204.043920]  __warn from warn_slowpath_fmt+0x5c/0xb8
[  204.043936]  warn_slowpath_fmt from drm_modeset_drop_locks+0x6c/0x70
[  204.043952]  drm_modeset_drop_locks from 
drm_helper_probe_detect_ctx+0xd4/0x124
[  204.043969]  drm_helper_probe_detect_ctx from 
output_poll_execute+0x154/0x230
[  204.043986]  output_poll_execute from process_one_work+0x288/0x708
[  204.044004]  process_one_work from worker_thread+0x54/0x50c
[  204.044020]  worker_thread from kthread+0xe8/0x104
[  204.044034]  kthread from ret_from_fork+0x14/0x2c
[  204.044048] Exception stack(0xf0915fb0 to 0xf0915ff8)
[  204.044059] 5fa0:                                     00000000 
00000000 00000000 00000000
[  204.044070] 5fc0: 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000
[  204.044080] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[  204.044090] irq event stamp: 33189
[  204.044100] hardirqs last  enabled at (33195): [<c03ba3b4>] 
__up_console_sem+0x50/0x60
[  204.044120] hardirqs last disabled at (33200): [<c03ba3a0>] 
__up_console_sem+0x3c/0x60
[  204.044136] softirqs last  enabled at (32836): [<c0366478>] 
process_one_work+0x288/0x708
[  204.044152] softirqs last disabled at (32832): [<c0fb7134>] 
neigh_managed_work+0x18/0xa4
[  204.044168] ---[ end trace 0000000000000000 ]---

Best regards

