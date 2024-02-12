Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1421851174
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 11:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F4B10EC6D;
	Mon, 12 Feb 2024 10:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kg/9eOXy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8D610EC69;
 Mon, 12 Feb 2024 10:50:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8FCF260EEE;
 Mon, 12 Feb 2024 10:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFBCC433C7;
 Mon, 12 Feb 2024 10:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707735053;
 bh=QlROGkmIULv8wlRdpDdYr4K/dcMLXwivushwkTse9T8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kg/9eOXyvqPzqdpWsO9FMRpx4ckvyrTdN0Wxw/X7KKrnPfEYa9qowWq0XVkV1QxUp
 FEh9juse1BmfiFAGpY6/H7Kr9WVatz1qbmRHPQA9KXyL/3gyCAQmrEl2ZBCP/L060Y
 AQXkoh4xMAkDxN2TNV1w1ayLKrnfkziOIjJ/PqfCN8LW/ImLSgqfVWPURgktPpAi3E
 s2XXlm374NA4BsH478une/zrOJHnMig49arnDv50BLUrA1OKROcUoKfiSNV0wkwiVh
 igQF/OPhMtGl+z1lxhIhqWB2O7v6zZJslEtm+ail/Paa2iXK2mvM5TOOVVvgcMWC2T
 2RkyuVpqTLHmg==
Date: Mon, 12 Feb 2024 11:50:50 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@intel.com>, Luca Coelho <luciano.coelho@intel.com>
Subject: Re: [PATCH drm-misc-next] drm/xe: Fix a missing argument to
 drm_err_printer
Message-ID: <axuqklwhbx3yzld6owd37qxrqjjk5ds43nqmdjqpwftaaxnp5p@jebmcdtnaw23>
References: <20240212103833.138263-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="luzdgpqo6yw2ixvf"
Content-Disposition: inline
In-Reply-To: <20240212103833.138263-1-thomas.hellstrom@linux.intel.com>
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


--luzdgpqo6yw2ixvf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 11:38:33AM +0100, Thomas Hellstr=F6m wrote:
> The indicated commit below added a device argument to the
> function, but there was a call in the xe driver that was
> not properly changed.
>=20
> Fixes: 5e0c04c8c40b ("drm/print: make drm_err_printer() device specific b=
y using drm_err()")
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Luca Coelho <luciano.coelho@intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--luzdgpqo6yw2ixvf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZcn4CQAKCRDj7w1vZxhR
xfrCAQCd/bMfLMjWR89pNii+F/SuoxcZhYXtCYSP6/JUgSXJYwEAp/rSNA/TfLoD
hVMnNEh4GSaiZeL0omMSoaHfhHIP+Q8=
=HgxG
-----END PGP SIGNATURE-----

--luzdgpqo6yw2ixvf--
