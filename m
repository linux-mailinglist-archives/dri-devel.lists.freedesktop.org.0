Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF749694045
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 10:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D01610E4ED;
	Mon, 13 Feb 2023 09:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECA610E4EB;
 Mon, 13 Feb 2023 09:01:44 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id s11so4115679edd.10;
 Mon, 13 Feb 2023 01:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=8Rmg6q5x8L2nqNAc0jBob7FrLg4BJ9y9ZXa5oP8eOkk=;
 b=JEVnTmJMO621oYT5TeJoPmYVlM54ThiReiB3Q+rwLkz5T+gheeCVcq7OkpVcw2K5lp
 KJIkQPknJ4EHB2pmD+pTVweU3uBHChIXpDQLReIyqS1Rb4BQ3peKmo6qR0Rjhe6nQHgJ
 FeGUdzdXpG+KgtQ6inRFSp35MtMAx+g5O+McCgM9YLJBuO02fMsenRUi1w5XSX42C4PX
 qLUjnbEM7cX50c7MzjLEzsHLpccgKv6DvLrUtF427Ib/OHRYpdVdH3LcjrcAKJRdJy5p
 vKKNaXdgZDriLnMg+M86ABZeBhsevWlW5hWYbkhKC95dm60Rhbgm4FF0/tSmDTy9gV3z
 8pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8Rmg6q5x8L2nqNAc0jBob7FrLg4BJ9y9ZXa5oP8eOkk=;
 b=Pookq6RK6rcOvtjn+ayzQyhMy3RGIh98iZQqiXXHSXPu73kVnjS5U7HP849bO4zTD2
 ZI9aegWjyzpdAoEvCArOh3PLObARgpiDktXSWjRq7glwzpzbyI3k/AAPvxr9XEqA3yg8
 EG7KaGzL+m0gXiMRUdhlQKcskFoZaMwKXfXDv3Ltf+WGgrVZO7Z9PD7LFxp4vkDDt4nT
 PLL6uy2nGMV5aiCpcDGhLcSJLwy7/0xthCD2UdT8vhLCYAOJPMBGwV9trVGa2EnUlsZM
 DNZTm48H/ke4AKvWZ88w/wJNcE4+EGAVqZH/q+i/qeccDx2qIWMYlIhyuilRy+DhgG5e
 XOfg==
X-Gm-Message-State: AO0yUKUNtho3CFoWNH9hdy4BP+irJK0LtAMVkKKKyhD/pZM4JBd+8nXM
 B5WqbVwaVlYqH+4tnsw6RQ4=
X-Google-Smtp-Source: AK7set/k9pFOxrFdROU6BHqx9B5Y+fsjdAWFwA+BuSYgyam5jnXJIeRgmkpbQ9oy3wFI+tIZffg4Wg==
X-Received: by 2002:a50:874a:0:b0:4ab:f6c:1a47 with SMTP id
 10-20020a50874a000000b004ab0f6c1a47mr17994312edv.31.1676278903147; 
 Mon, 13 Feb 2023 01:01:43 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q22-20020a056402033600b004ab1f97ca2csm1549779edw.60.2023.02.13.01.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 01:01:42 -0800 (PST)
Date: Mon, 13 Feb 2023 11:01:31 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface
Message-ID: <20230213110131.43434089@eldfell>
In-Reply-To: <7878175f-b81d-5ad3-bc84-3a95b3add301@amd.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
 <20230109153809.mmjm22oa2gkwe3sf@mail.igalia.com>
 <20230131110735.60f8ff04@eldfell>
 <20230209142702.7w4mqed6zqtk5m6g@mail.igalia.com>
 <20230210112846.2103eb00@eldfell>
 <7878175f-b81d-5ad3-bc84-3a95b3add301@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/477JHY3P2Fg.ZiRfHfLRHE2";
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
 amd-gfx@lists.freedesktop.org, alex.hung@amd.com, tzimmermann@suse.de,
 sunpeng.li@amd.com, Melissa Wen <mwen@igalia.com>, seanpaul@chromium.org,
 bhawanpreet.lakha@amd.com, sungjoon.kim@amd.com, Xinhui.Pan@amd.com,
 christian.koenig@amd.com, kernel-dev@igalia.com, alexander.deucher@amd.com,
 nicholas.kazlauskas@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/477JHY3P2Fg.ZiRfHfLRHE2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Feb 2023 14:47:50 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2/10/23 04:28, Pekka Paalanen wrote:
> > On Thu, 9 Feb 2023 13:27:02 -0100
> > Melissa Wen <mwen@igalia.com> wrote:
> >  =20
> >> On 01/31, Pekka Paalanen wrote: =20
> >>> On Mon, 9 Jan 2023 14:38:09 -0100
> >>> Melissa Wen <mwen@igalia.com> wrote:
> >>>    =20
> >>>> On 01/09, Melissa Wen wrote:   =20
> >>>>> Hi,
> >>>>>
> >>>>> After collecting comments in different places, here is a second ver=
sion
> >>>>> of the work on adding DRM CRTC 3D LUT support to the current DRM co=
lor
> >>>>> mgmt interface. In comparison to previous proposals [1][2][3], here=
 we
> >>>>> add 3D LUT before gamma 1D LUT, but also a shaper 1D LUT before 3D =
LUT,
> >>>>> that means the following DRM CRTC color correction pipeline:
> >>>>>
> >>>>> Blend -> Degamma 1D LUT -> CTM -> Shaper 1D LUT -> 3D LUT -> Gamma =
1D LUT   =20

...

> >>> +/*
> >>> + * struct drm_mode_lut3d_mode - 3D LUT mode information.
> >>> + * @lut_size: number of valid points on every dimension of 3D LUT.
> >>> + * @lut_stride: number of points on every dimension of 3D LUT.
> >>> + * @bit_depth: number of bits of RGB. If color_mode defines entries =
with higher
> >>> + *             bit_depth the least significant bits will be truncate=
d.
> >>> + * @color_format: fourcc values, ex. DRM_FORMAT_XRGB16161616 or DRM_=
FORMAT_XBGR16161616.
> >>> + * @flags: flags for hardware-sepcific features
> >>> + */
> >>> +struct drm_mode_lut3d_mode {
> >>> +	__u16 lut_size;
> >>> +	__u16 lut_stride[3];
> >>> +	__u16 bit_depth;
> >>> +	__u32 color_format;
> >>> +	__u32 flags;
> >>> +};

...

> >>> What is "number of bits of RGB"? Input precision? Output precision?
> >>> Integer or floating point?   =20
> >>
> >> It's the bit depth of the 3D LUT values, the same for every channels. =
In
> >> the AMD case, it's supports 10-bit and 12-bit, for example. =20
> >=20
> > Ok. So e.g. r5g6b5 is not a possible 3D LUT element type on any
> > hardware ever?
> >  =20
>=20
> I haven't had a chance to go through all patches yet but if this is
> modeled after Alex Hung's work this should be covered by color_format.
> The idea is that color_format takes a FOURCC value and defines the
> format of the entries in the 3DLUT blob.
>=20
> The bit_depth describes the actual bit depth that the HW supports.
> E.g., color_format could be DRM_FORMAT_XRGB16161616 but HW might only
> support 12-bit precision. In that case the least significant bits get
> truncated.
>=20
> One could define the bit_depth per color, but I'm not sure that'll be
> necessary.

Exactly. I just have no idea how sure we should be about that.

> > What exactly is the truncation the comment refers to?
> >=20
> > It sounds like if input has higher precision than the LUT elements,
> > then "truncation" occurs. I can kind of see that, but I also think it
> > is a false characterisation. The LUT input precision affects the
> > precision of LUT indexing and the precision of interpolation between
> > the LUT elements. I would not expect those two precisions to be
> > truncated to the LUT element precision (but they could be truncated to
> > something else hardware specific). Instead, I do expect the
> > interpolation result to be truncated to the LUT output precision, which
> > probably is the same as the LUT element precision, but not necessarily.
> >=20
> > Maybe the comment about truncation should simply be removed? The result
> > is obvious if we know the LUT input, element, and output precision, and
> > what exactly happens with the indexing and interpolation is probably
> > good enough to be left hardware-specific if it is difficult to describe
> > in generic terms across different hardware.
> >  =20
>=20
> Maybe it makes sense to just drop the bit_depth field.

Well, it's really interesting information for userspace, but maybe it
should have a more holistic design. Precision is a factor, when
userspace considers whether it can use KMS hardware for a conversion or
not. Unfortunately, none of the existing KMS color pipeline elements
have any information on precision IIRC, so there is more to be fixed.

The interesting thing is the minimum guaranteed precision of each
element and the connections between them. It might be different for
pass-through vs. not. Another interesting thing is the usable value
range.

This is probably a complex problem, so there should be no need to solve
it before a 3D LUT interface can land, given old elements already have
the issue.


Thanks,
pq

--Sig_/477JHY3P2Fg.ZiRfHfLRHE2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPp/GsACgkQI1/ltBGq
qqd8CQ/+IKHJyfKiEtk4NbR1wk0m20wce/R/KZjDpvg686nB1z0kyWEijUlC0ffy
VWSUJ4+wIpjBYBNs69rk9SkunG4bCw7qLUBmBFkXWj/ZWZeLy7EWSfjJE31XKJZP
xcRZSJ7g/oxBS2AgNSDIAEUc4z+ZNrHUP0sxMPT+1oWeWv8up3TxfHdxF7VF+zC5
sf95UT/bg6i2TZx2Fy+SANtXpux7wOwBgyOlyIntUnKePn9rCsjRm9agVp04ojHa
+8Io9r7zXYpPifE+XsYqrzGOhN5vvbZvx0P+s2hS05o4zyuCdxBNSSSeNHbqtxnZ
RS2qCIhB1kVyzEtDnfcq5gKolJ3TnNrD64M1G3WrDQhh7jfBWdDYjip8WDTs4UH8
+6WyXvcoKZWkHaHs137EH7sFjFNCI9cSmhUB3Ja1NkPvQ7KylkraLViqoyS22ny3
Z/WRuZHXIVvE4jXicOHSZUtIfOr48TdB6SGFPtEVIqe8GNHfBu2bxA4e6MBnpKVn
uvxWLSu1tzz3FPKTKVsbfemsQksoiDK+1MIpmvcLO7HTaQG0dJCB7Hb1Ney8O/yR
5k6rVQ/hLDKuHO0jVR3Oe+vya8CpUgzheW+PhRxSowTwWfX0USdbbSEVU9aH7XDX
DRkXs+GZkYsB5CHq7lq6cUSi6tJvS2bmlXR5wc8uLranN0nUP8E=
=Wfmj
-----END PGP SIGNATURE-----

--Sig_/477JHY3P2Fg.ZiRfHfLRHE2--
