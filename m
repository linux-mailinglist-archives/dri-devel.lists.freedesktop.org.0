Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B6C9E0823
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 17:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112E910E7BF;
	Mon,  2 Dec 2024 16:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eSvSFljv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9F410E7BF
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 16:14:32 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53ddb99e9dcso4445636e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 08:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733156070; x=1733760870; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F8VHlod5uJC4/6n5wVNLJGfi6u4uDM+LMK7JP0/rK8c=;
 b=eSvSFljvnAbLzQnClf5/u2ouTOZtlPeqG5LqHe6l/cKWohldROt3elnA4/HoiHHM3k
 iw8f67LHyXeRHnZRdgvack6vxxvIrVIiRB4VF9WF9uKUJ2Zx0Aajj7xaC4jj55o05OQf
 xE0DTb3UIkMOG2qT/gdEvv53ffQkJHZT1eMCrYqcSil0WsEk5G4rmEz9I9ZwGrJZsDuz
 EU6extal0DnY38ySY3nziImfJaVRLjCOvm8XfE6Nvr/3jAXLZIM1ztko69Zd+WF0BX+V
 4HGUSVeE1Q14QuPhteRH83FtgCnKs0wiCJZh59edwqXAtU03+Inc+LAh3H2eKO79DjlW
 ozdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733156070; x=1733760870;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8VHlod5uJC4/6n5wVNLJGfi6u4uDM+LMK7JP0/rK8c=;
 b=cs9U+vbMyuNPrr1ISBfBG/RFwfDYxX/hYvqzllt6cRjMlZu7Wj3k0Jr1mtIWuXgtye
 WB5e9uXiGHWv9OtS/KW7d1f5DWk5FamIt0doqi7NpeSRh8vs3FKS26dkLhsWu8PQKeal
 zp9SSWt7/CN1sKPjj68nsOYdAfhLPDfHy2dig+9+kY2ZJaQ2KgEDPSg1lRriICXHvJkX
 uaZvUTG16W1hzfXD0L8KbkzGmwaoIiZ5tfr+8MRxFJj6jmyTMUU8tC5LhXwnEdB17dgm
 la7QODOaFUglR0f/pwwln4wDgZ+f4eaCdX3yFSMS17GqywalSOXDxQxgiyb3t3NE2SLB
 sbgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlO7wj9ZTZ1CiCD2FKYWtY4EV/RoTPYkzEe+3Ir4OX+QqQ7qQ18/ZDIjIiSdaRUuO1AOuhW/p6OeY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyEGyU1MHHDBgJFFp5aw6aI+ItwylAJz6arb2KxdhVRlqYqv+L
 rw1tthXqNt0qOCY2DQjXhGt00pfhYyM5/zH+/Uqb1E8AZJbsavAYm7Uqs4aP9+c=
X-Gm-Gg: ASbGncsq+1z6bCewsgrBm3iB0FSeM1GxURO/FHo5A7BGoZ4+hT6Z68yoJjz0UEZeIh+
 s3Z7ZUEEI/7weQLyMz62IiJKDZLkJNnnDskCtxd81i61qWFyzrS1Deanwm4BI7Yl+Zf71qCijax
 UMdCvvf1NFJQ3bArNUmjYdsGoR36iObgxKrJU1aE0CkMboGBZzDxbGlmGY807smV+1KHzzspffp
 /zg3PzPimcmyDB+kUIqhFrhQl7Yw1IL8/NdZ1DhR2JaSFt+a8Pa9rxx/2PvM3Ix5AN4RXbOVW4m
 dyAIq/6KZ0KjcfoFxdyc4knfE6152w==
X-Google-Smtp-Source: AGHT+IGljYe4BdTzBDXyCqgaBRdYgKurtEw8NIhKOjqu0TbXgCFVoYTwi8WuQ2J0dQRrYvQOHVQyLA==
X-Received: by 2002:a05:6512:2356:b0:53d:a58c:c5a4 with SMTP id
 2adb3069b0e04-53df0108fe6mr11691188e87.40.1733156063012; 
 Mon, 02 Dec 2024 08:14:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df649633asm1510854e87.176.2024.12.02.08.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 08:14:21 -0800 (PST)
Date: Mon, 2 Dec 2024 18:14:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 drm-dp 1/5] drm/hisilicon/hibmc: add dp aux in hibmc
Message-ID: <anxttocvrziwstm3h2q4lles2zyeld4uuv2hwrs3vthldekz6w@bjn262y4efcc>
References: <20241202131322.1847078-1-shiyongbang@huawei.com>
 <20241202131322.1847078-2-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202131322.1847078-2-shiyongbang@huawei.com>
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

On Mon, Dec 02, 2024 at 09:13:18PM +0800, Yongbang Shi wrote:
> From: baihan li <libaihan@huawei.com>
> 
> Add dp aux read/write functions. They are basic functions
> and will be used later.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v5 -> v6:
>   - adding do{} while(0) in macro defination function, suggested by Dmitry Baryshkov.
> v4 -> v5:
>   - fixing build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202411131438.RZWYrWTE-lkp@intel.com/
> v3 -> v4:
>   - retun error codes in  result incorrect branch, suggested by Dmitry Baryshkov.
>   - replacing all ret= with returns, suggested by Dmitry Baryshkov.
>   - moving the comment below the judgment statement, suggested by Dmitry Baryshkov.
>   - moving definations to the source file and clearing headers, suggested by Dmitry Baryshkov.
>   - reanaming dp_prefix to hibmc_dp_prefix, suggested by Dmitry Baryshkov.
>   - changing hibmc_dp_reg_write_field to static inline and lock, suggested by Dmitry Baryshkov.
>   - moving some structs to later patch, suggested by Dmitry Baryshkov.
> v2 -> v3:
>   - put the macro definations in latter patch where they are actually used, suggested by Dmitry Baryshkov.
>   - rename some macro definations to make them sensible, suggested by Dmitry Baryshkov.
>   - using FIELD_PREP and FIELD_GET, suggested by Dmitry Baryshkov.
>   - using DP_DPCD_REV_foo, suggested by Dmitry Baryshkov.
>   - fix build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/
> v1 -> v2:
>   - using drm_dp_aux frame implement dp aux read and write functions, suggested by Jani Nikula.
>   - using drm dp header files' dp macros instead, suggested by Andy Yan.
>   v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile     |   3 +-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c  | 164 +++++++++++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h |  42 +++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h  |  27 +++
>  4 files changed, 235 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
