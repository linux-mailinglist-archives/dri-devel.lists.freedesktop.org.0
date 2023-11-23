Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7333B7F68B2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 22:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D882310E355;
	Thu, 23 Nov 2023 21:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC41B10E194;
 Thu, 23 Nov 2023 21:33:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A2BB36172F;
 Thu, 23 Nov 2023 21:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADBCC433C7;
 Thu, 23 Nov 2023 21:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700775224;
 bh=nmgRXoCC/6bVdvvn+DsQpOtnPLlwkOcJBQD/gcvPILU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QX5gnL6JXj8vwBd2hjrgTWmiQNvpaIU3ub8DZJit9Gh0ljsPaGJPx49AWqTyKl4EA
 MxLsTmaI0J08GfBbNmZjOMk5kO/qqeDp4cbPt3UIxlPrCxNX9Ybbo8D/5zN6YIT/c5
 Hnj6bfqt1z0klQSfKgjf1u2TKv2FBCx5URjphkB83BntI5fFoPmHmoZCLyARPTWK6O
 tphuxc8VElCdY2DqFnyhtojL941RLPd+x7YqE3ObFsb0vpG92ljXG0z8CMOuNRgrow
 rasw3VtSw505b5SaknZkPzLjb2F1Etfd4VuPA9L3fLwdIadEeib6E5YIE9YSMXlWfX
 3WbVK/7XEz8bA==
Date: Thu, 23 Nov 2023 22:33:41 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v5 00/20] remove I2C_CLASS_DDC support
Message-ID: <ZV/FNWfw0jdXSglr@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-fbdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>,
 John Stultz <jstultz@google.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xLjxEuZaeN8xgDN1"
Content-Disposition: inline
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqin Liu <yongqin.liu@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, amd-gfx@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, linux-sunxi@lists.linux.dev,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Jocelyn Falempe <jfalempe@redhat.com>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 John Stultz <jstultz@google.com>, freedreno@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xLjxEuZaeN8xgDN1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 23, 2023 at 10:40:20AM +0100, Heiner Kallweit wrote:
> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
> Class-based device auto-detection is a legacy mechanism and shouldn't
> be used in new code. So we can remove this class completely now.
>=20
> Preferably this series should be applied via the i2c tree.
>=20
> v2:
> - change tag in commit subject of patch 03
> - add ack tags
> v3:
> - fix a compile error in patch 5
> v4:
> - more ack and review tags
> v5:
> - more acks
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

I created an immutable branch for this which the buildbots will
hopefully check over night. I will reply with comments tomorrow when I
got the buildbot results.


--xLjxEuZaeN8xgDN1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVfxTEACgkQFA3kzBSg
KbarPBAAkN43LMGC9b1vpMsl5y6W1jnEMTjSF+7tzpFga/xsqL+jL9B/h0bO4NQ4
ATDYno+0o6BwCEUeBSgYEs7/gNJHlWCq2SisLmhVXXOTzWZ09VRSPaXU49gXviog
LZbTffK3ABbQSCBbzAhx6/Aog9BH2md1QBdbrCmkf/+i8OOhDUzPiyz6txmIimC2
6YRBRpLdY1cnme1uvNPJv8GI8UYUgdrYeFQQd4qbPsz5WIzl5/MbMeev4jtUzXC0
exE4jjPds5scEDyf7QdoeOsHRxZ5pGEu6/luiIhN+SFolyYWzX3Yun37Ac1WWmnR
Wo97HN7iUlhAQVQ6phTbiVCp8HISNGiWkh/Z0/NoMPO21Vr4WV1/p4TX+5shPicc
OhBT1NydXft0pPSmT0adOalbsEv4x4P3Oa0I6A+HQCea7Acsz5Ya1+AxY2LehDKz
lyYnz7L0pcF+k3II/wqSeiK8CidamPnVPamCG+Df3F/NDBXEih9jaI23Hkjyp8xM
7AO5GH/0ihgont0oYMIl6bAeK9BGrKOt0AM+fF0dC+byFDGxffRvFwYnPIqJfxCr
6NKvDBM37nY4pHxbDu1b9iamk8WN3tpdrC/XZ8BxqKaciOF+w52ac/v4+znNeo2X
J9U48VknVCyH0l1Fpph+/ukvqwpdWMVtk4GI2wgR7mdFp8c44Z8=
=oQZk
-----END PGP SIGNATURE-----

--xLjxEuZaeN8xgDN1--
