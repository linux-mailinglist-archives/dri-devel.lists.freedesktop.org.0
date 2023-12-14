Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481D5812FD8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 13:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CDC10E2E4;
	Thu, 14 Dec 2023 12:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C0E10E303
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 12:13:42 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20231214121340euoutp0215dc656600de37a679984d6ca908acd6~gsa4jvw0_1007910079euoutp02X
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 12:13:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20231214121340euoutp0215dc656600de37a679984d6ca908acd6~gsa4jvw0_1007910079euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1702556020;
 bh=FdPZnf44FGd2qjgXuo0uhJcrDVaVMr99TJV2Wcx0sSw=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=X1ml31FDTUz6x8ul84GShhBrhTVHseOaadk3d+7gSk+AtnV/pBoiVkfL5tdp/FET2
 lZZ0pImX1W5FrFMe9EXQGZB4dkD32Q+y+LfQqKRIO9Gyw7+DPbJhnIQPJ/+MWTy0cw
 Uz7H4ei/yOGwjbXzB0pIMW6J3DL70IV7tGHnN0BM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20231214121340eucas1p233aea7a1d1115096d0a4bee655e917f5~gsa4ZD_Bm1910919109eucas1p2C;
 Thu, 14 Dec 2023 12:13:40 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 0F.07.09539.471FA756; Thu, 14
 Dec 2023 12:13:40 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20231214121339eucas1p105b5903b7a5f1933aa2c88c2cfd13288~gsa39ePuQ3068030680eucas1p1q;
 Thu, 14 Dec 2023 12:13:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20231214121339eusmtrp28484fcb563065712237cdd8d804e4530~gsa382m962141721417eusmtrp2v;
 Thu, 14 Dec 2023 12:13:39 +0000 (GMT)
X-AuditID: cbfec7f2-515ff70000002543-ef-657af174bf43
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 59.36.09146.371FA756; Thu, 14
 Dec 2023 12:13:39 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20231214121339eusmtip234eeeca7bc42cafc400f2a644526ba66~gsa3N9zaY1163311633eusmtip28;
 Thu, 14 Dec 2023 12:13:39 +0000 (GMT)
Message-ID: <98a9f15d-30ac-47bf-9b93-3aa2c9900f7b@samsung.com>
Date: Thu, 14 Dec 2023 13:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5,02/16] Revert
 "drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume"
To: Andy Yan <andyshrk@163.com>, heiko@sntech.de
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20231211115719.1784834-1-andyshrk@163.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJKsWRmVeSWpSXmKPExsWy7djP87olH6tSDXadFLLoP3+T0eJy30k2
 i+6jS5kt5h85x2px5et7Nov/j16zWsydVGuxbfpPNou+Fw+ZLS7vmsNm8enBf2aL1r1H2C3+
 bt/EYnH3tZ8Dn8fiFVNYPXbcXcLosWlVJ5vHnWt72Dzudx9n8ti8pN6j/6+Bx99Z+1k8tl+b
 x+zxeZNcAFcUl01Kak5mWWqRvl0CV8bl+e2sBZcmMlb8PzyDpYHxbQtjFyMnh4SAicTeqTtZ
 uxi5OIQEVjBKfPl0jBHC+cIo0X7mPTuE85lRYu6nwywwLesmr2YDsYUEljNKbGvQgyj6yCix
 /u8GsASvgJ3E1633WEFsFgFViVeXLrNAxAUlTs58AmaLCshL3L81gx3EFhZIkJg+9xYTiC0i
 YCAxu/8K2E3MAj+ZJK43TgQbyiwgLnHryXywIjYBQ4mut11gcU4BC4mO45uZIWrkJZq3zmYG
 aZYQ2MwpseTHY3aIs10kzvTfZoKwhSVeHd8CFZeR+L8TZChIQzujxILf96GcCYwSDc9vQcPJ
 WuLOuV9A6ziAVmhKrN+lDxF2lHj5aiojSFhCgE/ixltBiCP4JCZtm84MEeaV6GgTgqhWk5h1
 fB3c2oMXLjFPYFSahRQus5C8OQvJO7MQ9i5gZFnFKJ5aWpybnlpsmJdarlecmFtcmpeul5yf
 u4kRmPpO/zv+aQfj3Fcf9Q4xMnEwHmKU4GBWEuE9uaM8VYg3JbGyKrUoP76oNCe1+BCjNAeL
 kjivaop8qpBAemJJanZqakFqEUyWiYNTqoFJcXpJm8ORdZb8NociN2+7mxJStZq7wpRrn7L4
 p+yPMbtOaq9191Lm3G1T9zFNcUZj1B2z75IGJxLWdzdnvjV2yJy18daKRde3lTB2zJr95Hze
 +31ZqnEbNqTNyqm4ap9UecOh99zBed8XnpukIXDs19XEObEsC3/t5bLUscznTrHrfb2rxmSF
 3H/BZ4332rRXqG5RLWFcm1DfosV5P1v+1wEJqZOmjw3Ds4NznnKfPylc/zlwd/zkpaF/n7zn
 vdex+6fRQyH+85k/DpzYrLrc7N2VKZeUnbbyevv8DT2VGuhnIJa4drq/cutR/blSLPc4Vsq7
 OofKZ5z4afP1vR/DzIW9XFwX9iW9a7a4puqjxFKckWioxVxUnAgA1T9jO+wDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRmVeSWpSXmKPExsVy+t/xe7rFH6tSDe63mVv0n7/JaHG57ySb
 RffRpcwW84+cY7W48vU9m8X/R69ZLeZOqrXYNv0nm0Xfi4fMFpd3zWGz+PTgP7NF694j7BZ/
 t29isbj72s+Bz2PxiimsHjvuLmH02LSqk83jzrU9bB73u48zeWxeUu/R/9fA4++s/Swe26/N
 Y/b4vEkugCtKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI
 3y5BL+Py/HbWgksTGSv+H57B0sD4toWxi5GTQ0LARGLd5NVsXYxcHEICSxkles4uZYFIyEic
 nNbACmELS/y51gVV9J5RYu3lJrAiXgE7ia9b74EVsQioSry6dBkqLihxcuYTMFtUQF7i/q0Z
 7CC2sECCREvbN2YQW0TAQGJ2/xVWkKHMAj+ZJNZf2QN2kpCAucTvH5+YQGxmAXGJW0/mg9ls
 AoYSXW9BruDk4BSwkOg4vpkZosZMomtrFyOELS/RvHU28wRGoVlI7piFZNQsJC2zkLQsYGRZ
 xSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERjr24793LyDcd6rj3qHGJk4GA8xSnAwK4nwntxR
 nirEm5JYWZValB9fVJqTWnyI0RQYGBOZpUST84HJJq8k3tDMwNTQxMzSwNTSzFhJnNezoCNR
 SCA9sSQ1OzW1ILUIpo+Jg1OqgUk7K2T2Ku/YrfPtNun9PXv78qp/cndivm//dfbYEb2v/9av
 /Zw32W7tWwHB2tW7Hrz1ZzFu3Sq1KH7qlPX7D09q3hyZue/0f50jU3WLvvs5G9/tTN67doWF
 R+npFMmpjh23O8Mn3+fM7Yxm+3n+77M75TqbCu9w/c/V/nvq1XVzoW+lz9WnPfqh8FXV7GWH
 eKWspN1ErbSvKU2fbm+fxzA1efq77OI13jWbo/WES/MqJmjc75jeKb3q3qrZPDZz/+Yffv9G
 7tb3KMkaV6ZT538LXsjbduMG16v9lvs8vuz60uFm6H1O9tSknl9+8jvCow8HZWlXLfad8ZBR
 fs/E6Kk+5pm2ni4ZcpeeHp3lfvnEbiWW4oxEQy3mouJEAAQ9qnp+AwAA
X-CMS-MailID: 20231214121339eucas1p105b5903b7a5f1933aa2c88c2cfd13288
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231214121339eucas1p105b5903b7a5f1933aa2c88c2cfd13288
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231214121339eucas1p105b5903b7a5f1933aa2c88c2cfd13288
References: <20231211115719.1784834-1-andyshrk@163.com>
 <CGME20231214121339eucas1p105b5903b7a5f1933aa2c88c2cfd13288@eucas1p1.samsung.com>
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
Cc: devicetree@vger.kernel.org, sebastian.reichel@collabora.com,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com, kever.yang@rock-chips.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Andy Yan <andy.yan@rock-chips.com>,
 chris.obbard@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear All,

On 11.12.2023 12:57, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>
> This reverts commit b63a553e8f5aa6574eeb535a551817a93c426d8c.
>
> regcache_sync will try to reload the configuration in regcache to
> hardware, but the registers of 4 Cluster windows and Esmart1/2/3 on
> the upcoming rk3588 can not be set successfully before internal PD
> power on.
>
> Also it's better to keep the hardware register as it is before we really
> enable it.
>
> So let's revert this version, and keep the first version:
> commit afa965a45e01 ("drm/rockchip: vop2: fix suspend/resume")
>
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>

This patch landed in today's linux-next as commit 81a06f1d02e5 ("Revert 
"drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume""). 
Unfortunately it triggers a following lock dep warning on my Odroid-M1 
test board:

========================================================
WARNING: possible irq lock inversion dependency detected
6.7.0-rc3+ #14328 Not tainted
--------------------------------------------------------
swapper/0/0 just changed the state of lock:
ffff0001f3ae2c18 
(rockchip_drm_vop2:2723:(&vop2_regmap_config)->lock){-...}-{2:2}, at: 
regmap_lock_spinlock+0x18/0x2c
but this lock took another, HARDIRQ-unsafe lock in the past:
  (&mt->ma_lock){+.+.}-{2:2}


and interrupts could create inverse lock ordering between them.


other info that might help us debug this:
  Possible interrupt unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(&mt->ma_lock);
                                local_irq_disable();
lock(rockchip_drm_vop2:2723:(&vop2_regmap_config)->lock);
                                lock(&mt->ma_lock);
   <Interrupt>
lock(rockchip_drm_vop2:2723:(&vop2_regmap_config)->lock);

  *** DEADLOCK ***

no locks held by swapper/0/0.

the shortest dependencies between 2nd lock and 1st lock:
  -> (&mt->ma_lock){+.+.}-{2:2} {
     HARDIRQ-ON-W at:
                       lock_acquire+0x1e8/0x318
                       _raw_spin_lock+0x48/0x60
                       regcache_maple_exit+0x5c/0xc0
                       regcache_exit+0x48/0x74
                       regmap_reinit_cache+0x1c/0xc4
                       vop2_crtc_atomic_enable+0x86c/0xa0c [rockchipdrm]
drm_atomic_helper_commit_modeset_enables+0xb4/0x26c
                       drm_atomic_helper_commit_tail_rpm+0x50/0xa0
                       commit_tail+0xa4/0x18c
                       drm_atomic_helper_commit+0x19c/0x1b0
                       drm_atomic_commit+0xa8/0xe0
                       drm_client_modeset_commit_atomic+0x22c/0x298
                       drm_client_modeset_commit_locked+0x60/0x1c0
                       drm_client_modeset_commit+0x30/0x58
__drm_fb_helper_restore_fbdev_mode_unlocked+0xbc/0xfc
                       drm_fb_helper_set_par+0x30/0x4c
                       fbcon_init+0x234/0x4c0
                       visual_init+0xb0/0x108
                       do_bind_con_driver.isra.0+0x19c/0x394
                       do_take_over_console+0x144/0x1f0
                       do_fbcon_takeover+0x6c/0xe4
                       fbcon_fb_registered+0x1e0/0x1e8
                       register_framebuffer+0x19c/0x228
__drm_fb_helper_initial_config_and_unlock+0x348/0x4fc
drm_fb_helper_hotplug_event.part.0+0xf0/0x110
                       drm_fb_helper_hotplug_event+0x38/0x44
                       drm_fbdev_generic_client_hotplug+0x28/0xd4
                       drm_client_dev_hotplug+0xcc/0x130
                       output_poll_execute+0x204/0x23c
                       process_one_work+0x1ec/0x53c
                       worker_thread+0x298/0x408
                       kthread+0x124/0x128
                       ret_from_fork+0x10/0x20
     SOFTIRQ-ON-W at:
                       lock_acquire+0x1e8/0x318
                       _raw_spin_lock+0x48/0x60
                       regcache_maple_exit+0x5c/0xc0
                       regcache_exit+0x48/0x74
                       regmap_reinit_cache+0x1c/0xc4
                       vop2_crtc_atomic_enable+0x86c/0xa0c [rockchipdrm]
drm_atomic_helper_commit_modeset_enables+0xb4/0x26c
                       drm_atomic_helper_commit_tail_rpm+0x50/0xa0
                       commit_tail+0xa4/0x18c
                       drm_atomic_helper_commit+0x19c/0x1b0
                       drm_atomic_commit+0xa8/0xe0
                       drm_client_modeset_commit_atomic+0x22c/0x298
                       drm_client_modeset_commit_locked+0x60/0x1c0
                       drm_client_modeset_commit+0x30/0x58
__drm_fb_helper_restore_fbdev_mode_unlocked+0xbc/0xfc
                       drm_fb_helper_set_par+0x30/0x4c
                       fbcon_init+0x234/0x4c0
                       visual_init+0xb0/0x108
                       do_bind_con_driver.isra.0+0x19c/0x394
                       do_take_over_console+0x144/0x1f0
                       do_fbcon_takeover+0x6c/0xe4
                       fbcon_fb_registered+0x1e0/0x1e8
                       register_framebuffer+0x19c/0x228
__drm_fb_helper_initial_config_and_unlock+0x348/0x4fc
drm_fb_helper_hotplug_event.part.0+0xf0/0x110
                       drm_fb_helper_hotplug_event+0x38/0x44
                       drm_fbdev_generic_client_hotplug+0x28/0xd4
                       drm_client_dev_hotplug+0xcc/0x130
                       output_poll_execute+0x204/0x23c
                       process_one_work+0x1ec/0x53c
                       worker_thread+0x298/0x408
                       kthread+0x124/0x128
                       ret_from_fork+0x10/0x20
     INITIAL USE at:
                      lock_acquire+0x1e8/0x318
                      _raw_spin_lock+0x48/0x60
                      regcache_maple_exit+0x5c/0xc0
                      regcache_exit+0x48/0x74
                      regmap_reinit_cache+0x1c/0xc4
                      vop2_crtc_atomic_enable+0x86c/0xa0c [rockchipdrm]
drm_atomic_helper_commit_modeset_enables+0xb4/0x26c
                      drm_atomic_helper_commit_tail_rpm+0x50/0xa0
                      commit_tail+0xa4/0x18c
                      drm_atomic_helper_commit+0x19c/0x1b0
                      drm_atomic_commit+0xa8/0xe0
                      drm_client_modeset_commit_atomic+0x22c/0x298
                      drm_client_modeset_commit_locked+0x60/0x1c0
                      drm_client_modeset_commit+0x30/0x58
__drm_fb_helper_restore_fbdev_mode_unlocked+0xbc/0xfc
                      drm_fb_helper_set_par+0x30/0x4c
                      fbcon_init+0x234/0x4c0
                      visual_init+0xb0/0x108
                      do_bind_con_driver.isra.0+0x19c/0x394
                      do_take_over_console+0x144/0x1f0
                      do_fbcon_takeover+0x6c/0xe4
                      fbcon_fb_registered+0x1e0/0x1e8
                      register_framebuffer+0x19c/0x228
__drm_fb_helper_initial_config_and_unlock+0x348/0x4fc
                      drm_fb_helper_hotplug_event.part.0+0xf0/0x110
                      drm_fb_helper_hotplug_event+0x38/0x44
                      drm_fbdev_generic_client_hotplug+0x28/0xd4
                      drm_client_dev_hotplug+0xcc/0x130
                      output_poll_execute+0x204/0x23c
                      process_one_work+0x1ec/0x53c
                      worker_thread+0x298/0x408
                      kthread+0x124/0x128
                      ret_from_fork+0x10/0x20
   }
   ... key      at: [<ffff800083de53b0>] __key.0+0x0/0x10
   ... acquired at:
    _raw_spin_lock+0x48/0x60
    regcache_maple_write+0x1d8/0x31c
    regcache_write+0x6c/0x84
    _regmap_read+0x1b4/0x1f4
    _regmap_update_bits+0xec/0x134
    regmap_field_update_bits_base+0x6c/0xa0
    vop2_plane_atomic_update+0x380/0x11d0 [rockchipdrm]
    drm_atomic_helper_commit_planes+0xec/0x2a0
    drm_atomic_helper_commit_tail_rpm+0x60/0xa0
    commit_tail+0xa4/0x18c
    drm_atomic_helper_commit+0x19c/0x1b0
    drm_atomic_commit+0xa8/0xe0
    drm_client_modeset_commit_atomic+0x22c/0x298
    drm_client_modeset_commit_locked+0x60/0x1c0
    drm_client_modeset_commit+0x30/0x58
    __drm_fb_helper_restore_fbdev_mode_unlocked+0xbc/0xfc
    drm_fb_helper_set_par+0x30/0x4c
    fbcon_init+0x234/0x4c0
    visual_init+0xb0/0x108
    do_bind_con_driver.isra.0+0x19c/0x394
    do_take_over_console+0x144/0x1f0
    do_fbcon_takeover+0x6c/0xe4
    fbcon_fb_registered+0x1e0/0x1e8
    register_framebuffer+0x19c/0x228
    __drm_fb_helper_initial_config_and_unlock+0x348/0x4fc
    drm_fb_helper_hotplug_event.part.0+0xf0/0x110
    drm_fb_helper_hotplug_event+0x38/0x44
    drm_fbdev_generic_client_hotplug+0x28/0xd4
    drm_client_dev_hotplug+0xcc/0x130
    output_poll_execute+0x204/0x23c
    process_one_work+0x1ec/0x53c
    worker_thread+0x298/0x408
    kthread+0x124/0x128
    ret_from_fork+0x10/0x20

-> (rockchip_drm_vop2:2723:(&vop2_regmap_config)->lock){-...}-{2:2} {
    IN-HARDIRQ-W at:
                     lock_acquire+0x1e8/0x318
                     _raw_spin_lock_irqsave+0x60/0x88
                     regmap_lock_spinlock+0x18/0x2c
                     regmap_read+0x3c/0x78
                     vop2_isr+0x84/0x2a4 [rockchipdrm]
                     __handle_irq_event_percpu+0xb0/0x2d4
                     handle_irq_event+0x4c/0xb8
                     handle_fasteoi_irq+0xa4/0x1cc
                     generic_handle_domain_irq+0x2c/0x44
                     gic_handle_irq+0x4c/0x110
                     call_on_irq_stack+0x24/0x4c
                     do_interrupt_handler+0x80/0x84
                     el1_interrupt+0x34/0x64
                     el1h_64_irq_handler+0x18/0x24
                     el1h_64_irq+0x64/0x68
                     default_idle_call+0x9c/0x150
                     do_idle+0x230/0x294
                     cpu_startup_entry+0x34/0x3c
                     rest_init+0x100/0x190
                     arch_post_acpi_subsys_init+0x0/0x8
                     start_kernel+0x594/0x684
                     __primary_switched+0xbc/0xc4
    INITIAL USE at:
                    lock_acquire+0x1e8/0x318
                    _raw_spin_lock_irqsave+0x60/0x88
                    regmap_lock_spinlock+0x18/0x2c
                    regmap_write+0x3c/0x78
                    vop2_crtc_atomic_enable+0x894/0xa0c [rockchipdrm]
drm_atomic_helper_commit_modeset_enables+0xb4/0x26c
                    drm_atomic_helper_commit_tail_rpm+0x50/0xa0
                    commit_tail+0xa4/0x18c
                    drm_atomic_helper_commit+0x19c/0x1b0
                    drm_atomic_commit+0xa8/0xe0
                    drm_client_modeset_commit_atomic+0x22c/0x298
                    drm_client_modeset_commit_locked+0x60/0x1c0
                    drm_client_modeset_commit+0x30/0x58
__drm_fb_helper_restore_fbdev_mode_unlocked+0xbc/0xfc
                    drm_fb_helper_set_par+0x30/0x4c
                    fbcon_init+0x234/0x4c0
                    visual_init+0xb0/0x108
                    do_bind_con_driver.isra.0+0x19c/0x394
                    do_take_over_console+0x144/0x1f0
                    do_fbcon_takeover+0x6c/0xe4
                    fbcon_fb_registered+0x1e0/0x1e8
                    register_framebuffer+0x19c/0x228
__drm_fb_helper_initial_config_and_unlock+0x348/0x4fc
                    drm_fb_helper_hotplug_event.part.0+0xf0/0x110
                    drm_fb_helper_hotplug_event+0x38/0x44
                    drm_fbdev_generic_client_hotplug+0x28/0xd4
                    drm_client_dev_hotplug+0xcc/0x130
                    output_poll_execute+0x204/0x23c
                    process_one_work+0x1ec/0x53c
                    worker_thread+0x298/0x408
                    kthread+0x124/0x128
                    ret_from_fork+0x10/0x20
  }
  ... key      at: [<ffff80007c090a18>] _key.6+0x0/0xffffffffffffd5e8 
[rockchipdrm]
  ... acquired at:
    __lock_acquire+0xad8/0x20c4
    lock_acquire+0x1e8/0x318
    _raw_spin_lock_irqsave+0x60/0x88
    regmap_lock_spinlock+0x18/0x2c
    regmap_read+0x3c/0x78
    vop2_isr+0x84/0x2a4 [rockchipdrm]
    __handle_irq_event_percpu+0xb0/0x2d4
    handle_irq_event+0x4c/0xb8
    handle_fasteoi_irq+0xa4/0x1cc
    generic_handle_domain_irq+0x2c/0x44
    gic_handle_irq+0x4c/0x110
    call_on_irq_stack+0x24/0x4c
    do_interrupt_handler+0x80/0x84
    el1_interrupt+0x34/0x64
    el1h_64_irq_handler+0x18/0x24
    el1h_64_irq+0x64/0x68
    default_idle_call+0x9c/0x150
    do_idle+0x230/0x294
    cpu_startup_entry+0x34/0x3c
    rest_init+0x100/0x190
    arch_post_acpi_subsys_init+0x0/0x8
    start_kernel+0x594/0x684
    __primary_switched+0xbc/0xc4


stack backtrace:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.7.0-rc3+ #14328
Hardware name: Hardkernel ODROID-M1 (DT)
Call trace:
  dump_backtrace+0x98/0xf0
  show_stack+0x18/0x24
  dump_stack_lvl+0x60/0xac
  dump_stack+0x18/0x24
  print_irq_inversion_bug.part.0+0x1ec/0x27c
  mark_lock+0x634/0x950
  __lock_acquire+0xad8/0x20c4
  lock_acquire+0x1e8/0x318
  _raw_spin_lock_irqsave+0x60/0x88
  regmap_lock_spinlock+0x18/0x2c
  regmap_read+0x3c/0x78
  vop2_isr+0x84/0x2a4 [rockchipdrm]
  __handle_irq_event_percpu+0xb0/0x2d4
  handle_irq_event+0x4c/0xb8
  handle_fasteoi_irq+0xa4/0x1cc
  generic_handle_domain_irq+0x2c/0x44
  gic_handle_irq+0x4c/0x110
  call_on_irq_stack+0x24/0x4c
  do_interrupt_handler+0x80/0x84
  el1_interrupt+0x34/0x64
  el1h_64_irq_handler+0x18/0x24
  el1h_64_irq+0x64/0x68
  default_idle_call+0x9c/0x150
  do_idle+0x230/0x294
  cpu_startup_entry+0x34/0x3c
  rest_init+0x100/0x190
  arch_post_acpi_subsys_init+0x0/0x8
  start_kernel+0x594/0x684
  __primary_switched+0xbc/0xc4
Console: switching to colour frame buffer device 240x67
rockchip-drm display-subsystem: [drm] fb0: rockchipdrmfb frame buffer device


Reverting it on top of next-20231214 and resolving a conflict 
fixes/hides the above lock dep issue.


> ---
>
> (no changes since v1)
>
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 312da5783362..57784d0a22a6 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -217,6 +217,8 @@ struct vop2 {
>   	struct vop2_win win[];
>   };
>   
> +static const struct regmap_config vop2_regmap_config;
> +
>   static struct vop2_video_port *to_vop2_video_port(struct drm_crtc *crtc)
>   {
>   	return container_of(crtc, struct vop2_video_port, crtc);
> @@ -883,7 +885,11 @@ static void vop2_enable(struct vop2 *vop2)
>   		return;
>   	}
>   
> -	regcache_sync(vop2->map);
> +	ret = regmap_reinit_cache(vop2->map, &vop2_regmap_config);
> +	if (ret) {
> +		drm_err(vop2->drm, "failed to reinit cache: %d\n", ret);
> +		return;
> +	}
>   
>   	if (vop2->data->soc_id == 3566)
>   		vop2_writel(vop2, RK3568_OTP_WIN_EN, 1);
> @@ -913,8 +919,6 @@ static void vop2_disable(struct vop2 *vop2)
>   
>   	pm_runtime_put_sync(vop2->dev);
>   
> -	regcache_mark_dirty(vop2->map);
> -
>   	clk_disable_unprepare(vop2->aclk);
>   	clk_disable_unprepare(vop2->hclk);
>   }

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

