Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6838D4AEC9E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 09:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C320F10E4D6;
	Wed,  9 Feb 2022 08:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C9510E4F2
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 08:36:39 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 801BF580143;
 Wed,  9 Feb 2022 03:36:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 09 Feb 2022 03:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=MbTZeUMy+/3/3bs2adM+ZVlFkQtC01OoGyTtWh
 YFSeU=; b=S49DnfIpi/7YTPKlQTockOxwAtMUVs8XaPAiJ/NSqOVR6Rh6IGRO1n
 LAG3hJwbtOyPDF+4iwmmQELd8g79xb/533eMFRRhANW7kCEgkumr2MCgiR3Kek1J
 5pXruIVIhuyAIGPg78OC5j948i59TzyaGc90LHBqXgon1QgeQ46H4KCJkiTSd/fB
 ZL/Argyab9EWa5Li/lR5xFQm6mKeP3iJOCWhgjIevI5jN4oeyXqLOynHPBPvZCvx
 dWcBR3GPy4jNeAfNSFLFCwFzcn8XUHidL73XIFmoqOjXTOnnX86kuoRe6g/F/Lyp
 WBMPJQJ6kCnPZLoxA5cqb+i9jIX/j2tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MbTZeUMy+/3/3bs2a
 dM+ZVlFkQtC01OoGyTtWhYFSeU=; b=PHVf772ii7K+5t4pXf37WYaSK48OU8J4r
 F+DKwkyz9d+QYI9SQX3wLUFxmF2UTznVXNBdkCR50Oa21bJCxj5q2j997o/wLzl5
 Z4D9FwOjCAW+rDedAs3Fewk+J9Gh17uklYOAy6bUewetfe8lFG+E/EQIIncst+00
 FaqM9VVipi+w54ltzEemoWr46YPMgukeGZv0OQTzaC8OwFPdyBPinl8xnEzBEqfF
 e3ZSjuyMFM+1iLX4IjzX89C9WWqTC5peFWQptliq44yCbyC9dE9E4TYihleT7412
 Zm2bA2zOkZ0y7Agf/y0mKDjexYRyR8IBDmhdMsTjLd+Zuq9hQeUOg==
X-ME-Sender: <xms:FH0DYuD7vrCmr4tMEF_NxPW3A9DweTL3IOjrV8ES1WX63MXEzpz9sQ>
 <xme:FH0DYoiaEpKLrLMV6OXitHt3egZGd8A4KuE7t8UayDGq2zzW9EHpFlg8Muqx-nJLt
 ywNDtsq6UFiJzy9gqQ>
X-ME-Received: <xmr:FH0DYhlUgkWNzGTBoJocTIQzbxTZNraYErghFy_trYjxjBMT9ZOate6gFGMrSUcYlPkohkC3FsPRxbOKWAm5ZNIfqgwJvdQvcrjnLao>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheekgdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FH0DYsyw-yk1XHoupQcO4q2J5SZheBUyppnBctvdriEY8YhqYEa7QA>
 <xmx:FH0DYjRTVSFqpKx3UWXxA2BpCfeY_tu-pD3u59J4UU8S9etKQFNBvg>
 <xmx:FH0DYnbB6yYXd8s63NJzV7zEYe0bUm66K0rd6YgYO0BmIfOg9HoFRA>
 <xmx:FX0DYhFbnHQxulT0ewqsMPradtaihtmkguPJli-9w7d2PSDJWujO_g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Feb 2022 03:36:35 -0500 (EST)
Date: Wed, 9 Feb 2022 09:36:33 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <20220209083633.mlfbiydi7cbpgexa@houat>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
 <4dd6d32a-9818-1adf-cb3f-20c183ae2020@189.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kqetfhrtfefgtoun"
Content-Disposition: inline
In-Reply-To: <4dd6d32a-9818-1adf-cb3f-20c183ae2020@189.cn>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>,
 Roland Scheidegger <sroland@vmware.com>, linux-mips@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kqetfhrtfefgtoun
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 04, 2022 at 12:41:37AM +0800, Sui Jingfeng wrote:
> > > +static int lsdc_primary_plane_atomic_check(struct drm_plane *plane,
> > > +					   struct drm_atomic_state *state)
> > > +{
> > > +	struct drm_device *ddev =3D plane->dev;
> > > +	struct lsdc_device *ldev =3D to_lsdc(ddev);
> > > +	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plan=
e_state(state, plane);
> > > +	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plan=
e_state(state, plane);
> > > +	struct drm_framebuffer *new_fb =3D new_plane_state->fb;
> > > +	struct drm_framebuffer *old_fb =3D old_plane_state->fb;
> > > +	struct drm_crtc *crtc =3D new_plane_state->crtc;
> > > +	u32 new_format =3D new_fb->format->format;
> > > +	struct drm_crtc_state *new_crtc_state;
> > > +	struct lsdc_crtc_state *priv_crtc_state;
> > > +	int ret;
> > > +
> > > +	if (!crtc)
> > > +		return 0;
> > > +
> > > +	new_crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> > > +	if (WARN_ON(!new_crtc_state))
> > > +		return -EINVAL;
> > > +
> > > +	priv_crtc_state =3D to_lsdc_crtc_state(new_crtc_state);
> > > +
> > > +	ret =3D drm_atomic_helper_check_plane_state(new_plane_state,
> > > +						  new_crtc_state,
> > > +						  DRM_PLANE_HELPER_NO_SCALING,
> > > +						  DRM_PLANE_HELPER_NO_SCALING,
> > > +						  false,
> > > +						  true);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * Require full modeset if enabling or disabling a plane,
> > > +	 * or changing its position, size, depth or format.
> > > +	 */
> > > +	if ((!new_fb || !old_fb ||
> > > +	     old_plane_state->crtc_x !=3D new_plane_state->crtc_x ||
> > > +	     old_plane_state->crtc_y !=3D new_plane_state->crtc_y ||
> > > +	     old_plane_state->crtc_w !=3D new_plane_state->crtc_w ||
> > > +	     old_plane_state->crtc_h !=3D new_plane_state->crtc_h ||
> > > +	     old_fb->format->format !=3D new_format))
> > > +		new_crtc_state->mode_changed =3D true;
> > > +
> > > +
> > > +	priv_crtc_state->pix_fmt =3D lsdc_primary_get_default_format(crtc);
> > Storing the pixel format in the CRTC state is weird? What would happen
> > if you have a primary plane and a cursor in different formats?
> >=20
> > Also, reading the default format from a register doesn't look right.
> > atomic_check can occur at any time, including before a previous commit,
> > or while the hardware is disabled. You should rely on either a constant
> > or the previous state here.
> >=20
> Currently, private CRTC state(priv_crtc_state) is not get used by the cur=
sor's
> atomic_check() and atomic_update(). I means this is only for the primary =
plane.
> And both and the primary and the cursor using=A0 XRGB8888 format, what I =
really
> want=A0here is let the atomic_update to update the framebuffer's format, =
because
> the firmware (pmon) of some board set the framebuffer's format as RGB565.

atomic_update will be called each time the plane state is changed, so it
won't be an issue: when the first state will be committed, your
atomic_update function will be called and thus you'll overwrite what was
left of the firmware setup.

> If the hardware's format is same with the plane state, then there is no n=
eed to
> update the FB's format register, save a function call, right?

My point was more about the fact that you're using the wrong abstraction
there. The format is a property of the plane, not from the CRTC. In KMS
(and in most drivers), you can have multiple planes with different
formats all attached to the same CRTC just fine.

Maxime

--kqetfhrtfefgtoun
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYgN9EQAKCRDj7w1vZxhR
xZ6BAP9j8kJHoG5YQyu1To5wFlm7TFa/y9uSGX81KcAkqlYkZwD/W3iUA4ZG9tdL
VNf2zBWWGP2cOgzaLtyzWTOxYsxcvAs=
=ByIy
-----END PGP SIGNATURE-----

--kqetfhrtfefgtoun--
