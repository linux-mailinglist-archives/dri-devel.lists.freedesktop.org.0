Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B86426FCCE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 14:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BE46ECE9;
	Fri, 18 Sep 2020 12:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848CC6ECEA
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 12:45:39 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a17so5481311wrn.6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=mkjGA7pXWKUs0Nfv07SZZRXfgMyaUHALkc311WYJd5c=;
 b=IjP59USZ4bt/dNbg6oSq65GvWXtsZNBOpmHcvEGwUUe7X+YQ8CuVdvzCJGUW31mYN+
 kutEcRAjJR4RcIEaSUCQ+2SZ1Rv35nHNuqPRysdFMn9OVDXJ9a8uh6YI7JPIBIExQFFw
 1nb0o6gG1SpBjtUqoSxsN0I9Nz6cEgQsIpwa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=mkjGA7pXWKUs0Nfv07SZZRXfgMyaUHALkc311WYJd5c=;
 b=IY7uIVYSuEROOXGKV4rx3rpljWEbpyGGS+ppcxXug9FQ8o58VCUN24h4/FoyiyVRz0
 VFKCGf58EX5W/F7mRzNxdsvI64zO+WoxxWYtIZC+f5AI1pmYFLg8kMmoPpn1vQR/bzC3
 4TQzB7aMknUaVkvfPed2gfTQkLBIoMO7bacesqDD9/MRwzDsri2CnwrqAnTISJFAXxj6
 n21/9OoqQO2fVypfiecE8Snl13OlIzjleXBO5AHVKcMAKZ058CQi0uKqm2HFoGjtI6Oe
 Y3FkUpWvxK25YKdo5NmZ1VfYJzt0cjvjkECykT9nKmo/PAbG5ZRGupXkpTywpvrVwvFT
 Pnuw==
X-Gm-Message-State: AOAM530jkz9Yguw9ginWCSbMlreSQbt8C7P7V/M2UHRXrjuCxlSnRKG8
 OM50yvne27+0jMX9V00Le7Yfwt1AcsxLaGNF
X-Google-Smtp-Source: ABdhPJyDK0gDuuHiczv9k6y+Mdkm1lj9HIgPKWCvChWYK5+PoIgy7TapyPO7BGOVyhxEfKVMzA4lGQ==
X-Received: by 2002:adf:81a3:: with SMTP id 32mr37517353wra.368.1600433138210; 
 Fri, 18 Sep 2020 05:45:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e18sm4912651wrx.50.2020.09.18.05.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 05:45:37 -0700 (PDT)
Date: Fri, 18 Sep 2020 14:45:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
Subject: Re: [PATCH v2] fbcon: Remove the superfluous break
Message-ID: <20200918124535.GB438822@phenom.ffwll.local>
Mail-Followup-To: Jing Xiangfeng <jingxiangfeng@huawei.com>,
 b.zolnierkie@samsung.com, gregkh@linuxfoundation.org,
 ndesaulniers@google.com, gustavoars@kernel.org,
 jirislaby@kernel.org, george.kennedy@oracle.com,
 natechancellor@gmail.com, peda@axentia.se, krzysztof.h1@wp.pl,
 akpm@linux-foundation.org, adaplas@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20200918010521.69950-1-jingxiangfeng@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918010521.69950-1-jingxiangfeng@huawei.com>
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
Cc: krzysztof.h1@wp.pl, akpm@linux-foundation.org, b.zolnierkie@samsung.com,
 daniel.vetter@ffwll.ch, ndesaulniers@google.com, gustavoars@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 george.kennedy@oracle.com, linux-fbdev@vger.kernel.org,
 gregkh@linuxfoundation.org, natechancellor@gmail.com, jirislaby@kernel.org,
 peda@axentia.se
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 09:05:21AM +0800, Jing Xiangfeng wrote:
> Remove the superfluous break, as there is a 'return' before it.
> 
> Fixes: bad07ff74c32 ("fbcon: smart blitter usage for scrolling")
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied to drm-misc-next, thanks.
-Daniel

> ---
>  drivers/video/fbdev/core/fbcon.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 0b49b0f44edf..623359aadd1e 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1727,7 +1727,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>  				    vc->vc_video_erase_char,
>  				    vc->vc_size_row * count);
>  			return true;
> -			break;
>  
>  		case SCROLL_WRAP_MOVE:
>  			if (b - t - count > 3 * vc->vc_rows >> 2) {
> @@ -1818,7 +1817,6 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>  				    vc->vc_video_erase_char,
>  				    vc->vc_size_row * count);
>  			return true;
> -			break;
>  
>  		case SCROLL_WRAP_MOVE:
>  			if (b - t - count > 3 * vc->vc_rows >> 2) {
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
