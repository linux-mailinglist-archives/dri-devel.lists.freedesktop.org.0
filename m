Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4310A91690
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 10:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB5310E28F;
	Thu, 17 Apr 2025 08:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="FbEkHgJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33F410E28F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 08:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vfkQR8RmeVBACYHQDoFaf/rNFZ28qvsQUmCIhcTbncY=; b=FbEkHgJq72Xk4x4fpExao3EZpK
 uH0p43RjTNm32vg9GpN9VNgS/3H/CAgcMv7oYs2vgw4yuOwIaROqm1ywlhKvaVeSP10TxGdh6jbxj
 r2rYJu3PrE2d4Tb7XilZPrJfQE1aR7HMMqJjopLUY/WTbziYR28W17ZMLtNNdn/d84zqPE3V0a6LD
 uqXBZ/KwVTkn61NNuFLcF5I4LVc7a9aWFQBv70rJeygjMejfZjrnalbP3BlarK3es659zqISGYsyr
 im4TYza4htwW95hzvQdd+o5UfRmbNcCnnqER90VlgzRyzQgvRtAW96eH4RRaPrzYUOqBAVqzqkpfx
 6CvuyyGA==;
Received: from [194.136.85.206] (port=44006 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <pekka.paalanen@haloniitty.fi>)
 id 1u5KlW-000000006Bz-0Pv4; Thu, 17 Apr 2025 11:38:34 +0300
Date: Thu, 17 Apr 2025 11:38:27 +0300
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
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
Message-ID: <20250417113827.7c69631a@eldfell>
In-Reply-To: <20250415-yuv-v18-1-f2918f71ec4b@bootlin.com>
References: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
 <20250415-yuv-v18-1-f2918f71ec4b@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jzgf=84qHh/HA3ewyHp0VfJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

--Sig_/jzgf=84qHh/HA3ewyHp0VfJ
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


Thanks,
pq

--Sig_/jzgf=84qHh/HA3ewyHp0VfJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmgAvgMACgkQI1/ltBGq
qqfYEQ/9HwV+VLsSdbGlDhk4ejPGt3Zh3ZdAIsaFj+2Z3BWdmhhhuH9TOOs6ye0U
DB1zaGhAFNdmrRYs1bB43MkBNCXTxnBWl+Bah4w7p1VpUeRAggNpaLJiYvrQAQCA
asD47WDDhiIhHUjT0aVb4Qy7K9o2J3Bbks3Al/OsLdb0twT7KtEb5NAp3klZpFtv
cUkeNHB5vA4EuVg1//JeQC0sr1SQZeLXeM7YAxc5QS9Xu3afgm6RAMDJvozLGtLX
1RXNCNUXv31cYa+C0HEt8TcpstNrmYD+q5y1r5THJzqzp+elV2P/laPg+rB+nH6m
JOHAljF+P7PeMfLLeiA/gdZxTAiJLziODbGhAu3cN4gCkjFm+9F60i8znpc0qA6B
L4kenehoZ83niUlHRlbDoc8yb3VLJlfILfDmqNVAchV+kgA5DnLyWl+PlQFPLN40
6r9l7zgXaFozbpRtTR5jNnMUdlUm0mWC7v83StSFuukiyv1051pLdkEUW1i5IEhM
FSbX8NSiQnDYUWgGqLf2HFP03DoqQdgDfcXo9hUQcjajgoOJK9/xfyAV3sGSl+Kq
WTR9052jqEh6ABkMy6qR6BA2gl7XHRl5OUuVyf4/CuzbFAVuXm4bigQZJx+CDe5E
NvO2cKpW/PB+2Ic+RCVKneC3UOxcuBzV4vH0N0epI3uSEXY+sww=
=S4YC
-----END PGP SIGNATURE-----

--Sig_/jzgf=84qHh/HA3ewyHp0VfJ--
