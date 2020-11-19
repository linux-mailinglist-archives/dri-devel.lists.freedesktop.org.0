Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D0F2B9C07
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 21:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D911F6E81E;
	Thu, 19 Nov 2020 20:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916246E554
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 08:40:26 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 095895C00DF;
 Thu, 19 Nov 2020 03:40:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 19 Nov 2020 03:40:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=K4YOrkxO5aQ1KfWuJk8zv5SVVSu
 10XR5B9F+1/P4xic=; b=hkrHqdyDrONO4sLhaI0pBvuwMdVIKp1/VZV+ZnuKyba
 HRNXkQBXF7TrJyP3Xn+MLaKWSXYlG4V8towUobY1H9xQSd6f0HDVy9jBagKmkIaV
 GDR+yKLq5QxDAXJB6OhfFvWu233NGHCZN+tB43tWKczFCi7AaYS8zUxyrLuL9wlN
 tJk6Dfuja+kOexptV++rbn5eR7yPs412HKcisguMRolqbeQEn3qZF0PK0QcahC9l
 /UmFSPIBy4ivwVo4eow4Fm+IEpPdDbna8lgwnjUQ05N8vmM6e04e89Qf4+QfV4J4
 40eGaXg60RH9xky50MvC/qv8f71gRcvbMiIm0b0YtdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=K4YOrk
 xO5aQ1KfWuJk8zv5SVVSu10XR5B9F+1/P4xic=; b=cKHRXhdJtg7ttL65jE62T5
 siS/bV/ZueBLIeWrNjEWG0JaQ0n9G4X4yQd3kSnSHrB4eVlZwCxASn/BJyqTOQqG
 dGyVusfHyvnaC1jBkX1TTNxq/ASApcx07VP6ZtoQGQ8q6SZDVPyOBMt3DQh6oqxK
 tJo/slAFXpVFkXmUFWmAWduL9FW438UWsJKVQoAE7hjEi2z/iqDubGakISsQC4Za
 wAc+LeSBfWEKKbsVjWS0+bDArAG1NaeXnCESiobvP06TttE8+JoIHnNS634pLlSN
 Q1506HN0QY+gLjc04NxIPocBrnkgFEXHLj9Qq73WDwhxiV60bTRNGdo20gLPgSKQ
 ==
X-ME-Sender: <xms:eC-2X0rF0-BeqdFS8iNJPYoy5GGsax44dEgtHvX2seKZ1lZ-6MP0cg>
 <xme:eC-2X6qYmVHEDYF5nmZcimoMf1_qV35oD6eK3LMMjj3JWGFkDhZmmX41-RrZYx949
 VUvVPogwAXUtnzhqYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefiedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:eC-2X5MUp90jbuvuK07PNtAU9dFxV7zlM9_8PnaMoH6kMGzMKLCzaA>
 <xmx:eC-2X75ABzMPQE0G5McbMG_wnVnI_qQJfFkqidyAJrrRiOHo7R1Wrg>
 <xmx:eC-2Xz4Jre2kdOqcJM2n3ImF_DQpj7crZu6Un5k7GlaIP_lue7qvlQ>
 <xmx:eC-2X1nkBPY-MbnwY44yea1Ig5gVtnxqH54kahMunZO2ukt_14Ypag>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2EED43280059;
 Thu, 19 Nov 2020 03:40:24 -0500 (EST)
Date: Thu, 19 Nov 2020 09:40:22 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: Re: [GIT PULL] Fix for drm/sun4i shared with arm-soc
Message-ID: <20201119084022.c2zxnlp23xduyhzu@gilmour.lan>
References: <20201118090455.sznrgpduuytlc22k@gilmour.lan>
MIME-Version: 1.0
In-Reply-To: <20201118090455.sznrgpduuytlc22k@gilmour.lan>
X-Mailman-Approved-At: Thu, 19 Nov 2020 20:32:07 +0000
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
Cc: arm@kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0083145611=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0083145611==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v3jqwcjkkygzzggf"
Content-Disposition: inline


--v3jqwcjkkygzzggf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Nov 18, 2020 at 10:04:55AM +0100, Maxime Ripard wrote:
> Hi,
>=20
> Here's a fix shared with the DMA work for sun4i that will be merged
> through arm-soc.
>=20
> This conflicts with the subsequent work done for sun4i and
> dma_direct_set_offset, so it would be better to merge that fix through a
> PR in drm-misc-fixes.

I just merged that one into drm-misc-fixes

Maxime

--v3jqwcjkkygzzggf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7YvdgAKCRDj7w1vZxhR
xReyAPoCUoNYc1/HHEtlgSOn+Vw82dyqs5EucosK11Fi62PDLwD/TtBlL7ZD5/Hy
mcol3WK04n+fjQkhGER8cHoijiT+KQ4=
=PtMB
-----END PGP SIGNATURE-----

--v3jqwcjkkygzzggf--

--===============0083145611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0083145611==--
