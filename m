Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42982782B1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 10:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9648A6E3F4;
	Fri, 25 Sep 2020 08:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF20A6E3F4;
 Fri, 25 Sep 2020 08:24:51 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b22so1817874lfs.13;
 Fri, 25 Sep 2020 01:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=kWLGofJtx8gJw5I7qvgPtCcsq/nSR9Q6u7xcp+xmI7A=;
 b=eBVViVJv+yzYj4CBMRvivzGlZaF9elIKqgcByJI7m8mUEIrJSYpjiBZpW7/dxVpgi6
 +fZqI0sJm0X1cDolFOjvTHHjRBgZL85vp43qENqbdcV+/2EBVEROt1jOPCiJHzLvIArE
 r59uYP2K0Rhy1apL96gq0v2UZ+AppWJwMnoldx7RqvFiy4CfezwZJCZ1sW+6dsTtjJlc
 w4K2uMolTOoCabABFvTAB/rfMC9cFtBguX/K6XhmioWKXeFFYXWCfPgRr/sEG8KLyVhD
 M/W0cP9fV2gDq9qlx1ZuoWs0rqP+nFSi4ZATIEEHnwTIjEwmYa0Rv2emTizzK56TIhSg
 62Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=kWLGofJtx8gJw5I7qvgPtCcsq/nSR9Q6u7xcp+xmI7A=;
 b=IU2him65hGuORkQpcrSqsQ8Y/Uu1WZdUsoAVDfyFo3xPqxXgP4E32nbz4M+DdVB3pw
 5Qmr+GybkXrL0OVNvg3eee1Sz60yhb9fatogAjmJ0SLH0UL49+nKEYJWhNX2Fs+A+lvp
 0fO6Fg3CYS62YOQ6CrtzJrCpdj7hp8JtwiLOTxMz61Fcpehr5fOSLaEfknptMrMkT2uR
 su6lUqstgw32QNpdR4PSEJRscmCeTx9S3WKdXOy2sBHaF5HhEk9nDwnaBaXThourlHIb
 WRZBOGbfdguTEl88Fzr1gUIpQhE1ihxh6sL0vo6Ma48fbLEL4uk9uiPpClZotoiqMYQc
 9pPQ==
X-Gm-Message-State: AOAM531LJoz1PI5PinjOmsQ1g0hhinwkGT9uMPXRNu7QtyHs2zKXGpDI
 Qmejx/lqx8Ih80K3sY2X0bs=
X-Google-Smtp-Source: ABdhPJxZfSdwl3MrD5R4vjvzYsYghlo3qQD8d3GrcACREW26KrUhLHU6ObeuCO7TugeA759eChERpQ==
X-Received: by 2002:a19:bed2:: with SMTP id o201mr967722lff.134.1601022290328; 
 Fri, 25 Sep 2020 01:24:50 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 13sm1671554lfn.239.2020.09.25.01.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 01:24:50 -0700 (PDT)
Date: Fri, 25 Sep 2020 11:24:46 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/atomic: document and enforce rules around
 "spurious" EBUSY
Message-ID: <20200925112446.1b3cb2c8@eldfell>
In-Reply-To: <20200923151852.2952812-1-daniel.vetter@ffwll.ch>
References: <20200923105737.2943649-1-daniel.vetter@ffwll.ch>
 <20200923151852.2952812-1-daniel.vetter@ffwll.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0432015221=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0432015221==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NxmQzQUN.y=c0IZLob8JFR+"; protocol="application/pgp-signature"

--Sig_/NxmQzQUN.y=c0IZLob8JFR+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Sep 2020 17:18:52 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> When doing an atomic modeset with ALLOW_MODESET drivers are allowed to
> pull in arbitrary other resources, including CRTCs (e.g. when
> reconfiguring global resources).
>=20
> But in nonblocking mode userspace has then no idea this happened,
> which can lead to spurious EBUSY calls, both:
> - when that other CRTC is currently busy doing a page_flip the
>   ALLOW_MODESET commit can fail with an EBUSY
> - on the other CRTC a normal atomic flip can fail with EBUSY because
>   of the additional commit inserted by the kernel without userspace's
>   knowledge
>=20
> For blocking commits this isn't a problem, because everyone else will
> just block until all the CRTC are reconfigured. Only thing userspace
> can notice is the dropped frames without any reason for why frames got
> dropped.
>=20
> Consensus is that we need new uapi to handle this properly, but no one
> has any idea what exactly the new uapi should look like. Since this
> has been shipping for years already compositors need to deal no matter
> what, so as a first step just try to enforce this across drivers
> better with some checks.
>=20
> v2: Add comments and a WARN_ON to enforce this only when allowed - we
> don't want to silently convert page flips into blocking plane updates
> just because the driver is buggy.
>=20
> v3: Fix inverted WARN_ON (Pekka).
>=20
> v4: Drop the uapi changes, only add a WARN_ON for now to enforce some
> rules for drivers.
>=20
> v5: Make the WARNING more informative (Daniel)
>=20
> v6: Add unconditional debug output for compositor hackers to figure
> out what's going on when they get an EBUSY (Daniel)

... gmail workaround ...

> ---
>  drivers/gpu/drm/drm_atomic.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 58527f151984..f1a912e80846 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -281,6 +281,10 @@ EXPORT_SYMBOL(__drm_atomic_state_free);
>   * needed. It will also grab the relevant CRTC lock to make sure that th=
e state
>   * is consistent.
>   *
> + * WARNING: Drivers may only add new CRTC states to a @state if
> + * drm_atomic_state.allow_modeset is set, or if it's a driver-internal c=
ommit
> + * not created by userspace through an IOCTL call.
> + *
>   * Returns:
>   *
>   * Either the allocated state or the error code encoded into the pointer=
. When
> @@ -1262,10 +1266,15 @@ int drm_atomic_check_only(struct drm_atomic_state=
 *state)
>  	struct drm_crtc_state *new_crtc_state;
>  	struct drm_connector *conn;
>  	struct drm_connector_state *conn_state;
> +	unsigned requested_crtc =3D 0;
> +	unsigned affected_crtc =3D 0;
>  	int i, ret =3D 0;
> =20
>  	DRM_DEBUG_ATOMIC("checking %p\n", state);
> =20
> +	for_each_new_crtc_in_state(state, crtc, old_crtc_state, i)
> +		requested_crtc |=3D drm_crtc_mask(crtc);

Is "old crtc state" the state that userspace is requesting as the new
state?

> +
>  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane=
_state, i) {
>  		ret =3D drm_atomic_plane_check(old_plane_state, new_plane_state);
>  		if (ret) {
> @@ -1313,6 +1322,26 @@ int drm_atomic_check_only(struct drm_atomic_state =
*state)
>  		}
>  	}
> =20
> +	for_each_new_crtc_in_state(state, crtc, old_crtc_state, i)
> +		affected_crtc |=3D drm_crtc_mask(crtc);

And after driver check processing, the "old crtc state" has been
modified by the driver to add anything it will necessarily need like
other CRTCs?

What is "new state" then?

> +
> +	/*
> +	 * For commits that allow modesets drivers can add other CRTCs to the
> +	 * atomic commit, e.g. when they need to reallocate global resources.
> +	 * This can cause spurious EBUSY, which robs compositors of a very
> +	 * effective sanity check for their drawing loop. Therefor only allow
> +	 * drivers to add unrelated CRTC states for modeset commits.
> +	 *
> +	 * FIXME: Should add affected_crtc mask to the ATOMIC IOCTL as an output
> +	 * so compositors know what's going on.
> +	 */
> +	if (affected_crtc !=3D requested_crtc) {
> +		DRM_DEBUG_ATOMIC("driver added CRTC to commit: requested 0x%x, affecte=
d 0x%0x\n",
> +				 requested_crtc, affected_crtc);
> +		WARN(!state->allow_modeset, "adding CRTC not allowed without modesets:=
 requested 0x%x, affected 0x%0x\n",
> +		     requested_crtc, affected_crtc);
> +	}

This hunk looks good to me.


Thanks,
pq

> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_atomic_check_only);


--Sig_/NxmQzQUN.y=c0IZLob8JFR+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9tqU4ACgkQI1/ltBGq
qqdUtg/9GUT1bnbjaI4t1/O/KODLbTdQsEnShUJ8Qb6scwve07BMwEutyzhLQhjj
n1wIKG2fsyIy+WWz4hWm2VaRjNyXbYQLyc7yFcAPOMD8wd/cF1x/x3YaT8R5dYbW
ohjp+ZlvQqnpaqRIEhgLrDiwtxIR7wpIYAlA6G9lXtYxvNVIB1xk2jYVe0wxzSfx
g+z+qm2B5zpjQO0PGc9c6XwOnwIQlNXsZTRNxWLFShxx0Ulm9vMqNxUKuiW6H+/b
TAl9/LivTNXCqCt2DGQKjXcQAevnClbFpVwQhZ3s3C5gd/Q7QGUaXeEFLCWJtQdr
tggy/U6IxmP5j+AHMCvNnrNjtvPczKprC8tjM8wX0uSNbPInKCm+2DCwxWBChnaL
6wOiKkKuPbFZlbMqYDtVbgCz6t42+XMtfJNyR66tMaWWX+788/JAqR2tcPe3e5Cj
1/cB/iyVA3jS3bl+mq00VvMBQAwDtINxnykqDYSFVKa2qYX3VO76DheYD2HK0f52
UWbLsCUN/9wrI4VoZW2idwpFz2YKKJwX/8K0qm4AOnBb2OIImof9mTfUFX9+6+ri
BYqvbBzYBttMgpRMtx+HU161IESWhB++P8dikvdYkyWP+ly1WQLRmJJl+IHACv5i
PSAT6Cnp1VQ22oHq1WVWX/F2fDb6tAdt69OnXiPILumFlms8uic=
=ynGy
-----END PGP SIGNATURE-----

--Sig_/NxmQzQUN.y=c0IZLob8JFR+--

--===============0432015221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0432015221==--
