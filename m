Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 066074F9459
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 13:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358AF10EF57;
	Fri,  8 Apr 2022 11:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE8310EBB6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 11:41:38 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8D2AD5C0121;
 Fri,  8 Apr 2022 07:41:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 08 Apr 2022 07:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=kAS+tQPOzco/HCz/0o5tDEF4Wxxx4NwyfaWgqj
 rHJb0=; b=BSprqVRDv5cnDipm9xzf2Ji7DUXEHlyWpTvdjVmy6LkNCKQU7qs+kp
 p/VYO7DckTVLSN0d2CD0APXCFzxLikJ/hVH2Xcl+kWxWJxX7M594zMm+7sjsKeTi
 Xf6X1t6lf76QuAPnTTi385Un0+ztgKSScFlpgq24qm9qxZp6TmT+hzAsws2+Ev4O
 CMafbioKB35jrVtHLofvM/rvsRDOaj1nyImqeq7gy2nNtYxlebuowHNeZLLHor/1
 mhqbpBcxFx3GcjOawoSdre8xkHLsqfLSvoWHbyER4w4Cse7IOPfvt3eeWY/xVQqh
 h8xqpyuOUHiAyWlhm9u30F5B100WVKyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=kAS+tQPOzco/HCz/0
 o5tDEF4Wxxx4NwyfaWgqjrHJb0=; b=OTG7tiIilgF0nnX2RDcjgTN4OjxZoU16Q
 enIZFHjaFpDYgh74gbgsQXaRBQ0onkYfk9fOIiMzHx1YmslkVFpdRDkWrWWeoJZ7
 RdiNNLpucBjWnic7IQuR2VjyEmYF+rxW0HjT6u2FwpB8xTJaXnKyJQLjgtp7fQLW
 jNnoZ/DLsf2XZGv8JubsTtqnMiFbKcPv6JZePB5POjfozCdZoouU+OXpeeZ9RVR+
 xUsTvIXMgnoCpIeULT6Ol0ZIXgXGmZwb2jJMu6o92gQXgLg9BbjhdmY8nlac8MrF
 QfzJQnFjZVQgV1mvzAepPL8YrQPjj2JxjYKExccYARlgDL9X+3UaQ==
X-ME-Sender: <xms:bh9QYkH_iYFBrGFYaZqOXNH5G0r70FjJG5t-_CX15c1LJEBACa5KSg>
 <xme:bh9QYtUw-Bigtc3xfCm-5P9FTpPThSDdZ6Xz5rbTsLCAS-aDdOZVsfrKn_jzbu_OH
 7rxF38UiSY_JIuB744>
X-ME-Received: <xmr:bh9QYuKASE9hSpw4K0Gbc6zLz1I8qD1vcrPmT8Yqf6rvMPNxnnW8kGF2cMWkm6hgtB6_IEHQhH150QfVJj6B_9lI115Ytq0B_4rAqNs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:bh9QYmFY5fa-RXu-dgvaIM3HIKO_bptXwlR3kzZ5VoNIwFqhXfUbvA>
 <xmx:bh9QYqWLvQBXyNuYgHc7fkXNODkZ-EBr0RoBm1D-Y_0f3jXBqmdC9g>
 <xmx:bh9QYpNPLe_YTCC91dVlMQazdmtv9eHokee3leFRPiVVIe8BfvmpoA>
 <xmx:bx9QYniIzjhcvmHqEXzOuox3OuRVfFHg_FOjR7uC-4Ixp0FF22PPrA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 07:41:34 -0400 (EDT)
Date: Fri, 8 Apr 2022 13:41:32 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 5/6] drm/vc4: kms: Warn if we have an incompatible muxing
 setup
Message-ID: <20220408114132.qofs4vvlofctuecj@houat>
References: <20220328153659.2382206-1-maxime@cerno.tech>
 <20220328153659.2382206-6-maxime@cerno.tech>
 <c290853e-f0e2-ceed-b53c-859bec1fbce3@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mmm43akcmxwivuz3"
Content-Disposition: inline
In-Reply-To: <c290853e-f0e2-ceed-b53c-859bec1fbce3@suse.de>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mmm43akcmxwivuz3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Wed, Apr 06, 2022 at 11:07:53AM +0200, Thomas Zimmermann wrote:
> Am 28.03.22 um 17:36 schrieb Maxime Ripard:
> > The documentation explicitly states we must prevent the output
> > 2 and 3 from feeding from the same HVS channel.
> >=20
> > Let's add a warning to make some noise if we ever find ourselves in such
> > a case.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   drivers/gpu/drm/vc4/vc4_kms.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_km=
s.c
> > index 94c58ec37a27..d94f78eac936 100644
> > --- a/drivers/gpu/drm/vc4/vc4_kms.c
> > +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> > @@ -286,6 +286,9 @@ static void vc5_hvs_pv_muxing_commit(struct vc4_dev=
 *vc4,
> >   		switch (vc4_crtc->data->hvs_output) {
> >   		case 2:
> > +			WARN_ON(VC4_GET_FIELD(HVS_READ(SCALER_DISPCTRL),
> > +					      SCALER_DISPCTRL_DSP3_MUX) =3D=3D channel);
> > +
>=20
> Should be drm_WARN_ON().

Indeed, thanks

> Is that something that could be detected during atomic-check steps?

Atomic_check will allocate the output and take into account these
constraints. However, what was happening here was that the hardware
already had a default value that caused the conflict.

Patch 1 fixed it so we should never be in that condition, but better be
safe than sorry.

Maxime

--mmm43akcmxwivuz3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYlAfbAAKCRDj7w1vZxhR
xYywAQCq/dtPsdB2V1AmOiZ6xNrgmfGqNXo3zbwThAptpJaSdQEAxz98nL9/7wni
wjAyKhAmJmN5IaREKCrp+A8Emejn3g4=
=5ee7
-----END PGP SIGNATURE-----

--mmm43akcmxwivuz3--
