Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3608978EF5
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 09:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AB710E11E;
	Sat, 14 Sep 2024 07:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="inCsllv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64CB10E11E
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2024 07:43:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1726299810; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RbnwAjEucXAKzNeT8OSRgFyVTfJqTiNV1SPybCL8HFrpn3cfwaUHlG6q4wteMAQhVbeD111Xkr+hWuYayvI9nD6ohp9DUjN9RhAKdVttQqlmZswlLEDC1xsWRodjUO2gjgCz0v2wPcmxu5ivWJKvo9vFSbsSe6IQF3oNp53ERFk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1726299810;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9s6xbgvRK66eWsct5dwCUnVpO4nqDb+N6HYnzutOOR4=; 
 b=Us3Eit+cTSmh7lDAwTyHD2I8Z54xM5bK0ZlCk6g+TNt5pDkZceUW3g0hk0vuwCa/vZllB5RO+ytgxh4znYVoTShjh6Ammz7FPOkXM2RZsQZ2oYqgiXZ8eUpWxCcQjl9+3BIMKU8n4Iru6AimuDxt+VUijelEN9FztkayAhJ8/Lk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1726299810; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=9s6xbgvRK66eWsct5dwCUnVpO4nqDb+N6HYnzutOOR4=;
 b=inCsllv3x9n7C2tlssmPf/tMvrPWt9e3mLm60cAKlcsL6P7/Mny4uzdiM8TtUqJ9
 zXyDR1I8sZv6zMOq4egzE2rXWSDfnPaR5Dqfthbp7O5ynv5UK/HRfhJiytTQMPERiZZ
 j8EPRzwEsb8F5UyNHWxv1sBqaqzExKqmFEkkSfYw=
Received: by mx.zohomail.com with SMTPS id 172629980865397.08858448934461;
 Sat, 14 Sep 2024 00:43:28 -0700 (PDT)
Received: by mercury (Postfix, from userid 1000)
 id 18B7A1060578; Sat, 14 Sep 2024 09:43:18 +0200 (CEST)
Date: Sat, 14 Sep 2024 09:43:18 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH 0/3] drm/omap: Minor fixes
Message-ID: <p63avbtt3vovvmcjpz5xywpneuegb2yasvfllo6leskldbac7p@rkfhsgvjusrf>
References: <20240806-omapdrm-misc-fixes-v1-0-15d31aea0831@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ecfymshjkc7m26ry"
Content-Disposition: inline
In-Reply-To: <20240806-omapdrm-misc-fixes-v1-0-15d31aea0831@ideasonboard.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/223.982.64
X-ZohoMailClient: External
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


--ecfymshjkc7m26ry
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 06, 2024 at 04:50:26PM GMT, Tomi Valkeinen wrote:
> A few minor fixes to omapdrm, mostly to remove sparse or other checker
> warnings.
>=20
>  Tomi
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

For the series:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

> ---
> Tomi Valkeinen (3):
>       drm/omap: Fix possible NULL dereference
>       drm/omap: Hide sparse warnings
>       drm/omap: Fix locking in omap_gem_new_dmabuf()
>=20
>  drivers/gpu/drm/omapdrm/dss/base.c       | 25 ++++++-------------------
>  drivers/gpu/drm/omapdrm/dss/omapdss.h    |  3 +--
>  drivers/gpu/drm/omapdrm/omap_dmm_tiler.c |  6 +++---
>  drivers/gpu/drm/omapdrm/omap_drv.c       |  4 ++--
>  drivers/gpu/drm/omapdrm/omap_gem.c       | 10 ++--------
>  5 files changed, 14 insertions(+), 34 deletions(-)
> ---
> base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
> change-id: 20240806-omapdrm-misc-fixes-2ea920193dde
>=20
> Best regards,
> --=20
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>=20

--ecfymshjkc7m26ry
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmblPpIACgkQ2O7X88g7
+prUWg/9EdoySBxDqVDFjyZIU8WKrTZK2WPiQUn4aJsTugo8jA1jQrX+c4CNUO8h
8fa6s9RjZMqpP0EKEmyp3I3801cJmN8cZwdS5YjkiWIjFTlsrWPIlf4Ve+ukMINX
k3qizRuWLSOTiJgdu0u3vaKjh4uhjWzlPyl/uKFx5N3pSVxw1OQQBXFSYsqY5AFj
hHN14+j4hmomtDHRB+OicWVV4+KBsvvCcFhknGSbVvs4je2CKn9Fn83JNY6WJz9r
sAMFAHN9jsJWX0L6OQNFbutoW9p+ym+8YLoaNO4OKgBJyIeVNVHb9h5bjASLusI4
XXjrHOTpaRL8cJGrqnJJ65fzX7+4dif5ZNUUt13MvQO+hSlM6nXLRzhYzGskBpJn
rxnmfVhrGMD+X1tmBqShwutklogpFjYgFGX2TwmJDpZOU2chViNbDvDsuz5pZmOf
n1K2OF4wDMaG/wZ9XkeahbSbjNkObRHehkRIBocGPcjppiRDiGCgPZX9x1RzyTGi
P0uOG3sjjPA4pAhrfZVaVMZoX68lngd5wMot2PtcMBiSe1v7maEnLtNgjd7pACgv
dlz6h0QAk2u0ZpCmx6POKatzakP0QoBgHAaqqVJKgbWTzo5/y3cZoiWfOzJuvygj
C6m06J0AK7lvaAo/8bixuT+w85IJfn9MyqerjCc1zrKifyrgSVA=
=Tzmd
-----END PGP SIGNATURE-----

--ecfymshjkc7m26ry--
