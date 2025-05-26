Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2160EAC3CAB
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF3C10E2F0;
	Mon, 26 May 2025 09:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qCwpUXV3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438E010E2FD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:26:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2FC8661126;
 Mon, 26 May 2025 09:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C27C4CEE7;
 Mon, 26 May 2025 09:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748251590;
 bh=ojrBevA7GejYEBIQfE9GKMWuRZ7nBmq+XTqKOKUHr8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qCwpUXV3vD0bOazwR+gril9gdcxCS0No/u9txn6Va+RmH8/bJtOjj2QlW7ZvdcJeP
 mPwdwKEiqGainFy1jviInZ1XLqpRRlPJ428FSQ7VqGyT9JEUjtOOgmcaB37kznQ/ei
 mj5Gdbz0cxkwO4hVZt+j9ugXdhV8MaeMahlED0cT/fuUU1W6iKMZcJWTSCBPw66CZA
 DEmB8etctkUQGqUFh0Ow4dRen5r3JKVSYNjosYniAxPALzv5cXs7G3n5ydRyH5ZHPH
 EW4pmqqewsesT884KhOLqaa9y1tagWVNbCC++fQ55qeR+231v0CHLJEIVO/BZn+QPD
 WaRLduPwIG7Rw==
Date: Mon, 26 May 2025 11:26:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Douglas Anderson <dianders@chromium.org>, Adam Ford <aford173@gmail.com>, 
 Jesse Van Gavere <jesseevg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set()
 with atomic_enable()
Message-ID: <20250526-cryptic-blue-mussel-ac57fe@houat>
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="shmlyimfb2v5wudn"
Content-Disposition: inline
In-Reply-To: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
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


--shmlyimfb2v5wudn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set()
 with atomic_enable()
MIME-Version: 1.0

Hi,

On Mon, May 26, 2025 at 10:54:52AM +0200, Tommaso Merciai wrote:
> After adv7511_mode_set() was merged into .atomic_enable(), only the
> native resolution is working when using modetest.
>=20
> This is caused by incorrect timings: adv7511_mode_set() must not be
> merged into .atomic_enable().
>=20
> Move adv7511_mode_set() back to the .mode_set() callback in
> drm_bridge_funcs to restore correct behavior.
>=20
> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI connector h=
elpers")
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom-desktop/
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Explaining why, both in the commit log and the comments, would be nice.
Because I can't think of any good reason it just can't work for that
bridge.

Maxime

--shmlyimfb2v5wudn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaDQzwwAKCRAnX84Zoj2+
dvTMAX93ht/JowUzBPWhgbxbNVC9lVUHcqu6M3gZR+4cG5/oEN+y1lytCT5Z92Ck
ZjSwvKcBgIZew4gQWouo5j6mutuVebRAh86tQMqQxijXhRiHmiLV5io7DTfVVbB6
QdOZnsKSmQ==
=cM3B
-----END PGP SIGNATURE-----

--shmlyimfb2v5wudn--
