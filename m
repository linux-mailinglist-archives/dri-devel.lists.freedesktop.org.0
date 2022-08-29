Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C265A4F5B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 16:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC27C10F2FF;
	Mon, 29 Aug 2022 14:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5EE10F2FF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 14:34:07 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 574ED2B059DF;
 Mon, 29 Aug 2022 10:34:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 29 Aug 2022 10:34:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661783641; x=1661790841; bh=oQBE+DI+SW
 LckaadRI4Jrm6cq9SKoELF5EKKd70E6hg=; b=kNBGEAIt22mbrjzllWcDwpLkjy
 SBm8nIcWqvjcrP3RBZUEZG/k3naQVCYL9otgdkCQgjylJoctE3ZHKaozBehMqdxl
 2oDyFMJYeLgGThuX6ZZLMulEH5dPXmLOuyE2WDX1okG99FfBSy7gBUlH7E5wq2o+
 C/DdpKyGSI77l9U07GJ4FLqDmI2baBr/ZOjws68ZqRD2RoZOFe3n2sS5otIbTmzu
 kSm2rs3Lf5J35biIpuxywwY6AnnAk9vZMCgIjYsgoIStZQh5tKoeWGqvt01a8SJ6
 YCAMOq+wovakGmiNRMENIU1f9mcSIJObFs+v2qGquaPe8G3RWPMBPBGOJzVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661783641; x=1661790841; bh=oQBE+DI+SWLckaadRI4Jrm6cq9SK
 oELF5EKKd70E6hg=; b=fZH3af+W2fv/gaeULD0qOwqsEdmlHPoJYPn2yZjqG+gp
 DNZb5WWivY/cvDOD9cRlr44R6uM9PZ/2rgsiFJx+cvPF4vD+aU9qVG2jidi2cGd2
 SOfNSI40Q14sbYvlD3YG20rM/bMLDGSY5V2PPDUi5rkceY32vvJHFOZwScCWNf0i
 RAvvhELdZwi+MaxDeWmBaZwxNi5/CPHqsZFJ4gkFuTCdd3mxpL0gPf8npH8XcyZk
 DBL/c9QlBdQ0ywSd0mLWtmP4y/jUgqP4VRbav0T6cwqBBfwMQ5l3gx4yQfSbKJq7
 c4PGwwwJtvnSDYIFnHPwVlSJ6qvZQXw5qVj2KUTM3g==
X-ME-Sender: <xms:WM4MY-8n5rxmbHVlex9KRqR_DOrl2sfBbNko34Kum14HyFZqIBwqEQ>
 <xme:WM4MY-vWKZBusR-QFzLrk0uuGJQrAUTJ3WLcEDyTOs2RmBer3LLaAdFMfal_3mvVB
 37LlNnDq8mSbT67qQA>
X-ME-Received: <xmr:WM4MY0D869oo40pH4azOfsV2RpYGwFdVkF-760qyydio22VZCY72ScdKyZDR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekuddgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefhkeehfedthfejfeejtdfhvddvueeigeejjeeuteegveffhfffgeffieeu
 ueduvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:WM4MY2dT_4qc0fdbr_OMdbexPQciSPp7u54VNxr9ijMnwCx1qX716w>
 <xmx:WM4MYzPR3ATYyAoIu4VcpgookcatktPXeC884wti0IDPKFQsOrFoIA>
 <xmx:WM4MYwmB4wu5EvU9eCSsvwNrUmOwpovcrpxIqoKThZ2NSDQC_d5n9w>
 <xmx:Wc4MY6_lUEV6SyPmixCQ6-EOTDrPVoV4_oFDMGXStw_07nt7qrTvCNLa1n8>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Aug 2022 10:33:59 -0400 (EDT)
Date: Mon, 29 Aug 2022 16:33:57 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v1 04/35] drm/modes: Introduce 480i and 576i modes
Message-ID: <20220829143357.rih7vmxnd434n5eo@houat>
References: <CAMuHMdVPEgnnsY-4uuf=FDJ0YxWpch-0kZWFT_TZfcDvXLtwWQ@mail.gmail.com>
 <20220818123934.eim2bfrgbxsmviqx@houat>
 <CAMuHMdWXbHkrBZgsmUnU=q52+q7UZZNO3tgQW7Men+msQ1JDwQ@mail.gmail.com>
 <20220818134200.cr22bftmjn226ehn@houat>
 <CAMuHMdX6dyQaB34oeXwiCa2rDkxks0qNh=ekqh7Wd2kSNED9TA@mail.gmail.com>
 <20220818154641.ouvrar5s74qu74zn@houat>
 <CAMuHMdUjE0mwu8z5AksW4h1OwzDCQ5h1ZoCWDi+rC4p2Pu5O4g@mail.gmail.com>
 <6d1dfaad-7310-a596-34dd-4a6d9aa95f65@gmail.com>
 <20220829132953.sfv5yex2dhv76vrq@houat>
 <CAMuHMdXxoEYV7v-R+o4eMJEiV_xGUgpN6sUbZ95r_qewV5QpRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kfxaklqvqri4mo47"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXxoEYV7v-R+o4eMJEiV_xGUgpN6sUbZ95r_qewV5QpRA@mail.gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, Mateusz Kwiatkowski <kfyatek@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kfxaklqvqri4mo47
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 29, 2022 at 04:14:54PM +0200, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Mon, Aug 29, 2022 at 3:30 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > On Wed, Aug 24, 2022 at 06:42:18PM +0200, Mateusz Kwiatkowski wrote:
> > > - Speaking of closed captioning... a lot of different stuff were put =
in the
> > >   blanking interval over the years. Like teletext in Europe. There ar=
e projects
> > >   like VBIT2 <https://github.com/peterkvt80/vbit2> which intentionally
> > >   reconfigure the Raspberry Pi composite output to include the blanki=
ng interval
> > >   in the framebuffer so that teletext can be output by drawing on the=
 edge of
> > >   the "screen" (from the computer point of view).
> >
> > I'm not sure how we would support this in KMS to be honest. Asking for a
> > wider mode and the userspace putting whatever it wants in the margins
> > seems like a good choice.
>=20
> s/wider/higher/
>=20
> Teletext is transmitted in the "visible" parts of (horizontal) lines, but=
 during
> the vertical blank.

Yeah, sorry I meant wider as in larger than the active area, without any
direction in mind. Thanks for the correction :)

Maxime

--kfxaklqvqri4mo47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYwzOVQAKCRDj7w1vZxhR
xTxpAP9bd66HXQmTBpI0zXpaId8W3dGxbTZRmTyNSEJoqCN71QD+J1RsrSfke9GU
pFKC0vpat0TQqDe1XeWM9dkwMWtAtA0=
=+E5K
-----END PGP SIGNATURE-----

--kfxaklqvqri4mo47--
