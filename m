Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DF522E931
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 11:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC8689CF7;
	Mon, 27 Jul 2020 09:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189C389CF7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 09:39:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so14156338wrs.11
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 02:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=8RCoZkhoieZac/MTCN4IyM+rPgUjma0v0Zq7zVhhyeg=;
 b=GzkYmEP8m/BdmdATLXvwvkzOzhLtQDtPsoDJIKpMsw6nAoTTjeSsPH+lmMoKkiG3Kj
 DTcD374BbOMNZzXWS75vl1qBv/9Y/dSDfDDuK8ZMctiqzZP6pGnOnUTKGkudttUGNZgW
 6z+YyyCmgSWKSay+w/T4/Fb0zM71NJAXUWRtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=8RCoZkhoieZac/MTCN4IyM+rPgUjma0v0Zq7zVhhyeg=;
 b=XlCZChLlZH9jgY/sagDb5vJgQTRnup+4P1DDjvJla6loeHuhImNC1ssNX6yTYqqDp8
 C6rmTGNHBxxvYFn7DPa6LikYsUzEhOUbBVBfPjs4wRH9YWYZM/HbRJn4zXaicjE+6lTh
 FHRvDwwxWLHV4S/S2pdolJ+ld/Lu5vRXXc/30IZxC/SypFgsqKJLAe3BVxojo0ykVCgA
 Szxy+jLBfCCyoVxTCF1R8ulGR3IiNOA4rZD9tp5+ulfMUvAc2rvOsPmubuP6a+ziesbb
 2uONl0HcPYBu+6TgThWenu/wl0YL/bvORulToFZetafhGTK0hiKZevHWTWpY9ITOxjX0
 ayRw==
X-Gm-Message-State: AOAM533W0Safmc1GbSaAfrmxVvFVtQR5SI/2GLvr60e8azuRuQUMnxhn
 zcMxdPflSRW1+bib2Hu2O/wlHQ==
X-Google-Smtp-Source: ABdhPJw75vAc101pWEOGCaxoXpoO4Pq+2dtXYVMRaimrbaDttaYjkaCndLVxKo7QwXXGdffqB7vNnQ==
X-Received: by 2002:a5d:5151:: with SMTP id u17mr19767200wrt.154.1595842749725; 
 Mon, 27 Jul 2020 02:39:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o2sm3410131wmh.5.2020.07.27.02.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 02:39:08 -0700 (PDT)
Date: Mon, 27 Jul 2020 11:39:07 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH -next 1/2] drm: Remove redundant NULL check
Message-ID: <20200727093907.GN6419@phenom.ffwll.local>
Mail-Followup-To: Li Heng <liheng40@huawei.com>, <airlied@linux.ie>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <1595474863-33112-1-git-send-email-liheng40@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595474863-33112-1-git-send-email-liheng40@huawei.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 23, 2020 at 11:27:42AM +0800, Li Heng wrote:
> Fix below warnings reported by coccicheck:
> ./drivers/gpu/drm/drm_drv.c:819:2-7: WARNING: NULL check before some freeing functions is not needed.
> 
> Fixes: 5dad34f3c444 ("drm: Cleanups after drmm_add_final_kfree rollout")
> Signed-off-by: Li Heng <liheng40@huawei.com>

Queued up, should make it into 5.9 merge window, thanks for your patch.
-Daniel


> ---
>  drivers/gpu/drm/drm_drv.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index bc38322..13068fd 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -815,8 +815,7 @@ static void drm_dev_release(struct kref *ref)
>  
>  	drm_managed_release(dev);
>  
> -	if (dev->managed.final_kfree)
> -		kfree(dev->managed.final_kfree);
> +	kfree(dev->managed.final_kfree);
>  }
>  
>  /**
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
