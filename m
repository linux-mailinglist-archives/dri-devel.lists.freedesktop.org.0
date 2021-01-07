Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A6C2ED4EB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 18:01:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F6C6E46B;
	Thu,  7 Jan 2021 17:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D366E46B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 17:01:46 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id q75so6161473wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 09:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YC939lZu3XArQRLxODTHizuh8cYijZfhndLDZ+M1mbU=;
 b=WNMsqwxxu2Eb+9oDzHoG9oHkWytbGqvmfYOpZNxY+vb09otwL7+t14EP7Qx+CzACnC
 ofL1i2uS2180qdLHC7jfzXd/tngyG+csxvercS9PyY9eAMHHgWI67Nicw+0+e1b/u7Hh
 QhWZJyRocr9FiW2WGaKQGYj3bT1bHn/4NSWTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YC939lZu3XArQRLxODTHizuh8cYijZfhndLDZ+M1mbU=;
 b=fj7uXvTXUeY0CREvxDXvpLwru+8PVlVB5SULVQiBPkBgXKTbfhDpGPvdatGRS9QXv2
 JWgwIzeTnfLrWfJqEp2rF8hHG703lGItCOQS0hCs4oN/DGw/xnrPOxgHD0hX8AC5IxE4
 nG44jW2ypyw/zlnJ2rp8nrH0uXlTz3f+YhhyS0kSLdlvFrvhlvcuAy5UXYkSNx25tuxw
 4n9TQ9+y3oppdySEu4CoEf4/rCHwtLkGw3E78seprwWzCmj/zYscxSuDIUvMvc8BqLG3
 ZYNpDYGgKkPU/Q7hrZilGPxJv/SZmt2AElw5xYFwe0f2/IeiBg40F7fUBEw9rWQ/dfpt
 vdLA==
X-Gm-Message-State: AOAM532/8C9MwlrJgcfvUZ6NOJ01FeGsa5fV/wynfcprm4swMJRZ+Lv7
 rRPghI0SBTj5X1uUv7FMHzpjdg==
X-Google-Smtp-Source: ABdhPJz3uFRZutfGtvEYA0JO9+wFgcjMDca874zIbOePszrDbfkNYjx6VVoXCi7dje2lhe2MVbGtVQ==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr8905935wml.74.1610038904917; 
 Thu, 07 Jan 2021 09:01:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y63sm8759768wmd.21.2021.01.07.09.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 09:01:44 -0800 (PST)
Date: Thu, 7 Jan 2021 18:01:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/pci: Use pcim_enable_device()
Message-ID: <X/c+dp2HaVpe2QDI@phenom.ffwll.local>
References: <1609151996-52706-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1609151996-52706-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 28, 2020 at 06:39:56PM +0800, Tian Tao wrote:
> Using the managed function simplifies the error handling. After
> unloading the driver, the PCI device should now get disabled as
> well.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

We cant do this in core code because it changes the order of how the
cleanup code is done. Also this is legacy code, pls don't touch that, not
worth the effort :-)
-Daniel

> ---
>  drivers/gpu/drm/drm_pci.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index 6dba4b8..0616172 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -207,7 +207,7 @@ static int drm_get_pci_dev(struct pci_dev *pdev,
>  	if (IS_ERR(dev))
>  		return PTR_ERR(dev);
>  
> -	ret = pci_enable_device(pdev);
> +	ret = pcim_enable_device(pdev);
>  	if (ret)
>  		goto err_free;
>  
> @@ -234,7 +234,6 @@ static int drm_get_pci_dev(struct pci_dev *pdev,
>  
>  err_agp:
>  	drm_pci_agp_destroy(dev);
> -	pci_disable_device(pdev);
>  err_free:
>  	drm_dev_put(dev);
>  	return ret;
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
