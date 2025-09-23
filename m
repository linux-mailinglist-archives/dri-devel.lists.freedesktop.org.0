Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A5AB9539A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E83910E5C6;
	Tue, 23 Sep 2025 09:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MZVlB0dd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101A710E5C6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 09:22:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9BD8544195;
 Tue, 23 Sep 2025 09:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18395C4CEF5;
 Tue, 23 Sep 2025 09:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758619344;
 bh=re8iyrzRlnW2KmH2O/yo6Zjt7gcZw/+zmt+4s8KfKJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MZVlB0ddvj5BrCyX8+ae5Roxf7FrqnvhgP+C8nOr9ITCQSYRfy91wOyjgSOap7W2H
 CPl5bTP8c9yjRdf7xW6popjRiqN1rZfjAU6b3Umlb05hD0wt7a+A8v6c43GoKHGD9R
 ls0ct7WS0zdiV/zJdzcoWkB+wtXbXhKkp3SAh5jyHLgyQhU5VFDEdlKX6LL/aZWMxo
 3vnyeOBWZLnmGsmvNrPT6JtA/x2O8Ev6zrJwGXQYmF4sTDa423G79ByHiCZp3x+Zm2
 on0WYinRNSv8ygYdKj/cj+vMUStafrzz/nKran23FtTQy8ExGnaKfQ700qtcWPmEIj
 Nh2L5zTdbiyXA==
Date: Tue, 23 Sep 2025 11:22:21 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/29] drm/atomic: Document atomic state lifetime
Message-ID: <20250923-quantum-resolute-crayfish-681be7@penduick>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-1-14ad5315da3f@kernel.org>
 <d807d181-6b14-4711-b297-72dcd49b4937@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xcj2dhr6gp5yfski"
Content-Disposition: inline
In-Reply-To: <d807d181-6b14-4711-b297-72dcd49b4937@suse.de>
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


--xcj2dhr6gp5yfski
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 01/29] drm/atomic: Document atomic state lifetime
MIME-Version: 1.0

Hi Thomas,

On Tue, Sep 02, 2025 at 03:08:12PM +0200, Thomas Zimmermann wrote:
> > + *     or a newer one if a commit has been made. The new state is the
> > + *     state we just allocated and we might eventually commit to the
> > + *     hardware. The existing state points to the state we'll eventual=
ly
> > + *     have to free, the new state for now.
>=20
> That final sentence is confusing. What are we doing with the existing sta=
te?

After the other cleanup series I have, existing state is only ever used
to point to the state we should free.

> Will the old state ever become the existing state? You also never explain
> this below.

Yes, after we run an atomic commit. If the commit is only allocated and
freed, or if the atomic is only checked, then we'll free new state. It's
what I tried to explain in the next paragraph, but maybe it's not clear
enough?

> Maybe only focus on the old and new state for now and explain the meaning=
 of
> the existing state in a separate bullet point.

I'll try to do that then, thanks!

> > + *
> > + *   + Once we run a commit, it is first checked and if the check is
> > + *     successful, it is committed. Part of the commit is a call to
> > + *     drm_atomic_helper_swap_state() which will turn the new state in=
to
> > + *     the active state. Doing so involves updating the entity state
> > + *     pointer (&drm_crtc.state or similar) to point to the new state,
> > + *     and the existing state will now point to the old state, that us=
ed
> > + *     to be active but isn't anymore.
> > + *
> > + *   + When the commit is done, and when all references to our &struct
> > + *     drm_atomic_state are put, drm_atomic_state_clear() runs and will
> > + *     free all the old states.
> > + *
> > + *   + Now, we don't have any active &struct drm_atomic_state anymore,
> > + *     and only the entity active states remain allocated.
> > + */

--xcj2dhr6gp5yfski
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNJmzAAKCRAnX84Zoj2+
djruAXwN4+6FidGF/ogsD+nFQGj6eOw3CtbeBVxDiAJdGguaREseAmRxHo/1MtH2
4esqsqsBgNbbzRjH+nCW82lbiNUAaXXEEa9Y1r25647rSbVbuv6YNkr7nTwGIZ4f
avLp25jN3Q==
=XmOB
-----END PGP SIGNATURE-----

--xcj2dhr6gp5yfski--
