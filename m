Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D755388C141
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 12:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2DE10E742;
	Tue, 26 Mar 2024 11:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d44wJV6R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FB110E742
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 11:50:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0129DCE203C;
 Tue, 26 Mar 2024 11:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE9FC433C7;
 Tue, 26 Mar 2024 11:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711453844;
 bh=OXamwQRGydoSEaZrpl6PK761wLlUpLlEDuYqoWSmDGM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d44wJV6RlHu2UV9QTzyGVLFjpwlSMiVanfn8+NYuo1tY5nyzvF2gSqfbvVAx0bV1d
 /o5N5savBM/Bjv51e/3f3akVW1b7xXjeFBdS9aUOTO7wQhhKhMyNJ9iE6CcYPFAfW6
 t7JzKrP9TeE5HQYfG5U98+pphCpHluS2M9uIfUh5iBG2b37kKOqt6CusrlTjLCWrZu
 F7xU/xtwipPfRASq1EbRniGpqvsfuMGVw5CxmsOVkOIA3llIUwpg2sUsi30hpH68oN
 lN1OzrxXnnEZCj93zqvG1tl2XR4UeN2CIITUliV9TbIzgwjMTEkhJp3SLl9pKFT2kM
 pcodBjSl+Ct9g==
Date: Tue, 26 Mar 2024 12:50:41 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 00/12] drm/display: Convert helpers Kconfig symbols to
 depends on
Message-ID: <20240326-premium-icy-dog-d3effd@houat>
References: <20240325-kms-kconfig-helpers-v1-0-bfec6949d9c3@kernel.org>
 <87v85aield.fsf@intel.com>
 <20240325-humongous-hyena-of-sufficiency-15e291@houat>
 <87wmppgsd6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="7iecel7pwq4owsqn"
Content-Disposition: inline
In-Reply-To: <87wmppgsd6.fsf@intel.com>
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


--7iecel7pwq4owsqn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2024 at 01:11:33PM +0200, Jani Nikula wrote:
> On Mon, 25 Mar 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > Yeah, I got bitten by that when rebasing my HDMI series. Maybe we could
> > enable them all by default to prevent any issue when bisecting?
>=20
> Someone's going to grumble about default y, too, but agreed. I saw you
> already sent the patches.

Yeah, and I only added the default y to options that used to be selected
which should reduce the grumbling to a minimum :)

Maxime

--7iecel7pwq4owsqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZgK2iAAKCRAnX84Zoj2+
dlVmAX41lrtKFxuDbahnHd2d3Qsq8jRU+KN8jfC7laUSsfj+t5vLdr9rInxN0Fx9
SoxfDlEBfjY+n50MMRdAsDPTudC3U0qqbtX7pJ/dOj0uVnP91uiUNIXzrIu7pLSR
Kw6gups8gg==
=UpAd
-----END PGP SIGNATURE-----

--7iecel7pwq4owsqn--
