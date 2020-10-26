Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D08298DAA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 14:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B7D6E237;
	Mon, 26 Oct 2020 13:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A26D6E237
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 13:19:08 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id z17so10000217iog.11
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 06:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O2JjP04Um/lbC15DGmyY6olLLSgl/FghDXqCziVZQyI=;
 b=OjpcskcvsiFN6vz0jcjyHApWWilnJPhoXRDhuvMTPlQY8dCQQIEbRniawgVDJDu9Gl
 GvHuiRrZ2qD4C+BZetebvH2telALsyjLCVylsJC0SYmO7Dm9VJSFh295j2DdKD3iYL87
 neI9HN5N1YKKStFbcOswrsTwZoeYBqYLyjD3tNDLvdqhJg/htT3q7hf8IgkT40LWGWAs
 PDncYMwCFmOV57Q/SxUcJqmwUFYj5wexrpzKB4FxcygUA9iYTAGrlRwiC8xF55FCQwie
 BMfp+chN7x6ctfDUU/YyiVhPIL7B/fLF5GsStWmyAGYVhWXEbhAE6tGeAjSDjbV2WwIM
 fHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O2JjP04Um/lbC15DGmyY6olLLSgl/FghDXqCziVZQyI=;
 b=C44EiipLUq0tqEXH/upuE+W8kyc31WEzVjc6wJjMvbm8rOkBVucjSifvAEdEvpuEzl
 I5Sdv35tgUzXymArC9WhdgjX64/xBMpnwqbh3rmqLE/fHtIzyphkRSHIvrDYcThpLTL+
 m97ne1EAPEw5OJO1vY1fPGSn/aeA+lbK5oy3VgPI4+UoV6TyRLICI50SDx29BpLQh96A
 KQgo9LT5X94OC4V/34bTmbewLUGPuJbJmbQhai+zRQ1vPrS8DKYl4LWPtZ61wOAkWWGn
 JwIJeF0DguEp6EHpl6FLJaqlZvD2imGNm3+g7mdr7SZQ2FfFfU1SzqJ//+S+CTZ49LPo
 QNEg==
X-Gm-Message-State: AOAM531JemxwvDHoS3z8lliE5p7QuWnF3Cp26tdSKSpUDZyi4j47XCSD
 hr+zbHplGIwyFRHV6KOC859UML2yNLO1QYYBc2X+Cg==
X-Google-Smtp-Source: ABdhPJzcBR715CWyUFsABXh3vkWpIHouWKtpuJWs+GkPmiRgHVrPW+Xk7zeoHG5RZuvISc9vnT8srJFdXu2uOEeiVHo=
X-Received: by 2002:a6b:1542:: with SMTP id 63mr10468457iov.64.1603718347647; 
 Mon, 26 Oct 2020 06:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <a2j8KTgc26k5QniSAhDSTgCw4XWZhmsNHwG8UVa6U@cp4-web-014.plabs.ch>
In-Reply-To: <a2j8KTgc26k5QniSAhDSTgCw4XWZhmsNHwG8UVa6U@cp4-web-014.plabs.ch>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Mon, 26 Oct 2020 14:18:52 +0100
Message-ID: <CAP+8YyH0stRcsZjF_OLGbXbLfwjJVBiZbzbGViCmUyrk4JLetQ@mail.gmail.com>
Subject: Re: [PATCH] drm: deprecate DRM_FORMAT_MOD_NONE
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

On Mon, Oct 26, 2020 at 2:17 PM Simon Ser <contact@emersion.fr> wrote:
>
> DRM_FORMAT_MOD_NONE is in the list of vendors, which is pretty
> confusing. We already have DRM_FORMAT_MOD_VENDOR_NONE. Move it down in
> the list of format modifiers.
>
> DRM_FORMAT_MOD_NONE is an alias for DRM_FORMAT_MOD_LINEAR, however the
> name is confusing: NONE doesn't mean that the modifier is implicit,
> instead it means that the layout is linear. Deprecate it.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Suggested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index d720f1e8ae5e..ca1d5587b5fc 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -350,7 +350,6 @@ extern "C" {
>   */
>
>  /* Vendor Ids: */
> -#define DRM_FORMAT_MOD_NONE           0
>  #define DRM_FORMAT_MOD_VENDOR_NONE    0
>  #define DRM_FORMAT_MOD_VENDOR_INTEL   0x01
>  #define DRM_FORMAT_MOD_VENDOR_AMD     0x02
> @@ -422,6 +421,14 @@ extern "C" {
>   */
>  #define DRM_FORMAT_MOD_LINEAR  fourcc_mod_code(NONE, 0)
>
> +/*
> + * Deprecated: use DRM_FORMAT_MOD_LINEAR instead
> + *
> + * The "none" format modifier doesn't actually mean that the modifier is
> + * implicit, instead it means that the layout is linear.
> + */
> +#define DRM_FORMAT_MOD_NONE    0
> +
>  /* Intel framebuffer modifiers */
>
>  /*
> --
> 2.28.0
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
