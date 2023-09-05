Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2ED79222C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 13:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C2A10E4C9;
	Tue,  5 Sep 2023 11:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E284310E4C7;
 Tue,  5 Sep 2023 11:33:31 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50091b91a83so3967258e87.3; 
 Tue, 05 Sep 2023 04:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693913610; x=1694518410; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=SG7RSvnGFKvBh7UIfUhp/GS8EnpXHaH94pS/gImK1Gg=;
 b=NtZnNegiz19b3d5HG/jWIYkpqvP8lJXN9V9dZAie6tX0QK9+VgYnFRzq/0DGapGznF
 CYZfftl/HMulXNaMjNly1/rW8bdI0f2c/U4GqfIOXirWamCHKriTnHwdO6ppCSX2gjGO
 NKOI43Lso91HHSpVj6864rze6LDvCl3qaVPFyWJd+dvLj4GssSVJCstQH5+AohgaEAIp
 DtZgHZ6EVGoDHKffSwhnFHt1F5jHuKFUx439UqaRTj0fGmqi0r2mRgg/ZD0ftN/DHmeo
 EsMbrKR63f/iSGBm++1issBufiCXHJRZkPFHYEcFsdOALJJxboSPa/DcULiWPTVNVfMp
 ttNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693913610; x=1694518410;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SG7RSvnGFKvBh7UIfUhp/GS8EnpXHaH94pS/gImK1Gg=;
 b=mIrOG6LsnNnCrwwnQ/w+Bg6I+8tOzAEoB38mydTKjybZbigllArmKejWlNtMxUU9yh
 timHNJ11QSFEdyJloPgmGhY3vPEadlHHdNsk4kZnfXuAsJdZeN6SKATfk9O8vgs+QssM
 iQmOxJwb0FXvMsf96E40494F+yFSIXwnB683T9Zc3g1zi1OgY7oh1rGOtFD3ABJW7sNk
 HwPWQ0tvJbH10+8pl/xX2J3Gx+S7Enh1D+V3O8ZGQNz7wdMTPAcempXoUnIgaC6gYCrQ
 paOYS8hPer51IWkE30QPbYNHzp6sR8udlEdJWJ7UNDQj1rD3aWOCWcokqsr5hlqWN4Vc
 jrZw==
X-Gm-Message-State: AOJu0YzGOII3zV/vhGqQRuNOhwsP18tKjJ+FQZLkFqtyE1k0Iw3lvVVm
 qY9RL/ap4AgNYeZ612tFrxc=
X-Google-Smtp-Source: AGHT+IHBvPyugnYAFOQtrZSwmc7M5cmxcnf88jsZsX86ny4930Mzw/nbvxd09qXgy6uGyhXLcDkZyA==
X-Received: by 2002:a19:6402:0:b0:4f8:770f:1b01 with SMTP id
 y2-20020a196402000000b004f8770f1b01mr7106976lfb.19.1693913609703; 
 Tue, 05 Sep 2023 04:33:29 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 a28-20020ac2521c000000b004ff6fa3f038sm2318136lfl.144.2023.09.05.04.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 04:33:29 -0700 (PDT)
Date: Tue, 5 Sep 2023 14:33:26 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [RFC 00/33] Add Support for Plane Color Pipeline
Message-ID: <20230905143326.38fe5170@eldfell>
In-Reply-To: <IA1PR11MB63470B60E59FF5F359F6D4A6F4E9A@IA1PR11MB6347.namprd11.prod.outlook.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
 <dbde0306-cc10-420f-a663-663481e127e2@amd.com>
 <PH7PR11MB63548CC6A606C9DD183B5954F4E6A@PH7PR11MB6354.namprd11.prod.outlook.com>
 <20230830211536.GA243703@toolbox>
 <IA1PR11MB63470B60E59FF5F359F6D4A6F4E9A@IA1PR11MB6347.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rSMciiXJunowv=uMdpT=WcM";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/rSMciiXJunowv=uMdpT=WcM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 4 Sep 2023 14:29:56 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: Sebastian Wick <sebastian.wick@redhat.com>
> > Sent: Thursday, August 31, 2023 2:46 AM
> > To: Shankar, Uma <uma.shankar@intel.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>; intel-
> > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; wayland-
> > devel@lists.freedesktop.org; Ville Syrjala <ville.syrjala@linux.intel.c=
om>; Pekka
> > Paalanen <pekka.paalanen@collabora.com>; Simon Ser <contact@emersion.fr=
>;
> > Melissa Wen <mwen@igalia.com>; Jonas =C3=85dahl <jadahl@redhat.com>; Sh=
ashank
> > Sharma <shashank.sharma@amd.com>; Alexander Goins <agoins@nvidia.com>;
> > Naseer Ahmed <quic_naseer@quicinc.com>; Christopher Braga
> > <quic_cbraga@quicinc.com>
> > Subject: Re: [RFC 00/33] Add Support for Plane Color Pipeline
> >=20
> > On Wed, Aug 30, 2023 at 08:47:37AM +0000, Shankar, Uma wrote: =20
> > >
> > > =20
> > > > -----Original Message-----
> > > > From: Harry Wentland <harry.wentland@amd.com>
> > > > Sent: Wednesday, August 30, 2023 12:56 AM
> > > > To: Shankar, Uma <uma.shankar@intel.com>;
> > > > intel-gfx@lists.freedesktop.org; dri- devel@lists.freedesktop.org
> > > > Cc: wayland-devel@lists.freedesktop.org; Ville Syrjala
> > > > <ville.syrjala@linux.intel.com>; Pekka Paalanen
> > > > <pekka.paalanen@collabora.com>; Simon Ser <contact@emersion.fr>;
> > > > Melissa Wen <mwen@igalia.com>; Jonas =C3=85dahl <jadahl@redhat.com>;
> > > > Sebastian Wick <sebastian.wick@redhat.com>; Shashank Sharma
> > > > <shashank.sharma@amd.com>; Alexander Goins <agoins@nvidia.com>;
> > > > Naseer Ahmed <quic_naseer@quicinc.com>; Christopher Braga
> > > > <quic_cbraga@quicinc.com>
> > > > Subject: Re: [RFC 00/33] Add Support for Plane Color Pipeline
> > > >
> > > > +CC Naseer and Chris, FYI
> > > >
> > > > See https://patchwork.freedesktop.org/series/123024/ for whole seri=
es.
> > > >
> > > > On 2023-08-29 12:03, Uma Shankar wrote: =20
> > > > > Introduction
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >
> > > > > Modern hardwares have various color processing capabilities both
> > > > > at pre-blending and post-blending phases in the color pipeline.
> > > > > The current drm implementation exposes only the post-blending
> > > > > color hardware blocks. Support for pre-blending hardware is missi=
ng.
> > > > > There are multiple use cases where pre-blending color hardware
> > > > > will be
> > > > > useful:
> > > > > 	a) Linearization of input buffers encoded in various transfer
> > > > > 	   functions.
> > > > > 	b) Color Space conversion
> > > > > 	c) Tone mapping
> > > > > 	d) Frame buffer format conversion
> > > > > 	e) Non-linearization of buffer(apply transfer function)
> > > > > 	f) 3D Luts
> > > > >
> > > > > and other miscellaneous color operations.
> > > > >
> > > > > Hence, there is a need to expose the color capabilities of the
> > > > > hardware to user-space. This will help userspace/middleware to use
> > > > > display hardware for color processing and blending instead of
> > > > > doing it through GPU shaders.
> > > > > =20
> > > >
> > > > Thanks, Uma, for sending this. I've been working on something
> > > > similar but you beat me to it. :) =20
> > >
> > > Thanks Harry for the useful feedback and overall collaboration on thi=
s so far.
> > > =20
> > > > >
> > > > > Work done so far and relevant references
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >
> > > > > Some implementation is done by Intel and AMD/Igalia to address th=
e same.
> > > > > Broad consensus is there that we need a generic API at drm core to
> > > > > suffice the use case of various HW vendors. Below are the links
> > > > > capturing the discussion so far.
> > > > >
> > > > > Intel's Plane Color Implementation:
> > > > > https://patchwork.freedesktop.org/series/90825/
> > > > > AMD's Plane Color Implementation:
> > > > > https://patchwork.freedesktop.org/series/116862/
> > > > >
> > > > >
> > > > > Hackfest conclusions
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >
> > > > > HDR/Color Hackfest was organised by Redhat to bring all the
> > > > > industry stakeholders together and converge on a common uapi =20
> > expectations. =20
> > > > > Participants from Intel, AMD, Nvidia, Collabora, Redhat, Igalia
> > > > > and other prominent user-space developers and maintainers.
> > > > >
> > > > > Discussions happened on the uapi expectations, opens, nature of
> > > > > hardware of multiple hardware vendors, challenges in generalizing
> > > > > the same and the path forward. Consensus was made that drm core
> > > > > should implement descriptive APIs and not go with prescriptive
> > > > > APIs. DRM core should just expose the hardware capabilities;
> > > > > enabling, customizing and programming the same should be done by
> > > > > the user-space. Driver should just =20
> > > > honor the user space request without doing any operations internall=
y. =20
> > > > >
> > > > > Thanks to Simon Ser, for nicely documenting the design consensus
> > > > > and an UAPI RFC which can be referred to here:
> > > > >
> > > > > https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze
> > > > > _hD5
> > > > > =20
> > > > =20
> > nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1
> > Q =20
> > > > Wn48 =20
> > > > > 8=3D@emersion.fr/
> > > > >
> > > > >
> > > > > Design considerations
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >
> > > > > Following are the important aspects taken into account while
> > > > > designing the current RFC
> > > > > proposal:
> > > > >
> > > > > 	1. Individual HW blocks can be muxed. (e.g. out of two HW blocks
> > > > > only one =20
> > > > can be used) =20
> > > > > 	2. Position of the HW block in the pipeline can be programmable
> > > > > 	3. LUTs can be one dimentional or three dimentional
> > > > > 	4. Number of LUT entries can vary across platforms
> > > > > 	5. Precision of LUT entries can vary across platforms
> > > > > 	6. Distribution of LUT entries may vary. e.g Mutli-segmented, =20
> > Logarithmic, =20
> > > > > 	   Piece-Wise Linear(PWL) etc
> > > > > 	7. There can be parameterized/non-parameterized fixed function H=
W =20
> > > > blocks. =20
> > > > > 	   e.g. Just a hardware bit, to convert from one color space to =
another.
> > > > > 	8. Custom non-standard HW implementation.
> > > > > 	9. Leaving scope for some vendor defined pescriptive
> > > > > implementation if =20
> > > > required. =20
> > > > > 	10.Scope to handle any modification in hardware as technology
> > > > > evolves
> > > > >
> > > > > The current proposal takes into account the above considerations
> > > > > while keeping the implementation as generic as possible leaving
> > > > > scope for future =20
> > > > additions or modifications. =20
> > > > >
> > > > > This proposal is also in line to the details mentioned by Simon's
> > > > > RFC covering all the aspects discussed in hackfest.
> > > > >
> > > > >
> > > > > Outline of the implementation
> > > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> > > > >
> > > > > Each Color Hardware block will be represented by a data structure=
 =20
> > drm_color_op. =20
> > > > > These color operations will form the building blocks of a color
> > > > > pipeline which best represents the underlying Hardware. Color
> > > > > operations can be re-arranged, substracted or added to create
> > > > > distinct color pipelines to accurately describe the Hardware
> > > > > blocks present in the display =20
> > > > engine.
> > > >
> > > > Who is doing the arranging of color operations? IMO a driver should
> > > > define one or more respective pipelines that can be selected by
> > > > userspace. This seems to be what you're talking about after (I
> > > > haven't reviewed the whole thing yet). Might be best to drop this s=
entence or =20
> > to add clarifications in order to avoid confusion. =20
> > >
> > > Yes it's the driver who will set the pipeline based on the underlying
> > > hardware arrangement and possible combinations. There can be multiple
> > > pipelines possible if hardware can be muxed or order can be re-arrang=
ed (all =20
> > viable combinations should be defined as a pipeline in driver). =20
> > > Yeah, I will re-phrase this to help clarify it and avoid any ambiguit=
y.
> > > =20
> > > > >
> > > > > In this proposal, a color pipeline is represented as an array of
> > > > > struct drm_color_op. For individual color operation, we add blobs
> > > > > to advertise the capability of the particular Hardware block.
> > > > >
> > > > > This color pipeline is then packaged within a blob for the user
> > > > > space to retrieve it.
> > > > > =20
> > > >
> > > > Would it be better to expose the drm_color_ops directly, instead of
> > > > packing a array of drm_color_ops into a blob and then giving that t=
o =20
> > userspace. =20
> > >
> > > Advantage we see in packing in blobs is that interface will be
> > > cleaner. There will be just one GET_COLOR_PIPELINE property to invoke=
 by user =20
> > and then its just parsing the data. =20
> > > This way the entire underlying hardware blocks with pipeline will be =
available to =20
> > user.
> >=20
> > I don't see how parsing a blob is easier than requesting the color ops =
from the
> > kernel. User space is already equiped with getting KMS objects and the =
igt test
> > code from Harry shows that this is all pretty trivial plumbing. =20
>=20
> There are multiple color operations possible with unique lut distribution=
 and
> capabilities. Also the order of hardware blocks and possibility of multip=
le pipelines.
> Having all the information with one query and property and also be able t=
o set the
> same with just one property call using blobs is better than multiple call=
s to driver.
> This can be useful in high refresh rate cases where not much time is ther=
e to program
> the hardware state. Latency of multiple calls to driver can be avoided.

Hi,

querying all that information only happens once, at KMS client start-up.

Setting up a color pipeline is already a single call: the atomic commit ioc=
tl.

>=20
> > > For a particular hardware block in pipeline, user can get the relevant
> > > details from blob representing that particular block. We have created
> > > IGT tests (links mentioned in cover-letter) to demonstrate how it can=
 be done. =20
> > This is just to clarify the idea.
> >=20
> > The blob is also not introspectable with the usual tools whereas exposi=
ng them as
> > properties would be.
> >=20
> > It also would, like Pekka correctly noted, bring a whole bunch of issue=
s about
> > compatibility and versioning that are well understood with objects
> > + properties. =20
>=20
> The blob should be standardized in the UAPI and structures to parse them =
should be fixed.
> With this compatibility issues can be prevented.

I think that is short-sighted.

> > > Also since info is passed via blobs we have the flexibility to even
> > > define segmented LUTs and PWL hardware blocks. Also we have left scope
> > > for custom private hardware blocks as well which driver can work with=
 =20
> > respective HAL and get that implemented.
> >=20
> > When color ops are real KMS objects they still can have properties whic=
h are
> > blobs that can store LUTs and other data.
> >=20
> > And we should avoid private blocks at all cost. In fact, I don't think =
the KMS rules
> > have changed in that regard and it simply is not allowed. =20
>=20
> Private blocks are not standardized but are vendor specific. So generic u=
serspace will
> ignore these. However vendor and its respective HAL can make use of this =
field and leaves
> a scope to cater to such hardware vendors need. This doesn't affect the e=
xpectation of the
> standardized color operations which will be defined as enum in UAPI.

Vendors can have and expose their own unique snowflake operations
without any "private" as well: pick an unused operation type code, and
document what it does. Advertise it in some pipelines.

Vendor HALs can make use of it, but it also allows generic userspace to
make use of it at will, and it allows other vendors to implement the
same and benefit from it without needing to patch every userspace.

Or does Intel not want other vendors to potentially make use of their
UAPIs?

> > > We can even define prescriptive operations as a private entry and
> > > enable it if a certain driver and HAL agree.
> > > =20
> > > > > To advertise the available color pipelines, an immutable ENUM
> > > > > property "GET_COLOR_PIPELINE" is introduced. This enum property h=
as =20
> > blob id's as values. =20
> > > > > With each blob id representing a distinct color pipeline based on
> > > > > underlying HW capabilities and their respective combinations.
> > > > >
> > > > > Once the user space decides on a color pipeline, it can set the
> > > > > pipeline and the corresponding data for the hardware blocks within
> > > > > the pipeline with the BLOB property "SET_COLOR_PIPELINE".
> > > > > =20
> > > >
> > > > When I discussed this at the hackfest with Simon he proposed a new
> > > > DRM object, (I've called it a drm_colorop) to represent a color ope=
ration.
> > > > Each drm_colorop has a "NEXT" pointer to another drm_colorop, or
> > > > NULL if its the last in the pipeline. You can then have a mutable
> > > > enum property on the plane to discover and select a color pipeline.=
 =20
> > >
> > > Yes, the proposal is inspired by this idea. Sure, we can work togethe=
r to enhance =20
> > the design. =20
> > > Personally I feel the one proposed in the current RFC will do the same
> > > thing envisioned by Simon and you Harry. Management of the pipeline,
> > > addition, deletion and flexibility to represent hardware is more with=
 blobs with =20
> > the relevant structures agreed in UAPI. =20
> > > =20
> > > > This seems a bit more transparent than a blob. You can see my
> > > > changes (unfortunately very WIP, don't look too closely at
> > > > individual patches) at
> > > > https://gitlab.freedesktop.org/hwentland/linux/-/merge_requests/5/di
> > > > ffs
> > > >
> > > > libdrm changes:
> > > > https://gitlab.freedesktop.org/hwentland/drm/-/merge_requests/1/diff
> > > > s =20
> > >
> > > Sure, will check the same.
> > > =20
> > > > IGT changes:
> > > > https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/merge_reque
> > > > sts/1/diffs
> > > >
> > > > I'll take time to review your whole series and will see whether we
> > > > can somehow keep the best parts of each. =20
> > >
> > > Thanks and agree. Let's work together and get this implemented in DRM.
> > > =20
> > > > Curious to hear other opinions on the blob vs new DRM object questi=
on as =20
> > well.
> >=20
> > I can see a few advantages with the blob approach.
> >=20
> > User space can store the entire state in one blob and just assign a new=
 blob to
> > change to another pipeline configuration. =20
>=20
> Agree
>=20
> > However, I would argue that changing a lot of properties is already com=
mon
> > practice and works well. User space can deal with it and has abstractio=
ns to
> > make this managable. =20
>=20
> Blob gives a lot of flexibility and ability to define the hardware capabi=
lities generically.

The structure of the atomic commit ioctl and the KMS property system is
even more flexible.

> Lut distribution, number of segments, samples in each segment, precision =
of luts etc.
> can be precisely defined and userspace will get a complete picture of the=
 underlying
> hardware and its capabilities. Also this is being done with just 2 proper=
ties. Leaving
> scope for future addition of any standard color operation as well.

The number of properties does not seem too useful to strictly minimise
over other aspects.


Thanks,
pq

>=20
> I feel blob approach once properly documented is a bit more flexible and =
scalable.
> Maybe I am bit biased here =F0=9F=98=8A but all ideas are welcome.=20
>=20
> We have implemented some IGT's as well to explain the design better. Link=
 below:
> https://patchwork.freedesktop.org/series/123018/
>=20
> Thanks Sebastian for the feedback.
>=20
> Regards,
> Uma Shankar

--Sig_/rSMciiXJunowv=uMdpT=WcM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmT3EgYACgkQI1/ltBGq
qqcznA//WR0jPFilQRGbPtfZXIxEjgHP1GjbyqdOpdJmXu/lJpj+/skb/fb7+D5u
6dvjWRjyvj6m6zgT+DwYTeiuu3DopuQpA0FK525gPuuJzsrS+MAt9hF99Fekb0BB
WXqSpK+55lDUSjF7OTwGSGM6Ibqu/II2mhuhh7tqGY84l8vSqLEyIJhXzhMG88df
vQFD7/QQeetwzsF7rkuOQSr/i3e13QFyarX0ors0C+Gr1UKOm3VgoGXYE8iLJv8o
ePb55MDBU38IWkNjNQRVHmQS79xHO00FlMmjWA2mf0yf6bGdjzizUedRrZ72AV1w
PUoiQ1Rs+58ad/N9sz7RIGQeRW7vaBkl80AUQ0kR13Dzl5bVMLkYSj/zbV9BdJYt
+ctg6xL6sz5cslKqdWXQZJqkHRdRP02zEJZYuO6AHA3UZF2JfJ8up0sNqN/VXfT8
IB2yAAoES6x+WGpoClfFvCAIr+KgY1IJiqabqWeT8Nk/GpoLSdfr78sY1hpOshQ7
/xvj7eBeYOJkZ86yh6qd6qVKkcXq/cxzAJsG8SZivSpk0bFFTb1Ir6eliJFMdJgQ
861Ex/AzI+5gRwbfKWRSPDu8kfLvK94AbR9ueppU/nn/mkLM82ji6UA4NgzBzT7q
217gPbWFP+k8PvHWqFrwdqT9crTtgl9GUlpv5wRzHag4IxdkgG4=
=18b9
-----END PGP SIGNATURE-----

--Sig_/rSMciiXJunowv=uMdpT=WcM--
