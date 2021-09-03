Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441AB4002D7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 18:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E796E8AD;
	Fri,  3 Sep 2021 16:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13D06E8AD
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 16:03:09 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 57E9E5C00D8;
 Fri,  3 Sep 2021 12:03:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 03 Sep 2021 12:03:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=x1XK3nrTU4s0AlFyDsfZV2PoPG6
 CXbBuAM6YxlQ2lnI=; b=T+rHOjv6Uk830jK+tqOhhRnJ2RC+8+RoON8mOijgsb+
 y6VcHOrPMOJ6sKZFyTZNIMIAgYyis91ofqFDvBNnFWrxsw9okRvCSrccg4MQN8UC
 pK4dB8brUPhg55UkEkCcLRUwO9yoM8vvax1OQHjK2JRyHY7Q8UOAoikukF8oL6Hk
 b6XtDT191ri78R+iRehvfcx8zXLN6WCF/0578QMlDYLS6xu7rNeXW5llNWp47UdN
 GWVDRl+Zo8CNhh9azd6pGWL1Drum0PF+TOh4u8WqYUfrU0He9I18wlWmahDM3POo
 Rj3g2qQXy3OJ/Q0UxhWsrQXHbuQeS+JMNyq2BvnJg3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=x1XK3n
 rTU4s0AlFyDsfZV2PoPG6CXbBuAM6YxlQ2lnI=; b=DvachqbECgwGKntHBRi6Ce
 q3TfshDeWWzjzcyDvJnKwwech4K7RzJrfoDRRCfw5b+/yImoz7NaAgK1FuA7Gz9D
 01tOy580EGzrT16KlG8vbXJEdL0b7m47b4uYkd+fZULzAJoHmHRWDv9lnyRGSA9k
 PGam/NO3NpPxGCOo5abuKlqibI9rDmhgVohdZJ0vREeh8IzY3IGt8OaAGe0/fHAg
 tNMVGolkGqLxCZY04RJvrogdEkcvtf5yxZgENlDaaUamxW8YKWN5EiYiD+p4iqQi
 15GWtmdhugB+mTTP6qg7+XUSFIJrWQm0dppS9gBru75oDZwfdK25vPO8VxABfhIw
 ==
X-ME-Sender: <xms:OEcyYcSbkEGDt1y1-s2cA4aC2_KCiTsMosdPP5Q_RdHSMJ6XS4eDUg>
 <xme:OEcyYZyGKq-RjkUVHIi55QKdAoXB7nkY9WtAEP0N1lF-VZHwE3ORa6vUPJyO5k1dc
 28SfxKwvqxZGuAW9D8>
X-ME-Received: <xmr:OEcyYZ3QOyGEJCvttp22bwBszcfupZiHbqk56BCguuuCSfFq6Ixz7Cu97Xx2JmCfSPJI22OmZgrYYymIq5wuVFk20J096qxA1hY_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfduueetjeefhfettddtudejgeduledtudeuvefhfeetgfeludffueehffeh
 uddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptghouggvthhhihhnkhdrtghord
 hukhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OUcyYQBNhJ8FJ_VRsw8f9qSd-iZxCnl-Re_I-X7qf2R2IfpXHv6Kvw>
 <xmx:OUcyYViNxgBIkR6MHRoMHdC9957cPzob-jvP-sojnH-btIdVOGYaJQ>
 <xmx:OUcyYcrajdVk3PMVViI0VQpx8-6cRafKR8gUGaD44KBNa--L2ZL6WA>
 <xmx:O0cyYQV6LIe48dsOEO_eVhgJMzLjtDQBIqnKLu53kH8J6LCqzERmpw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Sep 2021 12:03:04 -0400 (EDT)
Date: Fri, 3 Sep 2021 18:03:02 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Regression with mainline kernel on rpi4
Message-ID: <20210903160302.yh42vpkuob45dbpb@gilmour>
References: <CADVatmPB9-oKd=ypvj25UYysVo6EZhQ6bCM7EvztQBMyiZfAyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kkqdgvaybrcxjbmu"
Content-Disposition: inline
In-Reply-To: <CADVatmPB9-oKd=ypvj25UYysVo6EZhQ6bCM7EvztQBMyiZfAyw@mail.gmail.com>
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


--kkqdgvaybrcxjbmu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sudip,

On Thu, Sep 02, 2021 at 10:08:19AM +0100, Sudip Mukherjee wrote:
> Hi All,
>=20
> Our last night's test on rpi4 had a nasty trace. The test was with
> 7c636d4d20f8 ("Merge tag 'dt-5.15' of
> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc"). Previous test
> was on 9e9fb7655ed5 ("Merge tag 'net-next-5.15' of
> git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next") and it
> did not have this trace.
>=20
> [   40.975161] Unable to handle kernel access to user memory outside
> uaccess routines at virtual address 0000000000000348
> [   40.986187] Mem abort info:
> [   40.989062]   ESR =3D 0x96000004
> [   40.992233]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [   40.997699]   SET =3D 0, FnV =3D 0
> [   41.001205]   EA =3D 0, S1PTW =3D 0
> [   41.004428]   FSC =3D 0x04: level 0 translation fault
> [   41.009468] Data abort info:
> [   41.012410]   ISV =3D 0, ISS =3D 0x00000004
> [   41.016325]   CM =3D 0, WnR =3D 0
> [   41.019358] user pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000042ae1000
> [   41.025926] [0000000000000348] pgd=3D0000000000000000, p4d=3D000000000=
0000000
> [   41.032845] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [   41.038495] Modules linked in: overlay algif_hash algif_skcipher
> af_alg bnep sch_fq_codel ppdev lp parport ip_tables x_tables autofs4
> btrfs blake2b_generic zstd_compress raid10 raid456 async_raid6_recov
> async_memcpy async_pq async_xor async_tx xor xor_neon raid6_pq
> libcrc32c raid1 raid0 multipath linear uas usb_storage
> snd_soc_hdmi_codec btsdio brcmfmac brcmutil hci_uart btqca btrtl
> bcm2835_v4l2(C) btbcm crct10dif_ce bcm2835_mmal_vchiq(C) btintel
> raspberrypi_hwmon videobuf2_vmalloc videobuf2_memops bluetooth
> videobuf2_v4l2 videobuf2_common cfg80211 ecdh_generic ecc vc4
> drm_kms_helper videodev dwc2 cec snd_bcm2835(C) i2c_brcmstb udc_core
> roles drm xhci_pci mc pwm_bcm2835 xhci_pci_renesas snd_soc_core
> ac97_bus snd_pcm_dmaengine snd_pcm phy_generic snd_timer
> uio_pdrv_genirq snd fb_sys_fops syscopyarea sysfillrect sysimgblt uio
> aes_neon_bs aes_neon_blk crypto_simd cryptd
> [   41.116584] CPU: 0 PID: 1569 Comm: pulseaudio Tainted: G         C
>       5.14.0-7c636d4d20f8 #1
> [   41.125494] Hardware name: Raspberry Pi 4 Model B (DT)
> [   41.130699] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [   41.137756] pc : vc4_hdmi_audio_prepare+0x3c0/0xba4 [vc4]
> [   41.143256] lr : vc4_hdmi_audio_prepare+0x308/0xba4 [vc4]
> [   41.148747] sp : ffff800012f73a50
> [   41.152099] x29: ffff800012f73a50 x28: ffff0000562ecc00 x27: 000000000=
0000000
> [   41.159338] x26: 0000000000000000 x25: 000000000000ac44 x24: 000000002=
1002003
> [   41.166574] x23: ffff800012f73b40 x22: 0000000000000003 x21: ffff00005=
9400080
> [   41.173811] x20: ffff0000594004c8 x19: 0005833333380600 x18: 000000000=
0000000
> [   41.181047] x17: 0000000000000000 x16: 0000000000000000 x15: 000000000=
0000000
> [   41.188283] x14: 0000000000000000 x13: 0000000000000000 x12: 000000000=
0000991
> [   41.195520] x11: 0000000000000001 x10: 000000000001d4c0 x9 : ffff80000=
9047838
> [   41.202757] x8 : 0000000000000031 x7 : 000000000001d4c0 x6 : 000000000=
0000030
> [   41.209993] x5 : ffff800012f73a98 x4 : ffff80000905bb60 x3 : 000000001=
0624dd3
> [   41.217230] x2 : 00000000000003e8 x1 : 0000000000000000 x0 : 000000000=
0562200
> [   41.224466] Call trace:
> [   41.226939]  vc4_hdmi_audio_prepare+0x3c0/0xba4 [vc4]
> [   41.232080]  hdmi_codec_prepare+0xe8/0x1b0 [snd_soc_hdmi_codec]
> [   41.238083]  snd_soc_pcm_dai_prepare+0x5c/0x10c [snd_soc_core]
> [   41.244038]  soc_pcm_prepare+0x5c/0x130 [snd_soc_core]
> [   41.249276]  snd_pcm_prepare+0x150/0x1f0 [snd_pcm]
> [   41.254149]  snd_pcm_common_ioctl+0x1644/0x1d14 [snd_pcm]
> [   41.259635]  snd_pcm_ioctl+0x3c/0x5c [snd_pcm]
> [   41.264152]  __arm64_sys_ioctl+0xb4/0x100
> [   41.268216]  invoke_syscall+0x50/0x120
> [   41.272014]  el0_svc_common+0x18c/0x1a4
> [   41.275899]  do_el0_svc+0x34/0x9c
> [   41.279254]  el0_svc+0x2c/0xc0
> [   41.282348]  el0t_64_sync_handler+0xa4/0x12c
> [   41.286673]  el0t_64_sync+0x1a4/0x1a8
> [   41.290385] Code: 52807d02 72a20c43 f9400421 9ba37c13 (f941a423)
> [   41.296563] ---[ end trace dcfe08f10aaf6873 ]---
>=20
> You can see the complete dmesg at
> https://openqa.qa.codethink.co.uk/tests/76#step/dmesg/8

What test were you running?

Maxime

--kkqdgvaybrcxjbmu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYTJHNgAKCRDj7w1vZxhR
xYiYAQDwWZu+MEte1HtPkIn28qn8jbRmbQFakYf/ajp93NB0NAEAl/SajCAb+FDw
UpH2u+MnGw/LTVvwDbyYT050Ff/BMQo=
=mwzV
-----END PGP SIGNATURE-----

--kkqdgvaybrcxjbmu--
