Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C30829B92B4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 14:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741A510E9D6;
	Fri,  1 Nov 2024 13:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pSrkCBko";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597E210E9D6
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 13:57:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 226D55C93F8;
 Thu, 31 Oct 2024 09:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75007C4CEC3;
 Thu, 31 Oct 2024 09:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730366913;
 bh=vxH+HcKsIdFj34v/4jCuTn8TfvcGPGax3kPlDNbtaYI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pSrkCBkoh4HNsCDMr07yvYa0VbiXswhcZIqdNWcKRB/bS5+MO9nJAiiUqwA6iGBq0
 Rk4F6hlezUN7aP1VaA8BlXQL6XEMLP/xTs0i/VO7jsy3JtEvFPihlEpT6XIPokazQj
 mTdCBdKKMtYFppwlD9/CzbjvUpsAJmVMUTOW+96kdQtSHuKemXKRrGJrKcOwdfw8FA
 JaRekDO4LOfIdmtO3+jy/TakPgWP/j1z6WUCg5X6E60xDDpu80p0smHGLIxA6a4jET
 mMq0Ik3iTrGJnwVqx7++01qAI3zEeq9zyR8Do3RKKgoqeLeLdoQ+Vq1NtNuT6RdJUB
 SAWqQjwu7Hb4g==
Date: Thu, 31 Oct 2024 10:28:30 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: lockdep and ww mutex debug interactions in hdmi tests
Message-ID: <20241031-discerning-groovy-galago-6cf46f@houat>
References: <CAPM=9tzJ4-ERDxvuwrCyUPY0=+P44orhp1kLWVGL7MCfpQjMEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6awkr7ns7nvwjduy"
Content-Disposition: inline
In-Reply-To: <CAPM=9tzJ4-ERDxvuwrCyUPY0=+P44orhp1kLWVGL7MCfpQjMEQ@mail.gmail.com>
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


--6awkr7ns7nvwjduy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: lockdep and ww mutex debug interactions in hdmi tests
MIME-Version: 1.0

Hi,

On Wed, Oct 30, 2024 at 05:03:50AM +1000, Dave Airlie wrote:
> Hi,
>=20
> I mentioned this internally, but wanted to get it on the list,
>=20
> I ran the hdmi kunit tests with LOCKDEP and WW_MUTEX_SLOWPATH enabled
> and hit some issues.
>=20
> With the slowpath we get the occasional EDEADLK to test the paths are
> doing things right, I think you should handle EDEADLK in the tests
> with a retry loop.

Thanks for the report, I've just sent a patch fixing this.

The vc4 have the same issue though, and I haven't been able to fix all
of them yet.

Maxime

--6awkr7ns7nvwjduy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZyNNvgAKCRAnX84Zoj2+
dnHYAYCmb9BlMbfJN8R8G8nv/g9PKERbthavkTc2lQcLC/hZwfLFiL9uMj5pDr92
G/L34LcBgOPxzxsyMmiqDXqWrYg0C1iiyJWhS1PTf/XBwwKpW8+2ytpnjTa04A+q
mAutk+4ehQ==
=BJX7
-----END PGP SIGNATURE-----

--6awkr7ns7nvwjduy--
