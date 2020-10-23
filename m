Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 829F0296F04
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06166E51A;
	Fri, 23 Oct 2020 12:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9EC6E528
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:25:23 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l15so1307202wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=FInTsrlxn5zRrEYVhBvIObLdmzQifIc9746GM4j/Irs=;
 b=XO34PK2FsWX5JnNWrqjfHEege4GU2+FcPa7J5PWjn78LfRsI2hbCiNh2NGoG6NqsHn
 1uH395uJINpiNH9g2093a0ym8EVnmwx3sahbml48jBWZ+qFcUAAtkJ2hVNioTjHsM25q
 Rp9jiRBzMM/eqMO4tFgfm6W0FRRXY6iDzsBf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FInTsrlxn5zRrEYVhBvIObLdmzQifIc9746GM4j/Irs=;
 b=DRVkWtDb3OWlln6EiMYqHzwKZFceP0WaVcTOndzGdqdPyc+1+pniD1ctfsrUgD30Uo
 q0OOlkDgbXEwlMsWGABNoMfxEZT0YDgG6w5boNBq/8u2wnKMKtX0Sj0lQIsEU82pyetP
 eiBQ3A7w06CCu+RMts22BVB2lIc2IU1gsAmPQK96h9yW6iCef3cSQjjwq49x7WXpQ2lO
 sg9MhCGSD6yo6/be/0NhcSy5+KSNndQPMP99YG7Hkz6xsgK1kk4MxfDQ2AVNbsmxPXBi
 mwzXexQtXXYZMmvIq6Br+R3AHmdmOOi7/y+bouX+nzpOPBrzraxiJEkzJICM6ikD3/j4
 phCQ==
X-Gm-Message-State: AOAM5327Vac/ALP5XcdZZSjDv4UVO8PkEJFJ3eXfN78XkGLCOVRQK+o9
 KW7IXtbilb2PhkRwWNYBdwnufwa9sf0Fs6Ek
X-Google-Smtp-Source: ABdhPJz4yulKhVN53rEdvLQIKbyL8+Zwu+9oYZYlSsPFjUVw8TP9MnAIZ9AfupumbxNzHyumB/d1HQ==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr2149633wmq.171.1603455918522; 
 Fri, 23 Oct 2020 05:25:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i33sm3079508wri.79.2020.10.23.05.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:25:17 -0700 (PDT)
Date: Fri, 23 Oct 2020 14:25:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 01/65] drm/vc4: Drop legacy_cursor_update override
Message-ID: <20201023122516.GA401619@phenom.ffwll.local>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 02:21:12PM +0200, Daniel Vetter wrote:
> With the removal of helper support it doesn't do anything anymore.
> Also, we already have async plane update code in vc4.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Maxime Ripard <mripard@kernel.org>

Apologies for this patch bomb, typoed git send-email command.
-Daniel

> ---
>  drivers/gpu/drm/vc4/vc4_kms.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 149825ff5df8..bf0da77ab2e6 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -353,12 +353,6 @@ static int vc4_atomic_commit(struct drm_device *dev,
>  		return 0;
>  	}
>  
> -	/* We know for sure we don't want an async update here. Set
> -	 * state->legacy_cursor_update to false to prevent
> -	 * drm_atomic_helper_setup_commit() from auto-completing
> -	 * commit->flip_done.
> -	 */
> -	state->legacy_cursor_update = false;
>  	ret = drm_atomic_helper_setup_commit(state, nonblock);
>  	if (ret)
>  		return ret;
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
