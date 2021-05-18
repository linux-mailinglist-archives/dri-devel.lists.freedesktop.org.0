Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460E8387B0A
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 16:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A916EBA0;
	Tue, 18 May 2021 14:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AE16EB8E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 14:23:05 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 882705807BB;
 Tue, 18 May 2021 10:23:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 18 May 2021 10:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=wlDho/GsBmqZTJ4tGbQWTMKtpBy
 pP3Eg/xmSUmHVVyE=; b=TUj68VVRCs7GR+qJ9pJQRyxezgA04pdNAZZfxvXZwhv
 a6xr0BoCnoongayhKGTyMxwTvlwV72dI+kRsIEhCl8LSuALhyupYd34gW9VQZzux
 OLIp9xXTMwuKICYwPOKozjQEHagHgVEQZ0lf6O8Q9RRoytwFAiCQ166S/NOGP6Xn
 hB7abiuJfTGclxkcILIhEf/fO0uhSK582yfKj/soCfkTx0fkYiv/osPmpActTp7j
 CYHNF9rOyxeohQz/1mHBqXwUJB8k8DVDj4HodjpK/OYZBeQdAUswnC2ZNiMnKrUL
 1NRqn0wsdyuP5mXMYW6GM+qA9OVbCqJWHsRaJHR0daw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wlDho/
 GsBmqZTJ4tGbQWTMKtpBypP3Eg/xmSUmHVVyE=; b=rGu0CffdFaBZEpzEXvA8NA
 cRRSg2ZAfptZ+8kFxV0j8q3bU22U5/kH0Mx1Oq6S0GGpu4kdgf87pQSw20I7hOxY
 38CwzCiZQEygswYoUCCyT1i4aSVtH1jOIJ8W351vGnWgc3MrOc0jkONQMz8Z71ZC
 cmbEMVaJKjTI6hrIjnRPstJGa3UmdYuz7wtlvuEBLeMb4njm0c0iPhhDP5DvAExr
 WBnukYBqEetjfKpguYKahhu8Fic/9MP+le7OFlNRfIMcO1yeC9oYQFR/avHsxSdl
 rF8Utt8ZqtE6HYDEkWBgy2abkuJ7p4PuTIeexzyhj2GkgCF8ZAfK1EdSkQdZ61jw
 ==
X-ME-Sender: <xms:x82jYHzuYKpMXZceDVik0GZlzSu0g0X8xkPTADr35Lyxh-bO3uhPkg>
 <xme:x82jYPQOz0sK2ykyNrhkTi2Fg4CXJbQTTklHS6dFzbf4pQ3Hy92-UozLEwfIg7WAL
 xnj-HBQVCBVpK09UvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuedtgfejueduheevgfevvdettdduleffgfffkeeltdffkeegudekjeeuveei
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:x82jYBXu6KbfVg8G8nrCXdDoUd6edIuXI6UM3rKCYV0BuX8S6pua7Q>
 <xmx:x82jYBipU03Mzq9DPKYTtH_3EQ3GDEwOM7KNnGndO6gHYXy_6Qd3dw>
 <xmx:x82jYJBT7gSzw2XCB2aPm1aI-TnYDDLLGOjHty-5tpUBQHvY7azqPw>
 <xmx:yM2jYNs_hQV7V11nv1qY8jiJb6jq4r0LW9yys7gokB3avQkXgA9FBA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 10:23:02 -0400 (EDT)
Date: Tue, 18 May 2021 16:23:00 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v5 4/6] drm/sprd: add Unisoc's drm display controller
 driver
Message-ID: <20210518142300.stvrnyfxnojdidug@gilmour>
References: <20210425123607.26537-1-kevin3.tang@gmail.com>
 <20210425123607.26537-5-kevin3.tang@gmail.com>
 <20210430092249.n75to2das5m6p4zb@gilmour>
 <CAFPSGXYim34tVydpB3ukD8XOc9Y2xSzm3RHyWuUx-mRGPLXwiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mhzvc4qd3u5jbqqo"
Content-Disposition: inline
In-Reply-To: <CAFPSGXYim34tVydpB3ukD8XOc9Y2xSzm3RHyWuUx-mRGPLXwiQ@mail.gmail.com>
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
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mhzvc4qd3u5jbqqo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2021 at 09:18:00PM +0800, Kevin Tang wrote:
> Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B44=E6=9C=8830=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=885:22=E5=86=99=E9=81=93=EF=BC=9A
> > > +     info =3D drm_format_info(fb->format->format);
> >
> > Here fb->format is the result of drm_format_info(fb->format->format)
>
> info->num_planes =3D=3D 3? I will fix it on next version

It's not really what I meant. You don't need the call to drm_format_info
in the first place, the result is going to be fb->format.

So either you do info =3D fb->format and

> > > +     if (fb->format->num_planes =3D=3D 3) {

You use info here

> > > +             /* UV pitch is 1/2 of Y pitch */
> > > +             pitch =3D (fb->pitches[0] / info->cpp[0]) |
> > > +                             (fb->pitches[0] / info->cpp[0] << 15);

Or you can use fb->format->cpp here

Either way you should be consistent.

> > > +static struct sprd_plane *sprd_planes_init(struct drm_device *drm)
> > > +{
> > > +     struct sprd_plane *plane, *primary;
> > > +     enum drm_plane_type plane_type;
> > > +     int i;
> > > +
> > > +     for (i =3D 0; i < 6; i++) {
> > > +             plane_type =3D (i =3D=3D 0) ? DRM_PLANE_TYPE_PRIMARY :
> > > +                                     DRM_PLANE_TYPE_OVERLAY;
> > > +
> > > +             plane =3D drmm_universal_plane_alloc(drm, struct sprd_p=
lane, base,
> > > +                                            1, &sprd_plane_funcs,
> > > +                                            layer_fmts, ARRAY_SIZE(l=
ayer_fmts),
> > > +                                            NULL, plane_type, NULL);
> > > +             if (IS_ERR(plane)) {
> > > +                     drm_err(drm, "failed to init drm plane: %d\n", =
i);
> > > +                     return plane;
> > > +             }
> > > +
> > > +             drm_plane_helper_add(&plane->base, &sprd_plane_helper_f=
uncs);
> > > +
> > > +             sprd_plane_create_properties(plane, i);
> > > +
> > > +             if (i =3D=3D 0)
> > > +                     primary =3D plane;
> > > +     }
> > > +
> > > +     return primary;
> > > +}
> > > +
> > > +static void sprd_crtc_mode_set_nofb(struct drm_crtc *crtc)
> > > +{
> > > +     struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> > > +     struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
> > > +
> > > +     if (mode->type & DRM_MODE_TYPE_PREFERRED)
> > > +             drm_display_mode_to_videomode(mode, &dpu->ctx.vm);
> >
> > What happens if the mode isn't a preferred mode?
>
> Have already replied on the dsi driver side
>
> > > +}
> > > +
> > > +static void sprd_crtc_atomic_enable(struct drm_crtc *crtc,
> > > +                                struct drm_atomic_state *state)
> > > +{
> > > +     struct sprd_dpu *dpu =3D to_sprd_crtc(crtc);
> > > +
> > > +     sprd_dpu_init(dpu);
> >
> > I guess that call would fail here or program a bogus value. We already
> > discussed this in the previous version, but I'm really not sure why you
> > need this in the first place. Just use the crtc_state->adjusted_mode and
> > program that.
>
> Is also the enable_irq issue about this comment?

Not really? This is about the preferred mode stuff.

Maxime

--mhzvc4qd3u5jbqqo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYKPNxAAKCRDj7w1vZxhR
xZXwAP9/NXLI0TRCAPdbdHm+3gthxN/JG367Yk9DJ3bk9KrivgD7B/xCB69BZS1h
qxO3bwJYKuYPQ9gqup6eqpZIyb1Xnwk=
=4WSJ
-----END PGP SIGNATURE-----

--mhzvc4qd3u5jbqqo--
