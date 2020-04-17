Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1491AE05B
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 17:02:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0A56EC29;
	Fri, 17 Apr 2020 15:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F8C6EC29
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 15:02:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i10so3388019wrv.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 08:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=MZOx11K7BVkb9vfDngpczKG72DuQTl/mUltDtknINYM=;
 b=Co8VCB7jRRt1O8+H04fdcxwEtJQvvJ85wW4SvxgTv/mHipUFj+ltqVgCL7M0LxDbBm
 Pb7tEFjXMUdCDK1W7VoRTpT556UNIZvUATsFGTDHXX4ngalCQfdP4rjg3fEM8Y0uLOUu
 QsIi+ueZ6e8w8tapH3hrUwyBDQ4rCmAD5wsU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=MZOx11K7BVkb9vfDngpczKG72DuQTl/mUltDtknINYM=;
 b=UtX6ruQyeTqpOejLDSxk2yX9s+P0zJUBi8lOQeVe2zLlMnuud7CEneii96XiI5L6KY
 pkqfvUVuTC83utBpsCyE00pp/R/k5F0F4I7tuAa5RNj8YoRfLir9F8uNl0wslO6wcl74
 25LtEkkVgvDoNLDJSTTuqLYE5Kp0/T5k17qiWbMQoWgUARs1+DJ8KDDKhpA2ZbDnF/AM
 rxV5oJRWrvs0V9eWDdr/ChwflicNvh68gks/RMrYFDaFlyldZmqw3E/T8xn50X6RU8Ed
 0Dn/PdvzOCg5uGihxPfZ9lVWqnLePXfJX42REbQqBn1cqix6rWGH6qJWcithaBIMvmAi
 f2ng==
X-Gm-Message-State: AGi0PuaMBLxdkqu0UbnVj+Ik9cLy6WEoQTwGWukJ0kN8EDvnHg7gjgB6
 LGhl0czgpi+TV+hMGyAJ+rE4ug==
X-Google-Smtp-Source: APiQypJc7M6g4SJSxadMb830ZLUuNjVyEPZxJsFHSeWGeY7zkoZSsxwQWcW79Vv6OwRGwssTlFoC0w==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr4404415wrq.14.1587135747372; 
 Fri, 17 Apr 2020 08:02:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e5sm33270104wru.92.2020.04.17.08.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 08:02:26 -0700 (PDT)
Date: Fri, 17 Apr 2020 17:02:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH trivial 3/6] drm: Fix misspellings of "Analog Devices"
Message-ID: <20200417150224.GO3456981@phenom.ffwll.local>
Mail-Followup-To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 David Airlie <airlied@linux.ie>,
 Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Stefan Popa <stefan.popa@analog.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jiri Kosina <trivial@kernel.org>,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-iio@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20200416103058.15269-1-geert+renesas@glider.be>
 <20200416103058.15269-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416103058.15269-4-geert+renesas@glider.be>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jiri Kosina <trivial@kernel.org>, Stefan Popa <stefan.popa@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, linux-iio@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dmaengine@vger.kernel.org, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 16, 2020 at 12:30:55PM +0200, Geert Uytterhoeven wrote:
> According to https://www.analog.com/, the company name is spelled
> "Analog Devices".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Queued for 5.8 in drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/bridge/adv7511/Kconfig | 2 +-
>  drivers/gpu/drm/drm_fb_cma_helper.c    | 2 +-
>  drivers/gpu/drm/tegra/fb.c             | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/Kconfig b/drivers/gpu/drm/bridge/adv7511/Kconfig
> index 47d4eb9e845d085c..f46a5e26b5dd6406 100644
> --- a/drivers/gpu/drm/bridge/adv7511/Kconfig
> +++ b/drivers/gpu/drm/bridge/adv7511/Kconfig
> @@ -6,7 +6,7 @@ config DRM_I2C_ADV7511
>  	select REGMAP_I2C
>  	select DRM_MIPI_DSI
>  	help
> -	  Support for the Analog Device ADV7511(W)/13/33/35 HDMI encoders.
> +	  Support for the Analog Devices ADV7511(W)/13/33/35 HDMI encoders.
>  
>  config DRM_I2C_ADV7511_AUDIO
>  	bool "ADV7511 HDMI Audio driver"
> diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
> index 9801c0333eca29e9..cb2349ad338d953b 100644
> --- a/drivers/gpu/drm/drm_fb_cma_helper.c
> +++ b/drivers/gpu/drm/drm_fb_cma_helper.c
> @@ -2,7 +2,7 @@
>  /*
>   * drm kms/fb cma (contiguous memory allocator) helper functions
>   *
> - * Copyright (C) 2012 Analog Device Inc.
> + * Copyright (C) 2012 Analog Devices Inc.
>   *   Author: Lars-Peter Clausen <lars@metafoo.de>
>   *
>   * Based on udl_fbdev.c
> diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> index b8a328f538626e7a..2b0666ac681b8721 100644
> --- a/drivers/gpu/drm/tegra/fb.c
> +++ b/drivers/gpu/drm/tegra/fb.c
> @@ -4,7 +4,7 @@
>   * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
>   *
>   * Based on the KMS/FB CMA helpers
> - *   Copyright (C) 2012 Analog Device Inc.
> + *   Copyright (C) 2012 Analog Devices Inc.
>   */
>  
>  #include <linux/console.h>
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
