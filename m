Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D9F38324F
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DED6E07B;
	Mon, 17 May 2021 14:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C786E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:49:37 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so5353187wmk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Gb5mgRL4+6/PqoPMRWjWc5hVld1HY479DWG+HSuLnb0=;
 b=MsbczrRXpvqcETyPTJVqweCa+G0dL5Qp8zez1ABnM3+DJevbvcJNIM8/uaWIsH/94G
 Fne2irt+FxFroWxWBgUny5dROsxcen74Rf7LAxrqYlSG/dbS4ocMib8z56k35son+db5
 itRFdHU+H0JqbdNNOImXpsfJkCZ1mSCfzieBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gb5mgRL4+6/PqoPMRWjWc5hVld1HY479DWG+HSuLnb0=;
 b=EABkq+FOJAoVJpYvmtkXTghR6xc3YK76Jd2mUnKYk7dh9xXSzl4pLzmIfiGNxo7qsc
 qc9Xr33luTmUx4qjEXEJEyGSUYwwkFa5ScZY94v2GQ97m+yr4Sl6kS+VmELOhualwRXd
 5SPT5ys4ZkNQRRuvY+lOTARk31rAv2FDJt0NSdBFZR8kfQj2yqgn97sqZaOx6e0VbdbT
 0Fy9GPmO16+VzLqjDCNMOBfbRPQSjIBypH+2FyQ1/+KYx9pL6vc+pVc4/GNn7sLQDcLW
 FtYI3712h3D6w0NYQ3eioWrssLiaqvJfIgGpDro8IYgTFxNqvRwkw6bz92WJDgeNpVaj
 sVSA==
X-Gm-Message-State: AOAM533j9BR9a2mKXACSSCGQDsX95eppKBIb1JHQs4cAvf+xvE2BWuJa
 mKKB6Jb1/49cRbL/FD5kMcqlbQ==
X-Google-Smtp-Source: ABdhPJygg9/BNOr5edlSA9Uk1jElrxZXz4wUaiU4wMx3GlgF6t47sdIfjmD49Brc2LEimFuQYD7Yhw==
X-Received: by 2002:a1c:638b:: with SMTP id x133mr314484wmb.182.1621262976280; 
 Mon, 17 May 2021 07:49:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s5sm15194919wmh.37.2021.05.17.07.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:49:35 -0700 (PDT)
Date: Mon, 17 May 2021 16:49:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Remove unused branch in legacy PCI initialization
Message-ID: <YKKCfV0S0os1jJGN@phenom.ffwll.local>
References: <20210516191918.20974-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516191918.20974-1-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 16, 2021 at 09:19:18PM +0200, Thomas Zimmermann wrote:
> The legacy PCI init code sets the drvdata for drivers with MODESET
> flag, but none of the old UMS drivers sets the flag. Remove the branch.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Yeah now that this is legacy-only it really doesn't make sense anymore.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_pci.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index 38c3cb72e7e6..f508f70e7a3f 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -165,9 +165,6 @@ static int drm_legacy_get_pci_dev(struct pci_dev *pdev,
>  	dev->hose = pdev->sysdata;
>  #endif
>  
> -	if (drm_core_check_feature(dev, DRIVER_MODESET))
> -		pci_set_drvdata(pdev, dev);
> -
>  	drm_legacy_pci_agp_init(dev);
>  
>  	ret = drm_dev_register(dev, ent->driver_data);
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
