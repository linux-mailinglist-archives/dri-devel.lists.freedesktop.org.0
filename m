Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A9D788057
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 08:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B54910E616;
	Fri, 25 Aug 2023 06:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E50610E612
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:52:46 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-56c2e840e70so321288a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 23:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692946366; x=1693551166;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zyeeHky36HOFsNAx3muIoihxDyePLkMN46mCRR53eHo=;
 b=UgxRTZTmdk17KlhXVbou5F5azvrooO9UdaXdH+JK+LkDp52hAhd6bdWhF6H1vGBJJG
 MW7wWQ8WvMHIic2YnxsVe9usrByBQFMhzQvFKMRhdWOV2rQQL3v0Q/BXRGQQ4Wim2Zlq
 YdeoIHsTQPXSHb199RH+fxKRyKhkXxuy4RSwgBLB8jBs9RE2weyIobNDkW/Bh1SxmSLy
 CBuUj/gBP/V3XD4ObOi3eLdHwLt7c8UDE116sjDzQ7sSvNX8/YDW13/fN1zJignj0uBb
 WnRTclXMAusRgQZMn5qJ6VfohH92sd9+lXrhHqRZ1tmQ8vc2cWwbv8Z8LL7U7b2+hJUg
 lwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692946366; x=1693551166;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zyeeHky36HOFsNAx3muIoihxDyePLkMN46mCRR53eHo=;
 b=fM7V35GVu2VIwlgLZYo8UieaPJwg0RrTbw9JGaSXHTW4pxbNEhdrhCoHLpzq9gd2w5
 9u1cBzVFTt2gxL8h49FUflWD53I8zS17es6dWrWU2h8aHPPij03dfNx9xY6OrW/JJsrF
 WBtc9DcY3B7Sb630ZX4GPxicpyX6VtmfYtOf131MjSlLf1VwdB+aBktR3a6cxUyQ1HbU
 zE/8DaXsAvIqCwl8gq1RzIrTRv9cg7z1Q1Ztxn0pzNaKQ8t5pLycVbNvWqvnBesZFndB
 RyHMIGJ4PZYYly8ggsYqnLlYLfXu3d4Nu4rhjj/50qW68NxaCrgC64sivBHA4zW5KaR3
 cEfQ==
X-Gm-Message-State: AOJu0Yx4A/f7/t/YtKre1cYHtSqdLIGyitQJzVWGmZwHlCNH4egfewkq
 kuOUUVf8ssYtJhuXzHNTWKkS6TwZaKU=
X-Google-Smtp-Source: AGHT+IHXvwHWoF7Y9aZZKfj1eYyEhMQ/jfnzdTKlK2GYWy5xd5Hc88EkwXEkcLnOsBz8BrkBTtmn4w==
X-Received: by 2002:a05:6a20:199:b0:13b:7848:9515 with SMTP id
 25-20020a056a20019900b0013b78489515mr19768114pzy.13.1692946365852; 
 Thu, 24 Aug 2023 23:52:45 -0700 (PDT)
Received: from localhost (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 x3-20020aa784c3000000b0068c006dd5c1sm798714pfn.115.2023.08.24.23.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 23:52:45 -0700 (PDT)
Date: Fri, 25 Aug 2023 08:52:39 +0200
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: Jorge Maidana <jorgem.linux@gmail.com>
Subject: Re: [PATCH] drm/gma500: remove duplicate macro definitions
Message-ID: <yohcjzdwlgw4an5zopirykpj4jllquxncaigif4yfyjrobe7uz@2xwd3l62ryf3>
Mail-Followup-To: Jorge Maidana <jorgem.linux@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
References: <20230725173107.9593-1-jorgem.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725173107.9593-1-jorgem.linux@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 25, 2023 at 02:31:07PM -0300, Jorge Maidana wrote:
> Remove identical duplicate block of macro definitions in
> drivers/gpu/drm/gma500/psb_drv.h.
> 
> Signed-off-by: Jorge Maidana <jorgem.linux@gmail.com>

Applied to drm-misc-next

Thanks
Patrik

> ---
>  drivers/gpu/drm/gma500/psb_drv.h | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
> index f7f709df9..6204a745d 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_drv.h
> @@ -161,14 +161,6 @@
>  
>  #define PSB_NUM_VBLANKS 2
>  
> -
> -#define PSB_2D_SIZE (256*1024*1024)
> -#define PSB_MAX_RELOC_PAGES 1024
> -
> -#define PSB_LOW_REG_OFFS 0x0204
> -#define PSB_HIGH_REG_OFFS 0x0600
> -
> -#define PSB_NUM_VBLANKS 2
>  #define PSB_WATCHDOG_DELAY (HZ * 2)
>  #define PSB_LID_DELAY (HZ / 10)
>  
> -- 
> 2.30.2
> 
