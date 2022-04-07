Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3C04F7AF7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE5610E741;
	Thu,  7 Apr 2022 09:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E7910E0F2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:03:24 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id q26so5593950edc.7
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 02:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=W+1rOYPnAZkSAoFE9WFZU5G0otnwYX5qic+yQYdsVYw=;
 b=ikVAtHHNfS1qoYViGuL94fCuQ8C+sS0IgCobHN4E5+VSj6BZL+yj96oOWGAUUkJR6j
 NRB1pT3xl3CiOTSvTd6VKHK50u0XaKBOmFDpQNAb1T85d611C2juxICUAgCCXG7prKLe
 nXmGV880tstI6aOa/b2NvPHEJAJZP0kATx3Sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=W+1rOYPnAZkSAoFE9WFZU5G0otnwYX5qic+yQYdsVYw=;
 b=q7oSdAbF4Bf/T/GcVgoL9IdEGXaAFHth5GHnOo9jU1uXYZ7H5ax1NMYQEA5wz0Gd4C
 ++W6fWh7AEVpZwziI2k3n7ysddvqLydHXeiOFoiJFMgCwzq2NQsfxFUBdouBoV6n5GZz
 WKX5NmZEjciAUdeza4gUzSNed6nmSjcgHBE4k9ZyUjzCIXCc6e3BSEtx+1uSfhusIPHw
 eXWoYPPpiiWlIJ3NLmpoWhHJv05VZKRvydbH/v924/dkzMvtajiLpW/gfyS92o0bGY+P
 5gbdHTR85ehPyZ/5anThZBpQAJlumcoZd9BunsVc75u6VlvaCJg9bHnBvpfLcoaGCP6x
 kKKw==
X-Gm-Message-State: AOAM531wQTrhACmeX1dhIa6pQjrAslke3pOEH2ldBH1qN3ZmjPQJ+fuc
 wdMWzehEKBylGaEMaoEeeJ/LrA==
X-Google-Smtp-Source: ABdhPJwiSCGjhBdoXYK5Nvas9Re2eGRnUUUVEvu1QLTjngawJF0jewMmPTqZfm9TwzhKEP8c0Pm7GQ==
X-Received: by 2002:a05:6402:438d:b0:419:4550:d52b with SMTP id
 o13-20020a056402438d00b004194550d52bmr12998429edc.83.1649322203124; 
 Thu, 07 Apr 2022 02:03:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a50bf0d000000b0041cdd9c9147sm3857173edk.40.2022.04.07.02.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 02:03:22 -0700 (PDT)
Date: Thu, 7 Apr 2022 11:03:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [RESEND RFC PATCH 1/5] firmware: sysfb: Make
 sysfb_create_simplefb() return a pdev pointer
Message-ID: <Yk6o2MzkMQeSAcsb@phenom.ffwll.local>
Mail-Followup-To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Borislav Petkov <bp@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miaoqian Lin <linmq006@gmail.com>
References: <20220406213919.600294-1-javierm@redhat.com>
 <20220406213919.600294-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406213919.600294-2-javierm@redhat.com>
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
Cc: Miaoqian Lin <linmq006@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 06, 2022 at 11:39:15PM +0200, Javier Martinez Canillas wrote:
> This function just returned 0 on success or an errno code on error, but it
> could be useful to sysfb_init() to get a pointer to the device registered.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

You need to rebase this onto 202c08914ba5 ("firmware: sysfb: fix
platform-device leak in error path") which fixes the same error path leak
you are fixing in here too. Or we just have a neat conflict when merging
:-) But in that case please mention that you fix the error path leak too
so it's less confusing when Linus or someone needs to resolve the
conflict.

Anyway Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
> 
>  drivers/firmware/sysfb.c          |  4 ++--
>  drivers/firmware/sysfb_simplefb.c | 24 +++++++++++++++---------
>  include/linux/sysfb.h             | 10 +++++-----
>  3 files changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 2bfbb05f7d89..b032f40a92de 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -46,8 +46,8 @@ static __init int sysfb_init(void)
>  	/* try to create a simple-framebuffer device */
>  	compatible = sysfb_parse_mode(si, &mode);
>  	if (compatible) {
> -		ret = sysfb_create_simplefb(si, &mode);
> -		if (!ret)
> +		pd = sysfb_create_simplefb(si, &mode);
> +		if (!IS_ERR(pd))
>  			return 0;
>  	}
>  
> diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
> index 76c4abc42a30..c42648ed3aad 100644
> --- a/drivers/firmware/sysfb_simplefb.c
> +++ b/drivers/firmware/sysfb_simplefb.c
> @@ -57,8 +57,8 @@ __init bool sysfb_parse_mode(const struct screen_info *si,
>  	return false;
>  }
>  
> -__init int sysfb_create_simplefb(const struct screen_info *si,
> -				 const struct simplefb_platform_data *mode)
> +__init struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
> +						     const struct simplefb_platform_data *mode)
>  {
>  	struct platform_device *pd;
>  	struct resource res;
> @@ -76,7 +76,7 @@ __init int sysfb_create_simplefb(const struct screen_info *si,
>  		base |= (u64)si->ext_lfb_base << 32;
>  	if (!base || (u64)(resource_size_t)base != base) {
>  		printk(KERN_DEBUG "sysfb: inaccessible VRAM base\n");
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  	}
>  
>  	/*
> @@ -93,7 +93,7 @@ __init int sysfb_create_simplefb(const struct screen_info *si,
>  	length = mode->height * mode->stride;
>  	if (length > size) {
>  		printk(KERN_WARNING "sysfb: VRAM smaller than advertised\n");
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  	}
>  	length = PAGE_ALIGN(length);
>  
> @@ -104,25 +104,31 @@ __init int sysfb_create_simplefb(const struct screen_info *si,
>  	res.start = base;
>  	res.end = res.start + length - 1;
>  	if (res.end <= res.start)
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>  
>  	pd = platform_device_alloc("simple-framebuffer", 0);
>  	if (!pd)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>  
>  	sysfb_apply_efi_quirks(pd);
>  
>  	ret = platform_device_add_resources(pd, &res, 1);
>  	if (ret) {
>  		platform_device_put(pd);
> -		return ret;
> +		return ERR_PTR(ret);
>  	}
>  
>  	ret = platform_device_add_data(pd, mode, sizeof(*mode));
>  	if (ret) {
>  		platform_device_put(pd);
> -		return ret;
> +		return ERR_PTR(ret);
>  	}
>  
> -	return platform_device_add(pd);
> +	ret = platform_device_add(pd);
> +	if (ret) {
> +		platform_device_put(pd);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return pd;
>  }
> diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
> index b0dcfa26d07b..708152e9037b 100644
> --- a/include/linux/sysfb.h
> +++ b/include/linux/sysfb.h
> @@ -72,8 +72,8 @@ static inline void sysfb_apply_efi_quirks(struct platform_device *pd)
>  
>  bool sysfb_parse_mode(const struct screen_info *si,
>  		      struct simplefb_platform_data *mode);
> -int sysfb_create_simplefb(const struct screen_info *si,
> -			  const struct simplefb_platform_data *mode);
> +struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
> +					      const struct simplefb_platform_data *mode);
>  
>  #else /* CONFIG_SYSFB_SIMPLE */
>  
> @@ -83,10 +83,10 @@ static inline bool sysfb_parse_mode(const struct screen_info *si,
>  	return false;
>  }
>  
> -static inline int sysfb_create_simplefb(const struct screen_info *si,
> -					 const struct simplefb_platform_data *mode)
> +static inline struct platform_device *sysfb_create_simplefb(const struct screen_info *si,
> +							    const struct simplefb_platform_data *mode)
>  {
> -	return -EINVAL;
> +	return ERR_PTR(-EINVAL);
>  }
>  
>  #endif /* CONFIG_SYSFB_SIMPLE */
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
