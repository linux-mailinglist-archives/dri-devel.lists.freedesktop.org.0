Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA0F8094EB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 22:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC8510E994;
	Thu,  7 Dec 2023 21:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0266C10E991
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 21:51:26 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a1e25a49603so39244766b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 13:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1701985885; x=1702590685; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=h+sBLPiRdjutZhx3Z0XkNyZrVzTNUc70a0nDro7+QE4=;
 b=BKwvKUCMiu3nLOQda7uIX7DWGGiYdDp5TXr94APyn5kaFm7dwlb7KC1YG62TXL70rW
 vX251SiL82wXr+oBPo3uB4PYSTj700lMfNGPLTfv3YXga9zuIChfuRbnCdMsCoVKN7pe
 MIIGfeFzOvUz6FkabOuetCZ6MIWLiTbb7J/Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701985885; x=1702590685;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h+sBLPiRdjutZhx3Z0XkNyZrVzTNUc70a0nDro7+QE4=;
 b=QXxCT9nF5P5Glb8w55jjH2vL+PvArNjOjZcEJsgkAXBMM0vdfK+HwtclN33ybOmd/O
 pQ9ZdUNqugouSULowpDOj5bRsEaggaoBMoPwxEpzr/faa0BRYPHPEJZd2GGeRPBSDqs5
 RCVDIdwNVdRA+di6XFyKkoaVXpbZJlGK8o5W3EwDgNSMRqQ+GpLKssr1qXTjM1coHEY0
 pTdWK7OjOjpQq8nV1uEzSjJwUxXs0Mavx8MrRC5UNrgwy2bueVYOsvP/kKdK5mFjbCm0
 3Vf69K4AVImGciHsPf+3bkePDLJCxZtXpKCR+XTdNw+SHs+ggWvVLL/NHu4G1FgCCPni
 q0cA==
X-Gm-Message-State: AOJu0YznRN4qokD83oKTatwC0BhK3ZJTBzSlhbJ5ZscYqbcMxSKiMwqN
 Jq5/RERI9ca+SzwTR5kSItAi8g==
X-Google-Smtp-Source: AGHT+IGcdXtJolG9OsQ3Jl/Ao5gvnNzgottx5ogMnNm3+UagwMka1LovkKEKL2ff5nXL/XXZp0DoJA==
X-Received: by 2002:a17:906:395a:b0:a1c:64c9:6136 with SMTP id
 g26-20020a170906395a00b00a1c64c96136mr3744785eje.3.1701985885361; 
 Thu, 07 Dec 2023 13:51:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 fj17-20020a1709069c9100b00a1e4cae6b22sm231556ejc.41.2023.12.07.13.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 13:51:24 -0800 (PST)
Date: Thu, 7 Dec 2023 22:51:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 5/5] drm/todo: Add entry to rename drm_atomic_state
Message-ID: <ZXI-WwQCHbvI5g0Q@phenom.ffwll.local>
References: <20231204121707.3647961-1-mripard@kernel.org>
 <20231204121707.3647961-5-mripard@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204121707.3647961-5-mripard@kernel.org>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 04, 2023 at 01:17:07PM +0100, Maxime Ripard wrote:
> The name of the structure drm_atomic_state is confusing. Let's add an
> entry to our todo list to rename it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  Documentation/gpu/todo.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index b62c7fa0c2bc..fe95aea89d67 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -120,6 +120,24 @@ Contact: Daniel Vetter, respective driver maintainers
>  
>  Level: Advanced
>  
> +Rename drm_atomic_state
> +-----------------------
> +
> +The KMS framework uses two slightly different definitions for the ``state``
> +concept. For a given object (plane, CRTC, encoder, etc., so
> +``drm_$OBJECT_state``), the state is the entire state of that object. However,
> +at the device level, ``drm_atomic_state`` refers to a state update for a
> +limited number of objects.

That's a very generous description of my screw-up of calling a commit a
state and making a big mess out of a lot of concepts :-)

> +
> +The state isn't the entire device state anymore, but only the full state of

s/anymore// since it was always meant to be an incremental/partial
update/commit structure.

> +some objects in that device. This is confusing to newcomers, and
> +``drm_atomic_state`` should be renamed to something clearer like
> +``drm_atomic_update``.

My choice would be drm_atomic_commit, because that's what we're calling
these everywhere else in the code. See drm_crtc_commit for the per-crtc
tracking thing of a drm_atomic_commit. If you want update, there's quite a
lot of other things we also need to rename to the _update suffix.

Also this should have some pointers to the functions that need adjusting,
like drm_atomic_state_alloc|get/put/init/.... since without also renaming
those this is just going to create even more confusion.

With my comments addressed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
> +Contact: Maxime Ripard <mripard@kernel.org>
> +
> +Level: Advanced
> +
>  Fallout from atomic KMS
>  -----------------------
>  
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
