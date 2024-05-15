Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C838C68B6
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 16:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3CB10E36A;
	Wed, 15 May 2024 14:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BFeI6Eu4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9569B10E36A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 14:30:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 023CC6140B;
 Wed, 15 May 2024 14:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DE7C116B1;
 Wed, 15 May 2024 14:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715783424;
 bh=gGILRtmhPe2nXKaL9dnOVNi7GPppKkCM2B0TLvSQGHI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BFeI6Eu4/ENBl7p4/B3tUMbhrrYB0ZIH9VwgJ4QcR36GJ70rvvP5pZEoFulPZa4+X
 If29+7uJE3cTRI/8Sg7eUVm6wJ6aHJ87/SBLMizK3TUsQg8uku0UlLSd+Pmm9Vqkr4
 wAEnn378WXX0IU6AoYsjWlWvCJeRq8BuPX2uMzLc4JS+JPvejqfw7Rgd2PGZcHJa7h
 bjojAWrxP2wi/mmcdSTHMSG1lVIATMQN/ZSvPDk+8Xix7WhthK4LvLtXOcai0EJkpf
 CX1Ui41Bsg6cBUVTxmxcfA83TD6VzBWbqKsFucCbbO/xjhzCOp4Ifb7zRMXIWPNUuR
 5XpwxAaspOoKw==
Date: Wed, 15 May 2024 16:30:21 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/bridge: Add 'struct device *' field to the
 drm_bridge structure
Message-ID: <20240515-fair-satisfied-myna-480dea@penduick>
References: <20240514154045.309925-1-sui.jingfeng@linux.dev>
 <20240514-scarlet-corgi-of-efficiency-faf2bb@penduick>
 <c44480ab-8d6b-4334-8eba-83db9b30ff1a@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="llrm42vacf3vqq5y"
Content-Disposition: inline
In-Reply-To: <c44480ab-8d6b-4334-8eba-83db9b30ff1a@linux.dev>
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


--llrm42vacf3vqq5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 12:53:33AM +0800, Sui Jingfeng wrote:
> Hi,
>=20
> On 2024/5/15 00:22, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Tue, May 14, 2024 at 11:40:43PM +0800, Sui Jingfeng wrote:
> > > Because a lot of implementations has already added it into their driv=
ed
> > > class, promote it into drm_bridge core may benifits a lot. drm bridge=
 is
> > > a driver, it should know the underlying hardware entity.
> > Is there some actual benefits, or is it theoretical at this point?
>=20
>=20
> I think, DRM bridge drivers could remove the 'struct device *dev'
> member from their derived structure. Rely on the drm bridge core
> when they need the 'struct device *' pointer.

Sure, but why do we need to do so?

The other thread you had with Jani points out that it turns out that
things are more complicated than "every bridge driver has a struct
device anyway", it creates inconsistency in the API (bridges would have
a struct device, but not other entities), and it looks like there's no
use for it anyway.

None of these things are deal-breaker by themselves, but if there's only
downsides and no upside, it's not clear to me why we should do it at all.

Maxime

--llrm42vacf3vqq5y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkTG/QAKCRAnX84Zoj2+
dvo9AX9a5QiWezo2NOJlySdtUAQyNsdzN/lWX5aLvyVRCmJNkK/V1srS75EVegBF
nGFUoyABgPBWQK5lWVLa+U3wwCyNoYQ2gTgS6QR2Ggrusqvkk3zxOXvaf2spQ0V2
xv6kQMUBLQ==
=pCFD
-----END PGP SIGNATURE-----

--llrm42vacf3vqq5y--
