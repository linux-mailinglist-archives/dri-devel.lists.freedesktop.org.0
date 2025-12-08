Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32562CADA3E
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 16:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8961710E4A3;
	Mon,  8 Dec 2025 15:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M8ama/Nu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC01610E491
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 15:48:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 75DD440324;
 Mon,  8 Dec 2025 15:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 003A4C4CEF1;
 Mon,  8 Dec 2025 15:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765208899;
 bh=nZVWmUNr2ffZnt1KQzEwy7Q5wOWyfGZmkXIZ2qS0bwg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M8ama/Nu76XGURe43dr2qAUdjLaL5E2zAfpj7fKq+SRJNIc8SOb+mybnyh7/q7RlC
 Tgy/PqQV5mYWfjNaVMrVrVtkf+i46iObQ4ztNjHNrPCi7GTjIc1JNf4sIDA0nStbeQ
 9I9oIkjQkNE6Q5IXLzIcnZPATjXkzdCJVzGzoG9jwugqZnczN6YTXVH2kVoUgxGOzg
 +jXHp7RqBbxQc8TYqbgfiQlrQsSEE1TcATaD774GVBGdUKUXW+EA5rYW9c0hCkKgjr
 dBEg1X0MJXvfd9QSGXTMvrYC9FPQbD3of3rWMdUJH7IBtP0o5BMfSjdjleqrwTG59m
 qwgByiMgrhIew==
Date: Mon, 8 Dec 2025 16:48:16 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 03/16] drm/atomic: Add new atomic_create_state
 callback to drm_private_obj
Message-ID: <20251208-masked-mongrel-of-wonder-562912@houat>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
 <20251014-drm-private-obj-reset-v2-3-6dd60e985e9d@kernel.org>
 <c43t73qbgrimpuinjsjyxcit6cvjflusomjayzv62nvvvmtwuo@elo37btubnul>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="y347jqrf2gwkfk2g"
Content-Disposition: inline
In-Reply-To: <c43t73qbgrimpuinjsjyxcit6cvjflusomjayzv62nvvvmtwuo@elo37btubnul>
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


--y347jqrf2gwkfk2g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 03/16] drm/atomic: Add new atomic_create_state
 callback to drm_private_obj
MIME-Version: 1.0

Hi,

On Wed, Oct 15, 2025 at 01:49:33AM +0300, Dmitry Baryshkov wrote:
> On Tue, Oct 14, 2025 at 11:31:47AM +0200, Maxime Ripard wrote:
> > The drm_private_obj initialization was inconsistent with the rest of the
> > KMS objects. Indeed, it required to pass a preallocated state in
> > drm_private_obj_init(), while all the others objects would have a reset
> > callback that would be called later on to create the state.
> >=20
> > However, reset really is meant to reset the hardware and software state.
> > That it creates an initial state is a side-effect that has been used in
> > all objects but drm_private_obj. This is made more complex since some
> > drm_private_obj, the DisplayPort ones in particular, need to be
> > persistent across and suspend/resume cycle, and such a cycle would call
> > drm_mode_config_reset().
>=20
> Doesn't that mean that we need to save private objects's state in
> drm_atomic_helper_duplicate_state() and restore it in
> drm_atomic_helper_commit_duplicated_state()? Private objects don't have
> .atomic_commit() callbacks, but they can be used by other objects during
> drm_atomic_commit().

Not really, because private objs aren't reset in
drm_mode_config_reset(), so there's nothing to save and restore, the
objects before the suspend are still going to be there after the resume.

Maxime

--y347jqrf2gwkfk2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaTbzQAAKCRAnX84Zoj2+
dh3fAYCA9zfcDhTU2s8CeE1CNuLDTC3VJi2I07AsDiayhI7SO5DbJ8ns+/LRKems
Px9znj0BgLaxMUslCNtPxMy+lAe93sA2ADJONw7gYxxScMO1HFxED/ayTGVT2L6P
urJUFOkyqA==
=fuKw
-----END PGP SIGNATURE-----

--y347jqrf2gwkfk2g--
