Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBA29D6267
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AABF10EC1A;
	Fri, 22 Nov 2024 16:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ecr8Xx66";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0551210EC1A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:36:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AF47EA40E03;
 Fri, 22 Nov 2024 16:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F69C4CECE;
 Fri, 22 Nov 2024 16:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732293397;
 bh=pE8ixWo8gzZiQLIdVAgn6WfVkyTQhdYuv7ULnA+hrH4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ecr8Xx66rrTgKwDRj90xlTTBW9TLELsDrXcxB0+upWmCuduXetjxvyHesJbyQlcj6
 dIAkF1TubljM+JkLvgY4o4SPTOJ7W7iTHGZePpaGlLl5Po12dv6YqEMjvBbohWe23O
 dZGffjovCzlC+GMw39Vv9ZqnMGnVn8jPgOvnWwUYKnn8GFDeyULP7mXCWzC0sxRlET
 wm2Ko+KUaQtNLJ1UV6VaMo7iD6H+mppGW+oZMVh0YW86M689NL7L+N6aqjTyQD1iqG
 OXYDqrUj7Vrpi+VDnSPt8BvUaCgTvIPiK68svnPOWV9kEAckqTxQIGeNcO4IfJCrpi
 rGwrS+h0WrYFQ==
Date: Fri, 22 Nov 2024 17:36:34 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi, 
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v14 4/7] drm: Export symbols to use in tests
Message-ID: <20241122-crafty-feathered-capybara-b16c9d@houat>
References: <20241122-yuv-v14-0-e66d83d28d0c@bootlin.com>
 <20241122-yuv-v14-4-e66d83d28d0c@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rdydydsfebkvtk6d"
Content-Disposition: inline
In-Reply-To: <20241122-yuv-v14-4-e66d83d28d0c@bootlin.com>
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


--rdydydsfebkvtk6d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v14 4/7] drm: Export symbols to use in tests
MIME-Version: 1.0

On Fri, Nov 22, 2024 at 05:15:04PM +0100, Louis Chauvet wrote:
> The functions drm_get_color_encoding_name and drm_get_color_range_name
> are useful for clarifying test results. Therefore, export them so they
> can be used in tests built as modules.
> ---
>  drivers/gpu/drm/drm_color_mgmt.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color=
_mgmt.c
> index 3969dc548cff605cbdd3d56dceafb2ca00a5c886..509aa4325391340f8cfc50bd0=
fc277c48c889d3d 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -494,6 +494,7 @@ const char *drm_get_color_encoding_name(enum drm_colo=
r_encoding encoding)
> =20
>  	return color_encoding_name[encoding];
>  }
> +EXPORT_SYMBOL(drm_get_color_encoding_name);

If it's only required for tests, then EXPORT_SYMBOL_IF_KUNIT or
EXPORT_SYMBOL_FOR_TESTS_ONLY would be better.

Maxime

--rdydydsfebkvtk6d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0CzDgAKCRAnX84Zoj2+
dhTFAX0V6AnVDd5Olsac8BDOeLeqSrE5iOoqQ7owO/CjGHpxob3C5cxUEEy05pWL
jF1sx74BgLgWgq0ptGvGTkCDvfigMvu4yG9AQh5aW6z6G0JQClAsFuIH9sj0PMMW
0000k2dgzg==
=9mD+
-----END PGP SIGNATURE-----

--rdydydsfebkvtk6d--
