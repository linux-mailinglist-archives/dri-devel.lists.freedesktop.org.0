Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7E79764DC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 10:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A4510EB12;
	Thu, 12 Sep 2024 08:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="un8LgfJa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F39A10EB12;
 Thu, 12 Sep 2024 08:49:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E96DF5C5A39;
 Thu, 12 Sep 2024 08:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD668C4CECC;
 Thu, 12 Sep 2024 08:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726130994;
 bh=Jd9v01cP4HdcHyXeVriWTfvX5JxQB/gQYf+5wrKHZvk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=un8LgfJaMwc0B1O2hFKyekGcrGhOjrTXLUZ0mz5WjIQzOnecq1fVTjIapH6l3kzUl
 wD3xsqShyM91POfJcZInF7K/Oahh7mS4zFJD9nHtP4Ecq3qD5+190JxV8KJHFRFr9Q
 M2HHC+OF+jjYKsjNxNo4NuRYaVKUSvF/qsfocQOq6pSO77887TYid49iXso9DBD/+l
 9XeiZYEYV3ZTI3lI5wLawQKZMPYTN6YvHP2v1H0zyYSBxTxegG4wk0/75omO7x7fhg
 Qscv42alQRqm9djGzGxW/w+H3Ki2MmFwLU4ZLbAHp0YWVFdKcln+9dZZYmmrdYIHME
 A93kD2miphCUw==
Date: Thu, 12 Sep 2024 10:49:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, 
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc-fixes tree
Message-ID: <20240912-attentive-brown-crab-cefccb@houat>
References: <20240904163018.214efaa7@canb.auug.org.au>
 <20240911180741.45311006@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nok3d3zohz5eelhj"
Content-Disposition: inline
In-Reply-To: <20240911180741.45311006@canb.auug.org.au>
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


--nok3d3zohz5eelhj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 11, 2024 at 06:07:41PM GMT, Stephen Rothwell wrote:
> Hi all,
>=20
> On Wed, 4 Sep 2024 16:30:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the drm-misc-fixes tree, today's linux-next build (htmldo=
cs)
> > produced this warning:
> >=20
> > Error: Cannot open file drivers/gpu/drm/drm_bridge_connector.c
> >=20
> > Introduced by commit
> >=20
> >   9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER modul=
e")
>=20
> That commit is now in Linus' tree, but I am still getting the warning.

I just sent a fix for it

Maxime

--nok3d3zohz5eelhj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZuKrLgAKCRAnX84Zoj2+
druDAX4mW7CyP7Cq/p7kOEhweCTJHolFMFcZqkHJ31gsMZ2X6hw11IwTrq5Za58w
ANO3ZtsBewdb/gOa642wDfucqt8bKuS7BtvSoPvY7gZvT1iIWB6LUQ462j+g07/H
CoSKQerTHg==
=786n
-----END PGP SIGNATURE-----

--nok3d3zohz5eelhj--
