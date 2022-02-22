Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D98524BFA18
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 15:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3E010E683;
	Tue, 22 Feb 2022 14:02:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D7110E647;
 Tue, 22 Feb 2022 14:02:42 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 601075801BE;
 Tue, 22 Feb 2022 09:02:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 22 Feb 2022 09:02:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=IzwPlVf7zGqizn51QvKzODsFARYs40gJcgFWh8
 Dci0c=; b=HWpVPqRMF94clBR6ikpXaDeNt2blSGHI0gSZcJioWegNlCzKn6wC9C
 xOZyZjcCh3qMiSC0NY+V3KSCEdBEhbDLrHdAjg1uvDPbyZJ4vd7xiQF9+ntgSnvP
 hTnfhtqENKXylX/LUyMC5n7NIIntrXFHAUveqFrnVbHwc9E9NI8AAkGlXuqXG7LN
 b4tA0QwW0grgbrs9obla6z+nM8Y/gAIoz1WqwsJSlh1Qpf1Ce/fgv97HN9Y6Fxpi
 Pkc5NOF6ZV/ybharHEqCbiAiuEiuahN3ZrRds2Targ7i2k+/pWX79gKZcUOPh2m/
 2FKh3EmI2SdY4FRFQlZ5sXqqW+DLnQ9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=IzwPlVf7zGqizn51Q
 vKzODsFARYs40gJcgFWh8Dci0c=; b=IdT4MAPs2ycUFhKdIbkXcOg2q6AHOjJPE
 z+wa1obTig8KZ1vCSClYSZJSJluRnv0oswKamaW8Dxb+qjXdf4k6uYB+xsUrMEg3
 Zp2yudfGiB0RHXqC9x6OHrh+FY6juCQti/SxmL6FAwlp/LM6YNqseglC+FflRRoA
 VyE82Q212mCEb435v7QNs38ht0X5j5+Eyy8PEEOv9xKMzlUM4eR3XULVkuDqCTRq
 E1U6i9g/Rc8SoChQq6QHK4OPkNN2LDcHj+8AFac7SWzCdmgswvsXKVrmnCEpoLtM
 8LIdxMIvzJz0fq9pjk9RU4CKASwCqpXOfLmCia1SZvJZG6qzpoSMw==
X-ME-Sender: <xms:AO0UYk79RcY2hwapMyS0ZXNI22EbvLtJZ7bD_8m2K6DjuveLaPQnTQ>
 <xme:AO0UYl4KP73W6h2ZRaS4cJNV0MRshumYfy4MRsLaIkbo2bn7wTywg1OVbMZf80-mq
 zAtXaWt9ssVtn2V85o>
X-ME-Received: <xmr:AO0UYjc2MEFLgg2y6rp3kZxTmlTzZHMF2DXHvqHaUT9nLeoQWlKqA0zibEWd3JKqXUKIyHfK4ifW0ZG6vwrsWBqWciufm4OnkXjIR6Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AO0UYpLr0wPKS-p0kP53yUF0MbuRYrVX5NNo1wf0uy3m2leWXfwkLg>
 <xmx:AO0UYoI9vAnxZE1Fou-1pCPFNJx7Um9JtcQmRnehFhI9rNZUxnj6EQ>
 <xmx:AO0UYqyYJzWtcG4YPDa5ERegpBv7UjnCAKFSkl6fSH4V1Nsvt-mnVg>
 <xmx:Ae0UYtUU4zvmWNMASNHJLDgMyLMVlZNNPfOe2OjRVVUYsE_VI8_nYw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 09:02:39 -0500 (EST)
Date: Tue, 22 Feb 2022 15:02:37 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v2 13/22] drm/nouveau/kms: Remove redundant zpos
 initialisation
Message-ID: <20220222140237.jeae5o27z6oy5imp@houat>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-14-maxime@cerno.tech>
 <CACO55tt8eTkEZp_DSFQ3Lt3+WBX1g3iwrB6-eTT=91bAk1NPEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h2stm5ltki6zurp6"
Content-Disposition: inline
In-Reply-To: <CACO55tt8eTkEZp_DSFQ3Lt3+WBX1g3iwrB6-eTT=91bAk1NPEw@mail.gmail.com>
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
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--h2stm5ltki6zurp6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 21, 2022 at 05:42:36PM +0100, Karol Herbst wrote:
> On Mon, Feb 21, 2022 at 11:00 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The nouveau KMS driver will call drm_plane_create_zpos_property() with
> > an init value depending on the plane purpose.
> >
> > Since the initial value wasn't carried over in the state, the driver had
> > to set it again in nv50_wndw_reset(). However, the helpers have been
> > adjusted to set it properly at reset, so this is not needed anymore.
> >
> > Cc: nouveau@lists.freedesktop.org
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Karol Herbst <kherbst@redhat.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/=
nouveau/dispnv50/wndw.c
> > index 133c8736426a..0c1a2ea0ed04 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> > @@ -635,8 +635,6 @@ nv50_wndw_reset(struct drm_plane *plane)
> >                 plane->funcs->atomic_destroy_state(plane, plane->state);
> >
> >         __drm_atomic_helper_plane_reset(plane, &asyw->state);
> > -       plane->state->zpos =3D nv50_wndw_zpos_default(plane);
> > -       plane->state->normalized_zpos =3D nv50_wndw_zpos_default(plane);
>=20
> so reading the surrounding code a little it feels like those
> assignments actually do something. If my understanding is correct
> plane->state points to &asyw->state, but asyw was just kzalloced in
> this function. __drm_atomic_helper_plane_reset doesn't set the zpos or
> normalized_zpos fields as long as zpos_property is 0, so those fields
> won't be set with that change anymore.
>=20
> I just don't know if it's fine like that or if this function should
> set zpos_property instead or something. Anyway, the commit description
> makes it sound like that an unneeded assignment would be removed here,
> which doesn't seem to be the case. But I don't really know much about
> all the drm API interactions, so it might just be fine, mostly asking
> to get a better idea on how all those pieces fit together.

If you're looking at the code without that patch series, you're right.

These patches change that however:
https://lore.kernel.org/dri-devel/20220221095918.18763-7-maxime@cerno.tech/
https://lore.kernel.org/dri-devel/20220221095918.18763-8-maxime@cerno.tech/

So, once they have been applied those assignments are made in
__drm_atomic_helper_plane_reset and are no longer relevant here.

Maxime

--h2stm5ltki6zurp6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhTs/QAKCRDj7w1vZxhR
xfogAP9Yq6iqXiuEzD5//A4oYs9pA8bhrH3BW/043YFfBh5BDgD/VpG2t1Gu7emN
UoHtMHpy68DLVaTy5rjp3R5QDGDgLQ8=
=28Jr
-----END PGP SIGNATURE-----

--h2stm5ltki6zurp6--
