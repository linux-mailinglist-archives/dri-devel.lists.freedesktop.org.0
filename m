Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6975F2BBEB8
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 12:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE32B6E99B;
	Sat, 21 Nov 2020 11:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26B66E8B6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 14:02:37 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 40B1D580128;
 Fri, 20 Nov 2020 09:02:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 20 Nov 2020 09:02:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=3PJSWe94axMKGpde3F+ATFXZ3E7
 YjJoiE0buN+xUtmw=; b=HeImxUBVZ5PUTmaNRaSDUGUg/yckzq+8uIfrXxZwJ50
 EUXf6OGRofMrhNGoQJrRfgJbgyktxNAUGqH9fWXid9n3J6HhveBmX3lOfNY3TQdx
 owQQJ18dnF5fpcsKYN4AESMIRWKGJXYZUmlr1CfL5pTJzmKjSgWeHxfwfcKO5wDm
 QmQ2ZCcrcNufxkf06piynm7q5MvoXpQHpFnZAJ1TYRm9MFZf8gzMOPBlspzm9tGT
 mqXArWjtw3W5VB/ZIIovIjr2Jm8yiB5/Au186KKsq2vxSck/X1c4XqO3flZOlQIX
 KlBbk5FfQAsX1IxMot6SsPKVVht3bQvuHfhrzw5uVMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3PJSWe
 94axMKGpde3F+ATFXZ3E7YjJoiE0buN+xUtmw=; b=hhbO+K/aGMxUAuuaCt+O95
 YBHAxzNtScurbiFrYWZdLZ91I1+PjwDVjnaFATBRuKZ0eOgiv3jKOLup0iUr10hT
 DAmR0O0t/n9E8YGfS9IWGDuMAoswvXDxMORt9JpRFWBI2F0PFuWj8ToKSoNSLrrv
 a/UL9dCWY1D9hEfSNzzOvtpTzBngyQeo7Kso2tGS3+yrH8FlGwkBdJTbk9tmzUS0
 ccMBVnJHITdRUctLgKxEwCefExXugufuQDEZ6CQf6hkRbcUBGhVSU9z0EBBzFZfp
 e5jAWWeklB/hvOvBMcvp0npKODoY5V6naDkBit0brLTdh+hEBd5TTw0UCo5Vk/6w
 ==
X-ME-Sender: <xms:esy3X9gpvPq5Zu52kVTlzemPWMGnycirq1b0qATF41C4A8IdOy-PYg>
 <xme:esy3XyD9y_r1gIRpdsUnb-SqnLAtfttmTWaYTx_IcBWUMTghsdXJnk6B60FXXkp-w
 d1pa8uv9RsFR3-UmQE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegtddgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:esy3X9HeJR-JALPw9b6ne03GB616EQR57g-ai97fDs1aHG9NwKit8A>
 <xmx:esy3XyQR3zTgVACKMDY0_g9AbzQI0EeMWyE0N6Co_bq-aOk8oJkDGg>
 <xmx:esy3X6xo1C0pHr9OpaltEHig40lmvuVTHhYGeElahd8lfD6zXCDBow>
 <xmx:fcy3X_LGaHuq0Ktfuq2FceyCVZ_qJ8IuMndz6WJfQxTp08gs1yPIKg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 18F82328006A;
 Fri, 20 Nov 2020 09:02:34 -0500 (EST)
Date: Fri, 20 Nov 2020 15:02:32 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 6/7] drm/vc4: kms: Store the unassigned channel list
 in the state
Message-ID: <20201120140232.gd7a5v3bdymo6fbp@gilmour>
References: <20201105135656.383350-1-maxime@cerno.tech>
 <20201105135656.383350-7-maxime@cerno.tech>
 <c733bc70-8535-e4b9-1db6-a7b51e2781a7@suse.de>
MIME-Version: 1.0
In-Reply-To: <c733bc70-8535-e4b9-1db6-a7b51e2781a7@suse.de>
X-Mailman-Approved-At: Sat, 21 Nov 2020 11:34:30 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0020181925=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0020181925==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e32t2d7ca57hrzyz"
Content-Disposition: inline


--e32t2d7ca57hrzyz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Thu, Nov 19, 2020 at 09:59:15AM +0100, Thomas Zimmermann wrote:
> Am 05.11.20 um 14:56 schrieb Maxime Ripard:
> > If a CRTC is enabled but not active, and that we're then doing a page
> > flip on another CRTC, drm_atomic_get_crtc_state will bring the first
> > CRTC state into the global state, and will make us wait for its vblank
> > as well, even though that might never occur.
> >=20
> > Instead of creating the list of the free channels each time atomic_check
> > is called, and calling drm_atomic_get_crtc_state to retrieve the
> > allocated channels, let's create a private state object in the main
> > atomic state, and use it to store the available channels.
> >=20
> > Since vc4 has a semaphore (with a value of 1, so a lock) in its commit
> > implementation to serialize all the commits, even the nonblocking ones,=
 we
> > are free from the use-after-free race if two subsequent commits are not=
 ran
> > in their submission order.
> >=20
> > Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatic=
ally")
> > Reviewed-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> > Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >   drivers/gpu/drm/vc4/vc4_drv.h |   1 +
> >   drivers/gpu/drm/vc4/vc4_kms.c | 124 +++++++++++++++++++++++++++-------
> >   2 files changed, 100 insertions(+), 25 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_dr=
v.h
> > index bdbb9540d47d..014113823647 100644
> > --- a/drivers/gpu/drm/vc4/vc4_drv.h
> > +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> > @@ -219,6 +219,7 @@ struct vc4_dev {
> >   	struct drm_modeset_lock ctm_state_lock;
> >   	struct drm_private_obj ctm_manager;
> > +	struct drm_private_obj hvs_channels;
> >   	struct drm_private_obj load_tracker;
> >   	/* List of vc4_debugfs_info_entry for adding to debugfs once
> > diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_km=
s.c
> > index 499c6914fce4..0a231ae500e5 100644
> > --- a/drivers/gpu/drm/vc4/vc4_kms.c
> > +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> > @@ -37,6 +37,17 @@ static struct vc4_ctm_state *to_vc4_ctm_state(struct=
 drm_private_state *priv)
> >   	return container_of(priv, struct vc4_ctm_state, base);
> >   }
> > +struct vc4_hvs_state {
> > +	struct drm_private_state base;
> > +	unsigned int unassigned_channels;
> > +};
> > +
> > +static struct vc4_hvs_state *
> > +to_vc4_hvs_state(struct drm_private_state *priv)
> > +{
> > +	return container_of(priv, struct vc4_hvs_state, base);
> > +}
> > +
> >   struct vc4_load_tracker_state {
> >   	struct drm_private_state base;
> >   	u64 hvs_load;
> > @@ -662,6 +673,70 @@ static int vc4_load_tracker_obj_init(struct vc4_de=
v *vc4)
> >   	return drmm_add_action_or_reset(&vc4->base, vc4_load_tracker_obj_fin=
i, NULL);
> >   }
> > +static struct drm_private_state *
> > +vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
> > +{
> > +	struct vc4_hvs_state *state;
> > +
> > +	state =3D kmemdup(obj->state, sizeof(*state), GFP_KERNEL);
> > +	if (!state)
> > +		return NULL;
> > +
> > +	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
> > +
> > +	return &state->base;
> > +}
> > +
> > +static void vc4_hvs_channels_destroy_state(struct drm_private_obj *obj,
> > +					   struct drm_private_state *state)
> > +{
> > +	struct vc4_hvs_state *hvs_state;
> > +
> > +	hvs_state =3D to_vc4_hvs_state(state);
> > +	kfree(hvs_state);
> > +}
> > +
> > +static const struct drm_private_state_funcs vc4_hvs_state_funcs =3D {
> > +	.atomic_duplicate_state =3D vc4_hvs_channels_duplicate_state,
> > +	.atomic_destroy_state =3D vc4_hvs_channels_destroy_state,
> > +};
> > +
> > +static void vc4_hvs_channels_obj_fini(struct drm_device *dev, void *un=
used)
> > +{
> > +	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
> > +
> > +	drm_atomic_private_obj_fini(&vc4->hvs_channels);
> > +}
> > +
> > +static int vc4_hvs_channels_obj_init(struct vc4_dev *vc4)
> > +{
> > +	struct vc4_hvs_state *state;
> > +
> > +	state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> > +	if (!state)
> > +		return -ENOMEM;
> > +
> > +	state->unassigned_channels =3D GENMASK(HVS_NUM_CHANNELS - 1, 0);
> > +	drm_atomic_private_obj_init(&vc4->base, &vc4->hvs_channels,
> > +				    &state->base,
> > +				    &vc4_hvs_state_funcs);
> > +
> > +	return drmm_add_action_or_reset(&vc4->base, vc4_hvs_channels_obj_fini=
, NULL);
> > +}
> > +
> > +static struct vc4_hvs_state *
> > +vc4_hvs_get_global_state(struct drm_atomic_state *state)
> > +{
> > +	struct vc4_dev *vc4 =3D to_vc4_dev(state->dev);
> > +	struct drm_private_state *priv_state;
> > +
> > +	priv_state =3D drm_atomic_get_private_obj_state(state, &vc4->hvs_chan=
nels);
> > +	if (IS_ERR(priv_state))
> > +		return ERR_CAST(priv_state);
> > +
> > +	return to_vc4_hvs_state(priv_state);
> > +}
> > +
> >   /*
> >    * The BCM2711 HVS has up to 7 output connected to the pixelvalves and
> >    * the TXP (and therefore all the CRTCs found on that platform).
> > @@ -678,6 +753,14 @@ static int vc4_load_tracker_obj_init(struct vc4_de=
v *vc4)
> >    *   need to consider all the running CRTCs in the DRM device to assi=
gn
> >    *   a FIFO, not just the one in the state.
> >    *
> > + * - To fix the above, we can't use drm_atomic_get_crtc_state on all
> > + *   enabled CRTCs to pull their CRTC state into the global state, sin=
ce
> > + *   a page flip would start considering their vblank to complete. Sin=
ce
> > + *   we don't have a guarantee that they are actually active, that
> > + *   vblank might never happen, and shouldn't even be considered if we
> > + *   want to do a page flip on a single CRTC. That can be tested by
> > + *   doing a modetest -v first on HDMI1 and then on HDMI0.
> > + *
> >    * - Since we need the pixelvalve to be disabled and enabled back when
> >    *   the FIFO is changed, we should keep the FIFO assigned for as long
> >    *   as the CRTC is enabled, only considering it free again once that
> > @@ -687,46 +770,33 @@ static int vc4_load_tracker_obj_init(struct vc4_d=
ev *vc4)
> >   static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
> >   				      struct drm_atomic_state *state)
> >   {
> > -	unsigned long unassigned_channels =3D GENMASK(HVS_NUM_CHANNELS - 1, 0=
);
> > +	struct vc4_hvs_state *hvs_state;
> >   	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> >   	struct drm_crtc *crtc;
> >   	unsigned int i;
> > -	/*
> > -	 * Since the HVS FIFOs are shared across all the pixelvalves and
> > -	 * the TXP (and thus all the CRTCs), we need to pull the current
> > -	 * state of all the enabled CRTCs so that an update to a single
> > -	 * CRTC still keeps the previous FIFOs enabled and assigned to
> > -	 * the same CRTCs, instead of evaluating only the CRTC being
> > -	 * modified.
> > -	 */
> > -	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> > -		struct drm_crtc_state *crtc_state;
> > -
> > -		if (!crtc->state->enable)
> > -			continue;
> > -
> > -		crtc_state =3D drm_atomic_get_crtc_state(state, crtc);
> > -		if (IS_ERR(crtc_state))
> > -			return PTR_ERR(crtc_state);
> > -	}
> > +	hvs_state =3D vc4_hvs_get_global_state(state);
> > +	if (!hvs_state)
> > +		return -EINVAL;
>=20
> I found this confusing. It's technically correct, but from hvs_state is n=
ot
> clear that it's the new state. Maybe call it hvs_new_state.

Yeah, you're right, I'll change it

> If you want to be pedantic, maybe split the creation of the new state from
> the usage. Call vc4_hvs_get_global_state() at the top of vc4_atomic_check=
()
> to make the new state. (Maybe with a short comment.) And here only call an
> equivalent of drm_atomic_get_new_private_obj_state() for hvs_channels.

There's other private states in that driver, and the other states are
using the same construct here, I did so to remain consistent

> In any case
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks!
Maxime

--e32t2d7ca57hrzyz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7fMeAAKCRDj7w1vZxhR
xaksAP4z6Yr/nS9h5XkVmO6hbCo6Ql62QfXaQZGHm4JRqon4xgD+OfkkUxAgXfwZ
SQj8cDeUQ2HD6HBKyCGfdipdCXLkPwk=
=Z7hY
-----END PGP SIGNATURE-----

--e32t2d7ca57hrzyz--

--===============0020181925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0020181925==--
