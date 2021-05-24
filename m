Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9632238E72A
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 15:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E656E1BD;
	Mon, 24 May 2021 13:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B035B6E1BD
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 13:13:14 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EF4882F54;
 Mon, 24 May 2021 09:13:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 May 2021 09:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=yEDogKNsDHpbWVIpk44BGwPvGl9
 niN6CRPD+wsuJbvw=; b=kTLzTMTvVv78pIg2SiQqG7MTH6VXP7iuMmuIn9uujxQ
 mgAlDeu7DTutIwPB2mlLsS8RhRh4r4f93OKZCseSMDCzZEiNuclI9N2cUXNEPQz7
 hu4EgR6MHqK+Y2Mgh8m/0XAqE3oMGU2obUmhRy+i2NpLZmfCH3xOvMVjnujxD9wK
 +LktVZq8Ytv3Ku6QtseVu4BpGSw+ltGSm2pGfU7aTbTI8vx4YiywJmKXMabXtCRx
 MD6P3or+06fC1Le63y6dlfrKtUHX5j5FRO0jLncj98znaQV2aoR05HU5d8S/e5M+
 1bF6WoRg3AW3u4b0AmajTl2fEuTKnkjitFDouDHHMAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=yEDogK
 NsDHpbWVIpk44BGwPvGl9niN6CRPD+wsuJbvw=; b=mVI+Axvz5pJ+7OT8zUJKNJ
 VDsjKGsRVM7MNAmMRcxYC5PJpJVSYQdgQ9/IXiIk3mTt1we4b8mEC4iWbmRMT7Ls
 kQKVl088TZ6UHjJ5lSrP+q3cskg/ih0idh16fdBGcsu0rdhcM8urNR4ePsJpmpOM
 Llf0FPCvGuH7UOjDz8sjraiz017sTp1yZsckXdSvamrWMrrk0bXnMmXVPIQw9vgi
 09QOZW7jik9hOlER3ddlwdctpvaJYXjZYhyYCDb8lrYs/CVTVcCAXfqKoVnSDZR0
 c5/v7ZDfhK4VOwrcVl1NtImJjD54JwAO3C3luT7v2RDK/4t+wp1QyqRkxKRQN7+w
 ==
X-ME-Sender: <xms:ZqarYLn24e-fJsszMsp6S4ya24qy2U_P5hy_F40HiFN-mqmcFPg0hQ>
 <xme:ZqarYO1eYk-_Uo6vDktbnV4vDn7fclRnegLQZUn490guS39ve63SSRmA1bdOGmeIl
 _itHEl5JbSjFdPvEG8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejledgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtvdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvgestggv
 rhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeelkeeghefhuddtleejgfeljeffhe
 ffgfeijefhgfeufefhtdevteegheeiheegudenucfkphepledtrdekledrieekrdejieen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Z6arYBqxBy48qRfRqaJpdayCdAAegv2WPBJ2gbuzqKOgG_XUVk2Lxg>
 <xmx:Z6arYDkwP5dZDujCNMMrf9zWiYHGbW8kQa5NuT_b2rFW26IfyY0wrg>
 <xmx:Z6arYJ2CCkoMEeCMnOi0qxoHlS3mAsL4MzzDOTGuyYv_somEBAlzyQ>
 <xmx:Z6arYG8XDJ1DKK75RAMEYODWzll-cgewu1SdHWb04fkNvuLCbXyOWA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 24 May 2021 09:13:10 -0400 (EDT)
Date: Mon, 24 May 2021 15:13:08 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Marc Haber <mh+linux-kernel@zugschlus.de>
Subject: Re: KASAN errors with vc4 DRM on Raspberry Pi 4
Message-ID: <20210524131308.qrc6j4wjffnel2mk@gilmour>
References: <YKt5d9+AaAWYcifK@torres.zugschlus.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5abgnrs6kfzebizd"
Content-Disposition: inline
In-Reply-To: <YKt5d9+AaAWYcifK@torres.zugschlus.de>
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


--5abgnrs6kfzebizd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Marc,

On Mon, May 24, 2021 at 12:01:27PM +0200, Marc Haber wrote:
> Hi,
>=20
> when running a current (5.12.6) Linux kernel on a Raspberry Pi 4 which
> has KASAN enablen, upon (manual) loading of the vc4 module, the
> following appears in dmesg:
>=20
> [   27.713689] rc rc0: vc4 as /devices/platform/soc/fef00700.hdmi/rc/rc0
> [   27.714408] input: vc4 as /devices/platform/soc/fef00700.hdmi/rc/rc0/i=
nput5
> [   27.717603] debugfs: Directory 'fef00700.hdmi' with parent 'vc4-hdmi-0=
' already present!
> [   27.722211] vc4-drm gpu: bound fef00700.hdmi (ops vc4_hdmi_ops [vc4])
> [   27.727765] Registered IR keymap rc-cec
> [   27.728809] rc rc1: vc4 as /devices/platform/soc/fef05700.hdmi/rc/rc1
> [   27.729550] input: vc4 as /devices/platform/soc/fef05700.hdmi/rc/rc1/i=
nput6
> [   27.736865] debugfs: Directory 'fef05700.hdmi' with parent 'vc4-hdmi-1=
' already present!
> [   27.740984] vc4-drm gpu: bound fef05700.hdmi (ops vc4_hdmi_ops [vc4])
> [   27.741704] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> [   27.742757] vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
> [   27.744440] vc4-drm gpu: bound fe206000.pixelvalve (ops vc4_crtc_ops [=
vc4])
> [   27.745161] vc4-drm gpu: bound fe207000.pixelvalve (ops vc4_crtc_ops [=
vc4])
> [   27.746165] vc4-drm gpu: bound fe20a000.pixelvalve (ops vc4_crtc_ops [=
vc4])
> [   27.746733] vc4-drm gpu: bound fe216000.pixelvalve (ops vc4_crtc_ops [=
vc4])
> [   27.771356] [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
> [   27.827068] Console: switching to colour frame buffer device 160x50
> [   27.827623] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   27.827638] BUG: KASAN: slab-out-of-bounds in vc4_atomic_commit_tail+0=
x1d4/0x950 [vc4]
> [   27.827822] Read of size 8 at addr ffff2b83c2956540 by task modprobe/4=
99
>=20
> [   27.827840] CPU: 3 PID: 499 Comm: modprobe Tainted: G         C  E    =
 5.12.5-zgrpi4 #1
> [   27.827853] Hardware name: Raspberry Pi 4 Model B Rev 1.2 (DT)
> [   27.827861] Call trace:
> [   27.827865]  dump_backtrace+0x0/0x2d0
> [   27.827891]  show_stack+0x24/0x30
> [   27.827905]  dump_stack+0xfc/0x168
> [   27.827919]  print_address_description.constprop.0+0x68/0x2b0
> [   27.827931]  kasan_report+0x1d4/0x270
> [   27.827947]  __asan_load8+0x94/0xd0
> [   27.827959]  vc4_atomic_commit_tail+0x1d4/0x950 [vc4]
> [   27.828116]  commit_tail+0x104/0x20c [drm_kms_helper]
> [   27.828192]  drm_atomic_helper_commit+0x1cc/0x460 [drm_kms_helper]
> [   27.828265]  drm_atomic_commit+0x88/0xa0 [drm]
> [   27.828405]  drm_client_modeset_commit_atomic+0x2f8/0x3a0 [drm]
> [   27.828542]  drm_client_modeset_commit_locked+0x94/0x230 [drm]
> [   27.828679]  drm_fb_helper_pan_display+0x16c/0x3b0 [drm_kms_helper]
> [   27.828753]  fb_pan_display+0x130/0x200
> [   27.828768]  bit_update_start+0x3c/0xa0
> [   27.828782]  fbcon_switch+0x61c/0x854
> [   27.828795]  redraw_screen+0x188/0x364
> [   27.828807]  do_bind_con_driver.isra.0+0x458/0x530
> [   27.828820]  do_take_over_console+0x208/0x2f0
> [   27.828832]  do_fbcon_takeover+0x9c/0x130
> [   27.828845]  fbcon_fb_registered+0x154/0x170
> [   27.828859]  register_framebuffer+0x314/0x490
> [   27.828870]  __drm_fb_helper_initial_config_and_unlock+0x568/0x820 [dr=
m_kms_helper]
> [   27.828943]  drm_fbdev_client_hotplug+0x20c/0x380 [drm_kms_helper]
> [   27.829015]  drm_fbdev_generic_setup+0xe8/0x240 [drm_kms_helper]
> [   27.829087]  vc4_drm_bind+0x1d4/0x1f0 [vc4]
> [   27.829240]  try_to_bring_up_master+0x260/0x2e0
> [   27.829259]  component_master_add_with_match+0x134/0x184
> [   27.829270]  vc4_platform_drm_probe+0x120/0x170 [vc4]
> [   27.829419]  platform_probe+0x98/0x114
> [   27.829429]  really_probe+0x150/0x710
> [   27.829442]  driver_probe_device+0x80/0xf0
> [   27.829456]  device_driver_attach+0x124/0x130
> [   27.829470]  __driver_attach+0xbc/0x190
> [   27.829483]  bus_for_each_dev+0xf0/0x160
> [   27.829494]  driver_attach+0x40/0x50
> [   27.829507]  bus_add_driver+0x1b0/0x2c0
> [   27.829519]  driver_register+0xec/0x21c
> [   27.829533]  __platform_driver_register+0x50/0x60
> [   27.829543]  vc4_drm_register+0x54/0x1000 [vc4]
> [   27.829692]  do_one_initcall+0xa8/0x350
> [   27.829705]  do_init_module+0xe8/0x3a4
> [   27.829718]  load_module+0x3298/0x3820
> [   27.829729]  __do_sys_finit_module+0x110/0x170
> [   27.829741]  __arm64_sys_finit_module+0x50/0x6c
> [   27.829753]  el0_svc_common.constprop.0+0xa0/0x1a0
> [   27.829767]  do_el0_svc+0x90/0xb0
> [   27.829779]  el0_svc+0x20/0x30
> [   27.829794]  el0_sync_handler+0x1a4/0x1b0
> [   27.829807]  el0_sync+0x180/0x1c0
>=20
> [   27.829821] Allocated by task 499:
> [   27.829829]  kasan_save_stack+0x28/0x60
> [   27.829846]  __kasan_kmalloc+0x88/0xb0
> [   27.829858]  kmem_cache_alloc_trace+0x1ec/0x3a4
> [   27.829870]  vc4_hvs_channels_duplicate_state+0x54/0x190 [vc4]
> [   27.830021]  drm_atomic_get_private_obj_state+0x14c/0x230 [drm]
> [   27.830160]  vc4_atomic_check+0x48/0x740 [vc4]
> [   27.830309]  drm_atomic_check_only+0xa44/0xf00 [drm]
> [   27.830447]  drm_atomic_commit+0x3c/0xa0 [drm]
> [   27.830583]  drm_client_modeset_commit_atomic+0x2f8/0x3a0 [drm]
> [   27.830720]  drm_client_modeset_commit_locked+0x94/0x230 [drm]
> [   27.830857]  drm_client_modeset_commit+0x40/0x70 [drm]
> [   27.830994]  drm_fb_helper_set_par+0x10c/0x180 [drm_kms_helper]
> [   27.831068]  fbcon_init+0x3c4/0x88c
> [   27.831086]  visual_init+0x154/0x1f0
> [   27.831098]  do_bind_con_driver.isra.0+0x2cc/0x530
> [   27.831110]  do_take_over_console+0x208/0x2f0
> [   27.831122]  do_fbcon_takeover+0x9c/0x130
> [   27.831135]  fbcon_fb_registered+0x154/0x170
> [   27.831149]  register_framebuffer+0x314/0x490
> [   27.831160]  __drm_fb_helper_initial_config_and_unlock+0x568/0x820 [dr=
m_kms_helper]
> [   27.831233]  drm_fbdev_client_hotplug+0x20c/0x380 [drm_kms_helper]
> [   27.831305]  drm_fbdev_generic_setup+0xe8/0x240 [drm_kms_helper]
> [   27.831377]  vc4_drm_bind+0x1d4/0x1f0 [vc4]
> [   27.831530]  try_to_bring_up_master+0x260/0x2e0
> [   27.831543]  component_master_add_with_match+0x134/0x184
> [   27.831554]  vc4_platform_drm_probe+0x120/0x170 [vc4]
> [   27.831710]  platform_probe+0x98/0x114
> [   27.831720]  really_probe+0x150/0x710
> [   27.831733]  driver_probe_device+0x80/0xf0
> [   27.831746]  device_driver_attach+0x124/0x130
> [   27.831759]  __driver_attach+0xbc/0x190
> [   27.831772]  bus_for_each_dev+0xf0/0x160
> [   27.831784]  driver_attach+0x40/0x50
> [   27.831796]  bus_add_driver+0x1b0/0x2c0
> [   27.831808]  driver_register+0xec/0x21c
> [   27.831821]  __platform_driver_register+0x50/0x60
> [   27.831831]  vc4_drm_register+0x54/0x1000 [vc4]
> [   27.831981]  do_one_initcall+0xa8/0x350
> [   27.831992]  do_init_module+0xe8/0x3a4
> [   27.832004]  load_module+0x3298/0x3820
> [   27.832015]  __do_sys_finit_module+0x110/0x170
> [   27.832026]  __arm64_sys_finit_module+0x50/0x6c
> [   27.832037]  el0_svc_common.constprop.0+0xa0/0x1a0
> [   27.832051]  do_el0_svc+0x90/0xb0
> [   27.832063]  el0_svc+0x20/0x30
> [   27.832076]  el0_sync_handler+0x1a4/0x1b0
> [   27.832090]  el0_sync+0x180/0x1c0
>=20
> [   27.832102] The buggy address belongs to the object at ffff2b83c2956500
>                 which belongs to the cache kmalloc-128 of size 128
> [   27.832111] The buggy address is located 64 bytes inside of
>                 128-byte region [ffff2b83c2956500, ffff2b83c2956580)
> [   27.832123] The buggy address belongs to the page:
> [   27.832128] page:0000000013b6837e refcount:1 mapcount:0 mapping:000000=
0000000000 index:0x0 pfn:0x42956
> [   27.832141] flags: 0x4000000000000200(slab)
> [   27.832160] raw: 4000000000000200 fffffcae0f0a5680 0000001000000002 ff=
ff2b83c0002300
> [   27.832171] raw: 0000000000000000 0000000000100010 00000001ffffffff 00=
00000000000000
> [   27.832177] page dumped because: kasan: bad access detected
>=20
> [   27.832185] Memory state around the buggy address:
> [   27.832192]  ffff2b83c2956400: 00 00 00 fc fc fc fc fc fc fc fc fc fc =
fc fc fc
> [   27.832201]  ffff2b83c2956480: fc fc fc fc fc fc fc fc fc fc fc fc fc =
fc fc fc
> [   27.832209] >ffff2b83c2956500: 00 00 00 00 00 00 00 fc fc fc fc fc fc =
fc fc fc
> [   27.832214]                                            ^
> [   27.832221]  ffff2b83c2956580: fc fc fc fc fc fc fc fc fc fc fc fc fc =
fc fc fc
> [   27.832229]  ffff2b83c2956600: 00 fc fc fc fc fc fc fc fc fc fc fc fc =
fc fc fc
> [   27.832234] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   27.832239] Disabling lock debugging due to kernel taint
> [   28.373731] vc4-drm gpu: [drm] fb0: vc4drmfb frame buffer device
> [   28.602388] vc4_hdmi fef00700.hdmi: ASoC: error at snd_soc_dai_startup=
 on fef00700.hdmi: -19
> [   28.610889] vc4_hdmi fef00700.hdmi: ASoC: error at snd_soc_dai_startup=
 on fef00700.hdmi: -19
> [   28.672737] vc4_hdmi fef00700.hdmi: ASoC: error at snd_soc_dai_startup=
 on fef00700.hdmi: -19
> [   28.679625] vc4_hdmi fef00700.hdmi: ASoC: error at snd_soc_dai_startup=
 on fef00700.hdmi: -19
> [   28.689390] vc4_hdmi fef00700.hdmi: ASoC: error at snd_soc_dai_startup=
 on fef00700.hdmi: -19
> [   28.695457] vc4_hdmi fef00700.hdmi: ASoC: error at snd_soc_dai_startup=
 on fef00700.hdmi: -19
> [   28.701659] vc4_hdmi fef00700.hdmi: ASoC: error at snd_soc_dai_startup=
 on fef00700.hdmi: -19
> [   28.747178] vc4_hdmi fef05700.hdmi: ASoC: error at snd_soc_dai_startup=
 on fef05700.hdmi: -19
> [   28.754082] vc4_hdmi fef05700.hdmi: ASoC: error at snd_soc_dai_startup=
 on fef05700.hdmi: -19
> [   28.814820] vc4_hdmi fef05700.hdmi: ASoC: error at snd_soc_dai_startup=
 on fef05700.hdmi: -19
> [   28.816158] vc4_hdmi fef05700.hdmi: ASoC: error at snd_soc_dai_startup=
 on fef05700.hdmi: -19
> [   28.820460] vc4_hdmi fef05700.hdmi: ASoC: error at snd_soc_dai_startup=
 on fef05700.hdmi: -19
> [   28.821131] vc4_hdmi fef05700.hdmi: ASoC: error at snd_soc_dai_startup=
 on fef05700.hdmi: -19
> [   28.821646] vc4_hdmi fef05700.hdmi: ASoC: error at snd_soc_dai_startup=
 on fef05700.hdmi: -19
>=20
>=20
> I have a hunch this shouldnt be there.
>=20
> Is this enough data you can work with? If I can of any more help, I'll
> be happy to assist. I am just not a hacker or coder.

I tried to reproduce it here, but couldn't come up with that error.

Can you share a bit more information on the system you're seeing it on?
What's your configuration, when does the issue comes up?

Thanks!
Maxime

--5abgnrs6kfzebizd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKumZAAKCRDj7w1vZxhR
xXIwAP446h7jt5II266/ZX/TzyvR42YzneFHOp8a/GAXwuRJjAEAnSRXbyl8GRLy
LgSrscpeK1NxBllaqOPANyq2LOtz7wo=
=NfzW
-----END PGP SIGNATURE-----

--5abgnrs6kfzebizd--
