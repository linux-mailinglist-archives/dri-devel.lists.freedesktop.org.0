Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E93FC260462
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 20:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6A289DB2;
	Mon,  7 Sep 2020 18:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A8189DB2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 18:17:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g4so16668138wrs.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 11:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=QAr1+0ipkVpkx5YO9BIZ97gdBS2//wH3zq/vWYPLIrs=;
 b=gI316Jq405Je2kwl9Dqk5oa+2uA8CtINsqRrQuzjeGDqNKqWJDnhaYrBjv04KRh5+r
 xzDWk/7Jj7r5+ew40cblbmARBwPs/aiUBtea76zjl1e5UEXCJJvLaq/grvlq7zijQiwW
 r8bHEPmG1AIVOklW4efeRnB9Ft1R9JZAinI2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=QAr1+0ipkVpkx5YO9BIZ97gdBS2//wH3zq/vWYPLIrs=;
 b=l6n4al948B62djdm6fcQIi8vlTRDg1Lk2Rq42guKFGxz2QxCb7r+7uWqwujqneLD/s
 lDmQo+L2yII0akbzMf0fplaqXEQ3SxAzQKAo0glsweXaqfbTcdPd6StjZoZIEjPmgJFG
 9iCMV2k3xbwSRjdQKRxwUBMKkJXrHyDpiI1FleulHlLBoUpP5NLPAcg2M8uL3e9QkGCh
 NPDZoGfLQL0xK3jZ/H64zM47XaPChnsDkAGDY+XgFefI2khQ6E1kaM0wJXE1+pRfmFSD
 hDiU1tSBEtaQouiTgUteq4IIiTPZRbwzTO+7nv2Dq7moNmU7qG71eFiEfJ7Qdb3pd+o8
 vD8w==
X-Gm-Message-State: AOAM5305c18rdf19vsqnoqNsLH/bi2ZWZF6O2R/CmtT2awNgLpDWDbzK
 Hatrmp2jdIZg5L7Hk/Nf75WeKsQpstd5NbmE
X-Google-Smtp-Source: ABdhPJwuITBLa7qo+WjXsX4qXTW2jiGBgHyMLzP5pTEfDes/HppbxX0Ga3nG3TPBjexQB4gCUQb0tQ==
X-Received: by 2002:adf:fa0c:: with SMTP id m12mr22363209wrr.406.1599502625885; 
 Mon, 07 Sep 2020 11:17:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c145sm26200523wmd.7.2020.09.07.11.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 11:17:05 -0700 (PDT)
Date: Mon, 7 Sep 2020 20:17:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bernard Zhao <bernard@vivo.com>
Subject: Re: [PATCH] gpu/drm: cleanup coding style a bit
Message-ID: <20200907181703.GD2352366@phenom.ffwll.local>
Mail-Followup-To: Bernard Zhao <bernard@vivo.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20200907123129.27905-1-bernard@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907123129.27905-1-bernard@vivo.com>
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
Cc: opensource.kernel@vivo.com, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2020 at 05:31:29AM -0700, Bernard Zhao wrote:
> Remove first assignment to info which is meaningless.
> Put the width and higth check first.
> This change is to make the code a bit readable.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>

Looks reasonable, thanks for your patch. Applied to drm-misc-next for
5.10.
-Daniel

> ---
>  drivers/gpu/drm/drm_framebuffer.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index df656366a530..2f5b0c2bb0fe 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -176,8 +176,7 @@ static int framebuffer_check(struct drm_device *dev,
>  	int i;
>  
>  	/* check if the format is supported at all */
> -	info = __drm_format_info(r->pixel_format);
> -	if (!info) {
> +	if (!__drm_format_info(r->pixel_format)) {
>  		struct drm_format_name_buf format_name;
>  
>  		DRM_DEBUG_KMS("bad framebuffer format %s\n",
> @@ -186,9 +185,6 @@ static int framebuffer_check(struct drm_device *dev,
>  		return -EINVAL;
>  	}
>  
> -	/* now let the driver pick its own format info */
> -	info = drm_get_format_info(dev, r);
> -
>  	if (r->width == 0) {
>  		DRM_DEBUG_KMS("bad framebuffer width %u\n", r->width);
>  		return -EINVAL;
> @@ -199,6 +195,9 @@ static int framebuffer_check(struct drm_device *dev,
>  		return -EINVAL;
>  	}
>  
> +	/* now let the driver pick its own format info */
> +	info = drm_get_format_info(dev, r);
> +
>  	for (i = 0; i < info->num_planes; i++) {
>  		unsigned int width = fb_plane_width(r->width, info, i);
>  		unsigned int height = fb_plane_height(r->height, info, i);
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
