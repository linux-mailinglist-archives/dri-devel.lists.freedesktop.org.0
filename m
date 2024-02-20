Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA8785B5C2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 09:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26FF110E227;
	Tue, 20 Feb 2024 08:49:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pu3OX+Vf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88BE10E227
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 08:49:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 39E62610A3;
 Tue, 20 Feb 2024 08:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC42C433C7;
 Tue, 20 Feb 2024 08:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708418967;
 bh=Z92vP/LfdPENlDSqE72ezJIf6USJFNPkHqadLgM764c=;
 h=Date:From:To:Cc:Subject:From;
 b=pu3OX+VfdoQMpd8Osg553Vth+TIz1obCyo8ins8ZodSAs9OUdNbbVRBlvgPW1ftWv
 4A3f7grObrY1ZQO4W8MTIt+zWlI/bo3el5JuCz2GEk/ZETFVzAFlItksXuSHLH0cuO
 vCtvTHJHBtP7rj/Gksb9JsVEo0+JdDfn117svrWtISdYTpgYG8/54oj5XP2EoOVgdg
 knCDGKa13N2fAu2D32sUTPvCYsEAh71l3Q/H/YjAxQ/6N+zzqUOKMWZolkj97Zzq/V
 kNIMVUzhJMW45iMe3TgoxwUGHtQHvtO6llWVTs0DFD6wolW7unDmPldlSCOWoN5NEU
 9yYjL14JmOZaw==
Date: Tue, 20 Feb 2024 09:49:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Stone <daniels@collabora.com>
Subject: drm-misc migration to Gitlab server
Message-ID: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rsyqahl7odbgonp4"
Content-Disposition: inline
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


--rsyqahl7odbgonp4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

As you might have noticed in your mails, Daniel Stone and I have been
working on adding all the drm-misc maintainers and committers to Gitlab.

The current repository was still in the cgit instance and was creating
an unnecessary burden on the admins.

For example, any new user had to create an issue and go through Daniel
to create an cgit account, even though that user already needed to have
a gitlab account to create the issue in the first place. Adding an SSH
key was a similar story. By moving to Gitlab, we'll remove most of that
burden.

This will be mostly transparent to current committers and users: we'll
still use dim, in the exact same way, the only change will be the URL of
the repo. This will also be transparent to linux-next, since the
linux-next branch lives in its own repo and is pushed by dim when
pushing a branch.

In the next few days, you might notice conflicting notifications. As we
figured out the drm-misc group and repo structure, we've added members
at multiple levels and we will clean things up in the next few days. The
final organization is that every drm-misc committers and maintainer will
have permissions over the drm-misc group and its projects, so if it's
not the case please let us know.

# What we do next

## Adding the a remaining users

I was able to identify most of the users with an account on the old git
server. However, there's a few I couldn't match with certainty to a
gitlab account:

* andr2000
* jsarha

Please let me know your Gitlab user so I can add them to the group.

## Changing the default location repo

Dim gets its repos list in the drm-rerere nightly.conf file. We will
need to change that file to match the gitlab repo, and drop the old cgit
URLs to avoid people pushing to the wrong place once the transition is
made.

I guess the next merge window is a good time to do so, it's usually a
quiet time for us and a small disruption would be easier to handle. I'll
be off-duty during that time too, so I'll have time to handle any
complication.

## Updating the documentation

The documentation currently mentions the old process to request a
drm-misc access. It will all go through Gitlab now, so it will change a
few things. We will also need to update and move the issue template to
the new repo to maintain consistency.

I would expect the transition (if everything goes smoothly) to occur in
the merge-window time frame (11/03 -> 24/03).

Let me know if you have any questions, or if there's anything we missed,
Maxime

--rsyqahl7odbgonp4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdRnkwAKCRDj7w1vZxhR
xVldAQD2JEaPHOeYJELFIsCiajcNlQQ81UNrGiNmGFXDInc7jQD+OYqsd26onaDA
CAN6M1OnQPtLCfqEKCXwmka6c9Nh2QI=
=MDES
-----END PGP SIGNATURE-----

--rsyqahl7odbgonp4--
