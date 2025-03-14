Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510EEA60A71
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 08:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EA610E9AF;
	Fri, 14 Mar 2025 07:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tRnLHyCO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B8110E1BE;
 Fri, 14 Mar 2025 07:53:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 70B425C58E2;
 Fri, 14 Mar 2025 07:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71238C4CEE3;
 Fri, 14 Mar 2025 07:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741938816;
 bh=E57EmoFkwByfZ3+/wk75Rb5J/TWgAJzeL4fRLvNge9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tRnLHyCONL3aSgwFtn9Jn12yhwLumtCwhA8LxyNyZYzC/R8lRNO953v11ZhB52yMY
 /w7eIwJtYVN0l7Oq/woKCtE62elLarU+ihZL+oHJ96Exq8CdcJLhOqN9fY8d1aaBav
 AfE3jD+IxMB3T59byaiJQ4DTb/9bx+nPm7GlhD63IRoii0UBYLfbeqBia4dz2sxNYj
 MpL7xCZwt49Si4UOpBezHTTseH0SmJZDWDI3pBRvjP8wmohHyr8wIuNJvvajx3hVbj
 1+UST4Xfo+ELRmDTQgVXjm+wqIx20hsFhEZiESS7OsBg5No0SY6NltnqL5KBe7r2ZF
 rOTK4kJuk0MHQ==
Date: Fri, 14 Mar 2025 08:53:34 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Hermes Wu <Hermes.wu@ite.com.tw>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 2/2] drm/msm/dp: reuse generic HDMI codec implementation
Message-ID: <20250314-stereotyped-cerise-hare-cafb0e@houat>
References: <20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org>
 <20250307-dp-hdmi-audio-v5-2-f3be215fdb78@linaro.org>
 <20250310-daft-bittern-of-foundation-67c657@houat>
 <CALT56yMSs7K_0b5YtkCW5Ypyt9Hu_YLkitFFJwTtBkwUJk-NHA@mail.gmail.com>
 <20250311-vivid-almond-elk-83fda5@houat>
 <ecw5wdvkf2iqwxvigze374q3lb3esqbokv43mkblbnpfmudutu@e75i4lqhuux7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nv7qm2xacwdttobt"
Content-Disposition: inline
In-Reply-To: <ecw5wdvkf2iqwxvigze374q3lb3esqbokv43mkblbnpfmudutu@e75i4lqhuux7>
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


--nv7qm2xacwdttobt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/2] drm/msm/dp: reuse generic HDMI codec
 implementation
MIME-Version: 1.0

On Tue, Mar 11, 2025 at 05:58:19PM +0200, Dmitry Baryshkov wrote:
> On Tue, Mar 11, 2025 at 09:41:13AM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Mar 10, 2025 at 08:53:24PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, 10 Mar 2025 at 17:08, Maxime Ripard <mripard@kernel.org> wrot=
e:
> > > >
> > > > On Fri, Mar 07, 2025 at 07:55:53AM +0200, Dmitry Baryshkov wrote:
> > > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > >
> > > > > The MSM DisplayPort driver implements several HDMI codec functions
> > > > > in the driver, e.g. it manually manages HDMI codec device registr=
ation,
> > > > > returning ELD and plugged_cb support. In order to reduce code
> > > > > duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connect=
or
> > > > > integration.
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/Kconfig         |   1 +
> > > > >  drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++------------------=
--------------
> > > > >  drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
> > > > >  drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
> > > > >  drivers/gpu/drm/msm/dp/dp_display.h |   6 --
> > > > >  drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
> > > > >  6 files changed, 31 insertions(+), 170 deletions(-)
> > > > >
>=20
> [...]
>=20
> > > > >
> > > > >  static int msm_edp_bridge_atomic_check(struct drm_bridge *drm_br=
idge,
> > > > > @@ -320,9 +324,13 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp=
_display, struct drm_device *dev,
> > > > >        */
> > > > >       if (!msm_dp_display->is_edp) {
> > > > >               bridge->ops =3D
> > > > > +                     DRM_BRIDGE_OP_HDMI_AUDIO |
> > > > >                       DRM_BRIDGE_OP_DETECT |
> > > > >                       DRM_BRIDGE_OP_HPD |
> > > > >                       DRM_BRIDGE_OP_MODES;
> > > > > +             bridge->hdmi_audio_dev =3D &msm_dp_display->pdev->d=
ev;
> > > > > +             bridge->hdmi_audio_max_i2s_playback_channels =3D 8;
> > > > > +             bridge->hdmi_audio_dai_port =3D -1;
> > > > >       }
> > > >
> > > > I think I'd prefer the toggle to be OP_DP_AUDIO, even if the
> > > > implementation is exactly the same. That way, we'll be able to cond=
ition
> > > > it to the DP support when that arrives, and we have the latitude to
> > > > rework it to accomodate some DP subtleties without affecting the dr=
ivers
> > > > later on.
> > >=20
> > > I don't think that there is a point in having OP_DP_AUDIO. There is
> > > not so much difference in the driver. Also currently OP_HDMI_AUDIO
> > > follows existing approach (which was pointed out by Laurent) - that
> > > OP_foo should guard a particular set of callbacks. From this
> > > perspective, OP_HDMI_AUDIO is fine - it guards usage of
> > > hdmi_audio_foo(). OP_DP_AUDIO would duplicate that.
> >=20
> > HDMI and DP are two competing standards, with different governing
> > bodies. I don't think either have claimed that they will strictly adhere
> > to what the other is doing, and I don't have the will to cross-check
> > every given audio feature in both HDMI and DP right now.
>=20
> Hmm. Currently (or before the first hdmi_audio patchset) everybody has
> been plumbing hdmi-codec directly from the driver (even for DP audio).

We also didn't have an infrastructure for that before, so it's to be
expected.

> > However, I think we should really have the flexibility to deal with that
> > situation if it happens, and without having to do any major refactoring.
> > That means providing an API that is consistent to the drivers, and
> > provides what the driver needs. Here, it needs DP audio support, not
> > HDMI's.
>=20
> Would OP_HDMI_CODEC be a better name for the OP? (we can rename the
> existing callbacks to be hdmi_codec instead of hdmi_audio too).

As said on your first patch, there's more to it than just the codec, so
no, the current name is fine to me.

> > How we plumb it is an implementation detail, and I do agree we can use
> > the same functions under the hood right now. But the driver is a DP
> > driver, it wants DP infrastructure and DP audio support.
>=20
> Would OP_DP_AUDIO require a different set of callbacks on the bridge
> level?

Yes.

> I don't want to end up with too much of duplication. Maybe we
> should the cdns bridges which implement both HDMI and DP functionality
> IIRC.

We can (and we should) take the same prototype for both though, so
drivers that have the same implementation can provide the same
implementation to both.

Maxime

--nv7qm2xacwdttobt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9PgfQAKCRAnX84Zoj2+
dlg0AX0TLk3raLgdYI+leZ/c22M1sG07wy1DwoF9VD0O7TWGByRbduojj7cpippQ
V/umvOUBegI5QjgCoTNWCpiYr1txJAAYhEf5VBHroBDcxS1WnXtvCSiXNQ/aI6fO
3KIjq3U07A==
=FdgA
-----END PGP SIGNATURE-----

--nv7qm2xacwdttobt--
