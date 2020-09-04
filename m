Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2F625E4B3
	for <lists+dri-devel@lfdr.de>; Sat,  5 Sep 2020 02:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3BC6ED0D;
	Sat,  5 Sep 2020 00:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BE706EB25
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 09:13:45 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C423F5C01A3;
 Fri,  4 Sep 2020 05:13:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 04 Sep 2020 05:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=tNStYofwqBwEjtXMmgZUM9HPtcZ
 9ifnXjeu5FTSCAF4=; b=LPKKDcuHHSweACiGNfD20vp/dQQpnrd8VxsHpf1Nej1
 AJzndRj0IC4KDDZUUWq8D9GN/NTgdkJj0DxPXw4thEGHiL0XelL2D9rKaQlK6pZL
 OwhCxLDJ56V0uGRZ/77oBilpeTu/k6Ee6Ebu6F9OdJzbfHnEzFLy6xpmDsd/Tg/+
 qSiBd/OaWXAhQTjaopvsodGdgQWQnk2l1XdZWSv/2wv+adPRFRUthm+yEzAC/7ii
 APLFBjtmAZz1llofipLzQWth1TF7zWOmBXdvV4968+aRUGN/bAoUP46FHzGQ9NJx
 c6J4nEiG2oNEHtzYzkW+2/316QgppZD4+dF+pJjdqyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=tNStYo
 fwqBwEjtXMmgZUM9HPtcZ9ifnXjeu5FTSCAF4=; b=PmbzIpM/Z70W6c+0AGtzRo
 c6qtfhUq9lAATKBVQZkpqr0fmWZJ4/adulG3KZV6zvNHl9dCg0TB84i7R1IceSyr
 LA4YJNeGxKeMl5JP7Bk9rI175VFDzXIKBxBeCAEWOpwN5SH8pMzL5OV1VeIkRyz2
 QGlOtOlyJ3q5tdseCLggjejw+2L55y3jysBsT5VuubAcqzj0Mii/w48PJW3Ajdvn
 9gTGQne9Qx+7KaESFVzGNtvZ9062mkVe8j+ee7gV6dwxxuHx21rfFAyYsU0NnsEq
 dpJ9rJyiB+Pzle+g+keRTI/9Vm45lch6tw2yMMnsD9XBDD6y+pjp8DGLIh+sDJXw
 ==
X-ME-Sender: <xms:RQVSX0PoWy3SlJp-ohpv8WEMJ42HfISfd--_bVbG1c131gCZncJBTg>
 <xme:RQVSX68yiGLEXjqD9-P6I8wlft8khm-1sOu5G77jg2n_TJ_QWis7O6PEqx_Jtkov-
 qm3dwCUvsfwVkvLoQ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegfedgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RQVSX7QmO8TkdEhw8oqP4gl4joFb7DH_Nn7YvZMldipADXn0PFD3Lg>
 <xmx:RQVSX8ueyLz4aIApWLEysDROEH6mJ4qnjXerKMe49inJyH_t_47HrA>
 <xmx:RQVSX8fCfUk3skB5WNNFm-GL5zCX81RZBq-Usc4i45qO3j5nRKELiQ>
 <xmx:SAVSX4GYKhR4PLzJHa1lMJEnJ83jUxNsSYNN8e1aRBexlZEPeESvsg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6CE9E328005E;
 Fri,  4 Sep 2020 05:13:41 -0400 (EDT)
Date: Fri, 4 Sep 2020 11:13:39 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 1/2] drm/sun4i: backend: Support alpha property on lowest
 plane
Message-ID: <20200904091339.hfmqmuaikxnuqgwd@gilmour.lan>
References: <20200728134810.883457-1-maxime@cerno.tech>
 <CAGb2v65y+Sdt9YGAV=jBv7KVT9s9ZO9aDe+oD=yfEB_Xsm-wiQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v65y+Sdt9YGAV=jBv7KVT9s9ZO9aDe+oD=yfEB_Xsm-wiQ@mail.gmail.com>
X-Mailman-Approved-At: Sat, 05 Sep 2020 00:35:27 +0000
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1002876737=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1002876737==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7d2bk2ddnxu2zopl"
Content-Disposition: inline


--7d2bk2ddnxu2zopl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2020 at 02:56:58PM +0800, Chen-Yu Tsai wrote:
> On Tue, Jul 28, 2020 at 9:48 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > Unlike what we previously thought, only the per-pixel alpha is broken on
> > the lowest plane and the per-plane alpha isn't. Remove the check on the
> > alpha property being set on the lowest plane to reject a mode.
> >
> > Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > Fixes: dcf496a6a608 ("drm/sun4i: sun4i: Introduce a quirk for lowest pl=
ane alpha support")
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>=20
> once the build break is fixed.

Applied both patches (and fixed the breakage along the way)

Thanks!
Maxime

--7d2bk2ddnxu2zopl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1IFQwAKCRDj7w1vZxhR
xUGZAP9Mx1jI5+bjVzpr2dvQ3dLeNtG7ICD6lHMtMrRTqE90EAD/TwWUB4r5HyuA
LfwYtqW+p1Cu2N0p2r4aZlvVHgKOtgs=
=6YKD
-----END PGP SIGNATURE-----

--7d2bk2ddnxu2zopl--

--===============1002876737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1002876737==--
