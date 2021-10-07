Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7129425329
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 14:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2EC6E840;
	Thu,  7 Oct 2021 12:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6886E840;
 Thu,  7 Oct 2021 12:35:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AAFA360F93;
 Thu,  7 Oct 2021 12:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633610156;
 bh=6N4+qgtMfBxspS0JmtTqIeZ5IOVPp5soyqeLUMpHPSE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bRwwZH5wCt6PdnH0bLE8X/7hjayq5WPI7EROZPn9tThH7u3t2Hxayiw6SNgVRVWIb
 kLX4mR10NcyLQJ1rLJb9JbxknYSSszwmxPPu6k2AkRtvUivNxOVBejrnziraGKM9q2
 ayNJMrQzulHIkt3shn88BvD0zj5flvSn5jHEydatSmgTGDpSonvUqP3VUnH5S5XJLX
 i3bJWglcaO1aDY+RtFCu13LyKSObSSferLGNQCO/rqZ55U46w/W+eRXGaLdmzeCWAh
 kQRxPb32QwTLkOFpuBsaMxKdqGB7eNTjV0PjAz6lcSw+o+SnVcfImMtHGhFzz4w5cB
 gGImsO/t1tG+g==
Date: Thu, 7 Oct 2021 13:35:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v2 31/34] ASoC: codecs: wcd938x: Migrate to aggregate
 driver
Message-ID: <YV7pqY2FMaYy7Vkq@sirena.org.uk>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-32-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1Flv7GPR/yQ1psFZ"
Content-Disposition: inline
In-Reply-To: <20211006193819.2654854-32-swboyd@chromium.org>
X-Cookie: Colors may fade.
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


--1Flv7GPR/yQ1psFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 06, 2021 at 12:38:16PM -0700, Stephen Boyd wrote:
> Use an aggregate driver instead of component ops so that we can get
> proper driver probe ordering of the aggregate device with respect to all
> the component devices that make up the aggregate device.

Acked-by: Mark Brown <broonie@kernel.org>

--1Flv7GPR/yQ1psFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFe6agACgkQJNaLcl1U
h9BXYwgAhSJ8+Nsp/fnvma50fxoPjfxJlaILrA7KNR4UFgO76J6jeemfnwtDi7DE
jGs0zTwsvrRHcoqkLmc0pDv/zDc4uKIQuudO34AtZ6VHq0ZZ4mAFoIITNIUQuQoH
8OSes8CDhwe6a7jZqIhk60LbcQPuW83UefDgPsqO6jHZXFDE52Ix/YAnYvj3gLE3
b5sfypPKzUgntV6rlsvZ88N7TJZFuQEFFaE5k/DBZmA6ksuZvzsCxiK4JKFgpqir
16b+m/CPV5x/KNkJ3RLTqOMkkIs7N0Uu/k7ykroYdkRe9qBTrUCyJpM7JtFO/Ix6
8pSYl3GgK/QD+f05XZ4Yj7VcQWESPQ==
=XOZo
-----END PGP SIGNATURE-----

--1Flv7GPR/yQ1psFZ--
