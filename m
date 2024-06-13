Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B446907E4A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 23:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4C410EBB6;
	Thu, 13 Jun 2024 21:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="D1dsGlfO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B23110EBB6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 21:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718315326;
 bh=0E5aK+rK+8mWd3EYjuWk54URc/yrnOGrMi4oOy/HQyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D1dsGlfOsQMs9j42IllEL504XJcPhi+v4uVHVFUDh9dkLitaQA92h9SgvyHWm9Jy7
 CYBkT/f5cvRmgi45ATQGnmHpqoGyiOhn0ObacdtPpyVKklC8r1RAfWsajgT+L4dJ0G
 dqD605+2loqPTusv5fDX6nfFTc9uA0yVsnrD+IiZ9AcaCGKQl5moXMv21yes06rTtt
 KY72REId3auGznJNeBm6Nde92mF8qEHlAQ4B3h2a4RVqi9FskzzgqaD1UI5IY9OFpO
 v9qhbcgeV6KgXt9oTRO4QgDMwwb/rFnBmOBnog6tiYiFKBCl2Okp0QHypUIpOzyOx6
 8R7ButkRiVz+A==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: sre)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3F5FB37820CD;
 Thu, 13 Jun 2024 21:48:46 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
 id A9EA010608F7; Thu, 13 Jun 2024 23:48:45 +0200 (CEST)
Date: Thu, 13 Jun 2024 23:48:45 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Oded Gabbay <ogabbay@kernel.org>, Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 5/9] arm64: dts: rockchip: Enable the NPU on quartzpro64
Message-ID: <mq5clkj2io6vzkawm7s6wvzb6rlk74oyy5lylgivosvyavojms@fppwpj5m3qqw>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
 <20240612-6-10-rocket-v1-5-060e48eea250@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vlxe36ggc7o455an"
Content-Disposition: inline
In-Reply-To: <20240612-6-10-rocket-v1-5-060e48eea250@tomeuvizoso.net>
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


--vlxe36ggc7o455an
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 12, 2024 at 03:52:58PM GMT, Tomeu Vizoso wrote:
> Enable the nodes added in a previous commit to the rk3588s device tree.
>=20
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---

There is a separate regulator for the NPU. For QuartzPro64, which is
basically the same as EVB1, it should look like this (obviously the
"npu-supply" and "sram-supply" need to become part of the binding):

&rknn {
	npu-supply =3D <&vdd_npu_s0>;
	sram-supply =3D <&vdd_npu_mem_s0>;
};

Also the references are supposed to be done alphabetically in the
DT file (so &rknn should not be added before &i2c).

Greetings,

-- Sebastian

--vlxe36ggc7o455an
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmZraToACgkQ2O7X88g7
+ppnfQ/+JqtXPucUyRx8LXjWs85ElMTUelkoio7nG3hMKa+kIhgFzXsAklBUmELg
SeopwGrOOSJCb478Eb3uL3M7BBA31blIKAdDnlpFB4R1iimlnGf6gqTkcQumGc2M
zkgt/YqBdQ4W5HhLCb21fL87PkHZDTgP0SNQlVg4z9xo2KBVuHZe7gfM0/t5MRhC
P6euSXEhkSUGHb+gq0LBf0MZnoHF6KWcMSsEXm7u/Sv2ftVrC6SyBDUtAAK7WOce
DHyytzRfGFjoW8/rkxrkdNnw8eQCLd3LZkWhloahInps1t1o4Npk5/o8zEBjHZyY
Jk7ocIrRnoiMy47QH0zAwr4VtHl6fhRnaZS/0xwBA7jlIGW96U6bNNJkgw1Wj1b1
capv5ZDibYnlT0JB2NVs+OocykO4MskKtvn6gng3Bu22sGxQ2zWAT41TtrTzklS1
WRbcIdHwpvtUSvxbWsfpjVuPCfuaVDPKP3ERnWdSTozQ6rZFTY+JN9/FT+wO/b2h
V0vPx5d6KvskXRd8nOEdd56gTisxnjBEx2njFoQ3fST/blAJs1N37sYHkxeFQnom
gvk/hVj1zCZV3h5tC+nYJnPM2s2WD49T4R+TgNrCqwLSr+CydHChFnQsm8h+GaXW
dRZ3RCqZvDopo0LEKn0BLxGfwFzMU/FUPM37m7o3NQo0xfawtBU=
=SaHD
-----END PGP SIGNATURE-----

--vlxe36ggc7o455an--
