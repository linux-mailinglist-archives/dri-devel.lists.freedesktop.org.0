Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB064493CAF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 16:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B5510E155;
	Wed, 19 Jan 2022 15:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5368A10E155
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 15:11:21 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 o7-20020a05600c510700b00347e10f66d1so4728844wms.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 07:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=izxGGQW6Yc7uP2xkbN05zLxPnUarfXqJHNM0MzCtvc4=;
 b=dMUGZpy6EppePcB7SWnRxhl/NhTUsHy0swVs23SVdLsP26NHoI85d+FU/cI9J7KYXr
 3cC5V9mQOqwaY4lzgq3SkdBCUmfFUeSNgqYTx5FA8obC5OdRXQK4mG+PiykgRBsZ5I2f
 t1LGFvuwOzAPLgZ8ueQTLCArOGvsv8SoDNJyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=izxGGQW6Yc7uP2xkbN05zLxPnUarfXqJHNM0MzCtvc4=;
 b=kwW707hhZrL2vFm9B9B7aARm1yOeNS4/8/bReT2LcAgAm89TtALeStEyRCSpx8s3ZX
 migRojA4ESn+ynNb/0o0Lsg2R5MBjnv4g8lj7JB/+ZB67zz+TjHFg50oSZJtltJlwNmf
 S+8KGar5uNycHpyzhQLa0Kh+8jOtO3p+rgS6GeDXMEaVoTRPX/rrDsv83Xaaa06Ts8GK
 J+uWXMpe9I+U6kIHX7foWmFmXqbaSZMDau7KwYzW+kkrNMrUqNawPaCNR4Ae2Y06hWxm
 qSrsA7ndUXEH0MMOqicK5wT3c/4Kb6HgmZIO1bZs+FL9euod/u98CH+itvNuklzn3yS2
 pg9Q==
X-Gm-Message-State: AOAM5320ofr4kgAcbNBJf72TIRqevw5qtFIlE3aq5UcqnMQzGIc9FiFc
 F9glEiNlGKO3zV8a/4UbWnzsuw==
X-Google-Smtp-Source: ABdhPJwWKiX3b84nnqbVBf7hcUVuHA9efXM1lkEC5jf1AhuqPLNvBna1jfZ+WafG/7T1KG+RL1jw4g==
X-Received: by 2002:a5d:6643:: with SMTP id f3mr5252221wrw.709.1642605079775; 
 Wed, 19 Jan 2022 07:11:19 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm7348470wmp.9.2022.01.19.07.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:11:19 -0800 (PST)
Date: Wed, 19 Jan 2022 16:11:17 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH RESEND] drm/doc: Fix TTM acronym
Message-ID: <YegqFcqrakvn30QA@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220107180230.132666-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220107180230.132666-1-jose.exposito89@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: tzimmermann@suse.de, corbet@lwn.net, airlied@linux.ie,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 07, 2022 at 07:02:30PM +0100, José Expósito wrote:
> The TTM acronym is defined for the first time in the documentation as
> "Translation Table Maps". Afterwards, "Translation Table Manager" is
> used as definition.
> 
> Fix the first definition to avoid confusion.
> 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>

Applied to drm-misc-next, thanks for the patch.
-Daniel

> ---
>  Documentation/gpu/drm-mm.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index e0538083a2c0..198bcc1affa1 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -8,7 +8,7 @@ the very dynamic nature of many of that data, managing graphics memory
>  efficiently is thus crucial for the graphics stack and plays a central
>  role in the DRM infrastructure.
>  
> -The DRM core includes two memory managers, namely Translation Table Maps
> +The DRM core includes two memory managers, namely Translation Table Manager
>  (TTM) and Graphics Execution Manager (GEM). TTM was the first DRM memory
>  manager to be developed and tried to be a one-size-fits-them all
>  solution. It provides a single userspace API to accommodate the need of
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
