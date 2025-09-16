Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90256B5909B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 10:29:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D0310E2ED;
	Tue, 16 Sep 2025 08:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nd9NS82I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C60010E2ED
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 08:29:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1FC4A60202;
 Tue, 16 Sep 2025 08:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70204C4CEFA;
 Tue, 16 Sep 2025 08:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758011383;
 bh=Rtf8kItdKMX3xexYtdPG8IHVmqvEARJsfDTaNaGRsuU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nd9NS82ID2uzXf3MHSaPtP81ezX48sZ1rUu3YeVkUo/dDASM/4Vp+A+g56h59Om/o
 wZxpYiDVBGX7OSqditGcTJkdoWbtrpk4+O6IDYP+fcnogY/b1QTwm2YuU+iGfMfgRC
 H8qVUiwpzFseYiQzq7tdaD7VWGsPw2wIatS3Hxyn++GPvbpKsExzDduWiGQNlbHrIT
 zUbazox8Dqly6R+/49kluxZtlFHWB7wrPigbmr+jxrbhH3gW9X/16qab5aeep7pshU
 QgwCr6OeLKFU+q/dj21hS56ZV5UKodlK3dnJG6mBAK/XjPettGKT6NP+JdwBy4aAFj
 Uo0whYGopFg4w==
Date: Tue, 16 Sep 2025 10:29:41 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marius Vlad <marius.vlad@collabora.com>, dri-devel@lists.freedesktop.org,
 wse@tuxedocomputers.com, 
 andri@yngvason.is, sebastian.wick@redhat.com, daniel.stone@collabora.com, 
 jani.nikula@linux.intel.com, tzimmermann@suse.de, simona.vetter@ffwll.ch, 
 harry.wentland@amd.com, christian.koenig@amd.com, derek.foreman@collabora.com
Subject: Re: [PATCH 3/8] drm: Add new general DRM property "color format"
Message-ID: <20250916-piquant-jerboa-of-completion-87b80d@houat>
References: <20250911130739.4936-1-marius.vlad@collabora.com>
 <20250911130739.4936-4-marius.vlad@collabora.com>
 <ssvxorsrhum2eo2uiieradrrmytemivr6m5c3mskalehzaj4ci@nc74epxgjq5w>
 <aMMDxIWN9TadgVyw@xpredator>
 <6zmp2dzpvcb4hi4kaa66q5o4rlcpdkor75ci4rnvalt2a37f26@lbmvc4t2ow4z>
 <CAPj87rNxGfroKTf1i5UtmmnZ9wDQTdZFDMKw-MLdbCfjTCD=Uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="rx6mvpnvw4lqpxtd"
Content-Disposition: inline
In-Reply-To: <CAPj87rNxGfroKTf1i5UtmmnZ9wDQTdZFDMKw-MLdbCfjTCD=Uw@mail.gmail.com>
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


--rx6mvpnvw4lqpxtd
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/8] drm: Add new general DRM property "color format"
MIME-Version: 1.0

On Mon, Sep 15, 2025 at 12:33:08PM +0200, Daniel Stone wrote:
> > > > I think that the property should reflect the kernel view on the pos=
sible
> > > > formats, which should be updated during get_modes() (or every time =
EDID
> > > > is being read).
> > >
> > > The property advertises the supported color formats by display driver.
> > > Userspace just filters these out based on what the sink supports. This
> > > could just a policy in the compositor / UI.  There's nothing preventi=
ng
> > > you to force push from those advertised formats.
> >
> > What is the expected behaviour if userspace asks for the colorspace
> > which is supported by the driver but not by the display?
>=20
> Quite possibly just a failure to display. Same as if the driver
> guesses it wrong - including for reasons it can never statically
> detect (e.g. buying a 10m-long uncertified HDMI cable which drops
> signal, or having the cable pulled around a 90=B0 bend making it very
> marginal for transmission).

I guess there's two cases for "not supported by the display"?

If the display reports that it supports a format but is broken, yeah,
there's not much we can do except maybe add a quirk.

But if it's that the monitor doesn't support that format in the first
place, we should just reject that commit.

Just like we don't let any mode go through if we know it's obviously
wrong (like if it exceeds max_tmds_clock) but can't indeed account for a
long / broken cable.

> > > > And that's not to mention that there are enough use-cases where the
> > > > connector doesn't have EDID at all.
> > > Totally. But what would be the expectation in that case? Drivers can
> > > still advertise 'Auto' if they'd like.
> >
> > I'm trying to point out that this complicates userspace: it is now
> > required to handle EDID and non-EDID cases for no practical reason. For
> > all other usecases it is enough to query available modes from the
> > kernel.
>=20
> But not 'now', because that's been happening for years. And not 'no
> practical reason', because in order to support features the kernel has
> no involvement in (colour management and HDR as a large part), you
> need to see the full EDID.

I guess it's still slightly different when we're talking about opt-in
features like VRR or HDR, and "just get something on my screen".

Introducing a dependency on libdisplay-info for the latter is still
something new, but I guess you can always YOLO it, try a format and see
if it works.

Maxime

--rx6mvpnvw4lqpxtd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMkf6AAKCRAnX84Zoj2+
dmL4AX9f+hZHuZiEkC2awES0tFyGhWhiN4EtpzLpe/6/pFhQ4Yt/osOg17o56Xgt
VdzYvusBf3x+wnGcfWaxwePg199oVlcdin0JWzOhYpx4bcApwSd+Hg53vFGarHEz
W7et8hc1ng==
=q1SN
-----END PGP SIGNATURE-----

--rx6mvpnvw4lqpxtd--
