Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD9086C3F3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F7D10E303;
	Thu, 29 Feb 2024 08:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z34O1fiM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEA410E303
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:43:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 18AF761248;
 Thu, 29 Feb 2024 08:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D39AC43390;
 Thu, 29 Feb 2024 08:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709196207;
 bh=OtJFUbFzli0ao9Kk04l+WlQKFdrjGXqosC1GcMlUSc8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z34O1fiMdBDeainA1ZPjTfVLielaOBKLFzX80CW3c98pKgURmEjTwJcXGsOqiJ0Ia
 ZwmkHPVHgPYH9oMMqExQdZYthC0nFc5SVVDwn7Uz689/6Fs4J5TA5kom9TGKWGv4UM
 vVlUAwe7W0KNMMU18vYMLOViKVsKAjuFzlj43qvt8EN2qxWNC8PZ8RbbyW7I4x3JTi
 8PNYG4kPaOXvSqWLsmuQU00wkUA0cyTxDrvfCX2SB7KBkYkHVQVhVckkTmf/D3Bk3m
 pM5EwmORJVumtGEpriYqslBnnsSDYb/04nHzojvoSRNLCcSJsBKdW07GUWZTvuUjVC
 WKrO2LBS3O2yg==
Date: Thu, 29 Feb 2024 09:43:25 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org, 
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, 
 spbnick@gmail.com, tales.aparecida@gmail.com, workflows@vger.kernel.org, 
 kernelci@lists.linux.dev, skhan@linuxfoundation.org, kunit-dev@googlegroups.com,
 nfraprado@collabora.com, davidgow@google.com, cocci@inria.fr,
 Julia.Lawall@inria.fr, 
 laura.nao@collabora.com, ricardo.canuelo@collabora.com, kernel@collabora.com, 
 torvalds@linuxfoundation.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH 0/3] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
Message-ID: <20240229-rampant-blue-llama-c4ee7d@houat>
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228230725.GF1659@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eu5m6zbxesqv7xj2"
Content-Disposition: inline
In-Reply-To: <20240228230725.GF1659@pendragon.ideasonboard.com>
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


--eu5m6zbxesqv7xj2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 01:07:25AM +0200, Laurent Pinchart wrote:
> > Chat Discussions
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >=20
> > For those interested in further discussions:
> >=20
> > **Join Our Slack Channel:**
> > We have a Slack channel, #gitlab-ci, on the KernelCI Slack instance htt=
ps://kernelci.slack.com/ .
> > Feel free to join and contribute to the conversation. The KernelCI team=
 has
> > weekly calls where we also discuss the GitLab-CI pipeline.
>=20
> Could we communicate using free software please ? Furthermore, it's not
> possible to create an account on that slack instance unless you have an
> e-mail address affiliated with a small number of companies
> (https://kernelci.slack.com/signup#/domain-signup). That's a big no-go
> for me.

Yeah, and that list looks super restrictive and arbitrary. Like,
microsoft is there but kernel.org isn't?

I'm sure there's a reason, but we should at the very least open it to
everyone.

Maxime

--eu5m6zbxesqv7xj2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeBDrAAKCRDj7w1vZxhR
xT7gAP4oRjk5cvZCFl9XtJxHv+2sUJDNxvUgOUs8Px07O0eymQEAgtIrH290cK2V
mFnAbb5kwrTnyNl2XQDimzTR0qN31Q4=
=Cc5W
-----END PGP SIGNATURE-----

--eu5m6zbxesqv7xj2--
