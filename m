Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E03B18DA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 13:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ECE16E8BF;
	Wed, 23 Jun 2021 11:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2F46E8CA;
 Wed, 23 Jun 2021 11:27:05 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id u13so3545196lfk.2;
 Wed, 23 Jun 2021 04:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=xd2+3DATtHs1Io2NqAuv+460BtqKv5ZcSCJ7BTgVstU=;
 b=bEozGw9h+Nkl9Uzk4zzTS6fDAz0+MNgA39lpThBdjuM++/ghsOB4DjopvJ5PHTGDHR
 STtdly5fWmJbrMJYtGP7+Akj8qFdGQPKDO//gOx0adP6YXAZGaAw6fXjPWU3l0WHhcCB
 Ff9sRqBS5JoEePIzTDt1MJ+lMCiWMlT3LXHuATczr6cdvEdXWx/YkV2HATTDwcaNhI+8
 wvXE2aSjF7wbc6Wi6KshLemE32ELVBObyUOG+0g8ZaZIf4aITPZY5c94Elq1W6QMMF1l
 1yMTJaGS3wRy1tCPvEvQw6gZgTkZWmkkxRc/UMDO2zxMtM1yX73VztbyAZ+mr1oBjQn5
 Gtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=xd2+3DATtHs1Io2NqAuv+460BtqKv5ZcSCJ7BTgVstU=;
 b=hrX2wS7fUnVGq2GALb8qRoWpV6y/Sqi4eIcFOLG+6sjeygN8tKeNmVz5Hw94r51s/7
 PJjGMKHLPpA64hkbThAEt8AM2rrOhoYpIV9Xj7L7P8/9twym43u1RKA/Eyh0Mwo/g5dd
 IsJcbYcQB6iI/ORoP9qxCLZv/M86Qd2oF5BJ444lYcaxx95yv/FhLul7WMz08i76JZFb
 J7BgHNcesjeDHBQs6QL6gnJGIzCkWnMHLvy2u2JwQIqEpvXMXrvEUV0U7I3USUdQst05
 hyPw05x1RAMTweMcGD0/9iPaUV4KqDZM5af79h4mK/enPjSgE8yl0zdradvtwuOJVlN+
 kzgA==
X-Gm-Message-State: AOAM531e732fdvPUDIN+ucHAsdMt9KhCQyMJvLL4fXW/0SgSNomsR1Qa
 pBwy9aiMuYjvamGkT0aJKag=
X-Google-Smtp-Source: ABdhPJwZBX1ioJBa+Jg9KYidfHuap4/UvlzTR5mpBV9gHC2QBx0lfo8x94Mre7KVNM002ftXTbuhEw==
X-Received: by 2002:a05:6512:308a:: with SMTP id
 z10mr6646754lfd.148.1624447623333; 
 Wed, 23 Jun 2021 04:27:03 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id a21sm289030ljj.21.2021.06.23.04.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 04:27:03 -0700 (PDT)
Date: Wed, 23 Jun 2021 14:26:59 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH v4 15/17] drm/uAPI: Move "Broadcast RGB" property from
 driver specific to general context
Message-ID: <20210623142659.16672192@eldfell>
In-Reply-To: <2fc0547c-2968-1f52-4c07-82be58a41ef8@tuxedocomputers.com>
References: <20210618091116.14428-1-wse@tuxedocomputers.com>
 <20210618091116.14428-16-wse@tuxedocomputers.com>
 <20210622102529.5266e87b@eldfell>
 <70d89fe2-4e45-7ea9-2509-15257ef222f8@tuxedocomputers.com>
 <20210623104836.77734bad@eldfell>
 <2fc0547c-2968-1f52-4c07-82be58a41ef8@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hGX2jX8_vX=xEpb.UGXUxgp";
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
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, rodrigo.vivi@intel.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/hGX2jX8_vX=xEpb.UGXUxgp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Jun 2021 12:10:14 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Am 23.06.21 um 09:48 schrieb Pekka Paalanen:
> > On Tue, 22 Jun 2021 11:57:53 +0200
> > Werner Sembach <wse@tuxedocomputers.com> wrote:
> > =20
> >> Am 22.06.21 um 09:25 schrieb Pekka Paalanen: =20
> >>> On Fri, 18 Jun 2021 11:11:14 +0200
> >>> Werner Sembach <wse@tuxedocomputers.com> wrote:
> >>>   =20
> >>>> Add "Broadcast RGB" to general drm context so that more drivers besi=
des
> >>>> i915 and gma500 can implement it without duplicating code.
> >>>>
> >>>> Userspace can use this property to tell the graphic driver to use fu=
ll or
> >>>> limited color range for a given connector, overwriting the default
> >>>> behaviour/automatic detection.
> >>>>
> >>>> Possible options are:
> >>>>     - Automatic (default/current behaviour)
> >>>>     - Full
> >>>>     - Limited 16:235
> >>>>
> >>>> In theory the driver should be able to automatically detect the moni=
tors
> >>>> capabilities, but because of flawed standard implementations in Moni=
tors,
> >>>> this might fail. In this case a manual overwrite is required to not =
have
> >>>> washed out colors or lose details in very dark or bright scenes.
> >>>>
> >>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> >>>> ---
> >>>>  drivers/gpu/drm/drm_atomic_helper.c |  4 +++
> >>>>  drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++
> >>>>  drivers/gpu/drm/drm_connector.c     | 43 ++++++++++++++++++++++++++=
+++
> >>>>  include/drm/drm_connector.h         | 16 +++++++++++
> >>>>  4 files changed, 67 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/d=
rm_atomic_helper.c
> >>>> index 90d62f305257..0c89d32efbd0 100644
> >>>> --- a/drivers/gpu/drm/drm_atomic_helper.c
> >>>> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> >>>> @@ -691,6 +691,10 @@ drm_atomic_helper_check_modeset(struct drm_devi=
ce *dev,
> >>>>  			if (old_connector_state->preferred_color_format !=3D
> >>>>  			    new_connector_state->preferred_color_format)
> >>>>  				new_crtc_state->connectors_changed =3D true;
> >>>> +
> >>>> +			if (old_connector_state->preferred_color_range !=3D
> >>>> +			    new_connector_state->preferred_color_range)
> >>>> +				new_crtc_state->connectors_changed =3D true;
> >>>>  		}
> >>>> =20
> >>>>  		if (funcs->atomic_check)
> >>>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm=
_atomic_uapi.c
> >>>> index c536f5e22016..c589bb1a8163 100644
> >>>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> >>>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> >>>> @@ -798,6 +798,8 @@ static int drm_atomic_connector_set_property(str=
uct drm_connector *connector,
> >>>>  		state->max_requested_bpc =3D val;
> >>>>  	} else if (property =3D=3D connector->preferred_color_format_prope=
rty) {
> >>>>  		state->preferred_color_format =3D val;
> >>>> +	} else if (property =3D=3D connector->preferred_color_range_proper=
ty) {
> >>>> +		state->preferred_color_range =3D val;
> >>>>  	} else if (connector->funcs->atomic_set_property) {
> >>>>  		return connector->funcs->atomic_set_property(connector,
> >>>>  				state, property, val);
> >>>> @@ -877,6 +879,8 @@ drm_atomic_connector_get_property(struct drm_con=
nector *connector,
> >>>>  		*val =3D state->max_requested_bpc;
> >>>>  	} else if (property =3D=3D connector->preferred_color_format_prope=
rty) {
> >>>>  		*val =3D state->preferred_color_format;
> >>>> +	} else if (property =3D=3D connector->preferred_color_range_proper=
ty) {
> >>>> +		*val =3D state->preferred_color_range;
> >>>>  	} else if (connector->funcs->atomic_get_property) {
> >>>>  		return connector->funcs->atomic_get_property(connector,
> >>>>  				state, property, val);
> >>>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_c=
onnector.c
> >>>> index aea03dd02e33..9bc596638613 100644
> >>>> --- a/drivers/gpu/drm/drm_connector.c
> >>>> +++ b/drivers/gpu/drm/drm_connector.c
> >>>> @@ -905,6 +905,12 @@ static const struct drm_prop_enum_list drm_acti=
ve_color_format_enum_list[] =3D {
> >>>>  	{ DRM_COLOR_FORMAT_YCRCB420, "ycbcr420" },
> >>>>  };
> >>>> =20
> >>>> +static const struct drm_prop_enum_list drm_preferred_color_range_en=
um_list[] =3D {
> >>>> +	{ DRM_MODE_COLOR_RANGE_UNSET, "Automatic" },
> >>>> +	{ DRM_MODE_COLOR_RANGE_FULL, "Full" },
> >>>> +	{ DRM_MODE_COLOR_RANGE_LIMITED_16_235, "Limited 16:235" },   =20
> >>> Hi,
> >>>
> >>> the same question here about these numbers as I asked on the "active
> >>> color range" property.
> >>>   =20
> >>>> +};
> >>>> +
> >>>>  static const struct drm_prop_enum_list drm_active_color_range_enum_=
list[] =3D {
> >>>>  	{ DRM_MODE_COLOR_RANGE_UNSET, "Unknown" },
> >>>>  	{ DRM_MODE_COLOR_RANGE_FULL, "Full" },
> >>>> @@ -1243,6 +1249,13 @@ static const struct drm_prop_enum_list dp_col=
orspaces[] =3D {
> >>>>   *	drm_connector_attach_active_color_format_property() to install t=
his
> >>>>   *	property.
> >>>>   *
> >>>> + * Broadcast RGB:
> >>>> + *	This property is used by userspace to change the used color rang=
e. When
> >>>> + *	used the driver will use the selected range if valid for the cur=
rent
> >>>> + *	color format. Drivers to use the function
> >>>> + *	drm_connector_attach_preferred_color_format_property() to create=
 and
> >>>> + *	attach the property to the connector during initialization.   =20
> >>> An important detail to document here is: does userspace need to
> >>> take care that pixel data at the connector will already match the set
> >>> range, or will the driver program the hardware to produce the set ran=
ge?   =20
> >> Since until now, the userspace didn't even know for sure if RGB or YCb=
Cr and therefore which full/limited format was
> >> used I guess it's all kernel space conversion. =20
> >>> If the former, then I'm afraid the preference/active property pair
> >>> design does not work. Userspace needs to make sure the content is in
> >>> the right range, so the driver cannot second-guess that afterwards.
> >>>
> >>> If the latter, then what does the driver assume about color range just
> >>> before the automatic conversion to the final color range, and does the
> >>> range conversion happen as the final step in the color pipeline?
> >>>
> >>> If I remember the discussion about Intel right, then the driver does
> >>> the latter and assume that userspace programs KMS to always produce
> >>> full range pixels. There is no provision for userspace to produce
> >>> limited range pixels, IIRC.   =20
> >> I think I remember this too from an answer to one of the revisions of =
this patchset. =20
> > As long as you keep the old KMS property as is, just moving code so it
> > is used by more drivers, this is fine and one can't do otherwise anyway.
> >
> > (The rest of this email is merely pondering the future, so not about
> > this patch in particular.)
> >
> >
> > But if we had a new, more general property for the range reported to
> > monitors via infoframes, then it would be worth to re-visit the design.
> > The HDR properties only set the infoframe and expect userspace to make
> > sure that the pixels actually correspond to what the infoframes tell
> > the monitor. One can't do HDR tone mapping automatically in the kernel,
> > so in that sense the HDR property behaviour is obvious. But which
> > behaviour would fit range property or others better, I'm not sure.
> >
> > Generally there seems to be two approaches to designing KMS properties:
> >
> > - Let userspace describe what data it has and what data should be sent
> >   to a monitor, and let the kernel driver magically come up with a
> >   conversion.
> >
> > - Only userspace understands how the pixel data is encoded, and
> >   programs the transformations (DEGAMMA/CTM/GAMMA etc.) such, that the
> >   result is what a monitor expects based on e.g. infoframes. =20
>=20
> Why not both?

Because "both" means you have overlapping sets of properties that might
contradict each other. Or then you need a switch between the two models.

> This patchset is thought to control what's happening "on the cable",
> so if the input data is in a different format, the kernel has to
> convert it.

Right, if that is the desired semantics.

That's not how the HDR property works. Kernel does not convert there.
The HDR property only sets infoframes that the monitor interprets.

> Maybe in the future there could be an additional set of "input-"
> properties. aka "input bpc", "input color format", and "input color
> range". With an additional constraint that if "input-" property =3D=3D
> "active-" property the kernel is not allowed to do any conversion
> regarding this aspect, giving userspace full control if wanted.

If by "input" you mean "the result from userspace provided content
going through the configured KMS pixel pipeline", then yes. But it's
hard to put it into words accurately.

The FB could contain whatever which userspace then programs DEGAMMA and
CTM to produce what would be the "input" pixels for example.

This is getting closer to the "abstract KMS pipeline" idea which has
been predicted to fall apart in the email thread linked below.

> > Doing the former requires policy in the kernel. If there is a
> > specification that uniquely defines what the conversion is, this is
> > good. But if not or if there are artistic decisions to be made, like
> > with HDR tone mapping, then it doesn't work.
> >
> > OTOH, the former approach allows the driver to use any and all hardware
> > features it has to realize the conversion, perhaps taking advantage of
> > even fixed-function hardware blocks. The latter approach is much harder
> > to map to hardware features.
> >
> > This dilemma has been discussed in length in
> > https://lists.freedesktop.org/archives/dri-devel/2021-June/311689.html
> >

Thanks,
pq

--Sig_/hGX2jX8_vX=xEpb.UGXUxgp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDTGoMACgkQI1/ltBGq
qqdOSA//SgoOVw9niMLEzk2p1ki4oxn38LLDp3AbI/QGk3b1jS01sQXnIwH/cvLu
wsiaHJ5ijHStH4cxsyHUWKXnxHcfVh9dQOD5O4ZEYcTPPan1UXI7DQKukLt4S/QJ
h/k+dbGC5cLyiQkn6Q91D++LQit98y/K8jBq51x0kfG3Kzj3xafftE9a0DZ708vG
yhkuzpkh5cTsVKtGReaWCji8OhTpNOe8OHZczk3Qiivwzm6hZPY6HwchNceF8uMV
sIxxB9QJneMNoIZ3/AI8coi5zhzzCCyt/cwxj4EsmkhLcYDc7gvS0WBnsFxQsNRO
IIjHChd0MUdpnnvzK+wKo48qm0ZM83ImnRrNlz3vMlU8TrRdLOU7uBM/QPOmUHLO
t4djr2INSHwKxClctx8v5C/ekBAu0eBddAcrQoe9P+wnqtYw1AwLie8oMg9Pgb4I
d0Wrlbu8k/qhkpLOgQAMlqhbOj73lQYxQsNmqaLggkwF9Ffxu1MtjWukKl5gSSxs
sSUwNOPPM/of+L7w4dkGvy4EwJfQki7gYr5UI01Dbm0Pd9JLRf+ASZf+SPIiEPhh
NbMS6ss6EKqJZGuaZ+/wiyJiF1zWtTRCp0jeDpd3xGiBkD3vpAmG8bUfioNZTgrd
FKnPDcRy3RvY/O0k2vpePfIgK6cdC4EdpT+bfn/DHZ0q8KFLkj4=
=ur7D
-----END PGP SIGNATURE-----

--Sig_/hGX2jX8_vX=xEpb.UGXUxgp--
