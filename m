Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A506226B8
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 10:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BEA10E59B;
	Wed,  9 Nov 2022 09:19:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28A810E0A8;
 Wed,  9 Nov 2022 09:19:10 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id g12so24750634lfh.3;
 Wed, 09 Nov 2022 01:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=C57pEcnZL50NfAP5APtROVqmasxTIHu1OuRUTNWgEHc=;
 b=huIMRi+F4Tzdayp6WkHbOB4Pmgqcn1P6r636v+PBzil6sBwSdOsKZf69bRQC+Gc4ai
 h/+ij0OOjSJn88mZxXV1CcXaZNuwfEW6SwiUCNfL/X2eO723i4DiFh+PLQLrfGTHqbek
 qqfzOLw2grnKS58DJtWqfF3qj38Nl5TR42sJStjQ0AibI5qhQ0ga2q3UGb5RrpLbDShs
 VE1L3vmmnv6sQeVV35JSvAjqpd/JCKmtlK9lJtn1Cu+uUtW864OQgtXs3mLYaxAcabqM
 c8Xbml1bnwEN59wIOCVVKTcqq/4Rdr7znlVOFqZujPyZeBRqH9wvBsJv0dRw96GTKhKv
 LjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C57pEcnZL50NfAP5APtROVqmasxTIHu1OuRUTNWgEHc=;
 b=hFwn7cclqnXZdoS92T8IYFXcKoxPjWm5AYHaPOn5QtLYXFduROeumYwuLff1BRZIlI
 oTxzJlgPeVUu7T05LH1LBnMFe4i1MXJ0X3Bkj0PTJFYz4L77qHDnQmxU4qIdzq+PLvGB
 n3K5K7vWsXUSoIHQgby0sSOlhd9/BxC/2GgoqZ8whYxtqlKPUHN2SuZlVPtwvnh/St8c
 j8d7r7Eo72cgrTQPJscMc9vCg2NbG+8UgRWvpfGbNgwyYiwR/1CWD5jShkbegrn5AlIe
 qz51ID/9RvKXX8INfQ6oaKmp4uL1hbePKhJnfv3nzlaJ3rRrSQfwuBi3zZKONzzT7EVP
 RhdA==
X-Gm-Message-State: ACrzQf2G+s1d3tK8huBizmUBddB9Y2kRzpOHazylYFY0DIpVezd97kBh
 fGxjvVbCMQtH4ORJVwRiVFM=
X-Google-Smtp-Source: AMsMyM7QF6nyCqKoUzN2dPeIV4NIuJFNFcyqQae4acUA/oVW9+wWYHzpqYbD25XA/yqs7A1PElEnNg==
X-Received: by 2002:a19:5e4e:0:b0:4b0:1305:7cb8 with SMTP id
 z14-20020a195e4e000000b004b013057cb8mr22646565lfi.290.1667985548594; 
 Wed, 09 Nov 2022 01:19:08 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y9-20020a197509000000b00492ca820e15sm2147724lfe.270.2022.11.09.01.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 01:19:08 -0800 (PST)
Date: Wed, 9 Nov 2022 11:18:57 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Message-ID: <20221109111857.36486d8d@eldfell>
In-Reply-To: <CA+hFU4wrDtSpU5owaNVP=8F3bQCnFCaJ7RmGOS0y4cooKQ5+CQ@mail.gmail.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-2-quic_jesszhan@quicinc.com>
 <712a9a25-4c38-9da5-b1a6-39e4665b4d31@linaro.org>
 <U3Koc0-B-7C7sbIpcRWokBHPOQdrQl7azJxAUWFJ4nmsk5nPf9NnUgBr9HOFUZ9YLJOKREN878fXv_BeIc15Kh_jVAFCFbYr8XfS3s0Os_M=@emersion.fr>
 <CA+hFU4wrDtSpU5owaNVP=8F3bQCnFCaJ7RmGOS0y4cooKQ5+CQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dd7l.+GyneUc9s892uV4oWQ";
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

--Sig_/dd7l.+GyneUc9s892uV4oWQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Nov 2022 23:01:47 +0100
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> On Tue, Nov 8, 2022 at 7:51 PM Simon Ser <contact@emersion.fr> wrote:
> >
> > cc'ing Pekka and wayland-devel for userspace devs feedback on the new u=
API.

Hi all,

thanks! Comments below.

> >
> > On Saturday, October 29th, 2022 at 14:08, Dmitry Baryshkov <dmitry.bary=
shkov@linaro.org> wrote:
> > =20
> > > On 29/10/2022 01:59, Jessica Zhang wrote: =20
> > > > Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
> > > > drm_plane. In addition, add support for setting and getting the val=
ues
> > > > of these properties.
> > > >
> > > > COLOR_FILL represents the color fill of a plane while COLOR_FILL_FO=
RMAT
> > > > represents the format of the color fill. Userspace can set enable s=
olid
> > > > fill on a plane by assigning COLOR_FILL to a uint64_t value, assign=
ing
> > > > the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
> > > > framebuffer to NULL.
> > > >
> > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com> =20
> > >
> > > Planes report supported formats using the drm_mode_getplane(). You'd
> > > also need to tell userspace, which formats are supported for color fi=
ll.
> > > I don't think one supports e.g. YV12.
> > >
> > > A bit of generic comment for the discussion (this is an RFC anyway).
> > > Using color_fill/color_fill_format properties sounds simple, but this
> > > might be not generic enough. Limiting color_fill to 32 bits would
> > > prevent anybody from using floating point formats (e.g.
> > > DRM_FORMAT_XRGB16161616F, 64-bit value). Yes, this can be solved with
> > > e.g. using 64-bit for the color_fill value, but then this doesn't sou=
nd
> > > extensible too much.
> > >
> > > So, a question for other hardware maintainers. Do we have hardware th=
at
> > > supports such 'color filled' planes? Do we want to support format
> > > modifiers for filling color/data? Because what I have in mind is clos=
er
> > > to the blob structure, which can then be used for filling the plane:
> > >
> > > struct color_fill_blob {
> > >      u32 pixel_format;
> > >      u64 modifiers4];
> > >      u32 pixel_data_size; // fixme: is this necessary?
> > >      u8 pixel_data[];
> > > };
> > >
> > > And then... This sounds a lot like a custom framebuffer.
> > >
> > > So, maybe what should we do instead is to add new DRM_MODE_FB_COLOR_F=
ILL
> > > flag to the framebuffers, which would e.g. mean that the FB gets stam=
ped
> > > all over the plane. This would also save us from changing if (!fb)
> > > checks all over the drm core.
> > >
> > > Another approach might be using a format modifier instead of the FB f=
lag.
> > >
> > > What do you think? =20
> >
> > First off, we only need to represent the value of a single pixel here. =
So I'm
> > not quite following why we need format modifiers. Format modifiers desc=
ribe how
> > pixels are laid out in memory. Since there's a single pixel described, =
this
> > is non-sensical to me, the format modifier is always LINEAR.

Agreed.

> >
> > Then, I can understand why putting the pixel_format in there is temptin=
g to
> > guarantee future extensibility, but it also adds complexity. For instan=
ce, how
> > does user-space figure out which formats can be used for COLOR_FILL? Can
> > user-space use any format supported by the plane? What does it mean for
> > multi-planar formats? Do we really want the kernel to have conversion l=
ogic for
> > all existing formats? Do we need to also add a new read-only blob prop =
to
> > indicate supported COLOR_FILL formats?

Right. This does not seem to require pixel formats at all.

The point of pixel formats is to be able to feed large amounts of data
as-is into hardware and avoid the CPU ever touching it. You do that
with DRM FBs pointing to suitably allocated hardware buffers. But here
we have exactly one pixel, which I imagine will always be read by the
CPU so the driver will convert it into a hardware-specific format and
program it; probably the driver will not create an internal DRM FB for
it.

The above might also be a reason to not model this as a special-case
DRM FB in UAPI. Or, at least you need a whole new ioctl to create such
DRM FB to avoid the need to allocate e.g. a dumb buffer or a
GPU-specific buffer.

What one does need is what Sebastian brought up: does it support alpha
or not?

Userspace would also be interested in the supported precision of the
values, but the hardware pixel component order is irrelevant because the
driver will always convert the one pixel with CPU anyway.

YUV vs. RGB is a another question. The KMS color pipeline is defined in
terms of RGBA as far as I know, and alpha-blending YUV values makes no
sense. So will there ever be any need to set an YUV fill? I have a hard
time imagining it.

If you do set an YUV fill, the KMS color pipeline most likely needs to
convert it to RGBA for blending, and then you need the plane properties
COLOR_ENCODING and COLOR_RANGE.

But why bother when userspace can convert that one pixel to RGBA itself
anyway?

> > We've recently-ish standardized a new Wayland protocol [1] which has th=
e same
> > purpose as this new kernel uAPI. The conclusion there was that using 32=
-bit
> > values for each channel (R, G, B, A) would be enough for almost all use=
-cases.
> > The driver can convert these high-precision values to what the hardware=
 expects.
> > The only concern was about sending values outside of the [0.0, 1.0] ran=
ge,
> > which may have HDR use-cases.

This is what I would suggest, yes. This representation has enough
precision to be future-proof, and the driver will be converting the
value anyway.

The question about values outside of the unit range is a good one, too.
With Wayland, we can simply add another request to set a value in
floating-point if that turns up necessary.

Whether that will ever be necessary is connected to how the DRM KMS
abstract color pipeline is modelled, and that you must define from the
beginning:

If DRM KMS gets color processing related plane properties like CTM,
GAMMA or DEGAMMA (they already exist for CRTC, and these have been
proposed for planes quite some time ago), does the fill color go
through all these operations, or will the fill color skip all these
operations and go straight to plane blending?

Whether values outside of the unit range will ever be needed depends
also on the userspace design. Userspace could choose the value range
freely if the KMS color pipeline elements happen to support that range.
However things like LUTs are naturally limited to unit range input, so
using values outside of the unit range might be difficult if not
impossible. Therefore I'm not concerned about this question much.

> > So, there are multiple ways to go about this. I can think of:
> >
> > - Put "RGBA32" in the name of the prop, and if we ever need a different
> >   color format, pick a different name.

I could see problems with that if the same device supports more than
one kind. How to turn off all but one color fill property?

What if userspace understands an old color fill property but not the
new one, and the new one happens to be set for some reason? Userspace
will attempt to use the old property without setting the new property
to nil, and fail.

> > - Define a struct with an enum of possible fill kinds:
> >   #define FILL_COLOR_RGBA32 1
> >   #define FILL_COLOR_F32 2
> >   struct color_fill_blob { u32 kind; u8 data[]; };

This could work.

Btw. maybe call it RGBA32323232 to make it follow the drm_fourcc naming
convention. Some userspace libraries already use RGBA32 to mean 32 bit
per pixel instead of per channel.

How will userspace know what kinds are supported?

> > - Define a struct with a version and RGBA values:
> >   struct color_fill_blob { u32 version; u32 rgba[4]; };
> >   If we need to add more formats later, or new metadata:
> >   struct color_fill_blob2 { u32 version; /* new fields */ };
> >   where version must be set to 2.

This could work.

> > - Define a struct with a "pixel_format" prop, but force user-space to u=
se a
> >   fixed format for now. Later, if we need another format, add a new pro=
p to
> >   advertise supported formats.
> > - More complicated solutions, e.g. advertise the list of supported form=
ats from
> >   the start.

Feels more complicated than necessary.

Anyway, the idea of creating a blob and then setting that into some KMS
plane property sounds a very good mechanism.

> >
> > [1]: https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_r=
equests/104
> > =20
>=20
> Agreeing with most of what you said here. However, what's the idea
> behind a format anyway? The 4 values provided here are fed directly
> into the color pipeline which seems to define the color channels it's
> working on as RGBA (or doesn't define anything at all). The only
> reason I can think of is that hardware might support only ingesting
> values either in a format with high bit depth color channels and no
> alpha or a format with low bit depth color but with alpha, so choosing
> between the formats provides a real trade-off. Is that actually
> something hardware might be restricted to or do they all just support
> ingesting the color data with enough precision on every channel?

Right.


Thanks,
pq

--Sig_/dd7l.+GyneUc9s892uV4oWQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmNrcIEACgkQI1/ltBGq
qqeJEQ//ZuyyYQdEvZCTCZD0fwAODE1g1iUB88SUCjESVLCbnqRDjZ/ctde4yRfM
me3jyxjyYZv/+kcnmS/GUNLzPaa8xRfDyVSwyVhYkcfvNg8+o6T50dAJPqxW29Rr
wW9rn3qlXFUUCi97CLOXlE7SCcGbaehTOBU2NsjHjTohMj3azk+TuPTOQwBY8v/N
WLNtYMILjOGCt0RmHfY+FC02eUb8Y/avMY3wTz4++IzSzYK9GLJuLySj2M67SuX3
MKo1irfF1tNIgUa1VriIiRikhP5V1NF+eUmwBKD3xo7OhF+fg64AZowS8PsnwbWQ
8KqtTAMjRfQoh9s3K5e2MYreo7d72jisrhAMGfZ7k2ipHe+ZYQfkDle7skpgNQCZ
fmWC8Zoug7yBkrCPQ+ywziOmEiB+/ndr6nv5vgsDd9e0hpDuxym3XhrtlT3ZqRT3
zG4Q4o27Lt93gy6dLEtGodZjUG9operpl4zIG0OdbMSMDCuuC0Vwua3qind138yk
7Qq341n2hIWtF7tm8g+3C0bTLRTLPvEGAMS2iVhzMIOJ+HkXmZq86R6w2Do+/lJF
4/0G8ZZjXH38KjHwh3qz90hROf86kDFLflR6b8h9tr3ev3tV8ZZ1bSYIqhfxjW2X
sgvSzVFpr701asMgpFxZbI/USAZ2v4LwtZt+ys6T94ZbMTnoPNw=
=UHNw
-----END PGP SIGNATURE-----

--Sig_/dd7l.+GyneUc9s892uV4oWQ--
