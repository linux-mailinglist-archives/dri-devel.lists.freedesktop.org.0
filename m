Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693544CA1BB
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 11:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2930210EE95;
	Wed,  2 Mar 2022 10:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDFC10EE95
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 10:05:13 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CDF7F5C03FF;
 Wed,  2 Mar 2022 05:05:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 02 Mar 2022 05:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=+GDpBz+x/R4gg5jy6C3Ux8xV+TTfqijkFUoHTz
 sxN90=; b=GVsD6XznNpQy6Jb2hPEO35je1LTnBFZ0iFVrUlp6sI49lt2MOOwkGE
 DbfICWXm8n0LyYexxQ/LqFYF+r4cPmIYWJUS/v9cMZ2wjt9cMOvhNprugvTiS+xS
 6SoGe7tkx8UufHAmhpTvgYAAaLzrsgFj8KpnqLO5xz60ch4hW/0HSn4OOZjdSHn+
 kw6yNNZ7QuTa6Z6hnjjVFRsFknSIQCqGDwD8a/mt26m0yOYl2OGD5zbvNxKIgvGf
 U9dc6uESQNUVBLMEMOWVcKv/VUgFSIoIvtXrksHbHwWtyoPTeAPrY+8+bjGfdhud
 huDTks1J+TxUqktIqLkHt4pmXXMSx64Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+GDpBz+x/R4gg5jy6
 C3Ux8xV+TTfqijkFUoHTzsxN90=; b=Y0TirTqeh9lpqcPjAHfsxIpmAy4L8mIgc
 xY+/Pf7mGX2W/AyHx3VfXBgUHZnYk0fJozXoLllrd06FFEKULK2LTI1C3rKiLisR
 tQQsMipLBfE8Xi1sJktdL19ofrVtYA0hJbDSZT4gUOrj74K/ByXHZGw0Nbn9Pt/c
 icV4uRBf+c064t9KF77dJVzllf57hf3Y3h4tOXe1NRvgb+CN5Z5+2jRGj3GcAwC6
 DbeI5+0wfRe1kpacPy8eq8UufLMdW8EHmh0YO8JOWtNWf3UcE2aur9WtUxuQAuio
 Et6KDt0UW2NpcMSyQORki5WYFNfjR+4KMxN7ojPLEUCfZXQ7JiCUg==
X-ME-Sender: <xms:WEEfYphB9UAn9mw_7vn1-H_8ZUaAxI4yJEj5pSudivG_zd0OIHsBHA>
 <xme:WEEfYuCZcZEycSL5S7EkReSScQUWYMmk-hRbj0YengazebbH3xjYM8sayrsXpwasE
 eCO72DcNSLbugUjiyE>
X-ME-Received: <xmr:WEEfYpEcfg9Htc76I6iV1pG-UFVUAwZcq7cY96coZZpuYkSOSXzXhc4sJ0wX_o-wGugxBJbZuw-Tt0XPlivbICETLLA5XH5VL5rKtLo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WEEfYuTb6z6IOo7LCnxrP0jOUxlJIYtmnowNXM_THfIDHMRsn78xew>
 <xmx:WEEfYmw8b1zkt4ZgYCGQlY8wyJOdzv6cVdbc0xs0mUpA4X28HVJb9A>
 <xmx:WEEfYk5eHCjBb_Z7eHo--Qexcbu5pE8-IP2kmssoDKTCAjtWlRdbpQ>
 <xmx:WEEfYgu3Ez7gARSw4BFwiLG0r8DGWd-90Po2krQy6bnW6oPjetO6AA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 05:05:12 -0500 (EST)
Date: Wed, 2 Mar 2022 11:05:11 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 09/12] drm: bridge: icn6211: Implement
 atomic_get_input_bus_fmts
Message-ID: <20220302100511.wbgnl5iewyxg5iu3@houat>
References: <20220217002530.396563-1-marex@denx.de>
 <20220217002530.396563-10-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="x35hns23l6zckenn"
Content-Disposition: inline
In-Reply-To: <20220217002530.396563-10-marex@denx.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--x35hns23l6zckenn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 01:25:27AM +0100, Marek Vasut wrote:
> Implement .atomic_get_input_bus_fmts callback, which sets up the
> input (DSI-end) format, and that format can then be used in pipeline
> format negotiation between the DSI-end of this bridge and the other
> component closer to the scanout engine.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--x35hns23l6zckenn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYh9BVwAKCRDj7w1vZxhR
xYmZAQDwDri5gt7E50EZ71L/7E8Tebf6a9YeOISYx/mern10QAEAwuPHHvOpUvtM
l9tBqccXbib03Wbi8IwzuxzuIaeEpQk=
=fUJx
-----END PGP SIGNATURE-----

--x35hns23l6zckenn--
