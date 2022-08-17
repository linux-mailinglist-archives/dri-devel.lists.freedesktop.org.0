Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993AC596A10
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 09:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5658D10E8BC;
	Wed, 17 Aug 2022 07:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A0810E69E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 07:10:56 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id D6AC632009E5;
 Wed, 17 Aug 2022 03:10:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 17 Aug 2022 03:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1660720253; x=1660806653; bh=laRdnBlp/A
 KdzXhxZ6ikA/I/fj0TfNOX8Qq0MpgtGA4=; b=mkHrcLQv9kwRzaSTMeCrq3a2gc
 zwRnZ+BzFe2ZJejAQp7kgTim0+5rfwdVNfBdcYPa382/hUGAn0Hi+Cj/MFgWrCg7
 zp7oLvMI0yX/1rHQdaZijL+p7cDQ5eXXpyACwlz5jVsJyg/wiBxX8JeX3AjuTxiL
 elLXQBZKDjwsEMYJyU2gr5/XM1/FEodcUV4LW6vam9HziLNNjpBmNsYNjyYCUOZE
 Efh3FkzkO0nBGuiim3sNxIe5FJ/Qo/suO/vBWFfwcuqmGppIing3wOn/KK98w1bv
 3PyVxapBYzLCclLA6Wx+3velUavLK/QBu4Xhjc+0i4xNrdgLcUWO3fwJYVgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1660720253; x=1660806653; bh=laRdnBlp/AKdzXhxZ6ikA/I/fj0T
 fNOX8Qq0MpgtGA4=; b=REGd6+Nh+vADaA77lZaf1ehl8LPCoUZ94b+VXb5aFyOg
 8BoL+5Fg0qeqOeHZuOcv6t0ZOupkyh4+0uUU9kUbsFYn7W6i10gQmCtOYLVD7M3o
 03gB1ltTI/0IoMparfxNOEA5XnqB49VOTCsfxHDlywOLciuDR3SYBtEGsHi7+gBJ
 QO55+NFyH3kOoH8Agdas6P0XTRL6kctcVg+UD4cIIOlIkgPMBWZO3OVqSNM+Uclj
 Z0PhcZ/rsT0N4O2RUSu3OOOqbR2tKkmsrNNlGc1C66KQ3euGRlS2Nugr7Y4LQ/H7
 /8YD9nnBPmS2N+DNG9yrRrql7qAVwXR8MBdrVa8u2Q==
X-ME-Sender: <xms:fJT8YsunaTRk4PVQUaYfxHWfxr_ltZZh8bMlHXGNws9lVtptOJOdTA>
 <xme:fJT8Ypfv1j6oM92DRjlpoQlpYb0IlL4iaxR8jkOQyjQ6wJ302sSgO92AqfsmmXA85
 A4mXF9Ih2on5If6VW8>
X-ME-Received: <xmr:fJT8YnwFWqVGX5ZEaj0rWWdvrvNTnT46X2UTztsVCCwytXoEd4VYgb9tBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehhedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnheptdelkeejiedufedvhfeiffetlefhiedvleeigfeiuefghfdvleeiffej
 ieegteejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
 tghh
X-ME-Proxy: <xmx:fJT8YvMpdSMhrP0nHzpvuWGNiSSI60AT9XrlUOlJd8jPda4dBbq5NA>
 <xmx:fJT8Ys_y2v4uctcwKCCF0MGnn67HhMseMwJtXvqlSV3Mwmts2GA2hw>
 <xmx:fJT8YnX4GRPyTjVAYp3N8VHN6gwM2R4QV7jWpCZrxBdx3Wbjg440LA>
 <xmx:fZT8YpONR8VrSPSNxff-555AVHGxHHP5Nafx0XPheEFevfFUt9RocA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Aug 2022 03:10:52 -0400 (EDT)
Date: Wed, 17 Aug 2022 09:10:48 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Subject: Re: drm warning with mainline due to 467e30171b5b ("drm/vc4: hdmi:
 Move HDMI reset to pm_resume")
Message-ID: <20220817071048.4v66zky5qysn45wq@houat>
References: <YvvHK2zb1lbm2baU@debian>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="syrev3cbrffj2yu7"
Content-Disposition: inline
In-Reply-To: <YvvHK2zb1lbm2baU@debian>
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
Cc: Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--syrev3cbrffj2yu7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 16, 2022 at 05:34:51PM +0100, Sudip Mukherjee (Codethink) wrote:
> Not sure if it has been reported but the mainline kernel shows a drm warn=
ing
> on RPI4B.
>=20
> [   14.821276] WARNING: CPU: 3 PID: 187 at drivers/gpu/drm/vc4/vc4_hdmi_r=
egs.h:487 vc5_hdmi_reset+0x1f8/0x240 [vc4]
> [   14.837288] Modules linked in: hci_uart btqca btrtl btbcm btintel btsd=
io(+) bluetooth bcm2835_v4l2(C) bcm2835_mmal_vchiq(C) videobuf2_vmalloc vid=
eobuf2_memops videobuf2_v4l2 videobuf2_common brcmfmac videodev brcmutil vc=
4(+) ecdh_generic ecc drm_display_helper mc raspberrypi_hwmon cec crct10dif=
_ce drm_cma_helper cfg80211 dwc2 udc_core i2c_brcmstb roles snd_bcm2835(C) =
drm_kms_helper pwm_bcm2835 drm xhci_pci xhci_pci_renesas snd_soc_core phy_g=
eneric ac97_bus snd_pcm_dmaengine snd_pcm snd_timer snd fb_sys_fops syscopy=
area sysfillrect sysimgblt uio_pdrv_genirq uio aes_neon_bs aes_neon_blk
> [   14.889917] CPU: 3 PID: 187 Comm: systemd-udevd Tainted: G         C  =
       6.0.0-rc1-568035b01cfb #1
> [   14.899355] Hardware name: Raspberry Pi 4 Model B (DT)
> [   14.904561] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [   14.911620] pc : vc5_hdmi_reset+0x1f8/0x240 [vc4]
> [   14.916433] lr : vc5_hdmi_reset+0x38/0x240 [vc4]
> [   14.921151] sp : ffff80000a85b640
> [   14.923079] uart-pl011 fe201000.serial: no DMA platform data
> [   14.924504] x29: ffff80000a85b640 x28: 0000000000000000 x27: ffff00005=
6626080
> [   14.937472] x26: ffff80000128e2d8 x25: ffff80000128e988 x24: 000000000=
0000000
> [   14.944708] x23: ffff000040a58000 x22: ffff0000fb832978 x21: ffff00005=
6626c90
> [   14.951944] x20: 0000000000000000 x19: ffff000056626080 x18: 000000000=
0000014
> [   14.959180] x17: 00000000e6b317d8 x16: 00000000c03e2fab x15: 000000000=
02ffc4a
> [   14.966416] x14: 0000000000000000 x13: 0000000000000010 x12: 010101010=
1010101
> [   14.973650] x11: ff7f7f7f7f7f7f7f x10: ffff840003584d5b x9 : ffff80000=
1276518
> [   14.980886] x8 : 0101010101010101 x7 : 0000000000000000 x6 : ffff00004=
0e5d140
> [   14.988120] x5 : 0000000000000000 x4 : ffff80000a85b580 x3 : 000000000=
0000000
> [   14.995355] x2 : 0000000000000001 x1 : 0000000000000002 x0 : ffff80000=
12901c0
> [   15.002591] Call trace:
> [   15.005063]  vc5_hdmi_reset+0x1f8/0x240 [vc4]
> [   15.009514]  vc4_hdmi_runtime_resume+0x74/0x2dc [vc4]
> [   15.014671]  vc4_hdmi_bind+0x22c/0xa40 [vc4]
> [   15.019038]  component_bind_all+0x114/0x264
> [   15.023293]  vc4_drm_bind+0x160/0x2a4 [vc4]
> [   15.027565]  try_to_bring_up_aggregate_device+0x1e4/0x2d0
> [   15.033044]  component_master_add_with_match+0xcc/0x110
> [   15.038340]  vc4_platform_drm_probe+0xc4/0xfc [vc4]
> [   15.043327]  platform_probe+0x74/0xd0
> [   15.047037]  really_probe+0xc8/0x3ec
> [   15.050662]  __driver_probe_device+0x84/0x190
> [   15.055079]  driver_probe_device+0x44/0x100
> [   15.059318]  __driver_attach+0xd8/0x1d0
> [   15.063206]  bus_for_each_dev+0x7c/0xe0
> [   15.067090]  driver_attach+0x30/0x3c
> [   15.070711]  bus_add_driver+0x188/0x244
> [   15.074595]  driver_register+0x84/0x140
> [   15.078482]  __platform_driver_register+0x34/0x40
> [   15.083247]  vc4_drm_register+0x5c/0x1000 [vc4]
> [   15.087881]  do_one_initcall+0x50/0x2bc
> [   15.091770]  do_init_module+0x50/0x1f0
> [   15.095569]  load_module+0x1a28/0x1fa0
> [   15.099366]  __do_sys_finit_module+0xac/0x12c
> [   15.103779]  __arm64_sys_finit_module+0x2c/0x40
> [   15.108368]  invoke_syscall+0x50/0x120
> [   15.112166]  el0_svc_common.constprop.0+0x6c/0x1b4
> [   15.117021]  do_el0_svc+0x38/0xcc
> [   15.120378]  el0_svc+0x30/0xd0
> [   15.123472]  el0t_64_sync_handler+0x11c/0x150
> [   15.127886]  el0t_64_sync+0x1a0/0x1a4
> [   15.131595] ---[ end trace 0000000000000000 ]---
>=20
> git bisect pointed to 467e30171b5b ("drm/vc4: hdmi: Move HDMI reset to pm=
_resume")
> and reverting this commit has fixed the warning.
>=20
> I will be happy to test any patch or provide any extra log if needed.

We have fixes for this in drm-misc-next that have missed the cut for the
merge window:

https://lore.kernel.org/all/20220629123510.1915022-38-maxime@cerno.tech/
https://lore.kernel.org/all/20220629123510.1915022-39-maxime@cerno.tech/

If it fixes it for you, I'll apply it to drm-misc-fixes

Maxime

--syrev3cbrffj2yu7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYvyUeAAKCRDj7w1vZxhR
xVljAPwIUirFXxRRs/16RZ5KPNnH+unroKvCpl+RZ0WfiZW4PwEAssoQDV4JHtEX
j6GdyVRYCPay+w7bVerJiu88EbUGIQY=
=EjE/
-----END PGP SIGNATURE-----

--syrev3cbrffj2yu7--
