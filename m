Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E11A33B1517
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 09:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E426E82C;
	Wed, 23 Jun 2021 07:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DB06E3EE;
 Wed, 23 Jun 2021 07:48:42 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id z22so1712715ljh.8;
 Wed, 23 Jun 2021 00:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=8Ja036d3JX5UFLwHhqcTiZxQHalj0jmCs1SSzd3Ps7g=;
 b=vTd7g/CFs2LPVblL4xKzYuhjTS35tdOIgtfNiti+sM9OtDUzpWrZ1JxkW5z+eTyeN0
 W50qz5ltHipMxPN6UXRs0L+a1dyPTQgNvYqaRa80UqTfYiMbMzj7jEneQCiyGBUZ8ke4
 G8n6me9TcPQMmwASNiBevhhmPW9nXF9cRMVU2UNs7I1TD23cB7PKFQ9rxmMxAjYHFkvl
 H10MW4D8UImgZsi5xJiZujf8W4iN9km9VkLiYUzugTourigo+S5FqpArZMJgu9oZ2+uv
 LW+okYhd5qqiaX3R/uMUdXQlWKA/oR4ZJUn0PCGYS+CKp8X2OR46wfbC2bIW4VsxZ0g9
 76bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=8Ja036d3JX5UFLwHhqcTiZxQHalj0jmCs1SSzd3Ps7g=;
 b=V5uB6bgZyDJUy7MFIBjy/R1csgPI3cXpp9bcWQUXZYtNgVN5dWmPGUKveJ8QxYHq6Z
 yhnV3T0vHKQygmTb53jNLGUI73Y0BRBqcXZ32G4FUfeXhsSbEd/7s/kg5M5XtrU2qPGT
 DAYLw+xmrgvNMpA0w17qeqUM/9FkylrLelQF8Txi/ODmIv7/j/0bwDFMazYtZZ4b2CYI
 Mi+fIvFilpU2GC3Qy6YJX5H2uYGOMZRsngDPqX6P9FnHbSoXZCkHs3dmls1BZ1RmML4D
 Pv+sAFu2JkdLNObuEOra4meG1nwaltr7MzLnJAJpsyJNusSKyInG/3Weo57nYwdV4dYo
 0UhA==
X-Gm-Message-State: AOAM533ZSqVxDTXM5Equ7bc/4jsFUJB2KdU637mLF3drbi9jHRRInbPm
 cw/FaZC13x+mhotxKD7Oqyw=
X-Google-Smtp-Source: ABdhPJx4wlG7+i1VWDQ8NRkNuIaxF+lWnUb575DmEObbBHN8yr47VcSizciFBdPLoKZWvwKX36yVBA==
X-Received: by 2002:a2e:2e0d:: with SMTP id u13mr7106476lju.351.1624434520426; 
 Wed, 23 Jun 2021 00:48:40 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x1sm230700lji.19.2021.06.23.00.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 00:48:40 -0700 (PDT)
Date: Wed, 23 Jun 2021 10:48:36 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 15/17] drm/uAPI: Move "Broadcast RGB" property from
 driver specific to general context
Message-ID: <20210623104836.77734bad@eldfell>
In-Reply-To: <70d89fe2-4e45-7ea9-2509-15257ef222f8@tuxedocomputers.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-16-wse@tuxedocomputers.com>
 <20210622102529.5266e87b@eldfell>
 <70d89fe2-4e45-7ea9-2509-15257ef222f8@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m=u2eOUlQuyIDelbKBjlgiP";
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/m=u2eOUlQuyIDelbKBjlgiP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Jun 2021 11:57:53 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Am 22.06.21 um 09:25 schrieb Pekka Paalanen:
> > On Fri, 18 Jun 2021 11:11:14 +0200
> > Werner Sembach <wse@tuxedocomputers.com> wrote:
> > =20
> >> Add "Broadcast RGB" to general drm context so that more drivers besides
> >> i915 and gma500 can implement it without duplicating code.
> >>
> >> Userspace can use this property to tell the graphic driver to use full=
 or
> >> limited color range for a given connector, overwriting the default
> >> behaviour/automatic detection.
> >>
> >> Possible options are:
> >>     - Automatic (default/current behaviour)
> >>     - Full
> >>     - Limited 16:235
> >>
> >> In theory the driver should be able to automatically detect the monito=
rs
> >> capabilities, but because of flawed standard implementations in Monito=
rs,
> >> this might fail. In this case a manual overwrite is required to not ha=
ve
> >> washed out colors or lose details in very dark or bright scenes.
> >>
> >> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> >> ---
> >>  drivers/gpu/drm/drm_atomic_helper.c |  4 +++
> >>  drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++
> >>  drivers/gpu/drm/drm_connector.c     | 43 +++++++++++++++++++++++++++++
> >>  include/drm/drm_connector.h         | 16 +++++++++++
> >>  4 files changed, 67 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm=
_atomic_helper.c
> >> index 90d62f305257..0c89d32efbd0 100644
> >> --- a/drivers/gpu/drm/drm_atomic_helper.c
> >> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> >> @@ -691,6 +691,10 @@ drm_atomic_helper_check_modeset(struct drm_device=
 *dev,
> >>  			if (old_connector_state->preferred_color_format !=3D
> >>  			    new_connector_state->preferred_color_format)
> >>  				new_crtc_state->connectors_changed =3D true;
> >> +
> >> +			if (old_connector_state->preferred_color_range !=3D
> >> +			    new_connector_state->preferred_color_range)
> >> +				new_crtc_state->connectors_changed =3D true;
> >>  		}
> >> =20
> >>  		if (funcs->atomic_check)
> >> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_a=
tomic_uapi.c
> >> index c536f5e22016..c589bb1a8163 100644
> >> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> >> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> >> @@ -798,6 +798,8 @@ static int drm_atomic_connector_set_property(struc=
t drm_connector *connector,
> >>  		state->max_requested_bpc =3D val;
> >>  	} else if (property =3D=3D connector->preferred_color_format_propert=
y) {
> >>  		state->preferred_color_format =3D val;
> >> +	} else if (property =3D=3D connector->preferred_color_range_property=
) {
> >> +		state->preferred_color_range =3D val;
> >>  	} else if (connector->funcs->atomic_set_property) {
> >>  		return connector->funcs->atomic_set_property(connector,
> >>  				state, property, val);
> >> @@ -877,6 +879,8 @@ drm_atomic_connector_get_property(struct drm_conne=
ctor *connector,
> >>  		*val =3D state->max_requested_bpc;
> >>  	} else if (property =3D=3D connector->preferred_color_format_propert=
y) {
> >>  		*val =3D state->preferred_color_format;
> >> +	} else if (property =3D=3D connector->preferred_color_range_property=
) {
> >> +		*val =3D state->preferred_color_range;
> >>  	} else if (connector->funcs->atomic_get_property) {
> >>  		return connector->funcs->atomic_get_property(connector,
> >>  				state, property, val);
> >> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_con=
nector.c
> >> index aea03dd02e33..9bc596638613 100644
> >> --- a/drivers/gpu/drm/drm_connector.c
> >> +++ b/drivers/gpu/drm/drm_connector.c
> >> @@ -905,6 +905,12 @@ static const struct drm_prop_enum_list drm_active=
_color_format_enum_list[] =3D {
> >>  	{ DRM_COLOR_FORMAT_YCRCB420, "ycbcr420" },
> >>  };
> >> =20
> >> +static const struct drm_prop_enum_list drm_preferred_color_range_enum=
_list[] =3D {
> >> +	{ DRM_MODE_COLOR_RANGE_UNSET, "Automatic" },
> >> +	{ DRM_MODE_COLOR_RANGE_FULL, "Full" },
> >> +	{ DRM_MODE_COLOR_RANGE_LIMITED_16_235, "Limited 16:235" }, =20
> > Hi,
> >
> > the same question here about these numbers as I asked on the "active
> > color range" property.
> > =20
> >> +};
> >> +
> >>  static const struct drm_prop_enum_list drm_active_color_range_enum_li=
st[] =3D {
> >>  	{ DRM_MODE_COLOR_RANGE_UNSET, "Unknown" },
> >>  	{ DRM_MODE_COLOR_RANGE_FULL, "Full" },
> >> @@ -1243,6 +1249,13 @@ static const struct drm_prop_enum_list dp_color=
spaces[] =3D {
> >>   *	drm_connector_attach_active_color_format_property() to install this
> >>   *	property.
> >>   *
> >> + * Broadcast RGB:
> >> + *	This property is used by userspace to change the used color range.=
 When
> >> + *	used the driver will use the selected range if valid for the curre=
nt
> >> + *	color format. Drivers to use the function
> >> + *	drm_connector_attach_preferred_color_format_property() to create a=
nd
> >> + *	attach the property to the connector during initialization. =20
> > An important detail to document here is: does userspace need to
> > take care that pixel data at the connector will already match the set
> > range, or will the driver program the hardware to produce the set range=
? =20
> Since until now, the userspace didn't even know for sure if RGB or YCbCr =
and therefore which full/limited format was
> used I guess it's all kernel space conversion.
> >
> > If the former, then I'm afraid the preference/active property pair
> > design does not work. Userspace needs to make sure the content is in
> > the right range, so the driver cannot second-guess that afterwards.
> >
> > If the latter, then what does the driver assume about color range just
> > before the automatic conversion to the final color range, and does the
> > range conversion happen as the final step in the color pipeline?
> >
> > If I remember the discussion about Intel right, then the driver does
> > the latter and assume that userspace programs KMS to always produce
> > full range pixels. There is no provision for userspace to produce
> > limited range pixels, IIRC. =20
> I think I remember this too from an answer to one of the revisions of thi=
s patchset.

As long as you keep the old KMS property as is, just moving code so it
is used by more drivers, this is fine and one can't do otherwise anyway.

(The rest of this email is merely pondering the future, so not about
this patch in particular.)


But if we had a new, more general property for the range reported to
monitors via infoframes, then it would be worth to re-visit the design.
The HDR properties only set the infoframe and expect userspace to make
sure that the pixels actually correspond to what the infoframes tell
the monitor. One can't do HDR tone mapping automatically in the kernel,
so in that sense the HDR property behaviour is obvious. But which
behaviour would fit range property or others better, I'm not sure.

Generally there seems to be two approaches to designing KMS properties:

- Let userspace describe what data it has and what data should be sent
  to a monitor, and let the kernel driver magically come up with a
  conversion.

- Only userspace understands how the pixel data is encoded, and
  programs the transformations (DEGAMMA/CTM/GAMMA etc.) such, that the
  result is what a monitor expects based on e.g. infoframes.

Doing the former requires policy in the kernel. If there is a
specification that uniquely defines what the conversion is, this is
good. But if not or if there are artistic decisions to be made, like
with HDR tone mapping, then it doesn't work.

OTOH, the former approach allows the driver to use any and all hardware
features it has to realize the conversion, perhaps taking advantage of
even fixed-function hardware blocks. The latter approach is much harder
to map to hardware features.

This dilemma has been discussed in length in
https://lists.freedesktop.org/archives/dri-devel/2021-June/311689.html


Thanks,
pq

--Sig_/m=u2eOUlQuyIDelbKBjlgiP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDS51QACgkQI1/ltBGq
qqeBKw/+PoeZSjhutIb3s8nKAPEhWVVI4vJea4eC3RP32dtKCw5Xx3pjmwxGStXG
QCO7I6RIaTrfpg+PVgTZgxzwQ63rV9ZHyYfZE/cdmsF6/HkpAr14NQlKcYXvZPQX
bzo3/iAOBUEXP0GV+dfVWsTNOG4seXjUzqinE8mm+5qS/qLW18Oppkur7jjkgrmR
yQoLqMPIyPbwKnJZk3YGfnJpvZV6XF+1+kqJ3dwdC2LzdM0OCZ4lVcQalgxSiIBN
k+nDiqq6L/e26QTgOksWWbpSg9dhfldQwj7sneXY7BlvsiI4p+5M3AcSSCDZfcpF
6fhWwvMACKOOnQpV0uBx/n4wntItbpa6Vo7Dvq9DfWXWB+janj0aYRn/tmBZLnas
a67KCBHXzh6dod6CRdbP5oikcek4CkdjDODFF096xkX/2HHtp5E1XZ7IWNf651fW
SvlagflTwMjbiZcNxkctkKR7ITiLE+g5yl0rnfPb4NE1DS1NSlseZnwjV5NYEeld
4/1v5d4WoJlqxmT6UaXJd55e7nXFQ8IP3isaJFHVSvOzmOnLdzFa1km25Sn/cwJU
6QBed0xJ3+FX5MCikFiUFAGwQ4lqSbNjwqlcxyvUBlpUuXs8RYapvkUVqSMdecSM
OLc0HoFgIUPbNeNGV+2HZnBItWdCZrhu8qpKt4IABlBajK5DCq0=
=a8BZ
-----END PGP SIGNATURE-----

--Sig_/m=u2eOUlQuyIDelbKBjlgiP--
