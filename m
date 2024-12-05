Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A20A9E6144
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 00:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7D110E3CA;
	Thu,  5 Dec 2024 23:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PoGfqTlI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A6710E3CA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 23:27:14 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ffa49f623cso15321221fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 15:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733441233; x=1734046033; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j3DpjOofESGwFVvsCOsndBYuU+rJQeNWZk/BtIw+LZY=;
 b=PoGfqTlIe8BhuhxpWSAOJDaIn4yExQB90cYDmWOmQSBSCp5zrzjdeEq4oIEHEjAg7h
 xgfKDmTAb/XFhQ5VCjLRp/ncqQDtEMRa8n8gwCXdrGRzMbo9H9lRlYHD5/7/vivCI3wb
 ximrgg8xJpq4ky+pUxuu4zDP27rbhcSTYYfvc1+YCuEGC/lhidV+UNiEUkbq1CRyx/tD
 YXAqx5ky/YzrTRqvDqxX9gJ8Z8ijAeWEDs7ExLsZUQC+33uAuaAZd1+63XcIEAALWwT6
 uIRx5qOUo2eE6MIWLOoEncGEwKeA7lxAtw2v/5PFulnyPw/uPrlQ7j+PTPK/Lguc56kj
 7EqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733441233; x=1734046033;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j3DpjOofESGwFVvsCOsndBYuU+rJQeNWZk/BtIw+LZY=;
 b=skJ8uKfeESG3WiU9rfmUBlZ3edZ9mC87ajayc9zJ/w4l9DIDniHth0kSyRo76+Flvb
 x7zqH2DDhiOqoBXeTmET21iniVDl/lw0mPlQ+KRVVhnT2aAfVdluAp0zu+RpzaV2nIWh
 4atZ3Z8cnhUp3Ho3aznwaxUuP9xE+NzeyalEnzn0WRK36yhiUgh6UB8b9qdt6eWnx++5
 aQ9PZi22nmA+rKVe4kfUGNLno7WhHzgDA6NmVevZWS3Gx2urYvll5VXUjaTWJey8DNlW
 kEmyifhA19HZF5qAWTipvztGPj7NYJtTRk7ycZcaiyZ//NVS92nyceulVj+uES7sM9ob
 MDFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHmIQz6Ih/ChnPQXb5DxGpZ6IbANckFj0Q+8x+KdKaMmgWCr/wAHkixCqtVXQTbj1Hz3CtwXeEeSk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXGnlBvQRMAWbllCnkZHxK8zsjNfgY2/uHI19/99o+aiu+UMJk
 K94Meo7AHCB32LLZYLD8m9zBHmHbMz05VAPvxMeXRn0rxANoLgOpcYCfgf7sQWY=
X-Gm-Gg: ASbGnctHOdX84nC2fBG5Vf+0igQApqjVEvB3h7H8Rs0dzZ+N2Rt8KPtRArw0l5jc850
 RLMbr4lDVEQ0+J38WIV88QRnzH8xxoHc4WhiUFkbybskKdNxhk0nXBD1vx8xAMZg2+rnlBIKYVj
 IeSYPt4TOb6c3wBk87BVGTg0kHAfSBXA2XL6favijyIlUKwpfBO+QUoddN+ZpFJYdSjFYM9/qWF
 d1L7oLh3snFhbM6GrK3dAUh5dRVpzTL3M3eOXOyCHYt+kUjBJkuOhGaAbu7tFa9feCu2qzVJFWM
 Mb4wmQtv95rdJ7gw3dV5qp5m3I49fg==
X-Google-Smtp-Source: AGHT+IF04IJWw+FTd0GCRaXztZvGyXSX3rN72FVRGU3oryP/PZu7ykMonxAr8uVUa1aM3F9tC81oKQ==
X-Received: by 2002:a2e:bd13:0:b0:300:1f12:bbc9 with SMTP id
 38308e7fff4ca-3002fd956abmr2485661fa.34.1733441233109; 
 Thu, 05 Dec 2024 15:27:13 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020db4074sm2960271fa.61.2024.12.05.15.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 15:27:11 -0800 (PST)
Date: Fri, 6 Dec 2024 01:27:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 drm-dp 3/5] drm/hisilicon/hibmc: add dp hw moduel in
 hibmc
Message-ID: <q25y46kqfizmwu6os24zvd7r32cwjxrcojbous67hj5vfu7aby@dpf5gp37qeq2>
References: <20241202131322.1847078-1-shiyongbang@huawei.com>
 <20241202131322.1847078-4-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202131322.1847078-4-shiyongbang@huawei.com>
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

On Mon, Dec 02, 2024 at 09:13:20PM +0800, Yongbang Shi wrote:
> From: baihan li <libaihan@huawei.com>
> 
> Build a dp level that hibmc driver can enable dp by
> calling their functions.
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v5 -> v6:
>   - using drm_dbg_dp() to print debug info instead of drm_info(), suggested by Dmitry Baryshkov.
>   - adding code comments in hibmc_dp_set_sst(), suggested by Dmitry Baryshkov.
> v3 -> v4:
>   - changed the type of train_set to array, suggested by Dmitry Baryshkov.
>   - using actual link rate instead of magic num, suggested by Dmitry Baryshkov.
>   - deleting hibmc_dp_hw_uninit(), suggested by Dmitry Baryshkov.
> v2 -> v3:
>   - fix build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202410250931.UDQ9s66H-lkp@intel.com/
> v1 -> v2:
>   - changed some defines and functions to former patch, suggested by Dmitry Baryshkov.
>   - sorting the headers including in dp_hw.h and hibmc_drm_drv.c files, suggested by Dmitry Baryshkov.
>   - deleting struct dp_mode and dp_mode_cfg function, suggested by Dmitry Baryshkov.
>   - fix build errors reported by kernel test robot <lkp@intel.com>
>     Closes: https://lore.kernel.org/oe-kbuild-all/202410040328.VeVxM9yB-lkp@intel.com/
>   v1:https://lore.kernel.org/all/20240930100610.782363-1-shiyongbang@huawei.com/
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile      |   2 +-
>  .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  19 ++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    | 220 ++++++++++++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  28 +++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  41 ++++
>  5 files changed, 309 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_config.h
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h


I'm still not happy about the 0.9947 math, but hopefully that matches
the TRM.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
