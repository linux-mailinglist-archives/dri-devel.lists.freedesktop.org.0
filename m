Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B6486C7BA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 12:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA1210E449;
	Thu, 29 Feb 2024 11:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AKcbF2F8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C31110E449
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 11:09:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0070D61517;
 Thu, 29 Feb 2024 11:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B7E3C433C7;
 Thu, 29 Feb 2024 11:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709204988;
 bh=3Jp3DLK4GaGdce9BlkhMX4N5x38K7gfZP7ZzlOJJEfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AKcbF2F8ZMtL7sBtcMDzQD6+mAG3TlIU9zJO8V9rQDocWsppaDOIxHNY1RvGjFHWw
 MJmN90Q2aEVdInZAr/grLzs0Qg/1CJblp0gm9YcUTPcllXe24r7VbFt1/mrOY9scQ4
 JsXgknMvJkYmR4XQHtS0+FB80b5EpjX1ToXNL2uGfJvbdagyEGVniY9+268P+sZc8o
 YQUKobwfQOW1cnqEV5CEOko6ZGbFyxko1jaPKVXNYchKccAaMlH/lanDmDt5p7Ehko
 onxsBZFkSNU59cP1t7HX5eK1pzTx63dac9NAaSD7gB2n4+jyOBoVxwiwg0DYfcvd6H
 TjlmtFWS6dkGA==
Date: Thu, 29 Feb 2024 11:09:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kselftest@vger.kernel.org, pawiecz@collabora.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, kunit-dev@googlegroups.com,
 nfraprado@collabora.com, davidgow@google.com, cocci@inria.fr,
 Julia.Lawall@inria.fr, kernel@collabora.com,
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH 0/3] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
Message-ID: <c7df72f5-857f-4ebb-b751-25fcb786427e@sirena.org.uk>
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228230725.GF1659@pendragon.ideasonboard.com>
 <ZeBQtfY8FG_qtoEJ@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Iws3dWkEFVnb2rF9"
Content-Disposition: inline
In-Reply-To: <ZeBQtfY8FG_qtoEJ@valkosipuli.retiisi.eu>
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


--Iws3dWkEFVnb2rF9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 29, 2024 at 09:39:01AM +0000, Sakari Ailus wrote:
> On Thu, Feb 29, 2024 at 01:07:25AM +0200, Laurent Pinchart wrote:

> > > We have a Slack channel, #gitlab-ci, on the KernelCI Slack instance https://kernelci.slack.com/ .
> > > Feel free to join and contribute to the conversation. The KernelCI team has
> > > weekly calls where we also discuss the GitLab-CI pipeline.

> > Could we communicate using free software please ? Furthermore, it's not
> > possible to create an account on that slack instance unless you have an
> > e-mail address affiliated with a small number of companies
> > (https://kernelci.slack.com/signup#/domain-signup). That's a big no-go
> > for me.

> I agree. There is no shortage of good alternatives either: we have IRC,
> Matrix and XMPP for instance. Just pick one of them.

And indeed KernelCI does actually already have #kernelci on libera.chat.

--Iws3dWkEFVnb2rF9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXgZfQACgkQJNaLcl1U
h9AdtAf/TjlgwmBR+dFt3Imb6vVXvcZz1uk0yqE9QdLn/+P7uF+i6O6Lo61wzzW7
wZF6S/KVkz5gmMx3Ow6CzP1eyKOYvn2N/m2F7ImNuRtqKUMKv/0/rzxEtH5DK+da
F1p6iV8WH3xIplXt0+nxc198yzskr+/zj8i5Qbs/OCVOl/VNmYZ70u9BFAhmsdmo
O3YFYTKWetaRZPx8u8uoPUnAVofMV3vF4PtGQQDHPTmK9AC+4poc0jIx2V6PviY8
yYgh9MrynKWlj1WRPrutfENQo++scSX66MdRQj4DfDeZm+7LUHDe1FzK3bRncJgo
e5RUDmeCXKOY6foBuo2NKtLQHPBOPw==
=uZ/p
-----END PGP SIGNATURE-----

--Iws3dWkEFVnb2rF9--
