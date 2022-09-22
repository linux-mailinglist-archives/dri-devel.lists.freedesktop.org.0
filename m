Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21925E6670
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 17:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8320610EB67;
	Thu, 22 Sep 2022 15:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621D810EB67
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 15:06:07 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 0CB35320090E;
 Thu, 22 Sep 2022 11:06:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 22 Sep 2022 11:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1663859164; x=1663945564; bh=xT/5Eq5DbV
 drVFn1MUyhXgcvYN7+wu+AkgDnZQhU2R0=; b=QRbuTYoMEf9KqU82YR25drAnIv
 4cJLPF5o8cF2SYYf5CFnVK9sGNwbunIW2wKCKz+iJ797gvjqClarBdV4gyuKAsyU
 eNnvCD0iLK2hMJ9jquukaoqo8JblntGcXHOc06Et5qbee/8VRXTrYN1ieMXAfNd5
 jRiz47Gwo+KG83ney6DQK37l3M9KwfdRJ7pxIM5Vr986b5IKnJxv1n7WiJYb/J0t
 tRGZa6fBfnUAxQ3S7VaPGDazGfG36qdi3b6izOPoeb1HlHGXGoYgaD7uSe5nxUq7
 ubWu8yaZjN66X4h53Vm+bKlNaDOpE2wJPJz0bnIDwZgN5E2TDnnR1R3FNI9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663859164; x=1663945564; bh=xT/5Eq5DbVdrVFn1MUyhXgcvYN7+
 wu+AkgDnZQhU2R0=; b=NOK0YrieQWoTAx2uumswt4s0oNfPeGjDcSdSUKoiu9S3
 9y82MXWJpL5nGUyl4VikME2o8dXsD6DtFeXzait4tPtruvDyp6xafHRF+zGAgEKY
 BKpUzcYCiTYGpISLmfSE6iBHL59zBhcXGrdbjaZOjwRmrt6aNSX7rHhn6dwZx9Z9
 OPBUzmljQ0N3V1ZL9KZlpdCl/ivIUBYgDe4ntcTnOipBEOTjGY+tAO9fNT1eUZ1P
 PkpPRaikuDsC5cl8aGnkTWuUUAhTEuL3qB4Xk5u9daVmmKt+Ng64HBBP22bm5ym6
 BTK9cN2tVNUbphuxzgorhEiLKgJwpKFjqDVN3wNH5w==
X-ME-Sender: <xms:23ksY9ZHKuRz5B09vaeVGRDtp_njUpNy0773mRudZAySf3d_0PaDng>
 <xme:23ksY0b2yDes08B_Xk-ii04WoSecKhCgE-PdBsfAsFW38F6XKNG5KZ_q1cLvgZHzS
 qDfeGt7xA3NtWAN5Gw>
X-ME-Received: <xmr:23ksY_8XvAGIvTVgwMNPkAJeBo_EDCsuA_OT9ALF7ZHVZLBvVxqovv-BdxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:23ksY7q9nEDNxkmVMoO1IIt1NbBwAkZHuODy_AYXWCJFIARrGeefvw>
 <xmx:23ksY4qo7cS95ip_u07ONY-pg5ehxyEHixZmGXbRnBhYf7Mf9ibvRA>
 <xmx:23ksYxRbu-qE9KDDlmMF_Z6Lwek0osKTYxrjjka8-BELqgcclO4ECg>
 <xmx:3HksY5dOsbtUzWH6LtygQAZQKBSFdFpSUrRR186tAISuRfnBCzeGoA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Sep 2022 11:06:02 -0400 (EDT)
Date: Thu, 22 Sep 2022 17:06:00 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: Raspberry Pi 3 Model B+ hangs in vc4_hdmi_runtime_resume()
Message-ID: <20220922150600.h4srjmgxc52qiv6r@houat>
References: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="p4bbb2uveqgrhq3f"
Content-Disposition: inline
In-Reply-To: <20220922145448.w3xfywkn5ecak2et@pengutronix.de>
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
Cc: dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--p4bbb2uveqgrhq3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 22, 2022 at 04:54:48PM +0200, Marc Kleine-Budde wrote:
> Hello,
>=20
> I'm on a Raspberry Pi 3 Model B+ running current Debian testing ARM64,
> using Debian's v5.19 kernel (Debian's v5.18 was working flawless).
>=20
> | [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034] =
                                                                           =
                                             =20
> | [    0.000000] Linux version 5.19.0-1-arm64 (debian-kernel@lists.debian=
=2Eorg) (gcc-11 (Debian 11.3.0-5) 11.3.0, GNU ld (GNU Binutils for Debian) =
2.38.90.20220713) #1 SMP Debian 5.19.6-1 (2022-0
> 9-01)                                                                    =
                                                                           =
                                           =20
> | [    0.000000] Machine model: Raspberry Pi 3 Model B+          =20
> | [    3.747500] raspberrypi-firmware soc:firmware: Attached to firmware =
=66rom 2022-03-24T13:21:11=20
>=20
> As soon a the vc4 module is loaded the following warnings hits 4
> times, then the machine stops.
>=20
> | [   66.839210] Console: switching to colour dummy device 80x25
> | [   66.861282] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc=
4])
> | [   66.868418] ------------[ cut here ]------------
> | [   66.873110] WARNING: CPU: 3 PID: 611 at drivers/gpu/drm/vc4/vc4_hdmi=
_regs.h:456 vc4_hdmi_reset+0x3e8/0x540 [vc4]
> | [   66.883495] Modules linked in: vc4(+) ccm cpufreq_userspace cpufreq_=
powersave cpufreq_ondemand cpufreq_conservative nls_ascii nls_cp437 vfat fa=
t ext4 mbcache jbd2 hci_uart btqca btrtl btbcm btintel btsdio bluetooth bcm=
2835_v4l2(C) bcm2835_mmal_vchiq(C) jitterentropy_rng
> | videobuf2_vmalloc sha512_generic videobuf2_memops rt2800usb snd_soc_cor=
e videobuf2_v4l2 rt2x00usb microchip videobuf2_common snd_bcm2835(C) rt2800=
lib snd_pcm_dmaengine sha512_arm64 bridge videodev snd_pcm rt2x00lib snd_ti=
mer aes_neon_bs lan78xx mc cec stp snd mac80211 aes_n
> | eon_blk rc_core brcmfmac llc drm_display_helper soundcore drm_cma_helpe=
r of_mdio cpufreq_dt drbg libarc4 fixed_phy drm_kms_helper brcmutil fwnode_=
mdio libphy ansi_cprng cfg80211 vchiq(C) ecdh_generic raspberrypi_cpufreq e=
cc bcm2835_rng crc16 bcm2835_thermal rng_core rfkill
> | pwm_bcm2835 bcm2835_wdt leds_gpio fuse drm configfs lz4 lz4_compress zr=
am zsmalloc ip_tables x_tables autofs4 btrfs blake2b_generic xor xor_neon r=
aid6_pq zstd_compress libcrc32c
> | [   66.883758]  crc32c_generic xxhash_generic dwc2 udc_core roles usbco=
re sdhci_iproc sdhci_pltfm crct10dif_ce crct10dif_common usb_common sdhci b=
cm2835 i2c_bcm2835 phy_generic
> | [   66.987722] CPU: 3 PID: 611 Comm: insmod Tainted: G         C       =
 5.19.0-1-arm64 #1  Debian 5.19.6-1
> | [   66.997253] Hardware name: Raspberry Pi 3 Model B+ (DT)
> | [   67.002549] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> | [   67.009610] pc : vc4_hdmi_reset+0x3e8/0x540 [vc4]
> | [   67.014426] lr : vc4_hdmi_reset+0x24/0x540 [vc4]
> | [   67.019153] sp : ffff80000ab83660
> | [   67.022510] x29: ffff80000ab83660 x28: 00000000055fd460 x27: ffff000=
009465080
> | [   67.029753] x26: 0000000000000000 x25: ffff800008fbe740 x24: ffff800=
009d582f0
> | [   67.036995] x23: ffff00000dabb000 x22: ffff000005144000 x21: ffff000=
013dc7180
> | [   67.044237] x20: 0000000000000000 x19: ffff000009465080 x18: fffffff=
fffffffff
> | [   67.051479] x17: 0000000000000000 x16: 0000000000000000 x15: ffff000=
013dc7f14
> | [   67.058721] x14: ffffffffffffffff x13: ffff000013dc7f10 x12: 0101010=
101010101
> | [   67.065963] x11: 0000000000000040 x10: fffffffff8858c10 x9 : ffff800=
00173ceb4
> | [   67.073205] x8 : 0101010101010101 x7 : 0000000000000000 x6 : ffff000=
00b3ad140
> | [   67.080447] x5 : ffff000009465ca8 x4 : 0000000000000000 x3 : ffff000=
009465ca8
> | [   67.087689] x2 : 0000000000000001 x1 : 0000000000000002 x0 : ffff800=
001753090
> | [   67.094932] Call trace:
> | [   67.097407]  vc4_hdmi_reset+0x3e8/0x540 [vc4]
> | [   67.101869]  vc4_hdmi_runtime_resume+0x74/0x360 [vc4]
> | [   67.107036]  vc4_hdmi_bind+0x218/0xa20 [vc4]
> | [   67.111407]  component_bind_all+0x130/0x290
> | [   67.115653]  vc4_drm_bind+0x10c/0x2e0 [vc4]
> | [   67.119936]  try_to_bring_up_aggregate_device+0x230/0x320
> | [   67.125411]  component_master_add_with_match+0xd4/0x11c
> | [   67.130710]  vc4_platform_drm_probe+0xd0/0x110 [vc4]
> | [   67.135787]  platform_probe+0x74/0xf0
> | [   67.139501]  really_probe+0x19c/0x3f0
> | [   67.143213]  __driver_probe_device+0x11c/0x190
> | [   67.147719]  driver_probe_device+0x44/0xf4
> | [   67.151872]  __driver_attach+0xd8/0x220
> | [   67.155760]  bus_for_each_dev+0x7c/0xe0
> | [   67.159649]  driver_attach+0x30/0x40
> | [   67.163272]  bus_add_driver+0x154/0x240
> | [   67.167162]  driver_register+0x84/0x140
> | [   67.171051]  __platform_driver_register+0x34/0x40
> | [   67.175821]  vc4_drm_register+0x5c/0x1000 [vc4]
> | [   67.180456]  do_one_initcall+0x50/0x240
> | [   67.184347]  do_init_module+0x50/0x1fc
> | [   67.188150]  load_module+0x1c5c/0x2060
> | [   67.191951]  __do_sys_finit_module+0xac/0x130
> | [   67.196369]  __arm64_sys_finit_module+0x2c/0x40
> | [   67.200964]  invoke_syscall+0x50/0x120
> | [   67.204766]  el0_svc_common.constprop.0+0x4c/0x100
> | [   67.209626]  do_el0_svc+0x3c/0xd0
> | [   67.212987]  el0_svc+0x3c/0x100
> | [   67.216174]  el0t_64_sync_handler+0xbc/0x140
> | [   67.220502]  el0t_64_sync+0x18c/0x190
> | [   67.224216] ---[ end trace 0000000000000000 ]---
> | [   67.228942] ------------[ cut here ]------------
>=20
> Is this a known problem?

The warning itself is fixed, both upstream and in stable (5.19.7). It
shouldn't have any relation to the hang though. Can you share your setup?

Maxime

--p4bbb2uveqgrhq3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYyx52AAKCRDj7w1vZxhR
xb6NAP0V8nqNoEXtKj9wkqJ41gJCf9q8BeGuGyX5LPhCPBGmRAEA5+rZh/OQ2mnY
rxjhPT3A6j52fosNIXoyVyT5MS8nlQA=
=zDkl
-----END PGP SIGNATURE-----

--p4bbb2uveqgrhq3f--
