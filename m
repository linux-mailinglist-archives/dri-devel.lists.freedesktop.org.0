Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91817A91A74
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 13:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E145D10E2B2;
	Thu, 17 Apr 2025 11:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HqsxTzDR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7840310EAD5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 11:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744888686;
 bh=pIx30SYmPcLMwjnOJCXjCtiSvSinRAlBsyynbG/px7I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HqsxTzDR/J9DfS2czs/FsVn3vHsQxvSZvFO/OO1Wb7UVrQluMPKWsFjEPsMfCSG24
 SYZIxGMxbatIxvPH0B3fcUx4TYq0qiG4Xnim+9BHnlGQg0fnAvcmz/a6E3+ocQzts4
 EK/ilN109yBxzxYZ77mXF908jSIjhud6Rlt42B5UQN3aTDnTdcCN1SJ5AVfrwud9zT
 BYerv8erU8M7NaROUrYZKNlznoiFIxLaaf2EBRnY125ge83HgTdN61M3w5npCmdN2A
 hl+9hXUAYoOmSLnpAyNUoyrVve5A4ZjR//WZfJD4eg3QnyHOUt3VIy4OOd6qmIghc2
 BvOut837N1FGQ==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 800EF17E0702;
 Thu, 17 Apr 2025 13:18:05 +0200 (CEST)
Date: Thu, 17 Apr 2025 14:17:42 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, rdunlap@infradead.org, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, Simona Vetter <simona@ffwll.ch>, Rodrigo
 Siqueira <siqueira@igalia.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH v18 1/8] drm/vkms: Document pixel_argb_u16
Message-ID: <20250417141742.13f5ef5b@eldfell>
In-Reply-To: <20250415-yuv-v18-1-f2918f71ec4b@bootlin.com>
References: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
 <20250415-yuv-v18-1-f2918f71ec4b@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nveQePa.E8Kg=XOOwz44OOU";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/nveQePa.E8Kg=XOOwz44OOU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Apr 2025 15:55:32 +0200
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> The meaning of each member of the structure was not specified. To clarify
> the format used and the reason behind those choices, add some
> documentation.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index a74a7fc3a056..3b7b46dd026f 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -45,6 +45,23 @@ struct vkms_frame_info {
>  	unsigned int rotation;
>  };
> =20
> +/**
> + * struct pixel_argb_u16 - Internal representation of a pixel color.
> + * @a: Alpha component value, stored in 16 bits, without padding, using
> + *     machine endianness
> + * @r: Red component value, stored in 16 bits, without padding, using
> + *     machine endianness
> + * @g: Green component value, stored in 16 bits, without padding, using
> + *     machine endianness
> + * @b: Blue component value, stored in 16 bits, without padding, using
> + *     machine endianness
> + *
> + * The goal of this structure is to keep enough precision to ensure
> + * correct composition results in VKMS and simplifying color
> + * manipulation by splitting each component into its own field.
> + * Caution: the byte ordering of this structure is machine-dependent,
> + * you can't cast it directly to AR48 or xR48.
> + */
>  struct pixel_argb_u16 {
>  	u16 a, r, g, b;
>  };
>=20

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>

(re-sent through a different address due issues on my side)


Thanks,
pq

--Sig_/nveQePa.E8Kg=XOOwz44OOU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmgA41YACgkQI1/ltBGq
qqcfxA/+OXLBuBSJvoooK+lerZpTOF2iJfnkCPol8TAjAV80M3WTeB5xpwR4tTTT
X9AfjBb1fGGLrZLjecePmWR0WASrPxs6uv7EKGKQM9rh46mBlYw5q4P4S+oKEqkm
IqStqCS7CPOmsXZ37l9eCnFXNOJLrkxRsus4R1oTpKYVPfV7Ieo3ZkTtVvo1+npY
gmntW4FMU6j8Y8V2fGdrKz25C6fKpHMJZOczJCGWHYlbPZdwW5JrV39bQ74Ek/1i
w45m8gKwHtDcg2mi/QfVVeNQl/PKWTCpPEcmJ/H3+K4Rhrp5uRfQsIXJwPZ1khZP
DPINt1cIjpaO80e2Pw678PILxizzp8AkQgXBdY3+QCM8xkRiztZB74HU6aO93h4/
+Lxr25ZbDKWiubolZsviVSngk+C+VWO1wnhRhNgKwXqZbLTPPvKd6FJ37AhOVyj+
tWJW+ZWzuOHswXcED0nH6lYL3DDdIJp9aBOy7kAmcqCqZW9FumjVD2QADHDTJoVx
LeJCEXsDkxDagMZvX1tYNGUrqyWo9vZsV9ZAmHdi5d9vSaY+fADJ1UGLVXalkCEt
VAyEv/qj1lDyFEaP8BEKtGPa2sySA6CDvq3qy8La9edDQW73VjGV53m5p2sVUmk1
J0Hy9QNRCJynt/jJUsK2ClPhjlw4ceasvDl5sl+LnfCkkJNioP0=
=ZyjJ
-----END PGP SIGNATURE-----

--Sig_/nveQePa.E8Kg=XOOwz44OOU--
