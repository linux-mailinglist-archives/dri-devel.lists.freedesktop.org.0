Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6013D8CF4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 13:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240A36E190;
	Wed, 28 Jul 2021 11:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2EB6E190
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 11:44:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 24F1C580A7F;
 Wed, 28 Jul 2021 07:44:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 28 Jul 2021 07:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=i5DEVqVLKNgvooEShC0umjdJ2dW
 fZTwOs7vNdYKqxSQ=; b=0BgbYpq4IkNVoYqOUyBiLyBrAwGJVY+ln4bAgptazgh
 1CwejsqIVFwUC5pUgsMwLIthCMtpqv/BfXjPCD0+neoCpQ16DAoNOI8WpsLSdeC6
 sG/i4bfU2FIq86jLEYts4V5Bw/cvuxrsteJ4Fb1YIYsGW0Z7/Y2ShJdKKUTbeds4
 12Ai1T9i78SnYMOpdQxXK31QuXdRcyNE2PzRu+/qPjQHMrSg6JHEz6ve53CiS8Ps
 mdEVDPRhUVLIE4jiCXYMNXCuIYl1EHaWWFeufNK3zKm1N+RiYXp5FLvspRsW2jT8
 DB5jbr3uSg1ebtxV3Ibz/xUz8KwjnkeWMBPkTcVrNpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=i5DEVq
 VLKNgvooEShC0umjdJ2dWfZTwOs7vNdYKqxSQ=; b=DlrXJzFSJVLHT3694RWKKa
 OlHojgI5BVV+iNI8pCdMcrmf1lt7TnGGwo6mlK8gSh1LGhnP7IoZ+vq1irUCdw+g
 uaNhlCE1LxZ9jLeStAHi38mVwS9BwuG0c5CwtF0nghxpzzopRj1WowOmS+a8/CEq
 sY73sYnwNQwoHKrxhsTm0VXemSbkbjiA05NZCkS5X8WubrVEA1uOyOpfyL3C5Sl6
 kcUO/8z7dGY0sb6i34/5swrFOD1Ga4fwDLs4/I9WZdIeBT9A6fTQrswk9XLFbmMS
 NJopTmhKavqFLfXPGad5M0hRFgWCQksbfA8Gumaz/V4xkR2foO1wfhR2zGuzvDMg
 ==
X-ME-Sender: <xms:AEMBYZ_UTXRS6O6YxOgJ5R2tpeb3At2O-e1dcPWq3y9-dmXZUNrTig>
 <xme:AEMBYdt9tJ7dPobH7ahYFRQTvv6DqIXUyCvDRN4ofR8WwhBPl-QVefNAMpq7f2g3C
 dLEAwhwkoenxhCRbms>
X-ME-Received: <xmr:AEMBYXCwMKOo-Zx1NCAwnS_fvGSAMPD3oP46Rf4RmYuGGQu3yxiP4P78oH3EQ7vYFcfeHCMdDdRwP6BbqeeirY25I_UKBvO2zTvJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeelgdegudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AEMBYdcrY0bw9gZLa1YkFX5CfeAal6XF581e-dgTraURedUB_9KAMg>
 <xmx:AEMBYeOYFCp5U1JIr-xBMm15Z9Nhrknm2N7qvOmer6eli-LIsuwPyg>
 <xmx:AEMBYfmmS7ikjrtw094UitImn-9XDk_2Ql8mhIyUeTbSGunOtVugRA>
 <xmx:AkMBYVnb0OHWiHg4rcYuit3XgkrnLhlSTYlUegXEjlCWB8lk-D5zIg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jul 2021 07:43:59 -0400 (EDT)
Date: Wed, 28 Jul 2021 13:43:56 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 2/2] drm/vc4: hdmi: Remove unused struct
Message-ID: <20210728114356.45atxmgchoh5dec5@gilmour>
References: <20210707093632.1468127-1-maxime@cerno.tech>
 <20210707093632.1468127-2-maxime@cerno.tech>
 <CAPY8ntAAE+N79T7Q15URHRkGf+N6f2DKNjtyp+74AFjNdb3Prg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xk3qsked5wiwxew6"
Content-Disposition: inline
In-Reply-To: <CAPY8ntAAE+N79T7Q15URHRkGf+N6f2DKNjtyp+74AFjNdb3Prg@mail.gmail.com>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 kernel test robot <lkp@intel.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xk3qsked5wiwxew6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 28, 2021 at 12:01:34PM +0100, Dave Stevenson wrote:
> On Wed, 7 Jul 2021 at 10:36, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Commit 91e99e113929 ("drm/vc4: hdmi: Register HDMI codec") removed the
> > references to the vc4_hdmi_audio_component_drv structure, but not the
> > structure itself resulting in a warning. Remove it.
> >
> > Fixes: 91e99e113929 ("drm/vc4: hdmi: Register HDMI codec")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Applied, thanks!
Maxime

--xk3qsked5wiwxew6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYQFC/AAKCRDj7w1vZxhR
xd2CAP4mDadHiXJx5q3SwTlgirzxV7iiapFkcxzUnMvR7riZqgD+MLpH/7goDQTx
7mEM/yZfEZ3idqk11ewlUBlqunMdpQY=
=AdMi
-----END PGP SIGNATURE-----

--xk3qsked5wiwxew6--
