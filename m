Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01FF12E038
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 19:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E539589BCD;
	Wed,  1 Jan 2020 18:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6ED189A4B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 18:51:52 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p9so4000653wmc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jan 2020 10:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=D8uPCxi3Y1/pc0576oAFGCcv9ILxWB3/3GiCiHCXgko=;
 b=CovNZjlE6y41FxRRV2dQgC2LXmUHj1E8p0Nrv8qiRfWxbkQdYpbWLSMjj/b+oII78U
 wl3wEHZITaqtJDiX2UUnM3rU9Poj3VDz0KTlFfXfgsLsgcwqUU8n+ad18kAFMtdYP3Nl
 H6F+gk0amyScbp2FsWH2Pzgq8Mylv+lGIT/y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=D8uPCxi3Y1/pc0576oAFGCcv9ILxWB3/3GiCiHCXgko=;
 b=j3lSBOt+10/1gfiJnMy48/eYtnx6E2kl0WSkAq5uchdme43Rwnnm+xgsw/sA9y6qdQ
 uyR4470Ke34dDrxMI+e6AUZLVfCqOClP+5cKhAm0esYCeEdrr24zmuJpm0xchODE3iJ1
 0iS7hpDmZLqyk+rSmFsBqgWk+MuJC+VUa2Va45yqT4ZT+w0no7OlJtvAx2OaJbyVYXEx
 ycfAuq8+CdDJXYt7qST1WAwrceJsk7OcBHdUa8oBrbsaYNgqR77KzaJY6RlV0DnvFl1i
 4OPZ8eOLmdL0wJkLPghg/jiubD++k1+SLJoGi31TnXzTO9BcTynOB/f6xl01gBKw9nih
 /Leg==
X-Gm-Message-State: APjAAAVZI1deChtdVpJ3J+c7Jxmp/7O78KhsTHFpIZMEocHp08qfWF4T
 +6h638LHQxHYgzuet3QXz920Hw==
X-Google-Smtp-Source: APXvYqyjqRvgYGtxavvSSbnVsxx3hbCvsLvioRActoXXQldrptMzEMi+l6Q2nwcO1dPqXP/rbpsjRA==
X-Received: by 2002:a05:600c:224d:: with SMTP id
 a13mr10459265wmm.70.1577904711502; 
 Wed, 01 Jan 2020 10:51:51 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([194.230.159.125])
 by smtp.gmail.com with ESMTPSA id b21sm6272694wmd.37.2020.01.01.10.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 10:51:50 -0800 (PST)
Date: Wed, 1 Jan 2020 19:51:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH] drm/nouveau: use NULL for pointer assignment.
Message-ID: <20200101185147.GB3856@dvetter-linux.ger.corp.intel.com>
Mail-Followup-To: Wambui Karuga <wambui.karugax@gmail.com>,
 bskeggs@redhat.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20191231205734.1452-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191231205734.1452-1-wambui.karugax@gmail.com>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
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
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 31, 2019 at 11:57:34PM +0300, Wambui Karuga wrote:
> Replace the use of 0 in the pointer assignment with NULL to address the
> following sparse warning:
> drivers/gpu/drm/nouveau/nouveau_hwmon.c:744:29: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'll check with Ben next week or so whether he wants to pick these up or
whether I should stuff them into drm-misc-next.
-Daniel

> ---
>  drivers/gpu/drm/nouveau/nouveau_hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> index d445c6f3fece..1c3104d20571 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> @@ -741,7 +741,7 @@ nouveau_hwmon_init(struct drm_device *dev)
>  			special_groups[i++] = &pwm_fan_sensor_group;
>  	}
>  
> -	special_groups[i] = 0;
> +	special_groups[i] = NULL;
>  	hwmon_dev = hwmon_device_register_with_info(dev->dev, "nouveau", dev,
>  							&nouveau_chip_info,
>  							special_groups);
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
