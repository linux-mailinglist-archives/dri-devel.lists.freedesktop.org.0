Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F982B9C0B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 21:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE986E821;
	Thu, 19 Nov 2020 20:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860BA6E52E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 14:08:45 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id E05F25801E4;
 Thu, 19 Nov 2020 09:08:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 19 Nov 2020 09:08:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=zOUiA4xdq0VKjVdgG7aByqaE2HT
 oPPZ3NqwgiaFPGP8=; b=RhfSlTOb247KDrSD/8GGRcwuuMgRvDfxPDnecSmqjz9
 HPhRSBCiM0mjpdXHTCrl9RQq9C3xXR9Od/RkU8xZW9E3Yyohg4jlIHQRJQoaOfBC
 qcZJyU4+2RzQMT46EBaxlKubc8RQjag09lpypMQZiNxIxYQmQmi6h7KF7OACd9uI
 dK2qNCEjn/nWAfXuP0A1Gy2koR8pYrCUuPW6zw4JNX0G8eI2sz5nXAw/z4axfFh0
 4bFZbTQbz1XrgBYsDP12pw7ud7VnoPCH20IKUXX4C4IhhglF9NwJEMGdt0MqeVRK
 PC73eNMxE+yY7+iW45EfLWWF7L5y5aL+S2n4YiS+rAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zOUiA4
 xdq0VKjVdgG7aByqaE2HToPPZ3NqwgiaFPGP8=; b=buZp8DRiWuI8T9bmN4oXWS
 4uZ1jzxrLRFCNvJ4x8SENyOF/zUIQVviCGIL/n4E/5hHXU5OiISD0Z6L8tPAg3il
 X8+XsADk7qlMuw3xOQZ0uVF9UZ8VSBBmkzCrVDROOTQKk3YG26hCrR5EUqJ2y60B
 txUemn1XAM33mgZQeivKhoIxDOGdvH3R3meYF67FcK8aecAFk5O5yORCWEFZBvTo
 zFDUYiU74S9z/+JPdPfZUqRu4Rc0TlUfSNmfDnsm4yo7VcO0UpEY+QtIZEHdvEnA
 2x74LdddL5VAxnfxa4AtWtsfmH12YNH34MInay3ieuhKkZYIKN8vU3q+JSKfIR7A
 ==
X-ME-Sender: <xms:any2XzarbbPmIFEFfnF6pljvLY0W8qk2MTp_JZpOamf0QTwGaccNag>
 <xme:any2XyaGQt8_fJyfkBG306PoAXus4XrGr9xavr0v7YdrK9NWrWtRkPEoJ2Ib-Bcn1
 xlDYVwtT2ePzm7vuV0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefjedgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:any2X1-aQWrkF3LNjwUs840yMyxMvB6SDfPryukEpTd7x8EHMV8Sqg>
 <xmx:any2X5qAFyUzIH4c0j1Ard9t_U46_ardNTF7ig70-3tbTmZPqlvzNg>
 <xmx:any2X-rhxz65F2Op1eoRZe_cjal7pAFUo6YYVfUfsvSaPPodkhqWAQ>
 <xmx:bHy2X5DZMw4fgWp5oLKE5ezYMmp0gch1cn2tmIsRXKkb9JevyFjkcA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 41B8F3064AA7;
 Thu, 19 Nov 2020 09:08:42 -0500 (EST)
Date: Thu, 19 Nov 2020 15:08:40 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 6/7] drm/vc4: kms: Store the unassigned channel list
 in the state
Message-ID: <20201119140840.ufwhjzf26wsheltv@gilmour.lan>
References: <20201105135656.383350-1-maxime@cerno.tech>
 <20201105135656.383350-7-maxime@cerno.tech>
 <c733bc70-8535-e4b9-1db6-a7b51e2781a7@suse.de>
MIME-Version: 1.0
In-Reply-To: <c733bc70-8535-e4b9-1db6-a7b51e2781a7@suse.de>
X-Mailman-Approved-At: Thu, 19 Nov 2020 20:32:07 +0000
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
Content-Type: multipart/mixed; boundary="===============0587654762=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0587654762==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hkqcej6pdzntbht2"
Content-Disposition: inline


--hkqcej6pdzntbht2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

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
>=20
> If you want to be pedantic, maybe split the creation of the new state from
> the usage. Call vc4_hvs_get_global_state() at the top of vc4_atomic_check=
()
> to make the new state. (Maybe with a short comment.) And here only call an
> equivalent of drm_atomic_get_new_private_obj_state() for hvs_channels.
>=20
> In any case
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

That works for me, I'll change it.

Thanks!
Maxime

--hkqcej6pdzntbht2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7Z8aAAKCRDj7w1vZxhR
xffcAPwO6cO3aKXIG8qyv85EVxyJsOHp5JSOhW732HpLEe8WJwD9GH+64ZVyKTti
vviwthEMPWUMheB/IG8CFJVLJf2o3Qo=
=XDsE
-----END PGP SIGNATURE-----

--hkqcej6pdzntbht2--

--===============0587654762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0587654762==--
