Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE329D581A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 03:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61A110E450;
	Fri, 22 Nov 2024 02:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eYz5n4M5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B58A10E450
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 02:12:49 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53dd1829b56so1132306e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 18:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732241567; x=1732846367; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oMI4s7lzBu8TJFiDvywoRCBHF2QfQJqKCfHy3cjwvsY=;
 b=eYz5n4M5tw7l5GNDp4jpSMNw86MntHlR8fVPZgMXZnszEYCGSkZ/4hbquy42I84RYB
 K2V6TilEpTY/338oZRFBC28hsbID6rqSp1A6e2U4jOOCLjuvpPIJHGAR+i4j34akZ0qm
 ypGotLHAeoy0icwEssW0oezK5kPUMyrrk67oao7Yg9ZJoizyxRktCT9kqQ5hV+uAKhlh
 l0NeTOXfIenuVG+/65gDRhToWXbJqNe0XMN4iWQbZKjNEWWc+W1JYbKVUlFVXv4riGoV
 1A1IKy03jTlOvcFzOugIfEhtDof8xe7NcBbf24lpv9tl8ULlzK58isH8hm16Ky+Hyuwn
 RQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732241567; x=1732846367;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMI4s7lzBu8TJFiDvywoRCBHF2QfQJqKCfHy3cjwvsY=;
 b=t3cy9Rn3jKShl6pRcJ3SFmArif+hBao2DQ1JedwlbIovS5ztz0asO5zWkb2g4o9zyf
 HGezZxmX+Vl9KtipOOvJT4hJo3xUo1PYDwdB0wxAF4Knj3aHxYZCFB8s7JBcyDR2pbOI
 dk4lEJEWXUNEA8xiVUlHEb3dBFAd3/vihjY2VKOAuAvvc8/oe3peuXq91NzbaiGheXCS
 ajKsJwRIfb/0MdLjl3ihWJ62c2OPzfGQ7dWvpeoj3m9bzaXKFpHNKNr8udO1Cu0d/lG7
 EVK9ynRp1S32KXFUpnhK5HbAR3cUOPabCQj1vEs1obV8JAlLtzNGk872KBPgP01TYH9G
 vZBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPIkj/i2/YpXd0xsYSWmiMYnutDBT0WHTQ0PauG8H3gk3tFaasVHw2aEqDRA8O5EToqBybAaHR4y0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq7BCUaMSKfEaJ2mK6ejRrtIIvuIwsqICLYna6VobfJJ8GVgwa
 HYMNamvnvvHZl8OMG0pa5iIMVQ/iTkLXX57elNb4tikxfUIs0BgweNNV/7lykeU=
X-Gm-Gg: ASbGncuNa6muBscmVV+MIO6s32E2NRRE3oTChr1SJ2QK6hHVFvWOZ5/es9euEvyS+QP
 KUdMh9Fjp/efhI6BXc5UUROn6InE+q0OJH07js4SNreFWobJ7EQ9KqHi/PbmR3h9y6UeVY52R6Q
 ulQWawayyOCQIcrzZawh8GF/gcYph8ThSJQpdZfip0PxgZADrl5XQyKtAsVGKzgerbHf+9XEClM
 ZAAWs9FUq59M6EV+apA6YkxlUmzHTyCUvbuv3z4OY4cL+qQBoky9CZaQX2ZMhUZdXaROcKI15kp
 5pKNVb8wpDpmfC5C/bCnP3sM6Wmi9g==
X-Google-Smtp-Source: AGHT+IEdbkozKtzZQZRIlVS3sKJ9qwrOxEcPTavI+YkjKiS0bZynMaaIaHnjQe17X9/8rmJlZL6ztg==
X-Received: by 2002:a05:6512:10ce:b0:53d:d0a5:aaa8 with SMTP id
 2adb3069b0e04-53dd36a02c4mr432018e87.13.1732241567243; 
 Thu, 21 Nov 2024 18:12:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2489d33sm161664e87.194.2024.11.21.18.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 18:12:45 -0800 (PST)
Date: Fri, 22 Nov 2024 04:12:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 drm-dp 2/5] drm/hisilicon/hibmc: add dp link moduel in
 hibmc
Message-ID: <pnzjjdau4nd43u46dxox5ii2cb3rpxjuoaggg7vjb3d6uk6vq6@vblt6diozau6>
References: <20241118142805.3326443-1-shiyongbang@huawei.com>
 <20241118142805.3326443-3-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118142805.3326443-3-shiyongbang@huawei.com>
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

On Mon, Nov 18, 2024 at 10:28:02PM +0800, Yongbang Shi wrote:
> From: baihan li <libaihan@huawei.com>
> 
> Add link training process functions in this moduel.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> Changelog:
> v3 -> v4:
>   - optimizing hibmc_dp_link_get_adjust_train() to delete for loop, suggested by Dmitry Baryshkov.
>   - changing ELNRNG to EIO error code, suggested by Dmitry Baryshkov.
>   - deleting meaningless macro, suggested by Dmitry Baryshkov.
>   - fixing build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202411041559.WIfxRN6n-lkp@intel.com/
> v2 -> v3:
>   - using switchcase in dp_link_reduce_lane, suggested by Dmitry Baryshkov.
>   - deleting dp_link_pattern2dpcd function and using macros directly, suggested by Dmitry Baryshkov.
>   - deleting EFAULT error codes, suggested by Dmitry Baryshkov.
> v1 -> v2:
>   - using drm_dp_* functions implement dp link training process, suggested by Jani Nikula.
>   - fix build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202410031735.8iRZZR6T-lkp@intel.com/
>   v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile     |   2 +-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h |  24 ++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c | 339 +++++++++++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h  |   8 +
>  4 files changed, 372 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
