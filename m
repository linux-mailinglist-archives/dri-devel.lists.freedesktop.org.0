Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47042415A18
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 10:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9316E0E5;
	Thu, 23 Sep 2021 08:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153FE6E0E5;
 Thu, 23 Sep 2021 08:35:38 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 798C4580B93;
 Thu, 23 Sep 2021 04:35:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 23 Sep 2021 04:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Mv1dM1XlluWkxjEGeV7otIr7/fs
 pJ3KHQ2KiFAG61OM=; b=iK1NTf7ptyEzO5VBw4byNjaHAZ3Og3z8XlZq5eDNBER
 hN4M2ipGBufUVq5sRz8xpA+52wM7zCRWOpQDuMtQEIGPonQQ+kHTsHVODUAPcLEO
 e+PUW04t/5QxLqUUam4LygFwLm2S/UYZ6KxwCwW5LY5bpObnS0sw7U3eJlR7VGdN
 zsQeTmkPcCDJEqWCyARbEUjUdwfLz42E4gEIp/RgrOIJkBvguOtJobQ1BPz3Z+g3
 5KLRxxW5AQeti0sVcnb8QhHz9e8/hsrrNTf3hgT0H2Xp2jsOoUuUKLgEPSJ5wvLW
 C3HaJYqwHCgA73E+a1LPZlhq0esI8dO/lBnopYh0YZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Mv1dM1
 XlluWkxjEGeV7otIr7/fspJ3KHQ2KiFAG61OM=; b=INs6UivT4gDkWulgonwMIk
 Z2oukmma9XBPVeE70nRmC1g3YNl1Vgxq19vVK9IgPvVmJHSLT0140jYKCU9Td/N0
 gjwUZMMc2gXMYvE/yPD314KaHv0jJ/vKKzVRz3SwogItRr5dyR516p6GqQ0LIYHJ
 d4c2/e4C/RP+97dYcBxMV23eTxFLeToGWNv2KPvqidaU3ccfBir+pc9w9s88V3f0
 f7hdJKUMOsDKwRLOP2pmD7dYTNDiSLRw8DwWkuu+pWFtQ04YPjZD4M0uXJjn8vnt
 x0FTPEpp4b/IQwFnK3YxeNq3DojCyNhhh8tI1Ycv7uDqBBOQTBrYXFpsSpz8Nltg
 ==
X-ME-Sender: <xms:WDxMYZHsTZSEyAHOe90ZZM5Q4LtbaOdyBr6XE6zcruZoTvsMBCpvpw>
 <xme:WDxMYeUbWkP4_tkMYqMvpWgainrHqWvXZk9scS4KCgtXEvfA3-5ByumW6jvBoJi4o
 Y6EhNschSNzu0tftag>
X-ME-Received: <xmr:WDxMYbL26eYZ0Zbx81hiOY8CH8ColBLKSErA7WtT5ZSMqEO1bR68PTXR2bIOXmVVJEgZqCtFEGlpiBX7rfDWV81M0gNyxnJUAjRE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeiledgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WDxMYfFhPZJqW7gul9C4fVQQwdbzAINO48bBwHAUgb-CLZC31pOpDw>
 <xmx:WDxMYfX9kO4aZTb6DceLiquAWRTRgLOSs32A7pR1zGPYE6pqiHoCMg>
 <xmx:WDxMYaPbqOxK0OPBhm1j9xYs0NGH9TnVt01VGGf8onyvL9-vLHr-4A>
 <xmx:WTxMYYtdHRw3i3E_VU76h-z-qHqbQc8O4lAeySh80S8XgEyvWcubWg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 04:35:36 -0400 (EDT)
Date: Thu, 23 Sep 2021 10:35:35 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Clark <robdclark@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Rob Clark <robdclark@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
Message-ID: <20210923083535.fx25ooihsw65zy3e@gilmour>
References: <20210920225801.227211-1-robdclark@gmail.com>
 <20210920225801.227211-4-robdclark@gmail.com>
 <CAD=FV=WGmk6UY2MA4=y4gaM4G66t-qxuLtAZvUahzwg8YsLv=g@mail.gmail.com>
 <CAF6AEGuE1y7ZdOE+=N1v7Zc=gigopS50BaADHpUOoM2TrshSCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m2xqcwj7ise3su22"
Content-Disposition: inline
In-Reply-To: <CAF6AEGuE1y7ZdOE+=N1v7Zc=gigopS50BaADHpUOoM2TrshSCw@mail.gmail.com>
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


--m2xqcwj7ise3su22
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 21, 2021 at 03:42:05PM -0700, Rob Clark wrote:
> On Tue, Sep 21, 2021 at 3:20 PM Doug Anderson <dianders@chromium.org> wro=
te:
> >
> > Hi,
> >
> > On Mon, Sep 20, 2021 at 3:53 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Slightly awkward to fish out the display_info when we aren't creating
> > > own connector.  But I don't see an obvious better way.
> > >
> > > v2: Remove error return with NO_CONNECTOR flag
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 39 ++++++++++++++++++++-----=
--
> > >  1 file changed, 29 insertions(+), 10 deletions(-)
> >
> > This seems fine to me:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > ...if you would like me to apply patch #2 / #3 to drm-misc-next then
> > please yell.
>=20
> Thanks.. I think we can give it a few days for Laurent to have a look.
>=20
> This will conflict some with Maxime's bridge vs dsi-host ordering
> series.. not sure how close that one is to the finish line, but I can
> rebase either patch on top of the other depending on which order they
> are applied

It's probably going to take a bit of time to get merged, so don't worry
about this series and just go ahead, I'll rebase it on top of yours if
needed.

Maxime

--m2xqcwj7ise3su22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUw8VwAKCRDj7w1vZxhR
xSxaAQDcHuVvqYdYP/vWufS3mA01olIW3ObhX5c5gvCC94UPrwEA1PbFIV8S3GrH
dlh2ut7HZ20ROw/r3xa6bBKon3bxUQY=
=xq8N
-----END PGP SIGNATURE-----

--m2xqcwj7ise3su22--
