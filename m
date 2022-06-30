Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF146561359
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 09:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188C9112758;
	Thu, 30 Jun 2022 07:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC3C112762
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 07:37:53 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1F2283200893;
 Thu, 30 Jun 2022 03:37:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 30 Jun 2022 03:37:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1656574671; x=1656661071; bh=nqZKN3ZyBe
 wz4i5wwR7cb47guy4KEThcHWzu9ubDxTY=; b=m3o+WSWPpn+U51fjYPqYQbGqqR
 XR9CUrRuTXh2YNbcRC4hHH9rX6U+05Ey/s/10dX2dw+2uvi1OmX1gGqdcddcCdAr
 VOYh6tT/N23bc3i3DR2beUbucSnmzDGXjcvPAwJfSfyjVMszk5Vqyz099zRv9tXX
 rF1mtisjvWQSKLrV3wqjnKtlqhKzVMK/qTskCGLaA8VWQ67xibPsYdoU3LrSa/6H
 7C4xz1rdOjiDrDjVXBtQMaCKSrKQFLk8CAOJhcMuDGQhAn66Ue7zgd9nYY20Ci6H
 YzNCWEu3hg52EG9OofHlXZjVGr0E1RZcrwa3JEsg6hx9AoAmFA2zIxmQkcmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1656574671; x=1656661071; bh=nqZKN3ZyBewz4i5wwR7cb47guy4K
 EThcHWzu9ubDxTY=; b=Yo9b8jg1OVaTa9XhUsoR6N03YxvbpYyqgm4En7W+usHp
 5R1Tq/sMNUet3yCyw+Yt50HCeHe0OMcLLaWgjhwEJdQIFsUf+4PxJLRxpimbyEv1
 uXzShuH37jS/YuQ/rnXa1cQbDcdZom5ppQlnhTidIbMdqyP8IKEzQNmOxk82pRET
 cHWNUKSSxEPZ4QpgF7f2ZK2e1LZtxxK2yq3O5i34Fa8uNMiQ6HSQ2uAVAZ7GBOHV
 OzOL18EN9ZbNH3okRLQFpdeJEtgv+nybAG+iqHGfxvG5z3ljpWe+dhCBwvr4XC/L
 gzZh3xWrUZn82NPdb6Z84kesxbrkPbsd7lqZ58V8JQ==
X-ME-Sender: <xms:z1K9Ys9rkOluKDGAfcDDFTSekmMwhom3oor7-222secThkT_kKS8_Q>
 <xme:z1K9Ykv9I2DcVjuWu2OmR7cd9-5zQu8jKfRY3IdhmOH6qw7mijSY2XS0sJ3M6EOWV
 qrL2T86qAzFpvWxJW0>
X-ME-Received: <xmr:z1K9YiCTaMdNuEPim7jA7iC66tH4gPi8vF9f_IlOWnmu029XzLBKBLMvrP0HSbM9HENvzK9AQU6yjsfoUdO-0GuKWWE-jBiQScV_pFI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleejuefggeevteelveekteffgeduveeiteeiueegueegiedvtdejjedv
 feeftefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:z1K9YsfQGIKaKge7eS9cNQnFse_44UMTltnjLbmb1Pd93Frq8UW39w>
 <xmx:z1K9YhNz2_WQqvh6YXmwWSIipT8j_Mz_lWkymBm0QQ-ko51zhBgtfQ>
 <xmx:z1K9YmmtPeh05nQUFd_WX29zcptFrZNyb28C3HxgfeHPsUJCHIFqSQ>
 <xmx:z1K9Yv2N-A_sTol5Yntw2sQ7Si6-tQzK5h-oLaxsrIhXEGqWtmI_7w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 03:37:51 -0400 (EDT)
Date: Thu, 30 Jun 2022 09:37:50 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: drm-misc-next: WARNING: at drivers/gpu/drm/vc4/vc4_hdmi_regs.h:487
Message-ID: <20220630073750.cjsskqq6bid7ayhf@houat>
References: <179330ab-951b-d9cd-bf73-a80fbc5666d9@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7b7pervf5vzxvbra"
Content-Disposition: inline
In-Reply-To: <179330ab-951b-d9cd-bf73-a80fbc5666d9@i2se.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7b7pervf5vzxvbra
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Wed, Jun 29, 2022 at 10:50:21PM +0200, Stefan Wahren wrote:
> Hi Maxime,
>=20
> i tested todays drm-misc-next 9db35bb349 with Raspberry Pi 3 B Plus
> (arm/multi_v7_defconfig, mainline DTB) and get the following warning in t=
he
> kernel logs:
>=20
> [=A0=A0 25.698459] vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [=
vc4])
> [=A0=A0 25.698657] ------------[ cut here ]------------
> [=A0=A0 25.698660] WARNING: CPU: 1 PID: 153 at
> drivers/gpu/drm/vc4/vc4_hdmi_regs.h:487 vc4_hdmi_reset+0x3e0/0x4e0 [vc4]
> [=A0=A0 25.698757] Modules linked in: brcmutil vc4(+) snd_soc_core ac97_b=
us
> sha256_generic libsha256 snd_pcm_dmaengine sha256_arm snd_pcm cfg80211
> snd_timer hci_uart btbcm snd soundcore bluetooth raspberrypi_hwmon
> drm_cma_helper ecdh_generic ecc libaes bcm2835_thermal microchip lan78xx
> crc32_arm_ce
> [=A0=A0 25.698831] CPU: 1 PID: 153 Comm: systemd-udevd Not tainted
> 5.19.0-rc2-00085-g9db35bb349a0 #2
> [=A0=A0 25.698839] Hardware name: BCM2835
> [=A0=A0 25.698850]=A0 unwind_backtrace from show_stack+0x10/0x14
> [=A0=A0 25.698866]=A0 show_stack from dump_stack_lvl+0x40/0x4c
> [=A0=A0 25.698879]=A0 dump_stack_lvl from __warn+0xcc/0x144
> [=A0=A0 25.698890]=A0 __warn from warn_slowpath_fmt+0x5c/0xb4
> [=A0=A0 25.698900]=A0 warn_slowpath_fmt from vc4_hdmi_reset+0x3e0/0x4e0 [=
vc4]
> [=A0=A0 25.698996]=A0 vc4_hdmi_reset [vc4] from vc4_hdmi_runtime_resume+0=
x4c/0x64
> [vc4]
> [=A0=A0 25.699165]=A0 vc4_hdmi_runtime_resume [vc4] from vc4_hdmi_bind+0x=
208/0x994
> [vc4]
> [=A0=A0 25.699333]=A0 vc4_hdmi_bind [vc4] from component_bind_all+0x100/0=
x230
> [=A0=A0 25.699428]=A0 component_bind_all from vc4_drm_bind+0x1a8/0x280 [v=
c4]
> [=A0=A0 25.699518]=A0 vc4_drm_bind [vc4] from
> try_to_bring_up_aggregate_device+0x160/0x1bc
> [=A0=A0 25.699610]=A0 try_to_bring_up_aggregate_device from
> component_master_add_with_match+0xc4/0xf8
> [=A0=A0 25.699622]=A0 component_master_add_with_match from
> vc4_platform_drm_probe+0xa0/0xc0 [vc4]
> [=A0=A0 25.699712]=A0 vc4_platform_drm_probe [vc4] from platform_probe+0x=
5c/0xbc
> [=A0=A0 25.699802]=A0 platform_probe from really_probe.part.0+0x9c/0x2b0
> [=A0=A0 25.699812]=A0 really_probe.part.0 from __driver_probe_device+0xa8=
/0x13c
> [=A0=A0 25.699823]=A0 __driver_probe_device from driver_probe_device+0x34=
/0x108
> [=A0=A0 25.699834]=A0 driver_probe_device from __driver_attach+0xb4/0x17c
> [=A0=A0 25.699846]=A0 __driver_attach from bus_for_each_dev+0x70/0xb0
> [=A0=A0 25.699856]=A0 bus_for_each_dev from bus_add_driver+0x164/0x1f0
> [=A0=A0 25.699867]=A0 bus_add_driver from driver_register+0x88/0x11c
> [=A0=A0 25.699878]=A0 driver_register from do_one_initcall+0x40/0x1d4
> [=A0=A0 25.699890]=A0 do_one_initcall from do_init_module+0x44/0x1d4
> [=A0=A0 25.699901]=A0 do_init_module from sys_finit_module+0xbc/0xf8
> [=A0=A0 25.699909]=A0 sys_finit_module from __sys_trace_return+0x0/0x10
> [=A0=A0 25.699918] Exception stack(0xf568dfa8 to 0xf568dff0)
> [=A0=A0 25.699926] dfa0:=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 6a09f700 00000000 00000016 b6dee8e0
> 00000000 b6def3f4
> [=A0=A0 25.699934] dfc0: 6a09f700 00000000 00000000 0000017b 0053b9a8 005=
2a1dc
> 0053af10 00000000
> [=A0=A0 25.699940] dfe0: be8e5160 be8e5150 b6de59d8 b6ed5ae0
> [=A0=A0 25.699944] ---[ end trace 0000000000000000 ]---
>=20
> I was able to bisect the warning to the following commit:
>=20
> drm/vc4: hdmi: Move HDMI reset to pm_resume
>=20
> The BCM2835-37 found in the RaspberryPi 0 to 3 have a power domain
> attached to the HDMI block, handled in Linux through runtime_pm.
>=20
> That power domain is shared with the VEC block, so even if we put our
> runtime_pm reference in the HDMI driver it would keep being on. If the
> VEC is disabled though, the power domain would be disabled and we would
> lose any initialization done in our bind implementation.
>=20
> That initialization involves calling the reset function and initializing
> the CEC registers.
>=20
> Let's move the initialization to our runtime_resume implementation so
> that we initialize everything properly if we ever need to.
>=20
> Fixes: c86b41214362 ("drm/vc4: hdmi: Move the HSM clock enable to
> runtime_pm")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Link: https://lore.kernel.org/r/20220613144800.326124-24-maxime@cerno.tech
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Yeah, I noticed it yesterday

https://lore.kernel.org/dri-devel/20220629123510.1915022-1-maxime@cerno.tec=
h/T/#m1027cef33d8c66a302b2b8a80bab8a9dc6652f04

and

https://lore.kernel.org/dri-devel/20220629123510.1915022-1-maxime@cerno.tec=
h/T/#mc869819c66f7b3df8b31a320636a9172780a58e7

Should address it

Maxime

--7b7pervf5vzxvbra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYr1SzgAKCRDj7w1vZxhR
xYnMAPwLHpAWOF+snfe2HPdBVsnphfzr7ZQRScAMDQcG7Ng9WAEAyatIo2PFwaXM
v/3RnW/epVDooSutAazDqOzlX/f36Ak=
=4QiW
-----END PGP SIGNATURE-----

--7b7pervf5vzxvbra--
