Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2E3218051
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0FB6E881;
	Wed,  8 Jul 2020 07:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C99989D3E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 08:54:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 147D0B4A;
 Tue,  7 Jul 2020 04:54:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 07 Jul 2020 04:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=eW75ERrLMdE6WpKO+nt3dXk6D5K
 YxlcA1E0IptRa+SU=; b=k2Fec3Kd5rpHc8INkqB53cfw2+8QGuKO2tqoTqRBw7+
 C1JaYfOpo07HrF2QPPjFaIvCCsnt5xzjl5r1YQ1V1nVhnquUdqFzS+OrjCeUs88N
 SPRWGh9hKSN9P4es4PP/N1zMfViEz17MRQmb8lTYW/XN8GVeBURtyiGePnBBCJmc
 cWLngot7LgHG39NnG/Isvtkr63LB+iff5QZzS1yvkvvJQ4n9PMHwajhEmiXy9xtx
 CSOOzv0iC+CMfBT6lns1BZ9DqiCpG14vcuglUSVuBzDVQbyJmXr8/R5WpUTXU9Pb
 U+UqeHN4oDomGXu7RQHYBY0+E4bS198J6/1rnv0XQDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=eW75ER
 rLMdE6WpKO+nt3dXk6D5KYxlcA1E0IptRa+SU=; b=ZZOnKnpNTA5l+wMnNdhBSv
 XgKNPniiSg7+URH6wS5W9KPfZ7Zbd9TijP6XVH3xgZJRwVU6VFPbwVbpG9UZ2rx0
 YJaH8hhUea9D24ifw+YqaxG4rC6X2O+mtcm6atX7CuJgGHkORUAYRoXrdJyLiBtG
 sjDqXUKO4nT0qV33XCxoioLyc4DNbTIhycIkfx5BNNxwbeG2EnTK5bkkTVmluxRl
 TvCWXYdyFI5SvU7RBNm49BzToj6U+xokgBGvI7+jWby9+euY/g1qMEstRZPD1qf8
 B7DBQwBXwzfRnyJYy+ZW8Lk9qVbW3tG2odrRTqlL5SnOpVY9zf8vEFqu1JWn6sDA
 ==
X-ME-Sender: <xms:WzgEXzSc0lzD7AiEwh8kMLxjqyavy7wtaQXDcWuear2e3GYHsbLyBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehgddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WzgEX0xW6R0J4tjTHq9Gr28jhWdE1my3yK6Pyu53RJYkYIHJpQaDcw>
 <xmx:WzgEX41eUs35G839bg02RU_Sitk9X5jLGTn5g9MsPMP7GaWhNF7Mfg>
 <xmx:WzgEXzBc5CFZy1lk_2f8LMkTG14iA1dXF6Uf_4hy9jYlm2PkVUGMQg>
 <xmx:XzgEX3V2rymmuFcmtt8QVaIotldV5fgf0BwsLIQvTqJxraTF_aiBmg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1FBFF3280059;
 Tue,  7 Jul 2020 04:54:51 -0400 (EDT)
Date: Tue, 7 Jul 2020 10:54:48 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v4 0/9] drm/vc4: Turn the TXP into a CRTC
Message-ID: <20200707085448.f36cmkrjuh2eggly@gilmour.lan>
References: <cover.c33f5fd8b1b2703081f25398eb879937c9f7ce0b.1591882579.git-series.maxime@cerno.tech>
 <20200630082509.puuzneiipalvrxup@gilmour.lan>
 <CADaigPXSaZ8K2m_fyq2dFwf-X76LpYMagjXqA01b0ST6QYzE2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADaigPXSaZ8K2m_fyq2dFwf-X76LpYMagjXqA01b0ST6QYzE2g@mail.gmail.com>
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1470045008=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1470045008==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jqd42sbh6b7yxf6g"
Content-Disposition: inline


--jqd42sbh6b7yxf6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2020 at 05:51:29PM -0700, Eric Anholt wrote:
> On Tue, Jun 30, 2020 at 1:25 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Hi Eric,
> >
> > On Thu, Jun 11, 2020 at 03:36:45PM +0200, Maxime Ripard wrote:
> > > Hi,
> > >
> > > This is another part of the rpi4 HDMI series that got promoted to a
> > > series of its own to try to reduce the main one.
> > >
> > > This rework is needed since the bcm2711 used in the rpi4 has a more
> > > complex routing in the HVS that doesn't allow to use a fairly simple
> > > mapping like what was used before.
> > >
> > > Since that mapping affects both the pixelvalves and the TXP, turning =
the
> > > TXP into a CRTC just like pixelvalves are allows to deal with the
> > > mapping in the CRTC states, which turns out to be pretty convenient.
> > >
> > > Let me know what you think,
> > > Maxime
> > >
> > > Changes from v3:
> > >   - Stripped the patches out of the main HDMI series
> > >   - Change the bind order of the HVS to avoid a compatible check
> > >   - Added Eric's tags
> > >   - Rebased on top of drm-misc-next
> > >
> > > Maxime Ripard (9):
> > >   drm/vc4: Reorder the bind order of the devices
> > >   drm/vc4: crtc: Move HVS setup code to the HVS driver
> >
> > Could you review those two patches? You haven't reviewed them yet and
> > it's holding back the rest of the patches.
>=20
> LKML email workflow is the worst, the patches never came through to me
> so I didn't see them until you linked me the patchwork.  Patch 2,
> commit message should say "We'll need the HVS to be bound before the
> TXP", but other than that, r-b.

I've fixed the commit message and applied, thanks (and sorry for the troubl=
es).

Maxime

--jqd42sbh6b7yxf6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXwQ4WAAKCRDj7w1vZxhR
xQLgAQCPHb+oyf0Dpp31VCgMq1FZ/q2dYIn1C9v1egi1m+IJnQD/TR5vF/IqjYcC
Z4dgaxdrxiy+ZojLoVAcBM3aBu1UFQE=
=YSwm
-----END PGP SIGNATURE-----

--jqd42sbh6b7yxf6g--

--===============1470045008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1470045008==--
