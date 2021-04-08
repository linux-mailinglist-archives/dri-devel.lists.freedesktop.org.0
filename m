Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED017358125
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 12:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084456EA84;
	Thu,  8 Apr 2021 10:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9DD6EA84
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 10:51:44 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a4so1634489wrr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 03:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hqBVs7AE2//2Z0q9CoEtqiHQ2n0CgdC1IwwWi7EDy1U=;
 b=Np1gOdcR/RAtI3s4F+v2l/w109391cQGj430pihoCTn4M8/gVtfebB1F1SklCG67Il
 DoYo4kl3ksV/v2JiPvrPP2Vuq9q5UFBZXpIF81lTW+Qmczmun+wnDIjc3raEqFIBicrb
 eJiriR356gQqVBaURpdmZkQGrTXe5fmtzT38Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hqBVs7AE2//2Z0q9CoEtqiHQ2n0CgdC1IwwWi7EDy1U=;
 b=V5miuRS/41F7mRE0UGCAf7dagSOrqcPZMbwwpzQG8iGFV0eBVWltBNGnCl2Fdobnh6
 ClVCX8YxgD8ikYPlq7J34ms+ed3oZSqlTsGiB57f1O6w3bopPI/gi9OCq3E1F4YCIM8A
 ScIZcvX6ojxcOKUF7ZRE/PsMWUvZXYYb96e69kg/vfnqBWeFtmeC9qsKA8HJm3wrlcq1
 R/Vd0ni/eKC5S762xWIE60/ErUXIo3yU3ibsyIDqGKV67LxgmDzOPcgKtgvaDjqu1pnL
 YAl4WYd+LSm8sh+NGdre/6giSvFJKEHNbYiLqSgKc19H96NuGL3UIE/If0HWACdcjATZ
 GYgw==
X-Gm-Message-State: AOAM531akxDGNI0eMAriY4pOuvwFkBqhWHATK/ld9GlQGEXIYuv0QRuK
 n6hSe3XFO/A4aHuaDXKLydawKQ==
X-Google-Smtp-Source: ABdhPJyPRU+SgSdlKyIvau+WXqyIGw8Ar1pBNTVxK3BGvKWKVELlqFBErzXG3tm6C+qe2rr/8hvO+w==
X-Received: by 2002:adf:9148:: with SMTP id j66mr10587802wrj.124.1617879103573; 
 Thu, 08 Apr 2021 03:51:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z1sm28641536wrs.89.2021.04.08.03.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 03:51:43 -0700 (PDT)
Date: Thu, 8 Apr 2021 12:51:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/panel: Convert sysfs sprintf/snprintf family to
 sysfs_emit
Message-ID: <YG7gPYRlYt7qWNjy@phenom.ffwll.local>
References: <1617069288-8317-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617069288-8317-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: airlied@linux.ie, thierry.reding@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 30, 2021 at 09:54:48AM +0800, Tian Tao wrote:
> Fix the following coccicheck warning:
> drivers/gpu/drm/panel//panel-tpo-td043mtea1.c:217:8-16: WARNING:
> use scnprintf or sprintf
> drivers/gpu/drm/panel//panel-tpo-td043mtea1.c:189:8-16: WARNING:
> use scnprintf or sprintf
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/panel/panel-tpo-td043mtea1.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> index 49e6c93..bacaf1b 100644
> --- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> +++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
> @@ -186,7 +186,7 @@ static ssize_t vmirror_show(struct device *dev, struct device_attribute *attr,
>  {
>  	struct td043mtea1_panel *lcd = dev_get_drvdata(dev);
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n", lcd->vmirror);
> +	return sysfs_emit(buf, "%d\n", lcd->vmirror);
>  }
>  
>  static ssize_t vmirror_store(struct device *dev, struct device_attribute *attr,
> @@ -214,7 +214,7 @@ static ssize_t mode_show(struct device *dev, struct device_attribute *attr,
>  {
>  	struct td043mtea1_panel *lcd = dev_get_drvdata(dev);
>  
> -	return snprintf(buf, PAGE_SIZE, "%d\n", lcd->mode);
> +	return sysfs_emit(buf, "%d\n", lcd->mode);
>  }
>  
>  static ssize_t mode_store(struct device *dev, struct device_attribute *attr,
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
