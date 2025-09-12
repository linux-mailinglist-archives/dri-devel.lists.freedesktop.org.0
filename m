Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FD8B5530F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 17:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D7B10EC86;
	Fri, 12 Sep 2025 15:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mpn79/pN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E42810EC86
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 15:19:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 321594357E;
 Fri, 12 Sep 2025 15:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CEAC4CEF1;
 Fri, 12 Sep 2025 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757690399;
 bh=Un++XspxRtqo05EkVbbg1Q8O71wpuNekprsOR6FcvYQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mpn79/pNNcDQ7KNZHykB4GpoynwNPLpETXa/0eVj4T2ejwsSXUHTytIDIZxc5Z39I
 K5dLk00MlScVcxDUDlmX7LFwVsbQXdTjWSLMLqQ6WflKV7s5uFBnp7Ydygb8POOaUg
 KlxDdQMTfJ/UpkK6Ldo9nD6/8KQG0orUnTTPDn9MI0PS29Kd2Wp0d0/PI5xHnqQiVE
 ZEr1LUhfGR4GwRofLPFVEzIRlulYonqR1QyM/4+ffQ1YAxuAI2zLzLQnl19YPEpLb6
 lhtb5nUlTnnEZ6YqCKY1v5xl6kifN+2nmz24MffgHGAqP9YKlP3x29HjdKyoo1djF4
 KDpR4XF/LVVwA==
Date: Fri, 12 Sep 2025 17:19:56 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com, 
 andri@yngvason.is, sebastian.wick@redhat.com, daniel.stone@collabora.com, 
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch, 
 harry.wentland@amd.com, christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 4/8] drm: Add enum conversion from/to HDMI_COLORSPACE to
 DRM_COLOR_FORMAT
Message-ID: <20250912-wealthy-hopeful-dodo-2f4cbc@penduick>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-5-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="j7o7yc2zbhtsawxq"
Content-Disposition: inline
In-Reply-To: <20250911130739.4936-5-marius.vlad@collabora.com>
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


--j7o7yc2zbhtsawxq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] drm: Add enum conversion from/to HDMI_COLORSPACE to
 DRM_COLOR_FORMAT
MIME-Version: 1.0

On Thu, Sep 11, 2025 at 04:07:35PM +0300, Marius Vlad wrote:
> This would please the compiler to have a enum transformation from one to
> another even though the values are the same. It should also make things
> obvious that we use different enums.
>=20
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> ---
>  .../gpu/drm/display/drm_hdmi_state_helper.c    |  4 +++-
>  drivers/gpu/drm/drm_connector.c                | 18 ++++++++++++++++++
>  include/drm/drm_connector.h                    |  3 +++
>  3 files changed, 24 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index f9aa922d25d3..dc2f32651cb9 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -653,9 +653,11 @@ hdmi_compute_config(const struct drm_connector *conn=
ector,
>  				       conn_state->max_bpc,
>  				       8, connector->max_bpc);
>  	int ret;
> +	enum hdmi_colorspace hdmi_colorspace =3D
> +		color_format_to_hdmi_colorspace(conn_state->color_format);
> =20
>  	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
> -				      HDMI_COLORSPACE_RGB);
> +				      hdmi_colorspace);
>  	if (ret) {
>  		if (connector->ycbcr_420_allowed) {
>  			ret =3D hdmi_compute_format_bpc(connector, conn_state,

Does it really make sense to have the fallback to YUV420 here? I would
expect to get rid of it, or only use that for "auto".

Maxime

--j7o7yc2zbhtsawxq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMQ6HAAKCRAnX84Zoj2+
dnpfAYDOI50FjbHNBNNeKNn+XRz6neTEx5WMPqs2JReiX1J3tns2De/J2brk0oM4
hxagQd0Bf3j454lnPaS5CUP5OCgbexmJA5iq/yGNYmYWL02WUnL5OpY+6jrvWOwm
5vh0oogI8g==
=iIsk
-----END PGP SIGNATURE-----

--j7o7yc2zbhtsawxq--
