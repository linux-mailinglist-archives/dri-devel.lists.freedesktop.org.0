Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBE078D5E0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 14:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A67610E510;
	Wed, 30 Aug 2023 12:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8091610E510;
 Wed, 30 Aug 2023 12:28:46 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-5008faf4456so8763032e87.3; 
 Wed, 30 Aug 2023 05:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693398524; x=1694003324; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Uk9VznsW8tDVS2HinAy31fPvGlUZJTYzjF78uPskoRg=;
 b=s4O1KN48QuRm/mC0LSNsXmRNOKqxheeI2hfpVZRvCQZgNNI2Pl4J8jw1xINH0Zpatm
 H0bwF0P4GTyQhsVGDALvcwTTGzAJziObeYzWFgjTr23BEGlDZWobOnuIWfth9t410VXe
 wrr5hjvyGa3FAYRANNvQKy5okbN0GeY26PRQtjw+tcscpCuW/jP2QXp6ziY7JygW3NFo
 3PQ3EcTd5Mxy8coW2naasswb9FFsacmuafCsfwF8HwDtqCTSAlh54JCusbOzjXIDUKb/
 TV0rfsnjyaR2MD+ZXyFRTlJ6iuh22mK/SqjBWkXU1MGI8Pkl3TqjxbPfwFbXIoG4y+VS
 ZDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693398524; x=1694003324;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Uk9VznsW8tDVS2HinAy31fPvGlUZJTYzjF78uPskoRg=;
 b=lzgo10STEYpjp7qLYXzwUvi3JcQ33GG2uMbwsW5ZoXtnVR5JwpS0tkarCEpXrk2YBq
 uvSBsobAmUAqqpUMdeV7XOofIqqZTz5+3wzxQLLMMnIsPYIf/JhN/QITAFTN311moLv5
 veUoJhTDjFsfpEU0FhmhJI1w+ooOe4y0YmI33Nbl0yKc6JrBCIaSv3gDfX8gA9Iqlm2j
 iLCnCQYW1CIS7BJ4NYGxrh0Fvqr/MidZadW7X4ERdOVdQdQE2gYmuWawP11amoV/W7zf
 DXDuO+PnRmsltn+UtU/AzRuWgWfCZeRwFv5WEUILgW6xyKl1qKUqqQkxiVH3bzVitLHX
 WCbg==
X-Gm-Message-State: AOJu0YzAye1HYtCB1z/JOB7OllTBjoB77NI4Y334gX/IgkWP1CgjUYCc
 NJwwtmfRCQ7VN0FGAck5FIo=
X-Google-Smtp-Source: AGHT+IHupsDnRbpLNR23COo/F+nDyv43H4lKq7a6AE8FNEoejmMTXC35wq6a2A8fJQ085Jj/b+63Wg==
X-Received: by 2002:a05:6512:6f:b0:500:8022:3dc8 with SMTP id
 i15-20020a056512006f00b0050080223dc8mr1247676lfo.11.1693398523893; 
 Wed, 30 Aug 2023 05:28:43 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y3-20020ac24203000000b004fb326d4ff0sm2328699lfh.77.2023.08.30.05.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 05:28:43 -0700 (PDT)
Date: Wed, 30 Aug 2023 15:28:32 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [RFC 01/33] drm/doc/rfc: Add RFC document for proposed Plane
 Color Pipeline
Message-ID: <20230830152832.59312231@eldfell>
In-Reply-To: <PH7PR11MB6354303E054759387403CFF1F4E6A@PH7PR11MB6354.namprd11.prod.outlook.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
 <20230829160422.1251087-2-uma.shankar@intel.com>
 <73c0d398-63fe-4ce1-92db-f0f1f5e839a3@amd.com>
 <PH7PR11MB6354303E054759387403CFF1F4E6A@PH7PR11MB6354.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iBNS=Mx34mIFuIytfWdVovO";
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Borah,
 Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/iBNS=Mx34mIFuIytfWdVovO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Aug 2023 08:59:36 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: Harry Wentland <harry.wentland@amd.com>
> > Sent: Wednesday, August 30, 2023 1:10 AM
> > To: Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedesktop.o=
rg; dri-
> > devel@lists.freedesktop.org
> > Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; wayland-
> > devel@lists.freedesktop.org
> > Subject: Re: [RFC 01/33] drm/doc/rfc: Add RFC document for proposed Pla=
ne Color
> > Pipeline
> >=20
> >=20
> >=20
> > On 2023-08-29 12:03, Uma Shankar wrote: =20
> > > Add the documentation for the new proposed Plane Color Pipeline.
> > >
> > > Co-developed-by: Chaitanya Kumar Borah
> > > <chaitanya.kumar.borah@intel.com>
> > > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > ---
> > >   .../gpu/rfc/plane_color_pipeline.rst          | 394 +++++++++++++++=
+++
> > >   1 file changed, 394 insertions(+)
> > >   create mode 100644 Documentation/gpu/rfc/plane_color_pipeline.rst
> > >
> > > diff --git a/Documentation/gpu/rfc/plane_color_pipeline.rst
> > > b/Documentation/gpu/rfc/plane_color_pipeline.rst
> > > new file mode 100644
> > > index 000000000000..60ce515b6ea7
> > > --- /dev/null
> > > +++ b/Documentation/gpu/rfc/plane_color_pipeline.rst

...

Hi Uma!

> > > +This color pipeline is then packaged within a blob for the user space
> > > +to retrieve it. Details can be found in the next section
> > > + =20
> >=20
> > Not sure I like blobs that contain other blob ids. =20
>=20
> It provides flexibility and helps with just one interface to userspace. I=
ts easy to handle and
> manage once we get the hang of it =F0=9F=98=8A.
>=20
> We can clearly define the steps of parsing and data structures to be used=
 while interpreting
> and parsing the blobs.

Don't forget extendability. Possibly every single struct will need some
kind of versioning, and then it's not simple to parse anymore. Add to
that new/old kernel vs. old/new userspace, and it seems a bit
nightmarish to design.

Also since it's records inside a single blob, it's like a new file
format: every record needs a standard header that allows skipping it
appropriately if userspace does not understand it, or you need a
standard index telling where everything is. Making all records the same
size would waste space, and extendability requires variable size.

I also would not assume that we can declare a standard set of blocks
and that nothing else will be needed. The existing hardware is too
diverse for that from what I have understood. I assume that some
hardware have blocks unique to them, and they want to at least expose
that functionality through a UAPI that allows at least generic
enumeration of functionality, even if it needs specialized userspace
code to actually make use of.

If we go with

+struct drm_color_op {
+	enum color_op_block name;
+	enum color_op_type type;
+	u32 blob_id;
+	u32 private_flags;
+};

as in your proposal, I believe it can work (sorry, looking further
down, I have assumed too much of 'type'), but the enumerations will
become long, and the details blob_id is still specific to 'type'. This
is unavoidable, but we can still choose the form between blobs and
properties, integers and strings.

I have a feeling that introspection will be valuable here, to help
people understand what their hardware could do if they had the code to
use it. 'name' and 'type' being integers require a translation table to
strings before they are readable, and it would be best if the kernel
itself provided that translation.

I don't understand how 'private_flags' could be useful. There must not
be any "hidden" features. Everything a block can be programmed to do
via this UAPI must be clearly documented, there cannot be anything
private. If two hardware versions of a block differ in a meaningful or
significant way, they need to be exposed as different types of blocks.

OTOH, if one goes with a (new) DRM object with string named properties
model, all that struct versioning and file format hassle has mostly a
clear and well-understood solution. We only need to define the rules of
how userspace needs to deal with properties or values it does not
understand, so that the kernel can keep adding more.

Therefore, I'm not yet convinced with the "all blobs" design.

> > > +Exposing a color pipeline to user space
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +To advertise the available color pipelines, an immutable ENUM
> > > +property "GET_COLOR_PIPELINE" is introduced.
> > > +This enum property has blob id's as values. With each blob id
> > > +representing a distinct color pipeline based on underlying HW
> > > +capabilities and their respective combinations.
> > > +
> > > +The following output of drm_info [1], shows how color pipelines are
> > > +visible to userspace.
> > > +
> > > +=E2=94=9C=E2=94=80=E2=94=80=E2=94=80Plane 0
> > > +    =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Object ID: 31
> > > +    =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80CRTCs: {0}
> > > +    =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80Legacy info
> > > +        ...
> > > +    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"GET_COLOR_P=
IPELINE" (immutable): enum {no color pipeline,
> > > +						color pipeline 1, color pipeline 2}=3D =20
> > no color pipeline =20
> > > +
> > > +To understand the capabilities of individual pipelines, first the
> > > +userspace need to retrieve the pipeline blob with the blob ids
> > > +retrieved by reading the enum property.
> > > +
> > > +Once the color pipeline is retrieved, user can then parse through
> > > +individual drm_color_op blocks to understand the capabilities of each
> > > +hardware block.
> > > +
> > > +Check IGT series to see how user space can parse through color pipel=
ines.
> > > +Refer the IGT series here:
> > > +https://patchwork.freedesktop.org/series/123018/
> > > +
> > > +Setting up a color pipeline
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > +
> > > +Once the user space decides on a color pipeline, it can set the
> > > +pipeline and the corresponding data for the hardware blocks within
> > > +the pipeline with the BLOB property "SET_COLOR_PIPELINE".
> > > +
> > > +To achieve this two structures are introduced
> > > +
> > > +1.	struct drm_color_op_data: It represents data to be passed onto in=
dividual
> > > +							  color hardware blocks. It =20
> > contains three members =20
> > > +                      a) name: to identify the color operation block
> > > +                      b) blob_id: pointing to the blob with data for=
 the
> > > +                                  corresponding hardware block
> > > +
> > > +	struct drm_color_op_data {
> > > +		enum color_op_block name;

Why is this a global fixed enum rather than a pipeline specific ordinal
or a unique-per-device ID?

There is no reason to believe that a 'name' always matches a hardware
block 1:1. When drivers accumulate multiple different alternative
pipelines due to backwards-compatibility reasons, the same 'name' could
be implemented by different hardware blocks, or the same hardware block
could implement different 'name's from different pipelines.

The names have also a problem. If you name something "pre-csc", then
how do you name the thing that the next hardware version adds between
"pre-csc" and "csc"?

> > > +		u32 blob_id;
> > > +	};
> > > +
> > > +2.	struct drm_color_pipeline: This structure represents the aggregate
> > > +                                   pipeline to be set. it contains t=
he following  members
> > > +					  a) num: pipeline number to be selected
> > > +					  b) size: size of the data to be passed onto =20
> > the driver =20
> > > +					  c) data: array of struct =20
> > drm_color_op_data with data for =20
> > > +                                                   the hardware bloc=
k/s that userspace wants to
> > > +                                                   set values for.
> > > +
> > > +	struct drm_color_pipeline {
> > > +		int num;
> > > +		int size;
> > > +		struct drm_color_op_data *data;
> > > +	};
> > > +
> > > +	User can either:
> > > +	1. send data for all the color operations in a pipeline as shown in=
 [2].
> > > +	   The color operation data need not be in order that the pipeline =
advertises
> > > +	   however, it should not contain data for any
> > > +	   color operation that is not present in the pipeline.
> > > +
> > > +	   Note: This check for pipeline is not yet implemented but if the
> > > +	   wider proposal is accepted we have few solutions in mind.
> > > +
> > > +	2. send data for a subset of color operations as shown in [3].For t=
he
> > > +	   color operation that userspace does not send data will retain th=
eir
> > > +	   older state.

Retaining existing state, especially for operations that userspace does
not understand, can lead to incorrect and unexpected results. That's
why I say that userspace must understand all operations in a pipeline,
and all parameters of all used operations before it can actually use
that pipeline.

Otherwise we have the same problem as KMS properties have in general
today: when new things are added that userspace does not understand,
how will the userspace be able to maintain its old behaviour?

That question has two answers today:
- userspace learns to program everything, and accidentally
  (mal)functions until then
- you do not switch between KMS clients that might leave incorrect
  state in not-understood properties

Neither is a good answer, and the problem does not seem to have any
practical traction either.

For color pipelines I hope we can, and believe that we must, do better
to maintain correct behaviour while extending functionality.

> > > +
> > > +	3. reset/disable the pipeline by setting the "SET_COLOR_PIPELINE" b=
lob
> > > +	   property to NULL as shown in both [2] and [3]
> > > +

Is it a reset and disable, or only disable?

How is the reset state defined, if that state becomes active when the
pipeline is next enabled and data not set for the operations?

> > > +	4. change the color pipeline as demonstrated in [3].
> > > +	   On the new pipeline, the user is expected to setup all the color=
 hardware =20
> > block =20
> > > +	   Once the user requests a pipeline change, the driver will provid=
e it a clean =20
> > slate =20
> > > +           which means that all the data previously set by the user =
will be discarded =20
> > even if =20
> > > +           there are common hardware blocks between the two(previous=
 and current) =20
> > pipelines. =20
> > > +

Yes, alternative pipelines need to be completely independent.

> > > +IGT implementation can be found here [4]
> > > +
> > > +Representing Fixed function hardware
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +To provide support for fixed function hardware, the driver could
> > > +expose vendor specific struct drm_color_op with parameters that both
> > > +the userspace and driver agrees on. To demonstrate, let's consider a
> > > +hyphothetical fixed function hardware block that converts BT601 to B=
T2020.
> > > +The driver can choose to advertise the block as such.
> > > +
> > > +struct drm_color_op color_pipeline_X[] =3D {
> > > +	{
> > > +		.name =3D DRM_CB_PRIVATE,

What if the hardware has 5 different custom blocks like this, multiple
in the same pipeline. How do you 'name' them?

> > > +		.type =3D FIXED_FUNCTION,

I have been assuming that 'type' uniquely defines both the operation and
the contents of the parameter blob, but this does not look like it.
What defines the operation and the parameters?

> > > +		.blob_id =3D 45;
> > > +	},
> > > +}
> > > +
> > > +Where the blob represents some vendor specific enums, strings or any
> > > +other appropriate data types which both the user-space and drivers a=
re aligned =20
> > on. =20

We have a word for that "data ... aligned on": UAPI.

> > > +
> > > +blob:45 {
> > > +	VENDORXXX_BT602_TO_BT2020,

Repeating the question from above, how will userspace know that the
contents of this blob need to be VENDORXXX_BT602_TO_BT2020 and not
something else?

> > > +};
> > > +
> > > +For enabling or passing parameters to such blocks, the user can send
> > > +data to the driver wrapped within a blob like any other color operat=
ion block.
> > > +
> > > +	struct drm_color_op_data {
> > > +		.name =3D DRM_CB_PRIVATE;
> > > +		.blob_id =3D 46;
> > > +	} ;
> > > +
> > > +where blob with id 46 contains data to enable the fixed function har=
dware(s).
> > > + =20
> >=20
> > One major thing missing from the RFC is an explanation on why we want t=
o go with a
> > prescriptive model, rather than a descriptive model. This question came=
 up in Dave's
> > response to Simon's RFC:
> > https://lore.kernel.org/dri-
> > devel/CAPM=3D9tz54Jc1HSjdh5A7iG4X8Gvgg46qu7Ezvgnmj4N6gbY+Kw@mail.gmail.=
co
> > m/
> >=20
> > This is a rough attempt at such an explanation:
> > https://gitlab.freedesktop.org/hwentland/linux/-
> > /merge_requests/5/diffs?commit_id=3Dbc99737623796b39925767d6f8cbc097ad0=
b4d
> > 8d =20

Hey Harry, that's a good piece!

>=20
> Sure Harry, totally agree to this and will include in documentation to hi=
ghlight the rationale
> of going with prescriptive model.

Uma, the cover letter had descriptive and prescriptive mixed up.


Thanks,
pq

> > Harry
> >  =20
> > > +References
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +[1] https://gitlab.freedesktop.org/emersion/drm_info
> > > +[2]
> > > +https://patchwork.freedesktop.org/patch/554827/?series=3D123018&rev=
=3D1
> > > +[3]
> > > +https://patchwork.freedesktop.org/patch/554826/?series=3D123018&rev=
=3D1
> > > +[4] https://patchwork.freedesktop.org/series/123018/ =20


--Sig_/iBNS=Mx34mIFuIytfWdVovO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTvNfAACgkQI1/ltBGq
qqcfqA//T99VZLwbtrMHXgeCHb4HgaJz+B3lKX90Bx1gkiTmQLkYvdZCqglPQ/uk
z4wzvy7a9abUesCSGw1eZmOnRBnDZpGx7cjRCL7vXowr48r97HNX4Zw2l8Doiahb
vW7pIgYLIhDizXztOHE/AX3J+BTOjWEyvk827nviToa3+XlRCN5cecScGxeeb5xj
SgQQhP9Cxt/WLO0VrNQXA2A/m1m01os0mDk017AA5wgLcRqBA99JMcRunkcuJytw
BYyDA0o0lli3tVrzo/6vo9kt9qwcPgjCRrFGVtwa/VIl9HwyIUn8x8J8+UJWQx6Y
Ov3ZVBZnqjRRFrMDICAIuWiUfcXFRC9yDyvyA9ojrIGSfnIgsmg7Qt3t2Y9AH2pV
zGY95eMDHFZRNUwWwZpYGQ0r++hqGxBS/Lx9DZfViaMZJWSRWVcUQnkB0chBUrTz
vFfutU8yJZIfY9sXWBCwVFAR5a2EKWVaWQVBIH+aSvyJD9vordxKVgcDEhyxo4+O
5qaqvLpsFjzAVVUTHCu+EasGluVI1j6b9iD3+nAWhuy7WcgKEnC2m4KPHPufucuG
LjCQTWzGYjQqGDgGFvBo5ofcwy6kgPuVmQDSdjwzBB1Y7VHaQ+Cm0XrDEHKsHE/c
UbfI9LBWIC+PuRZfmFUwipZAG2BfFWA7AbPpvtqFSwxEz74nRFI=
=ERqD
-----END PGP SIGNATURE-----

--Sig_/iBNS=Mx34mIFuIytfWdVovO--
