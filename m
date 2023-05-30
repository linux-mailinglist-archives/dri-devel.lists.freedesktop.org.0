Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC39B715376
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 04:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F3710E0F8;
	Tue, 30 May 2023 02:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 757 seconds by postgrey-1.36 at gabe;
 Tue, 30 May 2023 02:10:42 UTC
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E52710E317;
 Tue, 30 May 2023 02:10:42 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QVbTX0LcVz4x3g;
 Tue, 30 May 2023 12:10:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1685412640;
 bh=wDYppAoDJWMdt7tdGl5WSBq+MGJG+/ZQyPPcIBRD7Y0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ukOe2dCr+kWkOAVuA0TKoGo9HBDaSysy+fC+C7d8ZoMJMDVKNn7PMDY/mSFQCuIMj
 C54KQ1jN6lWRw4+8qzx8vPCj8alLiYiSdClFCYChy7dDI/tT4Gy/EYokyX5rDJGaVZ
 Q20fpe/dorOhRGsr4zlxjQ9w/ZnaDPXcPmk+8+SJzcXcTfQWq/8KVkD4bWUxh6npT7
 q61JlS9pZrEn4DBjLYuHDOMFcuC2iXPfcfkxGc49mImVoBCcsMpbZCHiy1Otm6+boU
 tEyExQF9STfGohFjMoIbspT+/8I7Y8LmvYAeMxDPkQwVCda+g8Rj/QOBKM2g1zyOzh
 iKzRKqhAdwVyQ==
Date: Tue, 30 May 2023 12:10:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: manual merge of the drm-intel tree with the drm tree
Message-ID: <20230530121039.6a2037c9@canb.auug.org.au>
In-Reply-To: <20230530115752.14f0f1b5@canb.auug.org.au>
References: <20230530115752.14f0f1b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5vtcpJN63QOoP2wlS0l_0Zw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Fei Yang <fei.yang@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/5vtcpJN63QOoP2wlS0l_0Zw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 30 May 2023 11:57:52 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> @@@ -920,33 -587,8 +640,9 @@@ static const struct intel_device_info j
>   #define GEN12_FEATURES \
>   	GEN11_FEATURES, \
>   	GEN(12), \
> - 	.display.abox_mask =3D GENMASK(2, 1), \
> - 	.__runtime.pipe_mask =3D BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C) | BIT=
(PIPE_D), \
> - 	.__runtime.cpu_transcoder_mask =3D BIT(TRANSCODER_A) | BIT(TRANSCODER_=
B) | \
> - 		BIT(TRANSCODER_C) | BIT(TRANSCODER_D) | \
> - 		BIT(TRANSCODER_DSI_0) | BIT(TRANSCODER_DSI_1), \
> - 	.display.pipe_offsets =3D { \
> - 		[TRANSCODER_A] =3D PIPE_A_OFFSET, \
> - 		[TRANSCODER_B] =3D PIPE_B_OFFSET, \
> - 		[TRANSCODER_C] =3D PIPE_C_OFFSET, \
> - 		[TRANSCODER_D] =3D PIPE_D_OFFSET, \
> - 		[TRANSCODER_DSI_0] =3D PIPE_DSI0_OFFSET, \
> - 		[TRANSCODER_DSI_1] =3D PIPE_DSI1_OFFSET, \
> - 	}, \
> - 	.display.trans_offsets =3D { \
> - 		[TRANSCODER_A] =3D TRANSCODER_A_OFFSET, \
> - 		[TRANSCODER_B] =3D TRANSCODER_B_OFFSET, \
> - 		[TRANSCODER_C] =3D TRANSCODER_C_OFFSET, \
> - 		[TRANSCODER_D] =3D TRANSCODER_D_OFFSET, \
> - 		[TRANSCODER_DSI_0] =3D TRANSCODER_DSI0_OFFSET, \
> - 		[TRANSCODER_DSI_1] =3D TRANSCODER_DSI1_OFFSET, \
> - 	}, \
> - 	TGL_CURSOR_OFFSETS, \
> - 	TGL_CACHELEVEL, \
> ++	.max_pat_index =3D 3 \

I fixed the above up to have a ',' after the '3'

>   	.has_global_mocs =3D 1, \
> - 	.has_pxp =3D 1, \
> - 	.display.has_dsb =3D 1, \
> - 	.max_pat_index =3D 3
> + 	.has_pxp =3D 1
--=20
Cheers,
Stephen Rothwell

--Sig_/5vtcpJN63QOoP2wlS0l_0Zw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmR1Wx8ACgkQAVBC80lX
0Gw+SAf+Ilv/tNfr1MSGBJMxlVyniZfQkGznYVHPJJ/VECE06jL+2+aotBU6Ygt2
sgw7fI3865uFbcMzirfj7ny2wMSQQ4grVrWeBVTlbdtqgRqJtWoH5te5DrNNEdM6
7JdWLaWGZmI6au/Nl6tZ5Plcui8jHTe+DDGNKL+I5fhmGKtLZE+MXn7V5aV8o44Q
47B7wYS+xHqPDZ746/UyG4gCBJJ3h+Fzt6wGZp3mEE5Jh+gTWLhCavA04kcntxpv
FFv3PzrbLq+DDIQ+AUmcjeGXNDb+KYwW/er1pqrLkqARuGiLb1X5s4Ak39xm6XQc
HkNDUSJzgMpfARd8GBMIHwTVPsh1Bw==
=Ghjg
-----END PGP SIGNATURE-----

--Sig_/5vtcpJN63QOoP2wlS0l_0Zw--
