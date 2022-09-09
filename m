Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F2A5B3AC7
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 16:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0B210E055;
	Fri,  9 Sep 2022 14:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CA610E055
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 14:36:49 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2D5F1320015C;
 Fri,  9 Sep 2022 10:36:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 09 Sep 2022 10:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1662734206; x=1662820606; bh=ZAILMf57Td
 TF5SyFPS7VoKfWUrJT+3dA7d1TK95eXm0=; b=25BTaWm9zFJKOvJWsZypng+v/L
 19gRfaujyZIoyF0LxkdmQXA/Jc5Q/UvkaZhU3J5+jCHj0kuejBraWjnwK4kHS5T8
 ZXeE+BsfXYKXYmKIW0vjkn/bewXmwxPfX7InF0+1vhatDBnYBLHE0T3TNbjLZ0OL
 VPpv053xNiiqKgcFq5/IyUsZWDiwzIJE9/Qyh5Ie5bzwfPQSCqSLy1NSg1ZdVMb6
 4KAAdJUWBDo1ELwhi+Fns9CFBh4GjF16B3Z2Ra2a0vGYniyRqaAncQrEV6gJSNyl
 6BuyOqfGpqitMhecfceVx79NPTFFm3FsCAIMsifqoH9JvD+Bya505SMZY6YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1662734206; x=1662820606; bh=ZAILMf57TdTF5SyFPS7VoKfWUrJT
 +3dA7d1TK95eXm0=; b=t+0TzJMMThlnP53IdlPEaCdvQ7BuyOVczpMl5R1D+1AZ
 O6OdeGFN9fVbPN+SWLIdniCFFSdHX9M4Pbau9imPFzJpir0Sw6zEWMIkSqOoHFVC
 eYKZnnYfZ7IN1gWSXJuGwSgW6ibwW1b0mLrGLlcX6HC+ZzkwPMfS9AwfB7ePSYVN
 Yc6kwlWHkplgZC480mtMI6V4m0M4Ha3j4fJE+7zxwRCkpYjFvrW2mgvfYjMHfzti
 dpocmcvj1qBMsiPWBpEVIOOFPQ0Noc4FoXzd8gSY8dbyv+eqwOB61obM34ItN1/T
 ZyJJdRuQerprFJt7soryAmVcdgBS5qA5nl8YXqzwEA==
X-ME-Sender: <xms:fk8bYxNkhY9uts3tm2QpgulfIhY8Ri-YwBJFOch96bCpjGQuTaRCMQ>
 <xme:fk8bYz_KLvfk04sSEKpKbD06jGZXGXhgnlN64ODzwlrILHFzw9s1y1r3lIhewT1Wt
 Ggp1Z1I9T-2Qsi5zJE>
X-ME-Received: <xmr:fk8bYwQPFVRWyQnVd27OWNKqs0JR-FFO3vLIXC_Uki55BsjoxPEe3w3jra9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedthedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fk8bY9toCE1Kn_BsgNyA6IoUp4XanOK6bIf5taNzMvMKXD_Jr55ePQ>
 <xmx:fk8bY5cr8Sq5jPFvarQlBVtgiOPQyQnM2QaF1aFifUVzvlsyou_zvA>
 <xmx:fk8bY53V85cKTO0LHQxO766FIk1B2DoX2IQTWrLJevqzmcV0zuwP4A>
 <xmx:fk8bY4zA9QiSlikO-P-nJCvvyEqtBvYg1tjD8US3lpJ8WWZjBYOrWQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 10:36:45 -0400 (EDT)
Date: Fri, 9 Sep 2022 16:36:44 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 4/8] drm/vc4: hdmi: Simplify the hotplug handling
Message-ID: <20220909143644.izsfwanwn7xq5hvi@houat>
References: <20220829134731.213478-1-maxime@cerno.tech>
 <20220829134731.213478-5-maxime@cerno.tech>
 <YxY0A8RQsGZkwrtU@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h2bfpwikhbontasj"
Content-Disposition: inline
In-Reply-To: <YxY0A8RQsGZkwrtU@intel.com>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--h2bfpwikhbontasj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ville

Thanks for your review

On Mon, Sep 05, 2022 at 08:38:11PM +0300, Ville Syrj=E4l=E4 wrote:
> On Mon, Aug 29, 2022 at 03:47:27PM +0200, Maxime Ripard wrote:
> > Our detect callback has a bunch of operations to perform depending on
> > the current and last status of the connector, such a setting the CEC
> > physical address or enabling the scrambling again.
> >=20
> > This is currently dealt with a bunch of if / else statetements that make
> > it fairly difficult to read and extend.
> >=20
> > Let's move all that logic to a function of its own.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 66 ++++++++++++++++++++++------------
> >  1 file changed, 44 insertions(+), 22 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> > index b786645eaeb7..9fad57ebdd11 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -273,17 +273,53 @@ static void vc4_hdmi_cec_update_clk_div(struct vc=
4_hdmi *vc4_hdmi) {}
> > =20
> >  static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder);
> > =20
> > +static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
> > +				    enum drm_connector_status status)
> > +{
> > +	struct drm_connector *connector =3D &vc4_hdmi->connector;
> > +	struct edid *edid;
> > +
> > +	/*
> > +	 * NOTE: This function should really be called with
> > +	 * vc4_hdmi->mutex held, but doing so results in reentrancy
> > +	 * issues since cec_s_phys_addr_from_edid might call
> > +	 * .adap_enable, which leads to that funtion being called with
> > +	 * our mutex held.
> > +	 *
> > +	 * Concurrency isn't an issue at the moment since we don't share
> > +	 * any state with any of the other frameworks so we can ignore
> > +	 * the lock for now.
> > +	 */
> > +
> > +	if (status =3D=3D connector->status)
> > +		return;
>=20
> This looks to have a change in behaviour to not call
> vc4_hdmi_enable_scrambling() unless a change in the
> connector status was detected. The previous code called
> it regarless.

Yeah, good point

> When I was doing the i915 stuff I did have a sink that
> left hpd asserted while turned off, and when powering
> back up it instead generated a pulse on the hpd line.
> Not sure if such a pulse is always slow enough that
> you can reasonably guarantee a detection of both edges...
>=20
> Apart from that (and the cec locking mess that I dared
> not even look at) the rest of the series looks OK to me.

Can I add your R-B and remove the check you mentioned above while
applying, or would you prefer that I send a new version?

Thanks!
Maxime

--h2bfpwikhbontasj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxtPfAAKCRDj7w1vZxhR
xZj9AP4nplELrSJUSZifSdWuQxOArQVc45QEpPe+4TpVFHcaOwEA07gc6nJ6PZOD
YyLbOxM+nSwMeMaOwFWbLspgSecmsAY=
=4q8W
-----END PGP SIGNATURE-----

--h2bfpwikhbontasj--
