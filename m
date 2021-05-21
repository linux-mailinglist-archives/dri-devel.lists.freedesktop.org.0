Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD1638CA1F
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 17:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F026E933;
	Fri, 21 May 2021 15:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436906EB0E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 15:31:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so7372685wmf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BQooRokNzYu+8L1z5m8iD9Xdikuak2pvynvEV5qLXGA=;
 b=i+dVyKE9llJ409BIktxahKJ2hedAcOuyBrShYy27YcSgdX+KQPWeCnIYejwgJ1lk2N
 IPTXfZKemezA+Cno3dHOoDgwZX2lR0OrCSMzfTVUmR/LrzaB1zBx51kjJUg8va+iRLO4
 5guxjCj1e/w1Ef/otGl5Ti6AY5n0oFfvok/h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BQooRokNzYu+8L1z5m8iD9Xdikuak2pvynvEV5qLXGA=;
 b=s2bJmt7Hvb0QUcc/nrbnO1SQEZwCtFJmwZ6AZJfsc5oSC1joJYDBQxO+UEqeAcikBX
 KRZzp7/WPKDOZDW2dt1D5rwyRB+yH6Pxzxyv3wSmco4ZBVx68Ug3SFlvOLfnJA2qOmL9
 UdTwn8yQmiBtvHPSSOLoTJ38BsQqik5m7kU1aexu7S4o2wGSteuoQtTt4NfXTbO6b2zx
 XpQ3aLS3DvGTALR8FDH1dj1k1W8eX2AUU8dfVVZJRJGsChseoeGF5PKxDtlVk//4dYMO
 khdmRJolVwEiGABOx0T9hfmbZUl84bNEP7dcKjg6ePwMoq9jhwDV9PbPsPKC3K+UvHjS
 kUlA==
X-Gm-Message-State: AOAM532LRBX7zXBmb7Zy0mkvKc/jR54TsPVegU4zRFrEEVDzxwf4lwwc
 FQyh3R4jx3bOLY7IZXvKIzNe9w==
X-Google-Smtp-Source: ABdhPJxHXpkSiCSjtUwFEOSowutWtJr5778QWzm3dwsHfDEBRBsOsd4q7nG7TA7B3jciQ3PNG0+RrA==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr9417366wml.168.1621611096262; 
 Fri, 21 May 2021 08:31:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l16sm9195415wmj.47.2021.05.21.08.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 08:31:35 -0700 (PDT)
Date: Fri, 21 May 2021 17:31:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH v2] drm/exynos: Use pm_runtime_resume_and_get() to
 replace open coding
Message-ID: <YKfSVdw16TPLlEKX@phenom.ffwll.local>
References: <1621587966-62687-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621587966-62687-1-git-send-email-tiantao6@hisilicon.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: linux-samsung-soc@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 05:06:06PM +0800, Tian Tao wrote:
> use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle.

It would be good to explain why: Apparently get_sync increments the
refcount even if it fails, which ususally leads to leaks.

With that or similar added to the commit message:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
> 
> v2: drop unnecessary change about if condition.
> ---
>  drivers/gpu/drm/exynos/exynos_drm_mic.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> index 3821ea7..32672bf 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> @@ -268,11 +268,9 @@ static void mic_pre_enable(struct drm_bridge *bridge)
>  	if (mic->enabled)
>  		goto unlock;
>  
> -	ret = pm_runtime_get_sync(mic->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(mic->dev);
> +	ret = pm_runtime_resume_and_get(mic->dev);
> +	if (ret < 0)
>  		goto unlock;
> -	}
>  
>  	mic_set_path(mic, 1);
>  
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
