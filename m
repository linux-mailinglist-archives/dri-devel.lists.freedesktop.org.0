Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7422B2342
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 19:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB646E7E6;
	Fri, 13 Nov 2020 18:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D646E5CA;
 Fri, 13 Nov 2020 18:04:17 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r17so10934112wrw.1;
 Fri, 13 Nov 2020 10:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GNjaqccHTi0P35N9w0EhJ6TFmWjOcGoBjHPsfLX0L98=;
 b=DCoKSCjM4pdsQmFiFxtwWWkfE659A+iv/KffrqF1BC1S+PjdlT8Hl+1aVJvY+bG6fe
 u3Dnrk3sG7uySqMooIoA9D0QBTTbjijfUX+Mz2nTIfjL6xkwkOgOmRCnoQmOIJ1NTsNM
 EeTfSbbZYQYzyZWynLie6B8qKRN1Axu8na3aGgaUO9S9GhK6/A1KGkXzTP0j4Jke6qJN
 iTIdhk8YaQMt88H1Xb+vaqHuclQRNxfU0zKh9upE+1FNd1A3k+Ho86eHztbSbUnxMIyL
 ztYA0UxHokSWuQ4qCandKpyNNGZyqLwzdtJ1LuqkeiM4T9VkacRLO+RJapqzTUTRR4E3
 9LGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GNjaqccHTi0P35N9w0EhJ6TFmWjOcGoBjHPsfLX0L98=;
 b=Uz4W8K7IweFiPAf9twWMIttzeo951t+t33wQt82Et8fT17C2SKNvgTq8n7MuqGVMI9
 FEvDqmMtRVweX8z/1PP6X3X4VFSn0Li2MebfeJ92CDmKkf9UIJ1ezLgHECqwJ7uaQUa6
 +g8B4RWHFmAGG3I+vgCH6oB8jYhRqBLw1eS+bCL6/M1Kplitt1m3JouzCMHo2Gqbam/o
 zTeP6zujROHerInHcw7KBCnUmV0XXAt30aJ3kDzr5dr38BL0SmNOlyHfozrpZBlDqyh2
 dgGC0PjpdcGZMu43f4IQMr8D6yVmpqkLUUsjAyl4zt6nQfeCneeh2/vSuyaz+/m1cCE1
 p7+g==
X-Gm-Message-State: AOAM532RClC/ShwQVHgGgDmAfs5QZKE32k1drnZgwRIzqhx3vVk8nqXD
 Z5mOKGEKBZA6ktAzcZL12HsV+lRJYSuQ7WhOnaY=
X-Google-Smtp-Source: ABdhPJzu4cNUrn2VE2zVry+OOgmKMxttYcsMGeRDrV5KrafUemuJTogPBTIYGCGqgkj/jGI860dTaY+QIWA5gDv4CWs=
X-Received: by 2002:adf:8028:: with SMTP id 37mr4854081wrk.111.1605290654177; 
 Fri, 13 Nov 2020 10:04:14 -0800 (PST)
MIME-Version: 1.0
References: <0gLrKmUEE4VjN5rdf6dUiejliU1GhjCBvH7RFMQYY@cp7-web-044.plabs.ch>
In-Reply-To: <0gLrKmUEE4VjN5rdf6dUiejliU1GhjCBvH7RFMQYY@cp7-web-044.plabs.ch>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Nov 2020 13:04:03 -0500
Message-ID: <CADnq5_PBDHhzfZ5Kt2Q_zuMuwhvVH+hc8YO5xp+0xk=_y2XoVQ@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add table describing AMD modifiers bit layout
To: Simon Ser <contact@emersion.fr>
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

On Fri, Nov 13, 2020 at 12:21 PM Simon Ser <contact@emersion.fr> wrote:
>
> The table describes how each bit in the u64 value is used. Explicitly
> state which values a field can take if we have defines for them. Also
> add a note when a field isn't always populated.
>
> Forcing people to update the table when changing the bit layout should
> make it more obvious when there's a mistake, I hope.
>
> If we get to the point where the bit layout gets more complicated, it
> might be worth it to split the table into multiple tables (e.g. one for
> GFX8, one for GFX9+, and so on).
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Alex Deucher <alexdeucher@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Applied.  Thanks!

Alex

> ---
>
> This already contains the fix in [1].
>
> [1]: https://lists.freedesktop.org/archives/amd-gfx/2020-November/056073.html
>
>  include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index ca48ed0e6bc1..253386b7bc6a 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -1114,6 +1114,25 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>   *
>   * For multi-plane formats the above surfaces get merged into one plane for
>   * each format plane, based on the required alignment only.
> + *
> + * Bits  Parameter                Notes
> + * ----- ------------------------ ---------------------------------------------
> + *
> + *   7:0 TILE_VERSION             Values are AMD_FMT_MOD_TILE_VER_*
> + *  12:8 TILE                     Values are AMD_FMT_MOD_TILE_<version>_*
> + *    13 DCC
> + *    14 DCC_RETILE
> + *    15 DCC_PIPE_ALIGN
> + *    16 DCC_INDEPENDENT_64B
> + *    17 DCC_INDEPENDENT_128B
> + * 19:18 DCC_MAX_COMPRESSED_BLOCK Values are AMD_FMT_MOD_DCC_BLOCK_*
> + *    20 DCC_CONSTANT_ENCODE
> + * 23:21 PIPE_XOR_BITS            Only for some chips
> + * 26:24 BANK_XOR_BITS            Only for some chips
> + * 29:27 PACKERS                  Only for some chips
> + * 32:30 RB                       Only for some chips
> + * 35:33 PIPE                     Only for some chips
> + * 55:36 -                        Reserved for future use, must be zero
>   */
>  #define AMD_FMT_MOD fourcc_mod_code(AMD, 0)
>
> --
> 2.29.2
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
