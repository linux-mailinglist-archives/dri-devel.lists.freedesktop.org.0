Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FE715FFF4
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 20:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3CA6E8FE;
	Sat, 15 Feb 2020 19:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC026E8FE
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 19:09:52 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id i6so12373507otr.7
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 11:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jtaBwvuDqYXbgEkrcmnkNq+aJksvx3qYuStrUFf1nPk=;
 b=c9PMTdkBLuUK+HHuum3wcIS9llgNeY4RsZ/Xp5xrMgg9deWfIEXOdddxfc44Iog3+A
 NBeeegjUT2AyL2SKZFjkGxiGyFx+0NRJg4SaqQ9p78SGQhdTMl5veugxQ3dcc/XeIBzS
 DhwtCu+6dQqiWs51SXeqe14q4scl4B2JCcGSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jtaBwvuDqYXbgEkrcmnkNq+aJksvx3qYuStrUFf1nPk=;
 b=EjmZ9+PnfcmCCPsB8SBNIuehyiQDbEmQkgQgsp/8NUnjjVKMqAzVjh4fiaJhrNDkrn
 dPM99SbIPQf+/x/lQ+a3G5KgtlT+vhTbTjSOkWwo5j9EMe1fIp9gC1sqc4+iyKqak9rW
 ZjspAQ+QHPng6GPI6aUOtcLPYYnFZGQDwEOk7v0NPS5ThMvMDuY47tDV/+iGJzQZxW90
 Z9OG8JJ8bwRn8EK3CSpAGGEoc1Chtm/ucZ2uk1gLCai9PrARNocBFrWHluYMmf49LX7d
 yIE1a+VStnD3vZG9sIWoU4/hcY5CL+lYxYEP8ZUL7oTtnvjoN3XdZxBfNXSHygqggCx5
 PEBw==
X-Gm-Message-State: APjAAAWWTJ/w9mfnoF+BH4aDL+uhe8iWEtnXPdokW6gHt/H4rfomrcQh
 irqXbiwvpn8Tht6nGiE4EFSU/5EGkkK4ihIk0bYokTJB
X-Google-Smtp-Source: APXvYqyDF8Tbp54BZWvvBmE3A/+h/8Q7nSKhtUVAtR/vETVSPr1LfkZzbANNc8095CPUNr4taE8MgYztSQmocATgYJk=
X-Received: by 2002:a9d:7f11:: with SMTP id j17mr7186456otq.281.1581793791767; 
 Sat, 15 Feb 2020 11:09:51 -0800 (PST)
MIME-Version: 1.0
References: <20200215173342.GA7458@ravnborg.org>
In-Reply-To: <20200215173342.GA7458@ravnborg.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Sat, 15 Feb 2020 20:09:40 +0100
Message-ID: <CAKMK7uHweW=yhM=zjzfohL4ki-YoxOO=nfoONY8VDGm7FSdP2w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm: drop unused drm_crtc callback
To: Sam Ravnborg <sam@ravnborg.org>
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

On Sat, Feb 15, 2020 at 6:33 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> struct drm_encoder_helper_funcs included a callback
> named drm_crtc.
>
> There are no users left - so drop it.
> There was one reference in drm_crtc_helper.c,
> which checked if the value was not NULL.
> As it was never assigned this check could be dropped.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>
> Stumbled upon this and dediced to check if it was used.
> Build tested with allyesconfig, allmodconfig for relevant architectures.

Nice catch!

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>
>         Sam
>
>
>  drivers/gpu/drm/drm_crtc_helper.c        |  4 ----
>  include/drm/drm_modeset_helper_vtables.h | 16 ----------------
>  2 files changed, 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
> index 93a4eec429e8..a4d36aca45ea 100644
> --- a/drivers/gpu/drm/drm_crtc_helper.c
> +++ b/drivers/gpu/drm/drm_crtc_helper.c
> @@ -244,10 +244,6 @@ drm_crtc_prepare_encoders(struct drm_device *dev)
>                 /* Disable unused encoders */
>                 if (encoder->crtc == NULL)
>                         drm_encoder_disable(encoder);
> -               /* Disable encoders whose CRTC is about to change */
> -               if (encoder_funcs->get_crtc &&
> -                   encoder->crtc != (*encoder_funcs->get_crtc)(encoder))
> -                       drm_encoder_disable(encoder);
>         }
>  }
>
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index 0afaf58da40d..7c20b1c8b6a7 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -692,22 +692,6 @@ struct drm_encoder_helper_funcs {
>                                 struct drm_crtc_state *crtc_state,
>                                 struct drm_connector_state *conn_state);
>
> -       /**
> -        * @get_crtc:
> -        *
> -        * This callback is used by the legacy CRTC helpers to work around
> -        * deficiencies in its own book-keeping.
> -        *
> -        * Do not use, use atomic helpers instead, which get the book keeping
> -        * right.
> -        *
> -        * FIXME:
> -        *
> -        * Currently only nouveau is using this, and as soon as nouveau is
> -        * atomic we can ditch this hook.
> -        */
> -       struct drm_crtc *(*get_crtc)(struct drm_encoder *encoder);
> -
>         /**
>          * @detect:
>          *
> --
> 2.20.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
