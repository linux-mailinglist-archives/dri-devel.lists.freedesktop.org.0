Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 853DF4A8394
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 13:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A3910E642;
	Thu,  3 Feb 2022 12:09:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6034810EAC8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 12:09:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 957EE5C0249;
 Thu,  3 Feb 2022 07:09:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 03 Feb 2022 07:09:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=/GcVn9GTP0e0D/nTt9oIVJ09/OjnpjCRP5LKj5
 JAsy4=; b=PX7NN+fIX9HwBU7JFUFpEMDBsZbpRhZUc9WoUlhV2EKMmCDoBICQlq
 H/SMJ7PXZGdLgM1Y/y+4NjJa0zXESsg/fglC1sp/DmxXtw0bbqq5WRQpkyQtYLhZ
 CPFUhOWxXFnDwTn3mZDH+bozRtvYU9W6V+AE4OVTVJ8T2tf6uC2SR/d6nts40s2X
 WrchNotBaDS1sb6lSFb0pLhyJ8FigMyOUJe1RW4uKcobPe1CxeV+ZMenEmjttE+s
 gQ8hFQj/YKP7VpoZg+nVNMqacQYZCFFZYdTWFsDpKO4V4b81yf32ANNm3jbGjWFB
 Ekj65muTj9JKb3YEGLpwkmjq+pZJXfUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/GcVn9GTP0e0D/nTt
 9oIVJ09/OjnpjCRP5LKj5JAsy4=; b=gP9oFC5lkmZM/m+BagPupPHoZzm7VZppU
 zDeBbHbJUy1Ql6ZVSM55W2UqrWye698mn2AfSHjN055erAPCp5Ok7iKVgJx0tqZa
 ST8aL2FRaBJQAPkF+UwnvDAwz7DBi3j0ZkeU8TaLLASESivpyz7xvEO0uWLYsuCU
 Ic3XaslnkFP2syW22qxNUvbf9AwgV2RXy5OyvQmbKFgS5Neg/7zLZC7gIR+xZbOO
 qZ4Ci2+RhMQb1kBp+Ug9dmg0PnN2D4OhOOHBLgNjEYqaycU05G3rZlAqvqxls+Yx
 preS8NzyzoTl+vbxyGXq5YBp7uMDvIYP6zc4VyFkhe+FsNyMKp/GA==
X-ME-Sender: <xms:4sX7YTMLfpfmM-v0PFoGOMR04QlktmqB5KQfT3XO0KN9X_W39CCIAg>
 <xme:4sX7Yd-ytJMSqmoDkFq70HPmO2R5LiIGCiz-hiaO8BacAjGnwV1E60YUfn6etgDDO
 U6xOaFJKAMDHpBRWTA>
X-ME-Received: <xmr:4sX7YSTbmHs2faIwZkee-aNVYJMYikRaMPET_ZdM7QoK7baP8GVDJACrK1MB9MQeZ69Sldn3gdyH-Q2dpgL3zLNR5exSpZm9t-N3u1o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4sX7YXsSC3dP8QJ6uEuQCW6ZrmNOodkK55hl80N33R-SYOAHNVt0ow>
 <xmx:4sX7Ybck-ZFHFWWzQ7UYyfJnJC735L_C1pu811Khu0hp5iNMHoFHSQ>
 <xmx:4sX7YT2oqwlI-TJXXS38HH6HHVcHdxKEtEnbx7KFlgDR5innUvfs6g>
 <xmx:4sX7YS6hMYIBYI3sWWgJahvY5qvuQ5HlAThFjwDV4zVKDDMkRDK-yA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 07:09:05 -0500 (EST)
Date: Thu, 3 Feb 2022 13:09:03 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 05/14] drm: bridge: icn6211: Retrieve the display mode
 from the state
Message-ID: <20220203120903.puueinbzetzzbqpm@houat>
References: <20220114034838.546267-1-marex@denx.de>
 <20220114034838.546267-5-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6sg5vhydo4o2c4ga"
Content-Disposition: inline
In-Reply-To: <20220114034838.546267-5-marex@denx.de>
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6sg5vhydo4o2c4ga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2022 at 04:48:29AM +0100, Marek Vasut wrote:
> Retrieve display mode structure from panel or atomic state in
> bridge_to_mode(). This completes the transition to the atomic
> API.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> To: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 26 +++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/b=
ridge/chipone-icn6211.c
> index 14d28e7356aaa..d6db1e77b5a35 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -146,9 +146,28 @@ static inline struct chipone *bridge_to_chipone(stru=
ct drm_bridge *bridge)
>  	return container_of(bridge, struct chipone, bridge);
>  }
> =20
> -static struct drm_display_mode *bridge_to_mode(struct drm_bridge *bridge)
> +static const struct drm_display_mode *
> +bridge_to_mode(struct drm_bridge *bridge, struct drm_atomic_state *state)
>  {
> -	return &bridge->encoder->crtc->state->adjusted_mode;
> +	const struct drm_crtc_state *crtc_state;
> +	struct drm_connector *connector;
> +	struct drm_crtc *crtc;
> +
> +	/* Try to retrieve panel mode first. */
> +	connector =3D drm_atomic_get_new_connector_for_encoder(state,
> +							     bridge->encoder);
> +	if (!list_empty(&connector->modes)) {
> +		return list_first_entry(&connector->modes,
> +					struct drm_display_mode, head);
> +	}

If I understand this right, this will return the first mode on the
connector, which should be always set. So you always end up returning
the preferred mode for that panel?

> +	/*
> +	 * Retrieve the CRTC adjusted mode. This requires a little dance to go
> +	 * from the bridge to the encoder, to the connector and to the CRTC.
> +	 */
> +	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
> +	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
> +	return &crtc_state->adjusted_mode;

And thus entirely disregarding the actual mode that was set by the
userspace, or ignoring any other mode than the preferred one?

Maxime

--6sg5vhydo4o2c4ga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfvF3wAKCRDj7w1vZxhR
xZXpAP9JEc7GOVwpPZKuhuzbD95RQEd8Bp70UfWzi4FWYwHL1wD/Ylr1cYxA8wvc
dknkMGGWVvytzAIP3KE5oKkAMg7CWAc=
=nVig
-----END PGP SIGNATURE-----

--6sg5vhydo4o2c4ga--
