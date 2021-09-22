Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 890894143AA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 10:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847306EB07;
	Wed, 22 Sep 2021 08:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6DE6EB07
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Sep 2021 08:23:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 581885805E3;
 Wed, 22 Sep 2021 04:23:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 22 Sep 2021 04:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=rNxkmQ11xqP+Yzyj4OrQAKWm2OB
 KGSlM/ygiKzdXo8U=; b=4N0Yu9TSju8rHUruiHwRStum37pDoIoPssUV7VErkeC
 Oz06TjIB7CdPEv5LB0v0ib9705QShrzL+uAGxKbYDcNe2RZXDa0B4QXAiLE+hXFe
 ZJpcciiTu4GtZKtwkHyW51AJ1DTIl4qyhgGtrsgcczZG89u2r2rPmgGheG5U9FKk
 QQqHyFt5xR5ygFK604fp31IYsH7KrrdpNRVSXAUApzIpYa/RJYi6F9B0Xi5mTkHZ
 NGoZfsBSpbt45y8fJMoF8uykX3NcO+L+ymCmaf0VmwsEmq424fYoAHeQMY+KP+dP
 kClnMtWP43PF3PKww+1shUlw6Kge12o/GAofEQLz5zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rNxkmQ
 11xqP+Yzyj4OrQAKWm2OBKGSlM/ygiKzdXo8U=; b=jJWJYDEQIkAq51T53AwewA
 t/ZR4HtV2sMJoiD8ayIWT15XFz9WnCO0DtiC43048R7kGCsksRsqMhdq54w2/3Po
 1sh79FfWIpjPUethuO9nFl0YR9Q9uZLQ9iBf0Cmcg83CHTI+HsDwjHmkfdhs0dr6
 WGymvA8P/Gd+ZRP5Q7zloP/AdPdn26GuhZsnJKGscx1XlIlwSrFnstptHuNeaKc6
 +Ly0UABotsneTUwuf0ZfJmfTu9gT8HQA+IxhWN3YPIIFn5bC/BP5cMiiIltpSUwY
 xbw/f/F/zOsI55RZ5NOFlsH8pBmaXRqaILQiGeulpNqd7SWJZ1AJ+9PF498RB10g
 ==
X-ME-Sender: <xms:4udKYRPulqU9irDvt9TuF8xpE-kiwzgGHeCWlXoBJvgSmujHX3GHBQ>
 <xme:4udKYT-MolYoq9Cp616T0hAiF-vO3n0hZetUHFkhDv10H7ahxVzruxbbijIXp-vtj
 YCnJg6nCMsKJGrSXOE>
X-ME-Received: <xmr:4udKYQSpqtC0YrxZPILo8JX6jcdRvPFVV-ghx8l-HGC3LeHSTr890eSNkauaIfsTRfe1wX_ZJrHELOZf2z5jj7sQuyumh6fpHgaT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeijedgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4udKYdv6FrmknPovvn4E1DHcytMJvupm6tip0AvknGjQyxuTqNJTvw>
 <xmx:4udKYZdVUdyumy4hO3wO7pXXS4cf-s0T7UPeWKT_6nEves1uzIOU6g>
 <xmx:4udKYZ23oTsc--sHTvWAJwW_Pmicbum0yIRSGC0EM7km6GbHH_Oi3Q>
 <xmx:5OdKYaV7JIz6SOlUx9GzlBmH0Xv59afQV6My1AEKpFucAsJ7lZGT4A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Sep 2021 04:22:58 -0400 (EDT)
Date: Wed, 22 Sep 2021 10:22:57 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/bridge: Add a function to abstract away panels
Message-ID: <20210922082257.3cjhwvexatvpigp5@gilmour>
References: <20210910130941.1740182-1-maxime@cerno.tech>
 <20210910130941.1740182-2-maxime@cerno.tech>
 <CAMeQTsaFdqVQt5+FhWL1VeBpLvpCPgKX6R5tEc_jzAFVRWH5Vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gigg3b4u34icx6oh"
Content-Disposition: inline
In-Reply-To: <CAMeQTsaFdqVQt5+FhWL1VeBpLvpCPgKX6R5tEc_jzAFVRWH5Vg@mail.gmail.com>
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


--gigg3b4u34icx6oh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Patrik,

On Tue, Sep 21, 2021 at 02:47:49PM +0200, Patrik Jakobsson wrote:
> On Fri, Sep 10, 2021 at 3:10 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Display drivers so far need to have a lot of boilerplate to first
> > retrieve either the panel or bridge that they are connected to using
> > drm_of_find_panel_or_bridge(), and then either deal with each with ad-h=
oc
> > functions or create a drm panel bridge through drm_panel_bridge_add.
> >
> > In order to reduce the boilerplate and hopefully create a path of least
> > resistance towards using the DRM panel bridge layer, let's create the
> > function devm_drm_of_get_next to reduce that boilerplate.
>=20
> Hi Maxime,
>=20
> This patch creates a dependency error for me:
>=20
> depmod: ERROR: Cycle detected: drm_kms_helper -> drm -> drm_kms_helper
> depmod: ERROR: Cycle detected: cec
> depmod: ERROR: Found 2 modules in dependency cycles!

I just pushed a fix to drm-misc-fixes that should address it

Maxime

--gigg3b4u34icx6oh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYUrn4QAKCRDj7w1vZxhR
xT4GAQCqUEBGNKi1xqMUg/b8l42eAnuZRmneCDa4K/9fo6gLDAEAmipuXK+XTB8y
kJRcGIVADOLEw8VqYzmlkhXwzh7erQU=
=vDJY
-----END PGP SIGNATURE-----

--gigg3b4u34icx6oh--
