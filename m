Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E7F2DD10D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 13:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5684F8995F;
	Thu, 17 Dec 2020 12:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AE98995F
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 12:04:26 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d13so8083070wrc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 04:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2wLYK40yxY4jpQQjngRqoVMbNNXV5ofgjXJqRcamNKs=;
 b=bKDLuSABmSeQCnpg5JB8QGFqBRWx1Jd46uBy8MRo8+rIhYetWEt4rA7G69B36EOjAo
 YapzreMv6iFM1Pw2dJcXbsCbBgpvkW5vIj+tXzZ78WvWhDSISDOwVtJEoqJcO6NuqakL
 1p6NHeIfbP6LpftEdWV7JIurz+yBpj7qpIqSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2wLYK40yxY4jpQQjngRqoVMbNNXV5ofgjXJqRcamNKs=;
 b=cT5T1H9Up8m7NwQFHLbzp+Pv3PzPRSTS0FztTbUArAi17DNZRMSAgXt3BRGuHdHZ3d
 ihoKC16YFApI6I2lAuvRRk9ZdnlDdkRrJKZEXylajiDvS569OHpzd+lGSsmgRpNXkCUr
 uJW+mqjDb147nyvPeSIMHnNJoibtBzCvZSaaQ+n8jtw24Y8e/PwiKm/bzyEv47X9R9W6
 /qDv+r5C4CTPZf7JdmKw7y9HIWrrIgt7v8nNPvwApE2tl+YG08YS+oVO70Lb5H595Lm2
 NwwpW2gi7O8/ebtsjrhK9k14840P0zAJfFKODqMqzPwVg80INUPmfn8/H1OCoCV4OfPF
 r0Hw==
X-Gm-Message-State: AOAM532VtuYRWgOCqJ/ORO/1Ua/xXS6YOcDP1Aa0tuPNxRPhiaH8AicV
 Jei4a4qKttoAKHMUwy4EjtMppg==
X-Google-Smtp-Source: ABdhPJz5rsKeOXUpUKoaOBushHBh6oHjxah+YxMIX6V+w2BWtM1u8ybu56yaeFJec519mNf2pY70pg==
X-Received: by 2002:adf:e94c:: with SMTP id m12mr37872643wrn.141.1608206665241; 
 Thu, 17 Dec 2020 04:04:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k1sm8575316wrn.46.2020.12.17.04.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 04:04:24 -0800 (PST)
Date: Thu, 17 Dec 2020 13:04:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 3/9] drm/doc: fix reference to drm_format_modifier_blob
Message-ID: <X9tJRr9WLOoqf2mL@phenom.ffwll.local>
References: <20201217113220.102271-1-contact@emersion.fr>
 <20201217113220.102271-4-contact@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217113220.102271-4-contact@emersion.fr>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 12:32:14PM +0100, Simon Ser wrote:
> The documentation build system recognizes "struct XXX" references and
> generates links for them.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_plane.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 4c1a45ac18e6..4a66374dc355 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -68,9 +68,9 @@
>   *
>   * IN_FORMATS:
>   *     Blob property which contains the set of buffer format and modifier
> - *     pairs supported by this plane. The blob is a drm_format_modifier_blob
> - *     struct. Without this property the plane doesn't support buffers with
> - *     modifiers. Userspace cannot change this property.
> + *     pairs supported by this plane. The blob is a struct
> + *     drm_format_modifier_blob. Without this property the plane doesn't
> + *     support buffers with modifiers. Userspace cannot change this property.
>   */
>  
>  static unsigned int drm_num_planes(struct drm_device *dev)
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
