Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E36A50C5C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 21:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8795310E2CB;
	Wed,  5 Mar 2025 20:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b5awYqgT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B749F10E2CB
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 20:18:44 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5497590ffbbso3070746e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 12:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741205923; x=1741810723; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/zYiNnGxls5NQwkni1gf5Kr7TVqL+dgRikHrlU+v848=;
 b=b5awYqgTY16FLx7JJ6BQl71wDjzpv1ks/EbfV0y84CEcJZk+vivNPTqe4aA4FgO5z7
 m9a50dKIQAQ1HO/YxD9wED43VBPvI2bpnwkxXm9fvxs6sVTFqVWJbKSFn+CxvJP/xRW5
 0iiD5Gwgsze9ObjD4ISof0FwF3EhL5OsHYzoH24DhK+ys656gH58jQUtlKrm4tYKklod
 BFTTLQHoINFy3Px8VsVnHHV5uDWPIJqxVAlTIkhQ1Zhwg1OhD/Z97HDAA5m4vWYwpIdM
 EjC6gNeLeNkImYY0900Gkh6gqCGtzCBzT5BXqJ1xz2Be8iv/h85sQFbHZfzSSj4TZErF
 hfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741205923; x=1741810723;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zYiNnGxls5NQwkni1gf5Kr7TVqL+dgRikHrlU+v848=;
 b=ZzxQMKrAEtJpRBT2leS8q2UF9kfcSuAId0mJxkeNTT6aXWR6p11xXw2bCUkAqI27AA
 HttHhFvTVyaU0CN0CxhUGSZMF2dU5MtTESEEdc//qFsOBkg3TGLHWTboy6TIl1k14TIV
 J+s3Bc7I/ehwwfLr1A/x9sfG1bOcQB7o1x7oSmvuOToX62E7c5Ijew1S4wPnEMCYVSLP
 35ZyVBc7hDsmQ3BRvuVv9T1B0NCLTUL5XFqzsRyOsGd65WJtDXDgr1/xmOFUbq61Ke0O
 pDPfTbKoZ5FwOsWtQqB+pcIjbiA6ECOLAL8Je44lSw9VLXlpOnAp7VV82rLTm+kis51X
 0rMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY6fBLJXLcQA2ewId8S+8k2u0CsrVW1A6La0tGeHwNdV9slsAl+8wTmC5A5sINBmLpaLWyjJDTUTM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCe5FNvkcqwWPSPcCOX1KREwgFJ/XycRJXzDAm7NAUkwKJG6NI
 OgmzFwh5pISRRnqMfu3fr2LoE//OMTR01/Z+QRxVEtABq/njIkGaLz5YZkwPO1I=
X-Gm-Gg: ASbGncsI99vh8i6RttiU/H1Nyc4lPdTR3ByvXLUnyvb13Ce9A5Dodd3hHqlSpylLKbu
 JcPvlP9RiLcmA7OcO6+kobTHsHfxCBTsSbP2zXeI/rFajpkYqsnZ+xFgLiV7L5Ytf0mfrzMGZ+Z
 am+ZjPlbOrT4daZy0zQcduRX3NoENZlwY+yarr4JWOyVbYZErjvII67+IDrp5qydv8RtSP3jn7i
 +Yan5rnygF/T7hq68nsrdMy2np5ZONFO5PxKSsKALMOqUTf954hxa2lZQShXXDMogf5kis46+zR
 UqxCZBqA37fdhdGQFZKDTLaDY0tTzmwor2Y0OO2ypPqkV9KzYSh5ahhJlUfM5DP+PIq0dPNADzA
 69piL+ovf8WHeQbJQ8predaBZ
X-Google-Smtp-Source: AGHT+IGfSQMVA0rAbvtw7eZZjQbZgRCizMe4yyJ2LJBgQ6PQ3Zg+lNGip7UTnXIZjwRe9hOTM1t+GQ==
X-Received: by 2002:a05:6512:ba3:b0:545:2d4d:36d1 with SMTP id
 2adb3069b0e04-5497d33603cmr1885817e87.20.1741205922964; 
 Wed, 05 Mar 2025 12:18:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494919b530sm1807328e87.141.2025.03.05.12.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 12:18:41 -0800 (PST)
Date: Wed, 5 Mar 2025 22:18:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 drm-dp 6/8] drm/hisilicon/hibmc: Add colorbar-cfg
 feature and its debugfs file
Message-ID: <2ajmcqbmqfra3ojqee2zhxvmcqzejytfirr4zumz4mkbekvtje@qxbe5e2lqcif>
References: <20250305112647.2344438-1-shiyongbang@huawei.com>
 <20250305112647.2344438-7-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305112647.2344438-7-shiyongbang@huawei.com>
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

On Wed, Mar 05, 2025 at 07:26:45PM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> DP controller can support generating a color bar signal over the
> DisplayPort interface. This can be useful to check for possible DDR
> or GPU problems, as the signal generator resides completely in the DP
> block. Add debugfs file that controls colorbar generator.
> 
> echo: config the color bar register to display
> cat: print the color bar configuration
> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v3 -> v4:
>   - add comments in hibmc_control_write(), suggested by Dmitry Baryshkov.
> v2 -> v3:
>   - rewrite the commit log, suggested by Dmitry Baryshkov.
>   - move colorbar debugfs entry to this patch, suggested by Dmitry Baryshkov.
>   - change binary format to integer format, suggested by Dmitry Baryshkov.
> v1 -> v2:
>   - add colorbar introduction in commit, suggested by Dmitry Baryshkov.
>   - splittting colorbar and debugfs in different patches, suggested by Dmitry Baryshkov.
>   - deleting edid decoder and its debugfs, suggested by Dmitry Baryshkov.
>   - using debugfs_init() callback, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Makefile      |   3 +-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  43 ++++++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h    |  29 +++++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |   3 +
>  .../drm/hisilicon/hibmc/hibmc_drm_debugfs.c   | 104 ++++++++++++++++++
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_dp.c    |   1 +
>  .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h   |   2 +
>  7 files changed, 184 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_debugfs.c
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
