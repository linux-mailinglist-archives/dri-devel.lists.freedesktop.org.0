Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92684439A30
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 17:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7906E16F;
	Mon, 25 Oct 2021 15:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AC06E15D;
 Mon, 25 Oct 2021 15:16:39 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id C5BA45806D1;
 Mon, 25 Oct 2021 11:16:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 25 Oct 2021 11:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=D4bLfD9dgR7qDPZz1c2NJXrKeyz
 Cs/YSQzcSXsgDvWg=; b=QCOs+ZNnLFEb1BYhWJdlYJEDlasbqwKAF0qVOeziiAI
 K0Wn8u4hvJ6O9fhAwN+Vcq45oZZ3elyvAPkX9cuF1jIJu0O9zX1xknPWe7xw0klP
 y2ZFbdgYyn7WFmChP8orE01Anpw6ZxSiIa+AzuGb0enpRRpSTlkqbVJUng/pOpCP
 cvP8DIbeRzDY0g06WEOHqD0T7g8D/t+QXCUHi9BWHw+xdvrhaVPYj1pbO3FMfaWB
 qK3gRf3HO3OW349bzNZNvn+CWG4hoN+h/ppU5v1DeCs5dE0qQOV9WI2SgnTloAvg
 //adJ76SZXChxzVNid+3T1NlynwhoshxrJJsanlSTYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=D4bLfD
 9dgR7qDPZz1c2NJXrKeyzCs/YSQzcSXsgDvWg=; b=IP1xyiXuWxBCBd8vYnrWwC
 chI+gem54xqqu9EFECP2wgiXsZJbEvD1X9N3SfnpdFoGabdjaVm11ScRzfk/ubex
 +QVbfybZ4RUfvO9uw9UXZ5QirROap/xH+gB9xpIPgixzjF5sBLh/ybc6X0W2RqlP
 CXHec+4bLFJAzIj1GcLZkf5zwqgze0p0g3amfOjJ3a+/49X4eveo76ICyojMVngf
 YrGBIyEj4war4fnFBoeIJP1SWMWllOH4QhysvSQ+Mm3M7UH3C+g20q9Ec2BixwoX
 oJ3vEHdBtu8fTh3GpWfKpEsNEF2Olq70p/ZkpnAoxYnQGPEThYQIKfLlyOmSiJ+g
 ==
X-ME-Sender: <xms:Vsp2YTzLI-lWf4gWFlFSIAr-KY96qgJ-fDpksW1oKYmu-oKUwWp8IA>
 <xme:Vsp2YbSMGxh6EZaxcktQBOnL4zBBq5l0IWptj0fWFCrdCw8x1GugQ7EhZrfcCrROT
 w2w0PPVUUUZPgi2P-8>
X-ME-Received: <xmr:Vsp2YdX4dMnSvkLl-OsyXvG9gMXio7UHJG02W5wI3QYi0hOZal1mDXmsjp1HMXmajv0s3BGhSSf7vjzYs31YR3UYoAmlzQyv-G4az68N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Vsp2Ydi8nD0-KAhUReZShBdheQbeicblLxZVMH9F6YwnRgAGmCIshw>
 <xmx:Vsp2YVA8yrCLKfNlUsf6mtu4-xEn4QTZptHVVfDtA1adJZz56XmLYw>
 <xmx:Vsp2YWIq8nL2OQ_H_el1-60fX19AIQtgiqQe43U4nSish4LDC-H-Ag>
 <xmx:Vsp2YQUIHmoQgLTv4MjLLPVJlKELz9QKKhYwyX7xdzp_WdJ8Q4kwvA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 11:16:37 -0400 (EDT)
Date: Mon, 25 Oct 2021 17:16:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,	David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tian Tao <tiantao6@hisilicon.com>, freedreno@lists.freedesktop.org,
 Chen Feng <puck.chen@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 John Stultz <john.stultz@linaro.org>,	Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org,	Sean Paul <sean@poorly.run>,
 Inki Dae <inki.dae@samsung.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 00/21] drm/bridge: Make panel and bridge probe order
 consistent
Message-ID: <20211025151636.dsc3akojm7ywoecm@gilmour>
References: <20211021073947.499373-1-maxime@cerno.tech>
 <YXGFz4o5fWrfGnGk@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3qjpa2xa76ueomsl"
Content-Disposition: inline
In-Reply-To: <YXGFz4o5fWrfGnGk@ravnborg.org>
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


--3qjpa2xa76ueomsl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Thu, Oct 21, 2021 at 05:22:55PM +0200, Sam Ravnborg wrote:
> Hi Maxime,
>=20
> > Let me know what you think,
>=20
> apply the lot to drm-misc-next. Maybe wait for an r-b or a-b on the kirin
> patch but the rest is IMO good to go.

I had a compilation error since the rebase of the v4, so I sent a new
version. John Stultz has tested this series and given his tested-by, and
is the kirin maintainer.

I guess it's enough?

Maxime

--3qjpa2xa76ueomsl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYXbKVAAKCRDj7w1vZxhR
xTxXAP98t442n6HxxRUgrl5mGMNjKHZ0TTJhGYni7sAlWVGvsAEAuk3303Gnx9f9
LeU+JY3jE8IazEwdHOzyzxzY50X/LAU=
=hbta
-----END PGP SIGNATURE-----

--3qjpa2xa76ueomsl--
