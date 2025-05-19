Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF30ABC3C0
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 18:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 769EC10E260;
	Mon, 19 May 2025 16:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jc3/adoR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C8210E260
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 16:05:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AECB943501;
 Mon, 19 May 2025 16:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35439C4CEE4;
 Mon, 19 May 2025 16:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747670731;
 bh=AUke/NWSRLIRn7SoKvI956go9bNucVyPQKWPXFtUZeA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jc3/adoRxZirOIHN5H/K6ZNn0Yg5CAjsdamiscbNe77qxdu0FqWSQWERU3b+1dTtj
 pTl4QEPbKD0azl2uEt/zzqWMNG/3tPAhbrEdyBFoHwWl9B4BrwbFWaYjGBhYzo8oPH
 UOrSHi++ymFM2oxgSHiHoJy98rmC3JPJoy+5NZa3jlDqlTavFp22cilF/b/wwbOOK4
 zIeRRizmsOATFg8Qj6OAQzuwWNd9GDDOv5PHWnGQ13pLitCzHhUuCUrl4spd7mbyF0
 qWEuRBmaaljv2nE4ON8aEJbafg2zOT5OR6Nz/hcrSMNU62E7opaTcJ6eEJm8mCgUNr
 TNaAQbuNTCsAg==
Date: Mon, 19 May 2025 18:05:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
Message-ID: <20250519-singing-silent-stingray-fe5c9b@houat>
References: <87y0vkw8ll.fsf@intel.com>
 <20250429-benign-sidewinder-of-defense-6dd4d8@houat>
 <87o6wfwcef.fsf@intel.com>
 <20250505-slim-bizarre-marten-a674ac@houat>
 <CAN9Xe3RLazpAXdxxJmyF2QAShDtMSgdoxMdo6ecdYd7aZiP9kA@mail.gmail.com>
 <874ixvtbxy.fsf@intel.com>
 <20250509-rapid-flounder-of-devotion-6b26bb@houat>
 <87r00yj6kv.fsf@intel.com>
 <molexnyjkiryvhetfdc66gmzecrf6f7kxl656qn46djdkixrkb@fdgnp5hispbf>
 <875xi3im1r.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="44ortngatcuhoot2"
Content-Disposition: inline
In-Reply-To: <875xi3im1r.fsf@intel.com>
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


--44ortngatcuhoot2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/4] drm/panel: Add refcount support
MIME-Version: 1.0

On Wed, May 14, 2025 at 12:22:40PM +0300, Jani Nikula wrote:
> On Tue, 13 May 2025, Maxime Ripard <mripard@kernel.org> wrote:
> > Is it really surprising you get some pushback when you are using a
> > design that is the complete opposite to what every user of it for the
> > last decade has been doing?
>=20
> The opposite is also true.
>=20
> If you create a design that does not cleanly fit the model of the
> biggest drivers in the subsystem, and expect massive refactors just for
> the sake of conforming to the design to be able to use any of it, you'll
> also get pushback.

That's the thing though: i915 deviates pretty heavily from the helpers,
in general. If it wants to consume them, then it must also be ready to
make some adjustments. Or just roll its own thing like it has done in
the past.

Otherwise, where do we draw the line when anyone isn't happy with the
helpers in general and ask for an exception because reworking the driver
is too much work?

We did this on pretty much every ARM platform, we did this for amdgpu,
but somehow i915 should get a pass?

On what ground? What should we tell the next driver that uses the same
argument?

> > This one is usable, but you rule out the way you could use it.
>=20
> I think you're off-hand and completely dismissing the amount of work it
> would be. And still I'm not even ruling it out, but there has to be a
> way to start off in small incremental steps, and use the parts that
> work. And it's not like we're averse to refactoring in the least,
> everyone knows that.

I'm not sure how pointing fingers at who has the right design,
overlooked some hypothetical usages 10y down the line, or is being
offhand helps the conversation in any way.

I've been asking questions to understand what you could work with, and
some are still left unanswered, and had to ask others multiple times to
get an answer.

And maybe I do indeed underestimate the amount of work it would take. I
don't believe so, and I still believe that it wouldn't be too hard. But
maybe you're right. You still haven't explained why it would take
anything more than registering a dumb device at probe time though.

> > I guess it's clear now that you won't consider anything else. I wonder
> > why you started that discussion in the first place if you already have
> > a clear mind on how to get things moving forward.
>=20
> I pointed out what I think is a bug in drm_panel, with nothing but good
> intentions, and everything snowballed from there.
>=20
> There has to be a middle ground instead of absolutes. Otherwise we'll
> just end up in deeper silos. And more arguments.

I believe calling drm_panel_init would be a middle ground, if we add a
bunch of warnings, checks here and there and move things around a bit.
But to keep it, we do need a good reason for it, even more so if we
don't have any in-tree users anymore.

Maxime

--44ortngatcuhoot2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaCtWwwAKCRAnX84Zoj2+
dhXaAX99/6tATvYQUSyz9hcmkMAlBSpKAc/PN6MlwYWkkWP+I/hjrTMVuAbhGWSd
9IvD6+cBfi2/vkBdTeY/kaxzhyQR+gVabclTJ1Jq1RtAOVZVAKk0qXWTtCqbF/Id
xM34KIQ2JA==
=rS0I
-----END PGP SIGNATURE-----

--44ortngatcuhoot2--
