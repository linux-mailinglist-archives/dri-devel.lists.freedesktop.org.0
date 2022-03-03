Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B714CBE33
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 13:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFCA10E3F9;
	Thu,  3 Mar 2022 12:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B7EC10E3F9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 12:54:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EDCDC3202175;
 Thu,  3 Mar 2022 07:54:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 03 Mar 2022 07:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=wB0sPgFCLl0/DTwRVzLMcp3TZdlIK3ghzd1dBf
 vnWvs=; b=M03v05qqxODG1bchf66H0MjHH6TkcelZolj73VIKSDKoQo1j7+xQjm
 ZvtnIYjl3gs/sXnpikI1GfMKxEm5eE8oP+uctQr4W+4QbuUjFpM0BOLv9VmHWozB
 8muIjVXlvTE7IEOF8yXSpouPzKjD/NTWvMVC5A792NCw5/RHDr+OAHV+wn0NwQi+
 Qjrc97a3H9uICjUK+NKfSQak6gI2oFewRYCOZOomfBT3BDBPku0v+JN8B3XLiQUS
 +bc3kiwZzTfgTYpgSkTG2X1frgG8YHaLM+GJCRQQxilzA4xIKC4Z2y++fq3hRkNL
 wRRyImnLunk15rG0COuvgqsocr7vKEPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wB0sPgFCLl0/DTwRV
 zLMcp3TZdlIK3ghzd1dBfvnWvs=; b=OnQqXtONoB5ji2+B34EpFsov5//b6LJoV
 4XnjjOfhNxjwu7hFCn2V5RwV3zts5NbyxYqhmG6u4gy3tekhrkLWPEU+zZEXrCoU
 2rkjX1OrCR/+49aOu1pG/De5Z1KiXFxE1LGiRo2UAdS5khZz6IskPibDGQIjAQiA
 3JkN44GhYehF1tluyb+/VarcAU98QvMzjKJA6h1g95oRY7rS8GsUHbxwSTouK5Hg
 mVkKbO3Sa7qqS2hiSCWOgomZUEHp6Kf/MC93ziK8j1kXV2rx9foh+PiLPqnvo1Mb
 yLCvCEpwOjwFPjsfS5On7u/bcS7RYCiMJimN37t10g/7ZpGwvc4xQ==
X-ME-Sender: <xms:f7ogYiszkn9jKYaqIjZLv71yNRwDisELtcCBYRCdfbVXbOSV7Rx_gw>
 <xme:f7ogYneH0mjcjM9O5iNBulIOK7EScMd6IrmcnGvNZdDK3sV3a-SYvT_Ua_AU4RUdo
 DAvAt1cnM__WgwZuzY>
X-ME-Received: <xmr:f7ogYtzvbNIcTI5tqd2DGvtq0jbT5DBuWsbj_sFKDPoQlFt8uJkiBWbCE_7FIn8cA2Pe5xHgr3gzBatWyFZSNpwQa2-6SJDNJ0x3W3E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtiedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:f7ogYtM0laOKXNlE9jE46tuX2qql93lhQ1W9BKdKFyoZmmlYHyNR0g>
 <xmx:f7ogYi_UxJwoTG3Yu5BYArkZef6ykEuqL6r8CyeGLZPmqTUz9OzLdQ>
 <xmx:f7ogYlUuq3QSqZvwGiWewhtAswHc1nwoVRl144h9pI5xG5yrwHf26Q>
 <xmx:gLogYmYY3zmSXAjvhrUT-4Dl0sVED7t4dQZbYXRRvDMR3CmHgnTyIw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Mar 2022 07:54:23 -0500 (EST)
Date: Thu, 3 Mar 2022 13:54:21 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 04/12] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Message-ID: <20220303125421.a5v63n27oskopxzc@houat>
References: <20220217002530.396563-1-marex@denx.de>
 <20220217002530.396563-5-marex@denx.de>
 <20220302100143.pvy77sw2sgd57tql@houat>
 <3d5f1c7d-3ee7-027b-47e8-6b5923657358@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sulq6pl4oweqp5dw"
Content-Disposition: inline
In-Reply-To: <3d5f1c7d-3ee7-027b-47e8-6b5923657358@denx.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sulq6pl4oweqp5dw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2022 at 04:17:04PM +0100, Marek Vasut wrote:
> On 3/2/22 11:01, Maxime Ripard wrote:
> > On Thu, Feb 17, 2022 at 01:25:22AM +0100, Marek Vasut wrote:
> > > The driver currently hard-codes DSI lane count to two, however the ch=
ip
> > > is capable of operating in 1..4 DSI lanes mode. Parse 'data-lanes' DT
> > > property and program the result into DSI_CTRL register.
> > >=20
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > Cc: Jagan Teki <jagan@amarulasolutions.com>
> > > Cc: Maxime Ripard <maxime@cerno.tech>
> > > Cc: Robert Foss <robert.foss@linaro.org>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > To: dri-devel@lists.freedesktop.org
> > > ---
> > > V2: Rebase on next-20220214
> > > ---
> > >   drivers/gpu/drm/bridge/chipone-icn6211.c | 21 ++++++++++++++++++++-
> > >   1 file changed, 20 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/d=
rm/bridge/chipone-icn6211.c
> > > index 2ac8eb7e25f52..7c013a08c7b00 100644
> > > --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> > > +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> > > @@ -136,10 +136,12 @@ struct chipone {
> > >   	struct drm_bridge bridge;
> > >   	struct drm_display_mode mode;
> > >   	struct drm_bridge *panel_bridge;
> > > +	struct device_node *host_node;
> > >   	struct gpio_desc *enable_gpio;
> > >   	struct regulator *vdd1;
> > >   	struct regulator *vdd2;
> > >   	struct regulator *vdd3;
> > > +	int dsi_lanes;
> > >   };
> > >   static inline struct chipone *bridge_to_chipone(struct drm_bridge *=
bridge)
> > > @@ -212,6 +214,11 @@ static void chipone_atomic_enable(struct drm_bri=
dge *bridge,
> > >   	/* dsi specific sequence */
> > >   	ICN6211_DSI(icn, SYNC_EVENT_DLY, 0x80);
> > >   	ICN6211_DSI(icn, HFP_MIN, hfp & 0xff);
> > > +
> > > +	/* DSI data lane count */
> > > +	ICN6211_DSI(icn, DSI_CTRL,
> > > +		    DSI_CTRL_UNKNOWN | DSI_CTRL_DSI_LANES(icn->dsi_lanes - 1));
> > > +
> > >   	ICN6211_DSI(icn, MIPI_PD_CK_LANE, 0xa0);
> > >   	ICN6211_DSI(icn, PLL_CTRL(12), 0xff);
> > > @@ -314,6 +321,7 @@ static const struct drm_bridge_funcs chipone_brid=
ge_funcs =3D {
> > >   static int chipone_parse_dt(struct chipone *icn)
> > >   {
> > >   	struct device *dev =3D icn->dev;
> > > +	struct device_node *endpoint;
> > >   	struct drm_panel *panel;
> > >   	int ret;
> > > @@ -350,6 +358,16 @@ static int chipone_parse_dt(struct chipone *icn)
> > >   		return PTR_ERR(icn->enable_gpio);
> > >   	}
> > > +	endpoint =3D of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> > > +	icn->dsi_lanes =3D of_property_count_u32_elems(endpoint, "data-lane=
s");
> >=20
> > The binding must be amended to allow for the usage of data-lanes, and
> > you need to keep the previous value as default for older device trees
>=20
> Regarding the default value -- there are no in-tree users of this driver =
yet
> (per git grep in current linux-next), do we really care about backward
> compatibility in this case?

If it hasn't been in a stable release yet, no. If it did, yes

Maxime

--sulq6pl4oweqp5dw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYiC6fQAKCRDj7w1vZxhR
xU05AQD21Kv9L49cpX9fxX8z89DSAphpOg465WgxqjifrhzxngD+O+PSuS5xdxHb
osrjwXaWIlxJuhp9a5XdHSoitCjTugk=
=XShI
-----END PGP SIGNATURE-----

--sulq6pl4oweqp5dw--
