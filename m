Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25AD6026CA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 10:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2097F10EEEB;
	Tue, 18 Oct 2022 08:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B162910EEE4;
 Tue, 18 Oct 2022 08:27:20 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id E81172B0672F;
 Tue, 18 Oct 2022 04:27:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 18 Oct 2022 04:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1666081635; x=1666088835; bh=RrU+seTVfA
 Rf3DeaCowDOUDc885uvlic9pM1B2ezK30=; b=FBhyL4XykbPqpCrmf/vvWbiLYK
 EhXQf9mbShWzZK55kVxtr+ohIUpEbfkW33XE8y2X2F7NyNDM5QNQard5Hwvl5RnM
 ktcu/5rwphhhtRb1hx7tVzF5aJ19zpAteVdQZ+GgeY7DJ8eeH1w2z8vQJ7kQmtm3
 dHXBpRSEqdAvdYHbWZEVmzhFaySlVR5psLdKO+AnnUrqG0TAdqwR4dEemfbJCXM+
 9lar5dEyrUzrENHD8aSYjbolaW3mhe9u5zsn+YYRRORCGj+Qck/PJ4BtUfty6BFh
 Gc7t9KCsmALfTezmXR5Qy9ahGek4E19Yx0qTeafQD9kKECKTVnAu60JlOI/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666081635; x=1666088835; bh=RrU+seTVfARf3DeaCowDOUDc885u
 vlic9pM1B2ezK30=; b=JoGJvYzVONTey+fzRFqsE60gfudjuH7V5g8mMP3xcou+
 AxIHd0YuroS9N8+iwEK0atWzuCXlTgDJAx+GKPbGQ1HJ5HjWxc/VrwWKfDz3ZBQE
 y9w4vgLCUWWN9l807/gHSuJd6QpTelRWjuAqT8U/Ftz4Ezzooc+gmCeiJEbfDTyf
 iwzASSSZ2KuxI+aTtlYTjkJC+2tghreQSORSM1M9dk4DD3kGBhsZ84a8qkOjE9xI
 jsM7ZA1LuVSnMpsFp0RVT17aCdvfIY+L9aRi1wsun2oG3B4PXzeNfKFEOtm3kX/A
 QsHjFDCATebvwzI7sEUEXGQfD+OpBu0zB4WBso7otA==
X-ME-Sender: <xms:Y2NOYxNl2i1hYfruZStH62j2hya6DGT2-OW9r2e63DB0DrTi58CdRg>
 <xme:Y2NOYz83RqyzLZ17X2TuKEWPNCYyMDRgSShjstgfMYmcfqjQiEZ6gb32tqLxpxH9f
 m8SnSgaEsydhZbZ8fo>
X-ME-Received: <xmr:Y2NOYwR4_PYJN_1tWMtj2Zqifuu8whdRBOfvvwbaiob3iknXFaiCAuqR0SWD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeluddgtdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevuddthffgfeeiffejgfeghfeludegkedtgefgffejtdegtddvleduvdfh
 teehveenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:Y2NOY9sd5l1-Uehp7sGAxrZi0oTlFd178KhzMQKRb0thACJBlAdmRQ>
 <xmx:Y2NOY5c89WW0AVsglpi5ECEN36Ga21C9nfwjh0LYMm3CjVztq-wpmg>
 <xmx:Y2NOY50S9QuYATViSdd1Wfd2nLebv7roHfrEUcwqHn2dU2QhVx6Dow>
 <xmx:Y2NOY--FCxQ3uBMJocon8AOyh9XeQnkjAwxZqTVyNpnn2vVtDWp4whKbv-Y>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Oct 2022 04:27:14 -0400 (EDT)
Date: Tue, 18 Oct 2022 10:27:13 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: kfyatek+publicgit@gmail.com
Subject: Re: [PATCH v5 19/22] drm/vc4: vec: Check for VEC output constraints
Message-ID: <20221018082713.kaecdaf6izunpa7t@houat>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <20220728-rpi-analog-tv-properties-v5-19-d841cc64fe4b@cerno.tech>
 <270c4a51-0a03-f048-46da-ab37900f8b91@gmail.com>
 <31759a06-ddd0-6b78-0e10-8e8754f394f9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="khr24myzeaxu6pdr"
Content-Disposition: inline
In-Reply-To: <31759a06-ddd0-6b78-0e10-8e8754f394f9@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--khr24myzeaxu6pdr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 16, 2022 at 08:16:32PM +0200, Mateusz Kwiatkowski wrote:
> W dniu 13.10.2022 o 15:19, Maxime Ripard pisze:
> > From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> >
> > The VEC can accept pretty much any relatively reasonable mode, but still
> > has a bunch of constraints to meet.
> >
> > Let's create an atomic_check() implementation that will make sure we
> > don't end up accepting a non-functional mode.
> >
> > Acked-by: Noralf Tr=F8nnes <noralf@tronnes.org>
> > Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >=A0 drivers/gpu/drm/vc4/vc4_vec.c | 48 +++++++++++++++++++++++++++++++++=
++++++++++
> >=A0 1 file changed, 48 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_ve=
c.c
> > index 90e375a8a8f9..1fcb7baf874e 100644
> > --- a/drivers/gpu/drm/vc4/vc4_vec.c
> > +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> > @@ -453,6 +453,7 @@ static int vc4_vec_encoder_atomic_check(struct drm_=
encoder *encoder,
> > =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0struct drm_crtc_st=
ate *crtc_state,
> > =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0struct drm_connect=
or_state *conn_state)
> >=A0 {
> > +=A0=A0 =A0const struct drm_display_mode *mode =3D &crtc_state->adjuste=
d_mode;
> > =A0=A0=A0 =A0const struct vc4_vec_tv_mode *vec_mode;
> > =A0
> > =A0=A0=A0 =A0vec_mode =3D &vc4_vec_tv_modes[conn_state->tv.legacy_mode];
> > @@ -461,6 +462,53 @@ static int vc4_vec_encoder_atomic_check(struct drm=
_encoder *encoder,
> > =A0=A0=A0 =A0=A0=A0=A0 !drm_mode_equal(vec_mode->mode, &crtc_state->adj=
usted_mode))
> > =A0=A0=A0 =A0=A0=A0 =A0return -EINVAL;
> > =A0
> > +=A0=A0 =A0if (mode->crtc_hdisplay % 4)
> > +=A0=A0 =A0=A0=A0 =A0return -EINVAL;
> > +
> > +=A0=A0 =A0if (!(mode->crtc_hsync_end - mode->crtc_hsync_start))
> > +=A0=A0 =A0=A0=A0 =A0return -EINVAL;
> > +
> > +=A0=A0 =A0switch (mode->vtotal) {
> > +=A0=A0 =A0case 525:
> > +=A0=A0 =A0=A0=A0 =A0if (mode->crtc_vtotal > 262)
> > +=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0return -EINVAL;
> > +
> > +=A0=A0 =A0=A0=A0 =A0if (mode->crtc_vdisplay < 1 || mode->crtc_vdisplay=
 > 253)
> > +=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0return -EINVAL;
> > +
> > +=A0=A0 =A0=A0=A0 =A0if (!(mode->crtc_vsync_start - mode->crtc_vdisplay=
))
> > +=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0return -EINVAL;
> > +
> > +=A0=A0 =A0=A0=A0 =A0if ((mode->crtc_vsync_end - mode->crtc_vsync_start=
) !=3D 3)
> > +=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0return -EINVAL;
> > +
> > +=A0=A0 =A0=A0=A0 =A0if ((mode->crtc_vtotal - mode->crtc_vsync_end) < 4)
> > +=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0return -EINVAL;
> > +
> > +=A0=A0 =A0=A0=A0 =A0break;
> > +
> > +=A0=A0 =A0case 625:
> > +=A0=A0 =A0=A0=A0 =A0if (mode->crtc_vtotal > 312)
> > +=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0return -EINVAL;
> > +
> > +=A0=A0 =A0=A0=A0 =A0if (mode->crtc_vdisplay < 1 || mode->crtc_vdisplay=
 > 305)
> > +=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0return -EINVAL;
> > +
> > +=A0=A0 =A0=A0=A0 =A0if (!(mode->crtc_vsync_start - mode->crtc_vdisplay=
))
> > +=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0return -EINVAL;
> > +
> > +=A0=A0 =A0=A0=A0 =A0if ((mode->crtc_vsync_end - mode->crtc_vsync_start=
) !=3D 3)
> > +=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0return -EINVAL;
> > +
> > +=A0=A0 =A0=A0=A0 =A0if ((mode->crtc_vtotal - mode->crtc_vsync_end) < 2)
> > +=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0return -EINVAL;
> > +
> > +=A0=A0 =A0=A0=A0 =A0break;
> > +
> > +=A0=A0 =A0default:
> > +=A0=A0 =A0=A0=A0 =A0return -EINVAL;
> > +=A0=A0 =A0}
> > +
> > =A0=A0=A0 =A0return 0;
> >=A0 }
> > =A0
> >
>=20
> In my original version of this function
> (https://github.com/raspberrypi/linux/pull/4406/files) the switch is over
> reference_mode->vtotal, not mode->vtotal. This was intended to explicitly=
 allow
> a different value of mode->vtotal, to support non-standard modes, such as=
 "fake"
> 525 lines with SECAM encoding, or the progressive modes.
>
> You're switching over mode->vtotal, which makes specifying those impossib=
le.
> I don't think we should limit the users like that.
>
> We're removing reference_mode in patch 20/22, so adding a switch over
> reference_mode->vtotal is probably not a good idea in that case I'd switch
> over mode->htotal instead: 858 for "NTSC" and 864 for "PAL". This may see=
m a bit
> weird, but any other value of htotal causes the VEC to output garbage any=
way.

Ack, I'll change it.

If it ever causes an issue, we can always switch back to a reference
mode anyway. We'd just have to call drm_mode_analog_tv at each
atomic_check so I'd rather avoid the overhead if we can

Maxime

--khr24myzeaxu6pdr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY05jYQAKCRDj7w1vZxhR
xWoTAP0eC45ml3mXGk5QHe/4VqLwsotPDOcBr4EdsQUxCduL0QD9GehziPurHbq2
XDYQ9YzMcem3HRvtKSZYxu6b5/2RiAw=
=6OJV
-----END PGP SIGNATURE-----

--khr24myzeaxu6pdr--
