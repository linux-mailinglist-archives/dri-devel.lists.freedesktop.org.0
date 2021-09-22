Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F043C41443C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 10:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C2876EB1B;
	Wed, 22 Sep 2021 08:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6074B6EB1B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 08:53:14 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7BE84580255;
 Wed, 22 Sep 2021 04:53:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 22 Sep 2021 04:53:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=vB4ezIS3B/kZC3s/eTN0cuFplTA
 XmSMYfGeoI88X2qo=; b=YsylE5OY/aekw+oI2+1FimeeZRY/2Yo3w7Q4AnyFH/C
 0ih8xf12GaTRWGSGTSa1lN6UtpMTcTfPWnzJzLZyulnDzMLCiqsIOMHgWvvvtM+t
 aRxYTV4nS+BDY+Jp+0Tgjp32cDAX2K9LovlT8axaAZrkNb3g8FlQE0hlxdSHcc6v
 uUazUJciXlMA2np4kTf2XA4jP58ygmsHJhALjr8iW8ds3YWvvsyMuFrxW3dW+xvg
 oVhVSI66rua+eX1nSrT2AGrFsrVYDfuNjuem8BNuK2YVmXG/FVK+ZyojoexASuNw
 Hc2CPhaDFbymXUYb9wF9OYPe8VdgS5NsCJBUHWMZeKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vB4ezI
 S3B/kZC3s/eTN0cuFplTAXmSMYfGeoI88X2qo=; b=fC2KOYeledOkkC0aXAt3K+
 dKvD36fgpb6vnAv1HouSdfS8PJmsHJ8jhtXbGGb9iC/Xj+ZSlG2oWEx6AkoYkon5
 suffel7OAkN/YnqLea9oClqBi5NJqimc8Y6NiZoghzmE4R3RHtJJabaRXFdnj8fN
 zf2mEiVJ9qw5XbV+038Vsl1IA2WGOIvUoIjisaLgYdqMpKblOttTJH/a8FG1R64F
 DR1noMRcccN9iK2qlxgLD0a6PweKrFhR8wrD7ht8NtAMG6s1YMSPoj4hxC5HMI3H
 eRshjJ/OpQNYI1qL+EZVbeZx3oTUTLwA9fVnhcPIUekEPJg5h59MmMslpiM8ud6Q
 ==
X-ME-Sender: <xms:9u5KYekdnmXJHNpxfNoWaC4yZDbFKMDIMpBBkzOiDOyqU4KbopKu2Q>
 <xme:9u5KYV0u9Dvd18g4ZX-oDyXf5gzHYsf__TZf6J-xqn1HKqh3JlnhL-FgeImrf-LIJ
 c8nsmIzVXCsWz2VH3s>
X-ME-Received: <xmr:9u5KYcqju0OvuwONUjkYz6Bu9GX5MgRgU_JTyWtOsiO_PLMOvDJyCEtjRuemy-o7d7uRRzYwZA7xTyCyqdi1PmYYmJITakP5W5-W>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeijedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:9u5KYSmlJ9urbGNWvh4mVJzB7EAtmY5_AdSC33thxwd9Is6TzxDMCQ>
 <xmx:9u5KYc3sU_rz5oyUREwe9hVvDy4C4ZX2INr1dn8wF-y2blmj0sNX4g>
 <xmx:9u5KYZudXpDV8jw8CDYTCg1WodNfJFH5dobYYFeTpQDpH9nUBu7jkQ>
 <xmx:-e5KYeGzPi3o7aXd1E6BUwNERCc7GvHXrLBDt2qHkLcX8pLIPyjrAw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Sep 2021 04:53:09 -0400 (EDT)
Date: Wed, 22 Sep 2021 10:53:08 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>,	David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,	Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,	linux-kernel@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tian Tao <tiantao6@hisilicon.com>, Inki Dae <inki.dae@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 John Stultz <john.stultz@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v4 24/24] drm/exynos: dsi: Adjust probe order
Message-ID: <20210922085308.udvhfbzpn3vpbksr@gilmour>
References: <20210910101218.1632297-1-maxime@cerno.tech>
 <CGME20210910101445eucas1p172f99ff7fe853052fc457861c3174f9e@eucas1p1.samsung.com>
 <20210910101218.1632297-25-maxime@cerno.tech>
 <29a2111d-024b-4d9e-27ef-e3399509ff32@samsung.com>
 <fc1fbd42-6ed4-9d67-2903-8f9cc2aaad43@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="26b3pc6nmf5dnhp2"
Content-Disposition: inline
In-Reply-To: <fc1fbd42-6ed4-9d67-2903-8f9cc2aaad43@samsung.com>
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


--26b3pc6nmf5dnhp2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Fri, Sep 17, 2021 at 02:35:05PM +0200, Marek Szyprowski wrote:
> Hi,
>=20
> On 13.09.2021 12:30, Andrzej Hajda wrote:
> > W dniu 10.09.2021 o=A012:12, Maxime Ripard pisze:
> >> Without proper care and an agreement between how DSI hosts and devices
> >> drivers register their MIPI-DSI entities and potential components, we =
can
> >> end up in a situation where the drivers can never probe.
> >>
> >> Most drivers were taking evasive maneuvers to try to workaround this,
> >> but not all of them were following the same conventions, resulting in
> >> various incompatibilities between DSI hosts and devices.
> >>
> >> Now that we have a sequence agreed upon and documented, let's convert
> >> exynos to it.
> >>
> >> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > This patch should be dropped, as it will probably break the driver.
> >
> > Exynos is already compatible with the pattern
> > register-bus-then-get-sink, but it adds/removes panel/bridge
> > dynamically, so it creates drm_device without waiting for downstream si=
nk.
>=20
> Right, this patch breaks Exynos DSI driver operation. Without it, the=20
> whole series works fine on all Exynos based test boards.

Thanks for testing. Did you have any board using one of those bridges in
your test sample?

Thanks!
Maxime

--26b3pc6nmf5dnhp2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUru9AAKCRDj7w1vZxhR
xTqqAP9CqUjRoyxAvQGCjWFdaNoEsrQKtq/nCmfrA8Q8IiEyfQEAvvCeSnRl1MRL
dPx0RgcMkyY55JZZXZJ3c688AzfVKg0=
=c7ne
-----END PGP SIGNATURE-----

--26b3pc6nmf5dnhp2--
