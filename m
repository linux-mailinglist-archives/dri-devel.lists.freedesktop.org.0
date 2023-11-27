Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4883D7FA653
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 17:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111EE10E2F4;
	Mon, 27 Nov 2023 16:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA55110E2F4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 16:26:47 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id D51F83200A19;
 Mon, 27 Nov 2023 11:26:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 27 Nov 2023 11:26:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1701102404; x=1701188804; bh=pt
 qq3QMWmp4BAr+cuI/XoR+VhgGixDRSWSqYZbO66u4=; b=OHCBlK0n0K9kXZKA/9
 fHt0GWhxx4vOGAySMiv+tozII9CB8pBrkJOM5QeSD/nxzZnu9ZYzianxeheMbbxj
 XRokpxuy/1IjjCtxOLv6+avndLANRm8caJsZvBMLjUnl/KSMcfCCllj6/GrLB6Fo
 cQV4fKrmAuqiUaEgwPRTy1U5hCoC6pWOM+86ZPkezya3UldtBBTtC15S5/nhgrIV
 QkqPzWMFi4JgYpaxQh6J0w/o6Pq+v0WOJNlQR2+x3yR5KNS7kYIUO1i6Q5hvjTtH
 xo4jKeDFtCxOJmtqNRMsFUeP3SucFNgFPJ4jaZjhLAJmDJ1lJMVxT+tKfhHrEmYt
 0XLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1701102404; x=1701188804; bh=ptqq3QMWmp4BA
 r+cuI/XoR+VhgGixDRSWSqYZbO66u4=; b=tH36E9zg7FJc0QW8hWTKWlEcLsiqV
 Yq6xI2Pl36ZQKv8pB8yzTZQCrG7gO+KnagcEG4CcWhbgs/dJxCHeBz1eY70OsSqw
 4HZA+Vlwiw/3gxpryTNt0NsjEy+nvpuDduqdghqzNU8eQYDvH11ZU0HPjQMp6euF
 sPtAJvgZd2JEqVizmJX4sEVSfVRadlEqV9orf4Me8yLnMXHdJwy2rpY5DDwg6jna
 ABpxIa3ErR5EoQTATFDhKbE1xBeqYgaAygLMvhFAhSqoP+PHdqkluM80l95Jbv22
 jI6M5QwlMQO9FH/E2xfsHQYEN1n6ybDFxFqfrT1yGop6wI2Uy6RqAqw+w==
X-ME-Sender: <xms:Q8NkZR3eis6Mv5MCqmu-8dvQNfG_P6b_nF71Scmev45JGXRsYnbZcw>
 <xme:Q8NkZYG8YOVjtWQEVtWnKoIpazYViagWpRLmpfCfS_OvqiUXGtXaxYqZ86zi9QUj9
 zczMTHMkR43NSKi0A>
X-ME-Received: <xmr:Q8NkZR6B2C-6EvRQ-6ZWoOJyIru4DWTWJ9GZHIqlDb6ICypo5IHaWvGgozGfFYHP443AipUlTYAYFbS0Y89u_-vTHu88>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiuddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefujghffffkgggtsehgtderredttddtnecuhfhrohhmpeetlhihshhs
 rgcutfhoshhsuceohhhisegrlhihshhsrgdrihhsqeenucggtffrrghtthgvrhhnpedttd
 ektddvledtueefteehffejtdejkedtgedugeejudejhfevvedtkeeujeegjeenucffohhm
 rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhephhhisegrlhihshhsrgdrihhs
X-ME-Proxy: <xmx:Q8NkZe1ZuzOS4YxBvFTXyz0SdwnHoeWMR1ZTlXbjz1ntifnrWoWuZg>
 <xmx:Q8NkZUH8TwIHSd_Z7GcOLriywtWO9pbCiN0yuLFak1xeMC7Ke-3ehA>
 <xmx:Q8NkZf9pg0MZhw15FV9OtwaQODparAr9NLXhRwitmlKOK8oAey5iNQ>
 <xmx:RMNkZZ4EkLcIQVCC5Z8RgwL6ud9AaWilKGd-phtq0IDiYJydOfiBVw>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Nov 2023 11:26:43 -0500 (EST)
Received: by mbp.qyliss.net (Postfix, from userid 1000)
 id 564EE5D11; Mon, 27 Nov 2023 17:25:54 +0100 (CET)
From: Alyssa Ross <hi@alyssa.is>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/atomic-helpers: Invoke end_fb_access while
 owning plane state
In-Reply-To: <20231127142042.17815-1-tzimmermann@suse.de>
References: <20231127142042.17815-1-tzimmermann@suse.de>
Date: Mon, 27 Nov 2023 17:25:44 +0100
Message-ID: <874jh740zb.fsf@alyssa.is>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha256; protocol="application/pgp-signature"
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
Cc: dri-devel@lists.freedesktop.org, javierm@redhat.com, mripard@kernel.org,
 stable@vger.kernel.org
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
> v2:
> 	* fix test in drm_atomic_helper_cleanup_planes()
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

Got this basically immediately. :(

simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_init] Alloc=
ated atomic state 00000000cfb3f1f2
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_plane_state] =
Added [PLANE:31:plane-0] 000000004935bdca state to 00000000cfb3f1f2
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_crtc_state] A=
dded [CRTC:33:crtc-0] 00000000d25f613d state to 00000000cfb3f1f2
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_set_fb_for_plane]=
 Set [FB:38] for [PLANE:31:plane-0] state 000000004935bdca
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_connector_sta=
te] Added [CONNECTOR:35:Unknown-1] 0000000020d19f10 state to 00000000cfb3f1=
f2
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_check_only] check=
ing 00000000cfb3f1f2
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] Up=
dating routing for [CONNECTOR:35:Unknown-1]
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] [C=
ONNECTOR:35:Unknown-1] keeps [ENCODER:34:None-34], now on [CRTC:33:crtc-0]
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 00000000cfb3f1f2
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 00000000cfb3f1f2
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_nonblocking_commi=
t] committing 00000000cfb3f1f2 nonblocking
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_default_cle=
ar] Clearing atomic state 00000000cfb3f1f2
simple-framebuffer dd53a4000.framebuffer: [drm:__drm_atomic_state_free] Fre=
eing atomic state 00000000cfb3f1f2
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_init] Alloc=
ated atomic state 0000000003dc0c0b
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_plane_state] =
Added [PLANE:31:plane-0] 0000000083f22dc6 state to 0000000003dc0c0b
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_crtc_state] A=
dded [CRTC:33:crtc-0] 00000000eec339c5 state to 0000000003dc0c0b
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_set_fb_for_plane]=
 Set [FB:37] for [PLANE:31:plane-0] state 0000000083f22dc6
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_connector_sta=
te] Added [CONNECTOR:35:Unknown-1] 0000000022495ce9 state to 0000000003dc0c=
0b
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_check_only] check=
ing 0000000003dc0c0b
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] Up=
dating routing for [CONNECTOR:35:Unknown-1]
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] [C=
ONNECTOR:35:Unknown-1] keeps [ENCODER:34:None-34], now on [CRTC:33:crtc-0]
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 0000000003dc0c0b
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 0000000003dc0c0b
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_default_cle=
ar] Clearing atomic state 0000000003dc0c0b
simple-framebuffer dd53a4000.framebuffer: [drm:__drm_atomic_state_free] Fre=
eing atomic state 0000000003dc0c0b
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_init] Alloc=
ated atomic state 0000000003dc0c0b
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_plane_state] =
Added [PLANE:31:plane-0] 0000000083f22dc6 state to 0000000003dc0c0b
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_crtc_state] A=
dded [CRTC:33:crtc-0] 00000000eec339c5 state to 0000000003dc0c0b
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_set_fb_for_plane]=
 Set [FB:37] for [PLANE:31:plane-0] state 0000000083f22dc6
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_get_connector_sta=
te] Added [CONNECTOR:35:Unknown-1] 0000000022495ce9 state to 0000000003dc0c=
0b
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_check_only] check=
ing 0000000003dc0c0b
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] Up=
dating routing for [CONNECTOR:35:Unknown-1]
simple-framebuffer dd53a4000.framebuffer: [drm:update_connector_routing] [C=
ONNECTOR:35:Unknown-1] keeps [ENCODER:34:None-34], now on [CRTC:33:crtc-0]
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 0000000003dc0c0b
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_add_encoder_bridg=
es] Adding all bridges for [encoder:34:None-34] to 0000000003dc0c0b
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_nonblocking_commi=
t] committing 0000000003dc0c0b nonblocking
simple-framebuffer dd53a4000.framebuffer: [drm:drm_atomic_state_default_cle=
ar] Clearing atomic state 000000000a78a23c
simple-framebuffer dd53a4000.framebuffer: [drm:__drm_atomic_state_free] Fre=
eing atomic state 000000000a78a23c
Unable to handle kernel paging request at virtual address ffff80009033c000
Mem abort info:
  ESR =3D 0x0000000096000007
  EC =3D 0x25: DABT (current EL), IL =3D 32 bits
  SET =3D 0, FnV =3D 0
  EA =3D 0, S1PTW =3D 0
  FSC =3D 0x07: level 3 translation fault
Data abort info:
  ISV =3D 0, ISS =3D 0x00000007, ISS2 =3D 0x00000000
  CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
  GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
swapper pgtable: 16k pages, 48-bit VAs, pgdp=3D0000000dc5c44000
[ffff80009033c000] pgd=3D1000000dce9a0003, p4d=3D1000000dce9a0003, pud=3D10=
00000dce99c003, pmd=3D10000008105c8003, pte=3D0000000000000000
Internal error: Oops: 0000000096000007 [#1] PREEMPT SMP
Modules linked in: rfcomm snd_seq_dummy snd_hrtimer snd_seq snd_seq_device =
bnep des_generic libdes md4 brcmfmac_wcc joydev brcmfmac hci_bcm4377 brcmut=
il bluetooth ecdh_generic hid_magicmouse cfg80211 ecc rfkill snd_soc_macaud=
io macsmc_power macsmc_reboot macsmc_hid xt_conntrack apple_isp videobuf2_d=
ma_sg videobuf2_memops videobuf2_v4l2 nf_conntrack snd_soc_cs42l84 nf_defra=
g_ipv6 videodev nf_defrag_ipv4 videobuf2_common clk_apple_nco ofpart snd_so=
c_tas2764 spi_nor snd_soc_apple_mca mc apple_admac pwm_apple apple_soc_cpuf=
req leds_pwm ip6t_rpfilter hid_apple ipt_rpfilter xt_pkttype xt_LOG nf_log_=
syslog nft_compat nf_tables nfnetlink loop tun tap macvlan bridge stp llc f=
use zstd zram dm_crypt xhci_plat_hcd xhci_hcd nvmem_spmi_mfd rtc_macsmc gpi=
o_macsmc pcie_apple simple_mfd_spmi tps6598x dockchannel_hid regmap_spmi dw=
c3 phy_apple_atc pci_host_common udc_core typec nvme_apple macsmc_rtkit app=
le_sart apple_rtkit_helper apple_dockchannel macsmc apple_rtkit mfd_core sp=
mi_apple_controller nvmem_apple_efuses
 pinctrl_apple_gpio spi_apple i2c_apple apple_dart apple_mailbox btrfs xor =
xor_neon raid6_pq
CPU: 2 PID: 507 Comm: kworker/u16:10 Tainted: G S                 6.5.0-asa=
hi #1-NixOS
Hardware name: Apple MacBook Pro (13-inch, M2, 2022) (DT)
Workqueue: events_unbound commit_work
pstate: 21400009 (nzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=3D--)
pc : __memcpy+0x15c/0x230
lr : __drm_fb_xfrm_toio.isra.0+0xcc/0x15c
sp : ffff800082bf3b90
x29: ffff800082bf3b90 x28: ffff8000807773f4 x27: ffff80009033a800
x26: 0000000000000012 x25: 0000000000000a00 x24: 0000000000002800
x23: ffff000035604700 x22: 0000000000000640 x21: ffff000128070000
x20: ffff000128072800 x19: ffff80008402a800 x18: ffffffffffffffff
x17: 746174735f63696d x16: 6f74615f6d72645f x15: ff090f19ff090f19
x14: 0000000000000000 x13: ff0a1320ff0a1320 x12: ff0a1320ff0b1321
x11: ff0a1320ff0b1321 x10: ff0b1321ff0b1321 x9 : ff0b1321ff0a1320
x8 : ff0a1320ff0a1320 x7 : ff0a1320ff0a1320 x6 : ff0a1320ff0a1320
x5 : ffff000128075000 x4 : ffff80009033d000 x3 : ffff000128073fc0
x2 : 0000000000000ff0 x1 : ffff80009033bfc0 x0 : ffff000128072800
Call trace:
 __memcpy+0x15c/0x230
 drm_fb_xfrm.isra.0+0x44/0x60
 drm_fb_blit+0x234/0x2ec
 simpledrm_primary_plane_helper_atomic_update+0x12c/0x164
 drm_atomic_helper_commit_planes+0xe4/0x2d0
 drm_atomic_helper_commit_tail+0x54/0xa0
 commit_tail+0x15c/0x188
 commit_work+0x14/0x20
 process_one_work+0x1e0/0x344
 worker_thread+0x68/0x424
 kthread+0xf4/0x100
 ret_from_fork+0x10/0x20
Code: a9422428 a9032c6a a9432c2a a984346c (a9c4342c)=20
=2D--[ end trace 0000000000000000 ]---

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEH9wgcxqlHM/ARR3h+dvtSFmyccAFAmVkwwgACgkQ+dvtSFmy
ccCl7BAAju9nlVMRDdeVTkI7VLCB1Gq5rKRSZG0MBEKR5XHtBsMbJnHgfmfx5oJy
NwJpyuvYw4SCzmxlck+oxf7+9Edo96zsoEn/PmkmluAFJHJ1BrnEF7gpEasPL2v3
7jkAX83PzxUkO7nT9eFpLN4pWdnwRyOc+rAkx1sgOVSFLwb+veGQ1F7ww/gllIhN
bFupcW2Dg8fyu45m4I34Ik81UwfVfUGsBuBVouluT7v9FtjYQgBa7G20xfwFQoly
k95JB9bDc5wCsgSXByOoSYROayiwGnnMojG1y6re6kLNOgiO79MnX0Ni5FMGnN7A
CSslmpM8OuJXNHaYTDFWPTdObpLN3iDkUIMHQ5B5DSPw/BRf/wC/aKixxitYpXPK
ds27pT1ToCTeBJB/ekSnj5LN4MZFX9lbPFs8lUrc2feb9XHVRSToyUohZ0hesJXz
6GWXKWGoGgGVKbV3tU/SANvA7gNJaJBQPCxiTpHIGFKfdS8iLv9y3Pu/MqinymfF
Pt/Q38ZcinJPejoOlg/c2I6sCmWgcFgY+2iAxvpjkKUr6gNN2TofM4ZkF1606MgN
S8V/Gk4kPyPek+zMG/qNXkTXLVGMV86qDDfNHavzDs5xNR20foIFn8rBv1Jd4xeD
gWGC485/IcFkl/qaPNWzDr+7pGjm0Isipcry4rCpsD26Es91HWQ=
=4YzA
-----END PGP SIGNATURE-----
--=-=-=--
