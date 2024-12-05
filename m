Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554C09E6160
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 00:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F7B10E3E1;
	Thu,  5 Dec 2024 23:31:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z3/ehzB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB0510E3E1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 23:30:59 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53e28cf55cdso820603e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 15:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733441458; x=1734046258; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RRnWHKAnYkMS52ihrEL3z2fjZJGuaLl5naxOMGazVLI=;
 b=Z3/ehzB61Tfv3McnxaYbymZPZutslRAgK42bcU4MzcuBB6tsYCtpobMTszPBM8Ix2Q
 zn6hxtisaGCQjPkDfbU/c4DUdNgjQaFuypZvAtivFZeXvaMVBB7s+mLcOb3IpoVpc5zf
 yDhojzgPDobZaMbZLrdq8SBEof4vzVBFXAPpFS0Nfzj5o4M1cphGmGGX/yDOVAPjhBYj
 wR6/coIvuYgZyEujt/+ui5/LiPUXA2FIp46Fde3lvHB96h8I9usa/ofmEWuuURCdKni4
 uXzdYf/OOTZP3qr7okMhx/qFOXxKt1UTZgOjp/kCreXLPbaSFVQOTKtsxDahQWtAGcO8
 9Jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733441458; x=1734046258;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RRnWHKAnYkMS52ihrEL3z2fjZJGuaLl5naxOMGazVLI=;
 b=OgW+ZKrQT53JflmgGfweil+RWG4ljfK7Y5ry9ZtWWSUiYlH4T2FQbByBTgwMa6cfA9
 4p8F6LJvl9JwrtOrGzksRsXMixQlwfNCH77UC1Ss9XeVeKvXUiZnhsKiWPlyHQUkZQrw
 mGxT5embIy18D9fPWvhy75f2vammhZif1PhwhmjNKSfMmGQhGU8Quwy57wiWGlDqrVZC
 eJDoYkCWgdnlK1SZJptI5xrDG0vM8cf5DTFh+IoRXk0cjEJEr3i1V1jmt44v7pXJuNgA
 0wJePePgur4C859stvt6l6dcxckC03vFrb6B9JRkv9HN7Z5xMbb2pHwAPyni+uW3t5cn
 EaHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL0ZVhq0zNo0N5PVfUfuDxu0mOhpomwwbk26Tep3TMM9EvXImEbbM2Umv6zDbkVuFQw6vLQbCKx+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrwkyYZNHFvtorGW0902hslJ6XCSim/YvuKKUPBZgcuFuzvaW4
 cktLQzksXx0rZadJAgJFIVEszV1X3lsMgjyuGPnJX5P07suYTqEhGKzvMa+QiNcuUx1SXpe4kQp
 W
X-Gm-Gg: ASbGnctE3riJSCA/0hXk6bM/b88JfgSOpOeUDbOnOUq0V0ccvS9RzJ1o4EPkb1Emz/5
 GUm2M6GDeQ48bVz6PhlncN5ZCqlfA1DUJ1InOOWyQViNxGqUZH2jWLOjGLIJXiHy/Y/gfqGw2uS
 0XGSdaljAX3fPDbSh2hE37KX+X+YPEsz7g7q+LD3iL5XcIY4EM6pacrMcwljb/gY4X3ubbyZdCl
 F7jja7FCa6aDystoqJ11jMJWFadOzdACEjm68JfJ3dWEk8YI4JeGMfbn56HQUMnnxDp8DvuF55b
 RHqEgw5XPfRTOk1lppIQ4apzrsQhYw==
X-Google-Smtp-Source: AGHT+IFTMrE9qT5BEMo6Ph+Ruh8YL8tnuoBuFo6I6W9OwPUPfUXB6m7wpo9TdecsvG/VYJvutiKHzQ==
X-Received: by 2002:a05:6512:31c9:b0:53d:eec4:2bfa with SMTP id
 2adb3069b0e04-53e2c4fed10mr392993e87.37.1733441457746; 
 Thu, 05 Dec 2024 15:30:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229ca0c4sm354372e87.235.2024.12.05.15.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 15:30:56 -0800 (PST)
Date: Fri, 6 Dec 2024 01:30:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 drm-dp 5/5] drm/hisilicon/hibmc: add dp module in hibmc
Message-ID: <3ds2jlusdihkby47yjizwmjymspdoy2mwyiupbqctdhp6cnt2e@jux3lq2w6vl5>
References: <20241202131322.1847078-1-shiyongbang@huawei.com>
 <20241202131322.1847078-6-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202131322.1847078-6-shiyongbang@huawei.com>
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

On Mon, Dec 02, 2024 at 09:13:22PM +0800, Yongbang Shi wrote:
> From: baihan li <libaihan@huawei.com>
> 
> To support DP interface displaying in hibmc driver. Add
> a encoder and connector for DP modual. The HPD function
> and get_edid function will be add in next series, so temporarily
> using 1024x768 as default in hibmc_dp_connector_get_modes()
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v5 -> v6:
>   - adding hpd and get_edid comments in the beginning of patch, suggested by Dmitry Baryshkov.
> v3 -> v4:
>   - static inline hibmc_dp_prepare(), suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile      |   2 +-
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    | 118 ++++++++++++++++++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  12 ++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |   5 +
>  4 files changed, 136 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index 8c488c98ac97..388e4fb4fcaf 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -28,6 +28,10 @@
>  #include "hibmc_drm_drv.h"
>  #include "hibmc_drm_regs.h"
>  
> +#define HIBMC_DP_HOST_SERDES_CTRL		0x1f001c
> +#define HIBMC_DP_HOST_SERDES_CTRL_VAL		0x8A00
> +#define HIBMC_DP_HOST_SERDES_CTRL_MASK		0x7FFFF

Nit: lowercase hex

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
