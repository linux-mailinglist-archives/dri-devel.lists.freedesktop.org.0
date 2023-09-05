Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E837A792228
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 13:33:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2391110E4BF;
	Tue,  5 Sep 2023 11:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFB610E4BF;
 Tue,  5 Sep 2023 11:33:10 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-500b6456c7eso4217374e87.2; 
 Tue, 05 Sep 2023 04:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693913588; x=1694518388; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=cFOdI+rdaX09VGWuDgXaRSbXWgN9RO6WT284dnO3u8U=;
 b=jXbuHloB6sDXcmkJ0by+WRDGfgb25X2Cb2xOPyTSb5CsPW0aoz8qmSChP22pRLcNBs
 U6kkXCBFf/NfyqrLX6nlveWWb4tzaZZKKfj5QK+VWkvnEgVHZamFPB4BFfj7LwU8EUVt
 6XkJWkB2laIqKICTvM3eyxO8Q2v4SXeu3hKAG4kQ3MksBSBUdZ22qhiThVGvimsqVQkJ
 0IYyczcOg4IWDu3F4aMYFAgVPMZDRdbqretjviRgxQtzwekJMwd/VMv9vxmt0LMSIKpi
 Z2bVxI1me8YaHu5nEjLrRAzJGmlWc1pmjaNSFInBYjN+q6NbsTH4t2Ah4qQNXXT2lc5X
 lweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693913588; x=1694518388;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cFOdI+rdaX09VGWuDgXaRSbXWgN9RO6WT284dnO3u8U=;
 b=fsS3GFUz4ddhDhHacA7uSg02qD+sg0xDnEpzr1fnE+63eNi95ODqWG0OnP1Rlfk3TV
 Xyyrk8dWYEPW7S5PYXq+PI8dF5QI1ePjFzy8j4Ub5DxJewC/nyEJy27yLJZF+uAWC1T7
 uVakl1tPQn6vJ5llV0mbn9MgzyGfTw79+3B4fA9byeMR0FccI6nNvgVBvQLIGRm2oy2s
 3b8IfpV2yWri0YfWcMH6gaQIGuy9ZinasKgrLSRIPtvS1DvpO1U5nZg6YMNKxk+7flhP
 wH8xM6TtxVNAoytlBh3+EyjkJo+gNyRr/zd2tdgDF0KxgvpbU+Xth5XOrNWQUcB1kHxN
 HEmw==
X-Gm-Message-State: AOJu0YxbetZVbsLRnZXylE3uin4y4RUot3+1DFsNOhj0R1udzqd/nSLy
 8eM+LGK1jTS8+Luvov60eXk=
X-Google-Smtp-Source: AGHT+IFSCsDFJnQWVvitfQxdVVmlSDMFOZwDDVVkqrkMm5OFBqMObFEznHd9piwicAqWU7i3voGPAQ==
X-Received: by 2002:ac2:464d:0:b0:500:b9e3:91bd with SMTP id
 s13-20020ac2464d000000b00500b9e391bdmr8095825lfo.41.1693913588249; 
 Tue, 05 Sep 2023 04:33:08 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 x16-20020ac24890000000b004ffa451074dsm2306549lfc.50.2023.09.05.04.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 04:33:08 -0700 (PDT)
Date: Tue, 5 Sep 2023 14:33:05 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [RFC 02/33] drm: Add color operation structure
Message-ID: <20230905143305.6fa7017c@eldfell>
In-Reply-To: <IA1PR11MB634768E3C1B0F55ABD706F60F4E9A@IA1PR11MB6347.namprd11.prod.outlook.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
 <20230829160422.1251087-3-uma.shankar@intel.com>
 <20230830160019.19e67519@eldfell>
 <IA1PR11MB634768E3C1B0F55ABD706F60F4E9A@IA1PR11MB6347.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bL+SRg.t8Z_mqCwAgSR+6cA";
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Borah,
 Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/bL+SRg.t8Z_mqCwAgSR+6cA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 4 Sep 2023 14:10:05 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of =
Pekka
> > Paalanen
> > Sent: Wednesday, August 30, 2023 6:30 PM
> > To: Shankar, Uma <uma.shankar@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org; Borah, Chaitanya Kumar
> > <chaitanya.kumar.borah@intel.com>; dri-devel@lists.freedesktop.org; way=
land-
> > devel@lists.freedesktop.org
> > Subject: Re: [RFC 02/33] drm: Add color operation structure
> >=20
> > On Tue, 29 Aug 2023 21:33:51 +0530
> > Uma Shankar <uma.shankar@intel.com> wrote:
> >  =20
> > > From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > >
> > > Each Color Hardware block will be represented uniquely in the color
> > > pipeline. Define the structure to represent the same.
> > >
> > > These color operations will form the building blocks of a color
> > > pipeline which best represents the underlying Hardware. Color
> > > operations can be re-arranged, substracted or added to create distinct
> > > color pipelines to accurately describe the Hardware blocks present in
> > > the display engine.
> > >
> > > Co-developed-by: Uma Shankar <uma.shankar@intel.com>
> > > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > > ---
> > >  include/uapi/drm/drm_mode.h | 72
> > > +++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 72 insertions(+)
> > >
> > > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > > index ea1b639bcb28..882479f41745 100644
> > > --- a/include/uapi/drm/drm_mode.h
> > > +++ b/include/uapi/drm/drm_mode.h
> > > @@ -943,6 +943,78 @@ struct hdr_output_metadata {
> > >  	};
> > >  };
> > >
> > > +/**
> > > + * enum color_op_block
> > > + *
> > > + * Enums to identify hardware color blocks.
> > > + *
> > > + * @DRM_CB_PRE_CSC: LUT before the CTM unit
> > > + * @DRM_CB_CSC: CTM hardware supporting 3x3 matrix
> > > + * @DRM_CB_POST_CSC: LUT after the CTM unit
> > > + * @DRM_CB_3D_LUT: LUT hardware with coefficients for all
> > > + *                 color components
> > > + * @DRM_CB_PRIVATE: Vendor specific hardware unit. Vendor
> > > + *                  can expose a custom hardware by defining a
> > > + *                  color operation block with this name as
> > > + *                  identifier =20
> >=20
> > This naming scheme does not seem to work. It assumes a far too rigid pi=
peline,
> > just like the old KMS property design. What if you have two other opera=
tions
> > between PRE_CSC and CSC?
> >=20
> > What sense do PRE_CSC and POST_CSC make if you don't happen to have a C=
SC
> > operation? =20
>=20
> Sure, we can re-look at the naming. However, it will be good to define so=
me standard
> operations common to all vendors and keep the rest as vendor private.

My opinion is that these "names" should not even be an enum at all.

You're talking about operations, but operation is 'type', not 'name'.

There needs to be no pre-defined, hardcoded pipeline structure in the
UAPI design. Your naming scheme, and the old KMS color property design,
assume that there is such a rigid pre-defined structure that all
hardware and drivers must adhere to. That does not work.

Drivers need to be able to expose any arbitrary operations in any
arbitrary order in each pipeline, with no pre-determined or hinted
"intended use". We want to define the operations, and not say what they
should be used for. Usage examples are for accompanying documentation,
not API tokens.

This idea is at the core of the new color pipeline design we have been
discussing.

> > What if a driver put POST_CSC before PRE_CSC in its pipeline?
> >=20
> > What if your CSC is actually a series of three independent operations, =
and in
> > addition you have PRE_CSC and POST_CSC? =20
>=20
> We should try to standardized the operations as much as possible and leav=
e rest as
> vendor private. Current proposal allows us to do that.
>=20
> > 3D_LUT is an operation category, not a name. The same could be said abo=
ut
> > private. =20
>=20
> Sure, will fix this.
>=20
> > Given that all these are also UAPI, do we also need protect old userspa=
ce from
> > seeing values it does not understand? =20
>=20
> For the values userspace doesn't understand, it can ignore the blocks. We=
 should ensure
> that userspace always gets a clean state wrt color hardware state and no =
baggage from
> another client should be there. With that there is no burden of disabling=
 that particular
> block will be there on an older userspace.
>=20
> > > + */
> > > +enum color_op_block {
> > > +	DRM_CB_INVAL =3D -1,
> > > +
> > > +	DRM_CB_PRE_CSC =3D 0,
> > > +	DRM_CB_CSC,
> > > +	DRM_CB_POST_CSC,
> > > +	DRM_CB_3D_LUT,
> > > +
> > > +	/* Any new generic hardware block can be updated here */
> > > +
> > > +	/*
> > > +	 * PRIVATE is kept at 255 to make it future proof and leave
> > > +	 * scope for any new addition
> > > +	 */
> > > +	DRM_CB_PRIVATE =3D 255,
> > > +	DRM_CB_MAX =3D DRM_CB_PRIVATE,
> > > +};
> > > +
> > > +/**
> > > + * enum color_op_type
> > > + *
> > > + * These enums are to identify the mathematical operation that
> > > + * a hardware block is capable of.
> > > + * @CURVE_1D: It represents a one dimensional lookup table
> > > + * @CURVE_3D: Represents lut value for each color component for 3d
> > > +lut capable hardware
> > > + * @MATRIX: It represents co-efficients for a CSC/CTM matrix hardware
> > > + * @FIXED_FUNCTION: To enable and program any custom fixed function
> > > +hardware unit  */ enum color_op_type {
> > > +	CURVE_1D,
> > > +	CURVE_3D,
> > > +	MATRIX,
> > > +	FIXED_FUNCTION, =20
> >=20
> > My assumption was that a color_op_type would clearly and uniquely defin=
e the
> > mathematical model of the operation and the UABI structure of the param=
eter
> > blob. That means we need different values for uniform vs. exponentially=
 vs.
> > programmable distributed 1D LUT, etc. =20
>=20
> In the hardware the LUTS are programmed as they are received from userspa=
ce.
> So once the userspace gets to know the distribution of LUTS, segments, pr=
ecision,
> Number of lut samples, it can create the lut values to be programmed.
>=20
> This information on the distribution of luts in the hardware can be extra=
cted by the
> drm_color_lut_range structure which is exposed as blob in the hardware bl=
ock with
> TYPE set as CURVE_1D.

I was referring to the special cases like FIXED_FUNCTION and PRIVATE.
If you have an operation of type PRIVATE, you have no idea what it does
until you decipher 'private_flags', but you cannot decipher
'private_flags' until you know the driver name because it is
vendor-specific.

Userspace hates keying things off driver name. It means no other driver
can expose the same and expect userspace to just start using it. It
prevents an originally single-vendor feature to become a common
multi-vendor feature in future hardware generations without patching
every KMS client. Think about OpenGL or Vulkan: they have
vendor-specific extensions, but if another vendor implements the same,
they don't make up another extension but claim to support the original
one.

> > If there is a 1D curve with pre-programmed (fixed and named) curves, we=
 need to
> > enumerate all the curve types somehow. Probably each fixed curve type s=
hould
> > not be a different operation type, because that would explode the numbe=
r of
> > alternative pipelines. =20
>=20
> Exposing the lut distribution with drm_color_lut_range would do this job.

I'm talking about named fixed curves, PQ EOTF for example. You'd
probably put it in FIXED_FUNCTION.

Or are you suggesting that userspace should take the LUT
parameterisation from the driver and check if it happens to match PQ
EOTF close enough?

We really need (string) names for fixed curves, so that they can be
readily identified. Maybe Intel does not have them then, but AMD has.

> > A 3D curve in my mind is a function {x,y,z} =3D f(t), while I suspect y=
ou meant a 3D
> > LUT which is a {x,y,z} =3D f(t,u,v) - a 3-vector field in three dimensi=
onal space. =20
>=20
> Yes right, we can optimize and fine tune this.

I mean you used a wrong term. It's not a 3D curve when you have a 3D
LUT.

> > A matrix element could be with or without an offset vector I guess.
> >=20
> > FIXED_FUNCTION would need to be replaced with e.g. your example
> > VENDORXXX_BT602_TO_BT2020 to work.
> >
> > Have I missed something, how did you intend this to work? =20
>=20
> FIXED_FUNCTION is for some descriptive implementation. Some cases where
> Hardware just have a bit to enable and rest of the implementation is with=
in hardware.
> Since type is used for other general hardware blocks, its not intended to=
 cover vendor
> specific implementation and a private_flags are used instead.

As I've said, 'private_flags' cannot exist.


Thanks,
pq

>=20
> Thanks Pekka for the feedback.
>=20
> Regards,
> Uma Shankar
>=20
> >=20
> >=20
> > Thanks,
> > pq
> >  =20
> > > +};
> > > +
> > > +/**
> > > + * @struct drm_color_op
> > > + *
> > > + * This structure is used to represent the capability of
> > > + * individual color hardware blocks.
> > > + *
> > > + * @name: a standardized enum to identify the color hardware block
> > > + * @type: The type of mathematical operation it can perform
> > > + * @blob_id: Id pointing to a blob containing information about
> > > + *          the hardware block which advertizes its capabilities
> > > + *          to the userspace. It can be an optional field depending
> > > + *          on the members "name" and "type".
> > > + * @private_flags: This can be used to provide vendor specific hints
> > > + *                 to user space
> > > + */
> > > +struct drm_color_op {
> > > +	enum color_op_block name;
> > > +	enum color_op_type type;
> > > +	__u32 blob_id;
> > > +	__u32 private_flags;
> > > +};
> > > +
> > >  /**
> > >   * DRM_MODE_PAGE_FLIP_EVENT
> > >   * =20
>=20


--Sig_/bL+SRg.t8Z_mqCwAgSR+6cA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmT3EfEACgkQI1/ltBGq
qqf6Fw//VhCx4JjAlniTzgmd+YRkldsqKSWCrZoK/ctycv5FO8JMyN22Qip4IG9o
gnmdax4AIehI3Au0BFIRZC6jehAemlANbxmaxaqF0YyQGc228PqmCKwxIpUo0tdm
fpxZDldATsKTBMTTQX4zwnnW8RqJoPBjdOr5BwXdPMXYrAXte2iJ7slYYXHBrEF8
U8JlXM32hB3KcvvI9mAT+OiVXXq6Qb9GbPmPOV2qzeYnVwW7fmrBDkMPAav2Rbrq
MREhVFL8R/sAyc7EhhK7aGZXIdpTmmbjTYupmy/uG3mvN688kCoyzz9Vv4e5BwEd
VqM/OVjRfhwLrZD7IKiIfA3VUo+zkCJ3JyE7OtaBx6adga8HVzu4yLhn6WSd2+VG
vhS64PYpj/NviwRE2lXIGxTtKPNmKi/tet/y6fgtMrG0udaQ9hmJhuDOZV9aMdvS
iAO6SvHyNc3f/My+D7Dc9dG2CwdXhnmLX02HBd8OmjtITeOo8ninFNWDY1VotDYc
WxeQf66IysUoI3CNDIytF/lGAs9ZAgOkgv9tJ6Tuxr/6xi0vY7mcghfnkXMWGIaF
ja6vHJ2LIk2BIbYmdkR8fMXkHxeJvmlSKNv6IjbsdqIokOygcBLalKuYD7ZiWMBp
50PymG7/SaNTVaEH+QkMjICTibEZ88AsdS4g6/M4wYcbCXMwmD4=
=9PLs
-----END PGP SIGNATURE-----

--Sig_/bL+SRg.t8Z_mqCwAgSR+6cA--
