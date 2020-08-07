Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CB823F32B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 21:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19AD6E191;
	Fri,  7 Aug 2020 19:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B636E046;
 Fri,  7 Aug 2020 19:43:13 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id h12so1446501pgm.7;
 Fri, 07 Aug 2020 12:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=55k23fKOykTI4nZJ93p7HPLEwJdtg7bTPHLCDXLIjsw=;
 b=fW7kZNH00plJUhiuXdgE+C7O1PvfrLP47DmYB15NUEVPHq8MQGx5d40ql5+k1H5JMr
 crl2ZqYk5qkjTZWxcqB7If+QY95jgPXlxhqFj0tBpJDwCwXVbdMiZOdkCl57YjbSVHyR
 ViOHUEhYEHEBMA8rNLMaFm3G2naRSdwgQ582CzS3QoQ226Zs1IlpIOex/mvuAcD0Pb81
 eKL1ZWLKdoFp/9RIRZiSOpFJy445HfCxLqpqLJwSpKXVpcIS0yM4x/QRC/PrFo6Qj9Xw
 Bsd6enLLaduR/AOsvFAIUVx6LSyeV28hNXYFtOkceva2iyl5knbcBHUFmEX7TeeVF97b
 y97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=55k23fKOykTI4nZJ93p7HPLEwJdtg7bTPHLCDXLIjsw=;
 b=KreKNNkggRK2vq9XQWCy5mMdwH2bsuxNEY1bKCP+brr08QRj/uXO6y37osk8m8ScD4
 OR96ZxVoL+P+fG7Iv7O/j3TesbxJN2uEX1+KE+QUU7k70DDeMIqFCfeBgsiV4TobG99X
 FkZWsZMuDuN80uMUfHgr+tYoP6d4L8IPUSCzdK3ydwif+Zh736DSiv16ZMIyoRFMIXwL
 +tOLqOfNxLfwqmwpLCuJ91wQvAIQ6cp5bZrJg5/6T8NjLQB1I2ygxronN7eGfJVoSr8/
 nbX+AdieMtPdpklzIhqRdNUgOq7qkPPQH5d8SVEk35+iQTeyxuyeclXGm8d5lAgjDfgN
 CwvQ==
X-Gm-Message-State: AOAM53195Z1gDvtsrUdPzu6vOQ5jA8fq1lHX04hJKHpVcmopVZ0pzBbA
 KnI5WLIel9v2eH1b50UxKMU85fTciYwXv29yrPI=
X-Google-Smtp-Source: ABdhPJyBtAmXKqEhHD//uyFeJtOoRIB6dE58wiP07PRpMhgM/VaLNNGiKxZulshIp+59rxxEluIGVfCrP+MJfeLo0k4=
X-Received: by 2002:a65:5a45:: with SMTP id z5mr9578300pgs.233.1596829393094; 
 Fri, 07 Aug 2020 12:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200804213119.25091-1-bas@basnieuwenhuizen.nl>
 <20200804213119.25091-9-bas@basnieuwenhuizen.nl>
In-Reply-To: <20200804213119.25091-9-bas@basnieuwenhuizen.nl>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 7 Aug 2020 15:42:37 -0400
Message-ID: <CAAxE2A7SmOvYQggfcN0A=DUMMNSeYqiKo6iLJs2ai76RupQYKQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/amd/display: Expose modifiers.
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1848762257=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1848762257==
Content-Type: multipart/alternative; boundary="000000000000be0c7905ac4ed0b5"

--000000000000be0c7905ac4ed0b5
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 4, 2020 at 5:32 PM Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
wrote:

> This expose modifier support on GFX9+.
>
> Only modifiers that can be rendered on the current GPU are
> added. This is to reduce the number of modifiers exposed.
>
> The HW could expose more, but the best mechanism to decide
> what to expose without an explosion in modifiers is still
> to be decided, and in the meantime this should not regress
> things from pre-modifiers and does not risk regressions as
> we make up our mind in the future.
>
> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 343 +++++++++++++++++-
>  1 file changed, 342 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index c38257081868..6594cbe625f9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3891,6 +3891,340 @@ fill_gfx9_tiling_info_from_modifier(const struct
> amdgpu_device *adev,
>         }
>  }
>
> +enum dm_micro_swizzle {
> +       MICRO_SWIZZLE_Z = 0,
> +       MICRO_SWIZZLE_S = 1,
> +       MICRO_SWIZZLE_D = 2,
> +       MICRO_SWIZZLE_R = 3
> +};
> +
> +static bool dm_plane_format_mod_supported(struct drm_plane *plane,
> +                                         uint32_t format,
> +                                         uint64_t modifier)
> +{
> +       struct amdgpu_device *adev = plane->dev->dev_private;
> +       const struct drm_format_info *info = drm_format_info(format);
> +
> +       enum dm_micro_swizzle microtile =
> modifier_gfx9_swizzle_mode(modifier) & 3;
> +
> +       if (!info)
> +               return false;
> +
> +       /*
> +        * We always have to allow this modifier, because core DRM still
> +        * checks LINEAR support if userspace does not provide modifers.
> +        */
> +       if (modifier == DRM_FORMAT_MOD_LINEAR)
> +               return true;
> +
> +       /*
> +        * The arbitrary tiling support for multiplane formats has not
> been hooked
> +        * up.
> +        */
> +       if (info->num_planes > 1)
> +               return false;
> +
> +       /*
> +        * For D swizzle the canonical modifier depends on the bpp, so
> check
> +        * it here.
> +        */
> +       if (AMD_FMT_MOD_GET(TILE_VERSION, modifier) ==
> AMD_FMT_MOD_TILE_VER_GFX9 &&
> +           adev->family >= AMDGPU_FAMILY_NV) {
> +               if (microtile == MICRO_SWIZZLE_D && info->cpp[0] == 4)
> +                       return false;
> +       }
> +
> +       if (adev->family >= AMDGPU_FAMILY_RV && microtile ==
> MICRO_SWIZZLE_D &&
> +           info->cpp[0] < 8)
> +               return false;
> +
> +       if (modifier_has_dcc(modifier)) {
> +               /* Per radeonsi comments 16/64 bpp are more complicated. */
> +               if (info->cpp[0] != 4)
> +                       return false;
> +       }
> +
> +       return true;
> +}
> +
> +static void
> +add_modifier(uint64_t **mods, uint64_t *size, uint64_t *cap, uint64_t mod)
> +{
> +       if (!*mods)
> +               return;
> +
> +       if (*cap - *size < 1) {
> +               uint64_t new_cap = *cap * 2;
> +               uint64_t *new_mods = kmalloc(new_cap * sizeof(uint64_t),
> GFP_KERNEL);
> +
> +               if (!new_mods) {
> +                       kfree(*mods);
> +                       *mods = NULL;
> +                       return;
> +               }
> +
> +               memcpy(new_mods, *mods, sizeof(uint64_t) * *size);
> +               kfree(*mods);
> +               *mods = new_mods;
> +               *cap = new_cap;
> +       }
> +
> +       (*mods)[*size] = mod;
> +       *size += 1;
> +}
> +
> +static void
> +add_gfx9_modifiers(const struct amdgpu_device *adev,
> +                 uint64_t **mods, uint64_t *size, uint64_t *capacity)
> +{
> +       int pipes =
> ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
> +       int pipe_xor_bits = min(8, pipes +
> +
>  ilog2(adev->gfx.config.gb_addr_config_fields.num_se));
> +       int bank_xor_bits = min(8 - pipe_xor_bits,
> +
>  ilog2(adev->gfx.config.gb_addr_config_fields.num_banks));
> +       int rb = ilog2(adev->gfx.config.gb_addr_config_fields.num_se) +
> +
> ilog2(adev->gfx.config.gb_addr_config_fields.num_rb_per_se);
> +
> +
> +       if (adev->family == AMDGPU_FAMILY_RV) {
> +               /*
> +                * No _D DCC swizzles yet because we only allow 32bpp,
> which
> +                * doesn't support _D on DCN
> +                */
> +
> +               /*
> +                * Always enable constant encoding, because the only unit
> that
> +                * didn't support it was CB. But on texture/display we can
> +                * always interpret it.
> +                */
> +               add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                           AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
> +                           AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9) |
> +                           AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> +                           AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
> +                           AMD_FMT_MOD_SET(DCC, 1) |
> +                           AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
> +                           AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,
> AMD_FMT_MOD_DCC_BLOCK_64B) |
> +                           AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1));
>

I don't think Raven1 can do DCC constant encoding in DCN and GL2.

+
> +               add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                           AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
> +                           AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9) |
> +                           AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> +                           AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
> +                           AMD_FMT_MOD_SET(DCC, 1) |
> +                           AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
> +                           AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,
> AMD_FMT_MOD_DCC_BLOCK_64B) |
> +                           AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 0));
> +
> +               add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                           AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
> +                           AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9) |
> +                           AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> +                           AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
> +                           AMD_FMT_MOD_SET(DCC, 1) |
> +                           AMD_FMT_MOD_SET(DCC_RETILE, 1) |
> +                           AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
> +                           AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,
> AMD_FMT_MOD_DCC_BLOCK_64B) |
> +                           AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
> +                           AMD_FMT_MOD_SET(RB, rb) |
> +                           AMD_FMT_MOD_SET(PIPE, pipes));
> +
> +               add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                           AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
> +                           AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9) |
> +                           AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> +                           AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits) |
> +                           AMD_FMT_MOD_SET(DCC, 1) |
> +                           AMD_FMT_MOD_SET(DCC_RETILE, 1) |
> +                           AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
> +                           AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,
> AMD_FMT_MOD_DCC_BLOCK_64B) |
> +                           AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 0) |
> +                           AMD_FMT_MOD_SET(RB, rb) |
> +                           AMD_FMT_MOD_SET(PIPE, pipes));
> +       }
> +
> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D_X) |
> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9) |
> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> +                   AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits));
>

Addrlib says that D swizzle modes are unsupported for 32bpp in DCN1. They
are only supported in DCE12. The swizzle modes between the two have no
intersection.


> +
> +       if (adev->family == AMDGPU_FAMILY_RV) {
> +               add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                           AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
> +                           AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9) |
> +                           AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> +                           AMD_FMT_MOD_SET(BANK_XOR_BITS, bank_xor_bits));
> +       }
> +
> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9));
> +
> +       if (adev->family == AMDGPU_FAMILY_RV) {
> +               add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                           AMD_FMT_MOD_SET(TILE,
> AMD_FMT_MOD_TILE_GFX9_64K_S) |
> +                           AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9));
> +       }
> +}
> +
> +static void
> +add_gfx10_1_modifiers(const struct amdgpu_device *adev,
> +                    uint64_t **mods, uint64_t *size, uint64_t *capacity)
> +{
> +       int pipe_xor_bits =
> ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
> +
> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10) |
> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> +                   AMD_FMT_MOD_SET(DCC, 1) |
> +                   AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
> +                   AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
> +                   AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,
> AMD_FMT_MOD_DCC_BLOCK_64B));
> +
> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10) |
> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> +                   AMD_FMT_MOD_SET(DCC, 1) |
> +                   AMD_FMT_MOD_SET(DCC_RETILE, 1) |
> +                   AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
> +                   AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
> +                   AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,
> AMD_FMT_MOD_DCC_BLOCK_64B));
> +
> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10) |
> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));
> +
> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D_X) |
> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10) |
> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));
>

D swizzle modes are unsupported according to Addrlib.


> +
> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S_X) |
> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10) |
> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits));
> +
> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10));
> +
> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D) |
> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9));
> +
> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX9));
> +}
> +
> +static void
> +add_gfx10_3_modifiers(const struct amdgpu_device *adev,
> +                    uint64_t **mods, uint64_t *size, uint64_t *capacity)
> +{
> +       int pipe_xor_bits =
> ilog2(adev->gfx.config.gb_addr_config_fields.num_pipes);
> +       int pkrs = ilog2(adev->gfx.config.gb_addr_config_fields.num_pkrs);
> +
> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> +                   AMD_FMT_MOD_SET(PACKERS, pkrs) |
> +                   AMD_FMT_MOD_SET(DCC, 1) |
> +                   AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
> +                   AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
> +                   AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
> +                   AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,
> AMD_FMT_MOD_DCC_BLOCK_128B));
> +
> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> +                   AMD_FMT_MOD_SET(PACKERS, pkrs) |
> +                   AMD_FMT_MOD_SET(DCC, 1) |
> +                   AMD_FMT_MOD_SET(DCC_RETILE, 1) |
> +                   AMD_FMT_MOD_SET(DCC_CONSTANT_ENCODE, 1) |
> +                   AMD_FMT_MOD_SET(DCC_INDEPENDENT_64B, 1) |
> +                   AMD_FMT_MOD_SET(DCC_INDEPENDENT_128B, 1) |
> +                   AMD_FMT_MOD_SET(DCC_MAX_COMPRESSED_BLOCK,
> AMD_FMT_MOD_DCC_BLOCK_128B));
> +
> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_R_X) |
> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> +                   AMD_FMT_MOD_SET(PACKERS, pkrs));
> +
> +       add_modifier(mods, size, capacity, AMD_FMT_MOD |
> +                   AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_D_X) |
> +                   AMD_FMT_MOD_SET(TILE_VERSION,
> AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS) |
> +                   AMD_FMT_MOD_SET(PIPE_XOR_BITS, pipe_xor_bits) |
> +                   AMD_FMT_MOD_SET(PACKERS, pkrs));
>

D swizzle modes are unsupported.

Marek

--000000000000be0c7905ac4ed0b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNs
YXNzPSJnbWFpbF9hdHRyIj5PbiBUdWUsIEF1ZyA0LCAyMDIwIGF0IDU6MzIgUE0gQmFzIE5pZXV3
ZW5odWl6ZW4gJmx0OzxhIGhyZWY9Im1haWx0bzpiYXNAYmFzbmlldXdlbmh1aXplbi5ubCI+YmFz
QGJhc25pZXV3ZW5odWl6ZW4ubmw8L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUg
Y2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRl
ci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPlRoaXMg
ZXhwb3NlIG1vZGlmaWVyIHN1cHBvcnQgb24gR0ZYOSsuPGJyPg0KPGJyPg0KT25seSBtb2RpZmll
cnMgdGhhdCBjYW4gYmUgcmVuZGVyZWQgb24gdGhlIGN1cnJlbnQgR1BVIGFyZTxicj4NCmFkZGVk
LiBUaGlzIGlzIHRvIHJlZHVjZSB0aGUgbnVtYmVyIG9mIG1vZGlmaWVycyBleHBvc2VkLjxicj4N
Cjxicj4NClRoZSBIVyBjb3VsZCBleHBvc2UgbW9yZSwgYnV0IHRoZSBiZXN0IG1lY2hhbmlzbSB0
byBkZWNpZGU8YnI+DQp3aGF0IHRvIGV4cG9zZSB3aXRob3V0IGFuIGV4cGxvc2lvbiBpbiBtb2Rp
ZmllcnMgaXMgc3RpbGw8YnI+DQp0byBiZSBkZWNpZGVkLCBhbmQgaW4gdGhlIG1lYW50aW1lIHRo
aXMgc2hvdWxkIG5vdCByZWdyZXNzPGJyPg0KdGhpbmdzIGZyb20gcHJlLW1vZGlmaWVycyBhbmQg
ZG9lcyBub3QgcmlzayByZWdyZXNzaW9ucyBhczxicj4NCndlIG1ha2UgdXAgb3VyIG1pbmQgaW4g
dGhlIGZ1dHVyZS48YnI+DQo8YnI+DQpTaWduZWQtb2ZmLWJ5OiBCYXMgTmlldXdlbmh1aXplbiAm
bHQ7PGEgaHJlZj0ibWFpbHRvOmJhc0BiYXNuaWV1d2VuaHVpemVuLm5sIiB0YXJnZXQ9Il9ibGFu
ayI+YmFzQGJhc25pZXV3ZW5odWl6ZW4ubmw8L2E+Jmd0Ozxicj4NCi0tLTxicj4NCsKgLi4uL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMzQzICsrKysrKysrKysr
KysrKysrLTxicj4NCsKgMSBmaWxlIGNoYW5nZWQsIDM0MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pPGJyPg0KPGJyPg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5jPGJyPg0KaW5kZXggYzM4MjU3MDgxODY4Li42NTk0Y2JlNjI1Zjkg
MTAwNjQ0PGJyPg0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG0uYzxicj4NCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmM8YnI+DQpAQCAtMzg5MSw2ICszODkxLDM0MCBAQCBmaWxsX2dmeDlfdGls
aW5nX2luZm9fZnJvbV9tb2RpZmllcihjb25zdCBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiw8
YnI+DQrCoCDCoCDCoCDCoCB9PGJyPg0KwqB9PGJyPg0KPGJyPg0KK2VudW0gZG1fbWljcm9fc3dp
enpsZSB7PGJyPg0KK8KgIMKgIMKgIMKgTUlDUk9fU1dJWlpMRV9aID0gMCw8YnI+DQorwqAgwqAg
wqAgwqBNSUNST19TV0laWkxFX1MgPSAxLDxicj4NCivCoCDCoCDCoCDCoE1JQ1JPX1NXSVpaTEVf
RCA9IDIsPGJyPg0KK8KgIMKgIMKgIMKgTUlDUk9fU1dJWlpMRV9SID0gMzxicj4NCit9Ozxicj4N
Cis8YnI+DQorc3RhdGljIGJvb2wgZG1fcGxhbmVfZm9ybWF0X21vZF9zdXBwb3J0ZWQoc3RydWN0
IGRybV9wbGFuZSAqcGxhbmUsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWludDMyX3QgZm9ybWF0LDxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHVpbnQ2NF90IG1vZGlmaWVyKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSBwbGFuZS0mZ3Q7ZGV2LSZndDtkZXZfcHJpdmF0ZTs8YnI+DQorwqAg
wqAgwqAgwqBjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvID0gZHJtX2Zvcm1hdF9p
bmZvKGZvcm1hdCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGVudW0gZG1fbWljcm9fc3dpenps
ZSBtaWNyb3RpbGUgPSBtb2RpZmllcl9nZng5X3N3aXp6bGVfbW9kZShtb2RpZmllcikgJmFtcDsg
Mzs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgaWYgKCFpbmZvKTxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHJldHVybiBmYWxzZTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgLyo8YnI+DQor
wqAgwqAgwqAgwqAgKiBXZSBhbHdheXMgaGF2ZSB0byBhbGxvdyB0aGlzIG1vZGlmaWVyLCBiZWNh
dXNlIGNvcmUgRFJNIHN0aWxsPGJyPg0KK8KgIMKgIMKgIMKgICogY2hlY2tzIExJTkVBUiBzdXBw
b3J0IGlmIHVzZXJzcGFjZSBkb2VzIG5vdCBwcm92aWRlIG1vZGlmZXJzLjxicj4NCivCoCDCoCDC
oCDCoCAqLzxicj4NCivCoCDCoCDCoCDCoGlmIChtb2RpZmllciA9PSBEUk1fRk9STUFUX01PRF9M
SU5FQVIpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJuIHRydWU7PGJyPg0KKzxi
cj4NCivCoCDCoCDCoCDCoC8qPGJyPg0KK8KgIMKgIMKgIMKgICogVGhlIGFyYml0cmFyeSB0aWxp
bmcgc3VwcG9ydCBmb3IgbXVsdGlwbGFuZSBmb3JtYXRzIGhhcyBub3QgYmVlbiBob29rZWQ8YnI+
DQorwqAgwqAgwqAgwqAgKiB1cC48YnI+DQorwqAgwqAgwqAgwqAgKi88YnI+DQorwqAgwqAgwqAg
wqBpZiAoaW5mby0mZ3Q7bnVtX3BsYW5lcyAmZ3Q7IDEpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcmV0dXJuIGZhbHNlOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqAvKjxicj4NCivCoCDC
oCDCoCDCoCAqIEZvciBEIHN3aXp6bGUgdGhlIGNhbm9uaWNhbCBtb2RpZmllciBkZXBlbmRzIG9u
IHRoZSBicHAsIHNvIGNoZWNrPGJyPg0KK8KgIMKgIMKgIMKgICogaXQgaGVyZS48YnI+DQorwqAg
wqAgwqAgwqAgKi88YnI+DQorwqAgwqAgwqAgwqBpZiAoQU1EX0ZNVF9NT0RfR0VUKFRJTEVfVkVS
U0lPTiwgbW9kaWZpZXIpID09IEFNRF9GTVRfTU9EX1RJTEVfVkVSX0dGWDkgJmFtcDsmYW1wOzxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoGFkZXYtJmd0O2ZhbWlseSAmZ3Q7PSBBTURHUFVfRkFNSUxZ
X05WKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKG1pY3JvdGlsZSA9PSBNSUNS
T19TV0laWkxFX0QgJmFtcDsmYW1wOyBpbmZvLSZndDtjcHBbMF0gPT0gNCk8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gZmFsc2U7PGJyPg0KK8KgIMKgIMKg
IMKgfTxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoYWRldi0mZ3Q7ZmFtaWx5ICZndDs9IEFN
REdQVV9GQU1JTFlfUlYgJmFtcDsmYW1wOyBtaWNyb3RpbGUgPT0gTUlDUk9fU1dJWlpMRV9EICZh
bXA7JmFtcDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqBpbmZvLSZndDtjcHBbMF0gJmx0OyA4KTxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiBmYWxzZTs8YnI+DQorPGJyPg0KK8Kg
IMKgIMKgIMKgaWYgKG1vZGlmaWVyX2hhc19kY2MobW9kaWZpZXIpKSB7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgLyogUGVyIHJhZGVvbnNpIGNvbW1lbnRzIDE2LzY0IGJwcCBhcmUgbW9y
ZSBjb21wbGljYXRlZC4gKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoaW5mby0m
Z3Q7Y3BwWzBdICE9IDQpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cmV0dXJuIGZhbHNlOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
cmV0dXJuIHRydWU7PGJyPg0KK308YnI+DQorPGJyPg0KK3N0YXRpYyB2b2lkPGJyPg0KK2FkZF9t
b2RpZmllcih1aW50NjRfdCAqKm1vZHMsIHVpbnQ2NF90ICpzaXplLCB1aW50NjRfdCAqY2FwLCB1
aW50NjRfdCBtb2QpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBpZiAoISptb2RzKTxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybjs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgaWYg
KCpjYXAgLSAqc2l6ZSAmbHQ7IDEpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB1aW50
NjRfdCBuZXdfY2FwID0gKmNhcCAqIDI7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdWlu
dDY0X3QgKm5ld19tb2RzID0ga21hbGxvYyhuZXdfY2FwICogc2l6ZW9mKHVpbnQ2NF90KSwgR0ZQ
X0tFUk5FTCk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmICghbmV3X21v
ZHMpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBrZnJlZSgqbW9k
cyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKm1vZHMgPSBOVUxM
Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybjs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoG1lbWNweShuZXdfbW9kcywgKm1vZHMsIHNpemVvZih1aW50NjRfdCkgKiAqc2l6ZSk7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKga2ZyZWUoKm1vZHMpOzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCptb2RzID0gbmV3X21vZHM7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgKmNhcCA9IG5ld19jYXA7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+DQorwqAgwqAg
wqAgwqAoKm1vZHMpWypzaXplXSA9IG1vZDs8YnI+DQorwqAgwqAgwqAgwqAqc2l6ZSArPSAxOzxi
cj4NCit9PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZDxicj4NCithZGRfZ2Z4OV9tb2RpZmllcnMo
Y29uc3Qgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgdWludDY0X3QgKiptb2RzLCB1aW50NjRfdCAqc2l6ZSwgdWludDY0X3QgKmNhcGFj
aXR5KTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgaW50IHBpcGVzID0gaWxvZzIoYWRldi0mZ3Q7
Z2Z4LmNvbmZpZy5nYl9hZGRyX2NvbmZpZ19maWVsZHMubnVtX3BpcGVzKTs8YnI+DQorwqAgwqAg
wqAgwqBpbnQgcGlwZV94b3JfYml0cyA9IG1pbig4LCBwaXBlcyArPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWxvZzIoYWRldi0mZ3Q7Z2Z4LmNv
bmZpZy5nYl9hZGRyX2NvbmZpZ19maWVsZHMubnVtX3NlKSk7PGJyPg0KK8KgIMKgIMKgIMKgaW50
IGJhbmtfeG9yX2JpdHMgPSBtaW4oOCAtIHBpcGVfeG9yX2JpdHMsPGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWxvZzIoYWRldi0mZ3Q7Z2Z4LmNv
bmZpZy5nYl9hZGRyX2NvbmZpZ19maWVsZHMubnVtX2JhbmtzKSk7PGJyPg0KK8KgIMKgIMKgIMKg
aW50IHJiID0gaWxvZzIoYWRldi0mZ3Q7Z2Z4LmNvbmZpZy5nYl9hZGRyX2NvbmZpZ19maWVsZHMu
bnVtX3NlKSArPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlsb2cyKGFkZXYtJmd0O2dm
eC5jb25maWcuZ2JfYWRkcl9jb25maWdfZmllbGRzLm51bV9yYl9wZXJfc2UpOzxicj4NCis8YnI+
DQorPGJyPg0KK8KgIMKgIMKgIMKgaWYgKGFkZXYtJmd0O2ZhbWlseSA9PSBBTURHUFVfRkFNSUxZ
X1JWKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyo8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgKiBObyBfRCBEQ0Mgc3dpenpsZXMgeWV0IGJlY2F1c2Ugd2Ugb25seSBhbGxv
dyAzMmJwcCwgd2hpY2g8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBkb2VzbiYjMzk7
dCBzdXBwb3J0IF9EIG9uIERDTjxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAqLzxicj4N
Cis8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKjxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAqIEFsd2F5cyBlbmFibGUgY29uc3RhbnQgZW5jb2RpbmcsIGJlY2F1c2UgdGhlIG9u
bHkgdW5pdCB0aGF0PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICogZGlkbiYjMzk7dCBz
dXBwb3J0IGl0IHdhcyBDQi4gQnV0IG9uIHRleHR1cmUvZGlzcGxheSB3ZSBjYW48YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgKiBhbHdheXMgaW50ZXJwcmV0IGl0Ljxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAqLzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFkZF9tb2Rp
Zmllcihtb2RzLCBzaXplLCBjYXBhY2l0eSwgQU1EX0ZNVF9NT0QgfDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChUSUxFLCBBTURf
Rk1UX01PRF9USUxFX0dGWDlfNjRLX1NfWCkgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChUSUxFX1ZFUlNJT04sIEFNRF9GTVRf
TU9EX1RJTEVfVkVSX0dGWDkpIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoUElQRV9YT1JfQklUUywgcGlwZV94b3JfYml0cykg
fDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRf
TU9EX1NFVChCQU5LX1hPUl9CSVRTLCBiYW5rX3hvcl9iaXRzKSB8PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKERDQywgMSkgfDxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9E
X1NFVChEQ0NfSU5ERVBFTkRFTlRfNjRCLCAxKSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKERDQ19NQVhfQ09NUFJFU1NFRF9C
TE9DSywgQU1EX0ZNVF9NT0RfRENDX0JMT0NLXzY0QikgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChEQ0NfQ09OU1RBTlRfRU5D
T0RFLCAxKSk7PGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgZG9uJiMzOTt0
IHRoaW5rIFJhdmVuMSBjYW4gZG8gRENDIGNvbnN0YW50IGVuY29kaW5nIGluIERDTiBhbmQgR0wy
Ljxicj48L2Rpdj48ZGl2PiA8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3Rl
IiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCBy
Z2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPg0KKzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGFkZF9tb2RpZmllcihtb2RzLCBzaXplLCBjYXBhY2l0eSwgQU1EX0ZNVF9NT0Qg
fDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRf
TU9EX1NFVChUSUxFLCBBTURfRk1UX01PRF9USUxFX0dGWDlfNjRLX1NfWCkgfDxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChUSUxF
X1ZFUlNJT04sIEFNRF9GTVRfTU9EX1RJTEVfVkVSX0dGWDkpIHw8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoUElQRV9YT1JfQklU
UywgcGlwZV94b3JfYml0cykgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChCQU5LX1hPUl9CSVRTLCBiYW5rX3hvcl9iaXRzKSB8
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9N
T0RfU0VUKERDQywgMSkgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoEFNRF9GTVRfTU9EX1NFVChEQ0NfSU5ERVBFTkRFTlRfNjRCLCAxKSB8PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKERD
Q19NQVhfQ09NUFJFU1NFRF9CTE9DSywgQU1EX0ZNVF9NT0RfRENDX0JMT0NLXzY0QikgfDxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NF
VChEQ0NfQ09OU1RBTlRfRU5DT0RFLCAwKSk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGFkZF9tb2RpZmllcihtb2RzLCBzaXplLCBjYXBhY2l0eSwgQU1EX0ZNVF9NT0QgfDxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9E
X1NFVChUSUxFLCBBTURfRk1UX01PRF9USUxFX0dGWDlfNjRLX1NfWCkgfDxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChUSUxFX1ZF
UlNJT04sIEFNRF9GTVRfTU9EX1RJTEVfVkVSX0dGWDkpIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoUElQRV9YT1JfQklUUywg
cGlwZV94b3JfYml0cykgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoEFNRF9GTVRfTU9EX1NFVChCQU5LX1hPUl9CSVRTLCBiYW5rX3hvcl9iaXRzKSB8PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0Rf
U0VUKERDQywgMSkgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoEFNRF9GTVRfTU9EX1NFVChEQ0NfUkVUSUxFLCAxKSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKERDQ19JTkRFUEVOREVO
VF82NEIsIDEpIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBBTURfRk1UX01PRF9TRVQoRENDX01BWF9DT01QUkVTU0VEX0JMT0NLLCBBTURfRk1UX01PRF9E
Q0NfQkxPQ0tfNjRCKSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgQU1EX0ZNVF9NT0RfU0VUKERDQ19DT05TVEFOVF9FTkNPREUsIDEpIHw8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoUkIs
IHJiKSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1E
X0ZNVF9NT0RfU0VUKFBJUEUsIHBpcGVzKSk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGFkZF9tb2RpZmllcihtb2RzLCBzaXplLCBjYXBhY2l0eSwgQU1EX0ZNVF9NT0QgfDxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9E
X1NFVChUSUxFLCBBTURfRk1UX01PRF9USUxFX0dGWDlfNjRLX1NfWCkgfDxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChUSUxFX1ZF
UlNJT04sIEFNRF9GTVRfTU9EX1RJTEVfVkVSX0dGWDkpIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoUElQRV9YT1JfQklUUywg
cGlwZV94b3JfYml0cykgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoEFNRF9GTVRfTU9EX1NFVChCQU5LX1hPUl9CSVRTLCBiYW5rX3hvcl9iaXRzKSB8PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0Rf
U0VUKERDQywgMSkgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoEFNRF9GTVRfTU9EX1NFVChEQ0NfUkVUSUxFLCAxKSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKERDQ19JTkRFUEVOREVO
VF82NEIsIDEpIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBBTURfRk1UX01PRF9TRVQoRENDX01BWF9DT01QUkVTU0VEX0JMT0NLLCBBTURfRk1UX01PRF9E
Q0NfQkxPQ0tfNjRCKSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgQU1EX0ZNVF9NT0RfU0VUKERDQ19DT05TVEFOVF9FTkNPREUsIDApIHw8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoUkIs
IHJiKSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1E
X0ZNVF9NT0RfU0VUKFBJUEUsIHBpcGVzKSk7PGJyPg0KK8KgIMKgIMKgIMKgfTxicj4NCis8YnI+
DQorwqAgwqAgwqAgwqBhZGRfbW9kaWZpZXIobW9kcywgc2l6ZSwgY2FwYWNpdHksIEFNRF9GTVRf
TU9EIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQo
VElMRSwgQU1EX0ZNVF9NT0RfVElMRV9HRlg5XzY0S19EX1gpIHw8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoVElMRV9WRVJTSU9OLCBBTURfRk1UX01P
RF9USUxFX1ZFUl9HRlg5KSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1E
X0ZNVF9NT0RfU0VUKFBJUEVfWE9SX0JJVFMsIHBpcGVfeG9yX2JpdHMpIHw8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoQkFOS19YT1JfQklUUywgYmFu
a194b3JfYml0cykpOzxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5BZGRybGli
IHNheXMgdGhhdCBEIHN3aXp6bGUgbW9kZXMgYXJlIHVuc3VwcG9ydGVkIGZvciAzMmJwcCBpbiBE
Q04xLiBUaGV5IGFyZSBvbmx5IHN1cHBvcnRlZCBpbiBEQ0UxMi4gVGhlIHN3aXp6bGUgbW9kZXMg
YmV0d2VlbiB0aGUgdHdvIGhhdmUgbm8gaW50ZXJzZWN0aW9uLjxicj48L2Rpdj48ZGl2PsKgPC9k
aXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHgg
MHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmct
bGVmdDoxZXgiPg0KKzxicj4NCivCoCDCoCDCoCDCoGlmIChhZGV2LSZndDtmYW1pbHkgPT0gQU1E
R1BVX0ZBTUlMWV9SVikgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGFkZF9tb2RpZmll
cihtb2RzLCBzaXplLCBjYXBhY2l0eSwgQU1EX0ZNVF9NT0QgfDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChUSUxFLCBBTURfRk1U
X01PRF9USUxFX0dGWDlfNjRLX1NfWCkgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChUSUxFX1ZFUlNJT04sIEFNRF9GTVRfTU9E
X1RJTEVfVkVSX0dGWDkpIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBBTURfRk1UX01PRF9TRVQoUElQRV9YT1JfQklUUywgcGlwZV94b3JfYml0cykgfDxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9E
X1NFVChCQU5LX1hPUl9CSVRTLCBiYW5rX3hvcl9iaXRzKSk7PGJyPg0KK8KgIMKgIMKgIMKgfTxi
cj4NCis8YnI+DQorwqAgwqAgwqAgwqBhZGRfbW9kaWZpZXIobW9kcywgc2l6ZSwgY2FwYWNpdHks
IEFNRF9GTVRfTU9EIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1U
X01PRF9TRVQoVElMRSwgQU1EX0ZNVF9NT0RfVElMRV9HRlg5XzY0S19EKSB8PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKFRJTEVfVkVSU0lPTiwgQU1E
X0ZNVF9NT0RfVElMRV9WRVJfR0ZYOSkpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBpZiAoYWRl
di0mZ3Q7ZmFtaWx5ID09IEFNREdQVV9GQU1JTFlfUlYpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBhZGRfbW9kaWZpZXIobW9kcywgc2l6ZSwgY2FwYWNpdHksIEFNRF9GTVRfTU9EIHw8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01P
RF9TRVQoVElMRSwgQU1EX0ZNVF9NT0RfVElMRV9HRlg5XzY0S19TKSB8PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKFRJTEVfVkVS
U0lPTiwgQU1EX0ZNVF9NT0RfVElMRV9WRVJfR0ZYOSkpOzxicj4NCivCoCDCoCDCoCDCoH08YnI+
DQorfTxicj4NCis8YnI+DQorc3RhdGljIHZvaWQ8YnI+DQorYWRkX2dmeDEwXzFfbW9kaWZpZXJz
KGNvbnN0IHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LDxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB1aW50NjRfdCAqKm1vZHMsIHVpbnQ2NF90ICpzaXplLCB1aW50NjRfdCAq
Y2FwYWNpdHkpPGJyPg0KK3s8YnI+DQorwqAgwqAgwqAgwqBpbnQgcGlwZV94b3JfYml0cyA9IGls
b2cyKGFkZXYtJmd0O2dmeC5jb25maWcuZ2JfYWRkcl9jb25maWdfZmllbGRzLm51bV9waXBlcyk7
PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGFkZF9tb2RpZmllcihtb2RzLCBzaXplLCBjYXBhY2l0
eSwgQU1EX0ZNVF9NT0QgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9G
TVRfTU9EX1NFVChUSUxFLCBBTURfRk1UX01PRF9USUxFX0dGWDlfNjRLX1JfWCkgfDxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChUSUxFX1ZFUlNJT04s
IEFNRF9GTVRfTU9EX1RJTEVfVkVSX0dGWDEwKSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKFBJUEVfWE9SX0JJVFMsIHBpcGVfeG9yX2JpdHMpIHw8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoRENDLCAx
KSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKERD
Q19DT05TVEFOVF9FTkNPREUsIDEpIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBBTURfRk1UX01PRF9TRVQoRENDX0lOREVQRU5ERU5UXzY0QiwgMSkgfDxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChEQ0NfTUFYX0NPTVBSRVNTRURf
QkxPQ0ssIEFNRF9GTVRfTU9EX0RDQ19CTE9DS182NEIpKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKg
IMKgYWRkX21vZGlmaWVyKG1vZHMsIHNpemUsIGNhcGFjaXR5LCBBTURfRk1UX01PRCB8PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKFRJTEUsIEFNRF9G
TVRfTU9EX1RJTEVfR0ZYOV82NEtfUl9YKSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgQU1EX0ZNVF9NT0RfU0VUKFRJTEVfVkVSU0lPTiwgQU1EX0ZNVF9NT0RfVElMRV9WRVJf
R0ZYMTApIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9T
RVQoUElQRV9YT1JfQklUUywgcGlwZV94b3JfYml0cykgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChEQ0MsIDEpIHw8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoRENDX1JFVElMRSwgMSkgfDxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChEQ0NfQ09OU1RBTlRf
RU5DT0RFLCAxKSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9N
T0RfU0VUKERDQ19JTkRFUEVOREVOVF82NEIsIDEpIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoRENDX01BWF9DT01QUkVTU0VEX0JMT0NLLCBBTURf
Rk1UX01PRF9EQ0NfQkxPQ0tfNjRCKSk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGFkZF9tb2Rp
Zmllcihtb2RzLCBzaXplLCBjYXBhY2l0eSwgQU1EX0ZNVF9NT0QgfDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChUSUxFLCBBTURfRk1UX01PRF9USUxF
X0dGWDlfNjRLX1JfWCkgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9G
TVRfTU9EX1NFVChUSUxFX1ZFUlNJT04sIEFNRF9GTVRfTU9EX1RJTEVfVkVSX0dGWDEwKSB8PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKFBJUEVfWE9S
X0JJVFMsIHBpcGVfeG9yX2JpdHMpKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgYWRkX21vZGlm
aWVyKG1vZHMsIHNpemUsIGNhcGFjaXR5LCBBTURfRk1UX01PRCB8PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKFRJTEUsIEFNRF9GTVRfTU9EX1RJTEVf
R0ZYOV82NEtfRF9YKSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZN
VF9NT0RfU0VUKFRJTEVfVkVSU0lPTiwgQU1EX0ZNVF9NT0RfVElMRV9WRVJfR0ZYMTApIHw8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoUElQRV9YT1Jf
QklUUywgcGlwZV94b3JfYml0cykpOzxicj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRp
dj5EIHN3aXp6bGUgbW9kZXMgYXJlIHVuc3VwcG9ydGVkIGFjY29yZGluZyB0byBBZGRybGliLjxi
cj48L2Rpdj48ZGl2PsKgPC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHls
ZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0
LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPg0KKzxicj4NCivCoCDCoCDCoCDCoGFkZF9tb2Rp
Zmllcihtb2RzLCBzaXplLCBjYXBhY2l0eSwgQU1EX0ZNVF9NT0QgfDxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChUSUxFLCBBTURfRk1UX01PRF9USUxF
X0dGWDlfNjRLX1NfWCkgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9G
TVRfTU9EX1NFVChUSUxFX1ZFUlNJT04sIEFNRF9GTVRfTU9EX1RJTEVfVkVSX0dGWDEwKSB8PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKFBJUEVfWE9S
X0JJVFMsIHBpcGVfeG9yX2JpdHMpKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKgYWRkX21vZGlm
aWVyKG1vZHMsIHNpemUsIGNhcGFjaXR5LCBBTURfRk1UX01PRCB8PGJyPg0KK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKFRJTEUsIEFNRF9GTVRfTU9EX1RJTEVf
R0ZYOV82NEtfRCkgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRf
TU9EX1NFVChUSUxFX1ZFUlNJT04sIEFNRF9GTVRfTU9EX1RJTEVfVkVSX0dGWDEwKSk7PGJyPg0K
Kzxicj4NCivCoCDCoCDCoCDCoGFkZF9tb2RpZmllcihtb2RzLCBzaXplLCBjYXBhY2l0eSwgQU1E
X0ZNVF9NT0QgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9E
X1NFVChUSUxFLCBBTURfRk1UX01PRF9USUxFX0dGWDlfNjRLX0QpIHw8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoVElMRV9WRVJTSU9OLCBBTURfRk1U
X01PRF9USUxFX1ZFUl9HRlg5KSk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGFkZF9tb2RpZmll
cihtb2RzLCBzaXplLCBjYXBhY2l0eSwgQU1EX0ZNVF9NT0QgfDxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChUSUxFLCBBTURfRk1UX01PRF9USUxFX0dG
WDlfNjRLX1MpIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01P
RF9TRVQoVElMRV9WRVJTSU9OLCBBTURfRk1UX01PRF9USUxFX1ZFUl9HRlg5KSk7PGJyPg0KK308
YnI+DQorPGJyPg0KK3N0YXRpYyB2b2lkPGJyPg0KK2FkZF9nZngxMF8zX21vZGlmaWVycyhjb25z
dCBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgdWludDY0X3QgKiptb2RzLCB1aW50NjRfdCAqc2l6ZSwgdWludDY0X3QgKmNhcGFj
aXR5KTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgaW50IHBpcGVfeG9yX2JpdHMgPSBpbG9nMihh
ZGV2LSZndDtnZnguY29uZmlnLmdiX2FkZHJfY29uZmlnX2ZpZWxkcy5udW1fcGlwZXMpOzxicj4N
CivCoCDCoCDCoCDCoGludCBwa3JzID0gaWxvZzIoYWRldi0mZ3Q7Z2Z4LmNvbmZpZy5nYl9hZGRy
X2NvbmZpZ19maWVsZHMubnVtX3BrcnMpOzxicj4NCis8YnI+DQorwqAgwqAgwqAgwqBhZGRfbW9k
aWZpZXIobW9kcywgc2l6ZSwgY2FwYWNpdHksIEFNRF9GTVRfTU9EIHw8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoVElMRSwgQU1EX0ZNVF9NT0RfVElM
RV9HRlg5XzY0S19SX1gpIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURf
Rk1UX01PRF9TRVQoVElMRV9WRVJTSU9OLCBBTURfRk1UX01PRF9USUxFX1ZFUl9HRlgxMF9SQlBM
VVMpIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQo
UElQRV9YT1JfQklUUywgcGlwZV94b3JfYml0cykgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChQQUNLRVJTLCBwa3JzKSB8PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKERDQywgMSkgfDxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChEQ0NfQ09OU1RBTlRfRU5D
T0RFLCAxKSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0Rf
U0VUKERDQ19JTkRFUEVOREVOVF82NEIsIDEpIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBBTURfRk1UX01PRF9TRVQoRENDX0lOREVQRU5ERU5UXzEyOEIsIDEpIHw8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoRENDX01BWF9DT01Q
UkVTU0VEX0JMT0NLLCBBTURfRk1UX01PRF9EQ0NfQkxPQ0tfMTI4QikpOzxicj4NCis8YnI+DQor
wqAgwqAgwqAgwqBhZGRfbW9kaWZpZXIobW9kcywgc2l6ZSwgY2FwYWNpdHksIEFNRF9GTVRfTU9E
IHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoVElM
RSwgQU1EX0ZNVF9NT0RfVElMRV9HRlg5XzY0S19SX1gpIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoVElMRV9WRVJTSU9OLCBBTURfRk1UX01PRF9U
SUxFX1ZFUl9HRlgxMF9SQlBMVVMpIHw8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBBTURfRk1UX01PRF9TRVQoUElQRV9YT1JfQklUUywgcGlwZV94b3JfYml0cykgfDxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChQQUNLRVJTLCBwa3Jz
KSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKERD
QywgMSkgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NF
VChEQ0NfUkVUSUxFLCAxKSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1E
X0ZNVF9NT0RfU0VUKERDQ19DT05TVEFOVF9FTkNPREUsIDEpIHw8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoRENDX0lOREVQRU5ERU5UXzY0QiwgMSkg
fDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChEQ0Nf
SU5ERVBFTkRFTlRfMTI4QiwgMSkgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oEFNRF9GTVRfTU9EX1NFVChEQ0NfTUFYX0NPTVBSRVNTRURfQkxPQ0ssIEFNRF9GTVRfTU9EX0RD
Q19CTE9DS18xMjhCKSk7PGJyPg0KKzxicj4NCivCoCDCoCDCoCDCoGFkZF9tb2RpZmllcihtb2Rz
LCBzaXplLCBjYXBhY2l0eSwgQU1EX0ZNVF9NT0QgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChUSUxFLCBBTURfRk1UX01PRF9USUxFX0dGWDlfNjRL
X1JfWCkgfDxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NF
VChUSUxFX1ZFUlNJT04sIEFNRF9GTVRfTU9EX1RJTEVfVkVSX0dGWDEwX1JCUExVUykgfDxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoEFNRF9GTVRfTU9EX1NFVChQSVBFX1hPUl9C
SVRTLCBwaXBlX3hvcl9iaXRzKSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
QU1EX0ZNVF9NT0RfU0VUKFBBQ0tFUlMsIHBrcnMpKTs8YnI+DQorPGJyPg0KK8KgIMKgIMKgIMKg
YWRkX21vZGlmaWVyKG1vZHMsIHNpemUsIGNhcGFjaXR5LCBBTURfRk1UX01PRCB8PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9NT0RfU0VUKFRJTEUsIEFNRF9GTVRf
TU9EX1RJTEVfR0ZYOV82NEtfRF9YKSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgQU1EX0ZNVF9NT0RfU0VUKFRJTEVfVkVSU0lPTiwgQU1EX0ZNVF9NT0RfVElMRV9WRVJfR0ZY
MTBfUkJQTFVTKSB8PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgQU1EX0ZNVF9N
T0RfU0VUKFBJUEVfWE9SX0JJVFMsIHBpcGVfeG9yX2JpdHMpIHw8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBBTURfRk1UX01PRF9TRVQoUEFDS0VSUywgcGtycykpOzxicj48L2Js
b2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5EIHN3aXp6bGUgbW9kZXMgYXJlIHVuc3VwcG9y
dGVkLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+TWFyZWs8L2Rpdj48YnI+PC9kaXY+PC9kaXY+
DQo=
--000000000000be0c7905ac4ed0b5--

--===============1848762257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1848762257==--
