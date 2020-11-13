Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3D52B2338
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 19:00:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749096E5C3;
	Fri, 13 Nov 2020 18:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5CC6E5C3;
 Fri, 13 Nov 2020 18:00:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a3so9487692wmb.5;
 Fri, 13 Nov 2020 10:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Us0fENNtA8MrGKfRxmlrR0fpL28TxcNYZ6RQsQZqhwc=;
 b=su6wlg+CWROm2DLpIZYLTDmysIdXKJdYQ6d3eRmirfTzrwxJWQNj0Sk1YWih0Bh1Ks
 OOw9THVJgXXwXMlrmchvSRhQ9sCl7kgn/L3clQwOrcL659znjr+ZkYZa7Oxts1A0XXmO
 +oe2jALLOIqp2M34hacHNyFhEVvx68QZzcKGyy1lIS0P7H9aghttdnEni+so4sO7JQpF
 M1I+ayXi8Mou9g9Zpj0AJQ/EXy3xi2kh7fQ5v25a1QNRinKy8V9E8oiPf/FTcvH+Imbk
 5MaJXYuqQnnqAjwlN4JKza2e4Y+J2bmo2Pwj8LqFqVoP5xdtHzZ6AEk0B7FAjWMOOy8B
 H9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Us0fENNtA8MrGKfRxmlrR0fpL28TxcNYZ6RQsQZqhwc=;
 b=VTbCXmoKBOgeVuYGkFR2jw2NooDV6eYyzMvVoe3OZMtcc+8qw8vlQjuL0aohAb4ght
 r/Kn/cGLWeWjJenabSpWa1liFm4Yk5VUcX8PGODURyqIT4NTGi15dfu9zrQUdZp8B5b5
 Jw82YXFlT9JIpbVsIl6AAwHxJ6WIr6Lt3kpQXsv7k3UzmAZbRekBMczClmrvVLkRpbHp
 fY0s066tP2G+6p7k6kSqWrkpDy1FcNjQt3p54AfEKlp8VL88B3QGx5HdA5nnIu6QbTpN
 sQxg5j7M2Wt8uXF4ZgOYN2vN2pWIR7YWhBW7/FZEqkVge+KvXJfQ8+BmNG2G3KnUH6E8
 yLdg==
X-Gm-Message-State: AOAM533Za1YUqvML0tPz0YDXv/axacAg60u+L8PNTWxw1kTOOB5e0ojK
 WA4vTl3lOlNztNpmpE3qgEn/TwptltipU8tLXsc=
X-Google-Smtp-Source: ABdhPJxguAXyqV8skU2y3sJxvaSkFVRthueuQ/lmsi7es17Ihd4ihFmDnuoSYRM8/G7QVp9TPJ3+OUlPLTNsAK0HKqk=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr3643816wmb.39.1605290451569;
 Fri, 13 Nov 2020 10:00:51 -0800 (PST)
MIME-Version: 1.0
References: <20201113175533.731834-1-bas@basnieuwenhuizen.nl>
In-Reply-To: <20201113175533.731834-1-bas@basnieuwenhuizen.nl>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 13:00:39 -0500
Message-ID: <CADnq5_NsenZ-Y2Jf=PhjUKt2wCrOaLdXv8cexAYUf9e-BLCxtg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/fourcc: Fix modifier field mask for AMD modifiers.
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 13, 2020 at 12:55 PM Bas Nieuwenhuizen
<bas@basnieuwenhuizen.nl> wrote:
>
> The DCC_MAX_COMPRESSED_BLOCK has to contain one of
> AMD_FMT_MOD_DCC_BLOCK_* and with 3 values this doesn't
> fit in 1 bit.
>
> Fix this cleanly while it is only in drm-next.
>
> Fixes: 8ba16d599374 ("drm/fourcc: Add AMD DRM modifiers.")
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

Applied.  Thanks!

Alex

> ---
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
