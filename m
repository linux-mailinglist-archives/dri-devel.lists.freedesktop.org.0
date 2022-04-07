Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AC04F832B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 17:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE90910EAD1;
	Thu,  7 Apr 2022 15:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4EB10EAD1
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 15:27:25 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id EB5753200B8B;
 Thu,  7 Apr 2022 11:27:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 07 Apr 2022 11:27:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=KmaGcpZRZ7EQ4bZea01sp8yB4p8jkdhNq5RVEO
 ba/aU=; b=ZC/EmOMaklVwlaOUYGRA6+5UYh6ky6gYpnWTWwcPx8XJ3AaZa2KBAn
 55M3Rzs+J/p5DL/lco6rAfEStMPHY7i4aWjLxqBgPCEFiAyC+7M1dIgEf/r6N98J
 7+AhpEQhbrE/nLLofv0LuDLPWOehlAXqK6rJMY4x+bT+JpEHsjIq2H+PgRh/dc5Y
 qvUbabXHppC7mwi/076ztx2kNwSS1qEjpNHr0X5m/aF6eZIUC9oxKhu+Lxta8T5g
 w7uExXEO7eOOo/ghPRCXeNnDDhnGoukSpoPMnOwL+HZnMA/wzBSHDsNKbVoszD/d
 7MWoKUlL0+KkMx8ToYfW/D8tKMQIz8aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KmaGcpZRZ7EQ4bZea
 01sp8yB4p8jkdhNq5RVEOba/aU=; b=lsBDDNpa5ywNO5zmZh7tgirPLm8o5Itfm
 MGkBLjJouVReHgBu7eGhe+4X+IMToTo4BxkCJiFl5Dej+tJX9aH8VmTxdQUCo6Kl
 oqwGrYKv0abTKpSQqQU1TS4WLVBUwfW4yo0j80YipG+Jh0R/dbFY9zDyHWuOWpz0
 4QFjV8GkYGHuWvW0iCcfgOmiPzgMYIsb1QUc2+gZ9Kvd05WXjnFtjr9AH7lEl18V
 GBMGF5fwYPuX0JOIf9z2HyZyHF0s8El4Hgx3EY3HLMo+CoqLL4hQtBzT3jQgQPr+
 m9NP8+QKwRlTvjDxOUdWOEiiDAA+Z+SIBw60KdXucMJBeC4emR78g==
X-ME-Sender: <xms:2QJPYlIyFEhGYEMHwniI0clflIidfcyjNbGHSWpMiyjMKvZwMMU3wg>
 <xme:2QJPYhI1XZ22UMuU4JFXWL3iW4kw6J_DlmZ8pf4_5oTN8g81_zJ8_tqA0tx55X0fj
 x9j1EpAAmVdhr3iaGQ>
X-ME-Received: <xmr:2QJPYtscVj6PoOZ7GgwV1o2yO9K_sD2_YXMSZguIrjG-NaB37ORbO67aLGne08cuE0O0D9Qzf4UCUvkYL7s4BM4HBCm14RYnjB92Tuo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejkedgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveegudetkeethfetgffgtdekkefghefhffefgeduleehgeehieeuveefgedv
 ieegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2QJPYmZ3XrG5-XRVnXxdWeUX7tBpbl80pJUbl_PB4Fd9oT3Yb9Bn0g>
 <xmx:2QJPYsY-yiZ3S_u6lwWdAxAlj1OQ8XAUnST6lfXqI4PRXVWECajrfg>
 <xmx:2QJPYqA68UtjXMJb4_VuC6w858IyEk49kBIsgVnAQQZVXkWrImEauQ>
 <xmx:2QJPYiPyAetQn4EWmJXjpSZRd_ERPmof4pbFHj2bZUfvwV-egU-5wQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Apr 2022 11:27:20 -0400 (EDT)
Date: Thu, 7 Apr 2022 17:27:19 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH v7 04/12] clk: Always clamp the rounded rate
Message-ID: <20220407152719.fjyrfglm3qprtzv3@houat>
References: <20220406183714.830218-1-y.oudjana@protonmail.com>
 <20220407080833.fkieuqx3hgdnwqy2@houat>
 <wv5t_wS8upUbTp267ngk1_SkGV7a-6vOpeQ13QMZ3HGGcD8RqrTriBjZs7aFbP4rS1D_YC4eKmga-r4o3Ke8sp0xsp9NMV9WX87ZTEV6oOU=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7h2a37eao5bbiz7x"
Content-Disposition: inline
In-Reply-To: <wv5t_wS8upUbTp267ngk1_SkGV7a-6vOpeQ13QMZ3HGGcD8RqrTriBjZs7aFbP4rS1D_YC4eKmga-r4o3Ke8sp0xsp9NMV9WX87ZTEV6oOU=@protonmail.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Mike Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7h2a37eao5bbiz7x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 07, 2022 at 08:27:39AM +0000, Yassine Oudjana wrote:
> On Thursday, April 7th, 2022 at 12:08 PM, Maxime Ripard <maxime@cerno.tec=
h> wrote:
> > I've been piling up few fixes already for other platforms, could you
> > also test ?
> >
> > https://github.com/mripard/linux/tree/rpi/clk-improvements-more-fixes
>=20
> Alright, will test.

I've pushed another version of my branch a few minutes ago, so make sure
you pulled the last version if you want to test it :)

Thanks!
Maxime

--7h2a37eao5bbiz7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYk8C1wAKCRDj7w1vZxhR
xU0dAP4jZClKIm61CiKsBBAFnC3/GkrxttiZma06zocqzEEB1AD+KOo5KUJHo7LU
qema2fJDsfFOuBrGofBOUmFEPPC6rQs=
=0eyT
-----END PGP SIGNATURE-----

--7h2a37eao5bbiz7x--
