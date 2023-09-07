Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97622797058
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 08:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52A210E771;
	Thu,  7 Sep 2023 06:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F4B10E771;
 Thu,  7 Sep 2023 06:51:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 51C7CCE1876;
 Thu,  7 Sep 2023 06:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60EC7C433CD;
 Thu,  7 Sep 2023 06:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694069507;
 bh=aPO6USzzdxuixOq9PQ0iJB0Us+7uTGzd+PLWgzkmPBI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dLqYu4bOXnOawS/rR2H/pGassLtLUAXIzQYm40TLW44NUNTR0W4qACqxqaAhM0cRR
 LI4Y7HpZR/wx7paImxUEWdxzPpp1doqWoTftC+fPwnlmbiH/Fs0U7dcZ0hxgC8DfTF
 2wBITpI00WkU2PL5l71yONX9lXFa3fvZ8T28wt5qZYQJ7etZ4z5ExNfkAvTSKMUuGV
 eWgFLhzYlmrRd6ZJFfZzoM0/zcLLwkdSQT5B0KaVgh94JAhC/Tq9RwUdjfef8wArA3
 a+tT9gIyFlxSDseYVLJ4Hzd89UEjuzsxF/9jV2h7Gyi+wCiy5AIGvxIPbNiG0iDEpG
 2FyC0qTgvleCg==
Date: Thu, 7 Sep 2023 08:51:44 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v3 1/5] drm/connector: add trailing newlines to drm_dbg
 msgs
Message-ID: <p3pmpj6a72tinjalmntxjw4cqhltkqux2zjwgwx4sxvvqeitkp@6wqr7aujr4h6>
References: <20230906190224.583577-1-jim.cromie@gmail.com>
 <20230906190224.583577-2-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gmy6cug3yiqzvetg"
Content-Disposition: inline
In-Reply-To: <20230906190224.583577-2-jim.cromie@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gmy6cug3yiqzvetg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 06, 2023 at 01:02:19PM -0600, Jim Cromie wrote:
> By at least strong convention, a print-buffer's trailing newline says
> "message complete, send it".  The exception (no TNL, followed by a call
> to pr_cont) proves the general rule.
>=20
> Most DRM.debug calls already comport with this: 207 DRM_DEV_DEBUG,
> 1288 drm_dbg.  Clean up the remainders, in maintainer sized chunks.
>=20
> No functional changes.
>=20
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index f28725736237..14020585bdc0 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -2925,7 +2925,9 @@ int drm_mode_getconnector(struct drm_device *dev, v=
oid *data,
>  						     dev->mode_config.max_width,
>  						     dev->mode_config.max_height);
>  		else
> -			drm_dbg_kms(dev, "User-space requested a forced probe on [CONNECTOR:%=
d:%s] but is not the DRM master, demoting to read-only probe",
> +			drm_dbg_kms(dev,
> +				    "User-space requested a forced probe on [CONNECTOR:%d:%s] "
> +				    "but is not the DRM master, demoting to read-only probe\n",
>  				    connector->base.id, connector->name);

I'm fine with the general idea behind this patch, but we shouldn't break
the message itself.

See https://www.kernel.org/doc/html/latest/process/coding-style.html#breaki=
ng-long-lines-and-strings

Maxime

--gmy6cug3yiqzvetg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZPlzAAAKCRDj7w1vZxhR
xbqrAP9CgpjovfOg+REj39MWlNMI8yrtH+BY1wWGACZsq9xiCgEAnGaAZPYdt4fM
C4Y1xIty+CU5YiD1WRooqMMGh6jHJws=
=vfeP
-----END PGP SIGNATURE-----

--gmy6cug3yiqzvetg--
