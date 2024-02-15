Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E54856965
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 17:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AB910E9C1;
	Thu, 15 Feb 2024 16:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="faTn9wRE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D45C10E9C1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 16:18:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AA1FD60F1B;
 Thu, 15 Feb 2024 16:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F98C433F1;
 Thu, 15 Feb 2024 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708013898;
 bh=rFj7ZYPGwt3dukN6sX7sSwBG4zymzqaxZX0faqq5PT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=faTn9wREIGVbMi3iKWssOUTbmYXdeevgcoxpixVSlGSXGr4Qm8mQWDsBr9DRlRXeQ
 8nU9lWzLBKVctMGSbDB48iHAZxL9F/LkWQALSKZRMaArmpPzhVbEZg0BEP59JEl5Pd
 hVwuYrj8CI0jvC27KAmFmHi3dDUhme6ZgY+Zn/We/nSfIxfJxO1Cm3BJtUUKmp4JMV
 m2mml3i+7r0LhBP/jpHCdFcoKAHXx1L5f2uXSAp4tZN82vkhZqAKuH9FqGbQmzJIDe
 KGlfV3wE+Rv7hfUPZQUikhO4XrMPV2sc7O21zYL3dr5BaaQCATB83ghUi0tUy7P0Ap
 Q5mUZ4DKGdUBQ==
Date: Thu, 15 Feb 2024 17:17:24 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Sarah Walker <sarah.walker@imgtec.com>, 
 Donald Robson <donald.robson@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Javier Martinez Canillas <javierm@redhat.com>, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Message-ID: <kycepdxukfsww3tnxoo5hoiuo3vcgpqqmynokzhtl4vodgm6zc@ih4uhw7gz4jh>
References: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vsdlmxoxczgidwuf"
Content-Disposition: inline
In-Reply-To: <6be2558b8462fc08095c24c9257563ab5f3ae013.1708001398.git.geert+renesas@glider.be>
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


--vsdlmxoxczgidwuf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Feb 15, 2024 at 01:50:09PM +0100, Geert Uytterhoeven wrote:
> Using the Imagination Technologies PowerVR Series 6 GPU requires a
> proprietary firmware image, which is currently only available for Texas
> Instruments K3 AM62x SoCs.  Hence add a dependency on ARCH_K3, to
> prevent asking the user about this driver when configuring a kernel
> without Texas Instruments K3 Multicore SoC support.

This wasn't making sense the first time you sent it, and now that commit
log is just plain wrong. We have firmwares for the G6110, GX6250,
GX6650, BXE-4-32, and BXS-4-64 models, which can be found on (at least)
Renesas, Mediatek, Rockchip, TI and StarFive, so across three
architectures and 5 platforms. In two months.

We won't keep up, and there's no point in trying to. Especially so when
the only benefit is for make defconfig users to hit 'enter' one time
less.

Maxime

--vsdlmxoxczgidwuf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZc45EwAKCRDj7w1vZxhR
xQsQAP0WlGML9yfIPbBp7h40rujXE/j6/8TXbZpzP+yf+r8OhgEAzvPX0Jj707Lw
BKCOCLJsjgNZ3TD5SLNovdPUI1epCws=
=ytBJ
-----END PGP SIGNATURE-----

--vsdlmxoxczgidwuf--
