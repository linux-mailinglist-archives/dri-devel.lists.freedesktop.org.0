Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EFA3C77B8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 22:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3259892C9;
	Tue, 13 Jul 2021 20:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E8A892C9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 20:16:37 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id m18so2682500oie.9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 13:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kWmG87OBfKJjD9lA4wSJHMVVBLbAlRhYy4nBRpAJEk0=;
 b=QGIz60UlVzcmmo4cRwyPGEMGHIhn1alpxZR7Y2r2BnlrVw0elABLHwAqyIMcSsUR4R
 by2EHgV8idmfrkWZ0FDHkQi+0ejBQwINfnlNY80mTcCsf+CWPRwk2RqvHTdhhVXOj4HX
 nyuxgJvCv2svvrj6IwNlny3Q0Szg0+XnFLfao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kWmG87OBfKJjD9lA4wSJHMVVBLbAlRhYy4nBRpAJEk0=;
 b=VghYbVqgbtAgHyUtrRx4xw20W1ac6pcXQVBR9WZKbGZpOtmN4dkpIt1gBr6vaocDj8
 C0WNq6f038FdhnBz5uz/685FuEWUCQTQ92vgs+DIAcZsQTbFWMbNpR8OINA2el3CA1uo
 cdfEfLoUM3rn1TFo6wQL7kh2sQ/XsiMZV3G3ggQLYO4KQ8OpTTZxwyU2aw7ommkISYyv
 h/KI6nd/fZqCTKJxhri60oK0zR4BM6ue3m5qXO/C2GyGixyctiExqJ+GqcXcZCoRuSHt
 /OwR9us52zY3JEs/9F1AH9XvWrAet5cZyjcB+FdQpJ2BhSisZU6yCtpeNdbRIFBELXr3
 ZSnQ==
X-Gm-Message-State: AOAM532Kewtva2ZLFmYm7zPQfCevItfBMZ6wc+R+sNKIyNnqKbFzCiQi
 oPHd2lmM5TOUYk46uoD1m63xzxNvGzz1t/0/hNsqkA==
X-Google-Smtp-Source: ABdhPJzgqYtqt3vfDkGjO+FO23C+VLDSZGsOHtuG4uvhyW6iIxdNU73WnLXcR85GafWL74S/qELp+rr4NbIqrfaoaPs=
X-Received: by 2002:aca:3085:: with SMTP id w127mr875654oiw.101.1626207396895; 
 Tue, 13 Jul 2021 13:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210713193257.958852-1-sam@ravnborg.org>
In-Reply-To: <20210713193257.958852-1-sam@ravnborg.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 13 Jul 2021 22:16:26 +0200
Message-ID: <CAKMK7uGSgOP2E=Uw1gXJ7RbY+6M7gq1K4uC09Ct0=1Yu_i36Aw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm: bridge: Mark mode_fixup deprecated
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 9:33 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Make it obvious that mode_fixup is deprecated and new drivers shall use
> atomic_check.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  include/drm/drm_bridge.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 46bdfa48c413..668f14234459 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -136,6 +136,9 @@ struct drm_bridge_funcs {
>          *
>          * NOTE:
>          *
> +        * This is deprecated, do not use!
> +        * New drivers shall use &drm_bridge_funcs.atomic_check.

Bit a bikeshed, but in the rendered text this will be one line, I'd
just merge it. Also since this is a reference within the same struct
just use @atomic_check.

Now the real review: There's a pile more of these in
drm_modeset_helper_vtables.h (well in crtc and encoder funcs, so only
two, a small pile). Can you pls fix those up too? With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +        *
>          * This function is called in the check phase of atomic modesets, which
>          * can be aborted for any reason (including on userspace's request to
>          * just check whether a configuration would be possible). Drivers MUST
> --
> 2.30.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
