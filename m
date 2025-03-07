Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 155C8A565B5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 11:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DB510E2CA;
	Fri,  7 Mar 2025 10:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sdCR48Mv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2F510E2CA
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 10:51:18 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5496301c6afso3037400e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 02:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741344677; x=1741949477; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CoJab6aQwdUmHv51fjpmCPB+nAKlS0NjVx82EWhJoYs=;
 b=sdCR48Mv5WggGT/GV3z6wZA8de2viFRHKRhNqJpOo0arSsj7Wd61ObD5K40QDB9eRo
 Ej9U7YoPbKAHtovYmxyuVL4Lmm+ojtBba2GuJnCW+BysXoOoAWHtn8urAKa0o0ClP0zP
 8nr0HVzOY4/+Osk0EAVQiypyBHzfzBcQ6TfnCSO8YhHfha8cFYJFmRtcHN8rQ6x75erq
 bgEhtKUIw3juT99IyfrsBm01DMQSLN+gCEqjQU0XNVrpiAwrUZ0V6arLZMhItiCqeU0N
 u71bPd/Wh6Y7CwiOClEB8KXfB1TxBPaFrd0ZUkGAM1wPUPJIz58EWyCzSEPVECa/ovFy
 KDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741344677; x=1741949477;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CoJab6aQwdUmHv51fjpmCPB+nAKlS0NjVx82EWhJoYs=;
 b=pClYWIyRFceg1qJuczCIdJr+/jyaIeNlF51WJFGDs0+vMrQzZ6pfphBvK4zS9KwR5a
 aic/wzaOYPMh1+az4+v5DEoE3pVXDC7Ze0h2tjHlPO5GmubPJ86oLOYQ6tfOTU580oiO
 w0exM5Ffgfnea7NdhF0RgtM9NbHCHJcIH/rEQH9TYTCsbX4kKob+CJup7EV2X8gA0MRG
 sg4yUu4D30PnusDxrL+J+0LVn/nFphhi38egowquk+gLFkSI2grmjf8o4osWRBA7JH5c
 sWPK9MVrHooNspFXFtFZ7tit7GwDI+s90etG296X/GH/zbJt4imBi7+M2gYBkrGVzaRu
 5GlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaPz5htiI15hzMhF1x2p94nZtqn164rikfsEyEyTJNGi6MXT3yBpHNz4A+bp18aP3N97aHCbNZQtI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw776CYUc9O2XLQxL86MT5bCk7bj+dR4OYvIsFB5kTQFpuVt1Tw
 zoAaW5HtSJAqyWu2gqu2LQoZtcEWcncpizI+K+jXrBw8W0oAT5GONjM3vjFbUzo=
X-Gm-Gg: ASbGncsaNQyQEiBVxHcc4N5rg6A6AHxhefMNoL6s1obX6z8OZH+P+N39jqILjEjyVOO
 wuBXMX1dlBFe0fpkmVOu0wJ/ifnogypqUPdBV7JieFr8OSbylcl7lOoKUUFmABlmLM9wZcBnoYH
 dGB0YqJijMNIxuLfbt3mdkYz0N4zD8IA4pXMzxob1g9rLKhJu7Yrwv7/dEnw7ppYWIKsGKube7G
 WJUk1cR8RCADJoKZjIBIWWVWtdfA//18PoDdYi+eJdiWAtws3P5weKz0jS3aU6y5JyLovZFDNZ5
 enphaVo9LVIIpt42F5Vsqw1Wswo2ZzHyhaM+2byGvg8ahgCamTbVKfnDMNhNChVNub8ThO4pB72
 HRNVY85cUgv1Uw6mEJ7FMT6OP
X-Google-Smtp-Source: AGHT+IGuTWabfmD5KlWD1Zo2jdScv5WVuOItfBGwPCTPIUUULkXh0GT+oBxIC6TBlHo9j2mbtrr9hA==
X-Received: by 2002:a05:6512:114e:b0:545:5d:a5c7 with SMTP id
 2adb3069b0e04-5499043ea30mr1171693e87.21.1741344677083; 
 Fri, 07 Mar 2025 02:51:17 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5498b0bd069sm450565e87.117.2025.03.07.02.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 02:51:15 -0800 (PST)
Date: Fri, 7 Mar 2025 12:51:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 drm-dp 2/9] drm/hisilicon/hibmc: Add dp serdes cfg to
 adjust serdes rate, voltage and pre-emphasis
Message-ID: <of75z5hy3pc5wvbd2rzmvpo2wdmap3iraj2vofldg6qeglvl2t@ogiq5nfeh4qe>
References: <20250307101640.4003229-1-shiyongbang@huawei.com>
 <20250307101640.4003229-3-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307101640.4003229-3-shiyongbang@huawei.com>
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

On Fri, Mar 07, 2025 at 06:16:33PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> This dp controller need features of digital-to-analog conversion and
> high-speed transmission in chip by its extern serdes controller. Our
> serdes cfg is relatively simple, just need two register configurations.
> Don't need too much functions, like: power on/off, initialize, and some
> complex configurations, so I'm not going to use the phy framework.
> This serdes is inited and configured in dp initialization, and also
> integrating them into link training process.
> 
> For rate changing, we can change from 1.62-8.2Gpbs by cfg reg.
> For voltage and pre-emphasis levels changing, we can cfg different
> serdes ffe value.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v3 -> v4:
>   - fix the serdes cfg in hibmc_dp_serdes_set_tx_cfg(), suggested by Dmitry Baryshkov.
>   - move the dp serdes registers to dp_reg.h, suggested by Dmitry Baryshkov.
>   - 
> v2 -> v3:
>   - add commit log about dp serdes, suggested by Dmitry Baryshkov.
>   - return value in hibmc_dp_serdes_init(), suggested by Dmitry Baryshkov.
>   - add static const in the array of serdes_tx_cfg[], suggested by Dmitry Baryshkov.
>   - change drm_warn to drm_dbg_dp, suggested by Dmitry Baryshkov.
>   - add explanations about dp serdes macros, suggested by Dmitry Baryshkov.
> v1 -> v2:
>   - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
>   - changing all names of dp phy to dp serdes.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile      |  2 +-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h  |  4 ++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  5 ++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   | 23 ++++++
>  .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.c    | 71 +++++++++++++++++++
>  5 files changed, 104 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
