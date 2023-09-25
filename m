Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306957AD242
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 09:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACC710E03F;
	Mon, 25 Sep 2023 07:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9370110E03F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 07:47:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF4EA60F5A;
 Mon, 25 Sep 2023 07:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C379C433CA;
 Mon, 25 Sep 2023 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695628038;
 bh=ai0ndMiQTr1EgM1mkMSEcaZf/fv6l0ZrtbSfG0oo/dA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ae/o+N14zek9vY+lt5L+r231MVLkY11Kfh0zo33ZxOyod/sJna5kxFd1taJzqjmvL
 AApBTF/+uHBFSHD3ZHc8zuoRJc8iC7RFDv/wBLWevcgz6847H7+InmCCDazqM/s8hj
 HHnfJGPwjrVrt9g7CeO+dUZr4s0zoR1LU2UbNNl3zOs9YSgBmjnB6rjfPk5eHaUDxJ
 Pvr4r8tLwk6+zjfBWeUIkr7cYOtj9JLRcPG8poEHH3DEWdikSHnL4sBUaJoLPHgwcW
 6c/3EoMXerwD9ZzvQ4Yu4+rkQjBUIebQ6MPAxEhlStWRx28v7p6Sx5cvFnKposvKHz
 KhJ5C7u2A2BeQ==
Date: Mon, 25 Sep 2023 09:47:15 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 5/7] drm/sun4i: dw-hdmi: Split driver registration
Message-ID: <rvqcfohw4i4y7amod3a5e4u4tkorqmaekvikyqg3fibvy53dsd@be4lk4ae35hq>
References: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
 <20230924192604.3262187-6-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eocwwgd3x2awngfp"
Content-Disposition: inline
In-Reply-To: <20230924192604.3262187-6-jernej.skrabec@gmail.com>
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
Cc: samuel@sholland.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eocwwgd3x2awngfp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 24, 2023 at 09:26:02PM +0200, Jernej Skrabec wrote:
> There is no reason to register two drivers in same place. Using macro
> lowers amount of boilerplate code.

There's one actually: you can't have several module_init functions in
the some module, and both files are compiled into the same module.

Maxime

--eocwwgd3x2awngfp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZRE6+AAKCRDj7w1vZxhR
xU0jAQCEM+c6zLXLlT5j6S8sGRwxntW1Bcyw5my0XKT7j4XSbgD+JtiNnKl2B/qf
51/BgWAYSfhdkCz0N7MFiMbhOasGLAY=
=zuMY
-----END PGP SIGNATURE-----

--eocwwgd3x2awngfp--
