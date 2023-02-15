Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B68369783E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 09:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7C710EA66;
	Wed, 15 Feb 2023 08:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6E310EA64;
 Wed, 15 Feb 2023 08:34:21 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qb15so44185201ejc.1;
 Wed, 15 Feb 2023 00:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ow+dbAVl79ki+MZ8nATa0JVm3fsTiISknOInRt9KgtY=;
 b=kVw8TWP6vycfvqSygbA2PhcDmQvEsAi8DfzLgAybco0eH1CRqXTbUjgYkq22XhGwxa
 3xdFLEgBRq567s6NiTS6K6KTC037N9PavQzd0ykJaH4d4mkE+cuvl6+n/cIijtYB1ybF
 J7+aX93e9G82mu/RkaZ0dL7l1so+tfP/6tM5n/iSDe0+26L8xgl/MHRSXiZXDgFyqkU4
 ASt6RI4qBu/2kWJrpUWJHbfmNNIdqFnFbX78vhll29jeWX+PR62n9PvBFBlaC75+gu3S
 +KhSFvoHxL3Z3NiYcswg+SiatvJnUBpRFDA4KdvF/hQ//Jk9K468aSsPWmUL1o7k31wm
 bxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ow+dbAVl79ki+MZ8nATa0JVm3fsTiISknOInRt9KgtY=;
 b=E1jnj3I3mnhfdT3/TV+FDPeEWpHZ9EQ05fk5vu8TgFRGNqMYEToKPD1g5lco5XE9YP
 KV14MUnlqWSHjKfIHS2boGF+PUsM6bfemaF0+ZJRpZnOwrLmEyXiwZ7kc4jLq/XcV+zi
 yInBIttSe8WtSYmsy1bZalQHW90hBRjYzc/I9S0yOxxUU5Pb6+yT+/hIIILDIFmo7/nd
 4OaOi9Wf64Tt54Dm+NDhOABT123fyLdRmMba/NOZRtLQ1Gu1x0lde3WKDWRDqHS8GVGt
 Q1o8Q4dE6jaighAHiy8PHbHho/kyhmfGWBR+K1MYArnHfTpLVU/k5A9ydMvloQMfcm5l
 dEQw==
X-Gm-Message-State: AO0yUKXR4vEzLYqrcuZ3g4VcSl4U//mD3EBVAKAPdtRkmxATq+0YOubw
 1LAJ43FI6PO+wvjZTLTNcWY=
X-Google-Smtp-Source: AK7set/hZCE+EjIQeQ7ANzyGZLSQ0gVGMEw8cUKuRTX2vYJfOcKTlnlzMIdBOxDKZ+NHQXr7setbFQ==
X-Received: by 2002:a17:907:d305:b0:870:94e:13f9 with SMTP id
 vg5-20020a170907d30500b00870094e13f9mr1715361ejc.0.1676450060137; 
 Wed, 15 Feb 2023 00:34:20 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 m6-20020a170906258600b008b0fbd27fc0sm5075819ejb.121.2023.02.15.00.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 00:34:19 -0800 (PST)
Date: Wed, 15 Feb 2023 10:34:05 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [RFC PATCH v2 00/18] Add DRM CRTC 3D LUT interface
Message-ID: <20230215103405.0726a419@eldfell>
In-Reply-To: <20230214111947.44aa177d@eldfell>
References: <20230109143846.1966301-1-mwen@igalia.com>
 <20230109153809.mmjm22oa2gkwe3sf@mail.igalia.com>
 <20230131110735.60f8ff04@eldfell>
 <20230209142702.7w4mqed6zqtk5m6g@mail.igalia.com>
 <20230210112846.2103eb00@eldfell>
 <20230213192655.mac3fhhb2aayffiw@mail.igalia.com>
 <20230214111947.44aa177d@eldfell>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Omdk9IUYOBdmp7+gB_=mzyN";
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

--Sig_/Omdk9IUYOBdmp7+gB_=mzyN
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Feb 2023 11:19:47 +0200
Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Mon, 13 Feb 2023 18:26:55 -0100
> Melissa Wen <mwen@igalia.com> wrote:
>=20
> > On 02/10, Pekka Paalanen wrote: =20
> > > On Thu, 9 Feb 2023 13:27:02 -0100
> > > Melissa Wen <mwen@igalia.com> wrote:
> > >    =20
> > > > On 01/31, Pekka Paalanen wrote:   =20
> > > > > On Mon, 9 Jan 2023 14:38:09 -0100
> > > > > Melissa Wen <mwen@igalia.com> wrote:
> > > > >      =20
> > > > > > On 01/09, Melissa Wen wrote:     =20
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > After collecting comments in different places, here is a seco=
nd version
> > > > > > > of the work on adding DRM CRTC 3D LUT support to the current =
DRM color
> > > > > > > mgmt interface. In comparison to previous proposals [1][2][3]=
, here we
> > > > > > > add 3D LUT before gamma 1D LUT, but also a shaper 1D LUT befo=
re 3D LUT,
> > > > > > > that means the following DRM CRTC color correction pipeline:
> > > > > > >=20
> > > > > > > Blend -> Degamma 1D LUT -> CTM -> Shaper 1D LUT -> 3D LUT -> =
Gamma 1D LUT     =20
> > > > >=20
> > > > > Hi Melissa,
> > > > >=20
> > > > > that makes sense to me, for CRTCs. It would be really good to hav=
e that
> > > > > as a diagram in the KMS UAPI documentation.
> > > > >      =20
> > > >=20
> > > > Hi Pekka,
> > > >=20
> > > > Thanks for your feedbacks and your time reviewing this proposal.   =
=20
> > >=20
> > > No problem, and sorry it took so long!
> > >=20
> > > I'm just finishing the catch-up with everything that happened during
> > > winter holidays.
> > >    =20
> > > > > If someone wants to add a 3D LUT to KMS planes as well, then I'm =
not
> > > > > sure if it should be this order or swapped. I will probably have =
an
> > > > > opinion about that once Weston is fully HDR capable and has been =
tried
> > > > > in the wild for a while with the HDR color operations fine-tuned =
based
> > > > > on community feedback. IOW, not for a long time. The YUV to RGB
> > > > > conversion factors in there as well.
> > > > >      =20
> > > > I see, this is also the reason I reuse here Alex Hung's proposal for
> > > > pre-blending API. I'll work on better documentation.
> > > >    =20
> > > > >      =20
> > > > > > >=20
> > > > > > > and we also add a DRM CRTC LUT3D_MODE property, based on Alex=
 Hung
> > > > > > > proposal for pre-blending 3D LUT [4] (Thanks!), instead of ju=
st a
> > > > > > > LUT3D_SIZE, that allows userspace to use different supported =
settings of
> > > > > > > 3D LUT, fitting VA-API and new color API better. In this sens=
e, I
> > > > > > > adjusted the pre-blending proposal for post-blending usage.
> > > > > > >=20
> > > > > > > Patches 1-6 targets the addition of shaper LUT and 3D LUT pro=
perties to
> > > > > > > the current DRM CRTC color mgmt pipeline. Patch 6 can be cons=
idered an
> > > > > > > extra/optional patch to define a default value for LUT3D_MODE=
, inspired
> > > > > > > by what we do for the plane blend mode property (pre-multipli=
ed).
> > > > > > >=20
> > > > > > > Patches 7-18 targets AMD display code to enable shaper and 3D=
 LUT usage
> > > > > > > on DCN 301 (our HW case). Patches 7-9 performs code cleanups =
on current
> > > > > > > AMD DM colors code, patch 10 updates AMD stream in case of us=
er 3D LUT
> > > > > > > changes, patch 11/12 rework AMD MPC 3D LUT resource handling =
by context
> > > > > > > for DCN 301 (easily extendible to other DCN families). Finall=
y, from
> > > > > > > 13-18, we wire up SHAPER LUT, LUT3D and LUT3D MODE to AMD dis=
play
> > > > > > > driver, exposing modes supported by HW and programming user s=
haper and
> > > > > > > 3D LUT accordingly.
> > > > > > >=20
> > > > > > > Our target userspace is Gamescope/SteamOS.
> > > > > > >=20
> > > > > > > Basic IGT tests were based on [5][6] and are available here (=
in-progress):
> > > > > > > https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commits/c=
rtc-lut3d-api
> > > > > > >=20
> > > > > > > [1] https://lore.kernel.org/all/20201221015730.28333-1-lauren=
t.pinchart+renesas@ideasonboard.com/
> > > > > > > [2] https://github.com/vsyrjala/linux/commit/4d28e8ddf2a076f3=
0f9e5bdc17cbb4656fe23e69
> > > > > > > [3] https://lore.kernel.org/amd-gfx/20220619223104.667413-1-m=
wen@igalia.com/
> > > > > > > [4] https://lore.kernel.org/dri-devel/20221004211451.1475215-=
1-alex.hung@amd.com/
> > > > > > > [5] https://patchwork.freedesktop.org/series/90165/
> > > > > > > [6] https://patchwork.freedesktop.org/series/109402/
> > > > > > > [VA_API] http://intel.github.io/libva/structVAProcFilterParam=
eterBuffer3DLUT.html
> > > > > > > [KMS_pipe_API] https://gitlab.freedesktop.org/pq/color-and-hd=
r/-/issues/11
> > > > > > >=20
> > > > > > > Let me know your thoughts.       =20
> > > > > >=20
> > > > > > +Simon Ser, +Pekka Paalanen who might also be interested in thi=
s series.     =20
> > > > >=20
> > > > > Unfortunately I don't have the patch emails to reply to, so here'=
s a
> > > > > messy bunch of comments. I'll concentrate on the UAPI design as a=
lways.     =20
> > > >=20
> > > > Sorry, the patchset is here: https://lore.kernel.org/dri-devel/2023=
0109143846.1966301-1-mwen@igalia.com/
> > > > In the next version, I won't forget cc'ing you at first.   =20
> > > > >=20
> > > > > +/*
> > > > > + * struct drm_mode_lut3d_mode - 3D LUT mode information.
> > > > > + * @lut_size: number of valid points on every dimension of 3D LU=
T.
> > > > > + * @lut_stride: number of points on every dimension of 3D LUT.
> > > > > + * @bit_depth: number of bits of RGB. If color_mode defines entr=
ies with higher
> > > > > + *             bit_depth the least significant bits will be trun=
cated.
> > > > > + * @color_format: fourcc values, ex. DRM_FORMAT_XRGB16161616 or =
DRM_FORMAT_XBGR16161616.
> > > > > + * @flags: flags for hardware-sepcific features
> > > > > + */
> > > > > +struct drm_mode_lut3d_mode {
> > > > > +	__u16 lut_size;
> > > > > +	__u16 lut_stride[3];
> > > > > +	__u16 bit_depth;
> > > > > +	__u32 color_format;
> > > > > +	__u32 flags;
> > > > > +};

Btw. there is an odd number of u16 members before a u32 member. That
means there is invisible padding in this struct, I believe. I suppose
that's not different between 32-bit and 64-bit architectures, since
there are no 64-bit members, but it's still a hole. I assume the kernel
makes sure the hole cannot contain uninitialized values which would
leak kernel data to userspace...

For more things you might want to check, I think Daniel's botching up
ioctls article is appropriate. This is not an ioctl struct, but it's...
well, essentially it is. Just read-only.

https://www.kernel.org/doc/Documentation/ioctl/botching-up-ioctls.rst

...

> > > > > + * =E2=80=9CLUT3D_MODE=E2=80=9D:
> > > > > + *	Enum property to give the mode of the 3D lookup table to be s=
et on the
> > > > > + *	LUT3D property. A mode specifies size, stride, bit depth and =
color
> > > > > + *	format and depends on the underlying hardware). If drivers su=
pport
> > > > > + *	multiple 3D LUT modes, they should be declared in a array of
> > > > > + *	drm_color_lut3d_mode and they will be advertised as an enum.
> > > > >=20
> > > > > How does that work exactly? I didn't get it. I could guess, but h=
aving
> > > > > to guess on API is bad.     =20
> > > >=20
> > > > The driver advertises all supported modes (each combination of valu=
es)
> > > > in a array as a enum, userspace can check all accepted modes and se=
t the
> > > > one that fits the user 3D LUT settings. I think it's possible to ge=
t the
> > > > idea from this IGT test:
> > > > https://gitlab.freedesktop.org/mwen/igt-gpu-tools/-/commit/8771f444=
c3dcd126d7590d5a9b1b0db9706bbf6e#ed5dbc960ac210e3fbacd2361fe0270709767aaa_2=
05_205   =20
> > > > >    =20
> > >=20
> > > You lost me at "an array as an enum".
> > >=20
> > > I understand there is a blob containing an array of struct
> > > drm_mode_lut3d_mode. What I don't understand is that you say LUT3D_MO=
DE
> > > is an enum property. Where does the blob come from, then? What proper=
ty
> > > provides the blob?
> > >=20
> > > Am I correct in guessing that the values of LUT3D_MODE enum property
> > > are indices into the array in the blob, and that userspace will set i=
t?
> > > That sounds good to me, if it's the integer value of the enum. But en=
um
> > > values also need string names, because that is how the values are
> > > usually recognized, so what name strings will be used?   =20
> >=20
> > So, in this proposal, LUT3D_MODE is a list of indexes for a blob that d=
escribe a supported
> > 3D LUT mode =20
>=20
> Hi Melissa,
>=20
> are you sure? I believe you are looking at and explaining some kernel
> internal APIs, and not the uAPI which is the important part. Internal
> APIs can always be changed later, uAPI cannot.
>=20
> After I had sent that email, I might have understood how it was
> supposed to work instead: there is no array of struct
> drm_mode_lut3d_mode.
>=20
> Instead, LUT3D_MODE is a KMS property of type enum. Each integer value
> of the enum is also a blob id. Each blob named by those ids is a single
> struct drm_mode_lut3d_mode that userspace needs to retrieve individually
> to understand what that specific enum value means.
>=20
> > i.e. a `struct drm_mode_lut3d_mode` with size, stride, bit depth, etc. =
Strings here follow this pattern
> > `lut3d_{size}_{bit_depth}bit` [1]. When enabling 3D LUT support, the
> > driver should pass an array of `struct drm_mode_lut3d_mode` as supported
> > modes, with at least one element. =20
>=20
> To be clear, I do not care about kernel internal interfaces at all. I
> only care about the uAPI. Therefore talking about kernel internal API
> will only confuse me and every other userspace developer. Evidently it
> has even confused some IGT developers, as I point out some IGT code
> problems below.
>=20
> If the struct drm_mode_lut3d_mode is the authoritative definition of
> what each enum value means, then I think the string names should not
> attempt to convey any meaning nor information. The strings should be
> just "blob id 77" etc. That makes it clear what the value is.

One more thing came to mind: extendability.

If it turns out that struct drm_mode_lut3d_mode is not good enough for
some future hardware, what could we do? Do you have a plan for that?

A) Thinking again, I would suggest to make the enum value string names
of the format "drm_mode_lut3d_mode %u". That way the name identifies the
blob binary structure and the blob id makes it unique. If we hope that
userspace checks the name, the kernel could later add a different
structure when necessary. Even if userspace fails in that, it would
still be an informative name.

B) Otherwise, or in addition, the structure needs to be designed to be
extendable like ioctl structs. A flags field maybe? But again we trust
that userspace checks the flags before trying to interpret any further.

C) Yet another option is a new DRM client CAP, which userspace can set
to tell the kernel that userspace does understand and expect that some
new kind of structure might be present. But this needs also A or B to
identify the struct.

D) Invent a whole new KMS property for the next generation 3D LUTs. In
that case the new and old properties probably need to be mutually
exclusive.


> Otherwise userspace will be tempted to use the string names only (as is
> the usual uAPI design) to find the right enum value, and not look into
> the struct drm_mode_lut3d_mode at all. Therefore, if you don't encode
> absolutely everything of struct drm_mode_lut3d_mode into the string
> name, you should encode nothing in the name. You might also have two
> different descriptions ending up with the same string name under the
> same enum property instance, and that must not happen.


Thanks,
pq

--Sig_/Omdk9IUYOBdmp7+gB_=mzyN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPsmP0ACgkQI1/ltBGq
qqfcIg/7B2rUQBXa/5BEwFv5BgBs2Me9SW+qvM/74gBzWI3cp1VB60bsVuTcn4Pw
ARkzwaoU9VG2SkNIbKBzxNkV7pix2WN/pRq7Znyw5ayXczlrHarAWgxgmNbMINS5
tDVnyJ53hWCbdUkU3CMf4+ri1x7b7iTaYPsqDDanRC53IhIWqtBCUy0UOychYw9z
GkAVGFsMyAApCoDmy2v+cxk+vZZi00CbjrRwVSgGCt1UwvtV6aoWXZ4rkE2PhST3
4YNYydvEgV9F8xZcT170bXpicovjjhHt1UdczF4iMYx41k2T/iS6AMz69+LPRlqx
QZbSZ/7X/neWtxwMoqZ+9UBl2iLxTMtmjSSgXUYEH+DEYImSzq6x8KlEUrI2p9HV
71cgCN91imfJWmNUnGIDL9gwoje3101VndaGrRsVcIvwwLoi/yNZMkc+a2kUFm3P
MvDx/sHJ3wrZYf/QE4iBv2mT5buKk5/ixSXbFvCvTtxbSrn0OMopB3tEIFOHiWZ6
XvibPWOVn3Y5awHVUi719QQWJ38eCyLkXBlEewvZmvgk62GCg9B7KFNZk4bXJ+rr
UIkFqB5EgtlMY5fNApNsCYo7tE2RTPN7QMfNfRqlA/ua1+P7vUy1tD/uxG6PvMgs
anjbUMhZrM2C2F+K7m1qu9VaMfvPYby4e7OiCef/Rinq/NmMnmw=
=GNGu
-----END PGP SIGNATURE-----

--Sig_/Omdk9IUYOBdmp7+gB_=mzyN--
