Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3C826041B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 20:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F5C6E519;
	Mon,  7 Sep 2020 18:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FA66E519
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 18:04:56 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k15so16587557wrn.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 11:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q2sQVFenco4pobd+mmmRw5WELECjJ/x8jidgYEOpQis=;
 b=RmyeefMwKHWDFCMY8mVqcK0hMsKQ8IZdMf9ePW2kTcOTrbIv35oDXeYKAG6rLpGI8Y
 e0d9YAhAH4fLuKc5ydUHlVEeOjGhgRr4BAPmesHSiVyUYIFYFylszGEZNWt8+QkN+Ytu
 D9ILMpKEah4cpVwO5IEIVo+QF3VpwFII/Fmmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q2sQVFenco4pobd+mmmRw5WELECjJ/x8jidgYEOpQis=;
 b=YHubPbaXC7KTHafro297B5s+g2RN7++OL8c5599Rhi4CP0PzfYsQsDlMUYUEzz1Q5r
 kfRsfs9JDyN1D+6pn8Lyu7YZFGoaXbgKO3Wp6A+v5m/K6OrXAtL/SWI8yDUALzxs32TF
 MxPaaVEVaTurlLkDbYqxVM28kCFdbe/Gqo/WtOqyF+XjqXA7qjrlzPhC5Sycozs8F4dS
 G3AlyZ6ARideJ5gJ+lPmP8/tA7qHm6TjIW8b9MmszcIlDDgn4L279xSUeVK2d9GLUBLW
 blGBDdFhA1B+xGgSPbsI9ZaTMTJ6htGtm9SmdPAShn0+uRRSZq7g0PL6meuV6suxETeb
 oOng==
X-Gm-Message-State: AOAM532DOtz+F5BlqPFdImQ5+CXhHerXbWtMZg+dyC7F1tbFG54vWeRa
 YEYdRjQS7Znpe3q95A1o4An1jQ==
X-Google-Smtp-Source: ABdhPJyIDgDhrouHG0oEj1nPoOl6bqWyT8YRwJaIYuU+9TnXkq8ZQ11O9nYu7RmE1LOa2N5KX58E6Q==
X-Received: by 2002:adf:f586:: with SMTP id f6mr8904550wro.299.1599501895161; 
 Mon, 07 Sep 2020 11:04:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d13sm4205801wrp.44.2020.09.07.11.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 11:04:54 -0700 (PDT)
Date: Mon, 7 Sep 2020 20:04:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: fix
 dw_mipi_dsi_debugfs_show/write warnings
Message-ID: <20200907180452.GZ2352366@phenom.ffwll.local>
References: <20200907102711.23748-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907102711.23748-1-narmstrong@baylibre.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 angelo.ribeiro@synopsys.com, maxime@cerno.tech, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2020 at 12:27:11PM +0200, Neil Armstrong wrote:
> This fixes the following warnings while building in W=1 :
> dw-mipi-dsi.c:1002:5: warning: no previous prototype for 'dw_mipi_dsi_debugfs_write' [-Wmissing-prototypes]
> dw-mipi-dsi.c:1027:5: warning: no previous prototype for 'dw_mipi_dsi_debugfs_show' [-Wmissing-prototypes]
> 
> Fixes: e2435d69204c ("drm/bridge: dw-mipi-dsi.c: Add VPG runtime config through debugfs")
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 0b3825a4fbdb..52f5c5a2ed64 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -999,7 +999,7 @@ static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
>  
>  #ifdef CONFIG_DEBUG_FS
>  
> -int dw_mipi_dsi_debugfs_write(void *data, u64 val)
> +static int dw_mipi_dsi_debugfs_write(void *data, u64 val)
>  {
>  	struct debugfs_entries *vpg = data;
>  	struct dw_mipi_dsi *dsi;
> @@ -1024,7 +1024,7 @@ int dw_mipi_dsi_debugfs_write(void *data, u64 val)
>  	return 0;
>  }
>  
> -int dw_mipi_dsi_debugfs_show(void *data, u64 *val)
> +static int dw_mipi_dsi_debugfs_show(void *data, u64 *val)
>  {
>  	struct debugfs_entries *vpg = data;
>  
> -- 
> 2.22.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
