Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C8F9E063F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 16:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412B010E797;
	Mon,  2 Dec 2024 15:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="thtXTEOA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4DF310E796;
 Mon,  2 Dec 2024 15:06:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 30E855C6751;
 Mon,  2 Dec 2024 15:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9069AC4CED1;
 Mon,  2 Dec 2024 15:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733151966;
 bh=bJHxMm8SAvQwZU8oN4IgDVqtKlgclPfZRHOiOK3WBK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=thtXTEOAOqA9oxEYRHSj60+I4R7jeT2hrk/nYY25dl2XBpbmRgD/tjGc2b7h7/Tde
 UUvtn6qZ0y2M+w7zNtus9roNoccOwgch8gk3Saz4KJKo5GB4Qh+9QyDVBPgbKWYRuw
 h8rO/8NGlSJWGpVZN7da2CUR+F9w2TH6HwCZUXmCdZOt+UHrRjR6aIwQ1YL+8GCQFC
 GG+rJo0e+UzwQ/Dls5HwUfZ3B/7FPzHTx3dwZFbxbhb5fIiiA7MSqvFyAFCe31e6Xi
 YDoaXTVKauBlrGAwCTx5jwqtJuer3l/0InBIXm+Mrs61gNNAgc+ZVGCRXmHLfq/rIO
 lSHMzQCNt6bjw==
Date: Mon, 2 Dec 2024 16:06:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
Message-ID: <20241202-accurate-jolly-hornet-8c2ca0@houat>
References: <20241126161859.1858058-1-imre.deak@intel.com>
 <20241126161859.1858058-2-imre.deak@intel.com>
 <Z0nO-bwpbWPVryd6@ideak-desk.fi.intel.com>
 <20241129-wild-cobra-of-thunder-829d1f@houat>
 <Z0nn0VzawSCdOCKY@ideak-desk.fi.intel.com>
 <20241202-real-benevolent-skunk-a9f5e0@houat>
 <87ldwy5lvb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7wyhvo257dg4yjvj"
Content-Disposition: inline
In-Reply-To: <87ldwy5lvb.fsf@intel.com>
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


--7wyhvo257dg4yjvj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
MIME-Version: 1.0

On Mon, Dec 02, 2024 at 02:07:36PM +0200, Jani Nikula wrote:
> On Mon, 02 Dec 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > It's not about whether we have a problem or not: you introduce new
> > framework functions, you need to have kunit tests to check their
> > behaviour.
>=20
> I don't fundamentally disagree with that goal,

You don't really have to agree. You asked for my review, you have it.

> but it does seem like a pretty drastic policy change. I don't recall a
> discussion where we made that decision, nor can I find any
> documentation stating this. Or what exactly the requirement is; it's
> totally unclear to me.

There isn't, because there's no such policy, even though it's definitely
something I'd like. This situation is different though:
drm_connector_init is already a function that is being tested. It seems
natural to not dilute testing when adding new variant, disregarding what
the policy of the rest of the framework is.

> Had I been involved, I would've pointed out that while adding tests is
> good, it inevitably increases the friction of adding new stuff to drm
> core.

You also know what increases the friction of adding new stuff? Adding
new stuff. Or writing documentation. Or writing commit log. Or sending
emails / making pull requests. Or asking for cross-reviews. Or having an
open-source user-space requirement. It seems pretty arbitrary to draw
the line right where testing starts.

> It's super tempting for people to just get their jobs done. If doing
> the right thing adds yet another hurdle, we may see more stuff being
> added in drivers instead of drm core.

I really enjoy hidden threats. And it's not like i915 is a great example
there.

> (Case in point, we already hacked around the problem being solved here
> with commit d58f65df2dcb ("drm/i915/dp_mst: Fix connector initialization
> in intel_dp_add_mst_connector()"). We could've just dropped the ball
> right there.)

Case in point indeed.

Maxime

--7wyhvo257dg4yjvj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ03M3AAKCRAnX84Zoj2+
dgZtAXwOVX7aF4ceq5Z33Qc93xYFjNKT3vsyJUpMLXZWg6y/W33MO4eLPyq/np+V
3fA7zD8BgNf4idwKSybJBRLbqTjxQNm0mb5NMifsXEZ010RDPFY2+D/su6fImXEX
Ztg5YzBZEQ==
=oUER
-----END PGP SIGNATURE-----

--7wyhvo257dg4yjvj--
