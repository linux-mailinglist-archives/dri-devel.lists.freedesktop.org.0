Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1218B6F88
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 12:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDC910FBCF;
	Tue, 30 Apr 2024 10:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="moI6/JsI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BA910FC00
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 10:21:58 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-51e1b9fba81so1511371e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 03:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714472517; x=1715077317; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZT01Ki3TawfQ3ig4lt1wnzEPfhDo0Jb/siTeqh9G5lE=;
 b=moI6/JsIAUM09KU2MvmrBOFITs8yc5yIaS/Ey1Lhtr0Iwa3EUhsFRzv2HC4s3OUznz
 aF56suY59QS9zizvIi3G5MpayaN01/xPiX13FCRiRZx7wlULaRD2CDAeBZe60QGkxfMI
 zRCPlnbeiGFu05m0POekQPkEcx1b4FCGy38Qn+lq1gCJxmDgX2ioLBSYnPSXSBEadagM
 tFpSxeGYDcO4G+k95cKodYV+3nBCguvhMCaxvVeOIfy8kahydNltxGOZmdIT3UfsDTRW
 nzJPmoNTNPgssWcqev3rUCXPzT0SUeHe8ZJtXHvS76Ww409RXoB8EZCEJDs3cdPBDL2T
 hSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714472517; x=1715077317;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZT01Ki3TawfQ3ig4lt1wnzEPfhDo0Jb/siTeqh9G5lE=;
 b=jl1dnvenHjFHHwYtmEiZzOkNglwgczC/eQPL7fnX/PKQU9NvK5+62zer/wMfPUwW/M
 gAyI7rBDj75eSeqEbymX87dF8mQ4/O8Gt2Opog7cqh2X4nAPXDd16CM9aGKt7+88sNct
 W3+9YGTGanyAxO5Xnxj7Kz2DSUTsscuEKR6WJE+MPizHK8n3yStEr42ZoJFzKxktoZy6
 sA8XqjqOQrMCHRoHXXi2YUACkngSmNJQAEqjWot4UDqSDGPYTughSmcX+tGEkjIaqE1x
 dgdv8cknywCt3frrWSAb/SZyxl4of5RAWDmb3psabDQRyqCa1g7ZTzdrTGegojppsD8Y
 cf8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaNnyMuWi47Pxmf5cQfSzgaBUylzFqsyNO3/ir21w5RF9dSUfRyduTLsfRmgwvO3S45yg91apDki942hoFRxgYBS0EQQGq3UG06mwxQHYT
X-Gm-Message-State: AOJu0YxNHeRkPBbps/2LRk5lexdWhiVPQAe461fLFesT57cg833ViV5Y
 QcE+/eluyV9OgVgXOLat3LHCrpJXTsHEnCK4ffpWy5kKVQv/DCW+Wj7btIpCj4Q=
X-Google-Smtp-Source: AGHT+IFcCOuX6QEEljjpvhMiSZt5CExqyrWGa7Y3OF0CEbw6Gv9K9DYV5uUKU5rAI7Mcf9Sx4WpE9A==
X-Received: by 2002:ac2:48ab:0:b0:51a:f48d:7b31 with SMTP id
 u11-20020ac248ab000000b0051af48d7b31mr9463882lfg.13.1714472513855; 
 Tue, 30 Apr 2024 03:21:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 e24-20020a196918000000b0051d913a3695sm845676lfc.182.2024.04.30.03.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 03:21:53 -0700 (PDT)
Date: Tue, 30 Apr 2024 13:21:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 2/3] drm/panel: ili9341: Respect deferred probe
Message-ID: <aaizdoc5ct4ktn3owbg4woexenao4h6kgn6chg5mjusm4aoy5i@ajwvvl2tzknt>
References: <20240425142706.2440113-1-andriy.shevchenko@linux.intel.com>
 <20240425142706.2440113-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425142706.2440113-3-andriy.shevchenko@linux.intel.com>
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

On Thu, Apr 25, 2024 at 05:26:18PM +0300, Andy Shevchenko wrote:
> GPIO controller might not be available when driver is being probed.
> There are plenty of reasons why, one of which is deferred probe.
> 
> Since GPIOs are optional, return any error code we got to the upper
> layer, including deferred probe. With that in mind, use dev_err_probe()
> in order to avoid spamming the logs.
> 
> Fixes: 5a04227326b0 ("drm/panel: Add ilitek ili9341 panel driver")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
