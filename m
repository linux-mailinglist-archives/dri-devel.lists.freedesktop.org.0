Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1D07F9459
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 18:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314D810E132;
	Sun, 26 Nov 2023 17:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8324410E096
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 15:08:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0F9235C012F;
 Sun, 26 Nov 2023 10:08:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 26 Nov 2023 10:08:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1701011332; x=1701097732; bh=YI
 8FMQnKSnI9APH9zjkRWX9W/KpWcGVRZ6d9zjkPGF4=; b=EqIOq1WYrQJs/Yw62h
 rRHlnzSihSGGAyaHdPMcY0oL3vcC/0jjniLpJkvljE1q1oKRyBfULEf6ZYVT0Efu
 /jQL1HrJ9ifV/xsANQzukqu+gVPggt4ZTNJxQqSWM2ihk0bp9W6Oo1RmszhQ2tDZ
 6d42zDEKsBHYccSI+/NQ0GzIDTJAPUYRKExZGnfDO2UshOjTA3I6BgbTAcZiJFZU
 8utiWryJT9m6fDM9vfPwDb3Ig3JZRFu/aDqH+pVW42rO2qYYJbB/zCvO+E7r8Oy1
 rA26R/9sORSGYRNlQ6VKEde7Ql9DI+t4VXvWFMieUDjzgT+dq7MWwHwrRxPhSRay
 xLMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1701011332; x=1701097732; bh=YI8FMQnKSnI9A
 PH9zjkRWX9W/KpWcGVRZ6d9zjkPGF4=; b=urvmISJ6VoW0O+YL1jMAYV3RITZDR
 d4c8iUaVfuPuVLqJDfiwqd6UB6sfOubdO2fxAcnyD9+38JEl6TLIMLC1rnHBNOy8
 qQFfLuW2bM6J08yOk2e8FSEYKTl1KgGWlIOjZY0jvxiB3RCZ2SXVH4v58TYQcYPR
 VRqQE7cZO7Nr3JvesL94M3seohDe5kcqPxlD5EhmpGA7DrMQdO6PPpzZzzGzXCr/
 T6dsykZKDEIFQR4mtumxR2d4GZdjpSXaFnJSFuy4g1n9UqKeuaFRBi7pYHxVHJZ/
 Qb5edr8FrWi1oWv1kZOFkkGo9ub+qKYt6GwhGIhiZaRX12X6mCPyth4sA==
X-ME-Sender: <xms:g19jZU7OPj32tJ2swZXNUOCCEHF4YKAu2cv9fEIaDmPxWvIfC7zG4w>
 <xme:g19jZV4H9pwq0pq6FfHDRtLhBFo9hTk5BRWtxFp9sS70KA3H19cIDpyz4tswWv4f3
 SrD52yHehD3APvIxg>
X-ME-Received: <xmr:g19jZTfvZyVAelRLtoUJDwbGwsKGrcj7UnuSAxP7GTWtkV95AdTrp2ojD1D1cyHHsSPtkM0jBcCNSzrWZTP4MmSQNpkh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehledgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefujghffffkgggtsehgtderredttddtnecuhfhrohhmpeetlhihshhs
 rgcutfhoshhsuceohhhisegrlhihshhsrgdrihhsqeenucggtffrrghtthgvrhhnpedttd
 ektddvledtueefteehffejtdejkedtgedugeejudejhfevvedtkeeujeegjeenucffohhm
 rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhephhhisegrlhihshhsrgdrihhs
X-ME-Proxy: <xmx:g19jZZKww8uTcWb5pLKXCI4hGq2yW20WQYihayXKXYNk-zPhHxg20Q>
 <xmx:g19jZYIe0TH_hTSR57o34rApcrvBa-LwQAPLlSf2UiMEtXeHN4OOtw>
 <xmx:g19jZaxlMXQdJSTb6srUznoTDnLXG3CWnzJPMzAZsGFd-AFw_G0WOw>
 <xmx:hF9jZQ9jVHGi5bM8lYF0MCyEXZr60LlM9ecOBvMGL4VOjHqdI_JskQ>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Nov 2023 10:08:50 -0500 (EST)
Received: by mbp.qyliss.net (Postfix, from userid 1000)
 id 082CB5912; Sun, 26 Nov 2023 16:08:48 +0100 (CET)
From: Alyssa Ross <hi@alyssa.is>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com
Subject: Re: [PATCH] drm/atomic-helpers: Invoke end_fb_access while owning
 plane state
In-Reply-To: <20231124114122.14102-1-tzimmermann@suse.de>
References: <20231124114122.14102-1-tzimmermann@suse.de>
Date: Sun, 26 Nov 2023 16:08:45 +0100
Message-ID: <87il5oeema.fsf@alyssa.is>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
X-Mailman-Approved-At: Sun, 26 Nov 2023 17:00:19 +0000
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Invoke drm_plane_helper_funcs.end_fb_access before
> drm_atomic_helper_commit_hw_done(). The latter function hands over
> ownership of the plane state to the following commit, which might
> free it. Releasing resources in end_fb_access then operates on undefined
> state. This bug has been observed with non-blocking commits when they
> are being queued up quickly.
>
> Here is an example stack trace from the bug report. The plane state has
> been free'd already, so the pages for drm_gem_fb_vunmap() are gone.
>
> Unable to handle kernel paging request at virtual address 0000000100000049
> [...]
>  drm_gem_fb_vunmap+0x18/0x74
>  drm_gem_end_shadow_fb_access+0x1c/0x2c
>  drm_atomic_helper_cleanup_planes+0x58/0xd8
>  drm_atomic_helper_commit_tail+0x90/0xa0
>  commit_tail+0x15c/0x188
>  commit_work+0x14/0x20
>
> For aborted commits, it is still ok to run end_fb_access as part of the
> plane's cleanup. Add a test to drm_atomic_helper_cleanup_planes().
>
> Reported-by: Alyssa Ross <hi@alyssa.is>
> Closes: https://lore.kernel.org/dri-devel/87leazm0ya.fsf@alyssa.is/
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Fixes: 94d879eaf7fb ("drm/atomic-helper: Add {begin,end}_fb_access to pla=
ne helpers")
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: <stable@vger.kernel.org> # v6.2+
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

I've been trying this patch for the last couple of days.  Alas the
problem doesn't seem to have been resolved entirely, because I've had
the following Oopses:


simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_init] Alloc=
ated atomic state 00000000af08a086
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_plane_state] =
Added [PLANE:31:plane-0] 0000000001cc7517 state to 00000000af08a086
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_crtc_state] A=
dded [CRTC:33:crtc-0] 00000000e546877a state to 00000000af08a086
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_set_fb_for_plane]=
 Set [FB:37] for [PLANE:31:plane-0] state 0000000001cc7517
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_connector_sta=
te] Added [CONNECTOR:35:Unknown-1] 000000008cee195b state to 00000000af08a0=
86
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_check_only] check=
ing 00000000af08a086
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] Up=
dating routing for [CONNECTOR:35:Unknown-1]
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] [C=
ONNECTOR:35:Unknown-1] keeps [ENCODER:34:None-34], now on [CRTC:33:crtc-0]
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 00000000af08a086
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 00000000af08a086
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_nonblocking_commi=
t] committing 00000000af08a086 nonblocking
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_default_cle=
ar] Clearing atomic state 00000000af08a086
simple-framebuffer dd53a4000.framebuffer: [drm:__drm_atomic_state_free] Fre=
eing atomic state 00000000af08a086
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_init] Alloc=
ated atomic state 00000000f87a08e9
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_plane_state] =
Added [PLANE:31:plane-0] 00000000d3b51954 state to 00000000f87a08e9
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_crtc_state] A=
dded [CRTC:33:crtc-0] 00000000e7c9e6b8 state to 00000000f87a08e9
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_set_fb_for_plane]=
 Set [FB:38] for [PLANE:31:plane-0] state 00000000d3b51954
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_connector_sta=
te] Added [CONNECTOR:35:Unknown-1] 00000000016b7c7e state to 00000000f87a08=
e9
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_check_only] check=
ing 00000000f87a08e9
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] Up=
dating routing for [CONNECTOR:35:Unknown-1]
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] [C=
ONNECTOR:35:Unknown-1] keeps [ENCODER:34:None-34], now on [CRTC:33:crtc-0]
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 00000000f87a08e9
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 00000000f87a08e9
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_default_cle=
ar] Clearing atomic state 00000000f87a08e9
simple-framebuffer dd53a4000.framebuffer: [drm:__drm_atomic_state_free] Fre=
eing atomic state 00000000f87a08e9
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_init] Alloc=
ated atomic state 00000000f87a08e9
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_plane_state] =
Added [PLANE:31:plane-0] 00000000d3b51954 state to 00000000f87a08e9
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_crtc_state] A=
dded [CRTC:33:crtc-0] 00000000e7c9e6b8 state to 00000000f87a08e9
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_set_fb_for_plane]=
 Set [FB:38] for [PLANE:31:plane-0] state 00000000d3b51954
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_connector_sta=
te] Added [CONNECTOR:35:Unknown-1] 00000000016b7c7e state to 00000000f87a08=
e9
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_check_only] check=
ing 00000000f87a08e9
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] Up=
dating routing for [CONNECTOR:35:Unknown-1]
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] [C=
ONNECTOR:35:Unknown-1] keeps [ENCODER:34:None-34], now on [CRTC:33:crtc-0]
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 00000000f87a08e9
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 00000000f87a08e9
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_nonblocking_commi=
t] committing 00000000f87a08e9 nonblocking
Unable to handle kernel paging request at virtual address 07821098078210e0
Mem abort info:
  ESR =3D 0x0000000096000004
  EC =3D 0x25: DABT (current EL), IL =3D 32 bits
  SET =3D 0, FnV =3D 0
  EA =3D 0, S1PTW =3D 0
  FSC =3D 0x04: level 0 translation fault
Data abort info:
  ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
  CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
  GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
[07821098078210e0] address between user and kernel address ranges
Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
Modules linked in: uas usb_storage usbhid rfcomm snd_seq_dummy snd_hrtimer =
snd_seq snd_seq_device bnep des_generic libdes md4 brcmfmac_wcc joydev hci_=
bcm4377 bluetooth brcmfmac brcmutil ecdh_generic cfg80211 hid_magicmouse ec=
c rfkill macsmc_power macsmc_hid snd_soc_macaudio macsmc_reboot apple_isp v=
ideobuf2_dma_sg videobuf2_memops videobuf2_v4l2 videodev videobuf2_common x=
t_conntrack ofpart nf_conntrack mc spi_nor nf_defrag_ipv6 clk_apple_nco app=
le_admac nf_defrag_ipv4 snd_soc_apple_mca snd_soc_cs42l84 snd_soc_tas2764 p=
wm_apple apple_soc_cpufreq leds_pwm hid_apple ip6t_rpfilter ipt_rpfilter xt=
_pkttype xt_LOG nf_log_syslog nft_compat nf_tables nfnetlink loop tun tap m=
acvlan bridge stp llc fuse zstd zram dm_crypt xhci_plat_hcd xhci_hcd rtc_ma=
csmc nvmem_spmi_mfd gpio_macsmc pcie_apple simple_mfd_spmi dockchannel_hid =
tps6598x regmap_spmi pci_host_common phy_apple_atc dwc3 typec nvme_apple ud=
c_core apple_sart apple_dockchannel macsmc_rtkit apple_rtkit_helper macsmc =
apple_rtkit mfd_core spmi_apple_controller
 nvmem_apple_efuses
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_default_cle=
ar] Clearing atomic state 00000000f87a08e9
 pinctrl_apple_gpio spi_apple i2c_apple apple_dart apple_mailbox btrfs xor =
xor_neon
simple-framebuffer dd53a4000.framebuffer: [drm:__drm_atomic_state_free] Fre=
eing atomic state 00000000f87a08e9
 raid6_pq
CPU: 3 PID: 1051504 Comm: kworker/u16:0 Tainted: G S                 6.5.0-=
asahi #1-NixOS
Hardware name: Apple MacBook Pro (13-inch, M2, 2022) (DT)
Workqueue: events_unbound commit_work
pstate: 21400009 (nzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=3D--)
pc : drm_gem_fb_vunmap+0x18/0x74
lr : drm_gem_end_shadow_fb_access+0x1c/0x2c
sp : ffff800088d1bd00
x29: ffff800088d1bd00 x28: 0000000000000000 x27: 0000000000000000
x26: ffff000001f6a400 x25: 00000000fffffef7 x24: ffff00000c3a6760
x23: ffff000001fcb805 x22: 0000000000000000 x21: 0782109807821098
x20: ffff00000c3a6700 x19: 0000000000000001 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: 000000000000000a x13: 0000000000000000 x12: ffff800081310a80
x11: 0000000000000001 x10: 4547e57b44a6ff52 x9 : 55676353188274f2
x8 : ffff00039f2bc148 x7 : 0000000000000004 x6 : 0000000000000190
x5 : 0000000000000001 x4 : ffff00021312e200 x3 : ffff00000ec16000
x2 : ffff80008077889c x1 : ffff0000cbde3498 x0 : 0782109807821098
Call trace:
 drm_gem_fb_vunmap+0x18/0x74
 drm_gem_end_shadow_fb_access+0x1c/0x2c
 drm_atomic_helper_cleanup_planes+0x64/0xe0
 drm_atomic_helper_commit_tail+0x90/0xa0
 commit_tail+0x15c/0x188
 commit_work+0x14/0x20
 process_one_work+0x1e0/0x344
 worker_thread+0x68/0x424
 kthread+0xf4/0x100
 ret_from_fork+0x10/0x20
Code: 910003fd a90153f3 f90013f5 aa0003f5 (f9402400)=20
=2D--[ end trace 0000000000000000 ]---


simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_init] Alloc=
ated atomic state 000000005d0bd601
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_plane_state] =
Added [PLANE:31:plane-0] 000000001a73352d state to 000000005d0bd601
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_crtc_state] A=
dded [CRTC:33:crtc-0] 000000007421fdc2 state to 000000005d0bd601
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_set_fb_for_plane]=
 Set [FB:39] for [PLANE:31:plane-0] state 000000001a73352d
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_connector_sta=
te] Added [CONNECTOR:35:Unknown-1] 00000000dabd463e state to 000000005d0bd6=
01
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_check_only] check=
ing 000000005d0bd601
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] Up=
dating routing for [CONNECTOR:35:Unknown-1]
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] [C=
ONNECTOR:35:Unknown-1] keeps [ENCODER:34:None-34], now on [CRTC:33:crtc-0]
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 000000005d0bd601
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 000000005d0bd601
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_nonblocking_commi=
t] committing 000000005d0bd601 nonblocking
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_default_cle=
ar] Clearing atomic state 000000005d0bd601
simple-framebuffer dd53a4000.framebuffer: [drm:__drm_atomic_state_free] Fre=
eing atomic state 000000005d0bd601
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_init] Alloc=
ated atomic state 00000000f0e89d2d
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_plane_state] =
Added [PLANE:31:plane-0] 000000008a207775 state to 00000000f0e89d2d
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_crtc_state] A=
dded [CRTC:33:crtc-0] 00000000a7948d96 state to 00000000f0e89d2d
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_set_fb_for_plane]=
 Set [FB:37] for [PLANE:31:plane-0] state 000000008a207775
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_connector_sta=
te] Added [CONNECTOR:35:Unknown-1] 000000005a471972 state to 00000000f0e89d=
2d
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_check_only] check=
ing 00000000f0e89d2d
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] Up=
dating routing for [CONNECTOR:35:Unknown-1]
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] [C=
ONNECTOR:35:Unknown-1] keeps [ENCODER:34:None-34], now on [CRTC:33:crtc-0]
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 00000000f0e89d2d
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 00000000f0e89d2d
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_default_cle=
ar] Clearing atomic state 00000000f0e89d2d
simple-framebuffer dd53a4000.framebuffer: [drm:__drm_atomic_state_free] Fre=
eing atomic state 00000000f0e89d2d
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_init] Alloc=
ated atomic state 00000000f0e89d2d
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_plane_state] =
Added [PLANE:31:plane-0] 000000008a207775 state to 00000000f0e89d2d
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_crtc_state] A=
dded [CRTC:33:crtc-0] 00000000a7948d96 state to 00000000f0e89d2d
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_set_fb_for_plane]=
 Set [FB:37] for [PLANE:31:plane-0] state 000000008a207775
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_connector_sta=
te] Added [CONNECTOR:35:Unknown-1] 000000005a471972 state to 00000000f0e89d=
2d
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_check_only] check=
ing 00000000f0e89d2d
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] Up=
dating routing for [CONNECTOR:35:Unknown-1]
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] [C=
ONNECTOR:35:Unknown-1] keeps [ENCODER:34:None-34], now on [CRTC:33:crtc-0]
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 00000000f0e89d2d
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 00000000f0e89d2d
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_nonblocking_commi=
t] committing 00000000f0e89d2d nonblocking
Unable to handle kernel paging request at virtual address 0042608409c280d0
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_default_cle=
ar] Clearing atomic state 00000000f0e89d2d
simple-framebuffer dd53a4000.framebuffer: [drm:__drm_atomic_state_free] Fre=
eing atomic state 00000000f0e89d2d
Mem abort info:
  ESR =3D 0x0000000096000004
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_init] Alloc=
ated atomic state 00000000921c84ac
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_plane_state] =
Added [PLANE:31:plane-0] 00000000018a5301 state to 00000000921c84ac
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_crtc_state] A=
dded [CRTC:33:crtc-0] 000000007461d4b6 state to 00000000921c84ac
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_set_fb_for_plane]=
 Set [FB:39] for [PLANE:31:plane-0] state 00000000018a5301
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_connector_sta=
te] Added [CONNECTOR:35:Unknown-1] 00000000aa5a97e1 state to 00000000921c84=
ac
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_check_only] check=
ing 00000000921c84ac
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] Up=
dating routing for [CONNECTOR:35:Unknown-1]
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] [C=
ONNECTOR:35:Unknown-1] keeps [ENCODER:34:None-34], now on [CRTC:33:crtc-0]
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 00000000921c84ac
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 00000000921c84ac
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_default_cle=
ar] Clearing atomic state 00000000921c84ac
simple-framebuffer dd53a4000.framebuffer: [drm:__drm_atomic_state_free] Fre=
eing atomic state 00000000921c84ac
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_init] Alloc=
ated atomic state 00000000921c84ac
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_plane_state] =
Added [PLANE:31:plane-0] 00000000018a5301 state to 00000000921c84ac
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_crtc_state] A=
dded [CRTC:33:crtc-0] 000000007461d4b6 state to 00000000921c84ac
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_set_fb_for_plane]=
 Set [FB:39] for [PLANE:31:plane-0] state 00000000018a5301
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_connector_sta=
te] Added [CONNECTOR:35:Unknown-1] 00000000aa5a97e1 state to 00000000921c84=
ac
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_check_only] check=
ing 00000000921c84ac
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] Up=
dating routing for [CONNECTOR:35:Unknown-1]
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] [C=
ONNECTOR:35:Unknown-1] keeps [ENCODER:34:None-34], now on [CRTC:33:crtc-0]
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 00000000921c84ac
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 00000000921c84ac
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_nonblocking_commi=
t] committing 00000000921c84ac nonblocking
  EC =3D 0x25: DABT (current EL), IL =3D 32 bits
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_default_cle=
ar] Clearing atomic state 00000000921c84ac
simple-framebuffer dd53a4000.framebuffer: [drm:__drm_atomic_state_free] Fre=
eing atomic state 00000000921c84ac
  SET =3D 0, FnV =3D 0
  EA =3D 0, S1PTW =3D 0
  FSC =3D 0x04: level 0 translation fault
Data abort info:
  ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
  CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
  GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
[0042608409c280d0] address between user and kernel address ranges
Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
Modules linked in: rfcomm snd_seq_dummy snd_hrtimer snd_seq snd_seq_device =
uas usb_storage usbhid xhci_plat_hcd xhci_hcd bnep des_generic libdes md4 b=
rcmfmac_wcc hci_bcm4377 joydev brcmfmac brcmutil bluetooth cfg80211 ecdh_ge=
neric ecc hid_magicmouse rfkill apple_isp macsmc_reboot snd_soc_macaudio ma=
csmc_hid macsmc_power videobuf2_dma_sg videobuf2_memops snd_soc_cs42l84 vid=
eobuf2_v4l2 ofpart snd_soc_tas2764 spi_nor xt_conntrack videodev videobuf2_=
common snd_soc_apple_mca nf_conntrack mc pwm_apple apple_admac clk_apple_nc=
o nf_defrag_ipv6 nf_defrag_ipv4 leds_pwm apple_soc_cpufreq hid_apple ip6t_r=
pfilter ipt_rpfilter xt_pkttype xt_LOG nf_log_syslog nft_compat nf_tables n=
fnetlink loop tun tap macvlan bridge stp llc fuse zstd zram dm_crypt nvmem_=
spmi_mfd rtc_macsmc gpio_macsmc simple_mfd_spmi tps6598x dockchannel_hid re=
gmap_spmi pcie_apple pci_host_common dwc3 phy_apple_atc apple_rtkit_helper =
nvme_apple udc_core typec macsmc_rtkit apple_rtkit apple_sart macsmc apple_=
dockchannel mfd_core spmi_apple_controller
 nvmem_apple_efuses pinctrl_apple_gpio spi_apple i2c_apple apple_dart apple=
_mailbox btrfs xor xor_neon raid6_pq
CPU: 0 PID: 1343030 Comm: kworker/u16:1 Tainted: G S                 6.5.0-=
asahi #1-NixOS
Hardware name: Apple MacBook Pro (13-inch, M2, 2022) (DT)
Workqueue: events_unbound commit_work
pstate: 81400009 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=3D--)
pc : drm_gem_fb_vunmap+0x18/0x74
lr : drm_gem_end_shadow_fb_access+0x1c/0x2c
sp : ffff800089703d00
x29: ffff800089703d00 x28: 0000000000000000 x27: 0000000000000000
x26: ffff000001f6a400 x25: 00000000fffffef7 x24: ffff00001271c7e0
x23: ffff000001fc9605 x22: 0000000000000000 x21: 0942608409c28088
x20: ffff00001271c780 x19: 0000000000000001 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: 0000000000000076 x13: 0000000000000000 x12: ffff800081310a80
x11: 0000000000000001 x10: 5529b6694f2ac3f6 x9 : 89a1724a7ebc1277
x8 : ffff0000133af7c8 x7 : 0000000000000004 x6 : 0000000000000190
x5 : 0000000000000001 x4 : ffff0000a3bd5a00 x3 : ffff00000dd18000
x2 : ffff80008077889c x1 : ffff000139c39c98 x0 : 0942608409c28088
Call trace:
 drm_gem_fb_vunmap+0x18/0x74
 drm_gem_end_shadow_fb_access+0x1c/0x2c
 drm_atomic_helper_cleanup_planes+0x64/0xe0
 drm_atomic_helper_commit_tail+0x90/0xa0
 commit_tail+0x15c/0x188
 commit_work+0x14/0x20
 process_one_work+0x1e0/0x344
 worker_thread+0x68/0x424
 kthread+0xf4/0x100
 ret_from_fork+0x10/0x20
Code: 910003fd a90153f3 f90013f5 aa0003f5 (f9402400)=20

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEH9wgcxqlHM/ARR3h+dvtSFmyccAFAmVjX30ACgkQ+dvtSFmy
ccBGFA/+KOgB6MEfdCKK0Bc3WHAbGtmGQ6ZMtv/fVAX7JZXnO/SbcXzW1dBp7rRv
KsfMbrO0hcmm3lLmr9EHVZtZ0YYFM2wCThVvN0E5s7MV2xtUFP8zcQSE3bjuflnr
w3AzCh6X9Xe6mocbT6GaaUrs4FL/QEWyxAm9tFUUmY6fld8IXAlbt3vVCywXmcN3
ii/o3fXMnLtzjXxH0/e4zGLInE8DGnuiK1M2JZksmNDUQaOPh3Qra9FnJGfmIBus
EIeh/+Y/pG8dX5ozWFv6tBfOxCyg4UHh5UcSCs99VzNQP8LGSI8bxooxQrIO6L6J
JJVJi/uwAVliHSUmPJc7YRSvmAhjnlalHUYSAsc1aEAg841/Bqn5udnz1HQgDZGO
ADRtwYRZjdzw6USoIjR38S3m0uvhuYwudQTK0ysYS4sG9ablUfuAnx7UWntv05vc
857SS1flb54mON8ztUQY0M82nIlwpSBY8RFst65T1Vcx8SvUMTAfafBD/vIi6rrZ
9ueHK/XiXzpvEAMumEtViJ2yJArgJaZNY7cxlEnpE2+tzydsmJgyu6udHgL+nF+6
hTkpaCc2Jl5zZvlODEU8G17ryz9vPd4T+9t3w3JSD9VE41vo7LXGjkA4pQsCQLT/
Afcew+NmmoLEVh+8tiho8KP9vg/v9jXjrWmJpl6jCI51vn0QqGM=
=qo/M
-----END PGP SIGNATURE-----
--=-=-=--
