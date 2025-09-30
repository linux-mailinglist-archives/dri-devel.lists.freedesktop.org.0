Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6397FBACB7E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B64610E597;
	Tue, 30 Sep 2025 11:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k8GvgUJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BE610E597
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:40:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0514B604DD;
 Tue, 30 Sep 2025 11:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541EFC4CEF0;
 Tue, 30 Sep 2025 11:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759232426;
 bh=UIEiH0PucB/CR14pwwRZ7b7m98PDqn0hrrGBShciGUM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k8GvgUJCRyoB4Zw+nZcxGa2OKc6lTy6Aou2LxW4tRI4+bIEK0Tu0v47Ve4ArAPOfa
 pTuOi9BWwTK1AVnj7PiBxcYVei2W+DmykGei7kPBDpWpg/36z9DTmZS20EOdtpYA0X
 m1xrVQ+zLypCrUyZc1sctzv9C3ILHtZV6/hFutg5cYFjVlYL2jqhH3r88mtlNKFLun
 HqWfI1KRqBMlYfvRfubI8G96DhV28kRtXi/f4N2yhqyXqow4L5QYvupzwqugk+Y6Q+
 G7ghNor//HTlCOqwK/T+YzZoctT+mssM1oU78LbeYH7DN8gfR3jne3e3MWgqVD37jA
 uQuPj3bxWQTCg==
Date: Tue, 30 Sep 2025 13:40:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Marius Vlad <marius.vlad@collabora.com>, 
 dri-devel@lists.freedesktop.org, wse@tuxedocomputers.com, andri@yngvason.is, 
 sebastian.wick@redhat.com, daniel.stone@collabora.com,
 jani.nikula@linux.intel.com, 
 tzimmermann@suse.de, simona.vetter@ffwll.ch, harry.wentland@amd.com, 
 christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 4/8] drm: Add enum conversion from/to HDMI_COLORSPACE to
 DRM_COLOR_FORMAT
Message-ID: <20250930-abstract-orca-of-promise-e287ab@houat>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-5-marius.vlad@collabora.com>
 <20250912-wealthy-hopeful-dodo-2f4cbc@penduick>
 <0b9be3f0-c775-44a3-b15d-1e139dbbbf91@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="srtwgwxqj4nkk2pr"
Content-Disposition: inline
In-Reply-To: <0b9be3f0-c775-44a3-b15d-1e139dbbbf91@collabora.com>
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


--srtwgwxqj4nkk2pr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] drm: Add enum conversion from/to HDMI_COLORSPACE to
 DRM_COLOR_FORMAT
MIME-Version: 1.0

On Fri, Sep 26, 2025 at 05:50:43PM +0300, Cristian Ciocaltea wrote:
> On 2025/09/12, Maxime Ripard wrote:
> > On Thu, Sep 11, 2025 at 04:07:35PM +0300, Marius Vlad wrote:
> > > This would please the compiler to have a enum transformation from one=
 to
> > > another even though the values are the same. It should also make thin=
gs
> > > obvious that we use different enums.
> > >
> > > Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> > > ---
> > >  .../gpu/drm/display/drm_hdmi_state_helper.c    |  4 +++-
> > >  drivers/gpu/drm/drm_connector.c                | 18 ++++++++++++++++=
++
> > >  include/drm/drm_connector.h                    |  3 +++
> > >  3 files changed, 24 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/driver=
s/gpu/drm/display/drm_hdmi_state_helper.c
> > > index f9aa922d25d3..dc2f32651cb9 100644
> > > --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > > +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> > > @@ -653,9 +653,11 @@ hdmi_compute_config(const struct drm_connector *=
connector,
> > >  				       conn_state->max_bpc,
> > >  				       8, connector->max_bpc);
> > >  	int ret;
> > > +	enum hdmi_colorspace hdmi_colorspace =3D
> > > +		color_format_to_hdmi_colorspace(conn_state->color_format);
> > >
> > >  	ret =3D hdmi_compute_format_bpc(connector, conn_state, mode, max_bp=
c,
> > > -				      HDMI_COLORSPACE_RGB);
> > > +				      hdmi_colorspace);
> > >  	if (ret) {
> > >  		if (connector->ycbcr_420_allowed) {
> > >  			ret =3D hdmi_compute_format_bpc(connector, conn_state,
> >
> > Does it really make sense to have the fallback to YUV420 here? I would
> > expect to get rid of it, or only use that for "auto".
>=20
> I think we should keep both RGB and YUV420 fallbacks, obviously making
> them conditional on the requested color format to avoid redundant
> checks.  E.g. if user-space has a preference on YUV444 which ends up not
> being supported, switch to RGB, unless we're on a YUV420-only mode.

I think some other part of that thread settled on if userspace
explicitly asks for YUV444 and it can't work on the
encoder/bridge/connector/monitor chain, the commit should be rejected,
and it's up to userspace to pick a reasonable fallback.

We've been asked something the kernel can't do, we should report it as
such and not fallback to something transparent to userspace.

For auto though, we should definitely keep the fallback from RGB to
YUV420.

Maxime

--srtwgwxqj4nkk2pr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNvBpwAKCRAnX84Zoj2+
dnVfAXsHRuWL9wRSNw4sPnhcF0snqeWPgxAiCfKJlCWmrzRsAjJzXZ984NwzRkgp
fvj4l/cBgNbwQL8q7kFMs6J8RXESoRYgRGaH4iPLfUOYHcdJethWig3GQNECR9JU
xuo0PZJI/A==
=oJch
-----END PGP SIGNATURE-----

--srtwgwxqj4nkk2pr--
