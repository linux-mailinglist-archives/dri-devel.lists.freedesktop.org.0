Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAA42D2603
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B04A6E968;
	Tue,  8 Dec 2020 08:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86386E598
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 10:42:38 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id EDF26C85;
 Mon,  7 Dec 2020 05:42:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 07 Dec 2020 05:42:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=4Jwhw2Ic55x6RIMZNlBc3yosIWX
 o+ErXu4UtPYIfWFQ=; b=toAerI7+j78OPoYkKIEoNUVGn5IQz2SVmmmUGRIW6zp
 mxj4AA++dILUPK8q5kaGwJOPzJkLuky3MudzLzE9X/ccHE5IElxA/zfZmQj1QVLb
 0I/pCgjsg9XUccizopowW8N0ZT2pS6AZ7SI+EelyAQWow0PgrVl875kVmDrapEMN
 0TcJ9J7YJ7hW+uk6ne9bXjm4WrVg+1YVcRm8IG/wn1y/a8jn8+W1HIGGX/+cWNOU
 Ugkunbaj2tMRZKCna4Ve9dlfMlr8FR3pRsEGhNloI0HDZqc6bfHrUNuY52xJhrPb
 EHXtz9RyHiHlRsWGEoWnSu52l0IgG+RqCi/PTT+41eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4Jwhw2
 Ic55x6RIMZNlBc3yosIWXo+ErXu4UtPYIfWFQ=; b=duIvpOaMo2pUgTWKFcRLSP
 EQUYf28+4RgyZboq2sbWQBXRpT7bDvRwKYTyVoA54Bn79iTLbL8i1Xg1A0h334tY
 CnqEgOIgofqhxwrdvdfzFsFlehJij2wkSulxa4lQGKDYGmlLq4oLmx8x5HPefFUe
 NbnNLSWz8/catzV3Z3uatCQn7b7f//OqbEIA4nv+e9oVxZY9+VfBuYPbReCmRXcx
 /lNxuqo/OF5rI23CU+VXNJC9pos98pIvL2DmYr/Fu1aA6keTCc6B3AwTvtopXdpP
 OA4v1m198i/yqtQXn3it8s/4wlZOQTsBIKUvkNx1oSbyr2KnYLMHQPrQVfhcbc2g
 ==
X-ME-Sender: <xms:GQfOX4N7upqicD_OmawZyJAMhN1bgm53Rccc_Hty52JjL6mDzFDeIA>
 <xme:GQfOX-9kGCu1QjPeJlI9nfWRn1eIwyUPEXjtM77wPfkHUzCTaubl6Ga9YOoVvxsyl
 RuGp1jOpYact8Z1YIU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejgedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:GQfOX_QLxokXfRd_K7gNkXjramwIl8ftBkpGCTZcF5VEceZwbi0VIw>
 <xmx:GQfOXwu743nieHiI2mxuqC6opkLXzJqMaGbVOjZ2lxkoAJeTMTDX_A>
 <xmx:GQfOXwdKarRCALzNtG4DjtBN1jAL9Y7DIxafX7WJa-B73Pvuw0ke-Q>
 <xmx:GgfOX-sIsXD8FUGYDB_2z8EmJYxN4aTUXHge2-ewdreRZF3isCSsDA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D53A51080057;
 Mon,  7 Dec 2020 05:42:32 -0500 (EST)
Date: Mon, 7 Dec 2020 11:42:31 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v7 2/3] drm: Add support for the LogiCVC display controller
Message-ID: <20201207104231.ipa5dccnxxro3xxc@gilmour>
References: <20201102155308.142691-1-paul.kocialkowski@bootlin.com>
 <20201102155308.142691-3-paul.kocialkowski@bootlin.com>
 <20201103094659.56sdcerwwzqu2gdy@gilmour.lan>
 <X8e7kBx/OYpN2HqB@aptenodytes>
MIME-Version: 1.0
In-Reply-To: <X8e7kBx/OYpN2HqB@aptenodytes>
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: multipart/mixed; boundary="===============2134331034=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2134331034==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4dept5ksr44ncocz"
Content-Disposition: inline


--4dept5ksr44ncocz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 02, 2020 at 05:06:40PM +0100, Paul Kocialkowski wrote:
> > > +static void logicvc_crtc_atomic_begin(struct drm_crtc *drm_crtc,
> > > +				      struct drm_atomic_state *state)
> > > +{
> > > +	struct logicvc_crtc *crtc =3D logicvc_crtc(drm_crtc);
> > > +	struct drm_crtc_state *crtc_state =3D
> > > +		drm_atomic_get_old_crtc_state(state, drm_crtc);
> > > +	struct drm_device *drm_dev =3D drm_crtc->dev;
> > > +	unsigned long flags;
> > > +
> > > +	/* Register pending event, only if vblank is already on. */
> > > +	if (drm_crtc->state->event && crtc_state->active) {
> > > +		spin_lock_irqsave(&drm_dev->event_lock, flags);
> > > +		WARN_ON(drm_crtc_vblank_get(drm_crtc) !=3D 0);
> > > +
> > > +		crtc->event =3D drm_crtc->state->event;
> > > +		drm_crtc->state->event =3D NULL;
> > > +
> > > +		spin_unlock_irqrestore(&drm_dev->event_lock, flags);
> > > +	}
> > > +}
> >=20
> > That's unusual to do it in atomic_begin, why do you need it?
>=20
> This is to cover the case where we need to send a page flip event but the
> crtc is already on. In that case, neither atomic_enable nor atomic_disable
> will be called so we need to rely on atomic_begin to grab that event.
> This happens for example when a single plane is updated.
>=20
> The same thing is done in e.g. sun4i-drm.

Yeah, but I'm not sure why that's needed in the first place on sun4i-drm
either. This looks to me as either something that should be handled by
the helpers, or isn't needed at all. Just like the other times you
fiddle with the vblank in your driver.

I looked around and the only drivers that have that logic seem to be ARM
HDLCD, Atmel HCLDC, Meson, Tegra. This looks like it might be some cargo
cult.

Daniel, do you know why that would be needed?

> > > +static void logicvc_version_print(struct logicvc_drm *logicvc)
> > > +{
> > > +	u32 version;
> > > +
> > > +	regmap_read(logicvc->regmap, LOGICVC_IP_VERSION_REG, &version);
> > > +
> > > +	DRM_INFO("LogiCVC version %d.%02d.%c\n",
> > > +		 (int)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_MAJOR, version),
> > > +		 (int)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_MINOR, version),
> > > +		 (char)LOGICVC_FIELD_GET(LOGICVC_IP_VERSION_LEVEL, version) +
> > > +		 'a');
> >=20
> > DRM_DEV_INFO?
>=20
> Okay but now according to Sam, "DRM_DEV_ERROR() and friends are deprecate=
d"
> so I wonder which is the right one to use at this point.

AFAIU, it's drm_info / drm_err

> > > +static void logicvc_encoder_enable(struct drm_encoder *drm_encoder)
> > > +{
> > > +	struct logicvc_drm *logicvc =3D logicvc_drm(drm_encoder->dev);
> > > +	struct logicvc_interface *interface =3D
> > > +		logicvc_interface_from_drm_encoder(drm_encoder);
> > > +
> > > +	regmap_update_bits(logicvc->regmap, LOGICVC_POWER_CTRL_REG,
> > > +			   LOGICVC_POWER_CTRL_VIDEO_ENABLE,
> > > +			   LOGICVC_POWER_CTRL_VIDEO_ENABLE);
> > > +
> > > +	if (interface->drm_panel) {
> > > +		drm_panel_prepare(interface->drm_panel);
> > > +
> > > +		/* Encoder enable is too early to enable the panel and a white
> > > +		 * screen will be seen if the panel gets enabled before the
> > > +		 * first page flip is done (and no other framebuffer
> > > +		 * configuration remains from the boot software). */
> > > +		interface->drm_panel_enabled =3D false;
> > > +	}
> > > +}
> >=20
> > That's fishy (and the similar stuff in commit_tail). Is it because you
> > need to have the CRTC powered before the encoder?
> >=20
> > If so, you should try the commit_tail_rpm variant, it makes sure the
> > CRTC is powered on before making a commit.
>=20
> No, this is unrelated to CRTC vs encoder enable order. Instead, it's about
> panel enable order: I don't want to enable the panel before a buffer was
> flipped on the CRTC otherwise a blank/white/garbage screen will be shown.

Well, since the encoder will enable the panel, it's kind of related
though?

> This is why this drm_panel_enabled variable is used to make sure we don't
> enable the panel before.
>=20
> This is nothing specific to my hardware, but a general concern that proba=
bly
> exists in every DRM driver. Nobody really seems to care about it but I've
> decided that I would in this driver. Now if you think this is too exotic,
> I don't mind removing it.

If this is a concern of yours and affects multiple drivers, then it
should be fixed in the core, not in one particular driver.

> > > +static void logicvc_connector_destroy(struct drm_connector *drm_conn=
ector)
> > > +{
> > > +	drm_connector_cleanup(drm_connector);
> > > +}
> >=20
> > I guess you don't need that intermediate function?
>=20
> I would need to check if that call is necessary or if some implied mechan=
ism
> calls it for me already.

What I meant is that you don't need logicvc_connector_destroy, you can
directly set the atomic_destroy_state to drm_connector_cleanup.

Maximey

--4dept5ksr44ncocz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX84HFwAKCRDj7w1vZxhR
xbMiAP9dLZJOM3DGmzAPkfzmg8Zd6tJamUGV8IiSAS3VKmzdMgD/YEHQimvZh/De
Xbwz1yPzxtmWpE79V4vFdE30Mlrz2QA=
=WXG0
-----END PGP SIGNATURE-----

--4dept5ksr44ncocz--

--===============2134331034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2134331034==--
