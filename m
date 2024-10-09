Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208659967D5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 12:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2CA10E6DD;
	Wed,  9 Oct 2024 10:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YS0W/Vhm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E5710E6DD
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 10:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SYcEpFvriF691vpSHFKbcIawkStWMIlMIB49tQ9tXgo=; b=YS0W/VhmlkRZQ7olUgN1hGl4qA
 jpRRJozPx24r396v2qOsl6L5dWe8zbATLX7lJiXwE4XbAc8Z81pJCqFKqYFVEpmw5TFJrWVD43deh
 2uYEjo56HwTU0EJ98uPTSX0isBX7hsJD6IxfORHbjut6qGYAOLS3+kKt4t15BZlmpeEjOjtq+jIvd
 0C8n7VXMuPRHvLnLFzKktItnqJMjPyfjvGuKalbqDlDSrywtLLF1XrdmU6nQUAeOUc34ekimL2JPH
 vPBKrCAM8TQpBy/IVe3ZWuZWFAZ23IOppWFvKTEqPse5MWptOVzdMQDGXmlxmOGPG90fJtgnO/9xP
 cm00nMcw==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1syUN5-006ual-1p; Wed, 09 Oct 2024 12:56:47 +0200
Message-ID: <20653f44-39a5-4dc9-a37b-be55d7685a05@igalia.com>
Date: Wed, 9 Oct 2024 07:56:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vc4: Set `fbdev_probe` in `struct vc5_drm_driver`
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241009004332.1901833-1-mcanal@igalia.com>
 <164f5bd6-c240-42af-aef4-37db7e2041cc@suse.de>
 <20241009-melodic-adorable-groundhog-2c01af@houat>
 <CAPY8ntBAujmMV2RD0FLcE94St6tuP6jwC6cMAE+YmHb8qN5h_g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <CAPY8ntBAujmMV2RD0FLcE94St6tuP6jwC6cMAE+YmHb8qN5h_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Dave,

On 10/9/24 07:45, Dave Stevenson wrote:
> On Wed, 9 Oct 2024 at 08:55, Maxime Ripard <mripard@kernel.org> wrote:
>>
>> On Wed, Oct 09, 2024 at 08:59:29AM GMT, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 09.10.24 um 02:40 schrieb Maíra Canal:
>>>> Currently, when booting the RPi 4B, we get a NULL pointer dereference:
>>>>
>>>> [    7.642883] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000038
>>>> [    7.642926] Mem abort info:
>>>> [    7.642938]   ESR = 0x0000000096000044
>>>> [    7.642951]   EC = 0x25: DABT (current EL), IL = 32 bits
>>>> [    7.642968]   SET = 0, FnV = 0
>>>> [    7.642981]   EA = 0, S1PTW = 0
>>>> [    7.642993]   FSC = 0x04: level 0 translation fault
>>>> [    7.643007] Data abort info:
>>>> [    7.643017]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
>>>> [    7.643032]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
>>>> [    7.643046]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>>>> [    7.643063] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000107487000
>>>> [    7.643081] [0000000000000038] pgd=0000000000000000, p4d=0000000000000000
>>>> [    7.643113] Internal error: Oops: 0000000096000044 [#1] PREEMPT SMP
>>>> [    7.643131] Modules linked in: snd_bcm2835(C)  [...] vc4 v3d [...]
>>>> drm_shmem_helper drm_dma_helper drm_kms_helper drm [...] ipv6
>>>> [    7.643377] CPU: 1 UID: 0 PID: 48 Comm: kworker/u16:2 Tainted: G         C         6.12.0-rc1-00310-g2c34a5464007 #185
>>>> [    7.643407] Tainted: [C]=CRAP
>>>> [    7.643419] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)
>>>> [    7.643438] Workqueue: events_unbound deferred_probe_work_func
>>>> [    7.643477] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>> [    7.643499] pc : __drm_fb_helper_initial_config_and_unlock+0x40c/0x588 [drm_kms_helper]
>>>> [    7.643616] lr : __drm_fb_helper_initial_config_and_unlock+0x374/0x588 [drm_kms_helper]
>>>> [    7.643710] sp : ffff8000806c3900
>>>> [    7.643724] x29: ffff8000806c3950 x28: ffff431b01a3ec14 x27: 0000000000000010
>>>> [    7.643758] x26: ffff431b0369f000 x25: 0000000036314752 x24: ffff431b003b6200
>>>> [    7.643790] x23: ffff431b0369f000 x22: 00000000000002d0 x21: ffff431b003b6030
>>>> [    7.643821] x20: ffff431b003b6030 x19: ffff431b003b6000 x18: ffff431b002e6e48
>>>> [    7.643852] x17: 0000000000000001 x16: ffffb19c2f10614c x15: 0000000000000000
>>>> [    7.643882] x14: 0000000000000000 x13: ffff431b003b62f0 x12: 0000000000000500
>>>> [    7.643913] x11: 0000000000000000 x10: 0000000000000000 x9 : 005d6e6f6362665b
>>>> [    7.643945] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 000000000000003f
>>>> [    7.643975] x5 : ffffb19bcb45c59c x4 : 0000000000001e00 x3 : ffffb19bcb420c20
>>>> [    7.644005] x2 : 0000000000000000 x1 : 0000000000000001 x0 : ffff431b003b6000
>>>> [    7.644036] Call trace:
>>>> [    7.644049]  __drm_fb_helper_initial_config_and_unlock+0x40c/0x588 [drm_kms_helper]
>>>> [    7.644149]  drm_fb_helper_initial_config+0x34/0x4c [drm_kms_helper]
>>>> [    7.644240]  drm_fbdev_client_hotplug+0x74/0xc8 [drm_kms_helper]
>>>> [    7.644331]  drm_client_register+0x58/0xa0 [drm]
>>>> [    7.644571]  drm_fbdev_client_setup+0xc4/0x17c [drm_kms_helper]
>>>> [    7.644664]  drm_client_setup_with_fourcc+0x28/0x60 [drm_kms_helper]
>>>> [    7.644755]  vc4_drm_bind+0x218/0x264 [vc4]
>>>> [    7.644855]  try_to_bring_up_aggregate_device+0x168/0x1b4
>>>> [    7.644884]  __component_add+0xb8/0x158
>>>> [    7.644905]  component_add+0x14/0x20
>>>> [    7.644925]  vc4_hvs_dev_probe+0x1c/0x28 [vc4]
>>>> [    7.645019]  platform_probe+0xa8/0xd0
>>>> [    7.645045]  really_probe+0x128/0x2c8
>>>> [    7.645065]  __driver_probe_device+0xa0/0x128
>>>> [    7.645086]  driver_probe_device+0x3c/0x1f8
>>>> [    7.645106]  __device_attach_driver+0x118/0x140
>>>> [    7.645127]  bus_for_each_drv+0xf4/0x14c
>>>> [    7.645145]  __device_attach+0xfc/0x194
>>>> [    7.645164]  device_initial_probe+0x14/0x20
>>>> [    7.645184]  bus_probe_device+0x94/0x100
>>>> [    7.645202]  deferred_probe_work_func+0x88/0xc4
>>>> [    7.645223]  process_scheduled_works+0x194/0x2c4
>>>> [    7.645246]  worker_thread+0x290/0x39c
>>>> [    7.645265]  kthread+0xfc/0x184
>>>> [    7.645289]  ret_from_fork+0x10/0x20
>>>> [    7.645317] Code: f2ac6c49 aa1303e0 f2cdcde9 f2e00ba9 (f9001d09)
>>>> [    7.645338] ---[ end trace 0000000000000000 ]---
>>>>
>>>> This happens because commit 45903624e9fc ("drm/vc4: Run DRM default client
>>>> setup") only added DRM_FBDEV_DMA_DRIVER_OPS to `struct vc4_drm_driver`
>>>> and didn't add it to `struct vc5_drm_driver`. The `struct vc4_drm_driver`
>>>> is used in RPi 0-3, as VC4 is also a render node in those RPis. But RPi 4
>>>> and 5 use V3D as the render node and VC4 as modeset node and therefore,
>>>> use `struct vc5_drm_driver`.
>>>>
>>>> This commit adds DRM_FBDEV_DMA_DRIVER_OPS to `struct vc5_drm_driver`,
>>>> ensuring that `fbdev_probe` exists for all VC4 generations.
>>>>
>>>> Fixes: 45903624e9fc ("drm/vc4: Run DRM default client setup")
>>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>>
>>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> It's the third time it was sent:
>>
>> https://lore.kernel.org/dri-devel/20241002-vc4_fbdev_fix-v1-1-8737bd11b147@raspberrypi.com/
>> https://lore.kernel.org/dri-devel/20241003092826.1942901-3-m.szyprowski@samsung.com/
> 
> It is. No one responded to my version. I can merge Marek's vc4 change
> with my R-b, or now Maira's with Thomas and mine.
> But both the other two submissions also included a patch so that
> drm_fb_helper handled the error more cleanly [1 and 2]. I'm still new
> to maintainership, but I don't believe I'm in a position to merge
> either of those.
> 

I'm sorry, those patches went unnoticed by me. For me, the priority
would be to fix RPi 4 display as soon as possible. As you were the
first one to send the fix, you can apply the fix to drm-misc-next
with my R-b. I won't R-b the second patch, as I believe Thomas has more
experience with fbdev.

Best Regards,
- Maíra

>    Dave
> 
> [1] https://lore.kernel.org/dri-devel/20241002-vc4_fbdev_fix-v1-2-8737bd11b147@raspberrypi.com/
> [2] https://lore.kernel.org/dri-devel/20241003092826.1942901-2-m.szyprowski@samsung.com/
