Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0AF695ECC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 10:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577A510E832;
	Tue, 14 Feb 2023 09:19:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D8A10E830;
 Tue, 14 Feb 2023 09:19:54 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qb15so36384739ejc.1;
 Tue, 14 Feb 2023 01:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=G/kFuBTpq32khvH2/9N8l5BjOW1D4F9OtDofAv27tTU=;
 b=hUX0N9YNhTIh5qvFci3xNZO/OhSBFFvEWO4D5vyoTCt1J2pDkKe/TKkBbnY6qRi7mH
 G/bzFYSgiCfvxzZu5nx6ro3QpfSsrdHdv4Ewo32niNZPg0dnJvs69ZqebJGyb+dejzs2
 rKKU02Z6tch/+WyiDMS7eSIuE/qfNsxRBt0oCD5u+TiRu2g8qr+r7peSh0vte3D7RtsI
 wQo+FS6gdUUnSbjnjNhJnIYcd0F7N4j3DO6eR2A/68ZsTAYthz3TKuPcMdplyyPVanCn
 VqGIh8X1+ejMbQv6k4c/ps4XjFq1e9UcDwRAij3OGbOo2TS09o5yT0fZsW7O4fbLOOKc
 8D/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G/kFuBTpq32khvH2/9N8l5BjOW1D4F9OtDofAv27tTU=;
 b=kDSL2mJAn+o+UiRzKFqMMhfVNVS6sQ3PCW1q7C6BLCVOpxql4UJ76bSVw55Sg5GeDU
 k17h/oALmp1WViXkIQqjzQWcjIrmU4SNUOsZeL3NfBXaJx/1vXZT/DW5whPMOshNQ7pX
 p3ljizFu+lbCMqjVlmPcZLlyuirRqvZrgHYoxn8pTWYXaaM388t6h7d0Y3U6uNaJRyPY
 iUfBrsn3FtVPQj/+qCugGZn4pL1OtmFOn1MLAIwyVK0Jvzx5BtvK1+WKpC8o6h9I1rqu
 BdqeM0lO/21JmYJlkCQ9i8lehmSjsr4MTWzY2ezJCqe6PinzHT/rMZls57H5qG/TJ+L8
 HveA==
X-Gm-Message-State: AO0yUKWc+tnpiQGlczzlBKU+tutfA+M/Lo6PgFlGGSTuo+AFB88ZMoQf
 d7B69X2x9S1e0MQpkSB4IlM=
X-Google-Smtp-Source: AK7set96FnbjHjeoinbSn6OJdaP9QWUglCVRu/qt3A4Rm6ZIROvpuft22rrrVzPKqj2XYUfKQ+YMQQ==
X-Received: by 2002:a17:906:4e0a:b0:87b:59d9:5a03 with SMTP id
 z10-20020a1709064e0a00b0087b59d95a03mr1985202eju.36.1676366392968; 
 Tue, 14 Feb 2023 01:19:52 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 c11-20020a170906924b00b0088cd8f7255fsm8004093ejx.48.2023.02.14.01.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 01:19:52 -0800 (PST)
Date: Tue, 14 Feb 2023 11:19:47 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface
Message-ID: <20230214111947.44aa177d@eldfell>
In-Reply-To: <20230213192655.mac3fhhb2aayffiw@mail.igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
 <20230109153809.mmjm22oa2gkwe3sf@mail.igalia.com>
 <20230131110735.60f8ff04@eldfell>
 <20230209142702.7w4mqed6zqtk5m6g@mail.igalia.com>
 <20230210112846.2103eb00@eldfell>
 <20230213192655.mac3fhhb2aayffiw@mail.igalia.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zLVHc_0x1IFA/NK/waQ6nIY";
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

--Sig_/zLVHc_0x1IFA/NK/waQ6nIY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 13 Feb 2023 18:26:55 -0100
Melissa Wen <mwen@igalia.com> wrote:

> On 02/10, Pekka Paalanen wrote:
> > On Thu, 9 Feb 2023 13:27:02 -0100
> > Melissa Wen <mwen@igalia.com> wrote:
> >  =20
> > > On 01/31, Pekka Paalanen wrote: =20
> > > > On Mon, 9 Jan 2023 14:38:09 -0100
> > > > Melissa Wen <mwen@igalia.com> wrote:
> > > >    =20
> > > > > On 01/09, Melissa Wen wrote:   =20
> > > > > > Hi,
> > > > > >=20
> > > > > > After collecting comments in different places, here is a second=
 version
> > > > > > of the work on adding DRM CRTC 3D LUT support to the current DR=
M color
> > > > > > mgmt interface. In comparison to previous proposals [1][2][3], =
here we
> > > > > > add 3D LUT before gamma 1D LUT, but also a shaper 1D LUT before=
 3D LUT,
> > > > > > that means the following DRM CRTC color correction pipeline:
> > > > > >=20
> > > > > > Blend -> Degamma 1D LUT -> CTM -> Shaper 1D LUT -> 3D LUT -> Ga=
mma 1D LUT   =20
> > > >=20
> > > > Hi Melissa,
> > > >=20
> > > > that makes sense to me, for CRTCs. It would be really good to have =
that
> > > > as a diagram in the KMS UAPI documentation.
> > > >    =20
> > >=20
> > > Hi Pekka,
> > >=20
> > > Thanks for your feedbacks and your time reviewing this proposal. =20
> >=20
> > No problem, and sorry it took so long!
> >=20
> > I'm just finishing the catch-up with everything that happened during
> > winter holidays.
> >  =20
> > > > If someone wants to add a 3D LUT to KMS planes as well, then I'm not
> > > > sure if it should be this order or swapped. I will probably have an
> > > > opinion about that once Weston is fully HDR capable and has been tr=
ied
> > > > in the wild for a while with the HDR color operations fine-tuned ba=
sed
> > > > on community feedback. IOW, not for a long time. The YUV to RGB
> > > > conversion factors in there as well.
> > > >    =20
> > > I see, this is also the reason I reuse here Alex Hung's proposal for
> > > pre-blending API. I'll work on better documentation.
> > >  =20
> > > >    =20
> > > > > >=20
> > > > > > and we also add a DRM CRTC LUT3D_MODE property, based on Alex H=
ung
> > > > > > proposal for pre-blending 3D LUT [4] (Thanks!), instead of just=
 a
> > > > > > LUT3D_SIZE, that allows userspace to use different supported se=
ttings of
> > > > > > 3D LUT, fitting VA-API and new color API better. In this sense,=
 I
> > > > > > adjusted the pre-blending proposal for post-blending usage.
> > > > > >=20
> > > > > > Patches 1-6 targets the addition of shaper LUT and 3D LUT prope=
rties to
> > > > > > the current DRM CRTC color mgmt pipeline. Patch 6 can be consid=
ered an
> > > > > > extra/optional patch to define a default value for LUT3D_MODE, =
inspired
> > > > > > by what we do for the plane blend mode property (pre-multiplied=
).
> > > > > >=20
> > > > > > Patches 7-18 targets AMD display code to enable shaper and 3D L=
UT usage
> > > > > > on DCN 301 (our HW case). Patches 7-9 performs code cleanups on=
 current
> > > > > > AMD DM colors code, patch 10 updates AMD stream in case of user=
 3D LUT
> > > > > > changes, patch 11/12 rework AMD MPC 3D LUT resource handling by=
 context
> > > > > > for DCN 301 (easily extendible to other DCN families). Finally,=
 from
> > > > > > 13-18, we wire up SHAPER LUT, LUT3D and LUT3D MODE to AMD displ=
ay
> > > > > > driver, exposing modes supported by HW and programming user sha=
per and
> > > > > > 3D LUT accordingly.
> > > > > >=20
> > > > > > Our target userspace is Gamescope/SteamOS.
> > > > > >=20
> > > > > > Basic IGT tests were based on [5][6] and are available here (in=
-progress):
> > > > > > https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commits/crt=
c-lut3d-api
> > > > > >=20
> > > > > > [1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.=
pinchart+renesas@ideasonboard.com/
> > > > > > [2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f30f=
9e5bdc17cbb4656fe23e69
> > > > > > [3] https://lore.kernel.org/amd-gfx/20220619223104.667413-1-mwe=
n@igalia.com/
> > > > > > [4] https://lore.kernel.org/dri-devel/20221004211451.1475215-1-=
alex.hung@amd.com/
> > > > > > [5] https://patchwork.freedesktop.org/series/90165/
> > > > > > [6] https://patchwork.freedesktop.org/series/109402/
> > > > > > [VA_API] http://intel.github.io/libva/structVAProcFilterParamet=
erBuffer3DLUT.html
> > > > > > [KMS_pipe_API] https://gitlab.freedesktop.org/pq/color-and-hdr/=
-/issues/11
> > > > > >=20
> > > > > > Let me know your thoughts.     =20
> > > > >=20
> > > > > +Simon Ser, +Pekka Paalanen who might also be interested in this =
series.   =20
> > > >=20
> > > > Unfortunately I don't have the patch emails to reply to, so here's a
> > > > messy bunch of comments. I'll concentrate on the UAPI design as alw=
ays.   =20
> > >=20
> > > Sorry, the patchset is here: https://lore.kernel.org/dri-devel/202301=
09143846.1966301-1-mwen@igalia.com/
> > > In the next version, I won't forget cc'ing you at first. =20
> > > >=20
> > > > +/*
> > > > + * struct drm_mode_lut3d_mode - 3D LUT mode information.
> > > > + * @lut_size: number of valid points on every dimension of 3D LUT.
> > > > + * @lut_stride: number of points on every dimension of 3D LUT.
> > > > + * @bit_depth: number of bits of RGB. If color_mode defines entrie=
s with higher
> > > > + *             bit_depth the least significant bits will be trunca=
ted.
> > > > + * @color_format: fourcc values, ex. DRM_FORMAT_XRGB16161616 or DR=
M_FORMAT_XBGR16161616.
> > > > + * @flags: flags for hardware-sepcific features
> > > > + */
> > > > +struct drm_mode_lut3d_mode {
> > > > +	__u16 lut_size;
> > > > +	__u16 lut_stride[3];
> > > > +	__u16 bit_depth;
> > > > +	__u32 color_format;
> > > > +	__u32 flags;
> > > > +};
> > > >=20
> > > > Why is lut_stride an array of 3, but lut_size is not?   =20
> > >=20
> > > It cames from VA-API:
> > > https://intel.github.io/libva/structVAProcFilterParameterBuffer3DLUT.=
html#a682756be15d09327ba725b74a863cbcc
> > >=20
> > > In short, the reason is that lut_size is the valid points and is
> > > the same for every dimensions, but lut_stride may vary. =20
> >=20
> > Ok, so lut_size is what I would have guessed it to be. Just needs to be
> > doc'd - pretty much all my questions are lack of docs.
> >=20
> > I see that lut_stride is supposed to be in points, and not bytes. That
> > is surprising. Are you sure it's good?
> >  =20
> > > >=20
> > > > What is the color_mode the comment is referring to?   =20
> > >=20
> > > It refers to FB color_mode/bpp. I'm not using it in post-blending 3D =
LUT
> > > implementation (should I?), it cames from pre-blending use case.  May=
be
> > > the main issue here is if reusing the pre-blending 3D LUT mode struct=
 is
> > > a good approach or better create a specific for post-blending. =20
> >=20
> > Sorry, I have no idea what FB color_mode is. I do not recall any such
> > thing in the KMS uAPI.
> >=20
> >  =20
> > > >=20
> > > > What is "number of bits of RGB"? Input precision? Output precision?
> > > > Integer or floating point?   =20
> > >=20
> > > It's the bit depth of the 3D LUT values, the same for every channels.=
 In
> > > the AMD case, it's supports 10-bit and 12-bit, for example. =20
> >=20
> > Ok. So e.g. r5g6b5 is not a possible 3D LUT element type on any
> > hardware ever?
> >=20
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
> > > >=20
> > > > Flags cannot be hardware specific, because it makes the whole KMS U=
API
> > > > hardware specific. That won't work. You have to have driver-agnostic
> > > > definitions for all possible flags.
> > > >=20
> > > > Why is this the whole first patch? There is no documentation for the
> > > > UAPI on how this struct works, so I cannot review this. Explaining =
just
> > > > the individual fields is not enough to understand it. Is this somet=
hing
> > > > the kernel fills in and is read-only to userspace? Is userspace fil=
ling
> > > > this in?   =20
> > >=20
> > > I see. I'll work on explaining/documenting it better. =20
> > > >=20
> > > >=20
> > > > + * =E2=80=9CLUT3D=E2=80=9D:
> > > > + *	Blob property to set the 3D LUT mapping pixel data after the co=
lor
> > > > + *	transformation matrix and before gamma 1D lut correction. The
> > > > + *	data is interpreted as an array of &struct drm_color_lut elemen=
ts.
> > > > + *	Hardware might choose not to use the full precision of the LUT
> > > > + *	elements.
> > > > + *
> > > > + *	Setting this to NULL (blob property value set to 0) means a the=
 output
> > > > + *	color is identical to the input color. This is generally the dr=
iver
> > > > + *	boot-up state too. Drivers can access this blob through
> > > > + *	&drm_crtc_state.gamma_lut.
> > > > + *
> > > >=20
> > > > You need to define how the 1-D array of drm_color_lut elements blob
> > > > will be interpreted as a 3-D array for the 3D LUT, and how the
> > > > dimensions match to the R, G and B channels. It's a bit like the
> > > > question about row-major or column-major storage for matrices, exce=
pt
> > > > more complicated and not in those words.   =20
> > >=20
> > > ack =20
> > > >=20
> > > > + * =E2=80=9CLUT3D_MODE=E2=80=9D:
> > > > + *	Enum property to give the mode of the 3D lookup table to be set=
 on the
> > > > + *	LUT3D property. A mode specifies size, stride, bit depth and co=
lor
> > > > + *	format and depends on the underlying hardware). If drivers supp=
ort
> > > > + *	multiple 3D LUT modes, they should be declared in a array of
> > > > + *	drm_color_lut3d_mode and they will be advertised as an enum.
> > > >=20
> > > > How does that work exactly? I didn't get it. I could guess, but hav=
ing
> > > > to guess on API is bad.   =20
> > >=20
> > > The driver advertises all supported modes (each combination of values)
> > > in a array as a enum, userspace can check all accepted modes and set =
the
> > > one that fits the user 3D LUT settings. I think it's possible to get =
the
> > > idea from this IGT test:
> > > https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commit/8771f444c3=
dcd126d7590d5a9b1b0db9706bbf6e#ed5dbc960ac210e3fbacd2361fe0270709767aaa_205=
_205 =20
> > > >  =20
> >=20
> > You lost me at "an array as an enum".
> >=20
> > I understand there is a blob containing an array of struct
> > drm_mode_lut3d_mode. What I don't understand is that you say LUT3D_MODE
> > is an enum property. Where does the blob come from, then? What property
> > provides the blob?
> >=20
> > Am I correct in guessing that the values of LUT3D_MODE enum property
> > are indices into the array in the blob, and that userspace will set it?
> > That sounds good to me, if it's the integer value of the enum. But enum
> > values also need string names, because that is how the values are
> > usually recognized, so what name strings will be used? =20
>=20
> So, in this proposal, LUT3D_MODE is a list of indexes for a blob that des=
cribe a supported
> 3D LUT mode

Hi Melissa,

are you sure? I believe you are looking at and explaining some kernel
internal APIs, and not the uAPI which is the important part. Internal
APIs can always be changed later, uAPI cannot.

After I had sent that email, I might have understood how it was
supposed to work instead: there is no array of struct
drm_mode_lut3d_mode.

Instead, LUT3D_MODE is a KMS property of type enum. Each integer value
of the enum is also a blob id. Each blob named by those ids is a single
struct drm_mode_lut3d_mode that userspace needs to retrieve individually
to understand what that specific enum value means.

> i.e. a `struct drm_mode_lut3d_mode` with size, stride, bit depth, etc. St=
rings here follow this pattern
> `lut3d_{size}_{bit_depth}bit` [1]. When enabling 3D LUT support, the
> driver should pass an array of `struct drm_mode_lut3d_mode` as supported
> modes, with at least one element.

To be clear, I do not care about kernel internal interfaces at all. I
only care about the uAPI. Therefore talking about kernel internal API
will only confuse me and every other userspace developer. Evidently it
has even confused some IGT developers, as I point out some IGT code
problems below.

If the struct drm_mode_lut3d_mode is the authoritative definition of
what each enum value means, then I think the string names should not
attempt to convey any meaning nor information. The strings should be
just "blob id 77" etc. That makes it clear what the value is.

Otherwise userspace will be tempted to use the string names only (as is
the usual uAPI design) to find the right enum value, and not look into
the struct drm_mode_lut3d_mode at all. Therefore, if you don't encode
absolutely everything of struct drm_mode_lut3d_mode into the string
name, you should encode nothing in the name. You might also have two
different descriptions ending up with the same string name under the
same enum property instance, and that must not happen.

> I think this drm_info output helps to understand the idea. Currently, we
> have 5 DRM CRTC color mgmt properties. The drm_info output for them:
>=20
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"DEGAMMA_LUT": bl=
ob =3D 0
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"DEGAMMA_LUT_SIZE=
" (immutable): range [0, UINT32_MAX] =3D 4096
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"CTM": blob =3D 0
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"GAMMA_LUT": blob=
 =3D 0
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"GAMMA_LUT_SIZE" =
(immutable): range [0, UINT32_MAX] =3D 4096
>=20
> The idea is to add 4 new properties.
>=20
> - The 3D LUT blob (LUT3D) and the indexes of supported modes
>   (LUT3D_MODE), as follows (example with AMD supported modes):
>=20
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"LUT3D": blob =3D=
 0
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"LUT3D_MODE": enu=
m {lut3d_17_12bit, lut3d_17_10bit, lut3d_9_12bit, lut3d_9_10bit} =3D lut3d_=
17_12bit

Ok, but this does not show the difference between an index into an
array of struct drm_mode_lut3d_mode, and each enum value being a blob
id containing a single struct drm_mode_lut3d_mode.

>=20
> - And shaper (1D) LUT - following what we already have for degamma/gamma =
LUT:
>=20
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"SHAPER_LUT": blo=
b =3D 0
> =E2=94=82           =E2=94=94=E2=94=80=E2=94=80=E2=94=80"SHAPER_LUT_SIZE"=
 (immutable): range [0, UINT32_MAX] =3D 4096
>=20
>=20
> Each LUT3D_MODE element works as a index to get the blob for the
> corresponding `struct drm_mode_lut3d_mode` ([2] may works as an
> example). I've also included a patch to set the first element of the
> list of supported mode as a predefined value [3], but maybe it's not
> necessary (or even error prone).

Are you sure about that terminology in the uAPI?

A blob id is not an index. If you do have an index, then which KMS
property is going to tell userspace what is the blob id that contains
the whole array? I haven't seen any KMS property for that yet.

> [1] https://lore.kernel.org/dri-devel/20230109143846.1966301-5-mwen@igali=
a.com/

Actually, in that patch, I see a loop that creates a new blob from each
element in a kernel-private array of struct drm_mode_lut3d_mode.

> [2] https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commit/a7b11bab9d=
573e38e26982b5cc5cf62e9dca6a75#ed5dbc960ac210e3fbacd2361fe0270709767aaa_886=
_886

That is userspace code, which does:

	mode_3dlut =3D (struct drm_mode_3dlut_mode *) blob->data;
	count =3D blob->length / sizeof(mode_3dlut[0]);
	igt_assert(count);

	for (i =3D 0; i < count; i++) {

That code is semantically wrong. The blob data is never an array. It is
always a single struct drm_mode_lut3d_mode. This code is misleading the
reader really hard.


> [3] https://lore.kernel.org/dri-devel/20230109143846.1966301-7-mwen@igali=
a.com/

Well, it's an enum property. A property always has some value. An enum
must always enumerate all possible values. Therefore, you cannot ever
avoid setting some value as the default.

If you set zero as a value, then zero must also be enumerated.

I mentioned before that the drm_mode_lut3d_mode values should be named
"blob id %u". The zero value is not a blob id, it is a true constant
instead, so its name can be e.g. "pass-through" if that is what it
means. Or maybe that doesn't make sense, because setting the LUT3D
property to zero means "pass-through", in which case zero is not a
valid value for LUT3D_MODE ever, not even in the kernel (but sounds
like the DRM core does not guard against the driver setting enum values
that do not exist).

Note, that value zero literally means "no data". It is not the index to
the first struct drm_mode_lut3d_mode element. So the userspace code of
[2] is actually broken with respect to this: it will attempt to fetch a
blob id 0, and crash an assert.

If it does not crash, then I think the enum description is lying to
userspace: zero is a valid value that is not listed as existing.

Or is there some uAPI specification somewhere saying that any enum
property can be set to zero as well, regardless of what values are
listed as possible? I would hope not.

> >=20
> > In that code example, I cannot see any connection between the array of
> > drm_mode_lut3d_mode entries, the 'name' string, and the actual data
> > generated for the LUT. They must all connect somehow, but it just
> > doesn't seem to be in the code. It is just hardcoding mode_lut3d[0],
> > and the data generator never sees even that - it gets the lut size, but
> > none of the other parameters. I cannot see that working across multiple
> > drivers.
> >=20
> > Why is it setting a linear shaper LUT explicitly instead of unsetting
> > it? I mean this preparation:
> >=20
> > shaper_linear =3D generate_table(data->shaper_lut_size, 1.0);
> >=20
> > "Linear" actually means "identity", right? That's what people usually
> > write when they mean identity.
> >=20
> > Surely it's not actually a constant curve? That would make the whole
> > test useless for proving the 3D LUT works. =20
>=20
> So, the idea of the test is only set a 3D LUT, without any shaper LUT
> and see if the 3D LUT maps to max color values. However, from my tests
> on AMD HW with 3D LUT support, I was not able to program a 3D LUT
> without a shaper LUT, that means a shaper LUT in BYPASS mode. By
> comparing CRC results I could see that if I don't set any shaper LUT,
> the driver sets shaper LUT in BYPASS mode but the 3D LUT is just
> ignored, so the combo shaper + 3D LUT seems a HW requirement. To
> overcome this requirement and keep the expected behavior, the test sets
> a linear shaper LUT to acts as a BYPASS LUT to overcome this
> requirement. Am I missing something?

Sorry, no, I just had no idea what generate_table(..., 1.0) does. I
confused it with generate_table_max() which I have seen used before.

However, this exposes a kernel bug: the driver requires both the shaper
and the 3D LUT. If userspace sets the shaper to pass-through, you say
the 3D LUT gets ignored. That's a bug: the if the driver cannot make 3D
LUT work without a shaper, then it must invent an identity shaper when
userspace sets it to pass-through. Or fail the atomic commit.

Userspace could as well set the 3D LUT to pass-through and the shaper
to something else, and expect it to work. If the atomic test commit
does not fail, it must do what userspace prescribes.

You just cannot expose arbitrary hardware limitations to userspace like
that and silently malfunction if they are violated. At the very least
fail the atomic commit if you don't want to make it work in the driver.


Thanks,
pq

>=20
> It's a really simple test case, but I don't see how this approach
> invalidates the test results. To generalize the test for other devices,
> I can restrict shaper LUT usage for AMD.
>=20
> Melissa
>=20
> >=20
> >  =20
> > > >=20
> > > > +	/**
> > > > +	 * @lut3d:
> > > > +	 *
> > > > +	 * 3D Lookup table for converting pixel data. Position where it t=
akes
> > > > +	 * place depends on hw design, after @ctm or @gamma_lut. See
> > > > +	 * drm_crtc_enable_color_mgmt(). The blob (if not NULL) is an arr=
ay of
> > > > +	 * &struct drm_color_lut.
> > > > +	 */
> > > > +	struct drm_property_blob *lut3d;
> > > >=20
> > > > I do not like the wording of "depends on hw design", and it is used=
 in
> > > > very many places here. The KMS UAPI semantics cannot vary based on
> > > > hardware. Your cover letter defines the order in the color pipeline=
, so
> > > > I don't understand how this here can depend on hw.
> > > >=20
> > > > What can depend on hardware is which KMS UAPI properties are expose=
d,
> > > > and how you map a property to a hardware unit (which can even change
> > > > based on the exact pipeline configuration as long as the results ar=
e as
> > > > the UAPI doc defines). But this comment here is talking about the U=
API
> > > > properties, not hw elements.
> > > >    =20
> > >=20
> > > You are right! My initial idea was to explain that it's possible for
> > > other vendors color pipeline to fit this pipeline internally, if they
> > > need a 1D LUT before the 3D LUT, but not the 1D LUT in the end.
> > >  =20
> > > >=20
> > > > I'm happy that the 3D LUT interface is being developed, but as you =
can
> > > > see from my questions, the UAPI documentation is practically missin=
g. I
> > > > would have no idea how to use this as is.   =20
> > >=20
> > > Thank you again for your valuable comments. I'll address your comments
> > > in a next version by better explaining all these points. =20
> >=20
> > Thank you for working on this!
> > pq =20
>=20
>=20


--Sig_/zLVHc_0x1IFA/NK/waQ6nIY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPrUjMACgkQI1/ltBGq
qqe/Kg//eGlf+T08j71Ldmmh61k+vQh9nh2PH7tjtWa0tm/VXGlsYsmDEtkGl/sf
IIywSnS4kJaqoud8R718o97fYNXm+DIbYxuV5ElPm7L+8hohKoOXRzH+WJOv+t30
Fx+7ODpDJUI4JW46rI0cV26NVgXIlWC1bLD7+nDlrMNxUmHbotj0qeDJQFALzWEm
lalcRSiID+C/dcsmT/5LViNw4Hdpyr2mvX/MW2tp4csDpB/sDwGV+Pq90446OrJ0
8HzNalmzjEeFxQTjTltB+WmYJvPfL4KbxB9AjCzPpQYLt9MzFKmKLVSjbNcQ3lbB
c4kzD+71SxjOwhonppBVPKPOtUlvmnYIB+0c9sxl3/IH3jyq4IoTB/fbRn9MjLGF
5zGup3/S/uN3SRMzjEmojW4oohMRjm/5k9qz/evvBPxXgXhjQoNpk97q4lPcpEyi
a9bDWgy97IqH6zfVBN3EFHH0wZtouNMGn824Oq2yzVoMR90Of1CeNzcseCeK0sDc
9SrSYq1gasg25KxBCuLhvyQQJEJrYZxZQzdnQg0wye6KRoKkp5OzJqSqUC5BXYPb
YngpP5ghyc3YY1FYJSg/2Zf9Y3UN8uWdG7+BP2lam6diN+j8AAC4D0T2f4I76dZ8
RW++JS8VlXoaLnzJGsfXgAlmNhX42Q4XWClqaPxE5dAtgC41gHU=
=D5Gg
-----END PGP SIGNATURE-----

--Sig_/zLVHc_0x1IFA/NK/waQ6nIY--
