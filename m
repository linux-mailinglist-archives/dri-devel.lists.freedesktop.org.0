Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7A640A993
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 10:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193F96E439;
	Tue, 14 Sep 2021 08:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BADC6E439
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 08:47:28 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 26AF92B012A0;
 Tue, 14 Sep 2021 04:47:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 14 Sep 2021 04:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=0dt2/BAoIsfEnu/Rsj50e+W3GW/
 O40fHdDZb/rJgECI=; b=mre0lgwyGASablneVh0xTyJj7ag4eSghqVGodCyI6q/
 eyekXLCv0gM78o5aj/pQqZ4d9kUkaqa1pJFuBLhxIWXe/sUrYv0O6J7w71e4qh74
 tCvyyvNJI+HcaifQ0Rvh+QSkyN0cHkenbAWCTulTVl30t37w8EF1BSQyeW8jenXk
 v1MO03pco2LzQZP02Xr278ev3cyLJcRiM2Byua0KvjS6ZzNY2N1yKbtY8vdEORxs
 DbsFz+eF8OUqguU9Ko0Fx82PNisW6ureSCUV2hH47bmv71Gc1AWhvlE5nGqfKVPm
 qVyHveka03x/XyvT/4UyXqkviHRY4PfMEzl3Rw1/bjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0dt2/B
 AoIsfEnu/Rsj50e+W3GW/O40fHdDZb/rJgECI=; b=eS7Ab9fX0kVOObNFXGUw17
 Z2v6pRWNG0wTO0b3GkdpORf3nqze7pdzE2UwH3s1YhZeyMAR1ilezqfqoL7OKQJU
 xT+p57zqGkJDxNQ32RdWoCmlrvMvP4hFdVbZd4hieJR5Y2Z4fcDyHVrOBqtnKB/n
 u9NlSNjwVCsHsEuzgs7xBrbCvyngkIiyyxXSIkGoaC7EfR0JNa/89DeE9aVHluae
 6lJL7mPAytQxWgHXFmLYjerZM93OJ2QVaPdLeVYBb73p9eFqtG/ir83XwpK+cRbL
 jXLeXB9u0ngVyOkYN6jT86TdM8qEuZhNFwY1i8TI2E0kmPrLW2WWNOYN+Xb4Lo1g
 ==
X-ME-Sender: <xms:nGFAYf5p9E_axobDuLh-1kBiqOLG0tWSRIt7usPX5qHlIHlHuJvtZQ>
 <xme:nGFAYU5xaeTVnjsSuypfC71MWU8t9wkOo2M2Hlsv8Nc50T1fTIyLGTf-DUEi7j0LE
 jsu3dZA-9qNcOOVQm8>
X-ME-Received: <xmr:nGFAYWeq-QvRNG8IwRerl-NB_rzMiD48WRN_4wQiYKDyQyilQAJjtB5OQA44WGmJtd7Rp8f-27E1LKEpYJKXB2R5MGcSTjOIeXgr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegledgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:nGFAYQKEPRYnI6__9D45hBtx0GeAA_JCiQ9DBlXlpmM1939XBX9wsQ>
 <xmx:nGFAYTLF5mYtXEyPFEVdrD7PLS-BmpbLIzehIFRmFzjEqDWWCCmx1w>
 <xmx:nGFAYZx-a8zgF41OXMjq2ToE1bSTVAkOKqpWTWWBu4ks6LGGZRBJWA>
 <xmx:nmFAYQAIMZmaUS89DBchgpp9tjn7NejS-FZ1dR62tVTbV4uYNI52OCkXJ3I>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Sep 2021 04:47:24 -0400 (EDT)
Date: Tue, 14 Sep 2021 10:47:22 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/vc4: dsi: Switch to devm_drm_of_get_bridge
Message-ID: <20210914084722.yfjpk5wbwxybtqgg@gilmour>
References: <20210910130941.1740182-1-maxime@cerno.tech>
 <20210910130941.1740182-4-maxime@cerno.tech>
 <YT5ZJjeJ23qjelDv@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v6sesvhkurtlxowf"
Content-Disposition: inline
In-Reply-To: <YT5ZJjeJ23qjelDv@ravnborg.org>
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


--v6sesvhkurtlxowf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Sep 12, 2021 at 09:46:46PM +0200, Sam Ravnborg wrote:
> On Fri, Sep 10, 2021 at 03:09:41PM +0200, Maxime Ripard wrote:
> > The new devm_drm_of_get_bridge removes most of the boilerplate we
> > have to deal with. Let's switch to it.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> With the includes updated:

I'm not sure why they were even here to begin with, I've removed them.

> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Applied the series with your comments addressed, thanks!
Maxime

--v6sesvhkurtlxowf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUBhmgAKCRDj7w1vZxhR
xYTbAP9gtyTJIqafDKNpV5X8+6vgTzQAinp6PedmxB6uv9MPDAD8C8jmDRh0wz5E
VOqGDmc1v3AVKiBev81JwerXzNgoWQo=
=IvkZ
-----END PGP SIGNATURE-----

--v6sesvhkurtlxowf--
