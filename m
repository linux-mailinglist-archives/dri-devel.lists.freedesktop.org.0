Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AFFC8E07
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 18:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758D66E845;
	Wed,  2 Oct 2019 16:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574F36E090;
 Wed,  2 Oct 2019 16:14:24 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q17so20351253wrx.10;
 Wed, 02 Oct 2019 09:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=clnrHc2FqQeyvM5p9QplIZn6WhBDH0K8OpYG24c2swQ=;
 b=STkf5zvabS6W8ILFL9M/bz0/4o25QGbWGadHOvvrf6QJTr5yV9O3b64X0E+VGHbTi6
 oCcnzk4vidtE21dvz17QHrInZWyJSsXB7zmIIik7EIS1Mh7fnoosTm9/EpUdmIdg0Etu
 +PNqoutouDFB6fa1CSruaGuGhMkT3cX6Uputso/M9cWFWoRcSrVg3rKmDgYgh7/ZaSk6
 oRZK+LCiFB5VEVqCaHRFwRDxlPR0vzeiuEWXrC2uup0uigE5qzleGGvEX4ya7mhrDC20
 mA7cXjZAUen0TRGpvEoMxHHxvxJOjb7ZWhI8jhnJnqyhEmPq07A7cYrjACCgMRNFH2AR
 tVPg==
X-Gm-Message-State: APjAAAVZuZ9ellD+07Pre6N7P8hUO4W/3Cr2xNtFKghP6T4hmFCOAt1G
 lYQ+PI5shwKtBE31UMJsHr0=
X-Google-Smtp-Source: APXvYqzxkZkUF7c0W9lU03LtXU83GgWs7tU7+p6boogyGV/cFnNwglRB3UqN2g4HTeKf8NcLfJL4uw==
X-Received: by 2002:a5d:630d:: with SMTP id i13mr3317303wru.230.1570032862552; 
 Wed, 02 Oct 2019 09:14:22 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id h10sm5834973wrq.95.2019.10.02.09.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 09:14:20 -0700 (PDT)
Date: Wed, 2 Oct 2019 18:14:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 00/21] drm/dp: Various helper improvements and cleanups
Message-ID: <20191002161419.GA225899@ulmo>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
 <20190920160004.GE10973@ulmo> <87sgont8zx.fsf@intel.com>
 <20190923145202.GA21884@ulmo>
MIME-Version: 1.0
In-Reply-To: <20190923145202.GA21884@ulmo>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=clnrHc2FqQeyvM5p9QplIZn6WhBDH0K8OpYG24c2swQ=;
 b=kwRIAdOBYol0Qm/TQZa0ZbnNOMvqWoRDgz8d8+/MtxvJ7V144A4HtAP3FXcMTmbFj3
 xTDsuBMPZsBYQ7gEAwoTyrmzAdkt2GtvGI3+XjHRdpuf/pFCAL/kurs/9SeW4Koadwsd
 g61mGsmj7lNFSayxRcpVMhVG1Dpd2XKSWOeiaPAWLgUV0iKx/0G1P5VHgZLogkCXYM4l
 f7y49etisufyNvdvg7Tac4PLB08/WpjRS7gqYJ9oFUVVLK09tQgVrlZkA297lydzCqUe
 8hCEdij0sIvZC4ZLCcGoOQw4rzi0R+iakED+OqZEEeJh7qB5n6/+dE/XvjGub+3zTWEk
 DTjw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gfx@lists.freedesktop.org, Harry Wentland <hwentlan@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1821228035=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1821228035==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2019 at 04:52:02PM +0200, Thierry Reding wrote:
> On Mon, Sep 23, 2019 at 04:52:50PM +0300, Jani Nikula wrote:
> > On Fri, 20 Sep 2019, Thierry Reding <thierry.reding@gmail.com> wrote:
> > > On Mon, Sep 02, 2019 at 01:31:00PM +0200, Thierry Reding wrote:
> > >> From: Thierry Reding <treding@nvidia.com>
> > >>=20
> > >> Hi,
> > >>=20
> > >> this series of patches improves the DP helpers a bit and cleans up s=
ome
> > >> inconsistencies along the way.
> > >>=20
> > >> v2 incorporates all review comments add collects Reviewed-bys from v=
1.
> > >>=20
> > >> Thierry
> > >>=20
> > >> Thierry Reding (21):
> > >>   drm/dp: Sort includes alphabetically
> > >>   drm/dp: Add missing kerneldoc for struct drm_dp_link
> > >>   drm/dp: Add drm_dp_link_reset() implementation
> > >>   drm/dp: Track link capabilities alongside settings
> > >>   drm/dp: Turn link capabilities into booleans
> > >>   drm/dp: Probe link using existing parsing helpers
> > >>   drm/dp: Read fast training capability from link
> > >>   drm/dp: Read TPS3 capability from sink
> > >>   drm/dp: Read channel coding capability from sink
> > >>   drm/dp: Read alternate scrambler reset capability from sink
> > >>   drm/dp: Read eDP version from DPCD
> > >>   drm/dp: Read AUX read interval from DPCD
> > >>   drm/dp: Do not busy-loop during link training
> > >>   drm/dp: Use drm_dp_aux_rd_interval()
> > >>   drm/dp: Add helper to get post-cursor adjustments
> > >>   drm/dp: Set channel coding on link configuration
> > >>   drm/dp: Enable alternate scrambler reset when supported
> > >>   drm/dp: Add drm_dp_link_choose() helper
> > >>   drm/dp: Add support for eDP link rates
> > >>   drm/dp: Remove a gratuituous blank line
> > >>   drm/bridge: tc358767: Use DP nomenclature
> > >
> > > Anyone interested in reviewing these?
> >=20
> > Thierry, I don't quite know how to put this nicely, but I also don't
> > think it's nice to not reply at all. So I'll try to be fair but it'll be
> > blunt. Fair enough?
>=20
> Fair enough.
>=20
> > I've glanced over the series, already before you pinged for reviews. It
> > looks like you've put effort into it, and it all looks nice. However, it
> > does not look like we could use this in i915, without significant effort
> > both on top of this work and in i915. It does not feel like there's any
> > incentive for us to review this in detail.
> >=20
> > It also feels like there's an increasing disconnect between "small" and
> > "big" drivers (*) when it comes to handling DP link and training. It
> > scares me a bit that this work is being done on the terms of the "small"
> > drivers, and that later in time this might be considered the One True
> > Way of handling DP.
>=20
> I'm not sure I understand your concern here. The goal of the series is
> primarily to extend the existing support for DP. It follows the pattern
> established by existing helpers and then goes one step further and
> provides some common way of actually storing the values that are being
> read from the sink so that they can be used.
>=20
> These are meant to be helpers and in no way should anyone feel obliged
> to use them. If you've got this all figured out already, great! If you
> do this already much better in i915, by all means stay away from this.
>=20
> At the same time it seems counter-productive to write all of this code
> as part of the Tegra DRM driver. In my opinion subsystems should provide
> generic helpers that can help multiple drivers share code. This is
> especially true for things that are defined in a specification because
> there's not a lot of room for interpretation. The helpers in these
> patches are meant to be that kind of helpers.
>=20
> > One of the technical observations is that you fill the struct
> > drm_dp_link and struct drm_dp_link_caps from the sink. It's not clear
> > that the link caps really are an intersection of the source and sink
> > caps. The eDP 1.4 link rates are the prime example. I think you should
> > have sets of source and sink rates, and you should intersect those to
> > find out the available link rates. The max rate is the highest number in
> > that set. Similarly for many things, like training pattern support. I
> > think it's only going to get more complicated with DP 2.0.
>=20
> The idea here was to provide only helpers to collect the DPCD data
> defined by the specification. Anything specific to the source is meant
> to be handled by display driver. In case of eDP 1.4 link rates the code
> will only add the rates read from DPCD. It's up to the driver to filter
> out rates that it doesn't support from that list.
>=20
> I think the fact that things will keep getting more complicated is an
> argument in favour of sharing code rather than keep doing the same
> (complicated) thing over and over again in every driver.
>=20
> > Another pain point is the caching of the caps as bits in
> > drm_dp_link_caps. How far are you going to take it? There's an insane
> > and growing amount of things in the DPCD that describe the link in one
> > way or another. Should they all be added to caps? Where do you draw the
> > line? Do we add both the bit and the helper for getting that bit from
> > the DPCD? And are you then going to add support for intersecting all
> > those cap bits between the source and the sink?
>=20
> Like I said the primary goal here is to have common code to read the
> common values from DPCD. Once the link has been "probed" it is up to the
> driver to do whatever it wants with that data.
>=20
> Originally I had intended this shared code to do much more, but this was
> shot down during review (I think by Daniel and yourself) for many of the
> same reasons that you're pointing out. Initially there was code in this
> series to standardize the link training sequence, for example. This was
> all strictly according to the specification, so I thought that would
> give us enough common ground for shared code. But you guys didn't agree,
> so I've moved that out into Tegra specific patches since then.
>=20
> As for how far to take this, I think the most sensible is to do what we
> do everywhere else. We add to this whatever is needed on an on-demand
> basis. The current series here adds what I found to be necessary to
> support DP on Tegra. There's not a lot of fancy stuff here, I know, but
> that doesn't mean this code is useless for everyone else.
>=20
> So, can i915 use this? Probably yes. Would that be a good idea? Probably
> not. And that's perfectly fine. But I could imagine that others may very
> well want to use some shared code to avoid having to copy/paste code and
> then later fix up cargo-culted bugs in every driver.
>=20
> I'm also fully aware that this is not a lot and it may not be perfect.
> But most helpers aren't initially. The point here is to start collecting
> the common bits in one location and evolve them, just like we do for so
> many other helpers.
>=20
> Note also that I haven't made any attempt here to convert any drivers to
> these helpers. That's because these are meant to be opt-in to simplify
> drivers. If you want to do everything yourself, feel free to do that. It
> is perfectly legit to do everything yourself if these helpers aren't
> flexible enough to do what you want. The better option would be to help
> improve the helpers to make them work for a wider range of drivers, but
> if you don't want to, then don't.
>=20
> > Overall I think there is value in unifying how we handle DP in drm. Even
> > if just by providing helpers to simplify things in drivers. It's just
> > that I feel this series isn't taking us closer to that goal, except for
> > a subset of drivers. In the big picture, it may be increasing the
> > divide.
>=20
> So the bulk of this series is stuff that's purely parsing values from
> DPCD, which is very much in line with existing helpers. I don't think
> those are in any way contentious. There's also a bit of cleanup here
> where new helpers are used to simplify existing ones. Maybe a handful
> of these patches are what you claim might be "increasing the divide".
>=20
> But I really don't understand where this is coming from. i915 doesn't
> use a myriad of the other helpers (TTM, CMA, simple KMS, ...) and yet
> these are not increasing any divide, are they? Why do you think these
> helpers here are different?
>=20
> Again, if you've got all of this implemented in i915 (or any of the
> other "big" drivers), you probably want to stay away from these. But
> does that mean everyone else has to go and figure all of this out from
> scratch? Shouldn't we at least attempt to write common code? Or should
> we all go and write our own DP stacks like the big drivers? I don't see
> any advantage in that.
>=20
> > If we get a confirmation from our drm overlords that drivers doing
> > things the way they see fit in this regard is fine, then I'm okay with
> > this. But I'm definitely not committing to switching to using the
> > drm_dp_link structures and helpers in i915, quite the opposite actually.
>=20
> I don't think anyone's going to force you to convert to the drm_dp_link
> helpers if you don't want to. It's definitely not my intention to make
> this "The One And Only Way To Do DP in DRM". The goal here is to create
> helpers that can simplify adding DP support.
>=20
> Now, if everyone else thinks the drm_dp_link helpers are a bad idea, I
> will get over it and move this into Tegra code. But since we're being
> blunt, I'd like to get a third (and ideally fourth) opinion on whether
> we really want this stuff to be reinvented in every driver or whether
> we want to try and come up with something that works for more than one
> driver.
>=20
> Thierry
>=20
> > BR,
> > Jani.
> >=20
> >=20
> > (*) Please don't read too much into "small" and "big", just two groups
> > of drivers handling things differently.

Dave, Daniel,

how can we make progress on this? Is it okay to go forward with this
series if we agree that it's not going to be required for drivers to
adopt it if they already have a working DP implementation?

If we can't agree on the struct drm_dp_link helpers, perhaps I should go
and at least merge the additional DPCD parsing helpers. Those are very
much in line with existing helpers. I could then move the drm_dp_link
helpers into the Tegra driver and add replacement code to the other
drivers that already use struct drm_dp_link. It'd be a shame to
duplicate the code, but I'm willing to invest that additional work so
that I can finally make progress on this series and the Tegra DP support
that depends on this.

Thierry

> >=20
> >=20
> >=20
> >=20
> > >
> > > Thierry
> > >
> > >>=20
> > >>  drivers/gpu/drm/bridge/tc358767.c      |  22 +-
> > >>  drivers/gpu/drm/drm_dp_helper.c        | 327 ++++++++++++++++++++++=
---
> > >>  drivers/gpu/drm/msm/edp/edp_ctrl.c     |  12 +-
> > >>  drivers/gpu/drm/rockchip/cdn-dp-core.c |   8 +-
> > >>  drivers/gpu/drm/rockchip/cdn-dp-reg.c  |  13 +-
> > >>  drivers/gpu/drm/tegra/dpaux.c          |   8 +-
> > >>  drivers/gpu/drm/tegra/sor.c            |  32 +--
> > >>  include/drm/drm_dp_helper.h            | 124 +++++++++-
> > >>  8 files changed, 459 insertions(+), 87 deletions(-)
> > >>=20
> > >> --=20
> > >> 2.22.0
> > >>=20
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >=20
> > --=20
> > Jani Nikula, Intel Open Source Graphics Center



--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2UzNkACgkQ3SOs138+
s6Fizg/+MaxNzaZZITwj+PuhV6V+TeJ+HAQ9IW1klNCQJQxqeNMRkyNURPSeps7a
tJjwlfi8bhAu1rpmEySN15Eo6da9EQUOfLnQuzm0rGsnFUAxCUW9jXAqUlc7nmKH
9lnOan3pq5c2hde/ASJwdYAuhvSRXLTKDdwYNMJGps0H7MKSIA2aWwtyZvlaw+TY
gbjzyr4oUJbs0ikxgbcTU6yw2mjZ0SBu8aW6uAoH0w1QNZETLeiXOWboCmGA2/tS
T8P3t7wk4q3mpUA04+OO5JU9ub+v4aY5fVo7tpeFzaslH5ju9Lypmbnf3xqHliCs
3jONUF7O9cK1Emb8Z4bfUIpybF9c+k6ap2j5RZL0lhYkZZo02BpXuMyeGEWmwpXF
wzveSwqdYs4/nNNQp0D6l/pKqtB3OOrQ0GM/f5fRa4FYvffwo5faGoU60/bTkW5r
HOMlCIXB92WAOqJPO0uT9ENlyO5sOkKCkuLuFkngalZ9XoUlNfxQM04+bVNJlJQ8
P7j6X63ZZaY0DBH76sE9V5723UDQjqmos0vkDwWf6QQabmeAhoWmLWABAknX2Uvf
Iu0GCCti44hBcyF8DKcIaW+t2mJJqmEQo6WzL0kLKg3Awy2d6dObixZNh0qvAdKz
4e5NdQlc6Hd3gI+yQ9RT3tx6Q8/ErGxkdeExQyY+nw3LZxCys0c=
=hvRP
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--

--===============1821228035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1821228035==--
