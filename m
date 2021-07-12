Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDF43C45F2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 10:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36D2889C69;
	Mon, 12 Jul 2021 08:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46CF89C69
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 08:03:23 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id b26so9272589lfo.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 01:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=LeU/iKFiiOjfK6kYoApvn8LC3klvjlzcItkxuxmRI6g=;
 b=tqpUUhnDJTw0hE70E1GDyFM8sXtcvTxr4t4HTbjBlmHkcDqIF88IH41cOi8okoS9Qz
 q93DAAoRh0CvIyA9Au/Bta5zTuR+AKCc/nI8gwyGCboUIjIz6Ya9uN5a1zye+xMIj5F4
 gj3VUtIUyOq6rQDPGxq4T/FBgYkXHshgO17K7WAO8zliquUChEKeUchSAY7MUn1LGOrO
 KD+lkYmaFKE3R89zpccIQXpP9nzsvQqguKsNvGdq83l6MnUnOne37G5pOVJmSWMJXUP1
 ODZIwd5BVFwzpaIFNuZ3+00pFHQ+IT85BBL2yC/WPuKUYKR2BAoJ+gm7kmnyDlkhpwYC
 Q2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=LeU/iKFiiOjfK6kYoApvn8LC3klvjlzcItkxuxmRI6g=;
 b=TeGZcfwuRPNS221lU0Rvz3zk9THsxbe9tsNiIt59f/RkN4aCDUUExuWoxLoGgAUaW6
 EKQafs0imMrTjglk3dPZrdT2lmupPD8xD6wYaAKs8UZ+a5ade6FpATvot8DJZXO59SVM
 +NuRY38tf8Xl52WErNEdkbTP17HqOe7wNINw8g9dbYmm0b6HFYSY3Gv3xNAt6llm3Jqk
 gtOLzKyekFzfCH0jxcznvnMOUXlTa+KfY/6uY2FvLncZA2+api+POkZN9cf+DwSRxHlP
 upTX/XVn8HRbMCe/7m9QwfS2L6yAwWiUEJcYaBceS6Le7wktDeXYhl6bFIUfXHhoK0yF
 K11A==
X-Gm-Message-State: AOAM531UY57cZgZP238ELvq/11vFAlUt/TmKedtio73gpp6xuj4XbGuB
 acvH53dj7VHrpwxOrFtwOqQ=
X-Google-Smtp-Source: ABdhPJyem3ieh37W13FAjougHL5Ev00Qqp2YmMFbO06yq7ngafrRsYlAez91tnKvE2pI4ySx0YgQWw==
X-Received: by 2002:a19:48cd:: with SMTP id
 v196mr18878562lfa.269.1626077001864; 
 Mon, 12 Jul 2021 01:03:21 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id y11sm41355ljn.99.2021.07.12.01.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 01:03:21 -0700 (PDT)
Date: Mon, 12 Jul 2021 11:03:10 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: Re: [PATCH 1/2] drm: add crtc background color property
Message-ID: <20210712110310.540df27d@eldfell>
In-Reply-To: <3c8331cf-fded-b6e6-3e25-666634f4b87a@foss.st.com>
References: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
 <20210707084557.22443-2-raphael.gallais-pou@foss.st.com>
 <20210709110459.79ca406a@eldfell>
 <3c8331cf-fded-b6e6-3e25-666634f4b87a@foss.st.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l+IJnmO2q5AI2NyYYICtU27";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/l+IJnmO2q5AI2NyYYICtU27
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 9 Jul 2021 18:23:26 +0200
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com> wrote:

> On 7/9/21 10:04 AM, Pekka Paalanen wrote:
> > On Wed, 7 Jul 2021 08:48:47 +0000
> > Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com> wrote:
> > =20
> >> Some display controllers can be programmed to present non-black colors
> >> for pixels not covered by any plane (or pixels covered by the
> >> transparent regions of higher planes).  Compositors that want a UI with
> >> a solid color background can potentially save memory bandwidth by
> >> setting the CRTC background property and using smaller planes to displ=
ay
> >> the rest of the content.
> >>
> >> To avoid confusion between different ways of encoding RGB data, we
> >> define a standard 64-bit format that should be used for this property's
> >> value.  Helper functions and macros are provided to generate and disse=
ct
> >> values in this standard format with varying component precision values.
> >>
> >> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> >> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >> ---
> >>   drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
> >>   drivers/gpu/drm/drm_atomic_uapi.c         |  4 +++
> >>   drivers/gpu/drm/drm_blend.c               | 34 +++++++++++++++++++++=
--
> >>   drivers/gpu/drm/drm_mode_config.c         |  6 ++++
> >>   include/drm/drm_blend.h                   |  1 +
> >>   include/drm/drm_crtc.h                    | 12 ++++++++
> >>   include/drm/drm_mode_config.h             |  5 ++++
> >>   include/uapi/drm/drm_mode.h               | 28 +++++++++++++++++++
> >>   8 files changed, 89 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/d=
rm/drm_atomic_state_helper.c
> >> index ddcf5c2c8e6a..1b95a4ecdb2b 100644
> >> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> >> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> >> @@ -72,6 +72,7 @@ __drm_atomic_helper_crtc_state_reset(struct drm_crtc=
_state *crtc_state,
> >>   				     struct drm_crtc *crtc)
> >>   {
> >>   	crtc_state->crtc =3D crtc;
> >> +	crtc_state->bgcolor =3D drm_argb(16, 0xffff, 0, 0, 0);
> >>   }
> >>   EXPORT_SYMBOL(__drm_atomic_helper_crtc_state_reset);
> >>  =20
> >> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_a=
tomic_uapi.c
> >> index 438e9585b225..fea68f8f17f8 100644
> >> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> >> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> >> @@ -483,6 +483,8 @@ static int drm_atomic_crtc_set_property(struct drm=
_crtc *crtc,
> >>   		set_out_fence_for_crtc(state->state, crtc, fence_ptr);
> >>   	} else if (property =3D=3D crtc->scaling_filter_property) {
> >>   		state->scaling_filter =3D val;
> >> +	} else if (property =3D=3D config->bgcolor_property) {
> >> +		state->bgcolor =3D val;
> >>   	} else if (crtc->funcs->atomic_set_property) {
> >>   		return crtc->funcs->atomic_set_property(crtc, state, property, val=
);
> >>   	} else {
> >> @@ -520,6 +522,8 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
> >>   		*val =3D 0;
> >>   	else if (property =3D=3D crtc->scaling_filter_property)
> >>   		*val =3D state->scaling_filter;
> >> +	else if (property =3D=3D config->bgcolor_property)
> >> +		*val =3D state->bgcolor;
> >>   	else if (crtc->funcs->atomic_get_property)
> >>   		return crtc->funcs->atomic_get_property(crtc, state, property, val=
);
> >>   	else
> >> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> >> index ec37cbfabb50..6692d6a6db22 100644
> >> --- a/drivers/gpu/drm/drm_blend.c
> >> +++ b/drivers/gpu/drm/drm_blend.c
> >> @@ -186,8 +186,7 @@
> >>    *		 assumed to be 1.0
> >>    *
> >>    * Note that all the property extensions described here apply either=
 to the
> >> - * plane or the CRTC (e.g. for the background color, which currently =
is not
> >> - * exposed and assumed to be black).
> >> + * plane or the CRTC.
> >>    *
> >>    * SCALING_FILTER:
> >>    *     Indicates scaling filter to be used for plane scaler
> >> @@ -201,6 +200,21 @@
> >>    *
> >>    * Drivers can set up this property for a plane by calling
> >>    * drm_plane_create_scaling_filter_property
> >> + * =20
> > Hi, =20
>=20
>=20
> Hi Pekka,
>=20
>=20
> Many thanks for your feedback, your comments are taken into account for=20
> a v2.
>=20
>=20
> >
> > I assume the below block is the UAPI documentation of this new property
> > and that it would appear with the other UAPI docs.
> > =20
> >> + * BACKGROUND_COLOR:
> >> + *	Defines the ARGB color of a full-screen layer that exists below all
> >> + *	planes.  This color will be used for pixels not covered by any pla=
ne
> >> + *	and may also be blended with plane contents as allowed by a plane's
> >> + *	alpha values.  The background color defaults to black, and is assu=
med
> >> + *	to be black for drivers that do not expose this property. =20
> > All good up to here.
> > =20
> >>   Although
> >> + *	background color isn't a plane, it is assumed that the color provi=
ded
> >> + *	here undergoes the same pipe-level degamma/CSC/gamma transformatio=
ns
> >> + *	that planes undergo. =20
> > This sounds to me like it refers to the per-plane degamma/csc/gamma
> > which are new properties in development. I believe you do not mean
> > that, but you mean the CRTC degamma/csc/gamma and everything else which
> > apply *after* the blending of planes. So the wording here would need
> > clarification. =20
>=20
>=20
> Yes, I was not sure about this, but it is effectively the general CRTC=20
> color correction which is applicable to the background color.
>=20
> > =20
> >>   Note that the color value provided here includes
> >> + *	an alpha channel...non-opaque background color values are allowed,
> >> + *	but are generally only honored in special cases (e.g., when a memo=
ry
> >> + *	writeback connector is in use). =20
> > This could be read as: if you use a non-opaque color value, it will
> > usually be completely ignored (and the background will be e.g. black
> > instead). Is that your intention?
> >
> > I think a more useful definition would be that the alpha is used in
> > blending as always, but because we do not yet have physically
> > transparent monitors, the final alpha value may not reach the video
> > sink or the video sink may ignore it. =20
>=20
> In our case, the hardware does not support alpha channel (as you can see=
=20
> the DRM_ARGB_TO_LTDC_RGB24 macro in the second patch).
>=20
> For chip vendors who does support this feature, the video sink would get=
=20
> this transparency parameter. In the case where it is not, alpha channel=20
> would be ignored.
>=20
>=20
> >> + *
> >> + *	This property is setup with drm_crtc_add_bgcolor_property(). =20
> > You forgot to document the value format of this property. The ARGB color
> > format needs to be defined at least to the same detail as all pixel
> > formats in drm_fourcc.h are. If there is a suitable DRM_FORMAT_*
> > definition already, simply saying the color is in that format would be
> > enough. =20
>=20
>=20
> Will do ! :)
>=20
> I was thinking about the FourCC AR4H format. Have you something else in=20
> mind ?

Hi,

if you mean DRM_FORMAT_ARGB16161616F then that is not what you are
using right now. That is a floating-point format using 16-bit floats
(half float). It has only 10 bits precision IIRC.

As C compilers do not(?) have built-in support for halfs, using this
format would be inconvenient for userspace (and the kernel?). Since
it's just for one pixel value, I think using a format that is
convenient to craft would be good.


> > Another thing to document is whether this color value is alpha
> > pre-multiplied or not. Planes can have the property "pixel blend mode",
> > but because the background color is not on a plane, that property
> > cannot apply here.
> >
> > The difference it makes is that if background color is both non-opaque
> > and pre-multiplied, then the question arises what pixel values will
> > actually be transmitted to video sink for the background. Will the
> > alpha pre-multiplication be undone?
> >
> > Btw. note that "pixel blend mode" property does not document the use of
> > background alpha at all. So if the background color can have non-opaque
> > alpha, then you need to document the behavior in "pixel blend mode". It
> > also does not document what alpha value will result from blending, for
> > blending the next plane. =20
>=20
> Those are questions that did not crossed my mind at all.
>=20
> What would you suggest ? Instinctively I would say that in the case=20
> where there is a non-opaque background color,
>=20
> alpha pre-multiplication would not be taken into account, although it is=
=20
> maybe not the best solution.
>=20
> As I am not quite sure, I will lookup for this.

Right now, I would suggest to just dodge the whole question: define the
background color to be opaque. Either drop the alpha channel, or
specify that alpha must be 1.0 for now (fail ioctl if not).

Let the people who actually need alpha in the background color figure
out all the details. They would know what they want, while we don't. We
also can't come up with a proper userspace for non-opaque alpha to
prove that the design works.

If you specify that alpha channel exists but must be 1.0, then someone
else could later add another property that defines how the alpha would
be used if it was less than 1.0. The existence of that other property
would then tell userspace that non-1.0 alpha is supported and also
define what it does. Userspace that does not understand that will just
keep using alpha 1.0, meaning it doesn't matter what value the other
new property has. So this seems quite future-proof to me.

> > The question about full vs. limited range seems unnecessary to me, as
> > the background color will be used as-is in the blending stage, so
> > userspace can just program the correct value that fits the pipeline it
> > is setting up.
> >
> > One more question is, as HDR exists, could we need background colors
> > with component values greater than 1.0? =20
>=20
> AR4H color format should cover that case, isn't it ?

Yes, but with the inconvenience I mentioned.

This is a genuine question though, would anyone actually need
background color values > 1.0. I don't know of any case yet where it
would be required. It would imply that plane blending happens in a
color space where >1.0 values are meaningful. I'm not even sure if any
hardware supporting that exists.

Maybe it would be best to assume that only [0.0, 1.0] pixel value range
is useful, and mention in the commit message that if someone really
needs values outside of that, they should create another background
color property. Then, you can pick a simple unsigned integer pixel
format, too. (I didn't see any 16 bit-per-channel formats like that in
drm_fourcc.h though.)


Thanks,
pq

--Sig_/l+IJnmO2q5AI2NyYYICtU27
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDr9z4ACgkQI1/ltBGq
qqeOARAAj0YWJ+kE/oYuIEijdeKcn+rsPF7oJ427Nc9i7Fjsl0yfXYTZkKP/aztP
Ljjr5TPAeyWFGosYSJmhaHXGk7Z6+zbL9u19XJZvbL8r8+3QJujvuXu9aG3/HaRK
ZOP4y7etohnzJHfZ1uIFaTg5SJdYG8YNRwGNFZQjRhLGYox5fCgvk5DJGsD0HOLg
uqxl6oO9ftm1OT0u/Mtaa6c13I3NG+/sSsIUIOI7sn4fYU/c8nLEpghocxBRnlBe
Vpz9ABAKMfrGP3zktxUnWOiQvE2jtvAqMpHGbZWA3Tm7hpNJQ9hgtllqYS/FAeCt
E9zZUoVPG3oooyg7+NrZncNZrooOB6j6ImWMiWHeqzqzvdCE/jC1IIeX9PmRl5ZE
KC8chjZ+ftMFyl8Wq0N8dlNyoACgfNH5NjtKJhLw+BfAAwprbvlQ58EmyxwGruoZ
EKnrPZrYlJ4/ABM36sPaM26SLzdgFlbLBS3rjH2KDSspotKRvQg8m5NU1dAHeTL3
G0UoruEXAruPFvnOvIEy4dWx1V3EIQsaswt2bJXcz+DdSDh5RfyA9mt3YORU5uWb
t5v2dCL7uQti6xFx+wDzG0KuJ6vOucdZ5xsaIygZY5BIVkSWgeieDy10DVP7QJmq
qdVCn+ZZ13UoD6+fXgMkMLM9kj5rF6jcSWJCVvrMmrYe+qK2LmA=
=PZnE
-----END PGP SIGNATURE-----

--Sig_/l+IJnmO2q5AI2NyYYICtU27--
