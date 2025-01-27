Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271D1A1D875
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C14F10E542;
	Mon, 27 Jan 2025 14:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m1gXSMpn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7C710E542
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:32:05 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so5011810e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 06:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737988323; x=1738593123; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qLCDreM/faQDhB8OPgi2hCF5eoZJPQrs1OAy+FoZeU4=;
 b=m1gXSMpni5CDq+IqWldo4RMwhsU/Sy5mTWIKM4AMyrautREiABiNf3liz4SsWJ035m
 KmlMdhLOeObk5M8eRqb2Uuv0QOnQBBSeka44szbBzTfPbKbYmkRKUfoY+oI9YiY/NjWd
 d7gaPNsbB6/ROWJLFp3ZaOb6VXFPEXPIBwUiP7uIJvMXOy7tOsuFxse5nXTi2jpvYt1X
 Q2QGtTNW2b99yHR1nyiLQDJ0f/vFoALc8Y99xhJUJx5yJSuo6A32vfAbpYGTya/UmKUH
 pKD44I4jCGlFqCXbUW+ht3AVUvjA7Xip0YqTNBLtQFrJbQvZRiTdyXaIGG8Qjg+PZGcn
 NDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737988323; x=1738593123;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qLCDreM/faQDhB8OPgi2hCF5eoZJPQrs1OAy+FoZeU4=;
 b=I02gl/XRaPPOGwDwHeHkSDhjeT9pjKAWaSq0Y/m9tabRNEmYVMc52ucdHEOYCMeCEL
 ttOL3i6UzsoYr/D+ygNSd6fpD8MfdiD+FvrWmoy/YnGPoOnU+DlcKQM134hqZRcFchYb
 BBnvsOJqBmWOHbUu7WWuxB0ElH6Kbsphgh97rYx9OdYSwHAxfp3HJkvzSdg27TO2UwbQ
 3dBUvOd1gL+ukX/YjyVcN2hO90z1n8P5ks+5S3fr29zNZj51PD8juNKeeNLOUB6q+v3t
 dS8W76b+JEICk3na/98P8hc4UP3lqqhBJB72d2SrAaUkRPj/98xp6fG1FcGYsKf5II13
 zl0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDCPGn2LuUfcrt7R8IC9IbkGTLUCIQfuBYdCoK6TDIE0yqkPAzsOz3JjUFsfVwBBQhxutzGyhRN9o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrqkJMl4Ib/+Y2HJVh+sPjgSb9zbN7f8criIl4cZy62bfqAV6w
 0+Z0pabxjbQEBqea7OyhqnCt7XjRpaw77YLUOQkahwJQXnix6eawQ1tGmP0X9w0Iab2prMAvuoy
 +HbM=
X-Gm-Gg: ASbGnct7mlmlIz6jyd8tN1329eMcwpmgMm5oH+PzaW9IvyZlzDSbU8yBQ2GrLXFE8wD
 iXDBOE5Aq9NXWTv6y41P681uD7HwzmABdkS8dfqVhyxPrFzjYAdGqlGoON4tnK2D0YPisxd4AXY
 mWGFnyfrbki5w7V2gQPRzoUZ2OxH03ErJt/ojCD20je4i9G3bQNoHEfiDZZpcnlkdHde3xQ45Oz
 Al+S8VTb3H9HQhbjbAw9T2Sw/LMGRN6LZAHKM4jULwwYTHvzuZMEvGE/d3jvvSEHuZdHauwu0e+
 SRA38C91TdrcpjIk9UmHqnhw5bosPdTwpLLSijggcLC6b/+rMXDlyL+K60ix
X-Google-Smtp-Source: AGHT+IEr4xKs2hcuzhM4XRxx/RLgMNBLv1HRJDzoEzUPjFNMkwnaKqYiEB4NuSZNdNmQiMUrTXh7+A==
X-Received: by 2002:a19:f716:0:b0:542:1bdd:748d with SMTP id
 2adb3069b0e04-5439c223e12mr12163935e87.13.1737988323518; 
 Mon, 27 Jan 2025 06:32:03 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8368475sm1296164e87.117.2025.01.27.06.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 06:32:02 -0800 (PST)
Date: Mon, 27 Jan 2025 16:32:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Xinliang Liu <xinliang.liu@linaro.org>, 
 Tian Tao <tiantao6@hisilicon.com>, Arnd Bergmann <arnd@arndb.de>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/hisilicon/hibmc: select CONFIG_DRM_DISPLAY_DP_HELPER
Message-ID: <rinspzl3ymazjud3cztxpjhwpc62if54ats5dsnpkvxkknbp7x@jl2oh77prhak>
References: <20250127071059.617567-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127071059.617567-1-arnd@kernel.org>
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

On Mon, Jan 27, 2025 at 08:10:02AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without the DP helper code, the newly added displayport support
> causes a link failure:
> 
> x86_64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.o: in function `hibmc_dp_aux_init':
> dp_aux.c:(.text+0x37e): undefined reference to `drm_dp_aux_init'
> x86_64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.o: in function `hibmc_dp_link_set_pattern':
> dp_link.c:(.text+0xae): undefined reference to `drm_dp_dpcd_write'
> x86_64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.o: in function `hibmc_dp_link_get_adjust_train':
> dp_link.c:(.text+0x121): undefined reference to `drm_dp_get_adjust_request_voltage'
> x86_64-linux-ld: dp_link.c:(.text+0x12e): undefined reference to `drm_dp_get_adjust_request_pre_emphasis'
> x86_64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.o: in function `hibmc_dp_link_training':
> dp_link.c:(.text+0x2b0): undefined reference to `drm_dp_dpcd_write'
> x86_64-linux-ld: dp_link.c:(.text+0x2e3): undefined reference to `drm_dp_dpcd_write'
> 
> Add both DRM_DISPLAY_DP_HELPER and DRM_DISPLAY_HELPER, which is
> in turn required by the former.
> 
> Fixes: 0ab6ea261c1f ("drm/hisilicon/hibmc: add dp module in hibmc")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry
