Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6029C69334D
	for <lists+dri-devel@lfdr.de>; Sat, 11 Feb 2023 20:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB4610E363;
	Sat, 11 Feb 2023 19:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E844910E11A;
 Sat, 11 Feb 2023 19:24:34 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id b81so4366222vkf.1;
 Sat, 11 Feb 2023 11:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1676143474;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UxlJ1ylLIbukjk1rqvmj0yN/uchUwg9M7RlTwLyGWuY=;
 b=GkOee6yuha8KCFlJkb58KhoIf1WvDhoQGtKv5bfk3o8tsTw+l/AsWr+2V/5JogWj5S
 e+tne2hDNFv1lpCplUyRYJ8XvXJT/A86j9C6i4RrCLDhYDzUH1pdJxgLHNZVq73aui39
 5rcNE3u8qrpeAfy17RxKjgbVwdyWKa+QtwOz4hidJv8eZzgjnKhWEyvMMx14AqZH4Nq4
 TG8+24y9MmfpA6DBbd/7StK3VZjcYSfq4ZkK0A81/+Jg014d+TErR5x9m4vwOP0lQK2R
 C0H5Kz2iqI0dL1Yq2gcKuiAF8/iGmlIS/Vl6F/BWWqtKm9JR3f9wyanfKxR5l86KD4+I
 fzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676143474;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UxlJ1ylLIbukjk1rqvmj0yN/uchUwg9M7RlTwLyGWuY=;
 b=Q57PO+OnV7MMnnQaLlOY2UrbrpONIb4At7LlrrJct1F7C7t2euXx4vOIMh0gWBivd3
 Ah/ZKl4vKUTjRnNgu4VQqivPPUgzDWjsqwzprKApqNakNkkXK0v6pPjp40lwAAsd3+QN
 YhLTpfJf0i7RwNTofIAFLq3tKQ/a/6ZBNDM7GeQbcsDx5CjXRP9cVtB6Jn93WG1bB2ea
 5jvqj3YSIxlhgIk/ogdJxlIrRLOylKAri67sbgmrSvnmvxqbvndXPa0JyQ6Ijkwc9mdV
 SMLM4K3CYfprUGQ+68/3sCuCWBrGnxNsouGDASRzJ2O/xcAeTsQTca3H4WdRzAqsQCOa
 uYyw==
X-Gm-Message-State: AO0yUKV3CC3jN4LmeLx+MERdEKMtZ/TGZXEIRmZ/T8t5TEknXBbtny8k
 9g+pij2MU7s+GYNU1X4WsyYIlu91kjclbtt1HjE=
X-Google-Smtp-Source: AK7set+VxozcaMiBwzTBA/oB2AIISrAuQ7Bedp9xn0ogNT61aLcgqppS9XrHSr2WISoF0Ecv104SL7WHbg5llfrzjs4=
X-Received: by 2002:a1f:1444:0:b0:400:db9c:7a9f with SMTP id
 65-20020a1f1444000000b00400db9c7a9fmr3680755vku.6.1676143473964; Sat, 11 Feb
 2023 11:24:33 -0800 (PST)
MIME-Version: 1.0
References: <20230125203743.564009-1-jim.cromie@gmail.com>
 <20230125203743.564009-15-jim.cromie@gmail.com>
In-Reply-To: <20230125203743.564009-15-jim.cromie@gmail.com>
From: jim.cromie@gmail.com
Date: Sat, 11 Feb 2023 12:24:07 -0700
Message-ID: <CAJfuBxw+g6w9_p2ym-hpCQNbr01crRMK_aYb4oV4j_BhoPwQjw@mail.gmail.com>
Subject: Re: [PATCH v3 14/19] drm_print: fix stale macro-name in comment
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 1:38 PM Jim Cromie <jim.cromie@gmail.com> wrote:
>
> Cited commit uses stale macro name, fix this, and explain better.




So this patch is somehow drawing an 'F' flag from patchwork,
but theres no hint of what went wrong.
(I have seen a merge conflict, probably not that).

https://patchwork.freedesktop.org/series/113361/

https://patchwork.freedesktop.org/patch/520460/?series=113361&rev=1

Without this resolved, I cant see BAT results or the more exhaustive tests.





>
> When DRM_USE_DYNAMIC_DEBUG=y, DYNDBG_CLASSMAP_DEFINE() maps DRM_UT_*
> onto BITs in drm.debug.  This still uses enum drm_debug_category, but
> it is somewhat indirect, with the ordered set of DRM_UT_* enum-vals.
> This requires that the macro args: DRM_UT_* list must be kept in sync
> and in order.
>
> Fixes: f158936b60a7 ("drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.")
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> . emphasize ABI non-change despite enum val change - Jani Nikula
> . reorder to back of patchset to follow API name changes.
> ---
>  include/drm/drm_print.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 6a27e8f26770..7695ba31b3a4 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -276,7 +276,10 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
>   *
>   */
>  enum drm_debug_category {
> -       /* These names must match those in DYNAMIC_DEBUG_CLASSBITS */
> +       /*
> +        * Keep DYNDBG_CLASSMAP_DEFINE args in sync with changes here,
> +        * the enum-values define BIT()s in drm.debug, so are ABI.
> +        */
>         /**
>          * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
>          * drm_memory.c, ...
> --
> 2.39.1
>
