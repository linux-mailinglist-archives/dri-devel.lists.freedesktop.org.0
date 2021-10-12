Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A44042A22B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 12:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9769E6E83F;
	Tue, 12 Oct 2021 10:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650CF6E830;
 Tue, 12 Oct 2021 10:30:57 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id y15so85838404lfk.7;
 Tue, 12 Oct 2021 03:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=5OYElhLgX140tN0pwMxqY0LLaU23RLT1yPxlZUcs6+c=;
 b=jLCyBOv/HNE7vBEaDIhdTC8v/GKNlPLjWVe95adyeCkGbJlNlurWcCK3uqPLgSvomC
 obmX1kwj02x4jY3Ejn5JkSK6H19S0pcoBNSiQqWeaEsQqO1mCHNEVWgvdUaI5xYgJsVH
 V48BX2IkDLh9L68rbQntCh21B+t62jWEh79UAK2XZY92nAliEq0qnEhZh48S1RN67+b7
 kDU1W0IELJStaTeZiCocZcIcWSa1XCmy1t2HR3qa9fBRGhW2tLuhx8HRM33oY7lSnRBN
 7yDUq6GtV5bIG2YwzWIxn6KT+Lb+bKIrwP5RFQMM/RAV/E1u7dy9ERU5HOU8umKwHs9G
 9UKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=5OYElhLgX140tN0pwMxqY0LLaU23RLT1yPxlZUcs6+c=;
 b=kTqDmjW4anMZ/8bxV8diZMl5J/oqLwSxa1SWfpzswEVB0wwO36qupfbIljmdHdyqC2
 Fkf2mnMXh8OKWtGNUFTXzh9CVlUpyLzA4DclZqVGKDB5Nt3+nCCzmthHRXStmXFmbdeD
 9X2lNoCY0GPMizXK2+U4y5LwDOD0xcAP9E0gFsuS6+KtC0Lk0A8gJDyPjJbPaoR0IUPh
 9dSo/nZIoOEHqUcvNT8/QDLKtaJiXOGI9pzIv6CRzGus2chzmB08QvT8rW1Ws35wu7Lj
 NWrFz9Umc12Zkz7L64tIq2x1xeIEwcB0gFMlNes2EfyuyI7i889zaGi4LFxHXYiNLlQZ
 L90w==
X-Gm-Message-State: AOAM533nG90j2mGP1THKjlj18/rzdlWJqoxmtX4K0hi6xFuDwbgnw2Xv
 vYmMOaxXKhfW7ShDBdLjVjg=
X-Google-Smtp-Source: ABdhPJyKszPkb3Q3iwHH6Ufi/V0uQsaOsYT+cWF05WCkmj4XU7TVDQwklyYfYsyTr9sg1rDLFcdOYQ==
X-Received: by 2002:a2e:7204:: with SMTP id n4mr23614241ljc.430.1634034655423; 
 Tue, 12 Oct 2021 03:30:55 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 12sm989294lfz.259.2021.10.12.03.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 03:30:54 -0700 (PDT)
Date: Tue, 12 Oct 2021 13:30:43 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Uma Shankar <uma.shankar@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, ville.syrjala@linux.intel.com,
 brian.starkey@arm.com, sebastian@sebastianwick.net, Shashank.Sharma@amd.com
Subject: Re: [RFC v2 01/22] drm: RFC for Plane Color Hardware Pipeline
Message-ID: <20211006155559.606521de@eldfell>
In-Reply-To: <20210906213904.27918-2-uma.shankar@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-2-uma.shankar@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jh1_=ypjxL0+x.XGZylsUh3";
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

--Sig_/Jh1_=ypjxL0+x.XGZylsUh3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue,  7 Sep 2021 03:08:43 +0530
Uma Shankar <uma.shankar@intel.com> wrote:

> This is a RFC proposal for plane color hardware blocks.
> It exposes the property interface to userspace and calls
> out the details or interfaces created and the intended
> purpose.
>=20
> Credits: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  Documentation/gpu/rfc/drm_color_pipeline.rst | 167 +++++++++++++++++++
>  1 file changed, 167 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/drm_color_pipeline.rst
>=20
> diff --git a/Documentation/gpu/rfc/drm_color_pipeline.rst b/Documentation=
/gpu/rfc/drm_color_pipeline.rst
> new file mode 100644
> index 000000000000..0d1ca858783b
> --- /dev/null
> +++ b/Documentation/gpu/rfc/drm_color_pipeline.rst
> @@ -0,0 +1,167 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +Display Color Pipeline: Proposed DRM Properties

Hi,

is there a practise of landing proposal documents in the kernel? How
does that work, will a kernel tree carry the patch files?
Or should this document be worded like documentation for an accepted
feature, and then the patches either land or don't?

> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +This is how a typical display color hardware pipeline looks like:

Typical, or should we say that this is the abstract color pipeline that
KMS assumes?

Then drivers map this to pieces of hardware the best they can and
reject or do not expose the parts they cannot.

> + +-------------------------------------------+
> + |                RAM                        |
> + |  +------+    +---------+    +---------+   |
> + |  | FB 1 |    |  FB 2   |    | FB N    |   |
> + |  +------+    +---------+    +---------+   |
> + +-------------------------------------------+
> +       |  Plane Color Hardware Block |
> + +--------------------------------------------+
> + | +---v-----+   +---v-------+   +---v------+ |
> + | | Plane A |   | Plane B   |   | Plane N  | |
> + | | DeGamma |   | Degamma   |   | Degamma  | |
> + | +---+-----+   +---+-------+   +---+------+ |
> + |     |             |               |        |
> + | +---v-----+   +---v-------+   +---v------+ |
> + | |Plane A  |   | Plane B   |   | Plane N  | |
> + | |CSC/CTM  |   | CSC/CTM   |   | CSC/CTM  | |
> + | +---+-----+   +----+------+   +----+-----+ |
> + |     |              |               |       |
> + | +---v-----+   +----v------+   +----v-----+ |
> + | | Plane A |   | Plane B   |   | Plane N  | |
> + | | Gamma   |   | Gamma     |   | Gamma    | |
> + | +---+-----+   +----+------+   +----+-----+ |
> + |     |              |               |       |
> + +--------------------------------------------+
> ++------v--------------v---------------v-------|
> +||                                           ||
> +||           Pipe Blender                    ||
> ++--------------------+------------------------+
> +|                    |                        |
> +|        +-----------v----------+             |
> +|        |  Pipe DeGamma        |             |
> +|        |                      |             |
> +|        +-----------+----------+             |
> +|                    |            Pipe Color  |
> +|        +-----------v----------+ Hardware    |
> +|        |  Pipe CSC/CTM        |             |
> +|        |                      |             |
> +|        +-----------+----------+             |
> +|                    |                        |
> +|        +-----------v----------+             |
> +|        |  Pipe Gamma          |             |
> +|        |                      |             |
> +|        +-----------+----------+             |
> +|                    |                        |
> ++---------------------------------------------+
> +                     |
> +                     v
> +               Pipe Output
> +
> +Proposal is to have below properties for a plane:
> +
> +* Plane Degamma or Pre-Curve:
> +	* This will be used to linearize the input framebuffer data.
> +	* It will apply the reverse of the color transfer function.
> +	* It can be a degamma curve or OETF for HDR.

As you want to produce light-linear values, you use EOTF or inverse
OETF.

The term OETF has a built-in assumption that that happens in a camera:
it takes in light and produces and electrical signal. Lately I have
personally started talking about non-linear encoding of color values,
since EOTF is often associated with displays if nothing else is said
(taking in an electrical signal and producing light).

So this would be decoding the color values into light-linear color
values. That is what an EOTF does, yes, but I feel there is a nuanced
difference. A piece of equipment implements an EOTF by turning an
electrical signal into light, hence EOTF often refers to specific
equipment. You could talk about content EOTF to denote content value
encoding, as opposed to output or display EOTF, but that might be
confusing if you look at e.g. the diagrams in BT.2100: is it the EOTF
or is it the inverse OETF? Is the (inverse?) OOTF included?

So I try to side-step those questions by talking about encoding.

> +	* This linear data can be further acted on by the following
> +	* color hardware blocks in the display hardware pipeline

I think this and the above description ties the intended use down too
much. This is one possible way to use degamma, yes, but there may be
others. Particularly if CTM can be replaced with a 3D LUT, then the
degamma is more likely a shaper (non-linear adjustment to 3D LUT tap
positions).

I would prefer the name pre-curve to underline that this can be
whatever one wants it to be, but I understand that people may be more
familiar with the name degamma.

> +
> +UAPI Name: PLANE_DEGAMMA_MODE
> +Description: Enum property with values as blob_id's which advertizes
> the

Is enum with blob id values even a thing?

> +	    possible degamma modes and lut ranges supported by the platform.
> +	    This  allows userspace to query and get the plane degamma color
> +	    caps and choose the appropriate degamma mode and create lut values
> +	    accordingly.

I agree that some sort of "mode" switch is necessary, and advertisement
of capabilities as well.

> +
> +UAPI Name: PLANE_DEGAMMA_LUT
> +Description: Blob property which allows a userspace to provide LUT values
> +	     to apply degamma curve using the h/w plane degamma processing
> +	     engine, thereby making the content as linear for further color
> +	     processing. Userspace gets the size of LUT and precision etc
> +	     from PLANE_DEGAMA_MODE_PROPERTY

So all degamma modes will always be some kind of LUT? That may be a bit
restrictive, as I understand AMD may have predefined or parameterised
curves that are not LUTs. So there should be room for an arbitrary
structure of parameters, which can be passed in as a blob id, and the
contents defined by the degamma mode.

LUT size, precision, and other details of each degamma mode would be
good to expose somehow. I kind of expected those would have been
exposed through the above mentioned "enum with blob id values" where
each blob content structure is defined by the respective enum value.

> +=09
> +* Plane CTM
> +	* This is a Property to program the color transformation matrix.

No mode property here? Is there any hardware with something else than a
matrix at this point?

Should we assume there will be hardware with something else, and have a
CSC mode property with only a single enum value defined so far:
"matrix"? Or do we say PLANE_CTM is a matrix and if you have something
else in hardware, then invent a new property for it?

> +	* This can be used to perform a color space conversion like
> +	* BT2020 to BT709 or BT601 etc.
> +	* This block is generally kept after the degamma unit so that

Not "generally". If blocks can change places, then it becomes
intractable for generic userspace to program.

> +	* linear data can be fed to it for conversion.
> +
> +UAPI Name: PLANE_CTM
> +Description: Blob property which allows a userspace to provide CTM coeff=
icients
> +	     to do color space conversion or any other enhancement by doing a
> +	     matrix multiplication using the h/w CTM processing engine
> +

Speaking of color space conversions, we should probably define what
happens to out-of-range color values. Converting color into smaller
gamut or smaller dynamic range always has the risk of ending up with
out-of-range values. I suppose those get simply clipped independently
on each color channel, right?

Such clipping can change hue, so userspace would be better avoid
triggering clipping at all, but we still need to know what would happen
with out-of-range values.

We would also need to know when clipping will happen. If FP16
(half-float) FB produces out-of-range values and degamma stage is not
used, will the CTM see original or clipped values? Or is that something
we have to define as hardware-specific?

Generic userspace will try hard to avoid triggering hardware-specific
behaviour, so you can expect such behaviour to go unused.

> +* Plane Gamma or Post-Curve
> +	* This can be used to perform 2 operations:
> +		* non-lineralize the framebuffer data. Can be used for
> +		* non linear blending. It can be a gamma curve or EOTF
> +		* for HDR.
> +		* Perform Tone Mapping operation. This is an operation
> +		* done when blending is done with HDR and SDR content.

I like this wording better than the wording for pre-curve: "can", not
"will". It leaves room for creative use of this processing block.

Tone-mapping is needed always when dynamic range differs, so also for
HDR to HDR, not just SDR to/from HDR.

> +
> +UAPI Name: PLANE_GAMMA_MODE
> +Description: Enum property with values as blob_id's which advertizes the
> +	    possible gamma modes and lut ranges supported by the platform.
> +	    This  allows userspace to query and get the plane gamma color
> +	    caps and choose the appropriate gamma mode and create lut values
> +	    accordingly.
> +
> +UAPI Name: PLANE_GAMMA_LUT
> +Description: Blob property which allows a userspace to provide LUT values
> +	     to apply gamma curve or perform tone mapping using the h/w plane
> +	     gamma processing engine, thereby making the content as linear
> +	     for further color processing. Userspace gets the size of LUT and
> +	     precision etc from PLANE_GAMA_MODE_PROPERTY

The same comments here as with DEGAMMA.

> +=09
> +This is part of one plane engine. Data from multiple planes will be
> +then fed to pipe where it will get blended. There is a similar set of
> +properties available at crtc level which acts on this blended data.
> +
> +Below is a sample usecase:
> +
> +  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90      =E2=94=8C=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =E2=94=8C=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =E2=94=8C=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=90
> +  =E2=94=82FB1         =E2=94=82      =E2=94=82Degamma Block=E2=94=82   =
  =E2=94=82 CTM Matrix  =E2=94=82     =E2=94=82 Gamma Block =E2=94=82
> +  =E2=94=82            =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=96=BA=E2=94=82Linearize-   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=96=BA=E2=94=82 BT709 to    =E2=94=9C=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=96=BA=E2=94=82 SDR to HDR  =E2=94=82
> +  =E2=94=82BT709 SDR   =E2=94=82      =E2=94=82BT709 inverse=E2=94=82   =
  =E2=94=82 BT2020      =E2=94=82     =E2=94=82 Tone Mapping=E2=94=9C=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> +  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98      =E2=94=94=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98     =E2=94=94=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98     =E2=94=94=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=98        =E2=94=82
> +                                                                        =
             =E2=94=82
> +  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90      =E2=94=8C=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =E2=94=8C=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =E2=94=8C=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=90        =E2=94=82
> +  =E2=94=82FB2         =E2=94=82      =E2=94=82Degamma Block=E2=94=82   =
  =E2=94=82 CTM Matrix  =E2=94=82     =E2=94=82 Gamma Block =E2=94=82      =
  =E2=94=82
> +  =E2=94=82            =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=96=BA=E2=94=82Linearize-   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=96=BA=E2=94=82 BT601 to    =E2=94=9C=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=96=BA=E2=94=82 SDR to HDR  =E2=94=9C=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=90  =E2=94=82
> +  =E2=94=82BT601 SDR   =E2=94=82      =E2=94=82BT601 inverse=E2=94=82   =
  =E2=94=82 BT2020      =E2=94=82     =E2=94=82 Tone Mapping=E2=94=82     =
=E2=94=82  =E2=94=82
> +  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98      =E2=94=94=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98     =E2=94=94=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98     =E2=94=94=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=98     =E2=94=82  =E2=94=82
> +                                                                        =
          =E2=94=82  =E2=94=82
> +  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90      =E2=94=8C=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =E2=94=8C=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =E2=94=8C=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=90     =E2=94=82  =E2=94=82
> +  =E2=94=82FB3         =E2=94=82      =E2=94=82Degamma Block=E2=94=82   =
  =E2=94=82 CTM Matrix  =E2=94=82     =E2=94=82 Gamma Block =E2=94=82     =
=E2=94=82  =E2=94=82
> +  =E2=94=82            =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=96=BA=E2=94=82Linearize-   =E2=94=9C=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=96=BA=E2=94=82 NOP (Data in=E2=94=9C=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=96=BA=E2=94=82 NOP (Data in=E2=94=9C=E2=94=80=E2=94=80=E2=
=94=80=E2=94=90 =E2=94=82  =E2=94=82
> +  =E2=94=82BT2020 HDR  =E2=94=82      =E2=94=82HDR OETF     =E2=94=82   =
  =E2=94=82 BT2020)     =E2=94=82     =E2=94=82 HDR)        =E2=94=82   =E2=
=94=82 =E2=94=82  =E2=94=82
> +  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98      =E2=94=94=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98     =E2=94=94=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98     =E2=94=94=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=98   =E2=94=82 =E2=94=82  =E2=94=82

EOTF, not OETF, since it is converting E to O, electrical to optical.

> +                                                                        =
        =E2=94=82 =E2=94=82  =E2=94=82
> +                                                                        =
        =E2=94=82 =E2=94=82  =E2=94=82
> +                                                                        =
        =E2=94=82 =E2=94=82  =E2=94=82
> +=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=B4=
=E2=94=80=E2=94=80=E2=94=98
> +=E2=94=82
> +=E2=94=82 =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90=
      =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90      =E2=
=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
> +=E2=94=82 =E2=94=82 CRTC Degamma=E2=94=82      =E2=94=82 CRTC CTM    =E2=
=94=82      =E2=94=82 CRTC Gamma    =E2=94=82
> +=E2=94=94=E2=94=80=E2=94=A4 Use to make =E2=94=9C=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=96=BA=E2=94=82 Use for any =E2=94=9C=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BA=E2=94=82 Use for Tone  =E2=94=
=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=96=BA TO Port
> +  =E2=94=82 data linear =E2=94=82      =E2=94=82 Color Space =E2=94=82  =
    =E2=94=82 Mapping/apply =E2=94=82
> +  =E2=94=82 after blend =E2=94=82      =E2=94=82 Conversion  =E2=94=82  =
    =E2=94=82 transfer func =E2=94=82
> +  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98      =E2=
=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98      =E2=94=94=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98

Blending does not change whether the data is linear or not. I suppose
in this example, CRTC degamma and CTM would be passthrough, and gamma
would be the inverse display EOTF for encoding color values into what
the monitor expects.

> +
> +
> +This patch series adds properties for plane color features. It adds
> +properties for degamma used to linearize data and CSC used for gamut
> +conversion. It also includes Gamma support used to again non-linearize
> +data as per panel supported color space. These can be utilize by user
> +space to convert planes from one format to another, one color space to
> +another etc.

FWIW, this is exactly the structure I have assumed in the Weston CM&HDR
work.

> +
> +Userspace can take smart blending decisions and utilize these hardware
> +supported plane color features to get accurate color profile. The same
> +can help in consistent color quality from source to panel taking
> +advantage of advanced color features in hardware.
> +
> +These patches add the property interfaces and enable helper functions.
> +This series adds Intel's XE_LPD hw specific plane gamma feature. We
> +can build up and add other platform/hardware specific implementation
> +on top of this series.
> +
> +Credits: Special mention and credits to Ville Syrjala for coming up
> +with a design for this feature and inputs. This series is based on
> +his original design and idea.


Thanks,
pq

--Sig_/Jh1_=ypjxL0+x.XGZylsUh3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFlY9MACgkQI1/ltBGq
qqcC1xAAi68UPE1YhROdYacDO8edKv0ZdITwfTB1GcAgnuBwUAWfANtblGAecCOt
/C3+MLriLzGhfJsm6Wx5++y7M/4mD2RV9CVZRlYEV3yYdNJBTACC9JQ6ZRlWfQHO
twpuUaAayNWLhx+mxKgcugSV8ddghS8CYklVZIbhaXgfcFnnOzXTSoRoxSjtiRCr
FaCkBEIs//jMFZomeN3avCHPlsiBFaCDBPnwxg+3fna/G5e0EmwMUakDLL/Lnxx0
HcZbdssM0+TqSL7q4zjSIs4Q8jG/KIH0RLH0WNc1+z0BDhrRx8x8R6B4wASgkQAz
JPEk7HaTxPAbqmqei5OXoXSwB9zV26foeq87hWXN9SKtdHN6HYRxH/YOyU1yryxJ
aDiOtVfSv3VfcRZxz3E7WzusEGmVc6aeehrjadZLJnFB3rNHlohLBnM9HIYKjP0O
04jQZyiX/JxqQthUnWiKadOXAEKisu1nBZeRe2gTwsQufGFv6EcBAy1SYr6dSBMI
VFM7E9A6plOmeYhp2oYszslQKao41KjLPlbjtDsNJy1lGCJNTVlMg9YP4eMgyGPe
M5qLug8N07qNthp6HF4hssZBiu3cB6eCHZHXc3dfdXBdoACMvJqrNNZh/ioq3iIG
giJuF3m9u5b1xQTHRIPKrqhMN1PI6Oo8cXc8WrsaFLLBZ9aH9fQ=
=A3Bc
-----END PGP SIGNATURE-----

--Sig_/Jh1_=ypjxL0+x.XGZylsUh3--
