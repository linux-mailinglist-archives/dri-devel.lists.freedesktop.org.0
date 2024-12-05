Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAE89E6147
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 00:27:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B5E10E08B;
	Thu,  5 Dec 2024 23:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FgXl1+aO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB61A10EFE6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 23:27:46 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ffc016f301so12962841fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 15:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733441265; x=1734046065; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BB40swK62CufqVGtD6kuh4EIqNJrDcZbv9FnjJlSj6k=;
 b=FgXl1+aOMLWZigQFCo3DBZWB7basV+J6fP3jabmkyE/u+CTtucVRD9VvfR/EC8wfcQ
 ZBVQ9M+k3GC4iHs+3KkPoxT3HvC4lsd/4gzsTCN7+fcRtLJy9PiG+kkxjc4g4owzZYb2
 BcaLgxPVQR9DOUxK0ClAgZ9At0wHxhWXUkaoZvf3sZG/0W6ClowPdKIQFp4QEXh15FV2
 0ki/d3q3bafXbHTiwr/vKDCtP/oCM9hgpSV8PRKQ6P+1OdohvpJjwQ5Qch3NKC0VzYeS
 sATvPYnz5ChDS8gKZrKIyBVyUZujdNSK03O7AJA6fniAUraXeLliNA4k1smlPv6zLM0o
 w6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733441265; x=1734046065;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BB40swK62CufqVGtD6kuh4EIqNJrDcZbv9FnjJlSj6k=;
 b=X/a+HUVCplbEufXqicy4/tIIMO3P0hELyqgiA/3VJ1yUpMDHM63xTgcIa+0XPedQlb
 ViVUX5pu2oyjm5meyOfshpmSy716f/w9V8wZFxQM5CEEe6XeX4bl+eQNaqAXywifaliD
 kEG0KFxfVMIeiQcDAaUJYGapRbGeUEMOUy8tyEqETJDYTCe353/GPlTNDsd3MhJCWlc3
 YjN+Pdl/4XK3QdY3MksupXKqT9upuscP0lVyGM4+JwPFP+wm3wzbiOEa53it27GVnP1z
 z+smMhFjmz3yQxS5ZRFOhQOZOteU6WVZ4xjH/ZOJefwy7+0HJFnnRfRr6XK7qsi9JNUg
 tKug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFlC4sOKMPnAvpZgx2wGmrBD2ioPcQLTZ8cSrMC9EZ4lR12FxhvnTG/BluIy3PmlzAWhpFdVXxrII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySMJoOrwjjN/65dOCj1QzDhdrV897rtYNYmFNlQ1zZtRUa5Sd/
 QSLt5gLtltqAaiMHLJg7XBQ7FlAtnfXbloQDB+edFQonuEJJM46m7hGTzyDuyok=
X-Gm-Gg: ASbGncsVsfS/WXDcBFfCh+POv+8TH3HmxIYWIOdtHcMf3fUjDFCBsGu6kuDYSse2fU3
 WBoypgEp6yVrzkPS56Np/i8fg4WONYW0qZRYkCAhOr8i7wCmFr79citPJPccL/ad/kZAKIPdW4b
 W27b1KFXJa81i7HX6rU3lHfTxXRnbWM9mme80FSO7Nl3W1nZp8lewxVsNyvIlJ49A9G6VaaRHsu
 Sr6ZGWG49woKLbbZ3Rx9Z6Z9aey6huedx3Ckyug0oQZWzazZ+9xBu4pSLlCS5b89SlaiZOnSUwl
 89pE4p0mwfuxxZ+E8QiTo6MaWMj4nQ==
X-Google-Smtp-Source: AGHT+IFAkMN5+abvXFJHo1ABzJyEBgaRnlFsG9s1fYoDzInsqKcM6e/5ta8tAsDcvGsNHa/fRiC9JQ==
X-Received: by 2002:a05:6512:3caa:b0:53d:a292:92c with SMTP id
 2adb3069b0e04-53e2c2eb628mr226698e87.43.1733441265066; 
 Thu, 05 Dec 2024 15:27:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229ba6dbsm352874e87.160.2024.12.05.15.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 15:27:44 -0800 (PST)
Date: Fri, 6 Dec 2024 01:27:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 drm-dp 4/5] drm/hisilicon/hibmc: separate struct of vdac
Message-ID: <65vx23ucbno2kqlbcpul6pxlhyxui3qb3jvebhsya5i5afnfjd@s7irpf7d53d3>
References: <20241202131322.1847078-1-shiyongbang@huawei.com>
 <20241202131322.1847078-5-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202131322.1847078-5-shiyongbang@huawei.com>
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

On Mon, Dec 02, 2024 at 09:13:21PM +0800, Yongbang Shi wrote:
> From: baihan li <libaihan@huawei.com>
> 
> Refactored struct hibmc_drm_private to separate VGA module from
> generic struct.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v3 -> v4:
>   - separating hibmc_vdac and hibmc_dp changes into separate patche, suggested by Dmitry Baryshkov.
> v2 -> v3:
>   - fix build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202410251136.1m7BlR68-lkp@intel.com/
> v1 -> v2:
>   - deleting struct dp_mode and dp_mode_cfg function, suggested by Dmitry Baryshkov.
>   - modifying drm_simple_encoder_init function, suggested by Dmitry Baryshkov.
>   - refactoring struct hibmc_connector, suggested by Dmitry Baryshkov.
>   - withdrawing the modification in hibmc_kms_init, suggested by Dmitry Baryshkov.
>   v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
> ---
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   | 16 ++++----
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   | 41 +++++++++----------
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c  | 20 ++++-----
>  3 files changed, 38 insertions(+), 39 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
