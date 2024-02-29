Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55A086C83B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 12:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6E610E160;
	Thu, 29 Feb 2024 11:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cMGe7p7N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519DF10E181
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:41:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 848E360BF9;
 Thu, 29 Feb 2024 11:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81361C433F1;
 Thu, 29 Feb 2024 11:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709206881;
 bh=9E6JK722trskZs3mnQYbOnokIP35aqsSBUfj3mkuO0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cMGe7p7NMiOc40fvVBRtzZGPzwE+qYVQX0l3yJZNzExgS9otjalGvxTGO8pG+V2JM
 3ESlXhmhSiNtwR+T+xLrxYfMFNT0b0e5Lw1emB87KB96JvYDt8C4+I6wDUfRPvhR1o
 /EQqHVHKSV2NA+DjvUJeQeTNgBEwErpGsqvt2o8O6vznlQ6CGIjWeVwkuhdujmBwbk
 a99aHSawjyPzNCCMsGDYW51Wx3A+k7B3Jqp3sib6Qpopdy8G/doEQAINYK861Pp6Ry
 OQVJrsQV63mHT+ytDwdqnYAYebIMBYsHR1+eWYT+HUDGe+JnS3sj+Hg4KF95hkz8uC
 jQPPFTnkfWOqQ==
Date: Thu, 29 Feb 2024 11:41:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Nikolai Kondrashov <spbnick@gmail.com>,
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, tales.aparecida@gmail.com,
 workflows@vger.kernel.org, kernelci@lists.linux.dev,
 skhan@linuxfoundation.org, kunit-dev@googlegroups.com,
 nfraprado@collabora.com, davidgow@google.com, cocci@inria.fr,
 Julia.Lawall@inria.fr, laura.nao@collabora.com,
 ricardo.canuelo@collabora.com, kernel@collabora.com,
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH 0/3] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
Message-ID: <a4fc23e1-5689-4f86-beb7-5b63a0d13359@sirena.org.uk>
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228230725.GF1659@pendragon.ideasonboard.com>
 <0a5bf7d1-0a7e-4071-877a-a3d312d80084@gmail.com>
 <20240229093402.GA30889@pendragon.ideasonboard.com>
 <655f89fa-6ccb-4b54-adcd-69024b4a1e28@gmail.com>
 <20240229111919.GF30889@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pzbw6S2RHjAEiZdV"
Content-Disposition: inline
In-Reply-To: <20240229111919.GF30889@pendragon.ideasonboard.com>
X-Cookie: Marriage is the sole cause of divorce.
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


--pzbw6S2RHjAEiZdV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 29, 2024 at 01:19:19PM +0200, Laurent Pinchart wrote:
> On Thu, Feb 29, 2024 at 01:10:16PM +0200, Nikolai Kondrashov wrote:

> > Of course. You're also welcome to join the #kernelci channel on libera.chat.

> Isn't that a bit pointless if it's no the main IM channel ?

It *was* the original channel and still gets some usage (mostly started
by me admittedly since I've never joined slack for a bunch of reasons
that make it hassle), IIRC the Slack was started because there were some
interns who had trouble figuring out IRC and intermittent connectivity
but people seem to have migrated.

--pzbw6S2RHjAEiZdV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXgbVgACgkQJNaLcl1U
h9BP+gf/ZzXdLEKy39amc0+rcie7SxRQZH7pdbp4iPOIO1a7k+NFzDX+NhcNRSPb
0BNtBIjKSjeJI7F8pi10u41hd7BsrAEa1KdmTqDif9QfSYkA86SP3bYtiWW5QOnO
1PKRY5wKCNYcAaNzyGq+vxmZS7qfTQdedLFg3X72n7w49y0qfXy/k3qiFJPGzpXa
fCRZqitSZr9WxtikrMSXdP4w0zqllKV2laWtupuLhnnd14PmaGoRBb0BWNv6Rd7J
MQ2bQIXc3Tlya5tq7ZSCtkF5Alr70ziDZFN7yPGa7oXKp25qoM48Si+Eq11NKfyc
eXuTsbsOnY/5VTXKm5e4YWZjkbS8Kg==
=fZ5w
-----END PGP SIGNATURE-----

--pzbw6S2RHjAEiZdV--
