Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D29303819
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:38:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDA26E446;
	Tue, 26 Jan 2021 08:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78A66E059
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 10:54:31 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 89272C76;
 Mon, 25 Jan 2021 05:54:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 25 Jan 2021 05:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=gayO51oZ0JEZfgE6MWOp9bNvumQ
 WWVVfPP1l7LszqDQ=; b=TEOu56imJuLyGGGUZDs6AkB6rJB8flECC6uI0sGW9Jn
 Hduyh76B9LV+JxK8TsSeBEnYaos4WCikw+D42wDIbfhuybiO39R1ePeQPR6AzePP
 44FB01c2kHPiBxHB9sk8zDqC5hs84oeK2UiscC/TRSQTnZ2nzFt+sUxMQzYrbTU0
 T6TdQEoNGQx4HI6fntRgH8uPbnGazbEflr4N41Zqetulnh6BOcwOqSak+SeuEloq
 g36b1vaJSgQI+xvEPzFPvbtoj38/ceC+DjlHl0c8WBJZK+LFnViKbKLSqdF7s8BO
 Ek3oZ0YJtZzfZmmfmxlVD/3PmF5tXKv+XMx87gi9iTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=gayO51
 oZ0JEZfgE6MWOp9bNvumQWWVVfPP1l7LszqDQ=; b=ATMKBI7ikfTkneGW+RPwuM
 XGtQFnKxw8QkK5wuY+zMKOV58U+SP1SNQ8tcM9gVUkjYA0nkv1lzWroXUvcTvRYe
 GNKpA50QpBM80m3AynR384aqoVDxXuluHFFCEpBn2R2uo1YfLyGsH/liqGh4u3Uq
 ZEQoT/dqfVP97u2F3IMQpeuYv3PtOqNWuF1JHWYfw0uxt1wanyleyW07s4YUTh6I
 MhL59jytCzg/D114u5blZ2p7pn3fFhTOYeSPmGlT1t8hDiGYzLwJ0FUbdr2vJ2KR
 iK8QwOyplGH2W3lx6oO8MXDy7vjxkEcWe/qFHuP/e+4LYbM3RqTcJOAJqwC0YZFQ
 ==
X-ME-Sender: <xms:Y6MOYLv1nPxRxMLTUitlL6APXIu9179MnKOpTLJrNiDb3Ib8jQRu6g>
 <xme:Y6MOYMe-9I3r4XByr3WfiaHyCS4GXDdxls824rcLcZG6-yOodzJcGE8GXHEWi2mSH
 Mw2fKu22r07jl1nsew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Y6MOYOxccL1atg85n_agpPp6cUP25yUBC_9E1OIxYMr4zEujziYfWg>
 <xmx:Y6MOYKMExzJnA0Ag4sT4u0o1O6QP4a9aVS-ZxNLd_LaPfMiQwJRvuw>
 <xmx:Y6MOYL8vb0kfY7zigHM4AknbjtgDAnQR8ivgxzrJk2cAxnmxJXEYeQ>
 <xmx:ZKMOYNLVYsonvAtvAMLCcjchQbSpZinoZbWnzMXGCxvD-v3Do-cELA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 42EBE1080066;
 Mon, 25 Jan 2021 05:54:27 -0500 (EST)
Date: Mon, 25 Jan 2021 11:54:25 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>
Subject: Re: [PATCH 2/2] drm/vc4: Correct POS1_SCL for hvs5
Message-ID: <20210125105425.zbilbppezpoul6jq@gilmour>
References: <20210121105759.1262699-1-maxime@cerno.tech>
 <20210121105759.1262699-2-maxime@cerno.tech>
 <20210123080548.GA5452@xanadu.blop.info>
 <20210123.201403.374176830259256363.ryutaroh@ict.e.titech.ac.jp>
MIME-Version: 1.0
In-Reply-To: <20210123.201403.374176830259256363.ryutaroh@ict.e.titech.ac.jp>
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
Cc: popcornmix@gmail.com, lucas@debian.org, dri-devel@lists.freedesktop.org,
 dave.stevenson@raspberrypi.com
Content-Type: multipart/mixed; boundary="===============0493948065=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0493948065==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pu7ua3ibubl5pghq"
Content-Disposition: inline


--pu7ua3ibubl5pghq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 23, 2021 at 08:14:03PM +0900, Ryutaroh Matsumoto wrote:
> From: Lucas Nussbaum <lucas@debian.org>
> Subject: Re: [PATCH 2/2] drm/vc4: Correct POS1_SCL for hvs5
> Date: Sat, 23 Jan 2021 09:05:48 +0100
>=20
> > On 21/01/21 at 11:57 +0100, Maxime Ripard wrote:
> >> From: Dom Cobley <popcornmix@gmail.com>
> >>=20
> >> Fixes failure with 4096x1080 resolutions
> >>=20
> >> [  284.315379] WARNING: CPU: 1 PID: 901 at drivers/gpu/drm/vc4/vc4_pla=
ne.c:981 vc4_plane_mode_set+0x1374/0x13c4
> >> [  284.315385] Modules linked in: ir_rc5_decoder rpivid_hevc(C) bcm283=
5_codec(C) bcm2835_isp(C) bcm2835_mmal_vchiq(C) bcm2835_gpiomem v4l2_mem2me=
m videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common vid=
eodev mc cdc_acm xpad ir_rc6_decoder rc_rc6_mce gpio_ir_recv fuse
> >> [  284.315509] CPU: 1 PID: 901 Comm: kodi.bin Tainted: G         C    =
    5.10.7 #1
> >> [  284.315514] Hardware name: BCM2711
> >> [  284.315518] Backtrace:
> >> [  284.315533] [<c0cc5ca0>] (dump_backtrace) from [<c0cc6014>] (show_s=
tack+0x20/0x24)
> >> [  284.315540]  r7:ffffffff r6:00000000 r5:68000013 r4:c18ecf1c
> >> [  284.315549] [<c0cc5ff4>] (show_stack) from [<c0cca638>] (dump_stack=
+0xc4/0xf0)
> >> [  284.315558] [<c0cca574>] (dump_stack) from [<c022314c>] (__warn+0xf=
c/0x158)
> >> [  284.315564]  r9:00000000 r8:00000009 r7:000003d5 r6:00000009 r5:c08=
cc7dc r4:c0fd09b8
> >> [  284.315572] [<c0223050>] (__warn) from [<c0cc67ec>] (warn_slowpath_=
fmt+0x74/0xe4)
> >> [  284.315577]  r7:c08cc7dc r6:000003d5 r5:c0fd09b8 r4:00000000
> >> [  284.315584] [<c0cc677c>] (warn_slowpath_fmt) from [<c08cc7dc>] (vc4=
_plane_mode_set+0x1374/0x13c4)
> >> [  284.315589]  r8:00000000 r7:00000000 r6:00001000 r5:c404c600 r4:c2e=
34600
> >> [  284.315596] [<c08cb468>] (vc4_plane_mode_set) from [<c08cc984>] (vc=
4_plane_atomic_check+0x40/0x1c0)
> >> [  284.315601]  r10:00000001 r9:c2e34600 r8:c0e67068 r7:c0fc44e0 r6:c2=
ce3640 r5:c3d636c0
> >> [  284.315605]  r4:c2e34600
> >> [  284.315614] [<c08cc944>] (vc4_plane_atomic_check) from [<c0860504>]=
 (drm_atomic_helper_check_planes+0xec/0x1ec)
> >> [  284.315620]  r9:c2e34600 r8:c0e67068 r7:c0fc44e0 r6:c2ce3640 r5:c3d=
636c0 r4:00000006
> >> [  284.315627] [<c0860418>] (drm_atomic_helper_check_planes) from [<c0=
860658>] (drm_atomic_helper_check+0x54/0x9c)
> >> [  284.315633]  r9:c2e35400 r8:00000006 r7:00000000 r6:c2ba7800 r5:c3d=
636c0 r4:00000000
> >> [  284.315641] [<c0860604>] (drm_atomic_helper_check) from [<c08b7ca8>=
] (vc4_atomic_check+0x25c/0x454)
> >> [  284.315645]  r7:00000000 r6:c2ba7800 r5:00000001 r4:c3d636c0
> >> [  284.315652] [<c08b7a4c>] (vc4_atomic_check) from [<c0881278>] (drm_=
atomic_check_only+0x5cc/0x7e0)
> >> [  284.315658]  r10:c404c6c8 r9:ffffffff r8:c472c480 r7:00000003 r6:c3=
d636c0 r5:00000000
> >> [  284.315662]  r4:0000003c r3:c08b7a4c
> >> [  284.315670] [<c0880cac>] (drm_atomic_check_only) from [<c089ba60>] =
(drm_mode_atomic_ioctl+0x758/0xa7c)
> >> [  284.315675]  r10:c3d46000 r9:c3d636c0 r8:c2ce8a70 r7:027e3a54 r6:00=
000043 r5:c1fbb800
> >> [  284.315679]  r4:0281a858
> >> [  284.315688] [<c089b308>] (drm_mode_atomic_ioctl) from [<c086e9f8>] =
(drm_ioctl_kernel+0xc4/0x108)
> >> [  284.315693]  r10:c03864bc r9:c1fbb800 r8:c3d47e64 r7:c089b308 r6:00=
000002 r5:c2ba7800
> >> [  284.315697]  r4:00000000
> >> [  284.315705] [<c086e934>] (drm_ioctl_kernel) from [<c086ee28>] (drm_=
ioctl+0x1e8/0x3a0)
> >> [  284.315711]  r9:c1fbb800 r8:000000bc r7:c3d47e64 r6:00000038 r5:c0e=
59570 r4:00000038
> >> [  284.315719] [<c086ec40>] (drm_ioctl) from [<c041f354>] (sys_ioctl+0=
x35c/0x914)
> >> [  284.315724]  r10:c2d08200 r9:00000000 r8:c36fa300 r7:befdd870 r6:c0=
3864bc r5:c36fa301
> >> [  284.315728]  r4:c03864bc
> >> [  284.315735] [<c041eff8>] (sys_ioctl) from [<c0200040>] (ret_fast_sy=
scall+0x0/0x28)
> >> [  284.315739] Exception stack(0xc3d47fa8 to 0xc3d47ff0)
> >> [  284.315745] 7fa0:                   027eb750 befdd870 00000000 c038=
64bc befdd870 00000000
> >> [  284.315750] 7fc0: 027eb750 befdd870 c03864bc 00000036 027e3948 0281=
a640 0281a850 027e3a50
> >> [  284.315756] 7fe0: b4b64100 befdd844 b4b5ba2c b49c994c
> >> [  284.315762]  r10:00000036 r9:c3d46000 r8:c0200204 r7:00000036 r6:c0=
3864bc r5:befdd870
> >> [  284.315765]  r4:027eb750
> >>=20
> >> Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
> >> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> >> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >=20
> > Tested-By: Lucas Nussbaum <lucas@debian.org>
>=20
> Tested-By: Ryutaroh Matsumoto <ryutaroh@ict.e.titech.ac.jp>

Applied both patches, thanks for testing!
Maxime

--pu7ua3ibubl5pghq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYA6jYQAKCRDj7w1vZxhR
xQTfAP9QHCZXJhhbMj8UfEdnWYnnBlsRP1S2JObZ+hB2BFMbdgD/RZumxcGaPcyr
HMjrl7nPMXbzxM7C5JBth+/sGvBcIwQ=
=PHYb
-----END PGP SIGNATURE-----

--pu7ua3ibubl5pghq--

--===============0493948065==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0493948065==--
