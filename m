Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F4D370EE8
	for <lists+dri-devel@lfdr.de>; Sun,  2 May 2021 21:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 175166E558;
	Sun,  2 May 2021 19:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429D66E558
 for <dri-devel@lists.freedesktop.org>; Sun,  2 May 2021 19:57:01 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id v123so2498728ioe.10
 for <dri-devel@lists.freedesktop.org>; Sun, 02 May 2021 12:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=gPvAJZWsBKk4fZj6ZxVblFP0qVv/BbTQzC5g130CIKc=;
 b=djn7MnYka2JE6ZOVZTB7Eg6LXG95xsIJst2BFoo5N0tko2Rnadw7onBYUCOZakkPfP
 coDY82Ip6vwS1v0DxNpoYsM0iN6hgE62lfblpe+gvZXFPaSHOCMmuIjld8qzGGyEpe1C
 twUTjHRMETOlJyng0KYG5TjuYNozM4pwlIc1sMn8u3nq0Low+Pd9Dd48tF/XLmNqu1l2
 SCE9HQ5WO8DhhNxLpfHAl4/5yeGGp7kWwInyLK2xLQk21223e9dROz/KcJBKeqO2VOn0
 4L6o0h1W8BIRnhlTVuj76POPbyDho9DUskwYNHU7v0/aA9CL2mM7tZZrLYH1iyrHIUDP
 9byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=gPvAJZWsBKk4fZj6ZxVblFP0qVv/BbTQzC5g130CIKc=;
 b=RceHkqlfXgwa4dOL8v43vlTQXWoyINq9ey8UFtudQD1e8aa3z98e4qZym912qTzwkK
 LK4hFksEV9AcwKa1yfQgxPXDud4BAJ2Txs5xeOwTSDO7ZAFNXf02EkEwGe/HswxIYSN8
 48/bc55dE/6ci+EY8H2jZS3nEflYEkv5VnS3Uitdo1crvb8Xjg8OMxRyhfZLgAxH/Bxk
 TJjoW2LfzExq+G6CHA7iF4G9TwWmZ4KQ61vmA5OUryGnWOMwRt7V3lsuJY6uI/8PFBjU
 AgDGTU4+Hvw+nJkydKDh4IeDXqJiVCUZ9OBLSPvGLRxKp9J76FWJywVU9P79zgrz4ITD
 bArA==
X-Gm-Message-State: AOAM532HxqP6wL/2KzHKLVYP3jKDDgXCDMFkiht3IdryASmuik3Qiw6B
 e6xurJQ6J1w9xL7sZudo9NKw9Q==
X-Google-Smtp-Source: ABdhPJwA2XbIZCf4xVMYtaKt4mE+WndUq/OJuf7jI1g0LtSfmBA4vmYAF8D9Z55SteM5ydUUVMlbHw==
X-Received: by 2002:a05:6638:f:: with SMTP id
 z15mr15105656jao.26.1619985420644; 
 Sun, 02 May 2021 12:57:00 -0700 (PDT)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net.
 [71.237.100.236])
 by smtp.gmail.com with ESMTPSA id y10sm4468287ilv.73.2021.05.02.12.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 12:57:00 -0700 (PDT)
Date: Sun, 2 May 2021 13:56:58 -0600
From: Jordan Crouse <jordan@cosmicpenguin.net>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [Freedreno] [PATCH 5/5] drm/msm: deprecate MSM_BO_UNCACHED (map
 as writecombine instead)
Message-ID: <20210502195658.ijhfpuadarlykduw@cosmicpenguin.net>
Mail-Followup-To: Jonathan Marek <jonathan@marek.ca>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
References: <20210423190833.25319-1-jonathan@marek.ca>
 <20210423190833.25319-6-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423190833.25319-6-jonathan@marek.ca>
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 03:08:21PM -0400, Jonathan Marek wrote:
> There shouldn't be any reason to ever use uncached over writecombine,
> so just use writecombine for MSM_BO_UNCACHED.

Extremely correct.

> 
> Note: userspace never used MSM_BO_UNCACHED anyway
> 

Acked-by: Jordan Crouse <jordan@cosmicpenguin.net>

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 4 +---
>  include/uapi/drm/msm_drm.h    | 2 +-
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 2e92e80009c8..56bca9178253 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -201,10 +201,8 @@ void msm_gem_put_pages(struct drm_gem_object *obj)
>  
>  static pgprot_t msm_gem_pgprot(struct msm_gem_object *msm_obj, pgprot_t prot)
>  {
> -	if (msm_obj->flags & MSM_BO_WC)
> +	if (msm_obj->flags & (MSM_BO_WC|MSM_BO_UNCACHED))
>  		return pgprot_writecombine(prot);
> -	if (msm_obj->flags & MSM_BO_UNCACHED)
> -		return pgprot_noncached(prot);
>  	return prot;
>  }
>  
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index a92d90a6d96f..f075851021c3 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -94,7 +94,7 @@ struct drm_msm_param {
>  /* cache modes */
>  #define MSM_BO_CACHED        0x00010000
>  #define MSM_BO_WC            0x00020000
> -#define MSM_BO_UNCACHED      0x00040000
> +#define MSM_BO_UNCACHED      0x00040000 /* deprecated, use MSM_BO_WC */
>  #define MSM_BO_CACHED_COHERENT 0x080000
>  
>  #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
> -- 
> 2.26.1
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
