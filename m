Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D09042BA71
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 10:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DB36E863;
	Wed, 13 Oct 2021 08:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEA36E863;
 Wed, 13 Oct 2021 08:30:51 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id r19so8277508lfe.10;
 Wed, 13 Oct 2021 01:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ggty5rd4BP140DHgtknPiyuqVw4oYmRCjE00sjtUutc=;
 b=lscEUQ5u6nEVYyHYYs/qwTs9JfuqtX+C13Q1wusyaFStzfGFtKrLWaTbPHXCu3Xcq8
 LspnmjJaSNZLM9zHdRTf8iuBrI3g4fcSyVj6TW8Og+3Q9dgfTODCaqmp1QYPDmvxgYk5
 x74pGbehHryPsnQrkOlWYuApG+Zqz/6VTv7J890LUOYWYX7DLtGtNdr/yJi4jBYm88Eg
 Bi515qCK/jkm/QgbftxsZeYCKMwlSjwRgtV2irib/l6f3XRSERj521JpDERtumgNO8we
 5jjauUhPx94GTBxFuq4DiLhz/u/ZcurfIcPcJXknuyC0fzs9LWkPI9e3P3t66+VDsuB7
 oFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ggty5rd4BP140DHgtknPiyuqVw4oYmRCjE00sjtUutc=;
 b=qUQqMg3fgMiM+bF2KWvcc0aaxRxeEXVnKf9OBT5ow+o19KYBmKXqkGPxJi9Vqa5JMI
 fMxTQ1ikaq/ryVv+gymfppqDqmSXKfCBRcPzrY6uDMrYYQuHyLvgMcI1vmfs73Yp3ScX
 5JhF6uHge3v55oyEYpuP7QBbsXKUfbXyBbMAeZNnpyMLWt7LL6rKJ3LuksihoTY9y1dl
 ElNY396lBoOuTph/cQXNyLZN8v5VipM1IENFKa0NSdaYW+4ncf64FvXn74MFt0llYiWZ
 wA8I+SRaITcK6w1SJDAtFtieFNjghM3x0zq8GhFVyp3dNdLWj+ECXOq9IDciNaHj7FOg
 F/tQ==
X-Gm-Message-State: AOAM531esO4jYWzDsg6bUt1Z41tSpO0QmNV/B7nX1I6aOB2kNoTjcHUs
 NENmSB6Ma19REnoLloiObII=
X-Google-Smtp-Source: ABdhPJxtbtx44ETJtHL8HLNQqjGMDoA0IjHW9wbPODYIpgxBo0TJe5dDR4XXdzmBVixoHQsM+4GkIA==
X-Received: by 2002:ac2:46e6:: with SMTP id q6mr18173717lfo.212.1634113849793; 
 Wed, 13 Oct 2021 01:30:49 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f21sm1377181lfj.250.2021.10.13.01.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 01:30:49 -0700 (PDT)
Date: Wed, 13 Oct 2021 11:30:46 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "brian.starkey@arm.com" <brian.starkey@arm.com>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>,
 "Shashank.Sharma@amd.com" <Shashank.Sharma@amd.com>
Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
Message-ID: <20211013113046.7ace2dbd@eldfell>
In-Reply-To: <92af78eb53c04d67ac66b77f8b098cc0@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-2-uma.shankar@intel.com>
 <20211006155559.606521de@eldfell>
 <92af78eb53c04d67ac66b77f8b098cc0@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VmZ6uOQes0QFcU7AppvIIUJ";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/VmZ6uOQes0QFcU7AppvIIUJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Oct 2021 20:58:27 +0000
"Shankar, Uma" <uma.shankar@intel.com> wrote:

> > -----Original Message-----
> > From: Pekka Paalanen <ppaalanen@gmail.com>
> > Sent: Tuesday, October 12, 2021 4:01 PM
> > To: Shankar, Uma <uma.shankar@intel.com>
> > Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org;=20
> > harry.wentland@amd.com; ville.syrjala@linux.intel.com;=20
> > brian.starkey@arm.com; sebastian@sebastianwick.net;=20
> > Shashank.Sharma@amd.com
> > Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
> >=20
> > On Tue,  7 Sep 2021 03:08:43 +0530
> > Uma Shankar <uma.shankar@intel.com> wrote:
> >  =20
> > > This is a RFC proposal for plane color hardware blocks.
> > > It exposes the property interface to userspace and calls out the=20
> > > details or interfaces created and the intended purpose.
> > >
> > > Credits: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > > ---
> > >  Documentation/gpu/rfc/drm_color_pipeline.rst | 167
> > > +++++++++++++++++++
> > >  1 file changed, 167 insertions(+)
> > >  create mode 100644 Documentation/gpu/rfc/drm_color_pipeline.rst
> > >
> > > diff --git a/Documentation/gpu/rfc/drm_color_pipeline.rst
> > > b/Documentation/gpu/rfc/drm_color_pipeline.rst
> > > new file mode 100644
> > > index 000000000000..0d1ca858783b
> > > --- /dev/null
> > > +++ b/Documentation/gpu/rfc/drm_color_pipeline.rst
> > > @@ -0,0 +1,167 @@
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > +Display Color Pipeline: Proposed DRM Properties =20

...

> > > +Proposal is to have below properties for a plane:
> > > +
> > > +* Plane Degamma or Pre-Curve:
> > > +	* This will be used to linearize the input framebuffer data.
> > > +	* It will apply the reverse of the color transfer function.
> > > +	* It can be a degamma curve or OETF for HDR. =20
> >=20
> > As you want to produce light-linear values, you use EOTF or inverse OET=
F.
> >=20
> > The term OETF has a built-in assumption that that happens in a camera:
> > it takes in light and produces and electrical signal. Lately I have=20
> > personally started talking about non-linear encoding of color values,=20
> > since EOTF is often associated with displays if nothing else is said (t=
aking in an electrical signal and producing light).
> >=20
> > So this would be decoding the color values into light-linear color=20
> > values. That is what an EOTF does, yes, but I feel there is a nuanced=20
> > difference. A piece of equipment implements an EOTF by turning an=20
> > electrical signal into light, hence EOTF often refers to specific=20
> > equipment. You could talk about content EOTF to denote content value=20
> > encoding, as opposed to output or display EOTF, but that might be=20
> > confusing if you look at e.g. the diagrams in BT.2100: is it the EOTF o=
r is it the inverse OETF? Is the (inverse?) OOTF included?
> >=20
> > So I try to side-step those questions by talking about encoding. =20
>=20
> The idea here is that frame buffer presented to display plane engine will=
 be non-linear.
> So output of a media decode should result in content with EOTF applied.

Hi,

sure, but the question is: which EOTF. There can be many different
things called "EOTF" in a single pipeline, and then it's up to the
document writer to make the difference between them. Comparing two
documents with different conventions causes a lot of confusion in my
personal experience, so it is good to define the concepts more
carefully.

> So output of a media decode should result in content with EOTF applied.

I suspect you have it backwards. Media decode produces electrical
(non-linear) pixel color values. If EOTF was applied, they would be
linear instead (and require more memory to achieve the same visual
precision).

If you want to put it this way, you could say "with inverse EOTF
applied", but that might be slightly confusing because it is already
baked in to the video, it's not something a media decoder has to
specifically apply, I think. However, the (inverse) EOTF in this case
is the content EOTF, not the display EOTF.

If content and display EOTF differ, then one must apply first content
EOTF and then inverse display EOTF to get values that are correctly
encoded for the display. (This is necessary but not sufficient in
general.) Mind, that this is not an OOTF nor an artistic adjustment,
this is purely a value encoding conversion.

> Playback transfer function (EOTF): inverse OETF plus rendering intent gam=
ma.=20

Does "rendering intent gamma" refer to artistic adjustments, not OOTF?

cf. BT.2100 Annex 1, "The relationship between the OETF, the EOTF and
the OOTF", although I find those diagrams somewhat confusing still. It
does not seem to clearly account for transmission non-linear encoding
being different from the display EOTF.

Different documents use OOTF to refer to different things. Then there
is also the fundamental difference between PQ and HLG systems, where
OOTF is by definition in different places of the
camera-transmission-display pipeline.

>=20
> To make it linear, we should apply the OETF. Confusion is whether OETF is=
 equivalent to
> inverse EOTF, we could check this one out to confirm.

OETF does not make anything linear. By definition, OETF converts
optical (linear) values into electrical (practically always
non-linearly encoded) values.

Yes, EOTF is almost always not equal to inverse OETF because of the
existence of OOTF. The applies to inverse EOTF vs. OETF as well.

=46rom what I have learned, it is unexpected to assume that inverse of
one is the other. That will cause confusion. Therefore, if you mean the
inverse, spell it out as inverse. I used to make this same mistake, and
some of it may still be left in
https://gitlab.freedesktop.org/pq/color-and-hdr .

>=20
> Here since the values for the pre-curve (or degamma as we have called it =
in past),
> accepts programmable lut values which makes it flexible enough to accommo=
date any values.
> This will hold for HDR as well as traditional gamma encoded SRGB data as =
well.

Yes.

> > > +	* This linear data can be further acted on by the following
> > > +	* color hardware blocks in the display hardware pipeline =20
> >=20
> > I think this and the above description ties the intended use down too=20
> > much. This is one possible way to use degamma, yes, but there may be=20
> > others. Particularly if CTM can be replaced with a 3D LUT, then the=20
> > degamma is more likely a shaper (non-linear adjustment to 3D LUT tap po=
sitions). =20
>=20
> Yeah agree, this is just one of the usecases. Its just a lut table which =
can be used for
> other purposes as well and is not just limited to a linearization operati=
on. I will update this.
>=20
> > I would prefer the name pre-curve to underline that this can be=20
> > whatever one wants it to be, but I understand that people may be more f=
amiliar with the name degamma. =20
>=20
> I feel pre-curve should be fine but yeah it deviates from naming of legac=
y crtc/pipe color properties.
> May be we can stay with legacy naming with more documentation to have its=
 usecases clearly called out.

That is fine by me.

> > > +
> > > +UAPI Name: PLANE_DEGAMMA_MODE
> > > +Description: Enum property with values as blob_id's which=20
> > > +advertizes
> > > the =20
> >=20
> > Is enum with blob id values even a thing? =20
>=20
> Yeah we could have. This is a dynamic enum created with blobs. Each entry=
 contains
> the data structure to extract the full color capabilities of the hardware=
. It=E2=80=99s a very
> interesting play with blobs (@ville.syrjala@linux.intel.com brainchild)

Yes, I think I can imagine how that works. The blobs are created
immutable, unable to change once the plane has been advertised to
userspace, because their IDs are used as enum values. But that is ok,
because the blob describes capabilities that cannot change during the
device's lifetime... or can they? What if you would want to extend the
blob format, do you need a KMS client cap to change the format which
would be impossible because you can't change an enum definition after
it has been installed so you cannot swap the blob to a new one?

This also relies on enums being identified by their string names,
because the numerical value is not a constant but a blob ID and gets
determined when the immutable blob is created.

Did I understand correctly?

As a userspace developer, I can totally work with that.

> > > +	    possible degamma modes and lut ranges supported by the platform.
> > > +	    This  allows userspace to query and get the plane degamma color
> > > +	    caps and choose the appropriate degamma mode and create lut val=
ues
> > > +	    accordingly. =20
> >=20
> > I agree that some sort of "mode" switch is necessary, and=20
> > advertisement of capabilities as well.
> >  =20
>=20
> This enum with blob id's is an interesting way to advertise segmented lut=
 tables.
>=20
> > > +
> > > +UAPI Name: PLANE_DEGAMMA_LUT
> > > +Description: Blob property which allows a userspace to provide LUT v=
alues
> > > +	     to apply degamma curve using the h/w plane degamma processing
> > > +	     engine, thereby making the content as linear for further color
> > > +	     processing. Userspace gets the size of LUT and precision etc
> > > +	     from PLANE_DEGAMA_MODE_PROPERTY =20
> >=20
> > So all degamma modes will always be some kind of LUT? That may be a=20
> > bit restrictive, as I understand AMD may have predefined or=20
> > parameterised curves that are not LUTs. So there should be room for an=
=20
> > arbitrary structure of parameters, which can be passed in as a blob=20
> > id, and the contents defined by the degamma mode. =20
>=20
> For Intel's hardware these are luts but yeah AMD hardware seems to have t=
hese
> as fixed function units. We should think of a way to have this option as =
well in the
> UAPI. We could extend the DEGAMMA_MODE property to have all the info, and
> DEGAMMA_LUT_PROPERTY may not be needed based on some of the attributes
> passed via DEGAMMA_MODE. This can be one way to have room for both.
> @harry.wentland@amd.com thoughts ?

Yeah, though I don't think you can use DEGAMMA_MODE property to pass
parameters to fixed-function curves. The parameters need another
property. Would be natural to use the other property for LUT data when
mode it set to LUT.

A trivial and made-up example of a parameterised fixed-function curve
is pow(x, gamma), where gamma is the parameter.

> >=20
> > LUT size, precision, and other details of each degamma mode would be=20
> > good to expose somehow. I kind of expected those would have been=20
> > exposed through the above mentioned "enum with blob id values" where=20
> > each blob content structure is defined by the respective enum value. =20
>=20
> Yes, you are spot on here.
>=20
> > > +
> > > +* Plane CTM
> > > +	* This is a Property to program the color transformation matrix. =20
> >=20
> > No mode property here? Is there any hardware with something else than=20
> > a matrix at this point? =20
>=20
> Not that I am aware of.
>=20
> > Should we assume there will be hardware with something else, and have=20
> > a CSC mode property with only a single enum value defined so far:
> > "matrix"? Or do we say PLANE_CTM is a matrix and if you have something=
=20
> > else in hardware, then invent a new property for it? =20
>=20
> I think this should be good as we have this for crtc with no one complain=
ing.
> There may be hardware with fixed function operation for the CSC but then
> its not a matrix and it would be pretty hardware dependent, so we can lea=
ve
> that from a generic UAPI.

Ok. And if that eventually turns out to be a mistake, it's easy to
invent more properties.

> > > +	* This can be used to perform a color space conversion like
> > > +	* BT2020 to BT709 or BT601 etc.
> > > +	* This block is generally kept after the degamma unit so that =20
> >=20
> > Not "generally". If blocks can change places, then it becomes=20
> > intractable for generic userspace to program. =20
>=20
> Sure, will drop this wording here. But one open will still remain for use=
rspace,
> as to how it gets the pipeline dynamically for a respective hardware.
> Currently we have assumed that this would be the logical fixed order of
> hardware units.

If we cannot model the abstract KMS pipeline as a fixed order of units
(where each unit may exist or not), we need to take a few steps back
here and look at what do we actually want to expose. That is a much
bigger design problem which we are currently not even considering.

> > > +	* linear data can be fed to it for conversion.
> > > +
> > > +UAPI Name: PLANE_CTM
> > > +Description: Blob property which allows a userspace to provide CTM c=
oefficients
> > > +	     to do color space conversion or any other enhancement by doing=
 a
> > > +	     matrix multiplication using the h/w CTM processing engine
> > > + =20
> >=20
> > Speaking of color space conversions, we should probably define what=20
> > happens to out-of-range color values. Converting color into smaller=20
> > gamut or smaller dynamic range always has the risk of ending up with=20
> > out-of-range values. I suppose those get simply clipped independently o=
n each color channel, right? =20
>=20
> We have standard matrix to convert colorspaces. This is just the property=
 of the colorspace,
> I guess clipping will be the only option here (irrespective of hardware)
>=20
> > Such clipping can change hue, so userspace would be better avoid=20
> > triggering clipping at all, but we still need to know what would happen=
 with out-of-range values.
> >=20
> > We would also need to know when clipping will happen. If FP16
> > (half-float) FB produces out-of-range values and degamma stage is not=20
> > used, will the CTM see original or clipped values? Or is that=20
> > something we have to define as hardware-specific?
> >=20
> > Generic userspace will try hard to avoid triggering hardware-specific=20
> > behaviour, so you can expect such behaviour to go unused. =20
>=20
> Here hardware should just operate on the matrix values programmed. This s=
hould
> be the limitation of the color space conversion operation and hardware ma=
y not have
> any role to play apart from just honoring the matrix values and producing=
 the
> resultant output.

I'm not talking about the matrix values. I'm talking about the values
originating from the FB, are they clipped or not, before being processed
by the matrix?

Userspace could want to use the matrix to bring out-of-range FB values
into range, but that plan cannot work if the FB values get clipped
already before the matrix.

I referred to FP16 format explicitly because that format can express
values outside of the usual [0.0, 1.0] range in a framebuffer.

Of course, the matrix values themselves have some limits too, and
userspace should somehow be aware of them.

>=20
> > > +* Plane Gamma or Post-Curve
> > > +	* This can be used to perform 2 operations:
> > > +		* non-lineralize the framebuffer data. Can be used for
> > > +		* non linear blending. It can be a gamma curve or EOTF
> > > +		* for HDR.
> > > +		* Perform Tone Mapping operation. This is an operation
> > > +		* done when blending is done with HDR and SDR content. =20
> >=20
> > I like this wording better than the wording for pre-curve: "can", not=20
> > "will". It leaves room for creative use of this processing block. =20
>=20
> Ok thanks, will update pre-curve section as well.
>=20
> >=20
> > Tone-mapping is needed always when dynamic range differs, so also for=20
> > HDR to HDR, not just SDR to/from HDR. =20
>=20
> Yes correct, will update.
>=20
> > > +
> > > +UAPI Name: PLANE_GAMMA_MODE
> > > +Description: Enum property with values as blob_id's which advertizes=
 the
> > > +	    possible gamma modes and lut ranges supported by the platform.
> > > +	    This  allows userspace to query and get the plane gamma color
> > > +	    caps and choose the appropriate gamma mode and create lut values
> > > +	    accordingly.
> > > +
> > > +UAPI Name: PLANE_GAMMA_LUT
> > > +Description: Blob property which allows a userspace to provide LUT v=
alues
> > > +	     to apply gamma curve or perform tone mapping using the h/w pla=
ne
> > > +	     gamma processing engine, thereby making the content as linear
> > > +	     for further color processing. Userspace gets the size of LUT a=
nd
> > > +	     precision etc from PLANE_GAMA_MODE_PROPERTY =20
> >=20
> > The same comments here as with DEGAMMA. =20
>=20
> Noted.
>=20
> > > +
> > > +This is part of one plane engine. Data from multiple planes will be=
=20
> > > +then fed to pipe where it will get blended. There is a similar set=20
> > > +of properties available at crtc level which acts on this blended dat=
a.
> > > +
> > > +Below is a sample usecase:
> > > +
> > > +  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90      =E2=94=8C=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =E2=94=8C=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90 =20
> > =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90 =20
> > > +  =E2=94=82FB1         =E2=94=82      =E2=94=82Degamma Block=E2=94=
=82     =E2=94=82 CTM Matrix  =E2=94=82     =E2=94=82 Gamma Block =E2=94=82
> > > +  =E2=94=82            =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=96=BA=E2=94=82Linearize-   =E2=94=9C=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=96=BA=E2=94=82 BT709 to    =E2=94=9C=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=96=BA=E2=94=82 SDR to HDR  =E2=94=82
> > > +  =E2=94=82BT709 SDR   =E2=94=82      =E2=94=82BT709 inverse=E2=94=
=82     =E2=94=82 BT2020      =E2=94=82     =E2=94=82 Tone =20
> > Mapping=E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=90 =20
> > > +  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98      =E2=94=94=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98     =E2=94=94=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98 =20
> > =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98        =
=E2=94=82 =20
> > > +                                                                    =
                 =E2=94=82
> > > +  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90      =E2=94=8C=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =E2=94=8C=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90 =20
> > =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90        =
=E2=94=82 =20
> > > +  =E2=94=82FB2         =E2=94=82      =E2=94=82Degamma Block=E2=94=
=82     =E2=94=82 CTM Matrix  =E2=94=82     =E2=94=82 Gamma Block =E2=94=82=
        =E2=94=82
> > > +  =E2=94=82            =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=96=BA=E2=94=82Linearize-   =E2=94=9C=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=96=BA=E2=94=82 BT601 to    =E2=94=9C=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=96=BA=E2=94=82 SDR to HDR =20
> > =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90  =E2=94=
=82 =20
> > > +  =E2=94=82BT601 SDR   =E2=94=82      =E2=94=82BT601 inverse=E2=94=
=82     =E2=94=82 BT2020      =E2=94=82     =E2=94=82 Tone Mapping=E2=94=82=
     =E2=94=82  =E2=94=82
> > > +  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98      =E2=94=94=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98     =E2=94=94=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98 =20
> > =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98     =E2=
=94=82  =E2=94=82 =20
> > > +                                                                    =
              =E2=94=82  =E2=94=82
> > > +  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90      =E2=94=8C=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =E2=94=8C=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90 =20
> > =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =E2=
=94=82  =E2=94=82 =20
> > > +  =E2=94=82FB3         =E2=94=82      =E2=94=82Degamma Block=E2=94=
=82     =E2=94=82 CTM Matrix  =E2=94=82     =E2=94=82 Gamma Block =E2=94=82=
     =E2=94=82  =E2=94=82
> > > +  =E2=94=82            =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=96=BA=E2=94=82Linearize-   =E2=94=9C=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=96=BA=E2=94=82 NOP (Data in=E2=94=9C=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=96=BA=E2=94=82 NOP (Data =20
> > in=E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=90 =E2=94=82  =E2=94=82 =20
> > > +  =E2=94=82BT2020 HDR  =E2=94=82      =E2=94=82HDR OETF     =E2=94=
=82     =E2=94=82 BT2020)     =E2=94=82     =E2=94=82 HDR)        =E2=94=82=
   =E2=94=82 =E2=94=82  =E2=94=82
> > > +  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98      =E2=94=94=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98     =E2=94=94=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98 =20
> > =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98   =E2=94=
=82 =E2=94=82  =E2=94=82
> >=20
> > EOTF, not OETF, since it is converting E to O, electrical to optical. =
=20
>=20
> I think media decode would have given a EOTF applied data to be directly =
consumed by display
> sink (in case we have chosen a display pass through). Not sure here thoug=
h, it=E2=80=99s a bit confusing.

I hope I managed to explain this earlier in this email.

Display sinks "always" use non-linearly encoded values, because it
saves bandwidth without losing visual quality. For the same reason,
images tend to be stored with non-linear value encoding whenever
possible.


Thanks,
pq

> > > +                                                                    =
           =20
> > > + =E2=94=82 =E2=94=82  =E2=94=82
> > > +                                                                    =
           =20
> > > + =E2=94=82 =E2=94=82  =E2=94=82
> > > +
> > > +=E2=94=82 =E2=94=82  =E2=94=82
> > > =20
> > +=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80
> > =E2=94=80=E2=94=80 =20
> > > +=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=B4=E2=94=80=E2=94=
=80=E2=94=98
> > > +=E2=94=82
> > > +=E2=94=82 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=90      =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90      =
=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=90
> > > +=E2=94=82 =E2=94=82 CRTC Degamma=E2=94=82      =E2=94=82 CRTC CTM   =
 =E2=94=82      =E2=94=82 CRTC Gamma    =E2=94=82
> > > +=E2=94=94=E2=94=80=E2=94=A4 Use to make =E2=94=9C=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=96=BA=E2=94=82 Use for any =E2=94=9C=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BA=E2=94=82 Use for Tone  =E2=
=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BA =20
> > TO Port =20
> > > +  =E2=94=82 data linear =E2=94=82      =E2=94=82 Color Space =E2=94=
=82      =E2=94=82 Mapping/apply =E2=94=82
> > > +  =E2=94=82 after blend =E2=94=82      =E2=94=82 Conversion  =E2=94=
=82      =E2=94=82 transfer func =E2=94=82
> > > +  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98      =
=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98      =E2=94=94=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98 =20
> >=20
> > Blending does not change whether the data is linear or not. I suppose=20
> > in this example, CRTC degamma and CTM would be passthrough, and gamma=20
> > would be the inverse display EOTF for encoding color values into what t=
he monitor expects. =20
>=20
> Yeah, will update this to make it clear.
>=20
> > > +
> > > +
> > > +This patch series adds properties for plane color features. It adds=
=20
> > > +properties for degamma used to linearize data and CSC used for=20
> > > +gamut conversion. It also includes Gamma support used to again=20
> > > +non-linearize data as per panel supported color space. These can be=
=20
> > > +utilize by user space to convert planes from one format to another,=
=20
> > > +one color space to another etc. =20
> >=20
> > FWIW, this is exactly the structure I have assumed in the Weston CM&HDR=
 work. =20
>=20
> This is great to hear that we are aligned wrt how the pipeline should wor=
k.
>=20
> Thanks Pekka for taking time out and providing the feedback.
>=20
> @harry.wentland@amd.com We can work together and build our design to acco=
mmodate
> both Intel and AMD's hardware needs. This will also make things generic e=
nough for any
> other hardware vendor as well.
>=20
> Thanks & Regards,
> Uma Shankar
>=20
> > > +
> > > +Userspace can take smart blending decisions and utilize these=20
> > > +hardware supported plane color features to get accurate color=20
> > > +profile. The same can help in consistent color quality from source=20
> > > +to panel taking advantage of advanced color features in hardware.
> > > +
> > > +These patches add the property interfaces and enable helper function=
s.
> > > +This series adds Intel's XE_LPD hw specific plane gamma feature. We=
=20
> > > +can build up and add other platform/hardware specific=20
> > > +implementation on top of this series.
> > > +
> > > +Credits: Special mention and credits to Ville Syrjala for coming up=
=20
> > > +with a design for this feature and inputs. This series is based on=20
> > > +his original design and idea. =20
> >=20
> >=20
> > Thanks,
> > pq =20


--Sig_/VmZ6uOQes0QFcU7AppvIIUJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFmmTYACgkQI1/ltBGq
qqd00w/9Eqw5aq8jov5olso67OdpKofgwiKoYjvB8ScFVpIZBdjtjVdbhndxk+ef
rj+2tEby6uNfCLeWVyeOzKrbrmCE2k76gDDNlg+tA1J+zJ2IlDDfsg5O39cpx+6G
+6AxhO+Em76V0VdyZ9TaxP7aCwfE/JWqCbB4E9EPbZgZ4Hr3VLLx4kpa+T4xNItA
B4t8v+Ze7/lPBLERqFhJrSUsVusux1gtD3t5J4VfZhDN3dw/CC8PVzOzew38HoCw
hy3OOalCsp3XeH2TxNLkJZV4BjoBevTzk4sC1h14vKmXfF6tmrCc+i37TD5FWlik
vvDpQ39ys+wnbsEeMwz/9AjV2CkKU4nHUstEssxWt5VdAmzsj/vnS1eG0lKxLH1W
pOfUPdCZu9MtrDcJiM20WKKf7kav55p6Yi0NV8E3GJMwC2U7IDqgbHxqLQdbIq9E
M0fngqWKZq/vXC0lRl0b/DZdVXYS7BEQAhTGB3l9JqQ3gV4B/24niLwYQ9p7KhMR
00DOz5LPb2pmz2GYhTSkUG/iwIUcwKgSED51ejNH4xALAEAinGHcV3q3/OmjrsU5
Oymmn1Bp6/CN7HkDJ1ydiyGWwpcnUaXiTMQ5HVe8l9FkT5pORiQHoe02082QwITY
tJOu9TNppSzoGvqk5iimlLl62aOLAAqN758j2DgF+UeTR3WfcKE=
=PyXx
-----END PGP SIGNATURE-----

--Sig_/VmZ6uOQes0QFcU7AppvIIUJ--
