Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEA9792225
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 13:33:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE1310E4BC;
	Tue,  5 Sep 2023 11:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330C410E4B8;
 Tue,  5 Sep 2023 11:32:58 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-500913779f5so3946035e87.2; 
 Tue, 05 Sep 2023 04:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693913576; x=1694518376; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=i2KkduLGyZ+G8YuBo6nO6Hdw2I6+Td2Ljfhz3VbUsQU=;
 b=k2lYlsACbk5TZbOw8iwnkLsB7QYBLattsTbRcIowClG4j8XjabxdRiwjPDELGUEr5w
 ol8/u3tLiHzgU7CRtEznRLcjRi7fyPUrOTRm5KEGCATXD3BBAC8YnT5ne7xVWqk/VlYU
 Z6d1naOjPkyL835ejxKUT4y2IHGCXenAp0RMxrNJbAHZj8OGCDynnhcjYyeC0eRBOrgS
 J3BN7W+6Z3Mr6vyL9jAdnOC+kqe4deyzJrJ4LRhgrK3DzU5+Sr3nIqQgAgh4Ho04rRH+
 ItaytP+dxbj9AhY+SAiUV8hS4HWbJ/tzMp0zcoUwQUmwcuSXCwBeq94rbagwNUvGWyWm
 CqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693913576; x=1694518376;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i2KkduLGyZ+G8YuBo6nO6Hdw2I6+Td2Ljfhz3VbUsQU=;
 b=CKIWg7X16jLeJEFDd34ELsdXUXPGSk6VIpv8Bqti5DhE7QQBTQu0iba3r7VHqbqTA8
 M5MJoJAD5KjbrBK9fxAZgM4XAhjrmotbMal4MF/u6k5XsZSivOdTV2+0QnPLWaXGNVDr
 DhZLqofa1XWFK3zBbDEhPGmLJ1VU2n5y86uOZ7b0GlLm6Ez0q5QJtwA1C4Yj/Fk+ET+K
 JbXDRfWKXOCvK+JS1VViS2owc5eRmAyqj/niR32coWKc2htlQmy9YAsgT9mFFzFhehy8
 teoRe8amHKVT4NMVNgv69Dzjaq+Yz3zYLMS41hp1ugrggkR/ATd7dXUL3NfeLFhvqgM4
 4eRA==
X-Gm-Message-State: AOJu0YwKEEUxXs6hYTlMHhLgQH5G/SSfXNFwcbmKyei9WewZb5lUjp4X
 nVNyx1QcBJgULKEXuMQ93BA=
X-Google-Smtp-Source: AGHT+IFxlpVHPiympJ9Qoq3H3TFFq9c59XXXsXs1lBLbCZapMl9CIlixrh9b2zs3oV6gPSO1VrJQhg==
X-Received: by 2002:a05:6512:340a:b0:500:af82:7dd4 with SMTP id
 i10-20020a056512340a00b00500af827dd4mr9847766lfr.3.1693913575855; 
 Tue, 05 Sep 2023 04:32:55 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac2554a000000b004fdfd79e732sm2323276lfk.289.2023.09.05.04.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 04:32:55 -0700 (PDT)
Date: Tue, 5 Sep 2023 14:32:45 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [RFC 01/33] drm/doc/rfc: Add RFC document for proposed Plane
 Color Pipeline
Message-ID: <20230905143245.4e6d0a06@eldfell>
In-Reply-To: <IA1PR11MB6347B6B8F4E51862B0CC235DF4E9A@IA1PR11MB6347.namprd11.prod.outlook.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
 <20230829160422.1251087-2-uma.shankar@intel.com>
 <73c0d398-63fe-4ce1-92db-f0f1f5e839a3@amd.com>
 <PH7PR11MB6354303E054759387403CFF1F4E6A@PH7PR11MB6354.namprd11.prod.outlook.com>
 <20230830152832.59312231@eldfell>
 <IA1PR11MB6347B6B8F4E51862B0CC235DF4E9A@IA1PR11MB6347.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xbA.ExzokwX5z3.E6Nu8Aw2";
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
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Jonas Adahl <jadahl@redhat.com>, "Borah,
 Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/xbA.ExzokwX5z3.E6Nu8Aw2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 4 Sep 2023 13:44:49 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of =
Pekka
> > Paalanen
> > Sent: Wednesday, August 30, 2023 5:59 PM
> > To: Shankar, Uma <uma.shankar@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org; Borah, Chaitanya Kumar
> > <chaitanya.kumar.borah@intel.com>; dri-devel@lists.freedesktop.org; way=
land-
> > devel@lists.freedesktop.org
> > Subject: Re: [RFC 01/33] drm/doc/rfc: Add RFC document for proposed Pla=
ne
> > Color Pipeline
> >=20
> > On Wed, 30 Aug 2023 08:59:36 +0000
> > "Shankar, Uma" <uma.shankar@intel.com> wrote:
> >  =20
> > > > -----Original Message-----
> > > > From: Harry Wentland <harry.wentland@amd.com>
> > > > Sent: Wednesday, August 30, 2023 1:10 AM
> > > > To: Shankar, Uma <uma.shankar@intel.com>;
> > > > intel-gfx@lists.freedesktop.org; dri- devel@lists.freedesktop.org
> > > > Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>;
> > > > wayland- devel@lists.freedesktop.org
> > > > Subject: Re: [RFC 01/33] drm/doc/rfc: Add RFC document for proposed
> > > > Plane Color Pipeline
> > > >
> > > >
> > > >
> > > > On 2023-08-29 12:03, Uma Shankar wrote: =20
> > > > > Add the documentation for the new proposed Plane Color Pipeline.
> > > > >
> > > > > Co-developed-by: Chaitanya Kumar Borah
> > > > > <chaitanya.kumar.borah@intel.com>
> > > > > Signed-off-by: Chaitanya Kumar Borah
> > > > > <chaitanya.kumar.borah@intel.com>
> > > > > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > > > ---
> > > > >   .../gpu/rfc/plane_color_pipeline.rst          | 394 +++++++++++=
+++++++
> > > > >   1 file changed, 394 insertions(+)
> > > > >   create mode 100644
> > > > > Documentation/gpu/rfc/plane_color_pipeline.rst
> > > > >
> > > > > diff --git a/Documentation/gpu/rfc/plane_color_pipeline.rst
> > > > > b/Documentation/gpu/rfc/plane_color_pipeline.rst
> > > > > new file mode 100644
> > > > > index 000000000000..60ce515b6ea7
> > > > > --- /dev/null
> > > > > +++ b/Documentation/gpu/rfc/plane_color_pipeline.rst =20
> >=20
> > ...
> >=20
> > Hi Uma! =20
>=20
> Thanks Pekka for the feedback and useful inputs.

Hi Uma,

sorry to say, but the overall feeling I get from this proposal is that
it is just the current color related KMS properties wrapped in a
pipeline blob. That is not the re-design I believe we are looking for,
and the feeling is based on several details that are just copied from
the current property design. Also the "private" stuff has to go.

All the varying LUT entries, varying LUT precision, 1D/3D LUTs, varying
LUT tap distribution, and parametrized curves are good development, but
right now we are looking at things one step higher level: the overall
color pipeline design and how to represent any operation. Most of this
series is considering details below the current attention level, hence
I'm paying attention only to the first few patches.

More below.

> > > > > +This color pipeline is then packaged within a blob for the user
> > > > > +space to retrieve it. Details can be found in the next section
> > > > > + =20
> > > >
> > > > Not sure I like blobs that contain other blob ids. =20
> > >
> > > It provides flexibility and helps with just one interface to
> > > userspace. Its easy to handle and manage once we get the hang of it =
=F0=9F=98=8A.
> > >
> > > We can clearly define the steps of parsing and data structures to be
> > > used while interpreting and parsing the blobs. =20
> >=20
> > Don't forget extendability. Possibly every single struct will need some=
 kind of
> > versioning, and then it's not simple to parse anymore. Add to that new/=
old kernel
> > vs. old/new userspace, and it seems a bit nightmarish to design. =20
>=20
> Structure to be used to interpret the blob should be defined as UAPI only=
 and is not
> expected to change once agreed upon. It should be interpreted like a stan=
dard property.
> So structure to be used, say for 3dLut or 1dlut or CTM operations should =
be standardized
> and fixed. No versioning of structure should be done and same rules/restr=
ictions as of UAPI
> property should be applied.=20

That sounds like a UAPI that cannot be extended, either. So in a few
years we'd be looking at replacing it. Or maybe you are just
re-inventing the KMS object property system as blobs?

Replacing a single KMS property is much easier than replacing the
foundations of the whole color pipeline design.


> ...

> > I have a feeling that introspection will be valuable here, to help peop=
le
> > understand what their hardware could do if they had the code to use it.=
 'name'
> > and 'type' being integers require a translation table to strings before=
 they are
> > readable, and it would be best if the kernel itself provided that trans=
lation. =20
>=20
> Name and type can be standardized in enum and well documented in the UAPI.
> For all the standard hardware blocks common for all vendors and serving m=
ost of the
> common usecases, we can define standard names in enum. These can be easily
> interpreted by a table as done in many cases already in driver and usersp=
ace.

Yeah, but it won't help with the type-specific parameter blobs that
are totally custom per each operation type. With the KMS property
system we could have more generic introspection into those as well, at
least naming all the parameters they have.

Plus, you don't have to patch drm_info every time something new gets
added in the kernel in order to see it named.

> ...

> > Therefore, I'm not yet convinced with the "all blobs" design. =20
>=20
> Looking forward to collaboratively solve the problem for the community.
> Will improve the design based on all the feedback.

I have the feeling that we should also see Harry's draft.

Intel's special LUT type is a whole another story, and we can always
have that fitted with any UAPI paradigm.

> ...

> > > > > +		u32 blob_id;
> > > > > +	};
> > > > > +
> > > > > +2.	struct drm_color_pipeline: This structure represents the =20
> > aggregate =20
> > > > > +                                   pipeline to be set. it contai=
ns the following  members
> > > > > +					  a) num: pipeline number to be =20
> > selected =20
> > > > > +					  b) size: size of the data to be passed =20
> > onto =20
> > > > the driver =20
> > > > > +					  c) data: array of struct =20
> > > > drm_color_op_data with data for =20
> > > > > +                                                   the hardware =
block/s that userspace wants to
> > > > > +                                                   set values fo=
r.
> > > > > +
> > > > > +	struct drm_color_pipeline {
> > > > > +		int num;
> > > > > +		int size;
> > > > > +		struct drm_color_op_data *data;
> > > > > +	};
> > > > > +
> > > > > +	User can either:
> > > > > +	1. send data for all the color operations in a pipeline as show=
n in [2].
> > > > > +	   The color operation data need not be in order that the pipel=
ine =20
> > advertises =20
> > > > > +	   however, it should not contain data for any
> > > > > +	   color operation that is not present in the pipeline.
> > > > > +
> > > > > +	   Note: This check for pipeline is not yet implemented but if =
the
> > > > > +	   wider proposal is accepted we have few solutions in mind.
> > > > > +
> > > > > +	2. send data for a subset of color operations as shown in [3].F=
or the
> > > > > +	   color operation that userspace does not send data will retai=
n their
> > > > > +	   older state. =20
> >=20
> > Retaining existing state, especially for operations that userspace does=
 not
> > understand, can lead to incorrect and unexpected results. That's why I =
say that
> > userspace must understand all operations in a pipeline, and all paramet=
ers of all
> > used operations before it can actually use that pipeline. =20
>=20
> By retaining state here, we mean the state set by the same client while u=
sing the same
> pipeline. If client wants to just alter one or subset of the hardware blo=
cks in the pipeline,
> it can just send that to driver. Rest of the pipeline which was previousl=
y programmed by the
> same client will remain intact.
>=20
> However once the client switches pipeline, driver will disable the pipeli=
ne and client will have
> to program all the blocks again with the new pipeline.
>=20
> > Otherwise we have the same problem as KMS properties have in general
> > today: when new things are added that userspace does not understand, ho=
w will
> > the userspace be able to maintain its old behaviour?
> >=20
> > That question has two answers today:
> > - userspace learns to program everything, and accidentally
> >   (mal)functions until then
> > - you do not switch between KMS clients that might leave incorrect
> >   state in not-understood properties
> >=20
> > Neither is a good answer, and the problem does not seem to have any pra=
ctical
> > traction either.
> >=20
> > For color pipelines I hope we can, and believe that we must, do better =
to maintain
> > correct behaviour while extending functionality. =20
>=20
> Yes agree, we are thinking to reset and disable the pipeline once client =
switches.
> One of the ideas could be to use file_priv to achieve that.

I would assume that each color operation in each pipeline is already
independent. Userspace cannot know which color operation is mapped
to which hardware block, and should not need to care. That means the
kernel maintains software state with the UAPI objects, not with the
hardware blocks. Therefore, there is no inherent need to reset any
pipeline on switch. Hardware programming is a different matter.

In the hackfest or after it, people raised the possibility of having a
standard property in each KMS colorop object if possible: boolean
"pass-through", or any equivalent. If an object is set to pass-through,
it is as if it did not exist - it does not alter the values going
through it in any way. Not even clamping if that could make a
difference.

This allows adding new arbitrary blocks in old pipelines without
forcing userspace to abandon the pipeline, as long as userspace learns
to use the "pass-through" from the start. This reduces the number of
alternative pipelines that need to be advertised when adding new
features.

If an object is not pass-through, then userspace absolutely must
understand the values programmed into every property of that object, or
there is no knowing what the object actually does. If userspace does
not know what an object does, the object can be assumed to produce an
unexpected result, i.e. wrong result. No userspace is going to willingly
malfunction.

> ...

> > > > > +Representing Fixed function hardware
> > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > +
> > > > > +To provide support for fixed function hardware, the driver could
> > > > > +expose vendor specific struct drm_color_op with parameters that
> > > > > +both the userspace and driver agrees on. To demonstrate, let's
> > > > > +consider a hyphothetical fixed function hardware block that conv=
erts BT601 =20
> > to BT2020. =20
> > > > > +The driver can choose to advertise the block as such.
> > > > > +
> > > > > +struct drm_color_op color_pipeline_X[] =3D {
> > > > > +	{
> > > > > +		.name =3D DRM_CB_PRIVATE, =20
> >=20
> > What if the hardware has 5 different custom blocks like this, multiple =
in the same
> > pipeline. How do you 'name' them? =20
>=20
> Partially explained above, but private_flags can help in differentiating =
this.
> A link for implementation shared above for reference.

But they are all CB_PRIVATE, so what positions do they take in the pipeline?

The names CB_PRE_CSC and CB_POST_CSC imply that the name defines the
position in a pipeline. That is wrong with the names since the order is
defined by the record order in a pipeline blob, right?

> > > > > +		.type =3D FIXED_FUNCTION, =20
> >=20
> > I have been assuming that 'type' uniquely defines both the operation an=
d the
> > contents of the parameter blob, but this does not look like it.
> > What defines the operation and the parameters? =20
>=20
> Statement is true for all other generic blocks, only for private blocks t=
his is a
> bit different. Here interpretation depends on the private_flags which can=
 be
> documented by the respective vendor for the custom HAL implementation.

Exceptions to a rule are bad API design. In this case, it can easily be
avoided.

Now I'm actually confused about how 'name' and 'type' depend on
'private_flags'. You have to decipher 'private_flags' to understand
what 'name' means too?

Hmm, but isn't 'name' used for identifying the block/operation in the
blob that sets up the parameters for a whole pipeline? But then 'name'
does not uniquely identify a block?


Thanks,
pq

> ...

> > > > > +References
> > > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > +
> > > > > +[1] https://gitlab.freedesktop.org/emersion/drm_info
> > > > > +[2]
> > > > > +https://patchwork.freedesktop.org/patch/554827/?series=3D123018&=
rev
> > > > > +=3D1
> > > > > +[3]
> > > > > +https://patchwork.freedesktop.org/patch/554826/?series=3D123018&=
rev
> > > > > +=3D1 [4] https://patchwork.freedesktop.org/series/123018/ =20
>=20


--Sig_/xbA.ExzokwX5z3.E6Nu8Aw2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmT3Ed0ACgkQI1/ltBGq
qqdEkw/9E4KNs6qiZOF8TOxIHq6LuPDQCRsdYgt8BFGRoM18iR9D1YVMq07mA/VA
0whb2iWTUj/XfkoFfDsPnaHz7InogkDpXGRQ5CJzq5UJD6ZbIbm6SKvMRVGphWHE
yem9/Cqf3YNVbFYtKJn8HboWWSChOouHtrod36wol3P15VVzpb77mCIQLFao8aDp
x9Ez/Xzb4pig0ANm8F3WbiAzfrV/1o/HEdjH4cRDtzcjxbqiywnQwgEbGp0FmLzR
37MpcwuCXlbEu083i8Ep3K/iY8PqSMFmXGnvgMRECo7GIEcrRGlvKD5+zF8xj2Gg
oapyBoJgG2tF9fwZ1kSNDMpjRtEnVYdSrx1FgcFYB1UyIOym6eHtQ1vq7DIYklPx
p3rWVqZPHMFkO76ES2zfkR0KLN0lGwn5i3fEWSLyvEhgBuEgibkJxo337B4pfxRV
gK5P1mX96hPwky3u2XSc6VUw+3OX4AaCC9NQtWE3SOffmPSWQOKHmfFb5fvhVBX1
ObUt66HZhuJcI7nmFSEeCUcjKn4pknLokjP7K3cWb1f9LHzKo8F7m6jkTxlMo3/F
QTLosdHcGdQts2FL+FdgrnfU4FdFfMfVE1UYGJ4Qo3NafUdP8Qs+zKyG2v/eLkQU
S1jj1PiSCkJ8SU9tuEBR8cYJH3ZyQyFgDka69CBsm/jbrWnBuww=
=peil
-----END PGP SIGNATURE-----

--Sig_/xbA.ExzokwX5z3.E6Nu8Aw2--
