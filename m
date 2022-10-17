Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2289A6006D3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 08:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B5510EC9C;
	Mon, 17 Oct 2022 06:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3115A10EC51
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 06:49:56 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 62FD63200681;
 Mon, 17 Oct 2022 02:49:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 17 Oct 2022 02:49:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1665989393; x=1666075793; bh=rH7cYo6CUG
 YsbRgteCrlSvZht4fFMILinJqWneYnch0=; b=N28r26ZI81WhbempbqlxmZT/Ip
 jVLKgbymcf9Cm71SWHkmkeZXGn9PVkmKY24ceHAN3Z1VpbzADeuFTw0eQz/TDwrv
 UK929d1svfp+zazx5ENlMSWtMbBm8MVdVzjDxWvXrLr1ASVlksUHQP7MuxoVhOwC
 SuhPKR5baW9ObB5pqcO/WOWKqEz83Lv87Fu4v2yyR4Au10yEdzoa6pkRRXo5GPr6
 Dd3n1qAnvxMsUfe00nyZpugpZgqhXIPaNnXcKo1NUtGNrkfT4l7ewFq91RdR6SRO
 M4ffxKRz2bacwfQsgB4FmD/yakF22mfhF/5w3viILK8e+uH7qCaXRk87G52w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665989393; x=1666075793; bh=rH7cYo6CUGYsbRgteCrlSvZht4fF
 MILinJqWneYnch0=; b=h9NUrZuw4P8InmZ+Y70D5tftI6oWteZmmh/rdAm9+fZC
 nBm/9cG3hqa2WBn+myX2vrE/mFh+2X2W2i5Rp1J3CmEeQcY9jWk0/z5PVtiah6x/
 hXaSpZCIzWR4MMukmuA+r6UrgI0oodzonZW08QiLZd1wdgZl2gIrnucUudoGOx8s
 PVUXYPo9D+vY5oxxLQ3ixSSC6dULZcGuoEncl4O1RnrXuf8zienKqL3e8EmDEn3u
 GYGY4xzvlqlAIlh/xZmm06XuMUnZkLj0baain7sKuvu0zW48eN16nuebuOqmcPna
 tbm4DfPRqX5IE+hD3dMC9bA13240lOMto0BqnUw2EQ==
X-ME-Sender: <xms:EftMY78JBVr4_TCf56z4T28Tl07BkPvB3PTUTfZBzXXSwEeY3R-eBw>
 <xme:EftMY3vc8MBLzdOXilOcIsIw78pV3kgH_3czKZL3npNBF3JUg8b7ZjXvXzofMBkGi
 Jyv5cnRgrt_d9WJ_zI>
X-ME-Received: <xmr:EftMY5C6aG96cQYeapQmIt44QzyMLuH2Q5nikoOB_njpHj-fMEE69ft0ynct>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekkedgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:EftMY3c72KirLfWZMxeC1VojL5gh7QMs4nzlRkA8wccskvNmM68PxA>
 <xmx:EftMYwMAdmmbGAoy076HWO9gmTskQVtFNggbNrNhjETMGrSRnFya3A>
 <xmx:EftMY5lP6wgxnM8NGw0_v2Lzmk_SOVMJZT6U8Z_1AD_DyBlkOuPrMQ>
 <xmx:EftMY3kcLkHoYELWSJp50fkAR2kiHtkhU7U6VJSXM-ItaJ1HiKQYgg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Oct 2022 02:49:52 -0400 (EDT)
Date: Mon, 17 Oct 2022 08:49:51 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/bridge: tc358767: Enable DSI burst mode, LPM,
 non-continuous clock
Message-ID: <20221017064951.ekdjp4q2h3ijaqlu@houat>
References: <20221016003632.406468-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5shtpvdq54cxtuk6"
Content-Disposition: inline
In-Reply-To: <20221016003632.406468-1-marex@denx.de>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--5shtpvdq54cxtuk6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 16, 2022 at 02:36:32AM +0200, Marek Vasut wrote:
> The TC358767/TC358867/TC9595 are capable of DSI burst mode, which
> is more energy efficient than the non-burst modes. Make use of it.
>=20
> The TC358767/TC358867/TC9595 are capable of DSI non-continuous clock,
> since it sources the internal PLL clock from external clock source.
> The DSI non-continuous clock further reduces power utilization.
>=20
> The TC358767/TC358867/TC9595 may use DSI LPM for command transmissions,
> make sure this is configured correctly in the DSI mode flags.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime

--5shtpvdq54cxtuk6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY0z7DwAKCRDj7w1vZxhR
xY2HAP0TlWKqLP6KJ8M6QuWeG7UqTeAgeyS8HzEnOC0IE5yuLwEAubwWcs1vClCt
lPWfk2WAispfBB9hqBEsFxa++mVpgQ4=
=5iuY
-----END PGP SIGNATURE-----

--5shtpvdq54cxtuk6--
