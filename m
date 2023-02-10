Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46354691B51
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 10:29:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666C710ECAA;
	Fri, 10 Feb 2023 09:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE0D10ECA9;
 Fri, 10 Feb 2023 09:29:00 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id v13so4177508eda.11;
 Fri, 10 Feb 2023 01:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=quSm//05FZ3Mf9A/c2P/iuYXdFqqPPvKrzDAlH3a5KU=;
 b=dBnuK0XtO7w5PrEf6S6TkewZVeXYTeXZR3yffGIYIEWxzaW/RKQpMijpfYoeDrKwwu
 zjMD7nonnqsA8emXCtCdKeRNEDh7a5dnsrv6/xwxuAUrvr8c0MdBLCLMkeGwIog70RTM
 0MukrRyADavjXcOSpz7ApvImg/GrIW8+AUfL9sFIh9TJtGMbJv45jX7hmA+p2WSkzuej
 zkICaRAsxBD25j8mwSQq2o+cXzWDusvVyQm+ivI0Sw/h64dx3WxvM0twCHt53R3X0p+N
 NdAYHqDR4YeYFjTVhEP2R9yoTAyQPxABIa3X8ggnafSNZNoklK4gf0WCHjL1qpsTZhVp
 U/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=quSm//05FZ3Mf9A/c2P/iuYXdFqqPPvKrzDAlH3a5KU=;
 b=jaHvlq1LR3jXm9umWuJWubdCOQXvlmc6RedcDMXrqPNi1fEMAgVU3AjuVvEhfeWGqq
 aY/6yTP24mNyEyJLWdZCjk8kQbaF69XWLJlQbhE5uJVfqMtX8284D1mxCxVz5rohrv78
 mETypx56kRtMX1TBxMlFZmvchi/GQE9m2rLZhhrm3NPnA1HfMufM0SDsQCxmY3Vh+AdS
 8xnND8OO9C2MuhkVVEymRWAUKCro7+yevhDbRdlh2SeAiuTt7cOFTf/SPqB2P7eD9t9n
 pwtQoAiwZfYTxkIWzmnp0IV2MJO5E9swj8wBbPcKeqjMoxQu/p163R8/hgzy7pN4Yckt
 RFVA==
X-Gm-Message-State: AO0yUKWCjoM2hZsDFMNWLTUoYWPnJeiR90McUdq8KqtoneunNXx7BAEK
 xK46fZWYyF2FMfRd4QsrR6A=
X-Google-Smtp-Source: AK7set8knvmIDgWtIWrwPk5/r3Lp+idUW9r1Ux0lkcWrdIcjPATJjH2zkAO7BwWQLV1L0SBrEGD5dQ==
X-Received: by 2002:a50:c34d:0:b0:4ab:4a90:c087 with SMTP id
 q13-20020a50c34d000000b004ab4a90c087mr1211469edb.9.1676021338910; 
 Fri, 10 Feb 2023 01:28:58 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 o8-20020a50c908000000b004a2666397casm1855714edh.63.2023.02.10.01.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 01:28:58 -0800 (PST)
Date: Fri, 10 Feb 2023 11:28:46 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface
Message-ID: <20230210112846.2103eb00@eldfell>
In-Reply-To: <20230209142702.7w4mqed6zqtk5m6g@mail.igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
 <20230109153809.mmjm22oa2gkwe3sf@mail.igalia.com>
 <20230131110735.60f8ff04@eldfell>
 <20230209142702.7w4mqed6zqtk5m6g@mail.igalia.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ukeGZyqCbDHSISHb4uTrpEQ";
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
 sunpeng.li@amd.com, seanpaul@chromium.org, bhawanpreet.lakha@amd.com,
 sungjoon.kim@amd.com, Xinhui.Pan@amd.com, christian.koenig@amd.com,
 kernel-dev@igalia.com, alexander.deucher@amd.com, nicholas.kazlauskas@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ukeGZyqCbDHSISHb4uTrpEQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Feb 2023 13:27:02 -0100
Melissa Wen <mwen@igalia.com> wrote:

> On 01/31, Pekka Paalanen wrote:
> > On Mon, 9 Jan 2023 14:38:09 -0100
> > Melissa Wen <mwen@igalia.com> wrote:
> >  =20
> > > On 01/09, Melissa Wen wrote: =20
> > > > Hi,
> > > >=20
> > > > After collecting comments in different places, here is a second ver=
sion
> > > > of the work on adding DRM CRTC 3D LUT support to the current DRM co=
lor
> > > > mgmt interface. In comparison to previous proposals [1][2][3], here=
 we
> > > > add 3D LUT before gamma 1D LUT, but also a shaper 1D LUT before 3D =
LUT,
> > > > that means the following DRM CRTC color correction pipeline:
> > > >=20
> > > > Blend -> Degamma 1D LUT -> CTM -> Shaper 1D LUT -> 3D LUT -> Gamma =
1D LUT =20
> >=20
> > Hi Melissa,
> >=20
> > that makes sense to me, for CRTCs. It would be really good to have that
> > as a diagram in the KMS UAPI documentation.
> >  =20
>=20
> Hi Pekka,
>=20
> Thanks for your feedbacks and your time reviewing this proposal.

No problem, and sorry it took so long!

I'm just finishing the catch-up with everything that happened during
winter holidays.

> > If someone wants to add a 3D LUT to KMS planes as well, then I'm not
> > sure if it should be this order or swapped. I will probably have an
> > opinion about that once Weston is fully HDR capable and has been tried
> > in the wild for a while with the HDR color operations fine-tuned based
> > on community feedback. IOW, not for a long time. The YUV to RGB
> > conversion factors in there as well.
> >  =20
> I see, this is also the reason I reuse here Alex Hung's proposal for
> pre-blending API. I'll work on better documentation.
>=20
> >  =20
> > > >=20
> > > > and we also add a DRM CRTC LUT3D_MODE property, based on Alex Hung
> > > > proposal for pre-blending 3D LUT [4] (Thanks!), instead of just a
> > > > LUT3D_SIZE, that allows userspace to use different supported settin=
gs of
> > > > 3D LUT, fitting VA-API and new color API better. In this sense, I
> > > > adjusted the pre-blending proposal for post-blending usage.
> > > >=20
> > > > Patches 1-6 targets the addition of shaper LUT and 3D LUT propertie=
s to
> > > > the current DRM CRTC color mgmt pipeline. Patch 6 can be considered=
 an
> > > > extra/optional patch to define a default value for LUT3D_MODE, insp=
ired
> > > > by what we do for the plane blend mode property (pre-multiplied).
> > > >=20
> > > > Patches 7-18 targets AMD display code to enable shaper and 3D LUT u=
sage
> > > > on DCN 301 (our HW case). Patches 7-9 performs code cleanups on cur=
rent
> > > > AMD DM colors code, patch 10 updates AMD stream in case of user 3D =
LUT
> > > > changes, patch 11/12 rework AMD MPC 3D LUT resource handling by con=
text
> > > > for DCN 301 (easily extendible to other DCN families). Finally, from
> > > > 13-18, we wire up SHAPER LUT, LUT3D and LUT3D MODE to AMD display
> > > > driver, exposing modes supported by HW and programming user shaper =
and
> > > > 3D LUT accordingly.
> > > >=20
> > > > Our target userspace is Gamescope/SteamOS.
> > > >=20
> > > > Basic IGT tests were based on [5][6] and are available here (in-pro=
gress):
> > > > https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commits/crtc-lu=
t3d-api
> > > >=20
> > > > [1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.pinc=
hart+renesas@ideasonboard.com/
> > > > [2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f30f9e5b=
dc17cbb4656fe23e69
> > > > [3] https://lore.kernel.org/amd-gfx/20220619223104.667413-1-mwen@ig=
alia.com/
> > > > [4] https://lore.kernel.org/dri-devel/20221004211451.1475215-1-alex=
.hung@amd.com/
> > > > [5] https://patchwork.freedesktop.org/series/90165/
> > > > [6] https://patchwork.freedesktop.org/series/109402/
> > > > [VA_API] http://intel.github.io/libva/structVAProcFilterParameterBu=
ffer3DLUT.html
> > > > [KMS_pipe_API] https://gitlab.freedesktop.org/pq/color-and-hdr/-/is=
sues/11
> > > >=20
> > > > Let me know your thoughts.   =20
> > >=20
> > > +Simon Ser, +Pekka Paalanen who might also be interested in this seri=
es. =20
> >=20
> > Unfortunately I don't have the patch emails to reply to, so here's a
> > messy bunch of comments. I'll concentrate on the UAPI design as always.=
 =20
>=20
> Sorry, the patchset is here: https://lore.kernel.org/dri-devel/2023010914=
3846.1966301-1-mwen@igalia.com/
> In the next version, I won't forget cc'ing you at first.
> >=20
> > +/*
> > + * struct drm_mode_lut3d_mode - 3D LUT mode information.
> > + * @lut_size: number of valid points on every dimension of 3D LUT.
> > + * @lut_stride: number of points on every dimension of 3D LUT.
> > + * @bit_depth: number of bits of RGB. If color_mode defines entries wi=
th higher
> > + *             bit_depth the least significant bits will be truncated.
> > + * @color_format: fourcc values, ex. DRM_FORMAT_XRGB16161616 or DRM_FO=
RMAT_XBGR16161616.
> > + * @flags: flags for hardware-sepcific features
> > + */
> > +struct drm_mode_lut3d_mode {
> > +	__u16 lut_size;
> > +	__u16 lut_stride[3];
> > +	__u16 bit_depth;
> > +	__u32 color_format;
> > +	__u32 flags;
> > +};
> >=20
> > Why is lut_stride an array of 3, but lut_size is not? =20
>=20
> It cames from VA-API:
> https://intel.github.io/libva/structVAProcFilterParameterBuffer3DLUT.html=
#a682756be15d09327ba725b74a863cbcc
>=20
> In short, the reason is that lut_size is the valid points and is
> the same for every dimensions, but lut_stride may vary.

Ok, so lut_size is what I would have guessed it to be. Just needs to be
doc'd - pretty much all my questions are lack of docs.

I see that lut_stride is supposed to be in points, and not bytes. That
is surprising. Are you sure it's good?

> >=20
> > What is the color_mode the comment is referring to? =20
>=20
> It refers to FB color_mode/bpp. I'm not using it in post-blending 3D LUT
> implementation (should I?), it cames from pre-blending use case.  Maybe
> the main issue here is if reusing the pre-blending 3D LUT mode struct is
> a good approach or better create a specific for post-blending.

Sorry, I have no idea what FB color_mode is. I do not recall any such
thing in the KMS uAPI.


> >=20
> > What is "number of bits of RGB"? Input precision? Output precision?
> > Integer or floating point? =20
>=20
> It's the bit depth of the 3D LUT values, the same for every channels. In
> the AMD case, it's supports 10-bit and 12-bit, for example.

Ok. So e.g. r5g6b5 is not a possible 3D LUT element type on any
hardware ever?

What exactly is the truncation the comment refers to?

It sounds like if input has higher precision than the LUT elements,
then "truncation" occurs. I can kind of see that, but I also think it
is a false characterisation. The LUT input precision affects the
precision of LUT indexing and the precision of interpolation between
the LUT elements. I would not expect those two precisions to be
truncated to the LUT element precision (but they could be truncated to
something else hardware specific). Instead, I do expect the
interpolation result to be truncated to the LUT output precision, which
probably is the same as the LUT element precision, but not necessarily.

Maybe the comment about truncation should simply be removed? The result
is obvious if we know the LUT input, element, and output precision, and
what exactly happens with the indexing and interpolation is probably
good enough to be left hardware-specific if it is difficult to describe
in generic terms across different hardware.

> >=20
> > Flags cannot be hardware specific, because it makes the whole KMS UAPI
> > hardware specific. That won't work. You have to have driver-agnostic
> > definitions for all possible flags.
> >=20
> > Why is this the whole first patch? There is no documentation for the
> > UAPI on how this struct works, so I cannot review this. Explaining just
> > the individual fields is not enough to understand it. Is this something
> > the kernel fills in and is read-only to userspace? Is userspace filling
> > this in? =20
>=20
> I see. I'll work on explaining/documenting it better.
> >=20
> >=20
> > + * =E2=80=9CLUT3D=E2=80=9D:
> > + *	Blob property to set the 3D LUT mapping pixel data after the color
> > + *	transformation matrix and before gamma 1D lut correction. The
> > + *	data is interpreted as an array of &struct drm_color_lut elements.
> > + *	Hardware might choose not to use the full precision of the LUT
> > + *	elements.
> > + *
> > + *	Setting this to NULL (blob property value set to 0) means a the out=
put
> > + *	color is identical to the input color. This is generally the driver
> > + *	boot-up state too. Drivers can access this blob through
> > + *	&drm_crtc_state.gamma_lut.
> > + *
> >=20
> > You need to define how the 1-D array of drm_color_lut elements blob
> > will be interpreted as a 3-D array for the 3D LUT, and how the
> > dimensions match to the R, G and B channels. It's a bit like the
> > question about row-major or column-major storage for matrices, except
> > more complicated and not in those words. =20
>=20
> ack
> >=20
> > + * =E2=80=9CLUT3D_MODE=E2=80=9D:
> > + *	Enum property to give the mode of the 3D lookup table to be set on =
the
> > + *	LUT3D property. A mode specifies size, stride, bit depth and color
> > + *	format and depends on the underlying hardware). If drivers support
> > + *	multiple 3D LUT modes, they should be declared in a array of
> > + *	drm_color_lut3d_mode and they will be advertised as an enum.
> >=20
> > How does that work exactly? I didn't get it. I could guess, but having
> > to guess on API is bad. =20
>=20
> The driver advertises all supported modes (each combination of values)
> in a array as a enum, userspace can check all accepted modes and set the
> one that fits the user 3D LUT settings. I think it's possible to get the
> idea from this IGT test:
> https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commit/8771f444c3dcd1=
26d7590d5a9b1b0db9706bbf6e#ed5dbc960ac210e3fbacd2361fe0270709767aaa_205_205
> >=20

You lost me at "an array as an enum".

I understand there is a blob containing an array of struct
drm_mode_lut3d_mode. What I don't understand is that you say LUT3D_MODE
is an enum property. Where does the blob come from, then? What property
provides the blob?

Am I correct in guessing that the values of LUT3D_MODE enum property
are indices into the array in the blob, and that userspace will set it?
That sounds good to me, if it's the integer value of the enum. But enum
values also need string names, because that is how the values are
usually recognized, so what name strings will be used?

In that code example, I cannot see any connection between the array of
drm_mode_lut3d_mode entries, the 'name' string, and the actual data
generated for the LUT. They must all connect somehow, but it just
doesn't seem to be in the code. It is just hardcoding mode_lut3d[0],
and the data generator never sees even that - it gets the lut size, but
none of the other parameters. I cannot see that working across multiple
drivers.

Why is it setting a linear shaper LUT explicitly instead of unsetting
it? I mean this preparation:

shaper_linear =3D generate_table(data->shaper_lut_size, 1.0);

"Linear" actually means "identity", right? That's what people usually
write when they mean identity.

Surely it's not actually a constant curve? That would make the whole
test useless for proving the 3D LUT works.


> >=20
> > +	/**
> > +	 * @lut3d:
> > +	 *
> > +	 * 3D Lookup table for converting pixel data. Position where it takes
> > +	 * place depends on hw design, after @ctm or @gamma_lut. See
> > +	 * drm_crtc_enable_color_mgmt(). The blob (if not NULL) is an array of
> > +	 * &struct drm_color_lut.
> > +	 */
> > +	struct drm_property_blob *lut3d;
> >=20
> > I do not like the wording of "depends on hw design", and it is used in
> > very many places here. The KMS UAPI semantics cannot vary based on
> > hardware. Your cover letter defines the order in the color pipeline, so
> > I don't understand how this here can depend on hw.
> >=20
> > What can depend on hardware is which KMS UAPI properties are exposed,
> > and how you map a property to a hardware unit (which can even change
> > based on the exact pipeline configuration as long as the results are as
> > the UAPI doc defines). But this comment here is talking about the UAPI
> > properties, not hw elements.
> >  =20
>=20
> You are right! My initial idea was to explain that it's possible for
> other vendors color pipeline to fit this pipeline internally, if they
> need a 1D LUT before the 3D LUT, but not the 1D LUT in the end.
>=20
> >=20
> > I'm happy that the 3D LUT interface is being developed, but as you can
> > see from my questions, the UAPI documentation is practically missing. I
> > would have no idea how to use this as is. =20
>=20
> Thank you again for your valuable comments. I'll address your comments
> in a next version by better explaining all these points.

Thank you for working on this!
pq

--Sig_/ukeGZyqCbDHSISHb4uTrpEQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPmDk4ACgkQI1/ltBGq
qqdFVA//dbJauvGEvNiPC9TiQjhWLJc782S+3M1u/KXbcB1zVZHKimqrqWHv5qa2
F3oCo/LvEbtZ5D6R8Yiys8LJfRkwjE2DWCIDxVdZ9mMOEiKFu72iNteZgnbi31Ba
7du06h8UIJSFLn0IAb1fNGNtrUVH+q3QKiNaaPYoTX6QIBlwei9ZdQPT3o+Gisux
I0E0QcWWflLIEYJ8hMJPfXqgw+5kCDyH0o8VdmuelLJkkAov5gnlllQBN4ri/pW3
dAg/uwR5zppuyj/n4OIWmI20voRG8cn5hQOrmO6D4d3ekgJsPui2fvY0SiN+4eYT
IljB0pAD9F29ekvYTEeBo1J2+SvaBNJOqzn80hsfHgJx0ROZB42PkFN2rjNLZ09Z
44/TY+ASDEdo3VvlTbkj2j9C1qJKrcCbh9wtBZ3t2vSD5RwV6vUkONx91UhX/jIX
XenlZa4pjbnLoQ42q1KW1DwhcKW6gMBWNFRRBa1zGJ1Lns4q9YBehPk3383k8i3s
0L+m7LiZpr/HxVA6+t1ZaY0CM25Q9i7QOHaK3QGUtzgyw08v2QueLzv2F4kNRjaD
sX0qJGGcypAxTAdFIwaySkDkotH4juuHMQEkP9FS40a0Jzmg7HAjp+cgKbfUYRgP
gpz4TR7SdEiYiFuJey4/uItm9fDADs/PGPHWP1nJ2iyDHpOF52I=
=GQzS
-----END PGP SIGNATURE-----

--Sig_/ukeGZyqCbDHSISHb4uTrpEQ--
