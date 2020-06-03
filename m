Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDE91ECCF1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 11:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C74C89A5E;
	Wed,  3 Jun 2020 09:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314D489A5E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 09:50:17 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v19so1271070wmj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 02:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eqAdlOX0nZkmfsp41+ENGsSL9phaEtldMIZ/DbNNe+A=;
 b=y/o6QFxG7z6mZO+lFelFDPHV8m3sXV6O7mXN6KJgZAyWwTEezYrIZfhf25JXJgEB0s
 XHMAXcbnSgvcJQzoy6DQUH3wrB+MtzNZnCzFKlbdiAVi+1gX8kZ4Fr7nrynKY+z7hOro
 kIhACTrTtqKgdAJN1C34kD5Uz8ywz/w1NhJRr04HmNFz8QAzxgH/rHKxjmNT1/gRbYvJ
 DiltQlH8Rr8gSYvK9Co4PSYki8RvhAB/4RKLBr027bKtpdzXASIuBPYihx+PRfnIGDCU
 +7bdhGJm2XHsTUTLQwqtl1AW/30tdbALkkY8HXIIV5xW8RL7vkP89JzSTy6HiNURjBac
 j3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eqAdlOX0nZkmfsp41+ENGsSL9phaEtldMIZ/DbNNe+A=;
 b=O0gRrbSV3a5dnQlunjjJXFt8Jq2DfmLmPyn86RpXBtqa6io9d+JVQNPL9q61n0Lpok
 YsVEWRICwxT76SaAcm8gTMbZLMbKJqnjZcmPYQ6zGoVocYHHbnI3hvxt4QoV5WZFBf/N
 xJMxuieDsHxbeAPivZqogBmgLaU70Z5QN+jyq5zuVrTMWApx64ztb15flnRr4WEkGX4g
 4HDO75FS5MhN8hzqowRgvdROj3r2VLHI3qd77iW+q4jvuU+kSbm5TjbTXNz9vY404sz9
 5JjElPcLmzUfFuXi5o5Y8WiGA/k40AEJXW9qBAtzqzBBTI0YfhgIq0l1ONPY+EpaBMpb
 sNSg==
X-Gm-Message-State: AOAM533Gx5T8MfvU6yPhhJxPOFoHWQJOr9FEZvfAi7LzdPpsrbvxSUq0
 hUwcu9mFB6+ywUptktXhKB9Q0upJOu05B/cjP32fnA==
X-Google-Smtp-Source: ABdhPJwLc8RlsHCfbuVYDGja3chpAizgtZr9p0hqE3rlQVw0+92oNJQW6EVvMqVI45RbghXhuwjxYBBdmI2sRJj1hyE=
X-Received: by 2002:a1c:7515:: with SMTP id o21mr7751219wmc.52.1591177815513; 
 Wed, 03 Jun 2020 02:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
 <CAAxE2A4NCo_KMkemUOHKbZ7P=GR4p-zwhpmP7Get18x4Ydb-Gg@mail.gmail.com>
 <bbZABMxDckHUj5JW5DW0pSewqQ-rAIW0gvNnTlI4np7o1A2bDrpPGIeyk5tXGMDr_cAI1l_R9qw6ykJ8OEhQlbKruJ8IG579jqADaPAnUbA=@emersion.fr>
 <CADnq5_MEFM_2k_uboU6E9d3_j18K+tz=Axtie-80PSSwJ2vkYw@mail.gmail.com>
 <CAPj87rMrJLNNbFJVvf081=eRqPqAe1H7=+PM21N22Jdsg7FzVQ@mail.gmail.com>
 <CADnq5_OX9o5_Gc4SjU5M4B=fthT9++J-FjX3UqTS7x_u6cJHOQ@mail.gmail.com>
 <CAPj87rP+Hxhohb4dEjRwtZzy34fYk+hAdgVfCkLF1u4JufJ=CQ@mail.gmail.com>
 <CADnq5_Pzj+AWQZWOcwvf8WQDVJrpc2DyG6Z1ZYqgfHA-8AXpMA@mail.gmail.com>
 <CAPj87rNO62i5JmRLdMhAg9XbiJUyrrRO7fj1ruXRCh-oxHnifQ@mail.gmail.com>
 <CADnq5_PVZ_DS65SCS=OFW0m7Dz10pMAZVZ33pWf86KBwg4oQKw@mail.gmail.com>
In-Reply-To: <CADnq5_PVZ_DS65SCS=OFW0m7Dz10pMAZVZ33pWf86KBwg4oQKw@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 3 Jun 2020 10:48:20 +0100
Message-ID: <CAPj87rNrJtJeVd0ba768D2VMiEKvhXOCozAhkq6QV6mu3WsFVQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/fourcc: document modifier uniqueness requirements
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

On Mon, 1 Jun 2020 at 15:25, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Fri, May 29, 2020 at 11:03 AM Daniel Stone <daniel@fooishbar.org> wrote:
> > What Weston _does_ know, however, is that display controller can work
> > with modifier set A, and the GPU can work with modifier set B, and if
> > the client can pick something from modifier set A, then there is a
> > much greater probability that Weston can leave the GPU alone so it can
> > be entirely used by the client. It also knows that if the surface
> > can't be directly scanned out for whatever reason, then there's no
> > point in the client optimising for direct scanout, and it can tell the
> > client to select based on optimality purely for the GPU.
>
> Just so I understand this correctly, the main reason for this is to
> deal with display hardware and render hardware from different vendors
> which may or may not support any common formats other than linear.

It handles pretty much everything other than a single-context,
single-GPU, single-device, tunnel.

When sharing between subsystems and device categories, it lets us talk
about capabilities in a more global way. For example, GBM lets you
talk about 'scanout' and 'texture' and 'render', but what about media
codecs? We could add the concept of decode/encode to something like
GBM, and all the protocols like Wayland/X11 as well, then hope it
actually works, but ...

When sharing between heterogeneous vendors, it lets us talk about
capabilities in a neutral way. For example, if you look at most modern
Arm SoCs, your GPU, display controller, and media codec, will very
likely all be from three totally different vendors. A GPU like
Mali-T8xx can be shipped in tens of different vendor SoCs in several
different revisions each. Just saying 'scanout' is totally meaningless
for the Panfrost driver. Putting awareness for every different KMS
platform and every different codec down into the Mesa driver is a
synchronisation nightmare, and all those drivers would also need
specific awareness about the Mesa driver. So modifiers allow us to
explicitly describe that we want a particular revision of Arm
Framebuffer Compression, and all the components can understand that
without having to be specifically aware of 15 different KMS drivers.
But even if you have the same vendor ...

When sharing between multiple devices of the same class from the same
vendor, it lets us surface and transit that information in a generic
way, without AMD having to figure out ways to tunnel back-channel
information between different instances of drivers potentially
targeting different revisions. The alternatives seem to be deeply
pessimal hacks, and we think we can do better. And when we get
pessimal ...

In every case, modifiers are about surfacing and sharing information.
One of the reasons Collabora have been putting so much time and energy
into this work is exactly _because_ solving those problems on a
case-by-case basis was a pretty lucrative source of revenue for us.
Debugging these kinds of issues before has usually involved specific
driver knowledge, hacking into the driver to insert your own tracing,
etc.

If you (as someone who's trying to use a device optimally) are
fortunate enough that you can get the attention of a vendor and have
them solve the problem for you, then that's lucky for everyone apart
from the AMD engineers who have to go solve it. If you're not, and you
can't figure it out yourself, then you have to go pay a consultancy.
On the face of it, that's good for us, except that we don't want to be
doing that kind of repetitive boring work. But it's bad for the
ecosystem that this knowledge is hidden away and that you have to pay
specialists to extract it. So we're really keen to surface as much
mechanism and information as possible, to give people the tools to
either solve their own problems or at least make well-informed
reports, burn down a toxic source of revenue, waste less engineering
time extracting hidden information, and empower users as much as
possible.

> It
> provides a way to tunnel device capabilities between the different
> drivers.  In the case of a device with display and rendering on the
> same device or multiple devices from the same vendor, it not really
> that useful.

Oh no, it's still super useful. There are a ton of corner cases where
'if you're on same same-vendor same-gen same-silicon hardware' falls
apart - in addition to the world just not being very much
same-vendor/same-gen/same-silicon anymore. For some concrete examples:

On NVIDIA Tegra hardware, planes within the display controller have
heterogeneous capability. Some can decompress and detile, others
can't.

On Rockchip hardware, AFBC (DCC equivalent) is available for scanout
on any plane, and can be produced by the GPU. Great! Except that 'any
plane' isn't 'every plane' - there's a global decompression unit.

On Intel hardware, they appear to have forked the media codec IP,
shipping two different versions of the codec, one as 'low-power' and
one as 'normal', obviously with varying capability.

Even handwaving those away as vendor errors - that performance on
those gens will always be pessimal and they should do better next time
- I don't think same-vendor/same-gen/same-silicon is a good design
point anymore. Between heterogeneous cut-and-paste SoCs, multi-GPU and
eGPU usecases, virtualisation and tunneling, etc, the usecases are
starting to demand that we do better. Vulkan's memory-allocation
design also really pushes against the model that memory allocations
themselves are blessed with side-channel descriptor tags.

'Those aren't my usecases and we've made Vulkan work so we don't need
it' is an entirely reasonable position, but then you're just
exchanging the problem of describing your tiling & compression layouts
in a 56-bit enum to make modifiers work, for the problem of
maintaining a surprisingly wide chunk of the display stack. For all
the reasons above, over the past few years, the entire rest of the
ecosystem has settled on using modifiers to describe and negotiate
buffer exchange across context/process/protocol/subsystem/device
boundaries. All the effort of making this work in KMS, GBM, EGL,
Vulkan, Wayland, X11, V4L2, VA-API, GStreamer, etc, is going there.

Realistically, the non-modifier path is probably going to bitrot, and
people are certainly resistant to putting more smarts into it, because
it just adds complexity to a now-single-vendor path - even NVIDIA are
pushing this forward, and their display path is much more of an
encapsulated magic tunnel than AMD's. In that sense, it's pretty much
accumulating technical debt; the longer you avoid dealing with the
display stack by implementing modifiers, the more work you have to put
into maintaining the display stack by fixing the non-modifier path.

> It doesn't seem to provide much over the current EGL
> hints (SCANOUT, SECURE, etc.).

Well yeah, if those single bits of information are enough to perfectly
encapsulate everything you need to know, then sure. But it hasn't been
for others, which is why we've all migrated away from them.

> I still don't understand how it solves
> the DCC problem though.  Compression and encryption seem kind like
> meta modifiers.  There is an under laying high level layout, linear,
> tiled, etc. but it could also be compressed and/or encrypted.  Is the
> idea that those are separate modifiers?  E.g.,
> 0: linear
> 1: linear | encrypted
> 2. linear | compressed
> 3: linear | encrypted | compressed
> 4: tiled1
> 5: tiled1 | encrypted
> 6: tiled1 | compressed
> 7: tiled1 | encrypted | compressed
> etc.
> Or that the modifiers only expose the high level layout, and it's then
> up the the driver(s) to enable compression, etc. if both sides have a
> compatible layout?

Do you remember the old wfb from xserver? Think of modifiers as pretty
much that. The format (e.g. A8R8G8B8) describes what you will read
when you load a particular pixel/texel, and what will get stored when
you write. The modifier describes how to get there: that includes both
tiling (since you need to know the particular tiling layout in order
to know the byte location to access), and compression (since you need
to know the particular compression mechanism in order to access the
pixel, e.g. for RLE-type compression that you need to access the first
pixel of the tile if the 'all pixels are the identical' bit is set).

The idea is that these tokens fully describe the mechanisms in use,
without the drivers needing to do magic heuristics. For instance, if
your modifier is just 'tiled', then that's not a full description. A
full description would tell you about supertiling structures, tile
sizes and ordering, etc. The definitions already in
include/uapi/drm/drm_fourcc.h are a bit of a mixed bag - we've
definitely learnt more as we've gone on - but the NVIDIA definitions
are  pretty exemplary for something deeply parameterised along a lot
of variable axes.

Basically, if you have to have sets of heuristics which you keep in
sync in order to translate from modifier -> hardware layout params,
then your modifiers aren't expressive enough. From a very quick look
at DC, that would be your tile-split, tile-mode, array-mode, and
swizzle-mode parameters, plus whatever from dc_tiling_mode isn't
completely static and deterministic. 'DCCRate' always appears to be
hardcoded to 1 (and 'DCCRateChroma' never set), but that might be one
to parameterise as well.

With that expression, you don't have to determine the tiling layout
from dimensions/usage/etc, because the modifier _is_ the tiling
layout, ditto compression.

Encryption I'm minded to consider as something different. Modifiers
don't cover buffer placement at all. That includes whether or not the
memory is physically contiguous, whether it's in
hidden-VRAM/BAR/sysmem, which device it lives on, etc. As far as I can
tell from TMZ, encryption is essentially a side effect of placement?
The memory is encrypted, the encryption is an immutable property of
the allocation, and if the device is configured to access encrypted
memory (by being 'secure'), then the encryption is transparent, no?

That being said, there is a reasonable argument to consume a single
bit in modifiers for TMZ on/off (assuming TMZ is not parameterised),
which would make its availability and use much more transparent.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
