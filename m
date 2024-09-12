Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939C4976636
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 12:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F361710EB3A;
	Thu, 12 Sep 2024 10:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mfEClGEZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E585110EB3B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 10:00:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A2F425C5A69;
 Thu, 12 Sep 2024 09:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951FFC4CEC3;
 Thu, 12 Sep 2024 09:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726135199;
 bh=BrfTyQxyI483iT01Z4dck0uTDGOGFm8xGFNydqkJc4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mfEClGEZCTF+6aZlfh5SyiLuH70/mjzrYUVJtGKrlTNlnF407oHfG+pWUpM2g66WQ
 NT5l0t7RTIIOVH0kGytz84x6o1Sbz7nfqJfJ14QeU3YlMAr28Qt1nRZw1nsrrwbfr9
 WZsGzI6OiOaiMpdC7p0uOR3H+YxKt2jyUgTpJdeO2+lMOEIrcOhlEvQ++oMMhduqG3
 fWmxakIFjWmgZplxFcWgD27bBVvb0G2WfSNw1KxsGRmoMq71axjKCRQTiE8xZpE4l/
 KHHZNsgbG6SCqiq73E0lv4k/s9A3PJsNTTRdqZNToCpyiPV6n8xDW8r+tQWxDzzssn
 4Dv8iowIVxlAw==
Date: Thu, 12 Sep 2024 11:59:57 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/doc: Update drm_bridge_connector path
Message-ID: <20240912-smoky-fast-mole-c6eebf@houat>
References: <20240912084540.1213343-1-mripard@kernel.org>
 <rq77jt6wfq2s6i5mk4x4v7hfvpz7cgl5uqnwrq7odyz5k6rbxo@riierkdmvhp5>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="yyvc2tqpydmz3udm"
Content-Disposition: inline
In-Reply-To: <rq77jt6wfq2s6i5mk4x4v7hfvpz7cgl5uqnwrq7odyz5k6rbxo@riierkdmvhp5>
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


--yyvc2tqpydmz3udm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 12:46:50PM GMT, Dmitry Baryshkov wrote:
> On Thu, Sep 12, 2024 at 10:45:40AM GMT, Maxime Ripard wrote:
> > Commit 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER
> > module") recently moved the drm_bridge_connector file, but didn't update
> > the doc resulting in a doc build warning. Update it for the new locatio=
n.
> >=20
> > Fixes: 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER =
module")
> > Closes: https://lore.kernel.org/dri-devel/20240904163018.214efaa7@canb.=
auug.org.au/
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  Documentation/gpu/drm-kms-helpers.rst | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
>=20
> https://lore.kernel.org/dri-devel/20240911-drm-fix-dbc-docs-v1-1-ae5cb82f=
ce1e@linaro.org/

Sigh... sorry, I missed that one. Can you apply your patch?

Maxime

--yyvc2tqpydmz3udm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZuK7mAAKCRAnX84Zoj2+
dgo2AX4gilqzFg4mhOX0frOcIFbJWBy1ZGMoM+2d8Rtbg7Yj50IBM8wb8Dy8okUO
N/0NFVsBf1w7g0G/X6wgGkurQjd2MhjY5VdLpgjepXHWNrtvjRhQQ7wo5ZVStbQU
Odyq4Fku9A==
=ZgrC
-----END PGP SIGNATURE-----

--yyvc2tqpydmz3udm--
