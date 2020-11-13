Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0612B22B0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 18:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723456E514;
	Fri, 13 Nov 2020 17:42:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B11D6E514;
 Fri, 13 Nov 2020 17:42:41 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d12so10784837wrr.13;
 Fri, 13 Nov 2020 09:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=atp8HCRKq6PIesLyq5uLOPO8ogfKpVDxytbTraV1r2Q=;
 b=BRiYurApBRW5IgOlLw1/k7ibkNVMUxEqYuHctn2r7LX4yOc85Fqx6rc6dvUagvByoj
 /qhQkpnQc7m7nvBKLj4VD0lpbi+wvvbFnoT8YNju2DignYmpyHo1nmZSIzk29azYASzh
 QfQ9rVFmGeZv1e787DGJYoBfIr+sYDNVMLXvG/hUEoXXEIPjNzU5wdH6+S4QBI7d2dZh
 jp/1Tfn24LKAgHimkvB6pE5j9vdQvTBxORf8sR5c7wnqxYx/4CpR8q4ufhGf8PKMoppK
 IQxJg1gBxhJLzvPqpBuowuPBVF+Vbs+CXolKDRszJZtYdFOUIyM0HId4ID8EZLvLDIvU
 UssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=atp8HCRKq6PIesLyq5uLOPO8ogfKpVDxytbTraV1r2Q=;
 b=MBAkwGNvWf8tnP7eTxYkqxZWbDy4KqeJz3u8PrN9DsIeq2u5ngKYlyJtb3BHtrEoXr
 +6TB4v5gBssdJ9DAEoKlJ3g2OddReiHx1Af8kFCGAaBiDPBAS3g73JlhQUJyGpcbyN4T
 Esmp9lTVoLtZPPSsIWROAS6dcDOm1CPzL2n1KynkfnZk9uUc0nm4P4WHktyY9hhD6Bpy
 zLWiiKgTCS5AIfUPTBGabsquBF16dJyl3r1WPf48bHJYuPfppRkt7IpDM1xLpCUhuE++
 doXb4SGYrZFpe9eD1vjzp1pkTmWVS/s9R/dRbPaqm+EeiQMMJY/7Pn1lGUwaTpFFtqim
 Ayog==
X-Gm-Message-State: AOAM5328n8IH1FZ44XabX19YQD9CHgmYNe0//aWmraHF+Fe6lHXHDAU9
 ymuxkI4MzwFCIVsXAB7QlFQn+9Ef9QHGZMqfXlk=
X-Google-Smtp-Source: ABdhPJzKlA3X04m8VW0oy8q9PcTFh8X/CiRFwaLFjBtxTWhVWpvwoxbCHFZBFheIcKoKpPEgUIfD9LA0U5aGDSc9W7M=
X-Received: by 2002:adf:e350:: with SMTP id n16mr5041875wrj.419.1605289355482; 
 Fri, 13 Nov 2020 09:42:35 -0800 (PST)
MIME-Version: 1.0
References: <20201113162556.672966-1-bas@basnieuwenhuizen.nl>
In-Reply-To: <20201113162556.672966-1-bas@basnieuwenhuizen.nl>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 12:42:24 -0500
Message-ID: <CADnq5_N5bxxJbJxssrGpHv_106wFgs=X1C68aUGEGOsovzF-Dg@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: Fix modifier field mask for AMD modifiers.
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 13, 2020 at 11:25 AM Bas Nieuwenhuizen
<bas@basnieuwenhuizen.nl> wrote:
>
> The DCC_MAX_COMPRESSED_BLOCK has to contain one of
> AMD_FMT_MOD_DCC_BLOCK_* and with 3 values this doesn't
> fit in 1 bit.
>
> Fix this cleanly while it is only in drm-next.
>
> Fixes: 8ba16d5993749c3f31fd2b49e16f0dc1e1770b9c

Fixes: 8ba16d599374 ("drm/fourcc: Add AMD DRM modifiers.")

Also missing your signed-off-by.  With those things fixed:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>
> Found while reviewing Simon's drm_info PR: https://github.com/ascent12/drm_info/pull/63/commits/eaeae6ee78764a03d959cbc97c8b514f81a94c63
>
>  include/uapi/drm/drm_fourcc.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index df56e71a7380..a878664ba41c 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -1129,7 +1129,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define AMD_FMT_MOD_DCC_INDEPENDENT_128B_SHIFT 17
>  #define AMD_FMT_MOD_DCC_INDEPENDENT_128B_MASK 0x1
>  #define AMD_FMT_MOD_DCC_MAX_COMPRESSED_BLOCK_SHIFT 18
> -#define AMD_FMT_MOD_DCC_MAX_COMPRESSED_BLOCK_MASK 0x1
> +#define AMD_FMT_MOD_DCC_MAX_COMPRESSED_BLOCK_MASK 0x3
>
>  /*
>   * DCC supports embedding some clear colors directly in the DCC surface.
> @@ -1140,7 +1140,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>   * If this bit is set that means the fastclear eliminate is not needed for these
>   * embeddable colors.
>   */
> -#define AMD_FMT_MOD_DCC_CONSTANT_ENCODE_SHIFT 19
> +#define AMD_FMT_MOD_DCC_CONSTANT_ENCODE_SHIFT 20
>  #define AMD_FMT_MOD_DCC_CONSTANT_ENCODE_MASK 0x1
>
>  /*
> @@ -1153,15 +1153,15 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>   * RB = only for TILE_VER_GFX9 & DCC
>   * PIPE = only for TILE_VER_GFX9 & DCC & (DCC_RETILE | DCC_PIPE_ALIGN)
>   */
> -#define AMD_FMT_MOD_PIPE_XOR_BITS_SHIFT 20
> +#define AMD_FMT_MOD_PIPE_XOR_BITS_SHIFT 21
>  #define AMD_FMT_MOD_PIPE_XOR_BITS_MASK 0x7
> -#define AMD_FMT_MOD_BANK_XOR_BITS_SHIFT 23
> +#define AMD_FMT_MOD_BANK_XOR_BITS_SHIFT 24
>  #define AMD_FMT_MOD_BANK_XOR_BITS_MASK 0x7
> -#define AMD_FMT_MOD_PACKERS_SHIFT 26 /* aliases with BANK_XOR_BITS */
> +#define AMD_FMT_MOD_PACKERS_SHIFT 27 /* aliases with BANK_XOR_BITS */
>  #define AMD_FMT_MOD_PACKERS_MASK 0x7
> -#define AMD_FMT_MOD_RB_SHIFT 29
> +#define AMD_FMT_MOD_RB_SHIFT 30
>  #define AMD_FMT_MOD_RB_MASK 0x7
> -#define AMD_FMT_MOD_PIPE_SHIFT 32
> +#define AMD_FMT_MOD_PIPE_SHIFT 33
>  #define AMD_FMT_MOD_PIPE_MASK 0x7
>
>  #define AMD_FMT_MOD_SET(field, value) \
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
