Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B4CAC1017
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 17:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCAF010E165;
	Thu, 22 May 2025 15:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Anjm9aSA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA45D10E28A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 15:39:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 165D55C6217;
 Thu, 22 May 2025 15:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8293CC4CEE4;
 Thu, 22 May 2025 15:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747928383;
 bh=CPi3P7jr6JFRORjiXXFveNVGwauIS/kgfrlDymYbccc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Anjm9aSAsuHo3ENznnquuzdRNbgSHGUUeujx7ysJMowV/uhh22uXPmDALjGifH3d3
 ULngrWVg7qQsen1VaKy23xlualto2uVjtTupbVtFxzXQjsW7YD3m6etSgKlmYDIK5j
 KN5aAU8fftXrTbxUX1pfwe04fze/ltObtfqpb3gBC46nVZXRuKqTgy+uXeXgufS/1o
 Huk6E/EI8k7XsBIBob1vejpro3myLuWAvybfJayOqhgdpoGB65sDRcQtQMe2w8A2h5
 UyBRoTpm+I2SYvUAOaPnSm1j30166w+sH0dBLFfpglNGUtQte0KC6dWq6wuhjCOJJA
 WLX1HPiXkTlmQ==
Date: Thu, 22 May 2025 17:39:41 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, 
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi,
 Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, seanpaul@google.com, 
 marcheu@google.com, nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v18 6/8] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <20250522-skilled-brawny-parakeet-e5cccf@houat>
References: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
 <20250415-yuv-v18-6-f2918f71ec4b@bootlin.com>
 <adcd3356-5aae-42a8-8b55-9761c95d2e52@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xpgisissbrxe6gel"
Content-Disposition: inline
In-Reply-To: <adcd3356-5aae-42a8-8b55-9761c95d2e52@bootlin.com>
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


--xpgisissbrxe6gel
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v18 6/8] drm/vkms: Create KUnit tests for YUV conversions
MIME-Version: 1.0

On Mon, May 12, 2025 at 03:07:55PM +0200, Louis Chauvet wrote:
> Hi Maxime,
>=20
> Did you have the time to look at this patch?
>=20
> Pekka added his Acked-by, but as you made some remarks about this patch, I
> would like to have your validation before applying it.

Yep, thank you

Acked-by: Maxime Ripard <mripard@kernel.org>


Maxime

--xpgisissbrxe6gel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaC9FOAAKCRAnX84Zoj2+
dh+KAX4mqKD9x5Fk6yBHL1pfN1Mec2kWU97o8exhTKoyyE6kT4UGK5O8He8OidfF
kIpGu1gBgOPkMHqDS023UAhv638NS9w6hZVLcAQLuNHVw6Z8p1qbYQQowL1p3qur
0DyjhWk8dg==
=7Z0B
-----END PGP SIGNATURE-----

--xpgisissbrxe6gel--
