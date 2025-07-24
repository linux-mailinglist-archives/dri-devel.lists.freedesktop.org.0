Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE28B10071
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 08:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E8510E1CF;
	Thu, 24 Jul 2025 06:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="eC/Z3y2E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1EB10E1CF
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 06:17:27 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-3138b2f0249so473530a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 23:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753337847; x=1753942647;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ma2sXkb0s8zsnuWYCNF5UobkWR25rqDpRvTg7Iv6AjU=;
 b=eC/Z3y2E1vwW7cTBnqywhIHqU/HiBBFwCB2bk1CazOePjqnzDWHXwJvnep8Z9SxSnV
 ukQ2D5di/OaPjRp7zZkT6tztHESHoCDvQiTbTkrDJi/REjzeKi46HIf+ZPUERZtECL5a
 CBB9GoW4ehH4awWYGU905b5f2dBd2nm+LE9hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753337847; x=1753942647;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ma2sXkb0s8zsnuWYCNF5UobkWR25rqDpRvTg7Iv6AjU=;
 b=GZ5dE72v68zsPIEwbtcVB7K9AfIs/HtMdkqmsSiiqHJurpHuRXVo2nif0MnanIMonz
 lmCNENnSa9Si2DP8zBh0t8RHHZm/ZSfiyJ+qIwztYvFKUUxFeAo3qORQMCHqLJ+a8T7h
 2tNG6Gj1STDFqGIxgcJCbCTUHmAEmHw/Db3BArTvuNzI80JApGj/fvGK5xm0g3rC6JnT
 jP6fnw/DsexEjZRqGyGcuuri+T/qjd2oBsYlPURmt3SE15YSCilufk2HHLeqlwvlR25D
 Kmw0ZszQ5HU+blTaN9jmbDTVR6nexZSRZCXUTE2ULllyGYCfLbkxAv0xe2ky9IFFKCz0
 mjnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRER4+U+fMciYzGumoZQyUGcNsj5A6pbOKgmMQB+G26M08BguyI9KOC0H1jeP4E8Vje99xy2ZCOnw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqLNScGXScLw2SQreOvkDDM0EXssRT66J6ffb3hGv7QttoYnFx
 VowjPB7TwyJV/IqUJu/XBcjFJ2rfcYk+kQeh4i9/jHA0ElRGmUcLRsCRD4JebRz0d0yiivdphPX
 BGsQ=
X-Gm-Gg: ASbGncvnx8Y5cYh6H30Czro+0NhS2MJ7mRNb/BnNLe5sNxzkqt7lrbADuO6XldAI0lu
 UFT7G3brrzC8QclcA44Qp55TTDwSSaEymluF3KCybGDYl9Acnq88m6ZtxO/uP1YHWH+Ggv10MrZ
 Ruha3Ap7FJM3lZp3OXnv7cW5zWynIMuyaQHE56AGP01CN8SSU++PQ7WjLW22tsBBG2XqftAY6Ai
 n9h/5zIC5Ymigdq8Qw6wgwknwChR6DtT3ELrep2ztgcrwbBLCSJltjMs0G8hWblHNMXJTdThOnO
 GYyLDkPRQ0tcAWoolpyZPY4mRVHwW0t2DDVV9HhNklGH8k0sJJjfNJW9j7rjQNfvil5sG6F+Lkr
 ml27GBiJMQcY0/0U=
X-Google-Smtp-Source: AGHT+IEOpg2wuJkazWw0natLuKqySLIjKWWWyZ8Dime1cBH9lZjwKuUE1lFEDeUmKFM23MP7GYkuWw==
X-Received: by 2002:a17:90b:554d:b0:2fe:85f0:e115 with SMTP id
 98e67ed59e1d1-31e5080524dmr7154899a91.26.1753337847030; 
 Wed, 23 Jul 2025 23:17:27 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:eae7:88cb:81e1:a589])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e66267f99sm501715a91.2.2025.07.23.23.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 23:17:26 -0700 (PDT)
Date: Thu, 24 Jul 2025 14:17:22 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: it6505: select REGMAP_I2C
Message-ID: <20250724061722.GA54817@google.com>
References: <20250610235825.3113075-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610235825.3113075-1-olvaffe@gmail.com>
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

On Tue, Jun 10, 2025 at 04:58:25PM -0700, Chia-I Wu wrote:
> Fix
> 
>   aarch64-linux-gnu-ld: drivers/gpu/drm/bridge/ite-it6505.o: in function `it6505_i2c_probe':
>   ite-it6505.c:(.text+0x754): undefined reference to `__devm_regmap_init_i2c'

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")

> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Somehow I botched my previous reply.

> ---
>  drivers/gpu/drm/bridge/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index b9e0ca85226a6..a6d6e62071a0e 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -122,6 +122,7 @@ config DRM_ITE_IT6505
>  	select EXTCON
>  	select CRYPTO
>  	select CRYPTO_HASH
> +	select REGMAP_I2C
>  	help
>  	  ITE IT6505 DisplayPort bridge chip driver.
>  
> -- 
> 2.50.0.rc0.642.g800a2b2222-goog
> 
