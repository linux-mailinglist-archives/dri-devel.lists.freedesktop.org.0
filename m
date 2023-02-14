Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E29695F2D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 10:28:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D78910E83D;
	Tue, 14 Feb 2023 09:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C013510E0C1;
 Tue, 14 Feb 2023 09:28:29 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id dr8so38412647ejc.12;
 Tue, 14 Feb 2023 01:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=U2HY+XqwPP+TGIsyVvKySQKukX9GpYq/skI3sOH5/u4=;
 b=D+4mtY2ccaZQ86GamNngCpRICPOigvppEIfmr7gn27mK05Ib835ndAAlr3tpdJVXWa
 ixhgqs+E7e6qQ8nCW3uDIyVeGUFCJKYMjSYR/C5vP9aBvYPuaeFk071qLPlM4WVD6UDu
 YfTlxSs7VUkywwRB72+QJiRQ1miNoRzuWSt7Lu7+JqjsqOoNrDuWmHqeG3f69eGNi9UW
 xi6jWMf4sk6b62zBP5xgvhJY4S7cPd+3CZ5TGzeQ03KrI+uEgHLg97lO5iZK3jCQtI16
 31shPi85MyihJKhSl7z6SSM6p4iFL4jeSwy+agbkz/hoxkSd+uzoRuJst6MrhZWOqDYi
 Uigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U2HY+XqwPP+TGIsyVvKySQKukX9GpYq/skI3sOH5/u4=;
 b=joIduEpiRSBsSiPLLi5Ei2v1jvnMW/3h2wyPY74hstUQh4keJnbTcL3iWwJ09e1hG2
 r3qqVCF+UK6ppZN6a1OvpRbIQFB7oHfvSZxUdl4AYOWCmzsQp2LzHWpfkvw/BQu5X+1L
 VlQokwPQvuPE+smgGLEH3tRbWFgFgLyp3ZRvxMv2oJvLKEfRgr7J7mFrOA5ArLzYVv4C
 NOu3o9PoeITZWeibF0PdE70HaBMj4a0Qol84uvJ6KgvtkP2jA2ZZ7kYWFWh9cBZGd1Pa
 X6fYPNopobXcgUYajoNZRggQLDdwmBdTHYJ222UBXUD/qhFNpEUWfbkRUUlO9TMS1fVN
 JScA==
X-Gm-Message-State: AO0yUKUPnbo+v6AsCzE1TQGbSsvTCnPLEPG5XYNfEPpSU6ML2bD9s9Ri
 0De7AoNWASJasPawADk2T0g=
X-Google-Smtp-Source: AK7set+Oymu5wQu4ZWjRbrthYObWFQ2F8thiSXYqiV1gFUCB17fX6psDAw8D5RyoCSn+ERRCo/F+hw==
X-Received: by 2002:a17:906:c52:b0:87b:d2b3:67ca with SMTP id
 t18-20020a1709060c5200b0087bd2b367camr2300883ejf.75.1676366908107; 
 Tue, 14 Feb 2023 01:28:28 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q23-20020a170906361700b008b1313009cdsm503963ejb.179.2023.02.14.01.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 01:28:27 -0800 (PST)
Date: Tue, 14 Feb 2023 11:28:23 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface
Message-ID: <20230214112823.5efd684c@eldfell>
In-Reply-To: <20230213194540.zo36uq27akdjvljv@mail.igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
 <20230109153809.mmjm22oa2gkwe3sf@mail.igalia.com>
 <20230131110735.60f8ff04@eldfell>
 <20230209142702.7w4mqed6zqtk5m6g@mail.igalia.com>
 <20230210112846.2103eb00@eldfell>
 <7878175f-b81d-5ad3-bc84-3a95b3add301@amd.com>
 <20230213110131.43434089@eldfell> <Y+o0++waAb83mXbU@intel.com>
 <20230213194540.zo36uq27akdjvljv@mail.igalia.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P2ZaEXUpGgm=fL3L.LhN1Sh";
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
Cc: dri-devel@lists.freedesktop.org, laurent.pinchart+renesas@ideasonboard.com,
 Shashank Sharma <shashank.sharma@amd.com>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com, alex.hung@amd.com,
 seanpaul@chromium.org, bhawanpreet.lakha@amd.com, sungjoon.kim@amd.com,
 tzimmermann@suse.de, Xinhui.Pan@amd.com, nicholas.kazlauskas@amd.com,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/P2ZaEXUpGgm=fL3L.LhN1Sh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 13 Feb 2023 18:45:40 -0100
Melissa Wen <mwen@igalia.com> wrote:

> On 02/13, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Mon, Feb 13, 2023 at 11:01:31AM +0200, Pekka Paalanen wrote: =20
> > > On Fri, 10 Feb 2023 14:47:50 -0500
> > > Harry Wentland <harry.wentland@amd.com> wrote:
> > >  =20
> > > > On 2/10/23 04:28, Pekka Paalanen wrote: =20
> > > > > On Thu, 9 Feb 2023 13:27:02 -0100
> > > > > Melissa Wen <mwen@igalia.com> wrote:
> > > > >    =20
> > > > >> On 01/31, Pekka Paalanen wrote:   =20
> > > > >>> On Mon, 9 Jan 2023 14:38:09 -0100
> > > > >>> Melissa Wen <mwen@igalia.com> wrote:
> > > > >>>      =20
> > > > >>>> On 01/09, Melissa Wen wrote:     =20
> > > > >>>>> Hi,
> > > > >>>>>
> > > > >>>>> After collecting comments in different places, here is a seco=
nd version
> > > > >>>>> of the work on adding DRM CRTC 3D LUT support to the current =
DRM color
> > > > >>>>> mgmt interface. In comparison to previous proposals [1][2][3]=
, here we
> > > > >>>>> add 3D LUT before gamma 1D LUT, but also a shaper 1D LUT befo=
re 3D LUT,
> > > > >>>>> that means the following DRM CRTC color correction pipeline:
> > > > >>>>>
> > > > >>>>> Blend -> Degamma 1D LUT -> CTM -> Shaper 1D LUT -> 3D LUT -> =
Gamma 1D LUT     =20
> > >=20
> > > ...
> > >  =20
> > > > >>> +/*
> > > > >>> + * struct drm_mode_lut3d_mode - 3D LUT mode information.
> > > > >>> + * @lut_size: number of valid points on every dimension of 3D =
LUT.
> > > > >>> + * @lut_stride: number of points on every dimension of 3D LUT.
> > > > >>> + * @bit_depth: number of bits of RGB. If color_mode defines en=
tries with higher
> > > > >>> + *             bit_depth the least significant bits will be tr=
uncated.
> > > > >>> + * @color_format: fourcc values, ex. DRM_FORMAT_XRGB16161616 o=
r DRM_FORMAT_XBGR16161616.
> > > > >>> + * @flags: flags for hardware-sepcific features
> > > > >>> + */
> > > > >>> +struct drm_mode_lut3d_mode {
> > > > >>> +	__u16 lut_size;
> > > > >>> +	__u16 lut_stride[3];
> > > > >>> +	__u16 bit_depth;
> > > > >>> +	__u32 color_format;
> > > > >>> +	__u32 flags;
> > > > >>> +}; =20
> > >=20
> > > ...
> > >  =20
> > > > >>> What is "number of bits of RGB"? Input precision? Output precis=
ion?
> > > > >>> Integer or floating point?     =20
> > > > >>
> > > > >> It's the bit depth of the 3D LUT values, the same for every chan=
nels. In
> > > > >> the AMD case, it's supports 10-bit and 12-bit, for example.   =20
> > > > >=20
> > > > > Ok. So e.g. r5g6b5 is not a possible 3D LUT element type on any
> > > > > hardware ever?
> > > > >    =20
> > > >=20
> > > > I haven't had a chance to go through all patches yet but if this is
> > > > modeled after Alex Hung's work this should be covered by color_form=
at.
> > > > The idea is that color_format takes a FOURCC value and defines the
> > > > format of the entries in the 3DLUT blob.
> > > >=20
> > > > The bit_depth describes the actual bit depth that the HW supports.
> > > > E.g., color_format could be DRM_FORMAT_XRGB16161616 but HW might on=
ly
> > > > support 12-bit precision. In that case the least significant bits g=
et
> > > > truncated.
> > > >=20
> > > > One could define the bit_depth per color, but I'm not sure that'll =
be
> > > > necessary. =20
> > >=20
> > > Exactly. I just have no idea how sure we should be about that.
> > >  =20
> > > > > What exactly is the truncation the comment refers to?
> > > > >=20
> > > > > It sounds like if input has higher precision than the LUT element=
s,
> > > > > then "truncation" occurs. I can kind of see that, but I also thin=
k it
> > > > > is a false characterisation. The LUT input precision affects the
> > > > > precision of LUT indexing and the precision of interpolation betw=
een
> > > > > the LUT elements. I would not expect those two precisions to be
> > > > > truncated to the LUT element precision (but they could be truncat=
ed to
> > > > > something else hardware specific). Instead, I do expect the
> > > > > interpolation result to be truncated to the LUT output precision,=
 which
> > > > > probably is the same as the LUT element precision, but not necess=
arily.
> > > > >=20
> > > > > Maybe the comment about truncation should simply be removed? The =
result
> > > > > is obvious if we know the LUT input, element, and output precisio=
n, and
> > > > > what exactly happens with the indexing and interpolation is proba=
bly
> > > > > good enough to be left hardware-specific if it is difficult to de=
scribe
> > > > > in generic terms across different hardware.
> > > > >    =20
> > > >=20
> > > > Maybe it makes sense to just drop the bit_depth field. =20
> > >=20
> > > Well, it's really interesting information for userspace, but maybe it
> > > should have a more holistic design. Precision is a factor, when
> > > userspace considers whether it can use KMS hardware for a conversion =
or
> > > not. Unfortunately, none of the existing KMS color pipeline elements
> > > have any information on precision IIRC, so there is more to be fixed.
> > >=20
> > > The interesting thing is the minimum guaranteed precision of each
> > > element and the connections between them. It might be different for
> > > pass-through vs. not. Another interesting thing is the usable value
> > > range.
> > >=20
> > > This is probably a complex problem, so there should be no need to sol=
ve
> > > it before a 3D LUT interface can land, given old elements already have
> > > the issue. =20
> >=20
> > Yeah, I think all the precision stuff is all better handled by
> > eg. the proposed GAMMA_MODE property or something similar.
> > It's going to be needed for 1D LUTs as well. 1D LUTs would
> > also need it to expose diffrent LUT sizes with different
> > precision tradeoffs.
> >=20
> > As for the 3D LUT blob, I don't think the blob needs any=20
> > strides/etc. either. I had none of that for my i915 version:
> > https://github.com/vsyrjala/linux/commits/3dlut
> > Just the LUT entries + blob size is sufficient. At least
> > for cube shaped LUTs. Dunno if anyone would have a need
> > for something else? =20
>=20
> I only use lut_size and bit_depth for programming a CRTC 3D LUT in this
> proposal, so far GAMMA_MODE also would fit. But don't know for
> pre-blending 3D LUT.

You mean in the driver, or in IGT? Surely every field of struct
drm_mode_lut3d_mode needs to be used and tested, for values that
are possible for the hardware?

If the struct has strides, then the driver must set them and userspace
must use them, naturally. Userspace like IGT cannot go and assume
something without even looking at the struct fields.

This is why I was surprised to see the IGT code ignore most of the
struct drm_mode_lut3d_mode fields.

> >=20
> > The two things the are absolutely needed:
> > - Position of the LUT in the pipeline. We've already
> >   seen at least two variants of this IIRC, so we'll
> >   likely need to define a unique property for each tap
> >   point. =20
>=20
> IIRC, I'd say three, since in rcar-du the 3D LUT is before the gamma
> LUT, but there isn't a shaper 1D LUT before 3D LUT.  I'd like to know
> how the gamma LUT pre-3D LUT acts on intel pipeline. If it's, in the
> end, somehow similar to a shaper LUT.
>=20
> I mean, if we don't name the LUTs after CTM, we could fit something
> similar in terms of dimensions, as:
>=20
> -> CTM -> 1D LUT -> 3D LUT -> 1D LUT =20

Yes, to me the LUT names have always been irrelevant. The names are
only a way to identify an element's position in the abstract KMS color
pipeline defined by all defined KMS properties.


Thanks,
pq

> > - The order the elements are stored in the blob. I didn't
> >   check if all the already known hw (amdgpu, i915, rcar-du,
> >   were there also others?) would agree on this or not.
> >   If yes, maybe just follow the hw order for all those,
> >   and if not, then I guess flip a few coins.
> >=20
> > --=20
> > Ville Syrj=C3=A4l=C3=A4
> > Intel =20


--Sig_/P2ZaEXUpGgm=fL3L.LhN1Sh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPrVDcACgkQI1/ltBGq
qqfY4hAAgT1tez5QNXLy4V/niv0wTNOqmqi+3YwKO5Nif9E6rdVsUmtjUMJWXnUl
TR9dR36EF9vMoeyqA18iRtuf4ZYg5gQayo4je44lsR2sz5CqCcTkn7rM7RBPEwsx
Npt3i9HRt2W+BGYLhNZGliTXqe90fNzKmAYYpr6cYUBQncqp3gQPkLtHVgj+Ln4N
xrXy68jAtTtB/R/S+xOTMWoGzfnSCV0w2JRz65T1EM8BxkK1XQvMMBuT9y5kGGHe
0NAX0iXZ95aASZM7wACTzIlloss9C2gjEFlvtUwNiu786qxorftPYDqzaFbE27+6
hgBF5mciw7niJHP63ADR7/w/uTID1gh/ERVFM/RwHmapm3eDrY6o5g+wD+V52r+j
fcUkXpsaW1IDh630UnLvZYtGqgPDl1k20zV78VBFNeuw2xhmUHEB3NEtoGSTHMzN
c4uX32/VM6Qlkszl1mNsxoB/4flI6T5YhlnBMpqMVkDSMPLk/p8bxW/k6d0Q2gYC
WZSozfNNXGe97/ZrU+p7w4Oj6aNAbiL3c5VT/ickcLN1NhRdQ62Wa73eOzBK6Lfh
6F/mU+YZoOSJGzBYa46HVotbPIpDjQYSrnV6M3FXcS+ZnqSa5m9YPVwTkgPThcaJ
yeNrpmh38hp7kg0O2V/+VHxOsSv+s4w93gBnOH1A/uoYY8NVsTk=
=J2sc
-----END PGP SIGNATURE-----

--Sig_/P2ZaEXUpGgm=fL3L.LhN1Sh--
