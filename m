Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 286088179ED
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5483F10E290;
	Mon, 18 Dec 2023 18:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8B210E370
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:43:25 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20231218102541euoutp025514e53b796f77bbe1ddd4e1df24c39d~h5hvmyIzZ3111131111euoutp026
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 10:25:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20231218102541euoutp025514e53b796f77bbe1ddd4e1df24c39d~h5hvmyIzZ3111131111euoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1702895141;
 bh=xiea3XiSDO56boKC4aUoAGpZvGNuumEilgGFOsCoZNE=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=puZY3FvjLrUP/remAQGyDIJCtl00c8f3Zo0dqQx0lICyMNBeLfJoSm1rZP4OJTwvA
 +qSjPES5VIIMr68khyqtczJQ3Ze6DG2v7m/9VZvIcHcEknfPnkGjwtG8QxjPHeTcvl
 Cb9dOEovcGpwDQ+FAbp6LnqVRfnrRhJRNSLHBhZo=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20231218102540eucas1p291fa17b60f80f8c40160d7252733987b~h5humUotR2195221952eucas1p2d;
 Mon, 18 Dec 2023 10:25:40 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 90.81.09814.42E10856; Mon, 18
 Dec 2023 10:25:40 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20231218102540eucas1p14d03be90047b7503de9827401c363666~h5huHOB841754817548eucas1p1A;
 Mon, 18 Dec 2023 10:25:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20231218102540eusmtrp16761619b33f8f60ac0268e9c63773919~h5huGdLs50933109331eusmtrp1L;
 Mon, 18 Dec 2023 10:25:40 +0000 (GMT)
X-AuditID: cbfec7f4-711ff70000002656-75-65801e2419fc
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id CF.56.09274.32E10856; Mon, 18
 Dec 2023 10:25:39 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20231218102539eusmtip1cd99ece8582f4037885671548e99e968~h5htR9qmk2459724597eusmtip16;
 Mon, 18 Dec 2023 10:25:39 +0000 (GMT)
Message-ID: <3838492a-a2da-40f3-82a9-a8f88839e0d9@samsung.com>
Date: Mon, 18 Dec 2023 11:25:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/rockchip: vop2: Avoid use regmap_reinit_cache at
 runtime
Content-Language: en-US
To: Andy Yan <andyshrk@163.com>, heiko@sntech.de
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20231217084415.2373043-1-andyshrk@163.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDKsWRmVeSWpSXmKPExsWy7djP87oqcg2pBvO6BS36z99ktLjcd5LN
 YurDJ2wWV76+Z7P4/+g1q8XcSbUWmx5fY7W4vGsOm8WnB/+ZLf5u38TiwOWxeMUUVo9NqzrZ
 PO53H2fy2Lyk3qP/r4HH31n7WTy2X5vH7PF5k1wARxSXTUpqTmZZapG+XQJXRv/PwywFb04z
 Vux4MImlgbGji7GLkZNDQsBEYsLrHuYuRi4OIYEVjBJnLixmhHC+MEqsunsayvnMKLHr718m
 mJart1+wQCSWM0q8WLMPyvnIKHFybx8bSBWvgJ3EzX+9YEtYBFQl7v/fzggRF5Q4OfMJC4gt
 KiAvcf/WDHYQW1ggWGJpz0uwGmYBcYlbT+aDbRMRMJCY3X+FFWQBs8BXRolFHTvBmtkEDCW6
 3naBLeMUsJC4MBViEDPQ0O1v54B9JCHQzikxbeZOoKkcQI6LxLIlIhAvCEu8Or6FHcKWkTg9
 uYcFqp5RYsHv+0wQzgRGiYbnt6DhZC1x59wvNpBBzAKaEut36UOEHSWWXGtig5jPJ3HjrSDE
 DXwSk7ZNZ4YI80p0tAlBVKtJzDq+Dm7twQuXmCcwKs1CCpZZSN6fheSbWQh7FzCyrGIUTy0t
 zk1PLTbKSy3XK07MLS7NS9dLzs/dxAhMYKf/Hf+yg3H5q496hxiZOBgPMUpwMCuJ8Losqk8V
 4k1JrKxKLcqPLyrNSS0+xCjNwaIkzquaIp8qJJCeWJKanZpakFoEk2Xi4JRqYLLVWZbToGn0
 3ORrlO/2GwLf/Cbon+2c/n6WYeTjwJkXXnqeX+ap+7zyjsH/GR+LL/ioSxpsFTOfpaWU9VeO
 3VHj0JL5UyMTpeqO6XAUr/Pk83Ku2N1tmRTx58SzLc5qhxUlO3zn/tt9bnvmlRV2R13nz77X
 HJpWUJYp8jj0+fyzP/QyTm2I/qUUY3e5dWM/X+azsvYnL+f0hK9azBt37ly5okYz81mOKW/y
 olNvt2fPabzy3fOvDetXPvVbpX+dtr/K/P29X+vbGU1+Zc/16wIbzV+f66m9GT116rLe2a4S
 H9zvTQ2y9BaKfD2T3Uplj5DbjTilFT6aJ+xDAyobNB5IPVA78bhMOLPv7hQFTiWW4oxEQy3m
 ouJEABVL7hvPAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRmVeSWpSXmKPExsVy+t/xu7rKcg2pBp96LC36z99ktLjcd5LN
 YurDJ2wWV76+Z7P4/+g1q8XcSbUWmx5fY7W4vGsOm8WnB/+ZLf5u38TiwOWxeMUUVo9NqzrZ
 PO53H2fy2Lyk3qP/r4HH31n7WTy2X5vH7PF5k1wAR5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWF
 npGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJeRv/PwywFb04zVux4MImlgbGji7GLkZNDQsBE
 4urtFyxdjFwcQgJLGSVmH+pjg0jISJyc1sAKYQtL/LnWxQZR9J5RoulKO1gRr4CdxM1/vWCT
 WARUJe7/384IEReUODnzCQuILSogL3H/1gx2EFtYIFhiac9LsBpmAXGJW0/mM4HYIgIGErP7
 r7CCLGAW+MoocfzJWVaIbd2MEgv2TQc7g03AUKLrbRfYZk4BC4kLUyGmMguYSXRt7YKaKi+x
 /e0c5gmMQrOQHDILycJZSFpmIWlZwMiyilEktbQ4Nz232EivODG3uDQvXS85P3cTIzBmtx37
 uWUH48pXH/UOMTJxMB5ilOBgVhLhdVlUnyrEm5JYWZValB9fVJqTWnyI0RQYGhOZpUST84FJ
 I68k3tDMwNTQxMzSwNTSzFhJnNezoCNRSCA9sSQ1OzW1ILUIpo+Jg1OqgUl30sZeEbfFAvN5
 ijbKcnyc869QOZPPO57v/calE40bbFr5Syaus5Mp3L+m0XnT9q+Xqnlu+4S+3GliImp/ODs+
 +i3DVL3/G3MfXDnT/HjO6boK1jzXAscI5lo+73eljy6xX5d4fue3V537QbaA5yZiUSU27YGt
 f9gz9D77d+0T+Bz/KuKl6aPyRYbrmg8ntEoaGv7aueBt8/lIeY98r99P+7mtP/vvzm555sPZ
 xelSrL+MX8OseVZlIY+Hyk8n7+Oan7Y1Vu2558CzOOgVv3nmwRRHxS8K3t9kEk6d3XVeQSnt
 2TLeFxW9nCo804yuKCrPbvfIPTz1bqVY4+mbgdI3bpYwbNH2f7DrWkCKEktxRqKhFnNRcSIA
 JrnZ+WIDAAA=
X-CMS-MailID: 20231218102540eucas1p14d03be90047b7503de9827401c363666
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20231217084551eucas1p22664cbb28e576c394376df61bd1b5569
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231217084551eucas1p22664cbb28e576c394376df61bd1b5569
References: <CGME20231217084551eucas1p22664cbb28e576c394376df61bd1b5569@eucas1p2.samsung.com>
 <20231217084415.2373043-1-andyshrk@163.com>
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
Cc: s.hauer@pengutronix.de, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 broonie@kernel.org, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.12.2023 09:44, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>
> Marek Report a possible irq lock inversion dependency warning when
> commit 81a06f1d02e5 ("Revert "drm/rockchip: vop2: Use regcache_sync()
> to fix suspend/resume"") lands linux-next.
>
> I can reproduce this warning with:
> CONFIG_PROVE_LOCKING=y
> CONFIG_DEBUG_LOCKDEP=y
>
> It seems than when use regmap_reinit_cache at runtime whith Mark's
> commit 3d59c22bbb8d ("drm/rockchip: vop2: Convert to use maple tree
> register cache"), it will trigger a possible irq lock inversion dependency
> warning.
>
> One solution is switch back to REGCACHE_RBTREE, but it seems that
> REGCACHE_MAPLE is the future, so I avoid ues regmap_reinit_cache,
> and drop all the regcache when vop is disabled, then we get a fresh
> start at next enbable time.
>
> [    8.425923] dwmmc_rockchip fe2b0000.mmc: IDMAC supports 32-bit address mode.
> [    8.427020] dwmmc_rockchip fe2b0000.mmc: Using internal DMA controller.
> [    8.428013] dwmmc_rockchip fe2b0000.mmc: Version ID is 270a
> [    8.429088] dwmmc_rockchip fe2b0000.mmc: DW MMC controller at irq 78,32 bit host data width,256 deep fifo
> [    8.454219] mmc_host mmc0: Bus speed (slot 0) = 375000Hz (slot req 400000Hz, actual 375000HZ div = 0)
> [    8.465446] rockchip-drm display-subsystem: bound fe040000.vop (ops vop2_component_ops)
> [    8.475586] dwhdmi-rockchip fe0a0000.hdmi: Detected HDMI TX controller v2.11a with HDCP (DWC HDMI 2.0 TX PHY)
> [    8.484326] dwhdmi-rockchip fe0a0000.hdmi: registered DesignWare HDMI I2C bus driver
> [    8.490505] rockchip-drm display-subsystem: bound fe0a0000.hdmi (ops dw_hdmi_rockchip_ops)
> [    8.501151] [drm] Initialized rockchip 1.0.0 20140818 for display-subsystem on minor 0
> [    8.895456]
> [    8.895473] ========================================================
> [    8.895480] WARNING: possible irq lock inversion dependency detected
> [    8.895486] 6.7.0-rc5-next-20231215 #514 Not tainted
> [    8.895496] --------------------------------------------------------
> [    8.895501] swapper/0/0 just changed the state of lock:
> [    8.895510] ffff0000070b6018 (rockchip_drm_vop2:3116:(&vop2_regmap_config)->lock){-...}-{2:2}, at: regmap_lock_spinlock
> +0x14/0x24
> [    8.895560] but this lock took another, HARDIRQ-unsafe lock in the past:
> [    8.895566]  (&mt->ma_lock){+.+.}-{2:2}
> [    8.895580]
> [    8.895580]
> [    8.895580] and interrupts could create inverse lock ordering between them.
> [    8.895580]
> [    8.895585]
> [    8.895585] other info that might help us debug this:
> [    8.895590]  Possible interrupt unsafe locking scenario:
> [    8.895590]
> [    8.895594]        CPU0                    CPU1
> [    8.895598]        ----                    ----
> [    8.895602]   lock(&mt->ma_lock);
> [    8.895614]                                local_irq_disable();
> [    8.895617]                                lock(rockchip_drm_vop2:3116:(&vop2_regmap_config)->lock);
> [    8.895629]                                lock(&mt->ma_lock);
> [    8.895641]   <Interrupt>
> [    8.895644]   lock(rockchip_drm_vop2:3116:(&vop2_regmap_config)->lock);
> [    8.895655]
> [    8.895655]  *** DEADLOCK ***
> [    8.895655]
> [    8.895659] no locks held by swapper/0/0.
> [    8.895664]
> [    8.895664] the shortest dependencies between 2nd lock and 1st lock:
> [    8.895672]  -> (&mt->ma_lock){+.+.}-{2:2} ops: 12 {
> [    8.895704]     HARDIRQ-ON-W at:
> [    8.895713]                       lock_acquire+0x238/0x354
> [    8.895732]                       _raw_spin_lock+0x3c/0x50
> [    8.895749]                       regcache_maple_exit+0x64/0xc4
> [    8.895766]                       regcache_exit+0x48/0xac
> [    8.895780]                       regmap_reinit_cache+0x18/0x98
> [    8.895793]	                     vop2_crtc_atomic_enable+0xefc/0x1074
> [    8.895810]                       drm_atomic_helper_commit_modeset_enables+0xac/0x264
> [    8.895826]                       drm_atomic_helper_commit_tail_rpm+0x2c/0x78
> [    8.895841]                       commit_tail+0x9c/0x178
> [    8.895855]                       drm_atomic_helper_commit+0x17c/0x1ac
> [    8.895869]                       drm_atomic_commit+0xac/0xec
> [    8.895885]                       drm_client_modeset_commit_atomic+0x230/0x290
> [    8.895896]                       drm_client_modeset_commit_locked+0x54/0x1c4
> [    8.895907]                       drm_client_modeset_commit+0x2c/0x50
> [    8.895917]                       __drm_fb_helper_restore_fbdev_mode_unlocked+0x88/0xf4
> [    8.895934]                       drm_fb_helper_set_par+0x30/0x48
> [    8.895948]                       fbcon_init+0x40c/0x498
> [    8.895961]                       visual_init+0xb0/0x108
> [    8.895972]                       do_bind_con_driver+0x1b8/0x38c
> [    8.895983]                       do_take_over_console+0x148/0x1d4
> [    8.895993]                       do_fbcon_takeover+0x6c/0xe0
> [    8.896003]                       fbcon_fb_registered+0x1f8/0x1fc
> [    8.896014]                       register_framebuffer+0x158/0x228
> [    8.896029]                       __drm_fb_helper_initial_config_and_unlock+0x304/0x4f8
> [    8.896045]                       drm_fb_helper_initial_config+0x3c/0x48
> [    8.896060]                       drm_fbdev_generic_client_hotplug+0xb8/0xd8
> [    8.896074]                       drm_client_register+0x58/0xa0
> [    8.896085]                       drm_fbdev_generic_setup+0xbc/0x144
> [    8.896098]                       rockchip_drm_bind+0x1ec/0x1f8
> [    8.896110]                       try_to_bring_up_aggregate_device+0x278/0x2d8
> [    8.896127]                       __component_add+0xac/0x198
> [    8.896139]                       component_add+0x10/0x18
> [    8.896151]                       dw_hdmi_rockchip_probe+0x1c/0x24
> [    8.896163]                       platform_probe+0x90/0xd8
> [    8.896179]                       really_probe+0x114/0x3c0
> [    8.896192]                       __driver_probe_device+0x7c/0x17c
> [    8.896204]                       driver_probe_device+0x38/0x11c
> [    8.896218]                       __device_attach_driver+0xb4/0x164
> [    8.896230]                       bus_for_each_drv+0x78/0xdc
> [    8.896241]                       __device_attach+0xfc/0x1ac
> [    8.896253]                       device_initial_probe+0x10/0x18
> [    8.896266]                       bus_probe_device+0xa8/0xac
> [    8.896277]                       deferred_probe_work_func+0x98/0xe8
> [    8.896290]                       process_scheduled_works+0x23c/0x5b8
> [    8.896306]                       worker_thread+0x188/0x374
> [    8.896319]                       kthread+0xe4/0x10c
> [    8.896332]                       ret_from_fork+0x10/0x20
> [    8.896345]     SOFTIRQ-ON-W at:
> [    8.896355]                       lock_acquire+0x238/0x354
> [    8.896370]                       _raw_spin_lock+0x3c/0x50
> [    8.896384]                       regcache_maple_exit+0x64/0xc4
> [    8.896399]                       regcache_exit+0x48/0xac
> [    8.896411]                       regmap_reinit_cache+0x18/0x98
> [    8.896423]                       vop2_crtc_atomic_enable+0xefc/0x1074
> [    8.896437]                       drm_atomic_helper_commit_modeset_enables+0xac/0x264
> [    8.896453]                       drm_atomic_helper_commit_tail_rpm+0x2c/0x78
> [    8.896467]                       commit_tail+0x9c/0x178
> [    8.896480]                       drm_atomic_helper_commit+0x17c/0x1ac
> [    8.896494]                       drm_atomic_commit+0xac/0xec
> [    8.896509]                       drm_client_modeset_commit_atomic+0x230/0x290
> [    8.896520]                       drm_client_modeset_commit_locked+0x54/0x1c4
> [    8.896530]                       drm_client_modeset_commit+0x2c/0x50
> [    8.896540]                       __drm_fb_helper_restore_fbdev_mode_unlocked+0x88/0xf4
> [    8.896558]                       drm_fb_helper_set_par+0x30/0x48
> [    8.896572]                       fbcon_init+0x40c/0x498
> [    8.896582]                       visual_init+0xb0/0x108
> [    8.896591]                       do_bind_con_driver+0x1b8/0x38c
> [    8.896601]                       do_take_over_console+0x148/0x1d4
> [    8.896611]                       do_fbcon_takeover+0x6c/0xe0
> [    8.896620]                       fbcon_fb_registered+0x1f8/0x1fc
> [    8.896630]                       register_framebuffer+0x158/0x228
> [    8.896645]                       __drm_fb_helper_initial_config_and_unlock+0x304/0x4f8
> [    8.896660]                       drm_fb_helper_initial_config+0x3c/0x48
> [    8.896674]                       drm_fbdev_generic_client_hotplug+0xb8/0xd8
> [    8.896688]                       drm_client_register+0x58/0xa0
> [    8.896698]                       drm_fbdev_generic_setup+0xbc/0x144
> [    8.896711]                       rockchip_drm_bind+0x1ec/0x1f8
> [    8.896724]                       try_to_bring_up_aggregate_device+0x278/0x2d8
> [    8.896738]                       __component_add+0xac/0x198
> [    8.896751]                       component_add+0x10/0x18
> [    8.896763]                       dw_hdmi_rockchip_probe+0x1c/0x24
> [    8.896773]                       platform_probe+0x90/0xd8
> [    8.896789]                       really_probe+0x114/0x3c0
> [    8.896801]                       __driver_probe_device+0x7c/0x17c
> [    8.896814]                       driver_probe_device+0x38/0x11c
> [    8.896827]                       __device_attach_driver+0xb4/0x164
> [    8.896839]                       bus_for_each_drv+0x78/0xdc
> [    8.896850]                       __device_attach+0xfc/0x1ac
> [    8.896862]                       device_initial_probe+0x10/0x18
> [    8.896875]                       bus_probe_device+0xa8/0xac
> [    8.896886]                       deferred_probe_work_func+0x98/0xe8
> [    8.896897]                       process_scheduled_works+0x23c/0x5b8
> [    8.896911]                       worker_thread+0x188/0x374
> [    8.896924]                       kthread+0xe4/0x10c
> [    8.896935]                       ret_from_fork+0x10/0x20
> [    8.896947]     INITIAL USE at:
> [    8.896955]                      lock_acquire+0x238/0x354
> [    8.896971]                      _raw_spin_lock+0x3c/0x50
> [    8.896985]                      regcache_maple_exit+0x64/0xc4
> [    8.896999]                      regcache_exit+0x48/0xac
> [    8.897011]                      regmap_reinit_cache+0x18/0x98
> [    8.897022]                      vop2_crtc_atomic_enable+0xefc/0x1074
> [    8.897036]                      drm_atomic_helper_commit_modeset_enables+0xac/0x264
> [    8.897051]                      drm_atomic_helper_commit_tail_rpm+0x2c/0x78
> [    8.897065]                      commit_tail+0x9c/0x178
> [    8.897079]                      drm_atomic_helper_commit+0x17c/0x1ac
> [    8.897093]                      drm_atomic_commit+0xac/0xec
> [    8.897107]                      drm_client_modeset_commit_atomic+0x230/0x290
> [    8.897118]                      drm_client_modeset_commit_locked+0x54/0x1c4
> [    8.897128]                      drm_client_modeset_commit+0x2c/0x50
> [    8.897138]                      __drm_fb_helper_restore_fbdev_mode_unlocked+0x88/0xf4
> [    8.897154]                      drm_fb_helper_set_par+0x30/0x48
> [    8.897168]                      fbcon_init+0x40c/0x498
> [    8.897179]                      visual_init+0xb0/0x108
> [    8.897188]                      do_bind_con_driver+0x1b8/0x38c
> [    8.897198]                      do_take_over_console+0x148/0x1d4
> [    8.897208]                      do_fbcon_takeover+0x6c/0xe0
> [    8.897218]                      fbcon_fb_registered+0x1f8/0x1fc
> [    8.897228]                      register_framebuffer+0x158/0x228
> [    8.897241]                      __drm_fb_helper_initial_config_and_unlock+0x304/0x4f8
> [    8.897257]                      drm_fb_helper_initial_config+0x3c/0x48
> [    8.897272]                      drm_fbdev_generic_client_hotplug+0xb8/0xd8
> [    8.897286]                      drm_client_register+0x58/0xa0
> [    8.897296]                      drm_fbdev_generic_setup+0xbc/0x144
> [    8.897309]                      rockchip_drm_bind+0x1ec/0x1f8
> [    8.897321]                      try_to_bring_up_aggregate_device+0x278/0x2d8
> [    8.897336]                      __component_add+0xac/0x198
> [    8.897348]                      component_add+0x10/0x18
> [    8.897360]                      dw_hdmi_rockchip_probe+0x1c/0x24
> [    8.897370]                      platform_probe+0x90/0xd8
> [    8.897385]                      really_probe+0x114/0x3c0
> [    8.897397]                      __driver_probe_device+0x7c/0x17c
> [    8.897410]                      driver_probe_device+0x38/0x11c
> [    8.897422]                      __device_attach_driver+0xb4/0x164
> [    8.897434]                      bus_for_each_drv+0x78/0xdc
> [    8.897445]                      __device_attach+0xfc/0x1ac
> [    8.897456]                      device_initial_probe+0x10/0x18
> [    8.897469]                      bus_probe_device+0xa8/0xac
> [    8.897480]                      deferred_probe_work_func+0x98/0xe8
> [    8.897492]                      process_scheduled_works+0x23c/0x5b8
> [    8.897506]                      worker_thread+0x188/0x374
> [    8.897518]                      kthread+0xe4/0x10c
> [    8.897529]                      ret_from_fork+0x10/0x20
> [    8.897541]   }
> [    8.897545]   ... key      at: [<ffff800082efc820>]__key.20703+0x0/0x10
> [    8.897561]   ... acquired at:
> [    8.897566]    _raw_spin_lock+0x3c/0x50
> [    8.897580]    regcache_maple_write+0x268/0x314
> [    8.897595]    regcache_write+0x68/0x84
> [    8.897607]    _regmap_read+0xd0/0x1f4
> [    8.897619]    _regmap_update_bits+0xe0/0x140
> [    8.897631]    regmap_update_bits_base+0x60/0x8c
> [    8.897643]    regmap_field_update_bits_base+0x30/0x38
> [    8.897656]    vop2_plane_atomic_update+0x8b0/0x1400
> [    8.897669]    drm_atomic_helper_commit_planes+0xdc/0x2a0
> [    8.897683]    drm_atomic_helper_commit_tail_rpm+0x3c/0x78
> [    8.897697]    commit_tail+0x9c/0x178
> [    8.897709]    drm_atomic_helper_commit+0x17c/0x1ac
> [    8.897722]    drm_atomic_commit+0xac/0xec
> [    8.897735]    drm_client_modeset_commit_atomic+0x230/0x290
> [    8.897746]    drm_client_modeset_commit_locked+0x54/0x1c4
> [    8.897758]    drm_client_modeset_commit+0x2c/0x50
> [    8.897767]    __drm_fb_helper_restore_fbdev_mode_unlocked+0x88/0xf4
> [    8.897784]    drm_fb_helper_set_par+0x30/0x48
> [    8.897797]    fbcon_init+0x40c/0x498
> [    8.897807]    visual_init+0xb0/0x108
> [    8.897816]    do_bind_con_driver+0x1b8/0x38c
> [    8.897825]    do_take_over_console+0x148/0x1d4
> [    8.897835]    do_fbcon_takeover+0x6c/0xe0
> [    8.897844]    fbcon_fb_registered+0x1f8/0x1fc
> [    8.897854]    register_framebuffer+0x158/0x228
> [    8.897866]    __drm_fb_helper_initial_config_and_unlock+0x304/0x4f8
> [    8.897882]    drm_fb_helper_initial_config+0x3c/0x48
> [    8.897895]    drm_fbdev_generic_client_hotplug+0xb8/0xd8
> [    8.897908]    drm_client_register+0x58/0xa0
> [    8.897917]    drm_fbdev_generic_setup+0xbc/0x144
> [    8.897929]    rockchip_drm_bind+0x1ec/0x1f8
> [    8.897941]    try_to_bring_up_aggregate_device+0x278/0x2d8
> [    8.897956]    __component_add+0xac/0x198
> [    8.897967]    component_add+0x10/0x18
> [    8.897979]    dw_hdmi_rockchip_probe+0x1c/0x24
> [    8.897988]    platform_probe+0x90/0xd8
> [    8.898002]    really_probe+0x114/0x3c0
> [    8.898013]    __driver_probe_device+0x7c/0x17c
> [    8.898026]    driver_probe_device+0x38/0x11c
> [    8.898038]    __device_attach_driver+0xb4/0x164
> [    8.898049]    bus_for_each_drv+0x78/0xdc
> [    8.898059]    __device_attach+0xfc/0x1ac
> [    8.898070]    device_initial_probe+0x10/0x18
> [    8.898082]    bus_probe_device+0xa8/0xac
> [    8.898093]    deferred_probe_work_func+0x98/0xe8
> [    8.898105]    process_scheduled_works+0x23c/0x5b8
> [    8.898118]    worker_thread+0x188/0x374
> [    8.898131]    kthread+0xe4/0x10c
> [    8.898142]    ret_from_fork+0x10/0x20
> [    8.898153]
> [    8.898157] ->(rockchip_drm_vop2:3116:(&vop2_regmap_config)->lock){-...}-{2:2} ops: 74
> {
> [    8.898185]    IN-HARDIRQ-W at:
> [    8.898194]                     lock_acquire+0x238/0x354
> [    8.898211]                     _raw_spin_lock_irqsave+0x50/0x6c
> [    8.898227]                     regmap_lock_spinlock+0x14/0x24
> [    8.898238]                     regmap_read+0x38/0x70
> [    8.898250]                     vop2_isr+0x88/0x2ac
> [    8.898263]                     __handle_irq_event_percpu+0xa4/0x2bc
> [    8.898277]                     handle_irq_event_percpu+0x14/0x44
> [    8.898290]                     handle_irq_event+0x44/0x90
> [    8.898300]                     handle_fasteoi_irq+0xf8/0x1d4
> [    8.898314]                     generic_handle_domain_irq+0x28/0x3c
> [    8.898324]                     gic_handle_irq+0xb0/0x130
> [    8.898334]                     call_on_irq_stack+0x24/0x34
> [    8.898345]                     do_interrupt_handler+0xc4/0xdc
> [    8.898359]                     el1_interrupt+0x3c/0x70
> [    8.898375]                     el1h_64_irq_handler+0x14/0x1c
> [    8.898390]                     el1h_64_irq+0x64/0x68
> [    8.898398]                     default_idle_call+0xec/0x118
> [    8.898409]                     do_idle+0x1c8/0x254
> [    8.898420]                     cpu_startup_entry+0x30/0x38
> [    8.898430]                     rest_init+0x13c/0x1cc
> [    8.898440]                     arch_post_acpi_subsys_init+0x0/0x8
> [    8.898455]                     start_kernel+0x7c0/0x968
> [    8.898465]                     __primary_switched+0xb0/0xbc
> [    8.898481]    INITIAL USE at:
> [    8.898492]                    lock_acquire+0x238/0x354
> [    8.898506]                    _raw_spin_lock_irqsave+0x50/0x6c
> [    8.898520]                    regmap_lock_spinlock+0x14/0x24
> [    8.898531]                    regmap_write+0x38/0x70
> [    8.898544]                    vop2_crtc_atomic_enable+0xf64/0x1074
> [    8.898560]                    drm_atomic_helper_commit_modeset_enables+0xac/0x264
> [    8.898575]                    drm_atomic_helper_commit_tail_rpm+0x2c/0x78
> [    8.898589]                    commit_tail+0x9c/0x178
> [    8.898601]                    drm_atomic_helper_commit+0x17c/0x1ac
> [    8.898615]                    drm_atomic_commit+0xac/0xec
> [    8.898628]                    drm_client_modeset_commit_atomic+0x230/0x290
> [    8.898639]                    drm_client_modeset_commit_locked+0x54/0x1c4
> [    8.898649]                    drm_client_modeset_commit+0x2c/0x50
> [    8.898660]                    __drm_fb_helper_restore_fbdev_mode_unlocked+0x88/0xf4
> [    8.898675]                    drm_fb_helper_set_par+0x30/0x48
> [    8.898689]                    fbcon_init+0x40c/0x498
> [    8.898699]                    visual_init+0xb0/0x108
> [    8.898709]                    do_bind_con_driver+0x1b8/0x38c
> [    8.898719]                    do_take_over_console+0x148/0x1d4
> [    8.898730]                    do_fbcon_takeover+0x6c/0xe0
> [    8.898740]                    fbcon_fb_registered+0x1f8/0x1fc
> [    8.898750]                    register_framebuffer+0x158/0x228
> [    8.898763]                    __drm_fb_helper_initial_config_and_unlock+0x304/0x4f8
> [    8.898779]                    drm_fb_helper_initial_config+0x3c/0x48
> [    8.898793]                    drm_fbdev_generic_client_hotplug+0xb8/0xd8
> [    8.898806]                    drm_client_register+0x58/0xa0
> [    8.898815]                    drm_fbdev_generic_setup+0xbc/0x144
> [    8.898830]                    rockchip_drm_bind+0x1ec/0x1f8
> [    8.898842]                    try_to_bring_up_aggregate_device+0x278/0x2d8
> [    8.898858]                    __component_add+0xac/0x198
> [    8.898871]                    component_add+0x10/0x18
> [    8.898885]                    dw_hdmi_rockchip_probe+0x1c/0x24
> [    8.898894]                    platform_probe+0x90/0xd8
> [    8.898909]                    really_probe+0x114/0x3c0
> [    8.898921]                    __driver_probe_device+0x7c/0x17c
> [    8.898933]                    driver_probe_device+0x38/0x11c
> [    8.898945]                    __device_attach_driver+0xb4/0x164
> [    8.898958]                    bus_for_each_drv+0x78/0xdc
> [    8.898969]                    __device_attach+0xfc/0x1ac
> [    8.898980]                    device_initial_probe+0x10/0x18
> [    8.898993]                    bus_probe_device+0xa8/0xac
> [    8.899004]                    deferred_probe_work_func+0x98/0xe8
> [    8.899015]                    process_scheduled_works+0x23c/0x5b8
> [    8.899029]                    worker_thread+0x188/0x374
> [    8.899042]                    kthread+0xe4/0x10c
> [    8.899053]                    ret_from_fork+0x10/0x20
> [    8.899064]  }
> [    8.899069]  ... key      at: [<ffff800082efbe90>]_key.73979+0x0/0x10
> [    8.899086]  ... acquired at:
> [    8.899091]    __lock_acquire+0x9d8/0x1950
> [    8.899104]    lock_acquire+0x238/0x354
> [    8.899117]    _raw_spin_lock_irqsave+0x50/0x6c
> [    8.899131]    regmap_lock_spinlock+0x14/0x24
> [    8.899142]    regmap_read+0x38/0x70
> [    8.899154]    vop2_isr+0x88/0x2ac
> [    8.899166]    __handle_irq_event_percpu+0xa4/0x2bc
> [    8.899178]    handle_irq_event_percpu+0x14/0x44
> [    8.899188]    handle_irq_event+0x44/0x90
> [    8.899198]    handle_fasteoi_irq+0xf8/0x1d4
> [    8.899211]    generic_handle_domain_irq+0x28/0x3c
> [    8.899221]    gic_handle_irq+0xb0/0x130
> [    8.899230]    call_on_irq_stack+0x24/0x34
> [    8.899243]    do_interrupt_handler+0xc4/0xdc
> [    8.899256]    el1_interrupt+0x3c/0x70
> [    8.899270]    el1h_64_irq_handler+0x14/0x1c
> [    8.899285]    el1h_64_irq+0x64/0x68
> [    8.899293]    default_idle_call+0xec/0x118
> [    8.899304]    do_idle+0x1c8/0x254
> [    8.899313]    cpu_startup_entry+0x30/0x38
> [    8.899321]    rest_init+0x13c/0x1cc
> [    8.899331]    arch_post_acpi_subsys_init+0x0/0x8
> [    8.899342]    start_kernel+0x7c0/0x968
> [    8.899351]    __primary_switched+0xb0/0xbc
> [    8.899365]
> [    8.899368]
> [    8.899368] stack backtrace:
> [    8.899376] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 6.7.0-rc5-next-20231215 #514
> [    8.899386] Hardware name: EmbedFire LubanCat 2 (DT)
> [    8.899394] Call trace:
> [    8.899399]  dump_backtrace+0xe4/0x124
> [    8.899410]  show_stack+0x14/0x1c
> [    8.899419]  dump_stack_lvl+0x78/0xd4
> [    8.899430]  dump_stack+0x14/0x1c
> [    8.899438]  print_irq_inversion_bug+0x28c/0x304
> [    8.899453]  mark_lock.part.43+0x2c0/0x448
> [    8.899466]  __lock_acquire+0x9d8/0x1950
> [    8.899479]  lock_acquire+0x238/0x354
> [    8.899492]  _raw_spin_lock_irqsave+0x50/0x6c
> [    8.899507]  regmap_lock_spinlock+0x14/0x24
> [    8.899517]  regmap_read+0x38/0x70
> [    8.899528]  vop2_isr+0x88/0x2ac
> [    8.899540]  __handle_irq_event_percpu+0xa4/0x2bc
> [    8.899553]  handle_irq_event_percpu+0x14/0x44
> [    8.899565]  handle_irq_event+0x44/0x90
> [    8.899575]  handle_fasteoi_irq+0xf8/0x1d4
> [    8.899589]  generic_handle_domain_irq+0x28/0x3c
> [    8.899599]  gic_handle_irq+0xb0/0x130
> [    8.899608]  call_on_irq_stack+0x24/0x34
> [    8.899619]  do_interrupt_handler+0xc4/0xdc
> [    8.899631]  el1_interrupt+0x3c/0x70
> [    8.899645]  el1h_64_irq_handler+0x14/0x1c
> [    8.899659]  el1h_64_irq+0x64/0x68
> [    8.899669]  default_idle_call+0xec/0x118
> [    8.899679]  do_idle+0x1c8/0x254
> [    8.899689]  cpu_startup_entry+0x30/0x38
> [    8.899698]  rest_init+0x13c/0x1cc
> [    8.899708]  arch_post_acpi_subsys_init+0x0/0x8
> [    8.899720]  start_kernel+0x7c0/0x968
> [    8.899731]  __primary_switched+0xb0/0xbc
> [    8.946839] Console: switching to colour frame buffer device 240x67
> [   10.230883] rockchip-drm display-subsystem: [drm] fb0: rockchipdrmfb frame buffer device
>
> Fixes: 81a06f1d02e5 ("Revert "drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume"")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/98a9f15d-30ac-47bf-9b93-3aa2c9900f7b@samsung.com/
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
>
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 4beb04c83752..f2edaebfcaf9 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -993,12 +993,6 @@ static void vop2_enable(struct vop2 *vop2)
>   		return;
>   	}
>   
> -	ret = regmap_reinit_cache(vop2->map, &vop2_regmap_config);
> -	if (ret) {
> -		drm_err(vop2->drm, "failed to reinit cache: %d\n", ret);
> -		return;
> -	}
> -
>   	if (vop2->data->soc_id == 3566)
>   		vop2_writel(vop2, RK3568_OTP_WIN_EN, 1);
>   
> @@ -1030,6 +1024,8 @@ static void vop2_disable(struct vop2 *vop2)
>   
>   	pm_runtime_put_sync(vop2->dev);
>   
> +	regcache_drop_region(vop2->map, 0, vop2_regmap_config.max_register);
> +
>   	clk_disable_unprepare(vop2->pclk);
>   	clk_disable_unprepare(vop2->aclk);
>   	clk_disable_unprepare(vop2->hclk);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

