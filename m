Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A2DB1CCA7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 21:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEEA10E30F;
	Wed,  6 Aug 2025 19:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="ImcDchd/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF7C10E30F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 19:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=6wGRYdz0Cv8uWZ2+02RhdxmJBe/Md6fIzXGBOwD4e80=; b=ImcDchd/oVlIFLMNyzxZdk2UZg
 B+wd/K7+/Jt6ER+SO/baS0lzf3kiQLMTy9UzsIvwRdNfnZlr0WJZeeVLjxH74KEGl3Me7ciKV2Jwx
 RxmumiXlKY4ajD/w4zWoQZ+bMKAG7PxXLSGErbY4BSA73yNV7FioBKaMltNZ6bUDkbeH4bgcZ9r1g
 XvzOPMjSrf4uoiATYwFmbvNkClPgjjbFFF9CU9IYyoOrPO+GNuUBNmZ0mUUSvGCjutpB5xIWPjhgA
 KcZwYcZFuOVcjYexZf8j0lZLF7lwSQfIq4naLYOZIKv63oGqyrqGWiB/1rDRs8woNPnrygBtOPnrr
 9QdGKXyg==;
Received: from i53875ab1.versanet.de ([83.135.90.177] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1ujkDq-00021U-4e; Wed, 06 Aug 2025 21:54:50 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 00/14] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
Date: Wed, 06 Aug 2025 21:54:48 +0200
Message-ID: <38992177.XM6RcZxFsP@diego>
In-Reply-To: <1cf4bc1b-d7f3-4a88-b8d8-d2f681dce370@rock-chips.com>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <c73fa024-fdd0-4f62-9c8a-11e7eee3c475@rock-chips.com>
 <1cf4bc1b-d7f3-4a88-b8d8-d2f681dce370@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Hi Damon,

Am Dienstag, 29. Juli 2025, 05:16:27 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Damon Ding:
> On 2025/7/29 11:02, Damon Ding wrote:
> > On 2025/7/26 3:45, Heiko St=C3=BCbner wrote:
> >> Am Freitag, 25. Juli 2025, 04:15:06 Mitteleurop=C3=A4ische Sommerzeit=
=20
> >> schrieb Damon Ding:
> >>> On 2025/7/24 21:10, Heiko St=C3=BCbner wrote:
> >>>> Am Donnerstag, 24. Juli 2025, 10:02:50 Mitteleurop=C3=A4ische Sommer=
zeit=20
> >>>> schrieb Damon Ding:
> >>>>> PATCH 1 is a small format optimization for struct analogid_dp_devic=
e.
> >>>>> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enab=
le.
> >>>>> PATCH 3 is to apply a better API for the encoder initialization.
> >>>>> PATCH 4-7 are preparations for apply drm_bridge_connector helper.
> >>>>> PATCH 8 is to apply the drm_bridge_connector helper.
> >>>>> PATCH 9-11 are to move the panel/bridge parsing to the Analogix sid=
e.
> >>>>> PATCH 12-13 are preparations for apply panel_bridge helper.
> >>>>> PATCH 14 is to apply the panel_bridge helper.
> >>>>
> >>>> for future revisions, please provide a changelog on what changed sin=
ce
> >>>> the previous version, I guess ideally here in the cover-letter.
> >>>>
> >>>>
> >>>> On my rk3588-tiger-displayport-carrier this works like a charm
> >>>> Tested-by: Heiko Stuebner <heiko@sntech.de>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>
> >>> Glad to see your review and test. :-)
> >>>
> >>> I will include the version-to-version changelogs (v2 -> v3 and v3 -> =
v4)
> >>> in the next iteration.
> >>
> >> I have to amend that a bit, sadly. When doing a reboot with the edp
> >> running, I see logs like:
> >>
> >> [...]
> >> [  139.614749] systemd-shutdown[1]: Syncing filesystems and block=20
> >> devices.
> >> [  139.622201] systemd-shutdown[1]: Rebooting.
> >> [  139.684845] ------------[ cut here ]------------
> >> [  139.690050] WARNING: CPU: 0 PID: 110 at drivers/iommu/rockchip-=20
> >> iommu.c:989 rk_iommu_identity_attach+0xac/0xbc
> >> [  139.701175] Modules linked in: panthor rockchip_vdec rocket=20
> >> drm_gpuvm v4l2_vp9 v4l2_h264 drm_exec rockchip_rng drm_shmem_helper=20
> >> v4l2_mem2mem gpu_sched rng_core fuse
> >> [  139.717685] CPU: 0 UID: 0 PID: 110 Comm: irq/58-HPD Not tainted=20
> >> 6.16.0-rc7-00183-gd436cbe8e4b3 #1541 PREEMPT
> >> [  139.728799] Hardware name: Theobroma Systems RK3588-Q7 SoM on Tiger=
=20
> >> Displayport Carrier v1 (DT)
> >> [  139.738548] pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT -SSBS=20
> >> BTYPE=3D--)
> >> [  139.746351] pc : rk_iommu_identity_attach+0xac/0xbc
> >> [  139.751821] lr : rk_iommu_identity_attach+0x70/0xbc
> >> [  139.757290] sp : ffff800080e4b7c0
> >> [  139.761001] x29: ffff800080e4b7c0 x28: ffff0001f6f98080 x27:=20
> >> ffff0001f0a4b010
> >> [  139.769006] x26: ffff0001f6f98e58 x25: 0000000000000000 x24:=20
> >> 0000000000000000
> >> [  139.777010] x23: 0000000000000000 x22: ffffdbf23c0485e0 x21:=20
> >> ffff0001f0e9cc10
> >> [  139.785014] x20: ffff0001f0df17a0 x19: ffff0001f0e2cb80 x18:=20
> >> 0000000000000038
> >> [  139.793018] x17: 0002550800000009 x16: 0000046c0446043e x15:=20
> >> 0438000008ca080c
> >> [  139.801021] x14: 07d008ca07800780 x13: 0438000008ca080c x12:=20
> >> 07d0078000025508
> >> [  139.809024] x11: 0002550800000009 x10: 0000046c0446043e x9 :=20
> >> ffffdbf23c137000
> >> [  139.817031] x8 : 0000000000000438 x7 : 0000000000000000 x6 :=20
> >> 0000000000000000
> >> [  139.825034] x5 : ffffdbf23adbb9c0 x4 : ffff0001f0df1780 x3 :=20
> >> ffff0001f0df1780
> >> [  139.833038] x2 : 0000000000000081 x1 : ffff0001f6fad500 x0 :=20
> >> 00000000ffffffea
> >> [  139.841042] Call trace:
> >> [  139.843780]  rk_iommu_identity_attach+0xac/0xbc (P)
> >> [  139.849252]  rk_iommu_attach_device+0x54/0x134
> >> [  139.854236]  __iommu_device_set_domain+0x7c/0x110
> >> [  139.859510]  __iommu_group_set_domain_internal+0x60/0x134
> >> [  139.865561]  __iommu_attach_group+0x88/0x9c
> >> [  139.870250]  iommu_attach_device+0x68/0xa0
> >> [  139.874841]  rockchip_drm_dma_attach_device+0x28/0x7c
> >> [  139.880508]  vop2_crtc_atomic_enable+0x620/0xaa0
> >> [  139.885678]  drm_atomic_helper_commit_modeset_enables+0xac/0x26c
> >> [  139.892413]  drm_atomic_helper_commit_tail_rpm+0x50/0xa0
> >> [  139.898369]  commit_tail+0xa0/0x1a0
> >> [  139.902279]  drm_atomic_helper_commit+0x17c/0x1b0
> >> [  139.907552]  drm_atomic_commit+0x8c/0xcc
> >> [  139.911951]  drm_client_modeset_commit_atomic+0x228/0x298
> >> [  139.918005]  drm_client_modeset_commit_locked+0x5c/0x188
> >> [  139.923960]  drm_client_modeset_commit+0x2c/0x58
> >> [  139.929137]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xb4/0x100
> >> [  139.936164]  drm_fb_helper_hotplug_event+0xe8/0xf8
> >> [  139.941526]  drm_fbdev_client_hotplug+0x24/0xe0
> >> [  139.946605]  drm_client_hotplug+0x48/0xc4
> >> [  139.951100]  drm_client_dev_hotplug+0x9c/0xd4
> >> [  139.955984]  drm_kms_helper_connector_hotplug_event+0x20/0x30
> >> [  139.962426]  drm_bridge_connector_hpd_cb+0x88/0xa0
> >> [  139.967790]  drm_bridge_hpd_notify+0x3c/0x60
> >> [  139.972577]  display_connector_hpd_irq+0x30/0xa4
> >> [  139.978835]  irq_thread_fn+0x2c/0xb0
> >> [  139.983894]  irq_thread+0x170/0x304
> >> [  139.988833]  kthread+0x12c/0x204
> >> [  139.993468]  ret_from_fork+0x10/0x20
> >> [  139.998486] ---[ end trace 0000000000000000 ]---
> >> [  140.004737] ------------[ cut here ]------------
> >> [  140.010884] WARNING: CPU: 0 PID: 110 at drivers/iommu/rockchip-=20
> >> iommu.c:1040 rk_iommu_attach_device+0x114/0x134
> >> [  140.023079] Modules linked in: panthor rockchip_vdec rocket=20
> >> drm_gpuvm v4l2_vp9 v4l2_h264 drm_exec rockchip_rng drm_shmem_helper=20
> >> v4l2_mem2mem gpu_sched rng_core fuse
> >> [  140.040577] CPU: 0 UID: 0 PID: 110 Comm: irq/58-HPD Tainted:=20
> >> G        W           6.16.0-rc7-00183-gd436cbe8e4b3 #1541 PREEMPT
> >> [  140.054457] Tainted: [W]=3DWARN
> >> [  140.058804] Hardware name: Theobroma Systems RK3588-Q7 SoM on Tiger=
=20
> >> Displayport Carrier v1 (DT)
> >> [  140.069595] pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT -SSBS=20
> >> BTYPE=3D--)
> >> [  140.078454] pc : rk_iommu_attach_device+0x114/0x134
> >> [  140.084989] lr : rk_iommu_attach_device+0x98/0x134
> >> [  140.091423] sp : ffff800080e4b7e0
> >> [  140.096197] x29: ffff800080e4b7e0 x28: ffff0001f6f98080 x27:=20
> >> ffff0001f0a4b010
> >> [  140.105270] x26: ffff0001f6f98e58 x25: 0000000000000000 x24:=20
> >> 0000000000000000
> >> [  140.114351] x23: ffff0001f6f843e0 x22: ffffdbf23c0485e0 x21:=20
> >> ffff0001f0e9cc10
> >> [  140.123425] x20: ffff0001f0e2cb80 x19: ffff0001f6f843c0 x18:=20
> >> 0000000000000038
> >> [  140.132489] x17: 0002550800000009 x16: 0000046c0446043e x15:=20
> >> 0438000008ca080c
> >> [  140.141552] x14: 07d008ca07800780 x13: 0438000008ca080c x12:=20
> >> 07d0078000025508
> >> [  140.150623] x11: 0002550800000009 x10: 0000046c0446043e x9 :=20
> >> ffffdbf23c137000
> >> [  140.159701] x8 : 0000000000000438 x7 : 0000000000000000 x6 :=20
> >> 0000000000000000
> >> [  140.168772] x5 : ffffdbf23adbb9c0 x4 : ffff0001f0df1780 x3 :=20
> >> ffff0001f0e2cbe0
> >> [  140.177825] x2 : 0000000000000081 x1 : ffff0001f6fad500 x0 :=20
> >> 00000000ffffffea
> >> [  140.186858] Call trace:
> >> [  140.190627]  rk_iommu_attach_device+0x114/0x134 (P)
> >> [  140.197124]  __iommu_device_set_domain+0x7c/0x110
> >> [  140.203417]  __iommu_group_set_domain_internal+0x60/0x134
> >> [  140.210492]  __iommu_attach_group+0x88/0x9c
> >> [  140.216203]  iommu_attach_device+0x68/0xa0
> >> [  140.221802]  rockchip_drm_dma_attach_device+0x28/0x7c
> >> [  140.228479]  vop2_crtc_atomic_enable+0x620/0xaa0
> >> [  140.234664]  drm_atomic_helper_commit_modeset_enables+0xac/0x26c
> >> [  140.242400]  drm_atomic_helper_commit_tail_rpm+0x50/0xa0
> >> [  140.249349]  commit_tail+0xa0/0x1a0
> >> [  140.254246]  drm_atomic_helper_commit+0x17c/0x1b0
> >> [  140.260496]  drm_atomic_commit+0x8c/0xcc
> >> [  140.265866]  drm_client_modeset_commit_atomic+0x228/0x298
> >> [  140.272885]  drm_client_modeset_commit_locked+0x5c/0x188
> >> [  140.279791]  drm_client_modeset_commit+0x2c/0x58
> >> [  140.285914]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xb4/0x100
> >> [  140.293889]  drm_fb_helper_hotplug_event+0xe8/0xf8
> >> [  140.300214]  drm_fbdev_client_hotplug+0x24/0xe0
> >> [  140.306248]  drm_client_hotplug+0x48/0xc4
> >> [  140.311695]  drm_client_dev_hotplug+0x9c/0xd4
> >> [  140.317531]  drm_kms_helper_connector_hotplug_event+0x20/0x30
> >> [  140.324930]  drm_bridge_connector_hpd_cb+0x88/0xa0
> >> [  140.331248]  drm_bridge_hpd_notify+0x3c/0x60
> >> [  140.336990]  display_connector_hpd_irq+0x30/0xa4
> >> [  140.343120]  irq_thread_fn+0x2c/0xb0
> >> [  140.348081]  irq_thread+0x170/0x304
> >> [  140.352937]  kthread+0x12c/0x204
> >> [  140.357501]  ret_from_fork+0x10/0x20
> >> [  140.362453] ---[ end trace 0000000000000000 ]---
> >>
> >>
> >> After some minutes of hanging it does reboot afterall.
> >>
> >> Heiko
> >>
> >>
> >=20
> > Could you please help confirm whether the same error still occurs with=
=20
> > this patch series under the same conditions?
>=20
> Careless, what I want to express should be '...without this patch=20
> series...'. :-)

sorry this took a tad longer for me to get back to this topic, but I was
now able to run a number of scenarios:

So I ran a number of variants and interestingly as the board I do eDP
tests on does not have any PCIe parts, I enountered an issue with
the PCIe SMMU [0].

When I disable the SMMU node, I also cannot reproduce the error from
above. So I've rebooted so many times today both with and without the
SMMU, and encountered the log from above only ever with the dangling
SMMU. So I'd assume, the Analogix series is actually innocent :-) .


Heiko



[0] https://lore.kernel.org/linux-rockchip/4400329.mogB4TqSGs@diego/T/#m590=
1974351b7c11e34f29a02b4f7f69b6ef29b2f



