Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDB7DB803
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 21:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526B56EA9D;
	Thu, 17 Oct 2019 19:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DA26EA8C;
 Thu, 17 Oct 2019 19:50:17 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id t5so3263423ilh.10;
 Thu, 17 Oct 2019 12:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IXDjzVM3EBXod42Zj3cs5RwVdhdyRBHOiuy8B0ebsvw=;
 b=B9JDOVJA1jRpvzhsyDaWHkBz6bHGPAJDc5X7ehr+MwMfc0YvzFAFybRaxdfZyrzo41
 ZnMOarIHOdQoU5CAFBDdWhRgz2SrN0PlqSlvOoZiOw9lWidyHoocll6yLn2bQKuJu3Sk
 TvLEakwtlZIISmpqFFOL+X7aqw5A30/Wu161HnV/3tT4nA/cTnLm7zDr58h/LWugk0NW
 HiLwdqD+IgMmM8pvyxFuudRLKrQ6waIGMii62t5DWSRny3FI4CWlutsFFEDbfdHCSrHm
 RS9o7FkoopLay5II5tuecX0oYE1+hDW+A5s9D5ciYTElsHN2I4lbIKyKg+MEzlp23mqZ
 5fGQ==
X-Gm-Message-State: APjAAAUbyWZr5xGyEf8Fsnrs52rUA20UR31zBtyjs29aG4cbwiLo6dFU
 0D0ZeHCD9T5J+EBqZ9Kg8mcBr7UE/o4udX/WYW8=
X-Google-Smtp-Source: APXvYqx5Cd3Qa5nadFxSXcjVTJqOcuP9rGo60RzCqxx+7pUDwYwvqqBz6I2AtWh4HKWwiVl0Mt/D5oBGcFfMKJOP85g=
X-Received: by 2002:a92:3954:: with SMTP id g81mr6131855ila.255.1571341816929; 
 Thu, 17 Oct 2019 12:50:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191016134656.3396068-1-bas@basnieuwenhuizen.nl>
In-Reply-To: <20191016134656.3396068-1-bas@basnieuwenhuizen.nl>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Thu, 17 Oct 2019 15:49:40 -0400
Message-ID: <CAAxE2A42b0bkMkA1_XuHzgphfVVtMmLGrrvAOo49K1ujY_y_JA@mail.gmail.com>
Subject: Re: [RFC] drm: Add AMD GFX9+ format modifiers.
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=IXDjzVM3EBXod42Zj3cs5RwVdhdyRBHOiuy8B0ebsvw=;
 b=jjQyTBCRyHb4lqZZ2siXBhYk5XhjtYwFd8YoDXNy7jsNoyWRvMWHAChkeKGEzxctxW
 N1+tggF+Mr/++OG2hVCbAPI/hSn8s7GCdnq4eV1Ju71XOBRdXrXG5cipK6qmeltNYMB9
 Vnfk6PPw0uqEmHswkQaU5+v9Y9FQzy/9ovbikCQfhziqldsm7nR4RIaQ2E181Zlw+h20
 p5C6Y/UnuFDinxgh9ykkcwh1v/byxjeY9QpXBsqB6U0mdHy1SouZiuPiechHDtTY+CvO
 VDRUNVKjb2SC2JXOOe3pLjVLAZk/zffnWT+q/93+CAfU82CAgkU5WCiwk67WGJQrFkgY
 UVLw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Drew Davenport <ddavenport@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1241413900=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1241413900==
Content-Type: multipart/alternative; boundary="000000000000d1b0c5059520865c"

--000000000000d1b0c5059520865c
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 16, 2019 at 9:48 AM Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
wrote:

> This adds initial format modifiers for AMD GFX9 and newer GPUs.
>
> This is particularly useful to determine if we can use DCC, and whether
> we need an extra display compatible DCC metadata plane.
>
> Design decisions:
>   - Always expose a single plane
>        This way everything works correctly with images with multiple
> planes.
>
>   - Do not add an extra memory region in DCC for putting a bit on whether
>     we are in compressed state.
>        A decompress on import is cheap enough if already decompressed, and
>        I do think in most cases we can avoid it in advance during modifier
>        negotiation. The remainder is probably not common enough to worry
>        about.
>
>   - Explicitly define the sizes as part of the modifier description instead
>     of using whatever the current version of radeonsi does.
>        This way we can avoid dedicated buffers and we can make sure we keep
>        compatibility across mesa versions. I'd like to put some tests on
>        this on ac_surface.c so we can learn early in the process if things
>        need to be changed. Furthermore, the lack of configurable strides on
>        GFX10 means things already go wrong if we do not agree, making a
>        custom stride somewhat less useful.
>

The custom stride will be back for 2D images (not for 3D/Array), so
Navi10-14 will be the only hw not supporting the custom stride for 2D. It
might not be worth adding the width and height into the modifier just
because of Navi10-14, though I don't feel strongly about it.

This patch doesn't add the sizes into the description anyway.

The rest looks good.

Marek


>
>   - No usage of BO metadata at all for modifier usecases.
>        To avoid the requirement of dedicated dma bufs per image. For
>        non-modifier based interop we still use the BO metadata, since we
>        need to keep compatibility with old mesa and this is used for
>        depth/msaa/3d/CL etc. API interop.
>
>   - A single FD for all planes.
>        Easier in Vulkan / bindless and radeonsi is already transitioning.
>
>   - Make a single modifier for DCN1
>       It defines things uniquely given bpp, which we can assume, so adding
>       more modifier values do not add clarity.
>
>   - Not exposing the 4K and 256B tiling modes.
>       These are largely only better for something like a cursor or very
> long
>       and/or tall images. Are they worth the added complexity to save
> memory?
>       For context, at 32bpp, tiles are 128x128 pixels.
>
>   - For multiplane images, every plane uses the same tiling.
>       On GFX9/GFX10 we can, so no need to make it complicated.
>
>   - We use family_id + external_rev to distinguish between incompatible
> GPUs.
>       PCI ID is not enough, as RAVEN and RAVEN2 have the same PCI device
> id,
>       but different tiling. We might be able to find bigger equivalence
>       groups for _X, but especially for DCC I would be uncomfortable
> making it
>       shared between GPUs.
>
>   - For DCN1 DCC, radeonsi currently uses another texelbuffer with indices
>     to reorder. This is not shared.
>       Specific to current implementation and does not need to be shared. To
>       pave the way to shader-based solution, lets keep this internal to
> each
>       driver. This should reduce the modifier churn if any of the driver
>       implementations change. (Especially as you'd want to support the old
>       implementation for a while to stay compatible with old kernels not
>       supporting a new modifier yet).
>
>   - No support for rotated swizzling.
>       Can be added easily later and nothing in the stack would generate it
>       currently.
>
>   - Add extra enum values in the definitions.
>       This way we can easily switch on modifier without having to pass
> around
>       the current GPU everywhere, assuming the modifier has been validated.
> ---
>
>  Since my previous attempt for modifiers got bogged down on details for
>  the GFX6-GFX8 modifiers in previous discussions, this only attempts to
>  define modifiers for GFX9+, which is significantly simpler.
>
>  For a final version I'd like to wait until I have written most of the
>  userspace + kernelspace so we can actually test it. However, I'd
>  appreciate any early feedback people are willing to give.
>
>  Initial Mesa amd/common support + tests are available at
>  https://gitlab.freedesktop.org/bnieuwenhuizen/mesa/tree/modifiers
>
>  I tested the HW to actually behave as described in the descriptions
>  on Raven and plan to test on a subset of the others.
>
>  include/uapi/drm/drm_fourcc.h | 118 ++++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 3feeaa3f987a..9bd286ab2bee 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -756,6 +756,124 @@ extern "C" {
>   */
>  #define DRM_FORMAT_MOD_ALLWINNER_TILED fourcc_mod_code(ALLWINNER, 1)
>
> +/*
> + * AMD GFX9+ format modifiers
> + */
> +
> +/*
> + * enum-like values for easy switches.
> + *
> + * No fixed field-size but implementations are supposed to enforce
> all-zeros of
> + * unused bits during validation.
> + */
> +#define DRM_FORMAT_MOD_AMD_GFX9_64K_STANDARD_id       0
> +#define DRM_FORMAT_MOD_AMD_GFX9_64K_DISPLAY_id        1
> +#define DRM_FORMAT_MOD_AMD_GFX9_64K_X_STANDARD_id     2
> +#define DRM_FORMAT_MOD_AMD_GFX9_64K_X_DISPLAY_id      3
> +#define DRM_FORMAT_MOD_AMD_GFX10_64K_X_RENDER_id      4
> +#define DRM_FORMAT_MOD_AMD_GFX9_64K_X_STANDARD_DCC_id 5
> +#define DRM_FORMAT_MOD_AMD_GFX10_64K_X_RENDER_DCC_id  6
> +#define DRM_FORMAT_MOD_AMD_GFX9_64K_X_DCN1_DCC_id     7
> +
> +/*
> + * tiling modes that are compatible between all GPUs that support the
> tiling
> + * mode.
> + *
> + * STANDARD/DISPLAY/ROTATED + bitdepth determine the indexing within a
> 256 byte
> + * micro-block.
> + *
> + * The macro-block is 64 KiB and the micro-block in macro-block
> addressing is
> + * y0-x0-y1-x1-... up till the dimensions of the macro-block.
> + *
> + * The image is then a plain row-major image of macro-blocks.
> + */
> +#define DRM_FORMAT_MOD_AMD_GFX9_64K_STANDARD \
> +       fourcc_mod_code(AMD, DRM_FORMAT_MOD_AMD_GFX9_64K_STANDARD_id)
> +#define DRM_FORMAT_MOD_AMD_GFX9_64K_DISPLAY  \
> +       fourcc_mod_code(AMD, DRM_FORMAT_MOD_AMD_GFX9_64K_DISPLAY_id)
> +
> +/*
> + * Same as above, but applies a transformation on the micro-block in
> macro-block
> + * indexing that depends on the GPU pipes, shader engines and banks.
> + *
> + * RENDER is a new micro-block tiling for GFX10+.
> + */
> +#define DRM_FORMAT_MOD_AMD_GFX9_64K_X_STANDARD(family_id, external_rev)  \
> +       fourcc_mod_code(AMD, DRM_FORMAT_MOD_AMD_GFX9_64K_X_STANDARD_id | \
> +                            ((uint64_t)family_id << 40) |               \
> +                            ((uint64_t)external_rev << 48))
> +#define DRM_FORMAT_MOD_AMD_GFX9_64K_X_DISPLAY(family_id, external_rev)   \
> +       fourcc_mod_code(AMD, DRM_FORMAT_MOD_AMD_GFX9_64K_X_DISPLAY_id |  \
> +                            ((uint64_t)family_id << 40) |               \
> +                            ((uint64_t)external_rev << 48))
> +#define DRM_FORMAT_MOD_AMD_GFX10_64K_X_RENDER(family_id, external_rev)   \
> +       fourcc_mod_code(AMD, DRM_FORMAT_MOD_AMD_GFX10_64K_X_RENDER_id |  \
> +                            ((uint64_t)family_id << 40) |               \
> +                            ((uint64_t)external_rev << 48))
> +
> +/*
> + * Same as above, but with DCC enabled.
> + *
> + * We add the PCI ID of the device to make sure the transformation above
> is
> + * applied the same way, as well as make sure the implementation of DCC
> supports
> + * the same patterns.
> + *
> + * The DCC is pipe-aligned (and on GFX9 rb-aligned).
> + *
> + * This includes 2 memory regions per plane:
> + *  - main image
> + *  - DCC metadata
> + *
> + * These are tightly packed according to platform specific DCC alignment
> + * requirements.
> + *
> + * pipe+rb aligned DCC alignment:
> + * - GFX9: MAX(65536,
> + *             MIN2(32, pipes * shader_engines) *
> + *               num_backends * interleave_bytes)
> + * - GFX10 (without rbplus): MAX2(pipes * interleave_bytes, 4096)
> + *
> + * aligned DCC size:
> + * - GFX9:
> + *    tiles of MAX2(256 * num_backends KiB, 1 MiB) of pixel data (prefer
> + *    width if odd log2) at ratio 1/256
> + * - GFX10 (without rbplus):
> + *    tiles of 256 * MAX2(pipes * interleave_bytes, 4096) of pixel data
> + *    (prefer width if odd log2) at ratio 1/256
> + */
> +#define DRM_FORMAT_MOD_AMD_GFX9_64K_X_STANDARD_DCC(family_id,
> external_rev)  \
> +       fourcc_mod_code(AMD, DRM_FORMAT_MOD_AMD_GFX9_64K_X_STANDARD_DCC_id
> | \
> +                            ((uint64_t)family_id << 40) |
>    \
> +                            ((uint64_t)external_rev << 48))
> +#define DRM_FORMAT_MOD_AMD_GFX10_64K_X_RENDER_DCC(family_id,
> external_rev)   \
> +       fourcc_mod_code(AMD, DRM_FORMAT_MOD_AMD_GFX10_64K_X_RENDER_DCC_id
> |  \
> +                            ((uint64_t)family_id << 40) |
>    \
> +                            ((uint64_t)external_rev << 48))
> +
> +/*
> + * DCC that is displayable with DCN1 hardware.
> + *
> + * for bpp <= 32 bits, the micro-tiling is STANDARD and for bpp == 64
> bits, the
> + * micro-tiling is DISPLAY.
> + *
> + * This includes 3 memory regions per plane:
> + *   - main image
> + *   - DCC (non aligned)
> + *   - DCC (pipe-aligned & rb-aligned)
> + *
> + * non-aligned DCC alignment:
> + * - GFX9: MAX(65536, interleave_bytes)
> + * - GFX10 (without rbplus): 4096
> + *
> + * non-aligned DCC size:
> + * - GFX9 & GFX10 (without rbplus):
> + *    tiles for 1 MiB of pixel data (prefer width if odd log2) at ratio
> 1/256
> + */
> +#define DRM_FORMAT_MOD_AMD_GFX9_64K_X_DCN1_DCC(family_id, external_rev)  \
> +       fourcc_mod_code(AMD, DRM_FORMAT_MOD_AMD_GFX9_64K_X_DCN1_DCC_id | \
> +                            ((uint64_t)family_id << 40) |               \
> +                            ((uint64_t)external_rev << 48))
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.23.0
>
>

--000000000000d1b0c5059520865c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Oct 16, 2019 at 9:48 AM Bas Nieuwenhuizen &lt;<a href=3D"mai=
lto:bas@basnieuwenhuizen.nl">bas@basnieuwenhuizen.nl</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">This adds initial forma=
t modifiers for AMD GFX9 and newer GPUs.<br>
<br>
This is particularly useful to determine if we can use DCC, and whether<br>
we need an extra display compatible DCC metadata plane.<br>
<br>
Design decisions:<br>
=C2=A0 - Always expose a single plane<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0This way everything works correctly with images =
with multiple planes.<br>
<br>
=C2=A0 - Do not add an extra memory region in DCC for putting a bit on whet=
her<br>
=C2=A0 =C2=A0 we are in compressed state.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0A decompress on import is cheap enough if alread=
y decompressed, and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0I do think in most cases we can avoid it in adva=
nce during modifier<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0negotiation. The remainder is probably not commo=
n enough to worry<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0about.<br>
<br>
=C2=A0 - Explicitly define the sizes as part of the modifier description in=
stead<br>
=C2=A0 =C2=A0 of using whatever the current version of radeonsi does.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0This way we can avoid dedicated buffers and we c=
an make sure we keep<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0compatibility across mesa versions. I&#39;d like=
 to put some tests on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0this on ac_surface.c so we can learn early in th=
e process if things<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0need to be changed. Furthermore, the lack of con=
figurable strides on<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0GFX10 means things already go wrong if we do not=
 agree, making a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0custom stride somewhat less useful.<br></blockqu=
ote><div><br></div><div>The custom stride will be back for 2D images (not f=
or 3D/Array), so Navi10-14 will be the only hw not supporting the custom st=
ride for 2D. It might not be worth adding the width and height into the mod=
ifier just because of Navi10-14, though I don&#39;t feel strongly about it.=
</div><div><br></div><div>This patch doesn&#39;t add the sizes into the des=
cription anyway.</div><div><br></div><div>The rest looks good.</div><div><b=
r></div><div>Marek<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
=C2=A0 - No usage of BO metadata at all for modifier usecases.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0To avoid the requirement of dedicated dma bufs p=
er image. For<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0non-modifier based interop we still use the BO m=
etadata, since we<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0need to keep compatibility with old mesa and thi=
s is used for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0depth/msaa/3d/CL etc. API interop.<br>
<br>
=C2=A0 - A single FD for all planes.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Easier in Vulkan / bindless and radeonsi is alre=
ady transitioning.<br>
<br>
=C2=A0 - Make a single modifier for DCN1<br>
=C2=A0 =C2=A0 =C2=A0 It defines things uniquely given bpp, which we can ass=
ume, so adding<br>
=C2=A0 =C2=A0 =C2=A0 more modifier values do not add clarity.<br>
<br>
=C2=A0 - Not exposing the 4K and 256B tiling modes.<br>
=C2=A0 =C2=A0 =C2=A0 These are largely only better for something like a cur=
sor or very long<br>
=C2=A0 =C2=A0 =C2=A0 and/or tall images. Are they worth the added complexit=
y to save memory?<br>
=C2=A0 =C2=A0 =C2=A0 For context, at 32bpp, tiles are 128x128 pixels.<br>
<br>
=C2=A0 - For multiplane images, every plane uses the same tiling.<br>
=C2=A0 =C2=A0 =C2=A0 On GFX9/GFX10 we can, so no need to make it complicate=
d.<br>
<br>
=C2=A0 - We use family_id + external_rev to distinguish between incompatibl=
e GPUs.<br>
=C2=A0 =C2=A0 =C2=A0 PCI ID is not enough, as RAVEN and RAVEN2 have the sam=
e PCI device id,<br>
=C2=A0 =C2=A0 =C2=A0 but different tiling. We might be able to find bigger =
equivalence<br>
=C2=A0 =C2=A0 =C2=A0 groups for _X, but especially for DCC I would be uncom=
fortable making it<br>
=C2=A0 =C2=A0 =C2=A0 shared between GPUs.<br>
<br>
=C2=A0 - For DCN1 DCC, radeonsi currently uses another texelbuffer with ind=
ices<br>
=C2=A0 =C2=A0 to reorder. This is not shared.<br>
=C2=A0 =C2=A0 =C2=A0 Specific to current implementation and does not need t=
o be shared. To<br>
=C2=A0 =C2=A0 =C2=A0 pave the way to shader-based solution, lets keep this =
internal to each<br>
=C2=A0 =C2=A0 =C2=A0 driver. This should reduce the modifier churn if any o=
f the driver<br>
=C2=A0 =C2=A0 =C2=A0 implementations change. (Especially as you&#39;d want =
to support the old<br>
=C2=A0 =C2=A0 =C2=A0 implementation for a while to stay compatible with old=
 kernels not<br>
=C2=A0 =C2=A0 =C2=A0 supporting a new modifier yet).<br>
<br>
=C2=A0 - No support for rotated swizzling.<br>
=C2=A0 =C2=A0 =C2=A0 Can be added easily later and nothing in the stack wou=
ld generate it<br>
=C2=A0 =C2=A0 =C2=A0 currently.<br>
<br>
=C2=A0 - Add extra enum values in the definitions.<br>
=C2=A0 =C2=A0 =C2=A0 This way we can easily switch on modifier without havi=
ng to pass around<br>
=C2=A0 =C2=A0 =C2=A0 the current GPU everywhere, assuming the modifier has =
been validated.<br>
---<br>
<br>
=C2=A0Since my previous attempt for modifiers got bogged down on details fo=
r<br>
=C2=A0the GFX6-GFX8 modifiers in previous discussions, this only attempts t=
o<br>
=C2=A0define modifiers for GFX9+, which is significantly simpler.<br>
<br>
=C2=A0For a final version I&#39;d like to wait until I have written most of=
 the<br>
=C2=A0userspace + kernelspace so we can actually test it. However, I&#39;d<=
br>
=C2=A0appreciate any early feedback people are willing to give.<br>
<br>
=C2=A0Initial Mesa amd/common support + tests are available at<br>
=C2=A0<a href=3D"https://gitlab.freedesktop.org/bnieuwenhuizen/mesa/tree/mo=
difiers" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.or=
g/bnieuwenhuizen/mesa/tree/modifiers</a><br>
<br>
=C2=A0I tested the HW to actually behave as described in the descriptions<b=
r>
=C2=A0on Raven and plan to test on a subset of the others.<br>
<br>
=C2=A0include/uapi/drm/drm_fourcc.h | 118 +++++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 118 insertions(+)<br>
<br>
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h<=
br>
index 3feeaa3f987a..9bd286ab2bee 100644<br>
--- a/include/uapi/drm/drm_fourcc.h<br>
+++ b/include/uapi/drm/drm_fourcc.h<br>
@@ -756,6 +756,124 @@ extern &quot;C&quot; {<br>
=C2=A0 */<br>
=C2=A0#define DRM_FORMAT_MOD_ALLWINNER_TILED fourcc_mod_code(ALLWINNER, 1)<=
br>
<br>
+/*<br>
+ * AMD GFX9+ format modifiers<br>
+ */<br>
+<br>
+/*<br>
+ * enum-like values for easy switches.<br>
+ *<br>
+ * No fixed field-size but implementations are supposed to enforce all-zer=
os of<br>
+ * unused bits during validation.<br>
+ */<br>
+#define DRM_FORMAT_MOD_AMD_GFX9_64K_STANDARD_id=C2=A0 =C2=A0 =C2=A0 =C2=A0=
0<br>
+#define DRM_FORMAT_MOD_AMD_GFX9_64K_DISPLAY_id=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
1<br>
+#define DRM_FORMAT_MOD_AMD_GFX9_64K_X_STANDARD_id=C2=A0 =C2=A0 =C2=A02<br>
+#define DRM_FORMAT_MOD_AMD_GFX9_64K_X_DISPLAY_id=C2=A0 =C2=A0 =C2=A0 3<br>
+#define DRM_FORMAT_MOD_AMD_GFX10_64K_X_RENDER_id=C2=A0 =C2=A0 =C2=A0 4<br>
+#define DRM_FORMAT_MOD_AMD_GFX9_64K_X_STANDARD_DCC_id 5<br>
+#define DRM_FORMAT_MOD_AMD_GFX10_64K_X_RENDER_DCC_id=C2=A0 6<br>
+#define DRM_FORMAT_MOD_AMD_GFX9_64K_X_DCN1_DCC_id=C2=A0 =C2=A0 =C2=A07<br>
+<br>
+/*<br>
+ * tiling modes that are compatible between all GPUs that support the tili=
ng<br>
+ * mode.<br>
+ *<br>
+ * STANDARD/DISPLAY/ROTATED + bitdepth determine the indexing within a 256=
 byte<br>
+ * micro-block.<br>
+ *<br>
+ * The macro-block is 64 KiB and the micro-block in macro-block addressing=
 is<br>
+ * y0-x0-y1-x1-... up till the dimensions of the macro-block.<br>
+ *<br>
+ * The image is then a plain row-major image of macro-blocks.<br>
+ */<br>
+#define DRM_FORMAT_MOD_AMD_GFX9_64K_STANDARD \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fourcc_mod_code(AMD, DRM_FORMAT_MOD_AMD_GFX9_64=
K_STANDARD_id)<br>
+#define DRM_FORMAT_MOD_AMD_GFX9_64K_DISPLAY=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fourcc_mod_code(AMD, DRM_FORMAT_MOD_AMD_GFX9_64=
K_DISPLAY_id)<br>
+<br>
+/*<br>
+ * Same as above, but applies a transformation on the micro-block in macro=
-block<br>
+ * indexing that depends on the GPU pipes, shader engines and banks.<br>
+ *<br>
+ * RENDER is a new micro-block tiling for GFX10+.<br>
+ */<br>
+#define DRM_FORMAT_MOD_AMD_GFX9_64K_X_STANDARD(family_id, external_rev)=C2=
=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fourcc_mod_code(AMD, DRM_FORMAT_MOD_AMD_GFX9_64=
K_X_STANDARD_id | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)family_id &lt;&lt; 40) |=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)external_rev &lt;&lt; 48))<br>
+#define DRM_FORMAT_MOD_AMD_GFX9_64K_X_DISPLAY(family_id, external_rev)=C2=
=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fourcc_mod_code(AMD, DRM_FORMAT_MOD_AMD_GFX9_64=
K_X_DISPLAY_id |=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)family_id &lt;&lt; 40) |=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)external_rev &lt;&lt; 48))<br>
+#define DRM_FORMAT_MOD_AMD_GFX10_64K_X_RENDER(family_id, external_rev)=C2=
=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fourcc_mod_code(AMD, DRM_FORMAT_MOD_AMD_GFX10_6=
4K_X_RENDER_id |=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)family_id &lt;&lt; 40) |=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)external_rev &lt;&lt; 48))<br>
+<br>
+/*<br>
+ * Same as above, but with DCC enabled.<br>
+ *<br>
+ * We add the PCI ID of the device to make sure the transformation above i=
s<br>
+ * applied the same way, as well as make sure the implementation of DCC su=
pports<br>
+ * the same patterns.<br>
+ *<br>
+ * The DCC is pipe-aligned (and on GFX9 rb-aligned).<br>
+ *<br>
+ * This includes 2 memory regions per plane:<br>
+ *=C2=A0 - main image<br>
+ *=C2=A0 - DCC metadata<br>
+ *<br>
+ * These are tightly packed according to platform specific DCC alignment<b=
r>
+ * requirements.<br>
+ *<br>
+ * pipe+rb aligned DCC alignment:<br>
+ * - GFX9: MAX(65536,<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIN2(32, pipes * shader_=
engines) *<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0num_backends * in=
terleave_bytes)<br>
+ * - GFX10 (without rbplus): MAX2(pipes * interleave_bytes, 4096)<br>
+ *<br>
+ * aligned DCC size:<br>
+ * - GFX9:<br>
+ *=C2=A0 =C2=A0 tiles of MAX2(256 * num_backends KiB, 1 MiB) of pixel data=
 (prefer<br>
+ *=C2=A0 =C2=A0 width if odd log2) at ratio 1/256<br>
+ * - GFX10 (without rbplus):<br>
+ *=C2=A0 =C2=A0 tiles of 256 * MAX2(pipes * interleave_bytes, 4096) of pix=
el data<br>
+ *=C2=A0 =C2=A0 (prefer width if odd log2) at ratio 1/256<br>
+ */<br>
+#define DRM_FORMAT_MOD_AMD_GFX9_64K_X_STANDARD_DCC(family_id, external_rev=
)=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fourcc_mod_code(AMD, DRM_FORMAT_MOD_AMD_GFX9_64=
K_X_STANDARD_DCC_id | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)family_id &lt;&lt; 40) |=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)external_rev &lt;&lt; 48))<br>
+#define DRM_FORMAT_MOD_AMD_GFX10_64K_X_RENDER_DCC(family_id, external_rev)=
=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fourcc_mod_code(AMD, DRM_FORMAT_MOD_AMD_GFX10_6=
4K_X_RENDER_DCC_id |=C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)family_id &lt;&lt; 40) |=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)external_rev &lt;&lt; 48))<br>
+<br>
+/*<br>
+ * DCC that is displayable with DCN1 hardware.<br>
+ *<br>
+ * for bpp &lt;=3D 32 bits, the micro-tiling is STANDARD and for bpp =3D=
=3D 64 bits, the<br>
+ * micro-tiling is DISPLAY.<br>
+ *<br>
+ * This includes 3 memory regions per plane:<br>
+ *=C2=A0 =C2=A0- main image<br>
+ *=C2=A0 =C2=A0- DCC (non aligned)<br>
+ *=C2=A0 =C2=A0- DCC (pipe-aligned &amp; rb-aligned)<br>
+ *<br>
+ * non-aligned DCC alignment:<br>
+ * - GFX9: MAX(65536, interleave_bytes)<br>
+ * - GFX10 (without rbplus): 4096<br>
+ *<br>
+ * non-aligned DCC size:<br>
+ * - GFX9 &amp; GFX10 (without rbplus):<br>
+ *=C2=A0 =C2=A0 tiles for 1 MiB of pixel data (prefer width if odd log2) a=
t ratio 1/256<br>
+ */<br>
+#define DRM_FORMAT_MOD_AMD_GFX9_64K_X_DCN1_DCC(family_id, external_rev)=C2=
=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fourcc_mod_code(AMD, DRM_FORMAT_MOD_AMD_GFX9_64=
K_X_DCN1_DCC_id | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)family_id &lt;&lt; 40) |=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ((uint64_t)external_rev &lt;&lt; 48))<br>
+<br>
=C2=A0#if defined(__cplusplus)<br>
=C2=A0}<br>
=C2=A0#endif<br>
-- <br>
2.23.0<br>
<br>
</blockquote></div></div>

--000000000000d1b0c5059520865c--

--===============1241413900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1241413900==--
