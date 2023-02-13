Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 508C36950AC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 20:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E107E10E6D5;
	Mon, 13 Feb 2023 19:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831F810E6CD;
 Mon, 13 Feb 2023 19:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bK4ob5eDDWyZ3EBGYyVT7hJQiaUvcaprtuZyPR/iaWQ=; b=jNnfPKW46EnTi287/ZzYNWbpmU
 SeA1KuLWQdJNGNsE2PijGFup2s/R7KHYhjmEijFJ7OzpiWJv2DFJ/nUu7w8jc8ataP9kMe4YwAGLQ
 J/83nMnCsu6F/Gcko0qT98AaZkuImIFe6oL0VmJjE7j36Xi94S6DtWN8CMj1wHskzelZEzSpjbPCR
 aq2zvjPGxoDb/dsiHHKtqEkgsDjwGDb+EXPxmB/3Qtrd3OW25TKNwLFKptWGZXzF/aslsDLKWUoin
 pZYRNGyTw3Xse7/JngslYIdOpt1q+qUmoXqxDs8txTZm0OfMY2aRqNV6EUcn00qDfc20IAiLcpycv
 9podgMkg==;
Received: from [38.44.66.31] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pReU6-0010gT-Au; Mon, 13 Feb 2023 20:27:30 +0100
Date: Mon, 13 Feb 2023 18:26:55 -0100
From: Melissa Wen <mwen@igalia.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface
Message-ID: <20230213192655.mac3fhhb2aayffiw@mail.igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
 <20230109153809.mmjm22oa2gkwe3sf@mail.igalia.com>
 <20230131110735.60f8ff04@eldfell>
 <20230209142702.7w4mqed6zqtk5m6g@mail.igalia.com>
 <20230210112846.2103eb00@eldfell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tmuubk6hym2fue45"
Content-Disposition: inline
In-Reply-To: <20230210112846.2103eb00@eldfell>
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


--tmuubk6hym2fue45
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 02/10, Pekka Paalanen wrote:
> On Thu, 9 Feb 2023 13:27:02 -0100
> Melissa Wen <mwen@igalia.com> wrote:
>=20
> > On 01/31, Pekka Paalanen wrote:
> > > On Mon, 9 Jan 2023 14:38:09 -0100
> > > Melissa Wen <mwen@igalia.com> wrote:
> > >  =20
> > > > On 01/09, Melissa Wen wrote: =20
> > > > > Hi,
> > > > >=20
> > > > > After collecting comments in different places, here is a second v=
ersion
> > > > > of the work on adding DRM CRTC 3D LUT support to the current DRM =
color
> > > > > mgmt interface. In comparison to previous proposals [1][2][3], he=
re we
> > > > > add 3D LUT before gamma 1D LUT, but also a shaper 1D LUT before 3=
D LUT,
> > > > > that means the following DRM CRTC color correction pipeline:
> > > > >=20
> > > > > Blend -> Degamma 1D LUT -> CTM -> Shaper 1D LUT -> 3D LUT -> Gamm=
a 1D LUT =20
> > >=20
> > > Hi Melissa,
> > >=20
> > > that makes sense to me, for CRTCs. It would be really good to have th=
at
> > > as a diagram in the KMS UAPI documentation.
> > >  =20
> >=20
> > Hi Pekka,
> >=20
> > Thanks for your feedbacks and your time reviewing this proposal.
>=20
> No problem, and sorry it took so long!
>=20
> I'm just finishing the catch-up with everything that happened during
> winter holidays.
>=20
> > > If someone wants to add a 3D LUT to KMS planes as well, then I'm not
> > > sure if it should be this order or swapped. I will probably have an
> > > opinion about that once Weston is fully HDR capable and has been tried
> > > in the wild for a while with the HDR color operations fine-tuned based
> > > on community feedback. IOW, not for a long time. The YUV to RGB
> > > conversion factors in there as well.
> > >  =20
> > I see, this is also the reason I reuse here Alex Hung's proposal for
> > pre-blending API. I'll work on better documentation.
> >=20
> > >  =20
> > > > >=20
> > > > > and we also add a DRM CRTC LUT3D_MODE property, based on Alex Hung
> > > > > proposal for pre-blending 3D LUT [4] (Thanks!), instead of just a
> > > > > LUT3D_SIZE, that allows userspace to use different supported sett=
ings of
> > > > > 3D LUT, fitting VA-API and new color API better. In this sense, I
> > > > > adjusted the pre-blending proposal for post-blending usage.
> > > > >=20
> > > > > Patches 1-6 targets the addition of shaper LUT and 3D LUT propert=
ies to
> > > > > the current DRM CRTC color mgmt pipeline. Patch 6 can be consider=
ed an
> > > > > extra/optional patch to define a default value for LUT3D_MODE, in=
spired
> > > > > by what we do for the plane blend mode property (pre-multiplied).
> > > > >=20
> > > > > Patches 7-18 targets AMD display code to enable shaper and 3D LUT=
 usage
> > > > > on DCN 301 (our HW case). Patches 7-9 performs code cleanups on c=
urrent
> > > > > AMD DM colors code, patch 10 updates AMD stream in case of user 3=
D LUT
> > > > > changes, patch 11/12 rework AMD MPC 3D LUT resource handling by c=
ontext
> > > > > for DCN 301 (easily extendible to other DCN families). Finally, f=
rom
> > > > > 13-18, we wire up SHAPER LUT, LUT3D and LUT3D MODE to AMD display
> > > > > driver, exposing modes supported by HW and programming user shape=
r and
> > > > > 3D LUT accordingly.
> > > > >=20
> > > > > Our target userspace is Gamescope/SteamOS.
> > > > >=20
> > > > > Basic IGT tests were based on [5][6] and are available here (in-p=
rogress):
> > > > > https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commits/crtc-=
lut3d-api
> > > > >=20
> > > > > [1] https://lore.kernel.org/all/20201221015730.28333-1-laurent.pi=
nchart+renesas@ideasonboard.com/
> > > > > [2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f30f9e=
5bdc17cbb4656fe23e69
> > > > > [3] https://lore.kernel.org/amd-gfx/20220619223104.667413-1-mwen@=
igalia.com/
> > > > > [4] https://lore.kernel.org/dri-devel/20221004211451.1475215-1-al=
ex.hung@amd.com/
> > > > > [5] https://patchwork.freedesktop.org/series/90165/
> > > > > [6] https://patchwork.freedesktop.org/series/109402/
> > > > > [VA_API] http://intel.github.io/libva/structVAProcFilterParameter=
Buffer3DLUT.html
> > > > > [KMS_pipe_API] https://gitlab.freedesktop.org/pq/color-and-hdr/-/=
issues/11
> > > > >=20
> > > > > Let me know your thoughts.   =20
> > > >=20
> > > > +Simon Ser, +Pekka Paalanen who might also be interested in this se=
ries. =20
> > >=20
> > > Unfortunately I don't have the patch emails to reply to, so here's a
> > > messy bunch of comments. I'll concentrate on the UAPI design as alway=
s. =20
> >=20
> > Sorry, the patchset is here: https://lore.kernel.org/dri-devel/20230109=
143846.1966301-1-mwen@igalia.com/
> > In the next version, I won't forget cc'ing you at first.
> > >=20
> > > +/*
> > > + * struct drm_mode_lut3d_mode - 3D LUT mode information.
> > > + * @lut_size: number of valid points on every dimension of 3D LUT.
> > > + * @lut_stride: number of points on every dimension of 3D LUT.
> > > + * @bit_depth: number of bits of RGB. If color_mode defines entries =
with higher
> > > + *             bit_depth the least significant bits will be truncate=
d.
> > > + * @color_format: fourcc values, ex. DRM_FORMAT_XRGB16161616 or DRM_=
FORMAT_XBGR16161616.
> > > + * @flags: flags for hardware-sepcific features
> > > + */
> > > +struct drm_mode_lut3d_mode {
> > > +	__u16 lut_size;
> > > +	__u16 lut_stride[3];
> > > +	__u16 bit_depth;
> > > +	__u32 color_format;
> > > +	__u32 flags;
> > > +};
> > >=20
> > > Why is lut_stride an array of 3, but lut_size is not? =20
> >=20
> > It cames from VA-API:
> > https://intel.github.io/libva/structVAProcFilterParameterBuffer3DLUT.ht=
ml#a682756be15d09327ba725b74a863cbcc
> >=20
> > In short, the reason is that lut_size is the valid points and is
> > the same for every dimensions, but lut_stride may vary.
>=20
> Ok, so lut_size is what I would have guessed it to be. Just needs to be
> doc'd - pretty much all my questions are lack of docs.
>=20
> I see that lut_stride is supposed to be in points, and not bytes. That
> is surprising. Are you sure it's good?
>=20
> > >=20
> > > What is the color_mode the comment is referring to? =20
> >=20
> > It refers to FB color_mode/bpp. I'm not using it in post-blending 3D LUT
> > implementation (should I?), it cames from pre-blending use case.  Maybe
> > the main issue here is if reusing the pre-blending 3D LUT mode struct is
> > a good approach or better create a specific for post-blending.
>=20
> Sorry, I have no idea what FB color_mode is. I do not recall any such
> thing in the KMS uAPI.
>=20
>=20
> > >=20
> > > What is "number of bits of RGB"? Input precision? Output precision?
> > > Integer or floating point? =20
> >=20
> > It's the bit depth of the 3D LUT values, the same for every channels. In
> > the AMD case, it's supports 10-bit and 12-bit, for example.
>=20
> Ok. So e.g. r5g6b5 is not a possible 3D LUT element type on any
> hardware ever?
>=20
> What exactly is the truncation the comment refers to?
>=20
> It sounds like if input has higher precision than the LUT elements,
> then "truncation" occurs. I can kind of see that, but I also think it
> is a false characterisation. The LUT input precision affects the
> precision of LUT indexing and the precision of interpolation between
> the LUT elements. I would not expect those two precisions to be
> truncated to the LUT element precision (but they could be truncated to
> something else hardware specific). Instead, I do expect the
> interpolation result to be truncated to the LUT output precision, which
> probably is the same as the LUT element precision, but not necessarily.
>=20
> Maybe the comment about truncation should simply be removed? The result
> is obvious if we know the LUT input, element, and output precision, and
> what exactly happens with the indexing and interpolation is probably
> good enough to be left hardware-specific if it is difficult to describe
> in generic terms across different hardware.
>=20
> > >=20
> > > Flags cannot be hardware specific, because it makes the whole KMS UAPI
> > > hardware specific. That won't work. You have to have driver-agnostic
> > > definitions for all possible flags.
> > >=20
> > > Why is this the whole first patch? There is no documentation for the
> > > UAPI on how this struct works, so I cannot review this. Explaining ju=
st
> > > the individual fields is not enough to understand it. Is this somethi=
ng
> > > the kernel fills in and is read-only to userspace? Is userspace filli=
ng
> > > this in? =20
> >=20
> > I see. I'll work on explaining/documenting it better.
> > >=20
> > >=20
> > > + * =E2=80=9CLUT3D=E2=80=9D:
> > > + *	Blob property to set the 3D LUT mapping pixel data after the color
> > > + *	transformation matrix and before gamma 1D lut correction. The
> > > + *	data is interpreted as an array of &struct drm_color_lut elements.
> > > + *	Hardware might choose not to use the full precision of the LUT
> > > + *	elements.
> > > + *
> > > + *	Setting this to NULL (blob property value set to 0) means a the o=
utput
> > > + *	color is identical to the input color. This is generally the driv=
er
> > > + *	boot-up state too. Drivers can access this blob through
> > > + *	&drm_crtc_state.gamma_lut.
> > > + *
> > >=20
> > > You need to define how the 1-D array of drm_color_lut elements blob
> > > will be interpreted as a 3-D array for the 3D LUT, and how the
> > > dimensions match to the R, G and B channels. It's a bit like the
> > > question about row-major or column-major storage for matrices, except
> > > more complicated and not in those words. =20
> >=20
> > ack
> > >=20
> > > + * =E2=80=9CLUT3D_MODE=E2=80=9D:
> > > + *	Enum property to give the mode of the 3D lookup table to be set o=
n the
> > > + *	LUT3D property. A mode specifies size, stride, bit depth and color
> > > + *	format and depends on the underlying hardware). If drivers support
> > > + *	multiple 3D LUT modes, they should be declared in a array of
> > > + *	drm_color_lut3d_mode and they will be advertised as an enum.
> > >=20
> > > How does that work exactly? I didn't get it. I could guess, but having
> > > to guess on API is bad. =20
> >=20
> > The driver advertises all supported modes (each combination of values)
> > in a array as a enum, userspace can check all accepted modes and set the
> > one that fits the user 3D LUT settings. I think it's possible to get the
> > idea from this IGT test:
> > https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commit/8771f444c3dc=
d126d7590d5a9b1b0db9706bbf6e#ed5dbc960ac210e3fbacd2361fe0270709767aaa_205_2=
05
> > >=20
>=20
> You lost me at "an array as an enum".
>=20
> I understand there is a blob containing an array of struct
> drm_mode_lut3d_mode. What I don't understand is that you say LUT3D_MODE
> is an enum property. Where does the blob come from, then? What property
> provides the blob?
>=20
> Am I correct in guessing that the values of LUT3D_MODE enum property
> are indices into the array in the blob, and that userspace will set it?
> That sounds good to me, if it's the integer value of the enum. But enum
> values also need string names, because that is how the values are
> usually recognized, so what name strings will be used?

So, in this proposal, LUT3D_MODE is a list of indexes for a blob that descr=
ibe a supported
3D LUT mode i.e. a `struct drm_mode_lut3d_mode` with size, stride, bit dept=
h, etc. Strings here follow this pattern
`lut3d_{size}_{bit_depth}bit` [1]. When enabling 3D LUT support, the
driver should pass an array of `struct drm_mode_lut3d_mode` as supported
modes, with at least one element.

I think this drm_info output helps to understand the idea. Currently, we
have 5 DRM CRTC color mgmt properties. The drm_info output for them:

=E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"DEGAMMA_LUT": blob=
 =3D 0
=E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"DEGAMMA_LUT_SIZE" =
(immutable): range [0, UINT32_MAX] =3D 4096
=E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"CTM": blob =3D 0
=E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"GAMMA_LUT": blob =
=3D 0
=E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"GAMMA_LUT_SIZE" (i=
mmutable): range [0, UINT32_MAX] =3D 4096

The idea is to add 4 new properties.

- The 3D LUT blob (LUT3D) and the indexes of supported modes
  (LUT3D_MODE), as follows (example with AMD supported modes):

=E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"LUT3D": blob =3D 0
=E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"LUT3D_MODE": enum =
{lut3d_17_12bit, lut3d_17_10bit, lut3d_9_12bit, lut3d_9_10bit} =3D lut3d_17=
_12bit

- And shaper (1D) LUT - following what we already have for degamma/gamma LU=
T:

=E2=94=82           =E2=94=9C=E2=94=80=E2=94=80=E2=94=80"SHAPER_LUT": blob =
=3D 0
=E2=94=82           =E2=94=94=E2=94=80=E2=94=80=E2=94=80"SHAPER_LUT_SIZE" (=
immutable): range [0, UINT32_MAX] =3D 4096


Each LUT3D_MODE element works as a index to get the blob for the
corresponding `struct drm_mode_lut3d_mode` ([2] may works as an
example). I've also included a patch to set the first element of the
list of supported mode as a predefined value [3], but maybe it's not
necessary (or even error prone).

[1] https://lore.kernel.org/dri-devel/20230109143846.1966301-5-mwen@igalia.=
com/
[2] https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commit/a7b11bab9d57=
3e38e26982b5cc5cf62e9dca6a75#ed5dbc960ac210e3fbacd2361fe0270709767aaa_886_8=
86
[3] https://lore.kernel.org/dri-devel/20230109143846.1966301-7-mwen@igalia.=
com/
>=20
> In that code example, I cannot see any connection between the array of
> drm_mode_lut3d_mode entries, the 'name' string, and the actual data
> generated for the LUT. They must all connect somehow, but it just
> doesn't seem to be in the code. It is just hardcoding mode_lut3d[0],
> and the data generator never sees even that - it gets the lut size, but
> none of the other parameters. I cannot see that working across multiple
> drivers.
>=20
> Why is it setting a linear shaper LUT explicitly instead of unsetting
> it? I mean this preparation:
>=20
> shaper_linear =3D generate_table(data->shaper_lut_size, 1.0);
>=20
> "Linear" actually means "identity", right? That's what people usually
> write when they mean identity.
>=20
> Surely it's not actually a constant curve? That would make the whole
> test useless for proving the 3D LUT works.

So, the idea of the test is only set a 3D LUT, without any shaper LUT
and see if the 3D LUT maps to max color values. However, from my tests
on AMD HW with 3D LUT support, I was not able to program a 3D LUT
without a shaper LUT, that means a shaper LUT in BYPASS mode. By
comparing CRC results I could see that if I don't set any shaper LUT,
the driver sets shaper LUT in BYPASS mode but the 3D LUT is just
ignored, so the combo shaper + 3D LUT seems a HW requirement. To
overcome this requirement and keep the expected behavior, the test sets
a linear shaper LUT to acts as a BYPASS LUT to overcome this
requirement. Am I missing something?

It's a really simple test case, but I don't see how this approach
invalidates the test results. To generalize the test for other devices,
I can restrict shaper LUT usage for AMD.

Melissa

>=20
>=20
> > >=20
> > > +	/**
> > > +	 * @lut3d:
> > > +	 *
> > > +	 * 3D Lookup table for converting pixel data. Position where it tak=
es
> > > +	 * place depends on hw design, after @ctm or @gamma_lut. See
> > > +	 * drm_crtc_enable_color_mgmt(). The blob (if not NULL) is an array=
 of
> > > +	 * &struct drm_color_lut.
> > > +	 */
> > > +	struct drm_property_blob *lut3d;
> > >=20
> > > I do not like the wording of "depends on hw design", and it is used in
> > > very many places here. The KMS UAPI semantics cannot vary based on
> > > hardware. Your cover letter defines the order in the color pipeline, =
so
> > > I don't understand how this here can depend on hw.
> > >=20
> > > What can depend on hardware is which KMS UAPI properties are exposed,
> > > and how you map a property to a hardware unit (which can even change
> > > based on the exact pipeline configuration as long as the results are =
as
> > > the UAPI doc defines). But this comment here is talking about the UAPI
> > > properties, not hw elements.
> > >  =20
> >=20
> > You are right! My initial idea was to explain that it's possible for
> > other vendors color pipeline to fit this pipeline internally, if they
> > need a 1D LUT before the 3D LUT, but not the 1D LUT in the end.
> >=20
> > >=20
> > > I'm happy that the 3D LUT interface is being developed, but as you can
> > > see from my questions, the UAPI documentation is practically missing.=
 I
> > > would have no idea how to use this as is. =20
> >=20
> > Thank you again for your valuable comments. I'll address your comments
> > in a next version by better explaining all these points.
>=20
> Thank you for working on this!
> pq



--tmuubk6hym2fue45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmPqjvoACgkQwqF3j0dL
ehwIIA/8DAxHmE64gd5QiYZ48NkNfJdOQDJrY57UPNehOzhEQSYjNNZ0HZszFj/m
GnQEG3T23gzipC8ccgvY//MpK77XwjiDbYaUmoJkSM/wVxXP0sWStUBw3FMA0qqx
Tj72J3IiIoYn9EcBJTBjpjL0cbwzZS65+7gFEbf4mVCUq1ZARhS8iTjlWpBDAvCA
G6oIh24ulygG8Naw2BrYDZ/7Attu4Kxdp4yYcYxo6uTJKoe6mFuDmIedL3ZNmhPg
bxNNnnFICN/pxNvHBoyVzCTXX3ysXUN87vFc4PTvn8F5GmEuqyya8n5CcVOk9KDD
Th7ViGkQiFt/8pKpnJ9fScMJaWvEu4h8atpbF3t9YQhW03oUwCTHeLgCGqlxKDXU
kFLHFpdi7KciijVIQD7sGd5J0JrXJcYw4Dz60E8+ZvUiKew17ca8/Ml4RduutUv4
Ab/6u8d2L11oz1IHAhhbbnGX6+A+jlkTv2GVaWs+7I50I+lU0+Tgxyrb1UOUINlI
YOteLdOlpEqebkwnEGjNvSItk9bGkrgdagNhna+Kz8CpFiCMM3CY9Y2/wG1k46Wb
nzaJpn/16Yp1rpXqTmcKGTKRz1uhv++UNpgOq9mpMXMdtqeqQglfoP5UbZ31g47d
7oZPEUCmHCNe9yHmYb8yKWuWkyCe46sskjzkgsDe2MvdU4J/NE0=
=YHAf
-----END PGP SIGNATURE-----

--tmuubk6hym2fue45--
