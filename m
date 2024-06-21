Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0005F9122FC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 13:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCB710E294;
	Fri, 21 Jun 2024 11:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BWKJmrOJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DBB10E294
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 11:05:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 32A5ACE2C01;
 Fri, 21 Jun 2024 11:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A53C2BBFC;
 Fri, 21 Jun 2024 11:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718967920;
 bh=YspL7LfOYtMaorbonwD10m2ZmFB/gGmju8o9zEGV5xk=;
 h=Date:From:To:Cc:Subject:From;
 b=BWKJmrOJZn4zuLAdhMx70WGxVVgtzl3fxQkmvYCHwMECM+UIBamFTTE26BrTnFG2k
 tp7aHWaU9Sh/eqbQ3Ef9+3iNc0zdQJz34AqhrhCsavnwHX1GmHONEyDMYraY0wn2rd
 hbqVzUxR7AxT+M5U8V1O7a6e8ZTsoG0hi1Qj4/dHqBEl+M8ArTSwqK4g9MmF72AIaz
 WHcq+8zLju/Z6zJsfliAfH7p0J3w6lnEGH1HCGTGD6GTXCm3Qq2Wn2JYsnZzr9/sAW
 zdiTASw5LeIc0iNnMLF35nefhCZ2XiATlR9SoIBncP8HIKG/U1oD41ogF6OxyllkNU
 v7pVin7Q+DZFg==
Date: Fri, 21 Jun 2024 12:05:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, Tomer Tayar <ttayar@habana.ai>,
 Ofir Bitton <obitton@habana.ai>
Subject: Missing signoffs in the drm-next tree
Message-ID: <595563de-234f-49be-b807-c9ebaa758fc1@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RliujJeVdCg/u4hz"
Content-Disposition: inline
X-Cookie: Androphobia:
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


--RliujJeVdCg/u4hz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In today's drm tree commits

  824a450c0d90a ("accel/habanalabs: gradual sleep in polling memory macro")
  fb0e9ebb93aa9 ("accel/habanalabs: move heartbeat work initialization to e=
arly init")
  ee6350c6c3300 ("accel/habanalabs: print timestamp of last PQ heartbeat on=
 EQ heartbeat failure")
  99484a0eadea5 ("accel/habanalabs: dump the EQ entries headers on EQ heart=
beat failure")
  aa2b8e98611ed ("accel/habanalabs: revise print on EQ heartbeat failure")
  b80d69de0fecd ("accel/habanalabs: add more info upon cpu pkt timeout")
  0411d494c6642 ("accel/habanalabs: additional print in device-in-use info")
  6d4a9ef47352b ("MAINTAINERS: Change habanalabs maintainer and git repo pa=
th")
  e8307804e2e10 ("accel/habanalabs: disable EQ interrupt after disabling pc=
i")
  5855baed03cf9 ("accel/habanalabs: change the heartbeat scheduling point")
  03387d163cdc9 ("accel/habanalabs/gaudi2: unsecure edma max outstanding re=
gister")
  920fabafea4bc ("accel/habanalabs: add cpld ts cpld_timestamp cpucp")
  30f183a3669cb ("accel/habanalabs: add a common handler for clock change e=
vents")
  4ce27da0bd6e7 ("accel/habanalabs: use device-name directory in debugfs-dr=
iver-habanalabs")
  65c6b847a8319 ("accel/habanalabs/gaudi2: add GAUDI2D revision support")
  6f6323040e650 ("accel/habanalabs: move hl_eq_heartbeat_event_handle() to =
common code")
=2E..skipping...
  824a450c0d90a ("accel/habanalabs: gradual sleep in polling memory macro")
  fb0e9ebb93aa9 ("accel/habanalabs: move heartbeat work initialization to e=
arly=20
init")
  ee6350c6c3300 ("accel/habanalabs: print timestamp of last PQ heartbeat on=
 EQ h
eartbeat failure")
  99484a0eadea5 ("accel/habanalabs: dump the EQ entries headers on EQ heart=
beat=20
failure")
  aa2b8e98611ed ("accel/habanalabs: revise print on EQ heartbeat failure")
  b80d69de0fecd ("accel/habanalabs: add more info upon cpu pkt timeout")
  0411d494c6642 ("accel/habanalabs: additional print in device-in-use info")
  6d4a9ef47352b ("MAINTAINERS: Change habanalabs maintainer and git repo pa=
th")
  e8307804e2e10 ("accel/habanalabs: disable EQ interrupt after disabling pc=
i")
  5855baed03cf9 ("accel/habanalabs: change the heartbeat scheduling point")
  03387d163cdc9 ("accel/habanalabs/gaudi2: unsecure edma max outstanding re=
giste
r")
  920fabafea4bc ("accel/habanalabs: add cpld ts cpld_timestamp cpucp")
  30f183a3669cb ("accel/habanalabs: add a common handler for clock change e=
vents")
  4ce27da0bd6e7 ("accel/habanalabs: use device-name directory in debugfs-dr=
iver-habanalabs")
  65c6b847a8319 ("accel/habanalabs/gaudi2: add GAUDI2D revision support")
  6f6323040e650 ("accel/habanalabs: move hl_eq_heartbeat_event_handle() to =
common code")

are missing a Signed-off-by from their committers.

--RliujJeVdCg/u4hz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ1XmsACgkQJNaLcl1U
h9DlnQf+IAVkxK0DTvpAbN4F3ep+0eaDjV2dOsV8Fy2h43D4akEPZxqX4bKJG2rb
9c/VYlpKdcdicD70jSAb/u7EsI2t+WOyea7jMs9pjIClvPPS6HlRBYmE3BB90lN/
lbrFOhQgzHXg/uw2uq0gDZofZSmuBNN+JQdIF5jbegkxSdYG1AU50ezzc2wBxHnl
RzJ2TZ+FKkgN5B2jggACZ1lLs/NkYexzmgjLzEhXIBz/CTPM/GUejolDQ4FoWcD4
fKpE2xfYJxutnkz2mPlc+v7MwwRsCzDBc+LqRFTPzcOdYPh7MqBrdYpl4SOdsqy8
F4M8lu/264os1LPuEYPx+cbOfxP9XA==
=D9Gt
-----END PGP SIGNATURE-----

--RliujJeVdCg/u4hz--
