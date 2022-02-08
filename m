Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 461394AD564
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B34D10E2C4;
	Tue,  8 Feb 2022 10:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125DB10E2C4
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 10:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ylQBUsrlHSlFJqcHofX4AOHGohe0f/dkMaSN8vdQKac=; b=ejGNO7qXIk88mFIPvKNvde01Q9
 k3+P0fJ80tW0CQXT/8cTwXsMwVZXb4S2atHi7+t+T26+zqkggJ6AU/TMIUu9x+nUwJv6edjhR5o6E
 uYUtKwo5JB1LOdpFhJyOQmvzNHEM1D3Qrd+jw9Z0c2SCTeTEm8RzbwRFer883yog6TNKx9TTD8xTf
 WqfIKQc3GfoXnTrXfshrjBZ3UKGZRLoeEsaivcdyp6efIWXQb3VxeeNaAolP3FIcgIAsOk7RtwU+g
 yLk8IsfIb2A41rDF8Qiss/ou5127ZpF6fUaALVvzsTIJfXSe83r9Ogo56fwdPdc65tHh4Pvtcqhu2
 luflTS/Q==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nHNYR-0005qo-F2; Tue, 08 Feb 2022 11:16:59 +0100
Date: Tue, 8 Feb 2022 09:16:47 -0100
From: Melissa Wen <mwen@igalia.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v4 3/9] drm: vkms: Replace hardcoded value of
 `vkms_composer.map` to DRM_FORMAT_MAX_PLANES
Message-ID: <20220208101647.4xzfxxlugpzcroqr@mail.igalia.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
 <20220121213831.47229-4-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tkp7m23uqa32bouh"
Content-Disposition: inline
In-Reply-To: <20220121213831.47229-4-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, tzimmermann@suse.de,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tkp7m23uqa32bouh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/21, Igor Torrente wrote:
> The `map` vector at `vkms_composer` uses a hardcoded value to define its
> size.
>=20
> If someday the maximum number of planes increases, this hardcoded value
> can be a problem.
>=20
> This value is being replaced with the DRM_FORMAT_MAX_PLANES macro.
>=20
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 9496fdc900b8..0eeea6f93733 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -30,7 +30,7 @@ struct vkms_writeback_job {
>  struct vkms_composer {
>  	struct drm_framebuffer fb;
>  	struct drm_rect src, dst;
> -	struct dma_buf_map map[4];
> +	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
Reviewed-by: Melissa Wen <mwen@igalia.com>
>  	unsigned int offset;
>  	unsigned int pitch;
>  	unsigned int cpp;
> --=20
> 2.30.2
>=20

--tkp7m23uqa32bouh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmICQw8ACgkQwqF3j0dL
ehyNIxAAslLhH3CDtrP5Ces49IPuAILW5IwM1Fq2dSHwoSoRPHdFns1ytViVeO6W
iJq4XOrSxLw7CyL8hSVjW3jb49Kxlg2EWZxTgadIoco1ZW/5JJ/ZD0BMhknv/62o
IBoNgVnwolIkhp+VCqNSTvLyZn3XgVqGA8kQlVsNprdXjS7fycnuy3JPu30liQTw
K/FA4+NyaoPd/8oNYbWMazdGTyLpkqxZ1scb34Qwj2tHr4sxnlP9laOVnbTKXtaI
jLxlCrrlo30DL0MCNmx8nhoG93kKEFJN+OtlW4FjExoTTICqKpRdCVh1iNdfT6dB
HFateY15YNGPyyIYNhp4ZH3W9IM3DD8gBZ/e+wqQqSffvyJhG9PuBaNVYLnFb2QE
2t/1dQFe/vw2ZiE6IO+jwWyeTNtOOXYRgo0tcUfFZ1WWVclNvykChTpusltyo1ge
WSWUdTbunPEckqSeF6wtsKdW+a5UqKGBMu+pWD1+txVyzD/nAQ4AaB5sieceNW8i
IzjqqLm98o9nAKZdMWdgKL48RO9b6NxeLB7ULxkotJkDNH5huS79F4HAsNTpsO0W
ZLjcF0VUaxXBVhRecxHODeNIkgK0VCzCRSxgskZre+eD2CAN3nlFjAUBjdBNCXmg
t5z+xAoZNhTXjRHhgD6DRZsWJfZk4J1q8de/odZ9GMK5vaUJGxg=
=MLp4
-----END PGP SIGNATURE-----

--tkp7m23uqa32bouh--
