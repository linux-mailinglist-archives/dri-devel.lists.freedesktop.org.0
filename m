Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A15AC6970B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 13:40:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE1489870;
	Tue, 18 Nov 2025 12:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OQOC0tJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FEF89870
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:40:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 022F04360E;
 Tue, 18 Nov 2025 12:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5CE2C2BCAF;
 Tue, 18 Nov 2025 12:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763469640;
 bh=zgoAW+MKrpfg1uHwgbKAoMpPKel/678SmypcyKDrNWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OQOC0tJ2rHxF8sGrASXR6kCdqcfVaRS3v6AjY1UE+Zkz0CFE1Ses0Jv7oSWlbCbXp
 dXglHLDtc0N0bKcNgneCWdpGnvwzOHehkOMGPI/uOuacqYmQWFWWnMz6DVPx3iWreB
 gfYH+6zlpXm4r63c0Sc88K9pAVNHSjXjSXyB31sLjre5aOLF+Ib6AQa2/fg3iFzAfN
 xp8P5GXenTFJgnOtkm23ucEIKsSQd0/msQcCIkcoGwkgbc7xSSVfmDJjFkc8bs9oW4
 bbApmPObKTrbo+afOdjg2777zxdbOHqZ7kO2FtMJWd80vNeV2Km2mnYN5C58HNN7gU
 H9v88yFiQ56bQ==
Date: Tue, 18 Nov 2025 13:40:36 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Harikrishna Shenoy <h-shenoy@ti.com>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 andrzej.hajda@intel.com, andy.yan@rock-chips.com, aradhya.bhatia@linux.dev, 
 devarsht@ti.com, dianders@chromium.org, dri-devel@lists.freedesktop.org, 
 javierm@redhat.com, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
 linux-kernel@vger.kernel.org, linux@treblig.org, luca.ceresoli@bootlin.com,
 lumag@kernel.org, 
 lyude@redhat.com, maarten.lankhorst@linux.intel.com, mordan@ispras.ru, 
 neil.armstrong@linaro.org, rfoss@kernel.org, s-jain1@ti.com, simona@ffwll.ch, 
 tomi.valkeinen@ideasonboard.com, tzimmermann@suse.de, u-kumar1@ti.com
Subject: Re: [PATCH v9 0/6]  MHDP8546 fixes related to DBANC usecase
Message-ID: <i7byagpaadjjhc6rbqvejsxezn2eeomtw2ddpxirwjuezfdf3x@tez2ooxn76dv>
References: <20251118115255.108225-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="qhmshqggmbwgutxm"
Content-Disposition: inline
In-Reply-To: <20251118115255.108225-1-h-shenoy@ti.com>
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


--qhmshqggmbwgutxm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 0/6]  MHDP8546 fixes related to DBANC usecase
MIME-Version: 1.0

Hi,

On Tue, Nov 18, 2025 at 05:22:49PM +0530, Harikrishna Shenoy wrote:
> With the DBANC framework, the connector is no longer initialized in=20
> bridge_attach() when the display controller sets the=20
> DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.=20
> This causes a null pointer dereference in cdns_mhdp_modeset_retry_fn()=20
> when trying to access &conn->dev->mode_config.mutex.=20
> Observed on a board where EDID read failed.=20
> (log: https://gist.github.com/Jayesh2000/233f87f9becdf1e66f1da6fd53f77429)
>=20
> Patch 1 adds a connector_ptr which takes care of both=20
> DBANC and !DBANC case by setting the pointer in appropriate hooks
> and checking for pointer validity before accessing the connector.
> Patch 2 adds mode validation hook to bridge fucntions.
> Patch 3 fixes HDCP to work with both DBANC and !DBANC case by
> moving HDCP state handling into the bridge atomic check in line with=20
> the DBANC model.
> Patches 4,5 do necessary cleanup and alignment for using
> connector pointer.

It's mentioned several times in your series, and it might be obvious to
you, but documenting what is the "DBANC framework" is would be helpful.
I have no idea what it's about, and it appears that Google doesn't know
either.

Maxime

--qhmshqggmbwgutxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaRxpRAAKCRAnX84Zoj2+
dni2AYCzz3E6Wdmf8lSzqDg4nMtHu/R5bVy3Mh9QHF++gN/Itj7liJ+hR8RC2iG1
aRCXzaUBgOzAwerbb+Roe4/3wl5ZGHZ1HpGz9JJk8uFqRVcDA2eGk38LgNY4ytC8
IbjnGuBQkw==
=FkrI
-----END PGP SIGNATURE-----

--qhmshqggmbwgutxm--
