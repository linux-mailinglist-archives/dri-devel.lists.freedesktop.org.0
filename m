Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBB12A5F59
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 09:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7007B6E964;
	Wed,  4 Nov 2020 08:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F306E866
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 10:07:07 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id D8F44B55;
 Tue,  3 Nov 2020 05:07:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 03 Nov 2020 05:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=fYTHzwgDTiC7ml7WINoDDZgK5U3
 +74ONaFZ3sigq5lg=; b=Zn/JnFV9V9uK669pbHW9PnvKY+VDiXEAnSMwMnmUrBD
 McJzRUYdCR4EjDtlJSUCzH6izm7QNzZmqyCcMdHQMIRYPULzwV6jimIUSppwWwaw
 y8pyt977BQxK+6JeFbF6HWPWIQOsTMWLlLNfecgMejKELgHSTUP727XyWj55S2Tp
 IAg9iVF+tRBpVGR5oSQkEGhRen0eww18YJHm00/1vM6s+s3wBqWVxAQYltg+aMz/
 gTaY6gdatWuBdYit+2D6hiJ1Gz263GaIj7fOEh2g4DfANGMAbb20Sr9gcYJ99p4g
 HFB02sVUi54B2+Tz6C+Qg7aEhmDFR0UuExxS83XoF7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fYTHzw
 gDTiC7ml7WINoDDZgK5U3+74ONaFZ3sigq5lg=; b=oI01ZCVhpmPaUsOn5NYeU3
 cku1Uyy105QURz9tKDw542+l7Mm4R2ZdbMJNX/goZyCI6kmt+xXDDeOA0U9l+fvV
 Cd0WobgIVXHbOr7VNtpF4qd0TNCMRbRTPcp5V7TF7dGUWodJScWsz/D3aX1rkjxs
 AAbFYfzWNJFndmRNKizDKsdMBfa1s/TfkpOaueUrUq60bTFdbuMP7tebM+ubDRtK
 kTftV5IgJvMBVQcLxkrXaiEiIu8nm3w5kEsVGlr/PAhu0wHkE9+wvWyEu//M7dMT
 l/BlWpCilcUi/4m3ITRF0Gz7gjqkkD/spkdIpt8ir4n1TrUEsBBJqaF/obTtJOCA
 ==
X-ME-Sender: <xms:ySuhXz4oznLrjghgGc0nsXAFWRq8P0fnwlTXIegQDxuTnXcdy4AdkQ>
 <xme:ySuhX47yDD_RPBJfzP0B79Dmm55l-w5cV9DICgEM3LYi3OlCV48pLZJQLS-8M6R-B
 61tvyKiwMlpcJOh-b8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtfedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ySuhX6cytzBPlxROK11zZQn_JqxOXvDqQY4ZGA7HAmXiCooC8z6BcA>
 <xmx:ySuhX0IHWh6fViB8HPAAVSbNy9w__0Da4lv0HYSZ8g78D1-EnUdhnQ>
 <xmx:ySuhX3In9veW69ex_YbqSDWcHKNYomdzTVXyZnn6hbuoVP0Se68Tng>
 <xmx:yiuhX_1YAqzlo4tsPQ6ZWDL6u1JkodTIx78L1zOXMw-rxtwuHrEX-A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 46EA83280068;
 Tue,  3 Nov 2020 05:07:05 -0500 (EST)
Date: Tue, 3 Nov 2020 11:07:04 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/nouveau/kms/nv50-: Use state helper instead of
 crtc pointer
Message-ID: <20201103100704.lrpxj4jtcbmftwjh@gilmour.lan>
References: <20201102133834.1176740-1-maxime@cerno.tech>
 <20201102160630.GP6112@intel.com>
MIME-Version: 1.0
In-Reply-To: <20201102160630.GP6112@intel.com>
X-Mailman-Approved-At: Wed, 04 Nov 2020 08:22:13 +0000
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============1494530913=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1494530913==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wo72zqu6cdfopo6f"
Content-Disposition: inline


--wo72zqu6cdfopo6f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2020 at 06:06:30PM +0200, Ville Syrj=E4l=E4 wrote:
> On Mon, Nov 02, 2020 at 02:38:32PM +0100, Maxime Ripard wrote:
> > dispnv50 references the crtc->state pointer in order to get the current
> > CRTC state in its atomic_check hook, which would be the old CRTC state =
in
> > the global atomic state.
> >=20
> > Use the drm_atomic_get_old_crtc_state helper to get that state to make =
it
> > more obvious.
> >=20
> > Suggested-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Looks correct
> Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

Applied, thanks!
Maxime

--wo72zqu6cdfopo6f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6ErxwAKCRDj7w1vZxhR
xXHqAP9NU8kVVGvqt6WFWqncFrSt7vyOg3dwa4HKTOLZee2LLwEA/grSQXcp03Ee
Osl9mp2g41JzG+D0Q6FnFfz/nxeJFwM=
=0Q3H
-----END PGP SIGNATURE-----

--wo72zqu6cdfopo6f--

--===============1494530913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1494530913==--
