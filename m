Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F364036F3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 11:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD646E160;
	Wed,  8 Sep 2021 09:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D366E160
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 09:34:11 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id c8so3687072lfi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 02:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=DJTB1yEL38oGgXn6iG37qDlxj3TpY087Waej5LUKOB8=;
 b=U5vRtqRbkFtGJMoc7FPY1BZYVQF5UWg2VsB4WC2YGWupXQRnzxwqZt3Q/tXTVWVcSz
 tMozND8tD4YWeQrSZP/ZsWmp4viTdF/5jVHHlk4Cbdo5R4kRor4FJm9JhepKp1xCaiiZ
 lKgkpM9IuZj6CBkbxUm54r6Cb+7d1RCy3DxfmlqpdbGuexSRdWWNFMIGRN5jaXitIxOd
 fGud2b6wCIpvvpp1bWpU5Ow5D+IFrpeiuq6T30zVLRzsmARJcwBIt6vUQT3cXiDjN1ho
 NWimqHVhvG4rNmz0MjsMnFVof6Mp/voO0FvRmSUt0x+fW5KUFfUS6vDPfPqBn6r1h5zV
 xDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=DJTB1yEL38oGgXn6iG37qDlxj3TpY087Waej5LUKOB8=;
 b=cKx0fWmd+/jn9KS12a56TIwrOFqTmqrgLw0BnXad50Gat1i9NX0O7q8F4S7DdKngGI
 1he1lpjCfCKYkCPlJyHBt2GyC33d8mWDAtKCcmHM/qsw6Xyxc7K2RouOv2+QA7o9CHVa
 04Icb5FvC4VYY300a+jMLFNF8c+TMfaA1hzoBx68tVrcIZ2HXVJUEryPmXO6PF3uF81k
 oJfoQiy+OxnzFdQMX2Ck00w43RVNnwZpTjnk3kH81FnD3aU6qgMhTPMQrhLXQo/4L3x+
 eXjzO0lN9OnoDP3IEZvtycj62BO8YGFqbIA0UBRifSLcwD9HNCZf8EJZ9r/uTPd3VYcn
 0Dgw==
X-Gm-Message-State: AOAM5333XtWJr/OHCg0tQX9R4YWpVO3QZZEpIT4Or+V3vi8OWmC0zeDz
 g5cyaW6tkLMDiUOeslqHT9M=
X-Google-Smtp-Source: ABdhPJxDFopWlfbuUuXHmINDB285KlPqQrg0F8vhj1BDnEr4i4C55hhfC9iYLTZlY36REr7kKPF55A==
X-Received: by 2002:ac2:5c05:: with SMTP id r5mr2029035lfp.344.1631093649840; 
 Wed, 08 Sep 2021 02:34:09 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id a15sm188241ljb.18.2021.09.08.02.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 02:34:09 -0700 (PDT)
Date: Wed, 8 Sep 2021 12:34:06 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Stone <daniels@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Simon Ser <contact@emersion.fr>, Robert
 Beckett <bob.beckett@collabora.com>
Subject: Re: [PATCH] doc: gpu: Add document describing buffer exchange
Message-ID: <20210908123406.33ced2d6@eldfell>
In-Reply-To: <20210905122742.86029-1-daniels@collabora.com>
References: <20210905122742.86029-1-daniels@collabora.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lqee8ql267/s2RDPuw6+A_v";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/lqee8ql267/s2RDPuw6+A_v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sun,  5 Sep 2021 13:27:42 +0100
Daniel Stone <daniels@collabora.com> wrote:

> Since there's a lot of confusion around this, document both the rules
> and the best practice around negotiating, allocating, importing, and
> using buffers when crossing context/process/device/subsystem boundaries.
>=20
> This ties up all of dmabuf, formats and modifiers, and their usage.
>=20
> Signed-off-by: Daniel Stone <daniels@collabora.com>

Hi,

I checked the comments from Simon and Bob, and I agree with them. Below
are some more from me.

There is room for adding a glossary for the terms, like what is the
difference between a buffer, pixel buffer and a memory buffer, and
things like pixel data, color value, stride, etc.

For example:

image
	Conceptually a two-dimensional array of pixels. The pixels may
	be stored in one or more memory buffers. Has width and height
	in pixels, pixel format and modifier (implicit or explicit).

memory buffer
	A piece of memory for storing (parts of) pixel data. Has stride
	and size in bytes and at least one handle in some API. May
	contain one or more planes.

plane
	A two-dimensional array of some or all of an image's color and
	alpha channel values.

pixel
	A picture element. Has a single color value which is defined by
	one or more color channels values, e.g. R, G and B, or Y, Cb
	and Cr. May also have an alpha value as an additional
	channel.

pixel data
	Bytes or bits that represent some or all of the color/alpha
	channel values of a pixel or an image. The data for one pixel
	may be spread over several planes or memory buffers depending
	on format and modifier.

color value
	A tuple of numbers, representing a color. Each element in the
	tuple is a color channel value.

color channel
	One of the dimensions in a color model. For example, RGB model
	has channels R, G, and B. Alpha channel is sometimes counted as
	a color channel as well.

pixel format
	A description of how pixel data represents the pixel's color
	and alpha values.

modifier
	A description of how pixel data is laid out in memory buffers.

alpha
	A value that denotes the color coverage in a pixel. Sometimes
	used for translucency instead.

stride
	????


> ---
>=20
> This is just a quick first draft, inspired by:
>   https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/3197#note_104=
8637
>=20
> It's not complete or perfect, but I'm off to eat a roast then have a
> nice walk in the sun, so figured it'd be better to dash it off rather
> than let it rot on my hard drive.

For a quick draft, this is quite excellent.

>=20
>  .../gpu/exchanging-pixel-buffers.rst          | 285 ++++++++++++++++++
>  Documentation/gpu/index.rst                   |   1 +
>  2 files changed, 286 insertions(+)
>  create mode 100644 Documentation/gpu/exchanging-pixel-buffers.rst
>=20
> diff --git a/Documentation/gpu/exchanging-pixel-buffers.rst b/Documentati=
on/gpu/exchanging-pixel-buffers.rst
> new file mode 100644
> index 000000000000..75c4de13d5c8
> --- /dev/null
> +++ b/Documentation/gpu/exchanging-pixel-buffers.rst
> @@ -0,0 +1,285 @@
> +.. Copyright 2021 Collabora Ltd.
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Exchanging pixel buffers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +As originally designed, the Linux graphics subsystem had extremely limit=
ed
> +support for sharing pixel-buffer allocations between processes, devices,=
 and
> +subsystems. Modern systems require extensive integration between all thr=
ee
> +classes; this document details how applications and kernel subsystems sh=
ould
> +approach this sharing for two-dimensional image data.
> +
> +It is written with reference to the DRM subsystem for GPU and display de=
vices,
> +V4L2 for media devices, and also to Vulkan, EGL and Wayland, for userspa=
ce
> +support, however any other subsystems should also follow this design and=
 advice.
> +
> +
> +Formats and modifiers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Each buffer must have an underlying format. This format describes the da=
ta which
> +can be stored and loaded for each pixel. Although each subsystem has its=
 own
> +format descriptions (e.g. V4L2 and fbdev), the `DRM_FORMAT_*` tokens sho=
uld be
> +reused wherever possible, as they are the standard descriptions used for
> +interchange.
> +
> +Each `DRM_FORMAT_*` token describes the per-pixel data available, in ter=
ms of
> +the translation between one or more pixels in memory, and the color data
> +contained within that memory. The number and type of color channels are
> +described: whether they are RGB or YUV, integer or floating-point, the s=
ize
> +of each channel and their locations within the pixel memory, and the
> +relationship between color planes.
> +
> +For example, `DRM_FORMAT_ARGB8888` describes a format in which each pixe=
l has a
> +single 32-bit value in memory. Alpha, red, green, and blue, color channe=
ls are
> +available at 8-byte precision per channel, ordered respectively from mos=
t to

8-bit

> +least significant bits in little-endian storage. As a more complex examp=
le,

I'd add something like:

	DRM_FORMAT_* definitions do not depend on CPU or
	device endianness, the byte pattern in memory is always as
	described in the format definition, usually little-endian.

That's the consensus nowadays, right?

> +`DRM_FORMAT_NV12` describes a format in which luma and chroma YUV sample=
s are
> +stored in separate memory planes, where the chroma plane is stored at ha=
lf the
> +resolution in both dimensions (i.e. one U/V chroma sample is stored for =
each 2x2
> +pixel grouping).
> +
> +Format modifiers describe a translation mechanism between these per-pixe=
l memory
> +samples, and the actual memory storage for the buffer. The most straight=
forward
> +modifier is `DRM_FORMAT_MOD_LINEAR`, describing a scheme in which each p=
ixel has
> +contiguous storage beginning at (0,0); each pixel's location in memory w=
ill be
> +`base + (y * stride) + (x * bpp)`. This is considered the baseline inter=
change
> +format, and most convenient for CPU access.
> +
> +Modern hardware employs much more sophisticated access mechanisms, typic=
ally
> +making use of tiled access and possibly also compression. For example, t=
he
> +`DRM_FORMAT_MOD_VIVANTE_TILED` modifier describes memory storage where p=
ixels
> +are stored in 4x4 blocks arranged in row-major ordering, i.e. the first =
tile in
> +memory stores pixels (0,0) to (3,3) inclusive, and the second tile in me=
mory
> +stores pixels (4,0) to (7,3) inclusive.
> +
> +Some modifiers may modify the number of memory buffers required to store=
 the
> +data; for example, the `I915_FORMAT_MOD_Y_TILED_CCS` modifier adds a sec=
ond
> +memory buffer to RGB formats in which it stores data about the status of=
 every
> +tile, notably including whether the tile is fully populated with pixel d=
ata, or
> +can be expanded from a single solid color.
> +
> +These extended layouts are highly vendor-specific, and even specific to
> +particular generations or configurations of devices per-vendor. For this=
 reason,
> +support of modifiers must be explicitly enumerated and negotiated by all=
 users
> +in order to ensure a compatible and optimal pipeline, as discussed below.
> +

Btw. there was a fun argument whether the same modifier value could
mean different things on different devices. There were also arguments
that a certain modifier could reference additional implicit memory on
the device - memory that can only be accessed by very specific devices.

I think AMLOGIC_FBC_LAYOUT_SCATTER was one of those.


> +
> +Dimensions and size
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Each pixel buffer must be accompanied by logical pixel dimensions. This =
refers
> +to the number of unique samples which can be extracted from, or stored t=
o, the
> +underlying memory storage. For example, even though a 1920x1080
> +`DRM_FORMAT_NV12` buffer has a luma plane containing 1920x1080 samples f=
or the Y
> +component, and 960x540 samples for the U and V components, the overall b=
uffer is
> +still described as having dimensions of 1920x1080.
> +
> +The in-memory storage of a buffer is not guaranteed to begin immediately=
 at the
> +base address of the underlying memory, nor is it guaranteed that the mem=
ory
> +storage is tightly clipped to either dimension.
> +
> +Each plane must therefore be described with an `offset` in bytes, which =
will be
> +added to the base address of the memory storage before performing any pe=
r-pixel
> +calculations. This may be used to combine multiple planes into a single =
pixel
> +buffer; for example, `DRM_FORMAT_NV12` may be stored in a single memory =
buffer
> +where the luma plane's storage begins immediately at the start of the bu=
ffer
> +with an offset of 0, and the chroma plane's storage begins after the off=
set of
> +the luma plane as expressed through its offset.

I think it should be: "the chroma plane's storage begins after the luma
plane as expressed through its offset."

That is, drop "the offset of".

Or what Simon said.

> +
> +Each plane must also have a `stride` in bytes, expressing the offset in =
memory
> +between two contiguous scanlines. For example, a `DRM_FORMAT_MOD_LINEAR`=
 buffer
> +with dimensions of 1000x1000 may have been allocated as if it were 1024x=
1000, in
> +order to allow for aligned access patterns. In this case, the buffer wil=
l still
> +be described with a width of 1000, however the stride will be `1024 * bp=
p`,
> +indicating that there are 24 pixels at the positive extreme of the x axi=
s whose
> +values are not significant.

There was another fun discussion just recently about what is stride for
tiled layouts:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/687

Does one need to understand the modifier before you can do buffer size
consistency check with stride and height?


> +
> +Buffers may also be padded further in the y dimension, simply by allocat=
ing a
> +larger area than would ordinarily be required. For example, many media d=
ecoders
> +are not able to natively output buffers of height 1080, but instead requ=
ire an
> +effective height of 1088 pixels. In this case, the buffer continues to be
> +described as having a height of 1080, with the memory allocation for eac=
h buffer
> +being increased to account for the extra padding.
> +
> +
> +Enumeration
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Every user of pixel buffers must be able to enumerate a set of supported=
 formats
> +and modifiers, described together. Within KMS, this is achieved with the
> +`IN_FORMATS` property on each DRM plane, listing the supported DRM forma=
ts, and
> +the modifiers supported for each format. In userspace, this is supported=
 through
> +the `EGL_EXT_image_dma_buf_import_modifiers` extension entrypoints for E=
GL, the
> +`VK_EXT_image_drm_format_modifier` extension for Vulkan, and the
> +`zwp_linux_dmabuf_v1` extension for Wayland.
> +
> +Each of these interfaces allows users to query a set of supported
> +format+modifier combinations.
> +
> +
> +Negotiation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +It is the responsibility of userspace to negotiate an acceptable format+=
modifier
> +combination for its usage. This is performed through a simple intersecti=
on of
> +lists. For example, if a user wants to use Vulkan to render an image to =
be
> +displayed on a KMS plane, it must:
> +  - query KMS for the `IN_FORMATS` property for the given plane
> +  - query Vulkan for the supported formats for its physical device
> +  - intersect these formats to determine the most appropriate one
> +  - for this format, intersect the lists of supported modifiers for both=
 KMS and
> +    Vulkan, to obtain a final list of acceptable modifiers for that form=
at
> +
> +This intersection must be performed for all usages. For example, if the =
user
> +also wishes to encode the image to a video stream, it must query the med=
ia API
> +it intends to use for encoding for the set of modifiers it supports, and
> +additionally intersect against this list.
> +
> +If the intersection of all lists is an empty list, it is not possible to=
 share
> +buffers in this way, and an alternate strategy must be considered (e.g. =
using
> +CPU access routines to copy data between the different uses, with the
> +corresponding performance cost).
> +
> +The resulting modifier list is unsorted; the order is not significant.
> +
> +
> +Allocation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Once userspace has determined an appropriate format, and corresponding l=
ist of
> +acceptable modifiers, it must allocate the buffer. As there is no univer=
sal
> +buffer-allocation interface available at either kernel or userspace leve=
l, the
> +client makes an arbitrary choice of allocation interface such as Vulkan,=
 GBM, or
> +a media API.
> +
> +Each allocation request must take, at a minimum: the pixel format, a lis=
t of
> +acceptable modifiers, and the buffer's width and height. Each API may ex=
tend
> +this set of properties in different ways, such as allowing allocation in=
 more
> +than two dimensions, intended usage patterns, etc.
> +
> +The component which allocates the buffer will make an arbitrary choice o=
f what
> +it considers the 'best' modifier within the acceptable list for the requ=
ested
> +allocation, any padding required, and further properties of the underlyi=
ng
> +memory buffers such as whether they are stored in system or device-speci=
fic
> +memory, whether or not they are physically contiguous, and their cache m=
ode.
> +These properties of the memory buffer are not visible to userspace, howe=
ver the
> +`dma-heaps` API is an effort to address this.
> +
> +After allocation, the client must query the allocator to determine the a=
ctual
> +modifier selected for the buffer, as well as the per-plane offset and st=
ride.
> +Allocators are not permitted to vary the format in use, to select a modi=
fier not
> +provided within the acceptable list, nor to vary the pixel dimensions ot=
her than
> +the padding expressed through offset, stride, and size.
> +
> +
> +Import
> +=3D=3D=3D=3D=3D=3D
> +
> +To use a buffer within a different context, device, or subsystem, the us=
er
> +passes these parameters (format, modifier, width, height, and per-plane =
offset
> +and stride) to an importing API.
> +
> +Each memory plane is referred to by a buffer handle, which may be unique=
 or
> +duplicated within a buffer. For example, a `DRM_FORMAT_NV12` buffer may =
have the
> +luma and chroma buffers combined into a single memory buffer by use of t=
he
> +per-plane offset parameters, or they may be completely separate allocati=
ons in
> +memory. For this reason, each import and allocation API must provide a s=
eparate
> +handle for each plane.
> +
> +Each kernel subsystem has its own types and interfaces for buffer manage=
ment.
> +DRM uses GEM buffer objects (BOs), V4L2 has its own references, etc. The=
se types
> +are not portable between contexts, processes, devices, or subsystems.
> +
> +To address this, `dma-buf` handles are used as the universal interchange=
 for
> +buffers. Subsystem-specific operations are used to export native buffer =
handles
> +to a `dma-buf` file descriptor, and to import those file descriptors int=
o a
> +native buffer handle. dma-buf file descriptors can be transferred between
> +contexts, processes, devices, and subsystems.
> +
> +For example, a Wayland media player may use V4L2 to decode a video frame=
 into
> +a `DRM_FORMAT_NV12` buffer. This will result in two memory planes (luma =
and
> +chroma) being dequeued by the user from V4L2. These planes are then expo=
rted to
> +one dma-buf file descriptor per plane, these descriptors are then sent a=
long
> +with the metadata (format, modifier, width, height, per-plane offset and=
 stride)
> +to the Wayland server. The Wayland server will then import these file
> +descriptors as an EGLImage for use through EGL/OpenGL (ES), a VkImage fo=
r use
> +through Vulkan, or a `drm_fb` for use through KMS; each of these import

libdrm uses just an uint32_t for the FB. drm_fb is a Weston thing only?

> +operations will take the same metadata and convert the dma-buf file desc=
riptors
> +into their native buffer handles.
> +
> +
> +Implicit modifiers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The concept of modifiers post-dates all of the subsystems mentioned abov=
e. As
> +such, it has been retrofitted into all of these APIs, and in order to en=
sure
> +backwards compatibility, support is needed for drivers and userspace whi=
ch do
> +not (yet) support modifiers.
> +
> +As an example, GBM is used to allocate buffers to be shared between EGL =
for
> +rendering and KMS for display. It has two entrypoints for allocating buf=
fers:
> +`gbm_bo_create` which only takes the format, width, height, and a usage =
token,
> +and `gbm_bo_create_with_modifiers` which extends this with a list of mod=
ifiers.
> +
> +In the latter case, the allocation is as discussed above, being provided=
 with a
> +list of acceptable modifiers that the implementation can choose from (or=
 fail if
> +it is not possible to allocate within those constraints). In the former =
case
> +where modifiers are not provided, the GBM implementation must make its o=
wn
> +choice as to what is likely to be the 'best' layout. Such a choice is en=
tirely
> +implementation-specific: some will internally use tiled layouts which ar=
e not
> +CPU-accessible if the implementation decides that is a good idea through
> +whatever heuristic. It is the implementation's responsibility to ensure =
that
> +this choice is appropriate.
> +
> +To support this case where the layout is not known because there is no a=
wareness
> +of modifiers, a special `DRM_FORMAT_MOD_INVALID` token has been defined.=
 This
> +pseudo-modifier declares that the layout is not known, and that the driv=
er
> +should use its own logic to determine what the underlying layout may be.
> +
> +There are four cases where this token may be used:
> +  - during enumeration, an interface may return `DRM_FORMAT_MOD_INVALID`=
, either
> +    as the sole member of a modifier list to declare that explicit modif=
iers are
> +    not supported, or as part of a larger list to declare that implicit =
modifiers
> +    may be used
> +  - during allocation, a user may supply `DRM_FORMAT_MOD_INVALID`, eithe=
r as the
> +    sole member of a modifier list (equivalent to not supplying a modifi=
er list
> +    at all) to declare that explicit modifiers are not supported and mus=
t not be
> +    used, or as part of a larger list to declare that an allocation usin=
g implicit
> +    modifiers is acceptable
> +  - in a post-allocation query, an implementation may return
> +    `DRM_FORMAT_MOD_INVALID` as the modifier of the allocated buffer to =
declare
> +    that the underlying layout is implementation-defined and that an exp=
licit
> +    modifier description is not available; per the above rules, this may=
 only be
> +    returned when the user has included `DRM_FORMAT_MOD_INVALID` as part=
 of the
> +    list of acceptable modifiers, or not provided a list
> +  - when importing a buffer, the user may supply `DRM_FORMAT_MOD_INVALID=
` as the
> +    buffer modifier (or not supply a modifier) to indicate that the modi=
fier is
> +    unknown for whatever reason; this is only acceptable when the buffer=
 has
> +    not been allocated with an explicit modifier
> +
> +It follows from this that a buffer chain must be either fully implicit o=
r fully

"a buffer operations chain" perhaps?

This is about that one specific buffer, not a chain of buffers. Well,
depending on what you mean by buffer... I think the buffer is always
the same even though it may have many different handles and
representations in different APIs simultaneously.

> +explicit. For example, if a user wishes to allocate a buffer for use bet=
ween
> +GPU, display, and media, but the media API does not support modifiers, t=
hen the
> +user **must not** allocate the buffer with explicit modifiers and attemp=
t to
> +import the buffer into the media API with no modifier, but either perfor=
m the
> +allocation using implicit modifiers, or allocate the buffer for media use
> +separately and copy between the two buffers.
> +
> +As one exception to the above, allocations may be 'upgraded' from implic=
it
> +to explicit modifiers. For example, if the buffer is allocated with
> +`gbm_bo_create` (taking no modifiers), the user may then query the modif=
ier with
> +`gbm_bo_get_modifier` and then use this modifier as an explicit modifier=
 token
> +if a valid modifier is returned.
> +
> +When allocating buffers for exchange between different users and modifie=
rs are
> +not available, implementations are strongly encouraged to use
> +`DRM_FORMAT_MOD_LINEAR` for their allocation, as this is the universal b=
aseline
> +for exchange.

Here I might point out something like:

However, it is possible that importing a buffer with implicit modifier
to another device or subsystem than where it was allocated results in
incorrect interpretation of the buffer contents. Therefore generic
userspace should avoid attempting that.

> +
> +Any new users - userspace programs and protocols, kernel subsystems, etc=
 -
> +wishing to exchange buffers must offer interoperability through dma-buf =
file
> +descriptors for memory planes, DRM format tokens to describe the format,=
 DRM
> +format modifiers to describe the layout in memory, at least width and he=
ight for
> +dimensions, and at least offset and stride for each memory plane.
> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> index b9c1214d8f23..cb12f2654ed7 100644
> --- a/Documentation/gpu/index.rst
> +++ b/Documentation/gpu/index.rst
> @@ -10,6 +10,7 @@ Linux GPU Driver Developer's Guide
>     drm-kms
>     drm-kms-helpers
>     drm-uapi
> +   exchanging-pixel-buffers
>     driver-uapi
>     drm-client
>     drivers

Really nice write-up!

Thanks,
pq

--Sig_/lqee8ql267/s2RDPuw6+A_v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmE4g44ACgkQI1/ltBGq
qqduug//WiWDDeCrh2MQBxazyArlLtsceR9wi77v51MSor+bF3SSq9b8ytvQXv64
qZWQYjNqrzdTPi0ExyMLEXoYIw33Bi0xa+y5uEKNjz62vhG/ZvJMSxQARzU1h4Gd
3GiiUU+TBEtz2M+8ZhQaaToJuu7jzHGXknZSI5Fss6+3WEd0uYiiknqs3e+AIQhK
KZ4xNTw0up+qDU9CC/iQq7I8nE535uU0I9NFAN5FO3u+nJuwb88WoE39nLJPZhKf
sFJxwrPglAS52UUtVdproZrWCLnvz90Pgs5qGRKwxFW65FAWQbfiIzG0RYZ22lqj
uno34rR81ezIb0F2g3ELkmTYakDZ/v2Y+MdXd7CmCxP7880zzAdIiTiBY2zhFvQn
NAwheMp5gwq2tuOh81k1n2r/oyM3I5vlA75OCb2V7l5mSX13Kb7nLf/kt8HS0zr5
/Wm3w3D/2I5xCNwBmal5rvKsaqNEsr26xkfqsg2Mrwiy+9XcLyDnKmJfwtn280J8
TyDQV6CdefoKnokkhna3qIf4cM+R/zg+mlGmvRHQsau5gbzrNNWRaNL5q/ytGUG5
zM1szPi+cxvbgkyjMLXitIIkxxfZOqNTuUREkARCo5Ly8od64FNVGvTGZEiswc26
g6IxDW5ozmNTyfbwUzVJvbp6W63jqBHFAIbj3JZnrsQjvovA+ms=
=fP9p
-----END PGP SIGNATURE-----

--Sig_/lqee8ql267/s2RDPuw6+A_v--
