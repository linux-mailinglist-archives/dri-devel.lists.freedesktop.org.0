Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 622CB4D182D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 13:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0597E10E32F;
	Tue,  8 Mar 2022 12:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FFC10E32F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 12:45:58 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id F3F035C017E;
 Tue,  8 Mar 2022 07:45:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 08 Mar 2022 07:45:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=PdwMfupO0RHZKqphtYyA4tx1lS++Fy4a1uHJ3Q
 RCYoA=; b=HLC/EK87yY14x6LfgQg688PNQrAWAsltYvsF9G5gpDFutn6XO/U91b
 BR8JYwl9OH0/VMzWmDw3e33KbT6Gw0PHNMLVySPzrfIyw6isDmyIM3FKgc9//UQM
 pjdH9J3ZFCIRP1bvqni9R6Fn59TZ6c4nSxtRJ+NNYcqV0PsRC7OVnbOH5fsHZSlV
 nPPFrRk7hlO0YuSq3OM0Yl2u/lmg+lnzlt5rb+xJLTrbVCNoE8YwuxnLkHTi41ir
 ZAf9/oLkmfKg+TGXKzumJ5LPAzH3jOwqh9RwDpZFDkkEbpmDhCTlI4OAewd0ulsF
 Fb+mgM2gv5l9u+CCpv02Iz9AWtcVSCxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PdwMfupO0RHZKqpht
 YyA4tx1lS++Fy4a1uHJ3QRCYoA=; b=TVtbKxvkWiRvfKwag/9Cy0OQycCHNk1TA
 u3ZOrx677PEeswB7A5oarApmxLWamOVQIAStksrdgPQSM0l3y5h28uoDpXfOF6F2
 MZcDz6LULBGpC9quR4SM7O7azWO18L+RD0PFimjDhY8cqMuIPqQl6ylCkuKv5X+q
 y1jakA6qejui200xi3UoGCc8aShO3M1HmbXcplo6KNpZ+vfbYUIo7fJrFzL/9Ms5
 vW2HyMfr/sTYWeqsS4f3HMwUQoeqrLN6nC/HoqmbsdeeIENTJudHfyhgBM+IfY/d
 lrsRDBhyHAFE6Hq2VdUXztte817LS+1wY43aQCfvjU9y22lqaNcgQ==
X-ME-Sender: <xms:A1AnYoTBBGRLc2ze1NsbGWZQnVoNBKJHDG6sBu73e4PutXuyeFy7nA>
 <xme:A1AnYlwZiQH-W6VN1zhk2TCBt3oL0Tms-hXHSH5ZHwtTWaSu8avAi3clj3CEzYRzm
 Qwwtwrdsa_FDrOqiJQ>
X-ME-Received: <xmr:A1AnYl3MWPRM8zw0D3YmlJqcpnyKyeJeEcPnfz532hUkHmbgYmlRCZe7Gkg0f-2y4OEI7kBOHzGPUlU-yRqiylqhQiKmTcILG2S1gAY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:A1AnYsD9CSKqOlqhP6CrXiptf197lrrilZ-sJEsn8fpU7h45IHiiEg>
 <xmx:A1AnYhhPfyGByE4nrowfYoRgryYLVsSSSQvXAQpoDAeappJ-AQOGBw>
 <xmx:A1AnYorZSt9C2z8T_rnXqK8xZR-XP5nQVImfA4V7Z6xttFw2u_QEBg>
 <xmx:A1AnYsWP9UnV030xWX3VTSdBnzps6rB5m8T9PxrYAifAMUvlt6V8lw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 07:45:54 -0500 (EST)
Date: Tue, 8 Mar 2022 13:45:52 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3 01/13] dt-bindings: display: bridge: icn6211: Document
 DSI data-lanes property
Message-ID: <20220308124552.v3nhdhder62fzla7@houat>
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="i5hnp73e6ajspu3d"
Content-Disposition: inline
In-Reply-To: <20220304002508.75676-2-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--i5hnp73e6ajspu3d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2022 at 01:24:56AM +0100, Marek Vasut wrote:
> It is necessary to specify the number of connected/used DSI data lanes wh=
en
> using the DSI input port of this bridge. Document the 'data-lanes' proper=
ty
> of the DSI input port.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--i5hnp73e6ajspu3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYidQAAAKCRDj7w1vZxhR
xfKcAP9Yjd/bA9EoniXJpv0bIER4LyS6h1OeHsoe/caKm7BjKQEAy/BolS75/+HZ
9Fi/z/+2VEjRe78167CMHN/y4Q+gMwM=
=GklR
-----END PGP SIGNATURE-----

--i5hnp73e6ajspu3d--
