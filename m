Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD15BA4C15A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 14:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B7710E40B;
	Mon,  3 Mar 2025 13:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fiO7yk6W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64AA10E40B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:11:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6AD345C5887;
 Mon,  3 Mar 2025 13:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D86C4CED6;
 Mon,  3 Mar 2025 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741007468;
 bh=u+X9SKWkfe/2MAlFWd/PUqWxSiWY2RlGsvB38Uys+ws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fiO7yk6WFCkp5XAHvs0ZEydMfZKskSOX1c+hcaCRvOkuTzjGhzB7/hSzHayzjUWbd
 LCv8lHnpL0TzcUaUgaEeHKy16fQSbNG9YQwtggaFE6+IwItajHskOZqHBtPgIMmMuT
 noP4wEmwwDjaPAAbA1ESrQBRnGXRvpmAyngUI1AGG/JJPVguBwEg8I6+RdMQXtNVJ9
 oZOn1y2MuEEdQC6rvtj3y1L9Un28uM1Bne8S599BESVt9tgcREU+l/nI26npcuKb65
 Dc4e6M2LQwBlWvgQa/OEExJi+FVm2Yu9UwF+CHuGDkAa5TyrjOmUqOocDAQ0WkwD7Z
 +G1u2tipjQ/cg==
Date: Mon, 3 Mar 2025 14:11:05 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 00/15] drm/bridge: Various quality of life improvements
Message-ID: <20250303-urban-trout-of-vastness-f8d0e7@houat>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250227120004.77814e09@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6ogcuu3aoimpjkf7"
Content-Disposition: inline
In-Reply-To: <20250227120004.77814e09@bootlin.com>
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


--6ogcuu3aoimpjkf7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 00/15] drm/bridge: Various quality of life improvements
MIME-Version: 1.0

On Thu, Feb 27, 2025 at 12:00:04PM +0100, Herve Codina wrote:
> Hi Maxime,
>=20
> On Tue, 25 Feb 2025 17:43:48 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
>=20
> > Hi,
> >=20
> > Here's a series of changes after to the KMS helpers and bridge API
> > following a bunch of reviews I did.
> >=20
> > It's mostly centered across providing an easier time to deal with bridge
> > states, and a somewhat consistent with the other entities API.
> >=20
> > It's build tested only, with arm64 allmodconfig.
> >=20
> > Maxime
> >=20
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
>=20
> I Tried to test this series on my system but I've got a compilation issue.
>      depmod: ERROR: Cycle detected: drm -> drm_kms_helper -> drm
>      depmod: ERROR: Found 2 modules in dependency cycles!
>=20
> CONFIG_DRM=3Dm in my configuration.

Could you share your configuration? it doesn't happen with allmodconfig.

Thanks!
Maxime

--6ogcuu3aoimpjkf7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8WqaAAKCRAnX84Zoj2+
dl44AX48FfLtjeWPDYOrJjaK7AmFHqbLJVJ/+oSpco54gcXJ9+H7Qr8QWPAgLL00
tV3msvABf2WYTbjD4nVOHP0Mn828ZtNNPjod/zsu6d3Q/Rw5xaDFjUenEIHvQi5E
W2A0IVrirQ==
=V5Ne
-----END PGP SIGNATURE-----

--6ogcuu3aoimpjkf7--
