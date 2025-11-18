Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD95C6844D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D456C10E441;
	Tue, 18 Nov 2025 08:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mv7MwMXE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8501410E43F;
 Tue, 18 Nov 2025 08:47:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2D5F043C88;
 Tue, 18 Nov 2025 08:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C608C4CEF1;
 Tue, 18 Nov 2025 08:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763455660;
 bh=yEkTP6A6Q90tpRw+hIU9f5PDGzIoms5NOyyzk570e7M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mv7MwMXEBBC+7T9ihRJQIKkPOc6iaQhBYeW1nYaeDmYOJL5ZnQeB52Cw7ZaNeHhKX
 wc21OT3XhkgvQ9iJvLBr/Rfq/R+jP1yTWz1eOecsyF//83of5y+aqlgg+rdkaa5Qq2
 OXPxWMJt1xAElsqx1nL2Kz9Cx5DozCS5fMyS17tHnI0HWOA6f5O34/tFDQOOA8fz0v
 a5RvRit+jNo6z2habODLcqzLiikLGlxJdcOnb+U4W/xVskN9PsFGo1wAxK430hrHWP
 l+qJFzK4L7Me0t0zgkaSli5XU60RtSdwiQq8mDYfjxGQDzaSP879G+XGt5DxlrMO+M
 F/R1ivVqPxoOg==
Date: Tue, 18 Nov 2025 09:47:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
 Simona Vetter <simona@ffwll.ch>, xaver.hugl@kde.org,
 Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Harry Wentland <Harry.Wentland@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/amd: Move adaptive backlight modulation property to
 drm core
Message-ID: <o737pxpoq5t62xlvgflhypn67o6d7qohl5zm5ufgtojxlkw4cv@ao6d4gscekny>
References: <20251112222646.495189-1-mario.limonciello@amd.com>
 <83aa8a816cf301085a3e3638238f8fba11053dc2@intel.com>
 <449ee5ba065e1ceee8f7a04038442cff24772df9@intel.com>
 <e934ece8-d70d-44fd-abe6-fcecae8abc85@amd.com>
 <81da4bd8bcf6110145964f0c314dae1ea3046d10@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mcqwv34vtqf6hvad"
Content-Disposition: inline
In-Reply-To: <81da4bd8bcf6110145964f0c314dae1ea3046d10@intel.com>
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


--mcqwv34vtqf6hvad
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/amd: Move adaptive backlight modulation property to
 drm core
MIME-Version: 1.0

On Mon, Nov 17, 2025 at 11:05:10AM +0200, Jani Nikula wrote:
> On Fri, 14 Nov 2025, Mario Limonciello <mario.limonciello@amd.com> wrote:
> > +Xaver
> >
> > On 11/14/2025 2:39 AM, Jani Nikula wrote:
> > <snip>
> >
> >>>
> >>> So this is basically Content Adaptive Brightness Control, but with the
> >>> technology ("backlight" and "modulation") unnecessarily encoded in the
> >>> ABI.
> >>>
> >>> You could have the same knob for adjusting CABC implemented in an OLED
> >>> panel, controlled via DPCD.
> >>>
> >>>> + *
> >>>> + *	sysfs
> >>>> + *		The ABM property is exposed to userspace via sysfs interface
> >>>> + *		located at 'amdgpu/panel_power_savings' under the DRM device.
> >>>
> >>> Err what? Seriously suggesting that to the common ABI? We shouldn't h=
ave
> >>> sysfs involved at all, let alone vendor specific sysfs.
> >>>
> >>>> + *	off
> >>>> + *		Adaptive backlight modulation is disabled.
> >>>> + *	min
> >>>> + *		Adaptive backlight modulation is enabled at minimum intensity.
> >>>> + *	bias min
> >>>> + *		Adaptive backlight modulation is enabled at a more intense
> >>>> + *		level than 'min'.
> >>>> + *	bias max
> >>>> + *		Adaptive backlight modulation is enabled at a more intense
> >>>> + *		level than 'bias min'.
> >>>> + *	max
> >>>> + *		Adaptive backlight modulation is enabled at maximum intensity.
> >>>
> >>> So values 0-4 but with names. I don't know what "bias" means here, an=
d I
> >>> probably shouldn't even have to know. It's an implementation detail
> >>> leaking to the ABI.
> >>>
> >>> In the past I've encountered CABC with different modes based on the u=
se
> >>> case, e.g. "video" or "game", but I don't know how those would map to
> >>> the intensities.
> >>>
> >>> I'm concerned the ABI serves AMD hardware, no one else, and everyone
> >>> else coming after this is forced to shoehorn their implementation into
> >>> this.
> >>=20
> >> Apparently Harry had the same concerns [1].
> >>=20
> > So let me explain how we got here.  At the display next hackfest last=
=20
> > year (2024) we talked about how to get compositors to indicate they wan=
t=20
> > technologies like this to get out the way.  A patch series was made tha=
t=20
> > would allow compositor to say "Require color accuracy" or "Require low=
=20
> > latency" are required.
> >
> > https://lore.kernel.org/amd-gfx/20240703051722.328-1-mario.limonciello@=
amd.com/
> >
> > This got reverted because userspace didn't have an implementation ready=
=20
> > to go at the time.  One was created and so I rebased/resent the series=
=20
> > earlier this year.
> >
> > https://lore.kernel.org/amd-gfx/20250621152657.1048807-1-superm1@kernel=
=2Eorg/
> >
> > Xaver had some change of heart and wanted to talk about it at the next=
=20
> > hackfest.
> >
> > https://lore.kernel.org/amd-gfx/CAFZQkGxUwodf5bW0qQkXoPoz0CFFA1asJfUxFf=
tMGgs5-VK2Hw@mail.gmail.com/
> >
> > So we talked about it again at the hackfest this year and the decision=
=20
> > was not everyone can an octagon into a peg hole, so we're better off=20
> > re-introducing vendor properties for this.  So series was respun per=20
> > that discussion.
> >
> > https://lore.kernel.org/amd-gfx/20250718192045.2091650-1-superm1@kernel=
=2Eorg/
> >
> > Userspace implementation was done and so we merged this for 6.19.
> >
> > https://lore.kernel.org/amd-gfx/CAFZQkGwLWcyS0SqCHoiGsJd5J_u4aBJ0HMV5Bx=
3NknLdLkr8Uw@mail.gmail.com/
> >
> > Then Simona suggested we need to make some changes where the propertye=
=20
> > should be in generic documentation etc:
> >
> > https://lore.kernel.org/amd-gfx/aQUz-mbM_WlXn_uZ@phenom.ffwll.local/
> >
> > So that's where we are now with this patch.  I can clean it up per the=
=20
> > feedback so far - but I think we need to be in agreement that this=20
> > property is actually the way forward or we should revert the property i=
n=20
> > amdgpu instead of this moving approach and keep discussing.
>=20
> IMO we should either
>=20
> - admit we can't do a generic property for this *and* keep the vendor
>   specific property details hidden in drivers, or
>=20
> - figure out a generic property and add that in drm core
>=20
> But I'm pretty much against adding an AMD vendor specific property in
> drm core.

Agreed

Maxime

--mcqwv34vtqf6hvad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaRwyqAAKCRAnX84Zoj2+
djgZAX4uWM8iQp/nyH8zILnMWFvSQW/TJfaxKfj8W0Pj1lhuKqIsVzEPT2UKGW/q
eo5M5/cBgLmiArF80uVPiYfZsuX9V/CVXuTq2OrpNqKAVIokynPmak+mo8VO9DfB
Xn5oRPDkCQ==
=nnpF
-----END PGP SIGNATURE-----

--mcqwv34vtqf6hvad--
