Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 857139D583F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 03:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0473310EAA1;
	Fri, 22 Nov 2024 02:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xu5lGSXK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AE410EAA1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 02:19:04 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2fb3da341c9so17760181fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 18:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732241943; x=1732846743; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=490Vuq60Vu1lzedk2GTiclsdAMpFowtjFq9q2ZS01+s=;
 b=Xu5lGSXKiPG5nufizen/UAbkYrgz7Wd3XUPQI27P8xbTfuzCbPdwm3uPUiKXpYwbSr
 Mr8ldcmV9nkMyNe0kJSso+g1avaLurwK3aXZRg3Pnbu/qTjosgjCG4dUKmYH6u/yakOt
 vQhRLVW6bLPwuBJkLaB0AO91+alYPjScsIGLL/6dRCmV+AgjRxGUIdMVO8U/beEsPxYR
 hOSdq8AH+XXZbgGen/VQanyGnO+DKokuMAFlu1FZ+8XjKW+YCyx31ytAB60/Sqri6wvO
 wosc6HjS9SRt7Q1VYWU/DxtWDc6nRzKyHeimU1VFI2Fi/xFK4yLKb87umajp/t+G14Br
 6FMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732241943; x=1732846743;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=490Vuq60Vu1lzedk2GTiclsdAMpFowtjFq9q2ZS01+s=;
 b=ajh8KFuHgpkPRBVjGTJmOWT9FLlCnIjHad2vyuD1lnBZdHGAQnSKGCXF44IiLSB0Ef
 gVUwkfgs/VOmDOPwZPzabh8+iYCtHL1xNKZiJiR4ycIJQo9w88w3qu8kJMlQ7WTvn+sy
 pYzgnubP6r69QSSQCR6nFVG2PkhqqoeV70vhyrs4KnQ9uVm46pq1RGmg+TZX1XO249+C
 M5HWfdT56TG7HcVMYJCuX0E85YjBUU6iTYs4T0tabEw8NTx9Y0WulLs3u3ETHcVAhhHQ
 2R++ZeQV7K64N09S+H9j067Q1cF+2g6IsJ8BUWG9XMOLeN6uRQeLLIwkd0JKurU8Z4VS
 YiRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv6pB0lJ7NzfI+sMUYQflRLqY+9j8D1yCLTx2ecqw2ZGIXTAklJE6o+0RyFeyz+HV7egUm+gme6tE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0WGSPR8g9TMvLw7j+XlJWG0W6o3OE+ZTQAuDfb8q7gRjJWdq7
 kwlJfdFdYZutTVt7jZMRdJexCmEWjktTpSugdZxP3p10d7hKeCUyquMkoeY7p3g=
X-Gm-Gg: ASbGnctoCuTcQWScLS6P/ivxAncFLPdHnbkcQ7+7u0SppONybsKPzA7j9x4F7ck1ilH
 GNpgw/IdB9IeKUlsN748L4Zs/uYsbRy73Bu/0fYwW19oWbarWtNAIH1rkyYddgOYOqF54T6PBGk
 GOwaFs9nsCs3nNrEQhRtr44j9JsRL644CCxBsCnOw5VrNotSJ4K572vlCtfY4js1dcTI3zpfUx9
 k0n/3yzYmETFhsRtoeRzyaQW1+g6EaUHe/8Wz4e9tk7ozkYavVynH3iHKmdAPXf5v7xACybN2sl
 BMQnLvxORmGboMA0T83dED5v9ydC1A==
X-Google-Smtp-Source: AGHT+IHv/1k/72/coOAhCDQ5zs2M+V21u8dURd7yb/KTZ5CMbkmpxgJPkNqcuh4HIenSoFvz4zIL3g==
X-Received: by 2002:a2e:a914:0:b0:2fb:5ebe:ed40 with SMTP id
 38308e7fff4ca-2ffa711e020mr2658071fa.15.1732241942179; 
 Thu, 21 Nov 2024 18:19:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffa53769d8sm1306101fa.79.2024.11.21.18.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 18:19:00 -0800 (PST)
Date: Fri, 22 Nov 2024 04:18:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 drm-dp 4/5] drm/hisilicon/hibmc: separate struct of vdac
Message-ID: <aczenuy77k6ujfntx5lac5uqqxzroceyel2qwd6iuay3jnvbx6@q6mirgoustjh>
References: <20241118142805.3326443-1-shiyongbang@huawei.com>
 <20241118142805.3326443-5-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118142805.3326443-5-shiyongbang@huawei.com>
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

On Mon, Nov 18, 2024 at 10:28:04PM +0800, Yongbang Shi wrote:
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
