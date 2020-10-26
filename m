Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927442990F5
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 16:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A416E187;
	Mon, 26 Oct 2020 15:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322F56E187
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 15:27:38 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id x1so2383351ooo.12
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 08:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mWn4WewhRLsBTPcbmy2OSughHssP6G/Wcsv5qOCOPQk=;
 b=SD+mpY3nOlP7M8eJKYGCxjWExSwFHYaqBTmdWWvmUYnYsVr+FGYqCI9BKa14HB86fn
 v8Ya4jrA+NrqkRi969zal5BwaqoGxUEMmw8Xogy0u1ZZlx55HW74A8E9Hy3PYdMBDxWN
 NZ8jJtjpxBnIs66Xg4pr3fMGuaC9Yq+1wW8AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mWn4WewhRLsBTPcbmy2OSughHssP6G/Wcsv5qOCOPQk=;
 b=pzTMTcYjd3S3DrrQlVoF8Mib52iIXhjZ0/YE/WiMSF86L2mueutimop9aaiUDx7H/G
 /MteT7B2TD2PpY8EA/6NASEPRpxcuebb73uvQ3oP62JL7aynRtxFCOWVdR8EwVWoZWF2
 8ChGPG/vZlynOFsz5swkcRxYGbz1zzkhABKNkHru/ILeOgV2wjOexDe+xvrEVpW9P1VN
 qFz/1B2sn9XU3rValqzo4wrl9SdBtmVJmV+c1elVpagfTM2ZHkTmgVbuy2Zgrd0oOhVh
 z8erPo1Eu0FB7B3r3fxyzylRGHHkwZAwK7mhTsNoKDqP5ybC1b45I9nuZboummZks8ye
 ObrQ==
X-Gm-Message-State: AOAM5306kLVG/yDnJhekbV20vNtIlYSCbOJsSlINchHf94OO4hupWGnn
 CFguEaTXsvFOJhqUksU0uyjQNQ+SItgs93SaiLLPig==
X-Google-Smtp-Source: ABdhPJyLQkn8JZrid25zA5cw0eLagIbqC2+EB0Konvgn8Ww9p/XZFkIBmG0BpEnRA9ZpGrwe32jIJhNclIXVUe0eWqE=
X-Received: by 2002:a4a:b503:: with SMTP id r3mr13888316ooo.28.1603726057540; 
 Mon, 26 Oct 2020 08:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <a2j8KTgc26k5QniSAhDSTgCw4XWZhmsNHwG8UVa6U@cp4-web-014.plabs.ch>
In-Reply-To: <a2j8KTgc26k5QniSAhDSTgCw4XWZhmsNHwG8UVa6U@cp4-web-014.plabs.ch>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 26 Oct 2020 16:27:25 +0100
Message-ID: <CAKMK7uHqPA-Wb2kar4cz91p8599-_Z-YyOCxL353gJn=cyfd6Q@mail.gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

Maybe mention that "are modifiers used" is out-of-band information
carried in e.g. the modifier flag for addfb2 (or for EGL in the
presence/absence of the modifier settings when initializing a buffer).
Either way,

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +#define DRM_FORMAT_MOD_NONE    0
> +
>  /* Intel framebuffer modifiers */
>
>  /*
> --
> 2.28.0
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
