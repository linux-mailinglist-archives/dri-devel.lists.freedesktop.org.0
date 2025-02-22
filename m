Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2C3A405BF
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 06:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35B210E152;
	Sat, 22 Feb 2025 05:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kFtJv0RY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D2310E152
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 05:57:48 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5462a2b9dedso3248107e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 21:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740203867; x=1740808667; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5Kt0NR2NlGLg/3e+DlKZWP6D2g9Q+QziaayO29Mn3Uk=;
 b=kFtJv0RYXqrR4C431cq3oAFMac41eTHJPcAcUyt7gjevRUUnuDxmiVObTDw1iI75Qf
 kEUHsCGFeiCRQCLfpkyiEBKwLMVXwUi46btp3KT9RHtIGof5Aw54mDEHRzfttjr1pi/B
 iq4K/7xLI6rehYqpLcQ4gRy4fQGoX8lmLbDGRqxIVrjt89hu7tMBg0+B2yjPjbeW+4gE
 W0m0zos2JhHsGFeUMd5sCGa4/A8CIYKuG6oPsusdlKkZf/hHeG5FsdaHaHvIHTPDxLj2
 oaQ0RPY+Jy8TezuVZZXqnIwvp05uh+tQiUQ2IwKaVTU6sfl/v7FGqKwgH9CEySIzyAoP
 ow4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740203867; x=1740808667;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Kt0NR2NlGLg/3e+DlKZWP6D2g9Q+QziaayO29Mn3Uk=;
 b=WHNz2kGxsNDmZrX9m4RqNROKoSY41Y1ZC5OSgwtcVXj70pPoaMOECjLRNPgkIljoAP
 W+KXtrI/P+q/yzobDcMer0Uj7oHxVfRr4nVHD82nFYUDwmkBHA2+crFHhJQAdLdetoPk
 i7YGDtmwWEgCrrcmWplW8XGP5uB7A4ZZd4AU4Q0Kd3q9EwnGMr1XJg6Wqornzj5zaTgd
 YM9LYzOF8zQPmIqxw8xkRG64CzZo9bKGQBLm6DGoHq4Sb7TOG/Dpj6rpYfVXYsaJYino
 9olMFfcs7RpYQG98DRDN7BH//8mSQIpbxzmgvgk6Yzf4CZyoAfhAD4lW8SnmWtU4tzrt
 W4Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbBTV/WHSElE5ReroY+5CwRabuzWKReWOT2ZuCkGH+Gkx5iUIGXhjN59T3A0e3S+3t1lPp+0WxsGc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxssyyTywcMXz+ke/pLD8uLMUdgHjJI47u+mvhpHPFbBFEb3MBS
 ABju4j8WGoNJqHl8zskp3gtddhbEuV7N5Y0ps3DR9K/sATPVdnwB5gaXD4ikcQg=
X-Gm-Gg: ASbGncu+2AEFtkavUsv9mnrV4QomD7vNaHiiXLfLRZFSPyMlG464L0ll/ZKOQ+YH6ns
 fQOEKy8jP1DInfmYLMm5YGaez8ajdDPOTEAEq8FWF3xWGTZC8g6wbmWCgbDR7hgUdAp6uNsX9pO
 hMCFEOme4HXkQKXafLUrbQkQfwfc0MPi9VFb0Tk6jFLnYsDa43Q5lL8zJ/k8pbINXZWrnShjwRS
 69AfbOc9VgnMZowQXMS1LbVEfuD+apI9WIu/WT8OXMoHPaDyrdG8oB0dYLTy20jt1cumMWoKf+8
 0+k77JUtzjAMdei7qt01hmmSwx0QpmrBsPN7vfCGRqKQouBDwuhJqRq7G57wZi3ZhvjnUVV0qF1
 NHHc6GA==
X-Google-Smtp-Source: AGHT+IEGU+ITg7kX7MUzMtAr9W6WLS946omhx6csxzIbCYxjStKWUvFgymVnv5iOhDMlgG8tznozRA==
X-Received: by 2002:a05:6512:b98:b0:545:16fe:536a with SMTP id
 2adb3069b0e04-548391452a9mr2739083e87.31.1740203867063; 
 Fri, 21 Feb 2025 21:57:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452e44052fsm2457607e87.80.2025.02.21.21.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 21:57:45 -0800 (PST)
Date: Sat, 22 Feb 2025 07:57:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 drm-dp 8/8] drm/hisilicon/hibmc: Add MSI irq getting
 and requesting for HPD
Message-ID: <sjddkllmy4fptwpzlejyjo5jlusxlnipf2fryziirbbetkrbmp@bx62xcu5kzjz>
References: <20250222025102.1519798-1-shiyongbang@huawei.com>
 <20250222025102.1519798-9-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222025102.1519798-9-shiyongbang@huawei.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 22, 2025 at 10:51:01AM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> To realize HPD feature, request irq for HPD , add its handler function.
> We use pci_alloc_irq_vectors() to get our msi irq, because we have two
> interrupts now.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  3 +
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 77 +++++++++++++++----
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |  3 +
>  3 files changed, 69 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry
