Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1C519A85E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 11:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3FE6E903;
	Wed,  1 Apr 2020 09:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AB86E397
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 09:13:13 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f6so6273572wmj.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 02:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ckUnlqZbRf6qeaBTbJFryu/u6Vi9FFlQlipIjefCLpg=;
 b=jwm5DxMjueH91yG6n0WGMXKQ9DBkPYd0oo2X/kWafpUghwMO9IlFuhv5sZVPY4NHU4
 GG+k/aFnOn5Ox2pe5UnzIT2z0SlW+UXS4Rvt0UcWvoFYhGqOHh3K2GpccaspE2ZbS7ue
 PT0LuPdkXz+JcRqz9sOlXmt08r57uAmNRR+ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ckUnlqZbRf6qeaBTbJFryu/u6Vi9FFlQlipIjefCLpg=;
 b=sKQjiAI3UnkwMFs3lTwflupeezJnkaPwEf2SyDVacrIzji3MPYtDCrlnuvJFop/tQy
 NVVv+NSU7Zfhf7LzC2c7wOcelm0gUv+EKkZeYY1cu/PoPusXm90z+uw1PAt5UINYm7sm
 +h/HgpOE/etSP/F+gCs3+b++glD7P/zJHsryJMtT01a9hQvAQmWx+6eFg1nMtCd+HXgh
 7c1h19CRpAIlaeZ9DAg3PA03yewdX9Tvs5CAbUdPfFNEM2EbUngvRqJsCF3BvtrWjfP2
 UCLO2aj2MhnfVCv6RfH9AZ5EqF5qvOiDBnbkFlWY7jAVcpTvaRs+BM1B4PNlD6aoq9oa
 3s1w==
X-Gm-Message-State: AGi0PubjOsjRSNJn15FROP7H6pqlg1owoxqHMH1Mdq3P9g/sGzBilbHs
 rG5DYN0y2jYq9a0sG+HkEIhbvozYt0HXBQ==
X-Google-Smtp-Source: APiQypIfveCV/WTNgXAs2FkrkDenMNRSnvsxK1yzl8wm54DsEYkXOHtU+9l915nEc3XG7J7dpyJMcQ==
X-Received: by 2002:a1c:9e16:: with SMTP id h22mr3247042wme.27.1585732391974; 
 Wed, 01 Apr 2020 02:13:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b7sm2032149wrn.67.2020.04.01.02.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 02:13:11 -0700 (PDT)
Date: Wed, 1 Apr 2020 11:13:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH 1/2] drm/core: Use proper debugging macro
Message-ID: <20200401091309.GP2363188@phenom.ffwll.local>
References: <CAKMK7uE67t-qWLXNo5FHDUubVWdb+sDxF=yijtM-0n626d-10g@mail.gmail.com>
 <20200331155308.6345-1-andrzej.p@collabora.com>
 <20200331155308.6345-2-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200331155308.6345-2-andrzej.p@collabora.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 James Wang <james.qian.wang@arm.com>, dri-devel@lists.freedesktop.org,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 05:53:07PM +0200, Andrzej Pietrasiewicz wrote:
> Use drm_dbg_kms() instead of DRM_DEBUG_KMS.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 7e3982c36baa..6fb1841fa71c 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -331,9 +331,9 @@ static int drm_gem_afbc_min_size(struct drm_device *dev,
>  	case AFBC_FORMAT_MOD_BLOCK_SIZE_64x4:
>  	case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8_64x4:
>  	default:
> -		DRM_DEBUG_KMS("Invalid AFBC_FORMAT_MOD_BLOCK_SIZE: %lld.\n",
> -			      mode_cmd->modifier[0]
> -			      & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK);
> +		drm_dbg_kms(dev, "Invalid AFBC_FORMAT_MOD_BLOCK_SIZE: %lld.\n",
> +			    mode_cmd->modifier[0]
> +			    & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK);
>  		return -EINVAL;
>  	}
>  
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
