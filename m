Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9D1130223
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 12:25:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBFB6E44D;
	Sat,  4 Jan 2020 11:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6792E6E2FF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2020 13:23:36 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DBF4422015;
 Fri,  3 Jan 2020 08:23:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 03 Jan 2020 08:23:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=3ju2vmJskvC9CZ7Ryty6/ubQo91
 ntnPIGTpD2eo4BuA=; b=iH1RXuj4FOsVan6WZKTT92+Wopf0beU6SN+7zggkXNf
 aJkilcQQ5L7v/+Wg+7qd02JIaTxv4zZU1oK+who02vbwXOiEIxbCFPnE6x8zlPt9
 +sXseAc1LrQXSJkM8YifWf9S2UsksskjmW6KO/0TJwLC1Y7aPQ3wlcgKyTY6y9BY
 VrHcZ2rxzQR/CEthExzl9K8OafaAbjAfrr3jsjd+aWHFeQdNTfz+zSSEdIA5DKwQ
 p7GZaUAX72d15yQkwKq0eK7TitUpN5c0D2iL1gCu5G/HWp3fYADqTf+S1ODKU9H7
 wp9IQc8/nuOqi5oLda7k0T4lqmIc7JEFXE2DUgFoyOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3ju2vm
 JskvC9CZ7Ryty6/ubQo91ntnPIGTpD2eo4BuA=; b=kohQNrRVQgApeowM0Qd14Y
 bYoiOfEeazorD04aCtnadN5cqhNVraVL53gWQCytjkXx1XZCm1QcnIKXNS+g9Nnq
 Bl2FuXDRW20ZnorDev3XkpwoQsdSHkKl61uWeEMVElGQGbHwR91BAe4Iyz+Hq9cy
 slf550hLnA7fGKWptFNKVwgHSHGuUXwOLHJREynQzFYyuNtcAAs0H98iMvia/Hr+
 9txZMTriZgf8oooeU5JcHyyRJ04dXakGi/VGRvKxqUBYg3ZdAoPOxJs5AIoir5Y6
 8Wx28KTx3DC0ID9uughLUhDMf8CKjXRHy8Nou3Mt7cJ8Edp71rCrN6gEkZzAc85Q
 ==
X-ME-Sender: <xms:U0APXgPPBNrtFPk-Kh0lF_shCBo5H6D125AZn1aH84WlZXZcxb1pcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegfedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:U0APXkwzOZuEYW-iPjOF_CWmCW5OzM5B4Lf7iDfqCj-nUKDU4W27Pg>
 <xmx:U0APXoKeY84NixfWY_XTZzQhGoQZTNkwa-zQsSsz6yzxCkydh5Ry2w>
 <xmx:U0APXjpQg5M4HbSUlEdUGOCw9Tne4dn5syB7R1BHeZpq7k4PuRF_Qw>
 <xmx:VEAPXh3P_7IbYxlPYcMNzUerkRF7erpvOPR5qYh046jpkIagpFmrMA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A4A168005A;
 Fri,  3 Jan 2020 08:23:30 -0500 (EST)
Date: Fri, 3 Jan 2020 14:23:28 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: display: Convert Allwinner display
 pipeline to schemas
Message-ID: <20200103132328.he7bs7yvmzts7k32@gilmour.lan>
References: <20200102152605.71117-1-maxime@cerno.tech>
 <CAL_JsqKh1YKmj8T6x80fhn8YmnDC+qBdvSrNHwXte2CPPncqNA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKh1YKmj8T6x80fhn8YmnDC+qBdvSrNHwXte2CPPncqNA@mail.gmail.com>
X-Mailman-Approved-At: Sat, 04 Jan 2020 11:23:45 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Sean Paul <seanpaul@chromium.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0350253069=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0350253069==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a7vaefhowr7pddty"
Content-Disposition: inline


--a7vaefhowr7pddty
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 02, 2020 at 10:12:10AM -0700, Rob Herring wrote:
> On Thu, Jan 2, 2020 at 8:26 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The Allwinner SoCs have a display engine composed of several controllers
> > assembled differently depending on the SoC, the number and type of output
> > they have, and the additional features they provide. A number of those are
> > supported in Linux, with the matching bindings.
> >
> > Now that we have the DT validation in place, let's split into separate file
> > and convert the device tree bindings for those controllers to schemas.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > ---
> >
> > Changes from v1:
> >   - Declare the ports in the bindings
>
> What about my comment on using minItems rather than maxItems?

I missed it, sorry. I'll address it in the next version

Maxime

--a7vaefhowr7pddty
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXg9AUAAKCRDj7w1vZxhR
xTagAPsGQaUho2/rYq54g8C0TP7NlfvSBRhGuzZa5AgsfVxjRAD6Ayz5usLCYRcx
vvOID0f3Axtb4ulDLmPDC635yjNcSAw=
=7hF7
-----END PGP SIGNATURE-----

--a7vaefhowr7pddty--

--===============0350253069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0350253069==--
