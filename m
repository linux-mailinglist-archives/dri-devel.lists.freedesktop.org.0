Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBA6344651
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 14:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483866E49B;
	Mon, 22 Mar 2021 13:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5016E499
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 13:58:12 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b9so16960617wrt.8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 06:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+wkcJgHmCYScx50Jty5UVlbK72TCi9OaUtboPpMLN5Y=;
 b=XOaHZfxWQrAH8db7YDKs4opdld+vfr/YXyTRzo8GJt24al9fgEHs9amVwxtse3T2vD
 PLeyfi3HHQjQT/4KNF/6F/e+gfzJ81Gpwl9pEMc30zJcebWzSFmQcd+niIQTfL6l4T92
 mrqck91TFPP1P40A6wNEDK+kP8PQPlaSvtlmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+wkcJgHmCYScx50Jty5UVlbK72TCi9OaUtboPpMLN5Y=;
 b=UrTilHQKSYuTV3TgS+jue0tg8aEhP8wGwYS4q9ifZ5nrxzXKqcr6mP927gW2DOokSl
 tv9fA6aIHnnvAJa9nHWL2tFZdp/VE4NkOZIx9t+aONYEhPpMRpkU+TosdFluzWqliHXI
 GKrhh27y0gY3Y8mz72ZbRpk9XcuXyy5ln3dsUbhWcyLgSVQkTedAP4iwHNZ8AI9sKMep
 nl9fcle9JkPgAUmxO+Z/18uS8LmiEJIF3VTNTLaFMGCg3u4o/N3qyLCfmWYihv2RLMAQ
 T4YqRr/lu4JwqbtB67IMBqe+zi//XCMLizA7Y8Eg/DRQ9+gkUwRASkkKUck4zF5Vohd3
 nPmg==
X-Gm-Message-State: AOAM530hRhiCctPJq745weQcbPnCC65eh4bg21nHn6sutTWzzaRdMVjy
 0aUtd8QJ20jlJWXcIwAUePZi+Q==
X-Google-Smtp-Source: ABdhPJw0L1WLvU09v3Lk7vOU8JEgATOFdusjehjH2rJKXT4wvHJWCgE/t4Z8zwBWeaEefCw+3l+LIg==
X-Received: by 2002:a1c:771a:: with SMTP id t26mr28297wmi.60.1616421490790;
 Mon, 22 Mar 2021 06:58:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h10sm20276193wrp.22.2021.03.22.06.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 06:58:10 -0700 (PDT)
Date: Mon, 22 Mar 2021 14:58:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/sysfs: Convert sysfs sprintf/snprintf family to
 sysfs_emit
Message-ID: <YFiicMzv0/0cyjRm@phenom.ffwll.local>
References: <1616375978-12151-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616375978-12151-1-git-send-email-tiantao6@hisilicon.com>
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

On Mon, Mar 22, 2021 at 09:19:38AM +0800, Tian Tao wrote:
> Fix the following coccicheck warning:
> drivers/gpu/drm/drm_sysfs.c:172:8-16: WARNING: use scnprintf or sprintf
> drivers/gpu/drm/drm_sysfs.c:185:8-16: WARNING: use scnprintf or sprintf
> drivers/gpu/drm/drm_sysfs.c:159:8-16: WARNING: use scnprintf or sprintf
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_sysfs.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index f0336c8..968a956 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -156,8 +156,8 @@ static ssize_t status_show(struct device *device,
>  
>  	status = READ_ONCE(connector->status);
>  
> -	return snprintf(buf, PAGE_SIZE, "%s\n",
> -			drm_get_connector_status_name(status));
> +	return sysfs_emit(buf, "%s\n",
> +			  drm_get_connector_status_name(status));
>  }
>  
>  static ssize_t dpms_show(struct device *device,
> @@ -169,8 +169,7 @@ static ssize_t dpms_show(struct device *device,
>  
>  	dpms = READ_ONCE(connector->dpms);
>  
> -	return snprintf(buf, PAGE_SIZE, "%s\n",
> -			drm_get_dpms_name(dpms));
> +	return sysfs_emit(buf, "%s\n", drm_get_dpms_name(dpms));
>  }
>  
>  static ssize_t enabled_show(struct device *device,
> @@ -182,7 +181,7 @@ static ssize_t enabled_show(struct device *device,
>  
>  	enabled = READ_ONCE(connector->encoder);
>  
> -	return snprintf(buf, PAGE_SIZE, enabled ? "enabled\n" : "disabled\n");
> +	return sysfs_emit(buf, enabled ? "enabled\n" : "disabled\n");
>  }
>  
>  static ssize_t edid_show(struct file *filp, struct kobject *kobj,
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
