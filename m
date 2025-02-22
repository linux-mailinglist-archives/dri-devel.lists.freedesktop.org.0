Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377FDA405A9
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 06:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A868110E303;
	Sat, 22 Feb 2025 05:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DnN0qp86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6730810E303
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 05:32:10 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-54605bfcc72so4395884e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 21:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740202329; x=1740807129; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=87cavELH7HieCR4xxlMRwzRSQ74aAYETIX2I5ONW3rc=;
 b=DnN0qp86Hvw0LXSuQSqNyTM+I6Zgr24M4ucoQsE6Q7sJWnya/FaFmV36uD0EBwjYNN
 xdP2bwyoz+b0SHk9lZrnY7NY3ME6FZ6qfnEAEWGaIkX7r0PBjX3KBXA1wtMHsyDSf72e
 kB/NEpr0T9tS77dgDiz0rTQzPGk7XHVku7Zei84v7rdMUzP/IJtkG0ZbRt6yBP7vEiql
 XZXsoWcwfarRaKYyGh8MUsISUbY5l+uOlOXJMxhzLSKGs59ae0dJEsL38cVYDO0X+QsE
 A4VMTFlVZWYV+k/Y/3363dnOpUfT9IiNQmBLX1anmW3g4nN2toL+xoWYwDJ2nH4zvZuN
 Q30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740202329; x=1740807129;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=87cavELH7HieCR4xxlMRwzRSQ74aAYETIX2I5ONW3rc=;
 b=YtF2XD4cx43feGsCVCcJYDjkKjTguz1vpWy/62jNRn8WPF2HVVI3vej2tQqdlZa7dE
 7ykDJQn8SrdUjEkK5EZoC7hylEO8SN8DvMX3aaaBbbRFycbCRhlUGpIBtB31uOUCMTuL
 DShIVCLLhtlrijxL4hobdfZVsJM3OjR94kb1kHi04pVytff+3iS8KHhQxeSPzBlyAPMT
 eCS0L5vGHh8Om9a4MV6jObaHhU34XasuIhWCi5ySNr+YNg7al28RZYQyI0EKItMZjGKR
 AkLQY/KeiH94ztYt9PYZED7Yq95Lq5jB+4ORo61UoTcx/9s5vW383qQ/MgUkHy3+4IDI
 R0EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7DUwm0tu1wAeKFvmAM5UupfLvS1fuGLel3Mp6FLCxa3nsRkdeOHQlHVPiWZV5wCieUm4OmOEvyJE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFdkc9MNF41xO2JJK1Zc7GdF+l76a4yIJQO+9MtUXZPYfsUaIi
 PWxcrT9gaqnvnpfPJ4fdxu5W+9BoWJlhDf0pzWp+7CEOBNgCTNdaKgqm8dsBB8k=
X-Gm-Gg: ASbGncsAgA3/lJVmFvEK4qyUEbB6yoQuBFWX+0FrqamDPL4Xpm9LPc13fj9ruFb8DD/
 /u2e2aPODqHuO8aXt6pSXxDUa3kX72tMtuQ9pSZJBLIj5fWxrsXWeXKBYuIRkCZ+1UG0nYgHL94
 lOXWybH4ITC5oQXqWqu5/ThDoMVa2pHusZi49LO7KT/j22lftga6buCF3bdaXIR/+Qdg5VVHOsj
 5U+fWr88G9+O6VI22fUFsM+82mcQ0TvSZrL2LwOG+1MWk5PnUn8vmnvXP7h5nB29eYnQLJXgpWA
 KD7tTLaBVelswFSweCh8WZOzB16WQ3OF94FzFeX5FasimfYDPnzHZgFGuEHBFD8m2zH3yekXCke
 eCC0Tjg==
X-Google-Smtp-Source: AGHT+IHD3hAlNop+4r+I7bLXqz1eBLsQgYn7t+lFx0IzcXlZ0NOucwRd5GOGb4By4F3t9ApVCfRcPw==
X-Received: by 2002:a05:6512:31c6:b0:545:d54:2ebf with SMTP id
 2adb3069b0e04-54838c56ea8mr2571321e87.3.1740202328644; 
 Fri, 21 Feb 2025 21:32:08 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5452d9cd8a2sm2424878e87.76.2025.02.21.21.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 21:32:07 -0800 (PST)
Date: Sat, 22 Feb 2025 07:32:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 drm-dp 4/8] drm/hisilicon/hibmc: Refactor the member
 of drm_aux in struct hibmc_dp
Message-ID: <lya3xvxjr6j3te3swomgn4yicv2ibvzzohr6okqxr35z5jlcp7@kpwvopoesnrs>
References: <20250222025102.1519798-1-shiyongbang@huawei.com>
 <20250222025102.1519798-5-shiyongbang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222025102.1519798-5-shiyongbang@huawei.com>
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

On Sat, Feb 22, 2025 at 10:50:57AM +0800, Yongbang Shi wrote:
> From: Baihan Li <libaihan@huawei.com>
> 
> Because the drm_aux of struct hibmc_dp_dev's member is not easy to get in
> hibmc_drm_dp.c, we move the drm_aux to struct hibmc_dp. Then there are some
> adaptations and modifications to make this patch compile.

Nit: move, not 'we move'.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Baihan Li <libaihan@huawei.com>
> Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> ---
> ChangeLog:
> v2 -> v3:
>   - split the patch into two parts, suggested by Dmitry Baryshkov.
> ---
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c  | 13 +++++++-----
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_comm.h |  6 ++++--
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c   |  2 +-
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.h   |  2 ++
>  drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c | 22 ++++++++++----------
>  5 files changed, 26 insertions(+), 19 deletions(-)

-- 
With best wishes
Dmitry
