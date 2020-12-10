Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D552D5E63
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4207F6EA70;
	Thu, 10 Dec 2020 14:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648C66E42A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 14:26:33 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 69369F7F;
 Thu, 10 Dec 2020 09:26:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 10 Dec 2020 09:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=/1h7IULFlgMYvyUbP2+Uxu6AyhC
 gpN9jIorI6el9bxk=; b=cqLBGqbAw0TIplqtVaJ3y9WrJyXuuDK5/0QMBKi9PjF
 x/ANJ71MDBUN/efYb0VaBwZ/gf4wSPRAEzhVaDuxhWY51KsJFm/IYnAN6hLZCull
 Uk43dc7YrnOW8/EW0fR4J+D0yN4TidkTP1SwMB18LCqgIOH9IVjrBrxws6gec/yK
 JJbzXOt0O1qDegDS4h02/v2qsPIcYygxcwdl4get3ubpbgH6J08duiVy7zztf9l0
 gIUq66bnbffrKAMcxYp2EYlkYYpBENGJ2nzSriVzTh9p2o0EP9YhLqQvV2/+jp+e
 gbJB6bf2HXz5C4JX6hGOZIqHyuJgRo49bQPkFoBjhNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/1h7IU
 LFlgMYvyUbP2+Uxu6AyhCgpN9jIorI6el9bxk=; b=T3ErwnkwISMnn4gUfHWnni
 XigWtMuYcvm3gxCDbHpB+D+yhdgeyd1NrV9tVhPssLmdAUqh+jy1lcpajAKnUtkd
 dt5JQaEBGECramHBNKGHAjYMIKAEhZ1vdMg4SpHU9/SFz8yFUg+Nw3F/FZWT0tZM
 JrPnhABcwRNaf8p+E/aIwLQEjZV61EnwJxY6P3aTYxf9fMjf7xEn9e/xgNuLlgGV
 phMoGNVAA+BSaTiOh3LsJJL14w9o2SuSkS+Y05RnfqxzUFnr6n5bE+EMVNfb1ILO
 gzTtdIwPIdX8ow7TBuLiXCXp8ZJ9XSyNlA2JDb+LRRZuS58UayZvbsboWqZ0+nGg
 ==
X-ME-Sender: <xms:FjDSX00y-WjLBxIqQv_H6pngX5uf13KN3WZV8uWqjLlHBIXw95tqJA>
 <xme:FjDSX_G0PQIsrsYxXTFK1vXcpcwwsvm6cKVWiviUEOwdIJiZ0fvSTnWFNUV2OPaO6
 K5ZuxbmqwRfGdKDAQc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FjDSX87oYigXTl3m64z9cclbBbvUwAarQSwP77o5YwBkMdFLdybS9A>
 <xmx:FjDSX92fEZavTZAmHDXbTNG6OY6YTZaXex6kcyeLl2L1611wJZG2Bw>
 <xmx:FjDSX3FjIf3_n-FyDUPS22K_KXtFMYUGQ_muHT8zkzKh32X-HOG2rQ>
 <xmx:FzDSX21dslymC5yXhDf_szTS7c3KHvvID3IC9_H4SJPLkDv_P2XZVg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3116924005A;
 Thu, 10 Dec 2020 09:26:30 -0500 (EST)
Date: Thu, 10 Dec 2020 15:26:29 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v6 5/9] drm/vc4: hdmi: Create a custom connector state
Message-ID: <20201210142629.yyllydmegbhr3lom@gilmour>
References: <20201210142329.10640-1-maxime@cerno.tech>
 <20201210142329.10640-6-maxime@cerno.tech>
MIME-Version: 1.0
In-Reply-To: <20201210142329.10640-6-maxime@cerno.tech>
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============0629832292=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0629832292==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cwongxt7lcmqbz6p"
Content-Disposition: inline


--cwongxt7lcmqbz6p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 03:23:25PM +0100, Maxime Ripard wrote:
> When run with a higher bpc than 8, the clock of the HDMI controller needs
> to be adjusted. Let's create a connector state that will be used at
> atomic_check and atomic_enable to compute and store the clock rate
> associated to the state.
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 33 ++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/vc4/vc4_hdmi.h | 10 ++++++++++
>  2 files changed, 40 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index 61039cc89d9d..8978df3f0ca4 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -170,10 +170,37 @@ static int vc4_hdmi_connector_get_modes(struct drm_=
connector *connector)
> =20
>  static void vc4_hdmi_connector_reset(struct drm_connector *connector)
>  {
> -	drm_atomic_helper_connector_reset(connector);
> +	struct vc4_hdmi_connector_state *old_state =3D
> +		conn_state_to_vc4_hdmi_conn_state(connector->state);
> +	struct vc4_hdmi_connector_state *new_state =3D
> +		kzalloc(sizeof(*conn_state), GFP_KERNEL);

This should be sizeof(*new_state). I'll fix it up when applying if there's =
no other comments

Maxime

--cwongxt7lcmqbz6p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9IwFQAKCRDj7w1vZxhR
xRGIAP9ARZbhRFSMU/0hdseePpsBel+12XBk2VNiNiO5OyHXfgEAn6kg1acwvb3R
EHSHPv5dlNeZFccf4ICtOa2uS6+mLw8=
=oXJp
-----END PGP SIGNATURE-----

--cwongxt7lcmqbz6p--

--===============0629832292==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0629832292==--
