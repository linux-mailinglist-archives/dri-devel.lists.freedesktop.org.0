Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E50C65EA6D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 13:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690E810E6EB;
	Thu,  5 Jan 2023 12:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C00810E6EB
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 12:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EIgoVO0K6kgFCl8TbgPnVJQKtSbCG+vDxK69jtFpqsY=; b=W2ZV1zCt3iST5RSlhbGG1rO4iD
 OI2CGD6D3k0Q+pXchZcXZc19K6MKbnByPDs8rexUcaTTCwDvXWND0pcMVRTfuwXp68+G4GJ4f9mmj
 HRgGDF18bmf0GR++FgeoW2c6JM+UL+S+9EtZlNIPYFF834cQZu1tTOhxkACQx/Qfl7KLD/2Z14BEO
 Uscocpv2V1XnIjXRDK6kUJm9hP+BOlKcOHqlMVUSMQX1/2wH5Ism92+aABQTiPt796emY0u3PEkn5
 F17POgfz1jDSJe1gci7kg0U+Cf4zcVmJskWXcAKXiW0HFal05EiJgN7pG4Now5kqCuGL2NhKYp2zg
 JPCcmaNA==;
Received: from [41.74.137.107] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pDP2H-0002pV-5Y; Thu, 05 Jan 2023 13:07:53 +0100
Date: Thu, 5 Jan 2023 11:07:39 -0100
From: Melissa Wen <mwen@igalia.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: document better that drivers shouldn't use
 drm_minor directly
Message-ID: <20230105120739.ixh2mk53jsc5bzq3@mail.igalia.com>
References: <20230104211754.1967591-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4jctmkrobdvl4k45"
Content-Disposition: inline
In-Reply-To: <20230104211754.1967591-1-daniel.vetter@ffwll.ch>
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
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime@cerno.tech>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4jctmkrobdvl4k45
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/04, Daniel Vetter wrote:
> The documentation for struct drm_minor already states this, but that's
> not always that easy to find.
>=20
> Also due to historical reasons we still have the minor-centric (like
> drm_debugfs_create_files), but since this is now getting fixed we can
> put a few more pointers in place as to how this should be done
> ideally.
>=20
> Motvated by some discussion with Rodrigo on irc about how drm/xe
> should lay out its sysfs interfaces.
>=20
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Wambui Karuga <wambui.karugax@gmail.com>
> Cc: Ma=EDra Canal <mcanal@igalia.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  include/drm/drm_device.h | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 9923c7a6885e..b40e07e004ee 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -87,10 +87,23 @@ struct drm_device {
>  	 */
>  	void *dev_private;
> =20
> -	/** @primary: Primary node */
> +	/**
> +	 * @primary:
> +	 *
> +	 * Primary node. Drivers should not interact with this
> +	 * directly. debugfs interface can be registered with
> +	 * drm_debugfs_add_file(), and sysfs should be directly added on the
> +	 * hardwire struct device @dev.
> +	 */
>  	struct drm_minor *primary;
> =20
> -	/** @render: Render node */
> +	/**
> +	 * @render:
> +	 *
> +	 * Render node. Drivers should not interact with this directly ever.
> +	 * Drivers should not expose any additional interfaces in debugfs or
> +	 * sysfs on thise node.
> +	 */
>  	struct drm_minor *render;
> =20
>  	/**

yeah, with those typos fixed, LGTM.

Reviewed-by: Melissa Wen <mwen@igalia.com>

Thanks!

> --=20
> 2.37.2
>=20

--4jctmkrobdvl4k45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmO2vYsACgkQwqF3j0dL
ehwP1BAAi6mno/iTcTxfzxlFfKkVXGTuTdog+B5LWpZbcQCk3HC3v4+livUteoaN
6UxiwPW3d+PYAW6bRINRCgFyxFCgy22HlPYK85xY07iEJWbMgrQILkJNeQyVe1Xc
omyLHOKsLlLKlNssuRGwdEBU6/lLcdNrY6i38VOYKEkTYRf1EY+zWH08fNd5kn9D
aJDiLbdbiBIu6QDoO4lXIxZwCaOy9ofYE5CNvug4XE770XLsiuvCJ9e4T8yM5N1x
7nsTklMPDL6JrwaExzL+sGqb3t7KKQktM7u3nfxgh0OKysekwEyFNRCcRCRhgh57
rAmy0292DhJnH2/eeD1l/xTqmwCSKTj2c4JcoLTA8/cq9dlEWsl5V7adVk5iEIov
4kodYHdLsJnKcdbKkHw7ad9XKTaa2FAncRSskkXXjt71EYgtXB1AdKQ/lcHGbV4K
q2SlVUd3tuyEQuy4WgmV8rIfKCINV2h+G65rWBYkxGoKZdLzdzVmZPSyCToo9yVg
aZfmZdsrh6ZV2bX+dK7VeIOkTb+5ZPsCXvYpyRJSI5fBjxub86/MR3TehmXzJQXA
2Y5n9XMdkXtdQfIGPJ1psuUu8Qezf+ZKtzwE3i9vVxlnPBOZy8v8MnqbxzTuTnzO
QunmuFpKM7QJQr5B+EY0C1Vk91fvCMBQd5fZqcVtHWTM20Xarx0=
=xyDb
-----END PGP SIGNATURE-----

--4jctmkrobdvl4k45--
