Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A53B8D32B1
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 11:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7F810E396;
	Wed, 29 May 2024 09:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C9oxEa9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E1A10E396
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 09:15:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 59FF4626FC;
 Wed, 29 May 2024 09:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE52CC2BD10;
 Wed, 29 May 2024 09:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716974138;
 bh=LDFHlp29MsF66t15bWkCXBcW6utPfAUvtUB74pab8eQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C9oxEa9nEv94sHWebiiSrJYpnOSfqLaaJNeJwD98mblLeiRsHBJGOOn5IUI7fF9Xp
 nht4XKOGcJr2xU4m+y8nNphNaBQ2MsEATw+Q+D5Q6l6uNaUX40+eGXKXsfVSVqxpBX
 5Ln84fyD4DMQblhABeG0zwzDOe6IPxVSfQNr4ijVMi+C/0xetcvd09SWauTHSljV1E
 LQ0xjnMhk+GOgazWIc89r7VHgbH0waK/lgbJtFrUMykfXqkg+bxxA/g/kXKYkMT24f
 4OjzmNS94c45gb8amPS6jDh+I0dsTYN9+GRVj5nQC519eKmtDEWyIG29LMTGjs25kS
 ueFgzTbN22ICg==
Date: Wed, 29 May 2024 11:15:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/sun4i: Fix compilation error
Message-ID: <20240529-private-ruddy-rottweiler-1afcb3@houat>
References: <20240528151056.2104153-1-mripard@kernel.org>
 <171697049522.2533828.193549550194715590.b4-ty@kernel.org>
 <dcfkn4bgsdzxbgzdlpycnyuj76ycydwavn2tqd2k6kuw5puuge@wkun3c6i5qqt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="oy25qsc765rcypgq"
Content-Disposition: inline
In-Reply-To: <dcfkn4bgsdzxbgzdlpycnyuj76ycydwavn2tqd2k6kuw5puuge@wkun3c6i5qqt>
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


--oy25qsc765rcypgq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 11:33:43AM GMT, Dmitry Baryshkov wrote:
> On Wed, May 29, 2024 at 10:14:55AM +0200, Maxime Ripard wrote:
> > On Tue, 28 May 2024 17:10:56 +0200, Maxime Ripard wrote:
> > > Commit ea64761a54a2 ("drm/sun4i: hdmi: Switch to HDMI connector")
> > > introduced a dependency that got renamed in a previous version, but
> > > wasn't properly updated in that driver. Fix the name of the function.
> > >=20
> > >=20
> >=20
> > Applied to misc/kernel.git (drm-misc-next).
>=20
> Just to note, I don't see this commit in drm-misc-next.

Thanks for the notice, I forgot to push it indeed.

It's now fixed

Maxime

--oy25qsc765rcypgq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlbyNgAKCRAnX84Zoj2+
diBUAX99YHjwUc9q1Sk5IOUdCA6s14Wulqcf+oG1OzMZ4zcKrdKvr+1mDdKZmhlf
rqLecRUBf2kIz1YSf9t1D6yHOvDOCZC61zmZ0N4XHbGIauJcIC1H/uzq9PnuztIw
SdzGwPi77Q==
=Xl0t
-----END PGP SIGNATURE-----

--oy25qsc765rcypgq--
