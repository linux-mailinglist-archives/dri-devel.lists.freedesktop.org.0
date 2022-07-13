Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F83B573222
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE7718BACC;
	Wed, 13 Jul 2022 09:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED20818BACC
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 09:10:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C43023200A57;
 Wed, 13 Jul 2022 05:10:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 13 Jul 2022 05:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1657703452; x=1657789852; bh=okns6jiIM9
 XMivJMPpMS7+QvSgaHtDbUEIZqiJ2D/5I=; b=DaKT9GgEnrqyGCGxR8QQGlzM5+
 RUtSdNYsfWo1RyOF5lUdgJ3baKCalH0eB4mTFGCqmwwhRUPhd8If6wmvQhwxIr6y
 TpUEePlxPMNdM7wydaVH5Sj1atENecXmGFUZamsEC0TuzTH6BiML4+pN5ZdN+D8O
 pF8Nf2nlQx7eGiWxHW154ksZO6LHQAkmJfPU3TwAq1YeHEgLO+pex4uXC8JyRnsb
 0ml7GvSadSbjlFVNJLWUl4hJhVstZomX0Jyx9HtIqoKynrR0W8t9lgx+5XecUrTh
 WJwoS9KAXn5/5D9bYZtJblOXZuytlyazqHfCBhC1uaBdSN5o24zz+xDJOy4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657703452; x=1657789852; bh=okns6jiIM9XMivJMPpMS7+QvSgaH
 tDbUEIZqiJ2D/5I=; b=trwf2Ljow+jlw4aJUJn7iMvIIXIo1MrLk1ZnWYepMVAx
 igd3v7MrdGTiYbJUH/iA0QLehkucWgQKVERELB0QumD3wmKtf2/6z/zoHVPRID54
 OWL9im4f9Aj2y7/jaUwT/p/7kA2gAB494PnkTRFB7SOBeKfrBqV9snYicYDGrgZj
 2Te0ur7WFmNbXTHYA+jfjjk1R0b8JFS3oBVrs91hj3OasH254M2btyYpnjeFYMFn
 JQR0D5j9E6qLugQlhf0upQcP03yf1j5urLKAbaIfJSTLKzGuFRM3AlE4vYPKD8/m
 AjhL8tZ0Sv9+6HV6PtuEZBcji20YI2zLseo1vGEstw==
X-ME-Sender: <xms:HIzOYmd8JlZaPi2RmsDhxKlkwxkGuwUX75e7giq_GBKwY-JaOxqg8Q>
 <xme:HIzOYgOeEYvMfPf5NXXUXMVTSMw4oXUdF-kh0Gt3Rbw1rA5PKFxlf2KcBuqkj7kpJ
 zZwUzzzv3yVHMAuZuk>
X-ME-Received: <xmr:HIzOYnhRm0aAcd_vPZjVqi548YDhNQSrnA8SWF0SkEpl5gTTMgevWuk0xkyGo6tekzy6dfWyCe7wpH6vvHaTRDPYlBomjU28JLBJkjs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejjedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:HIzOYj_s1gqGgGbHAdCCjPUKZF0Ap1tDAL6gnRBHnGJBujvfwmZHTg>
 <xmx:HIzOYiv1Gl7P59I_Ibyn9954ei1nA1WXEmjLAHPnnPZT_EBdB2LHlw>
 <xmx:HIzOYqGhSRgv21gmlxLid4R4jRPTPg4Q2gkPK7RLJ6Z_d2XJBt95oA>
 <xmx:HIzOYkKHLqDwaOlrWPXrxyBZat2knudGiJpuW179UUzBwPOn77owgg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Jul 2022 05:10:51 -0400 (EDT)
Date: Wed, 13 Jul 2022 11:10:49 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH 0/3] drm/vc4: use drm managed resources
Message-ID: <20220713091049.qy4t3j3hh5jgtqum@houat>
References: <20220713085500.1970589-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y6sjhfw424vcozzy"
Content-Disposition: inline
In-Reply-To: <20220713085500.1970589-1-dakr@redhat.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, emma@anholt.net,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--y6sjhfw424vcozzy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Danilo,

On Wed, Jul 13, 2022 at 10:54:57AM +0200, Danilo Krummrich wrote:
> This patch series converts DRM modeset object allocations from devm_*()
> to drmm_*() memory allocators, or their corresponding convenience
> wrappers, respectively, in order to tie the release action to the
> underlaying struct drm_device.
>=20
> This can prevent potential use-after free issues on driver unload or
> EPROBE_DEFERRED backoff.

Yeah, the driver had a lot of this kind of issues.

As it turns out, at the moment you sent it, I was applying a larger
series (hopefully) addressing all of them:
https://lore.kernel.org/all/20220711173939.1132294-1-maxime@cerno.tech/

Maxime

--y6sjhfw424vcozzy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYs6MGQAKCRDj7w1vZxhR
xV4RAQDCppbyA6im9Xueg9td+P9gvsqPNJOcFq1JWDW0YbDcDAD/elvnok9QdFTd
xVLGTke67JLDU7YOna+ORGGc8891gw0=
=jDoO
-----END PGP SIGNATURE-----

--y6sjhfw424vcozzy--
