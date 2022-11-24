Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C7D637475
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 09:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7065810E6B2;
	Thu, 24 Nov 2022 08:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE7310E6B0;
 Thu, 24 Nov 2022 08:51:07 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id a7so1212466ljq.12;
 Thu, 24 Nov 2022 00:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=2M0Kg0OJ8L9oi9hD+tD3BSDcZDTJkZCHDHzLTx9r+wI=;
 b=Tad0cVF/e5LFHblCHYP9lQ8BSbB2k7bBsD9Zwg0Gw+kX5ShrpIJf6mBIHIT4ubtGTQ
 OgaYvMaL1tStMUjxfmqCIA/xA0kCgzepaTlu/Jxs0pnh0vu4aFELDY2T3mRkppRgcVZy
 nyUW0ailuQ7X2MlVRW5cLP6q49I6JSu8hWb75LM0DdW3unz9ChfjK0r1bZxFRZKomWZ/
 o/w3QbMxVaWobglU57yolUfXUmi99dR+xQxWTWxMpRDqsORSbyrmoN32Pv4jpY75kSAN
 HeZYq2DIrFjBTLDvQmyKbUbN3zDRDV+HBzhdIdlhGG6zMbeblEMf/N5H41OXCbHKdf3Z
 3VxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2M0Kg0OJ8L9oi9hD+tD3BSDcZDTJkZCHDHzLTx9r+wI=;
 b=r4ncFlSKA9v48IcFHG6vjDVluH7G/l5cMvVkm3Y/rSNG27FZGiq6WUyss0lFceh1kg
 SScC72ssp4mSwPrlKFHklP+JasQRak8xX/9zhv3OJZteSEUNiVmadKgjHDme2dgei74T
 QWHvTk0ZXXPM8d7kpfGAZiiWmSR7E7sQ5vjabp6qzGFFDtM49TcLvoITVjqYWwrdq7VG
 qKq2nZHp3DgDMx6o22v5jcpyq9IXrcaCKNilEP9uxwMgnTfr+rw/OhDZVfVKh5hj2otn
 x9krOTUkmkoq5D0+T+XxlPbgNRsAblfnMYZcx8SHy6YrA8i2W/JhcSUtn3hLnID4SB9r
 9Ekw==
X-Gm-Message-State: ANoB5pmHaizLpwTP/b4WpL6STgjAPXnrsTo/ZG0lAz2FiGI8QLEHl/vb
 G+KsdrmEcu4z6QYQO2wVon8=
X-Google-Smtp-Source: AA0mqf7uv4bkld+DTZSL1BZbxZOPrPGAg6ttIaqKLZ5jFyHAasd0TBNlWsJHsJzDB8W6/X/o6FqCWg==
X-Received: by 2002:a2e:9e11:0:b0:26e:3292:12ad with SMTP id
 e17-20020a2e9e11000000b0026e329212admr4932707ljk.271.1669279865004; 
 Thu, 24 Nov 2022 00:51:05 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 g6-20020a056512118600b004b4ec76016esm57415lfr.113.2022.11.24.00.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 00:51:04 -0800 (PST)
Date: Thu, 24 Nov 2022 10:50:52 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Message-ID: <20221124105052.3cd10f50@eldfell>
In-Reply-To: <0eb6155d-7b70-fc4b-97dd-7c5caea330ac@quicinc.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <712a9a25-4c38-9da5-b1a6-39e4665b4d31@linaro.org>
 <U3Koc0-B-7C7sbIpcRWokBHPOQdrQl7azJxAUWFJ4nmsk5nPf9NnUgBr9HOFUZ9YLJOKREN878fXv_BeIc15Kh_jVAFCFbYr8XfS3s0Os_M=@emersion.fr>
 <CA+hFU4wrDtSpU5owaNVP=8F3bQCnFCaJ7RmGOS0y4cooKQ5+CQ@mail.gmail.com>
 <20221109111857.36486d8d@eldfell>
 <0eb6155d-7b70-fc4b-97dd-7c5caea330ac@quicinc.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XjTuUkKtVLzgHMe5PtpxKyy";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/XjTuUkKtVLzgHMe5PtpxKyy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Nov 2022 15:27:04 -0800
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> On 11/9/2022 1:18 AM, Pekka Paalanen wrote:
> > On Tue, 8 Nov 2022 23:01:47 +0100
> > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> >  =20
> >> On Tue, Nov 8, 2022 at 7:51 PM Simon Ser <contact@emersion.fr> wrote: =
=20
> >>>
> >>> cc'ing Pekka and wayland-devel for userspace devs feedback on the new=
 uAPI. =20
> >=20
> > Hi all,
> >=20
> > thanks! Comments below. =20
>=20
> Thanks for the feedback!
>=20
> >  =20
> >>>
> >>> On Saturday, October 29th, 2022 at 14:08, Dmitry Baryshkov <dmitry.ba=
ryshkov@linaro.org> wrote:
> >>>    =20
> >>>> On 29/10/2022 01:59, Jessica Zhang wrote: =20
> >>>>> Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
> >>>>> drm_plane. In addition, add support for setting and getting the val=
ues
> >>>>> of these properties.
> >>>>>
> >>>>> COLOR_FILL represents the color fill of a plane while COLOR_FILL_FO=
RMAT
> >>>>> represents the format of the color fill. Userspace can set enable s=
olid
> >>>>> fill on a plane by assigning COLOR_FILL to a uint64_t value, assign=
ing
> >>>>> the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
> >>>>> framebuffer to NULL.
> >>>>>
> >>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com> =20
> >>>>
> >>>> Planes report supported formats using the drm_mode_getplane(). You'd
> >>>> also need to tell userspace, which formats are supported for color f=
ill.
> >>>> I don't think one supports e.g. YV12.
> >>>>
> >>>> A bit of generic comment for the discussion (this is an RFC anyway).
> >>>> Using color_fill/color_fill_format properties sounds simple, but this
> >>>> might be not generic enough. Limiting color_fill to 32 bits would
> >>>> prevent anybody from using floating point formats (e.g.
> >>>> DRM_FORMAT_XRGB16161616F, 64-bit value). Yes, this can be solved with
> >>>> e.g. using 64-bit for the color_fill value, but then this doesn't so=
und
> >>>> extensible too much.
> >>>>
> >>>> So, a question for other hardware maintainers. Do we have hardware t=
hat
> >>>> supports such 'color filled' planes? Do we want to support format
> >>>> modifiers for filling color/data? Because what I have in mind is clo=
ser
> >>>> to the blob structure, which can then be used for filling the plane:
> >>>>
> >>>> struct color_fill_blob {
> >>>>       u32 pixel_format;
> >>>>       u64 modifiers4];
> >>>>       u32 pixel_data_size; // fixme: is this necessary?
> >>>>       u8 pixel_data[];
> >>>> };
> >>>>
> >>>> And then... This sounds a lot like a custom framebuffer.
> >>>>
> >>>> So, maybe what should we do instead is to add new DRM_MODE_FB_COLOR_=
FILL
> >>>> flag to the framebuffers, which would e.g. mean that the FB gets sta=
mped
> >>>> all over the plane. This would also save us from changing if (!fb)
> >>>> checks all over the drm core.
> >>>>
> >>>> Another approach might be using a format modifier instead of the FB =
flag.
> >>>>
> >>>> What do you think? =20
> >>>
> >>> First off, we only need to represent the value of a single pixel here=
. So I'm
> >>> not quite following why we need format modifiers. Format modifiers de=
scribe how
> >>> pixels are laid out in memory. Since there's a single pixel described=
, this
> >>> is non-sensical to me, the format modifier is always LINEAR. =20
> >=20
> > Agreed.
> >  =20
> >>>
> >>> Then, I can understand why putting the pixel_format in there is tempt=
ing to
> >>> guarantee future extensibility, but it also adds complexity. For inst=
ance, how
> >>> does user-space figure out which formats can be used for COLOR_FILL? =
Can
> >>> user-space use any format supported by the plane? What does it mean f=
or
> >>> multi-planar formats? Do we really want the kernel to have conversion=
 logic for
> >>> all existing formats? Do we need to also add a new read-only blob pro=
p to
> >>> indicate supported COLOR_FILL formats? =20
>=20
> FWIW the formats supported by solid_fill wouldn't necessarily be all the=
=20
> formats supported by the plane (ex. for msm/dpu, solid_fill only=20
> supports all RGB color variants, though planes can normally support YUV=20
> formats too).
>=20
> That being said, I'm ok with having the solid_fill take in only=20
> RGBA32323232 format based on the comments below.
>=20
> >=20
> > Right. This does not seem to require pixel formats at all.
> >=20
> > The point of pixel formats is to be able to feed large amounts of data
> > as-is into hardware and avoid the CPU ever touching it. You do that
> > with DRM FBs pointing to suitably allocated hardware buffers. But here
> > we have exactly one pixel, which I imagine will always be read by the
> > CPU so the driver will convert it into a hardware-specific format and
> > program it; probably the driver will not create an internal DRM FB for
> > it. >
> > The above might also be a reason to not model this as a special-case
> > DRM FB in UAPI. Or, at least you need a whole new ioctl to create such
> > DRM FB to avoid the need to allocate e.g. a dumb buffer or a
> > GPU-specific buffer. >
> > What one does need is what Sebastian brought up: does it support alpha
> > or not? =20
> Hmm, the drm_plane struct already supports an alpha property so it seems=
=20
> a bit redundant to also have a separate alpha value in the solid fill col=
or.

Hi Jessica,

that's a good point! - Assuming that if hardware supports fill with
alpha, it supports plane-alpha with real FBs as well.

> That being said, we could have it so that setting the alpha for the=20
> solid_fill property will also change the value of the plane's alpha=20
> property too.

No! Definitely not. That would be confusing.

One must not have properties that change the value of other
non-immutable properties. It would become a real mess to handle in
userspace and for backward compatibility. Just like the kernel must not
spontaneously change the value of a non-immutable property. (Some
mistakes exist already, and I think they cause userspace to need
exceptional code for them.)


> >=20
> > Userspace would also be interested in the supported precision of the
> > values, but the hardware pixel component order is irrelevant because the
> > driver will always convert the one pixel with CPU anyway.
> >=20
> > YUV vs. RGB is a another question. The KMS color pipeline is defined in
> > terms of RGBA as far as I know, and alpha-blending YUV values makes no
> > sense. So will there ever be any need to set an YUV fill? I have a hard
> > time imagining it.
> >=20
> > If you do set an YUV fill, the KMS color pipeline most likely needs to
> > convert it to RGBA for blending, and then you need the plane properties
> > COLOR_ENCODING and COLOR_RANGE.
> >=20
> > But why bother when userspace can convert that one pixel to RGBA itself
> > anyway? =20
>=20
> Noted, I think this is reasonable.
>=20
> >  =20
> >>> We've recently-ish standardized a new Wayland protocol [1] which has =
the same
> >>> purpose as this new kernel uAPI. The conclusion there was that using =
32-bit
> >>> values for each channel (R, G, B, A) would be enough for almost all u=
se-cases.
> >>> The driver can convert these high-precision values to what the hardwa=
re expects.
> >>> The only concern was about sending values outside of the [0.0, 1.0] r=
ange,
> >>> which may have HDR use-cases. =20
> >=20
> > This is what I would suggest, yes. This representation has enough
> > precision to be future-proof, and the driver will be converting the
> > value anyway.
> >=20
> > The question about values outside of the unit range is a good one, too.
> > With Wayland, we can simply add another request to set a value in
> > floating-point if that turns up necessary.
> >=20
> > Whether that will ever be necessary is connected to how the DRM KMS
> > abstract color pipeline is modelled, and that you must define from the
> > beginning:
> >=20
> > If DRM KMS gets color processing related plane properties like CTM,
> > GAMMA or DEGAMMA (they already exist for CRTC, and these have been
> > proposed for planes quite some time ago), does the fill color go
> > through all these operations, or will the fill color skip all these
> > operations and go straight to plane blending? =20
>=20
> The fill color would still go through color processing operations,=20
> though FWIW the MSM driver doesn't support GAMMA/DEGAMMA.

That's ok. The important bit is to define what must happen *if* such
plane properties are exposed by a driver. If they are not exposed, no
problem.

Btw. I could easily expect disagreement between different hardware
here, so I think this part will need many eyes to review.

If hardware is hard-wired to feed the fill color straight to blending,
then if fill color UAPI is defined to go through per-plane color
processing, the driver needs to apply that color processing on the CPU
before programming the hardware.

If hardware allows processing the fill color through per-plane color
processing, but fill color UAPI is defined to feed straight to blending,
then the driver can simply ignore the per-plane color properties and
program pass-through to the hardware.

For userspace, I think the choice makes little difference. Userspace
can compensate for the choice the same way a driver would, except
userspace can perhaps use more precise calculation methods. OTOH, if
fill color is intended to match the color on a real FB on another
plane, not going through the exact same computations might cause error.
Whether that error is significant depends on the use case and is
impossible to say here and now.

The important bit is to make that choice and document it.

...

> >>> - Define a struct with a version and RGBA values:
> >>>    struct color_fill_blob { u32 version; u32 rgba[4]; };
> >>>    If we need to add more formats later, or new metadata:
> >>>    struct color_fill_blob2 { u32 version; /* new fields */ };
> >>>    where version must be set to 2. =20
> >=20
> > This could work. =20
>=20
> Leaning towards this option.

Yes, it seems the best to me too. Just rgb[3] rather than rgba[4],
given the discussion about the plane alpha property. Or even u32 r;
u32 g; u32 b; to avoid having to think about the index in code.


Thanks,
pq

>=20
> Thanks,
>=20
> Jessica Zhang
>=20
> >  =20
> >>> - Define a struct with a "pixel_format" prop, but force user-space to=
 use a
> >>>    fixed format for now. Later, if we need another format, add a new =
prop to
> >>>    advertise supported formats.
> >>> - More complicated solutions, e.g. advertise the list of supported fo=
rmats from
> >>>    the start. =20
> >=20
> > Feels more complicated than necessary.
> >=20
> > Anyway, the idea of creating a blob and then setting that into some KMS
> > plane property sounds a very good mechanism.
> >  =20
> >>>
> >>> [1]: https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge=
_requests/104
> >>>    =20
> >>
> >> Agreeing with most of what you said here. However, what's the idea
> >> behind a format anyway? The 4 values provided here are fed directly
> >> into the color pipeline which seems to define the color channels it's
> >> working on as RGBA (or doesn't define anything at all). The only
> >> reason I can think of is that hardware might support only ingesting
> >> values either in a format with high bit depth color channels and no
> >> alpha or a format with low bit depth color but with alpha, so choosing
> >> between the formats provides a real trade-off. Is that actually
> >> something hardware might be restricted to or do they all just support
> >> ingesting the color data with enough precision on every channel? > =20
> > Right.
> >=20
> >=20
> > Thanks,
> > pq =20


--Sig_/XjTuUkKtVLzgHMe5PtpxKyy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmN/MGwACgkQI1/ltBGq
qqf7LxAAmWV9By1dg7I3M6Klc6ZrWwO3VpZzrUHoKRXbECgWXbpACP11TZqSsGAK
lGlDE+yqexfH6WMNA2HN7YpekJqCMNeWTo6p19D/0lblAbYRFwNFCyYSf2hasJ5B
Ec3hogTAphzQHiFejdA7u3WXmNchKUHcgdeAZmceK4xcoRuMPQ0oKBj+q84D4Wm1
EOEud1z3Q+QEyA40J5UXbNIxKCVFeIN/Doht5YAmkHtHdFBSLtEK2lmpdsnG8mn4
cl3blEOqUtS4k/5u2puvQ3TkfoyelB5Kdb/iA5HIPdGGA1Dot6xCfkiuEdH7cmAs
xycmlS8jqJ5rgab9Hw6f0csqZ1E5otRB/q5RVC19aYBGylxq/Hvl+9XwzAjrk+l+
Atr0WveaeUu4OFg0ppIymKzJpAk1ADgHPK87C+Uu8bNp6RvBtJSFsr6heQuEFa1n
R1l4VbEBLTVVcxzgRlhQupu2IRCDiYZoulJTDtm/XQvPP/wD7IoqBP7CbnKO4ETy
ZKpVKCb9tgxwnXGetVBLKG2t+1CcEQh1QnkgpGlXuP1FwOebE5NPW9mZPj8KEHMA
O2j5RCBjcbG6ms86OAM1HVInE3UU4vwzitfQ6y0nRGHPPh7KSYzyrCJM+dSoDEbo
PlIv/2hWpbzzjR18oRdpkCkBpYDUvcVn1LeS/bE6iGWiSmagTZw=
=06R0
-----END PGP SIGNATURE-----

--Sig_/XjTuUkKtVLzgHMe5PtpxKyy--
