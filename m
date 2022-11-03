Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 653E961878F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 19:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F2110E7A9;
	Thu,  3 Nov 2022 18:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7539810E7A9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 18:32:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C37E61FBF;
 Thu,  3 Nov 2022 18:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7F0C433C1;
 Thu,  3 Nov 2022 18:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667500371;
 bh=Hck8cjJ+4R3//xB7Q8qTKGJ9aassQ5/yidi0JVA2cWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ejOx1hr62Urb3MPgwsvwVgy8/5u4h4hzChkyJEo5u06oUX+ssYAcJqI6cInVX1LhP
 hOpUu/zXdK9PWCBk+zBXwdNLgiA1YuPzZDawmP11vMRnXpbNoaTCdPoVmeRIn5cNEm
 TFxYWFocut+w26Wm6BgeI8uWEG0Pbin78DGlZU2cNKWl6MdEbuIOxkNHn3TRvraDeF
 HTDIGeYUPnSikE4nctDrqWgR89VPqaMOENOFCyzY7ZGnY6qgXXhXWqgDTrFDdxLB9Z
 zDjBOyxgEBIO/UY5LOuaP1JF7s44fL2UW7JNOJBbbGKR9XUY29oi/ss+9HvRJ7kOmm
 MuTW6+RXC/ECw==
Date: Thu, 3 Nov 2022 18:32:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH 1/2] component: Add helper for device nodes
Message-ID: <Y2QJS+M1xX2RaK1v@sirena.org.uk>
References: <20221103182222.2247724-1-sean.anderson@seco.com>
 <20221103182222.2247724-2-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZW7Ag/fXdrbtoky8"
Content-Disposition: inline
In-Reply-To: <20221103182222.2247724-2-sean.anderson@seco.com>
X-Cookie: Dead?	No excuse for laying off work.
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
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ZW7Ag/fXdrbtoky8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 03, 2022 at 02:22:21PM -0400, Sean Anderson wrote:

> There is a common case where component_patch_add_release is called with
> component_release_of/component_compare_of and a device node. Add a
> helper and convert existing users.

The usual pattern here would be to split adding the helper from updating
to use the helper - it makes things easier to merge.

Acked-by: Mark Brown <broonie@kernel.org>

--ZW7Ag/fXdrbtoky8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNkCUoACgkQJNaLcl1U
h9DfiAf/fccSbdTPcf/MR3+HytglBkaO/HlwepPSW582YcQ2/3q5mNX8QDYVAtq5
4LQR5pjemiBDY+lWTqufmKlDBjw8h9NY0L6v/NApr7x+PK1ZUEW2Ecqc6zcZ8LRT
FzBdTQMO00sV3mkJywGQBQGuqyvZrHYNL1RWP0ZDYoRU+27RZn7zOmnNuiA1g8IQ
AoMLzEGkIxhXEF1cmblJ7JuiB1p694k+nltDrbjqc0FsuGMVbfwOG2sTbHYYZJF2
EcaVTqEpCkwmxU2XAY8lgt4SXVO9m26QvgAFqyHSXOvag/H3HaSPNmNPWpUamabu
UWfwTYDmTIOxKFZxy+b7VIfdb/ZWrg==
=igBE
-----END PGP SIGNATURE-----

--ZW7Ag/fXdrbtoky8--
