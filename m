Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F96436F77E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 11:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8766E0FF;
	Fri, 30 Apr 2021 09:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0906E0FF;
 Fri, 30 Apr 2021 09:04:08 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id x20so78765479lfu.6;
 Fri, 30 Apr 2021 02:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=bWoSIvmqNouaYrrX2B0CeKDibOVTi6dzlaqzLPONybE=;
 b=RT+UMbMUcArODrdFsbgn3ysQk03NLnU1bUZoyeQ07eI2cGmLyWLzNU1dYHuK+H9pYd
 9eq0Q119U+Nv4Qmop9wvns+Wd3zrKoexsJlKDRCicTbHqy6h2yfL4pR7aPNW70YW6Yzm
 qHkBoGP6qinRc7zup5Yqx8TZEEg84QIQyvYBFLWExRioCq/qCDWjW2zK9S3eq7XcvwQ5
 H0CA9uBDrWQJM9McZMl+etTuGxAq4W0sCpJAcDK+XxCV7V6RRGDCdSRSTQzdudSCqfqY
 7j5Ms9QKpheD249FFUuYl/tqCSw9bvXU/riK5glSgflUqeaP+9CfHPLeuAxsB2AcR3kI
 Vj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=bWoSIvmqNouaYrrX2B0CeKDibOVTi6dzlaqzLPONybE=;
 b=AWgHlhZJdTIFgSK+GVsHSyzdGD01UmXWp4o07PXYW8lqxREqSyS40ggSGAM5txJEnw
 IBoEcdPZyB3FLfI5jhFToexxFaKZFRxqMdnNWaYXH2tGbTXNv4ajp9wR8tghgnR9HEzg
 ccnUnckay2j9MWaG4yU7gm7BZ3KcCTXOTaHImGpJKoea1GhaL1rOuptqgmllBAmxqGt4
 +mJjn4fhLHdW04Ix3ren9HC+kzEthL92By3FaNguMGbavCchMZn5IfF0IEettBE8yK/s
 0LkYdMgCFRQgIXJuf6wMtGrvPfZJDg5gLwGrfqweW1JKi3XjkOtk+QN+qzzcTM+ZCwDX
 +q5g==
X-Gm-Message-State: AOAM531NZAyJaQNJmwhGo2gVuQUsbHCDwsAUvJGxA4Ph966Mln9AhaFl
 ybHBg4TLOAMfU1fTgz20sPE=
X-Google-Smtp-Source: ABdhPJw1QRo2LZepRA24lgFb/1wBnA0h5MOlImJEM3uCUnsXO6Ycm2hyiujCeRGEPWM0s/wImfMewg==
X-Received: by 2002:a05:6512:2245:: with SMTP id
 i5mr2645040lfu.448.1619773446508; 
 Fri, 30 Apr 2021 02:04:06 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t14sm169067ljj.49.2021.04.30.02.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 02:04:06 -0700 (PDT)
Date: Fri, 30 Apr 2021 12:04:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 1/3] drm/color: Add RGB Color encodings
Message-ID: <20210430120402.7aa014ec@eldfell>
In-Reply-To: <YIcPx6ozxPN7BbEU@intel.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210426173852.484368-2-harry.wentland@amd.com>
 <YIcBUl+94sHJsT8B@intel.com>
 <0090ce07-6102-59e7-bc8c-3528297aa5ae@amd.com>
 <YIcPx6ozxPN7BbEU@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Shashank.Sharma@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 sebastian@sebastianwick.net, Uma Shankar <uma.shankar@intel.com>,
 hersenxs.wu@amd.com, amd-gfx@lists.freedesktop.org,
 laurentiu.palcu@oss.nxp.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com, Vitaly.Prosyak@amd.com
Content-Type: multipart/mixed; boundary="===============1165730396=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1165730396==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EjcagME61b9pLKqTnYEsSkE"; protocol="application/pgp-signature"

--Sig_/EjcagME61b9pLKqTnYEsSkE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Apr 2021 22:08:55 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Mon, Apr 26, 2021 at 02:56:26PM -0400, Harry Wentland wrote:
> > On 2021-04-26 2:07 p.m., Ville Syrj=C3=A4l=C3=A4 wrote: =20
> > > On Mon, Apr 26, 2021 at 01:38:50PM -0400, Harry Wentland wrote: =20
> > >> From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> > >>
> > >> Add the following color encodings
> > >> - RGB versions for BT601, BT709, BT2020
> > >> - DCI-P3: Used for digital movies
> > >>
> > >> Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> > >> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > >> ---
> > >>   drivers/gpu/drm/drm_color_mgmt.c | 4 ++++
> > >>   include/drm/drm_color_mgmt.h     | 4 ++++
> > >>   2 files changed, 8 insertions(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_=
color_mgmt.c
> > >> index bb14f488c8f6..a183ebae2941 100644
> > >> --- a/drivers/gpu/drm/drm_color_mgmt.c
> > >> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> > >> @@ -469,6 +469,10 @@ static const char * const color_encoding_name[]=
 =3D {
> > >>   	[DRM_COLOR_YCBCR_BT601] =3D "ITU-R BT.601 YCbCr",
> > >>   	[DRM_COLOR_YCBCR_BT709] =3D "ITU-R BT.709 YCbCr",
> > >>   	[DRM_COLOR_YCBCR_BT2020] =3D "ITU-R BT.2020 YCbCr",
> > >> +	[DRM_COLOR_RGB_BT601] =3D "ITU-R BT.601 RGB",
> > >> +	[DRM_COLOR_RGB_BT709] =3D "ITU-R BT.709 RGB",
> > >> +	[DRM_COLOR_RGB_BT2020] =3D "ITU-R BT.2020 RGB",
> > >> +	[DRM_COLOR_P3] =3D "DCI-P3", =20
> > >=20
> > > These are a totally different thing than the YCbCr stuff.
> > > The YCbCr stuff just specifies the YCbCr<->RGB converison matrix,
> > > whereas these are I guess supposed to specify the primaries/whitepoin=
t?
> > > But without specifying what we're converting *to* these mean absolute=
ly
> > > nothing. Ie. I don't think they belong in this property.
> > >  =20
> >=20
> > If this is the intention I don't see it documented.
> >=20
> > I might have overlooked something but do we have a way to explicitly=20
> > specify today what *to* format the YCbCr color encodings convert into? =
 =20
>=20
> These just specific which YCbCr<->RGB matrix to use as specificed
> in the relevant standards. The primaries/whitepoint/etc. don't
> change at all.

Ville is correct here.

> > Would that be a combination of the output color encoding specified via=
=20
> > colorspace_property and the color space encoded in the primaries and=20
> > whitepoint of the hdr_output_metadata? =20

Conversion between YCbCR and RGB is not a color space conversion in the
sense of color spaces (chromaticity of primaries and white point). It
is a color model conversion or a color encoding conversion more like.

A benefit of YCbCr is that you can use less bandwidth to transmit the
same image and people won't realise that you lost anything: chroma
sub-sampling. Sub-sampling with RGB wouldn't work that well. It's a
lossy compression technique, but different standards use different
compression algorithms (well, matrices) to balance what gets lost.

> Those propertis only affect the infoframes. They don't apply any
> color processing to the data.

Indeed.

An example:

You start with YUV video you want to display. That means you have YCbCr
data using color space X and EOTF Foo. When you convert that to RGB,
the RGB data still has color space X and EOTF Foo. Then you use the
infoframe to tell your monitor that the data is in color space X and
using EOTF Foo.

At no point in that pipeline there is a color space transformation,
until the data actually reaches the monitor which may do magic things
to map color space X and EOTF Foo into what it can actually make as
light.

Or as with the traditional way, you don't care what color space or EOTF
your video uses or your monitor has. You just hope they are close
enough to look good enough that people don't see anything wrong. Close
your eyes and sing a happy song. With HDR and WCG, that totally breaks
down.

> > Fundamentally I don't see how the use of this property differs, whether=
=20
> > you translate from YCbCr or from RGB. In either case you're converting=
=20
> > from the defined input color space and pixel format to an output color=
=20
> > space and pixel format. =20
>=20
> The gamut does not change when you do YCbCr<->RGB conversion.

Right. Neither does dynamic range.

> > > The previous proposals around this topic have suggested a new
> > > property to specify a conversion matrix either explicitly, or
> > > via a separate enum (which would specify both the src and dst
> > > colorspaces). I've always argued the enum approach is needed
> > > anyway since not all hardware has a programmable matrix for
> > > this. But a fully programmable matrix could be nice for tone
> > > mapping purposes/etc, so we may want to make sure both are
> > > possible.
> > >=20
> > > As for the transfer func, the proposals so far have mostly just
> > > been to expose a programmable degamma/gamma LUTs for each plane.
> > > But considering how poor the current gamma uapi is we've thrown
> > > around some ideas how to allow the kernel to properly expose the
> > > hw capabilities. This is one of those ideas:
> > > https://lists.freedesktop.org/archives/dri-devel/2019-April/212886.ht=
ml>> I think that basic idea could be also be extended to allow fixed
> > > curves in case the hw doesn't have a fully programmable LUT. But
> > > dunno if that's relevant for your hw.
> > >  =20
> >=20
> > The problem with exposing gamma, whether per-plane or per-crtc, is that=
=20
> > it is hard to define an API that works for all the HW out there. The=20
> > capabilities for different HW differ a lot, not just between vendors bu=
t=20
> > also between generations of a vendor's HW.
> >=20
> > Another reason I'm proposing to define the color space (and gamma) of a=
=20
> > plane is to make this explicit. Up until the color space and gamma of a=
=20
> > plane or framebuffer are not well defined, which leads to drivers=20
> > assuming the color space and gamma of a buffer (for blending and other=
=20
> > purposes) and might lead to sub-optimal outcomes. =20
>=20
> The current state is that things just get passed through as is
> (apart from the crtc LUTs/CTM).

Right. I would claim that the kernel does not even want to know about
color spaces or EOTFs. Instead, the kernel should offer userspace ways
to program the hardware to do the color *transformations* it wants to
do. The color_encoding KMS property is already like this: it defines
the conversion matrix, not what the input or output are.

Infoframes being sent to displays are a different thing. They just tell
the monitor what kind of image data userspace has configured KMS to
send it, but does not change what KMS actually does with pixels.


Also, please, let's talk about EOTF and EOTF^-1 instead of gamma when
appropriate.

Electro-optical transfer function (EOTF) is very clear in what it
means: it is the mapping from electrical values (the non-linear pixel
values you are used to, good for storage and transmission) to optical
values (values that are linear in light intensity, therefore good for
things like blending and filtering).

Gamma is kind of the same, but when you use it in sentences it easily
becomes ambiguous. Like if you have "gamma corrected pixels", what does
that mean. Are they electrical values or optical values or maybe
electrical values with a different EOTF. What EOTF.

However, in KMS "gamma LUT" is kind of standardised terminology, and it
does not need to be an EOTF or inverse-EOTF. One can use a gamma LUT
for EETF, mapping from one EOTF to another, e.g. from data with content
EOTF to data with monitor EOTF.


Thanks,
pq

--Sig_/EjcagME61b9pLKqTnYEsSkE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCLyAIACgkQI1/ltBGq
qqegFg/+IsGrjhmUuTQJr1njzpbLEjFAx723foWf8MeRADktmuOAXnXgG3YA7RT2
bA4xO8jUFVMGKWt9A7e0vDZ9Fy8RkYe0cANIqKee3sYV+8QkCIt1eGdGSB6mJYIH
ObuIbIebQidJV11dW95T0QmBLtIo8hZ/ryG7Ud7fR99cEiASGj7AeIkzuyhdHp38
JJZUIiSIf6u+NBMcyDfJe4jrlMV8KFbLO5TdFI17283GO9sc1YERZfkaCH9EgHT3
6JtiCeoXi8LVPEtiRGwpZiXAfH8jH11AibS/CHR9g1gJBOzKBGRHBvi3hKej/7xe
42Jg+QZmekQdrfch1pLBOwH9lmRrBA7N6sy4cuo1zMS7TJh0vp0G5z7HHEI9bZHD
3/wH9PfslOaovExbTJf6bcazlrdTrD0VIHNOHzJHvMAU2Sui6gYlZjNJ7JcmnWpA
4AOF2QdBtsOp/dJw/KU2KMhDQ4hTCnF92cSE21sJ+QBySrNIXpKm5sztf54VWRXH
J4vpfiiulnHGV0KQ35BfIIfSLF/qIPIphYxGeBimTAwhsNwGjeBO14HIHvNZDZNF
9oLXQXQ7anIGiy4NgC5WlCX31S+h9SmihKu4AvzpR65fIJuXz01W3YkrhM41nKjb
j+Yy3aWbdvmg62pk5Wx1ujWPgIg6slDpiVK2OXtrBgOPx0t3RDM=
=7yvI
-----END PGP SIGNATURE-----

--Sig_/EjcagME61b9pLKqTnYEsSkE--

--===============1165730396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1165730396==--
