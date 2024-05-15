Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B013F8C6916
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 16:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCEEC10E04B;
	Wed, 15 May 2024 14:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WSTDR7vc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE17510E04B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 14:58:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 58246CE171D;
 Wed, 15 May 2024 14:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6AF9C116B1;
 Wed, 15 May 2024 14:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715785123;
 bh=H4fvttaW5ayZbuhZGdEunUdzP2phRBo1WR9XclwqbBA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WSTDR7vcNt1KrNEwvkAlMGG6a0Qo9/t5SF3cOP3RroxNld3mBPBTaWAapgj38N44L
 UMezzf6AULi4TxjtPWMNzRZVgxEQaoMKYffcIyBTZhl2VTXhK43lSWXiwuy4HREKBq
 xSbw5wfswH747qb3wIBb0Ny8u7hw+HRZGY1vvc5amWd0juw1oEkSdFYQH9L3jPId2/
 BMJPGj9yU2c1t63t/Amii0IcXTRm8qzG9T0Je1lzj+RrA2aXcdZT/Kt8C2CzDCgG0d
 hQXWc+/nYJz3uOr4JNwaaJDcWxYu8DF6d+gNg6jH3KCXTlH8MpD7r9Bvkwfm42ITaV
 eaMvBA5I+vMdw==
Date: Wed, 15 May 2024 16:58:40 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/bridge: Add 'struct device *' field to the
 drm_bridge structure
Message-ID: <20240515-copper-chimpanzee-of-fortitude-ff3dab@penduick>
References: <20240514154045.309925-1-sui.jingfeng@linux.dev>
 <20240514-scarlet-corgi-of-efficiency-faf2bb@penduick>
 <c44480ab-8d6b-4334-8eba-83db9b30ff1a@linux.dev>
 <20240515-fair-satisfied-myna-480dea@penduick>
 <d394ee32-4fa4-41a8-a5ca-c1c7f77f44d2@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nnqcwypgq74a2js6"
Content-Disposition: inline
In-Reply-To: <d394ee32-4fa4-41a8-a5ca-c1c7f77f44d2@linux.dev>
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


--nnqcwypgq74a2js6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 10:53:00PM +0800, Sui Jingfeng wrote:
> On 5/15/24 22:30, Maxime Ripard wrote:
> > On Wed, May 15, 2024 at 12:53:33AM +0800, Sui Jingfeng wrote:
> > > On 2024/5/15 00:22, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Tue, May 14, 2024 at 11:40:43PM +0800, Sui Jingfeng wrote:
> > > > > Because a lot of implementations has already added it into their =
drived
> > > > > class, promote it into drm_bridge core may benifits a lot. drm br=
idge is
> > > > > a driver, it should know the underlying hardware entity.
> > > > Is there some actual benefits, or is it theoretical at this point?
> > >=20
> > >=20
> > > I think, DRM bridge drivers could remove the 'struct device *dev'
> > > member from their derived structure. Rely on the drm bridge core
> > > when they need the 'struct device *' pointer.
> >=20
> > Sure, but why do we need to do so?
> >=20
> > The other thread you had with Jani points out that it turns out that
> > things are more complicated than "every bridge driver has a struct
> > device anyway", it creates inconsistency in the API (bridges would have
> > a struct device, but not other entities), and it looks like there's no
> > use for it anyway.
> >=20
> > None of these things are deal-breaker by themselves, but if there's only
> > downsides and no upside, it's not clear to me why we should do it at al=
l.
>
> It can reduce boilerplate.

You're still using a conditional here.

Maxime

--nnqcwypgq74a2js6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkTNnwAKCRAnX84Zoj2+
dpZCAYCvwVAwC/xH/sNA6jr+W48uYJHUiGFm1EaRagcrEpn+Vmm6ntjQFe8LLIpl
eQetDGgBgN4V7i9OmkXkcdhGNkhsT/oGnh3L3/mF7PFNx89Z5mm5Cnw9b0axTGbn
lAqrW3gWLg==
=4/O0
-----END PGP SIGNATURE-----

--nnqcwypgq74a2js6--
