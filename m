Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997D0818812
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 13:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6029B10E231;
	Tue, 19 Dec 2023 12:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCE310E231
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 12:55:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9C2B0CE181E;
 Tue, 19 Dec 2023 12:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84EB9C433C7;
 Tue, 19 Dec 2023 12:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702990516;
 bh=iqbTkJE/kFb6PPq0syjfJC3eznEYOBBXqJD92Sg+bSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BemzYmdppMBq3ngm33vsXSgndG7PuSv4kxKUFHXX6J6iXIAc/OL/kQQ0tf47iBRgM
 7nw7lU2aM6uejG8LY8xt687oh1OxKyO5ugoDjlG40VsGbPfG7nsmXoOOnrGg+OKcFe
 NMMFJPb3ZlVtqXr2XiHxXSLQGxFj5v5k5BiVfsEq4QtxH2ADYFdVvFYWFHbJr5PlaQ
 yeV83j4Lce7ynDXooiKCexGsMzGQvwQXdTZLcEJCHxcnFFgiNvS6cdoiXG2yffLkmw
 LDw4aSo32b3yBIshn3CeDEzW/w/YkUeFN5JpS5tW2l2vjJQK0vjHX/kRiiqlWgjgA3
 AsK92ELQqKTEA==
Date: Tue, 19 Dec 2023 13:55:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/rockchip: rk3066_hdmi: drop custom fill_modes
 hook
Message-ID: <evaq3yfbqf4gchsps2qoojemtii7tmcss24aruiuze5kkzlnhy@mih7rky7viqz>
References: <f86ec29f-194a-800d-0aaf-9e16e551b37d@gmail.com>
 <410b116b-cb63-7ba7-3689-4f0832ab5796@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fhhc2p3e2bqgegpc"
Content-Disposition: inline
In-Reply-To: <410b116b-cb63-7ba7-3689-4f0832ab5796@gmail.com>
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
Cc: hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 tzimmermann@suse.de, andy.yan@rock-chips.com, airlied@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fhhc2p3e2bqgegpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 18, 2023 at 04:49:06PM +0100, Johan Jonker wrote:
> CRTC size validation for the display controller has been added with
> Commit 8e140cb60270 ("drm/rockchip: vop: limit maximum resolution to
> hardware capabilities"), so we can drop the custom fill_modes hook.
>=20
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

I'm not sure those two are equivalent. CRTC and connectors usually have
different requirements and capabilities, and thus different,
supplementary, mode_valid/atomic_check implementations.

Maxime

--fhhc2p3e2bqgegpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZYGSsQAKCRDj7w1vZxhR
xaOfAP47dRFiVGd7R/o+q+Utk5341Z7rt2jlf3mk8SWj4yz56gEAgEsj32uxPsfc
sbBYzBbBTn1lTci++BiPymZmkwWfSAo=
=HFiP
-----END PGP SIGNATURE-----

--fhhc2p3e2bqgegpc--
