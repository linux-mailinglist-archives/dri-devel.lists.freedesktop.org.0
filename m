Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6DC4BD869
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 10:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2210E112673;
	Mon, 21 Feb 2022 09:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74672112617
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 09:01:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id D1BE65C00EA;
 Mon, 21 Feb 2022 04:01:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 21 Feb 2022 04:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=x1Rcsmj9LyLNJUhFrXuixiSk5AwGbbizg81PYW
 2Mf3I=; b=OVxiMh/TLeDz9dHTNiBQ152r+zIZgHtqIF0tRhX/SPg8zdg0BzgRfs
 gBWTpG5UrYO7cpDi5SyJ5re+R+mSh2mpe6WkwrcMWYQ93ICor+n18DTjnLKkU/7u
 4OcdXfKhcZjvpilk3E1alaEdQ0tLFLHInGGA/O2Ql8CmJc/3h99DE7CUnWPs6E7J
 ixCcCjera8HcEt7kUjsGvG/G2x+8syAgf+t1YAkia7Dnk5iYue/N8mN9QpHz9cIi
 tKRQywElC68vD6Y7vnjelaOh82beoEX4x4EfvCY57IICavZ45a9bH9FNBOgSk72N
 BdsHQyUXAwYW+wnsZ3J4kOS6H/uwKvAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=x1Rcsmj9LyLNJUhFr
 XuixiSk5AwGbbizg81PYW2Mf3I=; b=lmG31WCl6MqymkdHB4AP5SwlST1SUPV9z
 IIhwGmxFq4rdcurOHp7Q1THF3ZiuPbMVFb/XOg1KVeOLppI/Uo9jaT86xy1vy6gQ
 BrB6nb68OQXTdCXzKiH99NFhoJKQBm6R7WQUPVKYJO9Qa4rb8LQJWqk39Gm/YMuy
 SVvjTpFZt1GM2FIVBPTEFqJ2PJptj2eCNoQo19GbpVhFsvpRhwpkvPFCXbNcMZTy
 UFKBxt/IiH1FSw8ZWjTxPbN5I8ZEITTxRATymty7v5wlEHNdpLnoPZ6G6HxMCN2z
 YesLKa1h7eW0vBNQ+QQ6M0NKXMS6y/bjDSbErtkASjYT54hseeIoQ==
X-ME-Sender: <xms:2FQTYvXUhrEjrLaza3bykYOprkdCb750DxxCvVxt3DzRfpSMYXW6tw>
 <xme:2FQTYnnmjsmAITT10Tc7xqPJnPuoJWI1aXuOZJp-4a7ZRgwQRTxBziMMMfRjZ3cBU
 V9TJQwB7XYsDHrZsvQ>
X-ME-Received: <xmr:2FQTYrYv1ZFo6YDLgZYcFSovqK5WSh2mo9EGKEI3sPd8rnlqzBHb_ZmGj9h89vL9GFTulXQq4rwR0Gpco1w6rwd46DZjuMmqcUwcB6c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeehgdduvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2VQTYqVATrWb2KcK8vFRHEyUAYiQ_NkUo-TbZw4S0-4vFae30fM6lg>
 <xmx:2VQTYpmIxWrBA-VnsZNo1OMXsstJFpA_RKQ9Zu6NyGMKsNvOHAExYA>
 <xmx:2VQTYnc7xwq9s-WJ9aZ6mvrhfLvY_9DeV0fHeQWV3Dw4Y-Wj_8aa-A>
 <xmx:2VQTYsvgL35_awWeIXZHpScpce78e32dW2oe0JZeHOBFekAZCao7GQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:01:12 -0500 (EST)
Date: Mon, 21 Feb 2022 10:01:11 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V2 04/11] drm/bridge: tc358767: Implement atomic_check
 callback
Message-ID: <20220221090111.qk5nweyaeg7ptfuo@houat>
References: <20220218010054.315026-1-marex@denx.de>
 <20220218010054.315026-5-marex@denx.de>
 <e35ea5ca8d0103ffb7eb7d0e92ec7508829a588a.camel@pengutronix.de>
 <d66055cd-6fab-ec32-8315-47dcc9a679b4@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pcfn6q4uewghy27b"
Content-Disposition: inline
In-Reply-To: <d66055cd-6fab-ec32-8315-47dcc9a679b4@denx.de>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pcfn6q4uewghy27b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 19, 2022 at 03:26:40AM +0100, Marek Vasut wrote:
> On 2/18/22 18:34, Lucas Stach wrote:
>=20
> Hi
>=20
> [...]
>=20
> > >   drivers/gpu/drm/bridge/tc358767.c | 26 ++++++++++++++++++++++++++
> > >   1 file changed, 26 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/brid=
ge/tc358767.c
> > > index 522c2c4d8514f..01d11adee6c74 100644
> > > --- a/drivers/gpu/drm/bridge/tc358767.c
> > > +++ b/drivers/gpu/drm/bridge/tc358767.c
> > > @@ -1289,6 +1289,31 @@ static bool tc_bridge_mode_fixup(struct drm_br=
idge *bridge,
> > >   	return true;
> > >   }
> > > +static int tc_edp_common_atomic_check(struct drm_bridge *bridge,
> >=20
> > Drop the edp in the name here? Later in the series you call this
> > function from the DPI code, so this breaks the nice clean naming
> > separation from patch 1.
> >=20
> > > +				      struct drm_bridge_state *bridge_state,
> > > +				      struct drm_crtc_state *crtc_state,
> > > +				      struct drm_connector_state *conn_state,
> > > +				      const unsigned int max_khz)
> > > +{
> > > +	tc_bridge_mode_fixup(bridge, &crtc_state->mode,
> > > +			     &crtc_state->adjusted_mode);
> > > +
> > > +	if (crtc_state->adjusted_mode.clock > max_khz)
> > > +		crtc_state->adjusted_mode.clock =3D max_khz;
> >=20
> > I don't think this is correct. The adjusted most is just for minor
> > adjustments if the bridge can not fully match the mode. If userspace
> > supplies a invalid high modeclock I think it would be better to fail
> > the atomic check -> return -EINVAL
>=20
> Maxime was telling me that returning -EINVAL from atomic_check is weird, =
so
> maybe we should also wait for his opinion on this part.

That was in a completely different context?

Our discussion was about how you would propagate clock constraints
across a pipeline, and I was telling you that it would be weird to
return -EINVAL for a mode that was reported on a connector as supported
(or even preferred).

My argument was for mode_valid to filter them out.

If your clock is way above what you can support on your device, then
returning an error in atomic_check is the right thing to do.

Maxime

--pcfn6q4uewghy27b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhNU1wAKCRDj7w1vZxhR
xRSTAQCueOq9VOETWEpjhacXG07w41I4jtm35tKRYD1l3bNN+gD6AtTP79x5YH4e
TCbzuy7WzkQhyZJ1SAL5Vi1tf9TZfQg=
=MtWJ
-----END PGP SIGNATURE-----

--pcfn6q4uewghy27b--
