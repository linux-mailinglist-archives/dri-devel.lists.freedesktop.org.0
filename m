Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FF5786B00
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 11:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACBC10E504;
	Thu, 24 Aug 2023 09:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A171010E504;
 Thu, 24 Aug 2023 09:03:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FC60667B5;
 Thu, 24 Aug 2023 09:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086BFC433C7;
 Thu, 24 Aug 2023 09:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692867794;
 bh=Z8KlcqN4v0YazhOwIq0aooQp2XTZu97r8b9euGXZqoA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=caA6GBHu/rOcwKFHL012iyP6ZEaKUsOat1S1YC1dfWR4Lqik3t3Y6lKJxSjrghpFl
 eaGr8w/TJGs11oiNM6Egg6TmlvlPAS4K2QfVXmK4JIBGVtL/iEA1vdXseCXtmkBQB0
 6/pNQSqA1csldlXoyrGC/JJt7+FP3BvnB8274YrIHH8Nyt5TEHH30cOhTvjZQt83ox
 nYoAFqA3uE5Q9RZP6HtsfWH7c5ls2gnpCqFhX6He14cgpnh0lwqYWQIGK8w6Y6+b8T
 FyDVC4rNvGvDSsGcfoGn5AF7pT0Oxl/2+A+IhPSUGEkQ4X32P/v89W5LfuKo2YlrFt
 wrdK6+FeYX6jg==
Date: Thu, 24 Aug 2023 11:03:11 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH (set 1) 00/20] Rid W=1 warnings from GPU
Message-ID: <pkjgu5hfazblvlnolvsbzo6zt7yq4zldjmmuoufgv5txvzdiyc@2vplkaitfypc>
References: <20230824073710.2677348-1-lee@kernel.org>
 <169286759481.453038.12943953579128536191.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s4bcoziyhif3xhyv"
Content-Disposition: inline
In-Reply-To: <169286759481.453038.12943953579128536191.b4-ty@kernel.org>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, NXP Linux Team <linux-imx@nxp.com>,
 amd-gfx@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-media@vger.kernel.org,
 Stanley Yang <Stanley.Yang@amd.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, linaro-mm-sig@lists.linaro.org,
 linux-tegra@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Hyun Kwon <hyun.kwon@xilinx.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Jerome Glisse <glisse@freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Gourav Samaiya <gsamaiya@nvidia.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--s4bcoziyhif3xhyv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 24, 2023 at 10:59:54AM +0200, Maxime Ripard wrote:
> On Thu, 24 Aug 2023 08:36:45 +0100, Lee Jones wrote:
> > This set is part of a larger effort attempting to clean-up W=3D1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> >=20
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: "Christian K=F6nig" <christian.koenig@amd.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Danilo Krummrich <dakr@redhat.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Gourav Samaiya <gsamaiya@nvidia.com>
> > Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> > Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> > Cc: Jerome Glisse <glisse@freedesktop.org>
> > Cc: Jonathan Hunter <jonathanh@nvidia.com>
> > Cc: Karol Herbst <kherbst@redhat.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-tegra@vger.kernel.org
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: "Ma=EDra Canal" <mairacanal@riseup.net>
> > Cc: Mario Limonciello <mario.limonciello@amd.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Michal Simek <michal.simek@xilinx.com>
> > Cc: Mikko Perttunen <mperttunen@nvidia.com>
> > Cc: nouveau@lists.freedesktop.org
> > Cc: NXP Linux Team <linux-imx@nxp.com>
> > Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Shashank Sharma <shashank.sharma@amd.com>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Cc: Stanley Yang <Stanley.Yang@amd.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >=20
> > [...]
>=20
> Applied to drm/drm-misc (drm-misc-fixes).

I got confused with b4 usage, but that wasn't actually applied. Only the
three patches I explicitly mentioned were, sorry for the confusion.

Maxime

--s4bcoziyhif3xhyv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOcczwAKCRDj7w1vZxhR
xcTFAQCQGXPUBXnODsaFgiEuFrckjOE5PisQ37NiNjGWWZt44gD+LVUnaHSq7tTE
6GayDpzLrPM2MsMV5u6yhfmhsd7IRw4=
=b2pz
-----END PGP SIGNATURE-----

--s4bcoziyhif3xhyv--
