Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988F4B57876
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 13:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3117F10E459;
	Mon, 15 Sep 2025 11:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="irHbUquB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9155010E459
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:35:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3215343EAD;
 Mon, 15 Sep 2025 11:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985F6C4CEF1;
 Mon, 15 Sep 2025 11:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757936149;
 bh=g6iT4LnVK7VL5GwXa8h1y7q/YHk4y51nRdnBAvPMLHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=irHbUquBjSFrawKk+3UEmche2gt/Rgpdr15gS2JmZS1dAWlbJlXBHbjg8gXR11Yqp
 +0Hq/9ortYg0Y/zWUUCIyy0K6u7iQLk2GngrdprqwAjvstszH+MGIy54oFkpGIx0ye
 KKrLh/V0L3NQGkKrJPO0FsH9PER9w+OHgY/I8AlUOaS6rDDJZTDStchF9/Am2QVN7l
 Ern40o9RIMirw5FmHcmpIWMXFeJ64dAut9owbvoKVl8v3FOCE6Gl6tuQSDnXl//x8/
 I80uS8tMkCCT2pb8G+3gUOlazd6j8iEg+BvPx9JHasL18daPL8EFs1yAzIk3qM/tes
 /AjpcK9rdKcBw==
Date: Mon, 15 Sep 2025 13:35:45 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Devarsh Thakkar <devarsht@ti.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/29] drm/atomic: Only call atomic_destroy_state on a
 !NULL pointer
Message-ID: <20250915-dangerous-industrious-gecko-b25b7b@penduick>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-8-14ad5315da3f@kernel.org>
 <20250902205247.GW13448@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="lzlgqubra4xlbor6"
Content-Disposition: inline
In-Reply-To: <20250902205247.GW13448@pendragon.ideasonboard.com>
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


--lzlgqubra4xlbor6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 08/29] drm/atomic: Only call atomic_destroy_state on a
 !NULL pointer
MIME-Version: 1.0

On Tue, Sep 02, 2025 at 10:52:47PM +0200, Laurent Pinchart wrote:
> On Tue, Sep 02, 2025 at 10:32:36AM +0200, Maxime Ripard wrote:
> > The drm_atomic_state structure is freed through the
> > drm_atomic_state_put() function, that eventually calls
> > drm_atomic_state_default_clear() by default when there's no active
> > users of that state.
> >=20
> > It then iterates over all entities with a state, and will call the
>=20
> Did you mean s/with a state/within the state/ ?

I'm not sure how to phrase it, but I meant "entities" that have a
matching state structure. Encoders for example don't.

> I'd also replace "entity" with "object" as mentioned in the review of a
> previous patch.

And bridges aren't objects :/

> > atomic_destroy_state callback on the state pointer. The state pointer is
> > mostly used these days to point to which of the old or new state needs
> > to be freed, depending on whether the state was committed or not.
> >=20
> > So it all makes sense.
> >=20
> > However, with the hardware state readout support approaching, we might
> > have a state, with multiple entities in it, but no state to free because
> > we want them to persist. In such a case, state is going to be NULL, and
> > thus we'll end up with NULL pointer dereference.
>=20
> I'm not sure to follow you here. Are we talking with objects whose old
> and new states will both need to be preserved ? Or objects that have no
> old state ?

It's more of the latter, but not really. Objects, at this point of the
series, will always have an old state.

However, due to how the initial state is being built with hardware
readout, we would move the old state of an entity/object/whatever to
$object->state, and clear it from drm_atomic_state so it's not freed.

so drm_atomic_state ends up with a whole bunch of objects that don't
have an old state anymore, and drm_atomic_state_default_clear() chokes
on that.

Maxime

--lzlgqubra4xlbor6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMf6EQAKCRAnX84Zoj2+
ds4WAX98P2TpRW0+Wg625O9mrd1bDzmxa7KteQ4ID+ZyQm39wgRPsGEEwcVEJ0yk
nO0ooV0BfiXGnL5cpFsL7vNgrr+yQFxUB+wWibtzPr2ITMmRVF7i7wbIpaH+jstp
18m/s/QBwA==
=KewR
-----END PGP SIGNATURE-----

--lzlgqubra4xlbor6--
