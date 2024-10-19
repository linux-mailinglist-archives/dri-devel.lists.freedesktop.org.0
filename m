Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D7C9A4F0F
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 17:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F6110E2A8;
	Sat, 19 Oct 2024 15:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fN3dHsed";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CD610E2A8
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 15:19:03 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2fb584a8f81so34646181fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 08:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729351141; x=1729955941; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7n8/mK/i5Y/uX8rzynVvecUWLJ1s3Pa79IYiRE1jykE=;
 b=fN3dHsed7S4ZrUSL61Sm8j1vzguhlkLZOpraV7idhIQUwod4JdeX73DaIx06T/ZRfR
 1+MySs+xN3T+31wl1g5DONk9tlCAZuRTvfTc9jijlbMH/5TcDAH5WGrvMv56gvZh6Bzf
 Y604HkD7L00UAP/2/cQs4R+xtzpyVgzVV6B2i3hInut62w8TbnReo6g2Oy9ooH0LMADM
 GTinVXsk3P7HBYop4amwz7W8/wmZQnF3H6TMEJky2FLsLgRXu0afnt2ScQIyBy/Z5HPI
 mJkK0Rv0duu7Wl+PvpiB5wmuiNalq+80Wj9B0a6RSY5kjKZUgYwuhYScbVNKLmVYAQm4
 Tfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729351141; x=1729955941;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7n8/mK/i5Y/uX8rzynVvecUWLJ1s3Pa79IYiRE1jykE=;
 b=IWMgOglKEwL9WUs7XuY5tylm3VJYTo91cKD/ABXXzXaNC+R504D7ysRXWIZE3VghbA
 SHVgtBXP1sfo3F6HMVWP5IsxMx5TP2VpxDoeZaO+bXprZmeM6s/9I853qeN4ca1hjH6O
 /qOS24PoSv7UAa27NreXZiSVJFSt1BSkJnUjz9QTOMIJQanMXkVy4k5g/dQpUgWbBdW6
 8a3TZ/o/9ECcwWuju1kYJwQfR5hzTX6/WCS/zV7ylhzRcrzMeqfp4OEsZd6PMt46v/50
 o77zmqpONED79FvcFZPy9llAG4V7y5OBXCXjApv+/czA0BiMtvFqndHMga5d6FSfosOW
 /wyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKS/+yPNe8b9agPXnmrTlCDBLDe/KhuhunhiasBDwAyBsOHExceTSfpX9RpCDFFXeLJhb1R3YaDBE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlfvaRmf8TvaX9ROWAaetUcRSt4Lt1L/6hkrMAVIDFvc+CLcmu
 XAXe32fbWMkbBNWK2+Mn3qYKSMeZ4LsSU7NmhBO22D4w+KbiRQKdEVSVEKCtsY8=
X-Google-Smtp-Source: AGHT+IFE81XiNZQJfDhQhWPmj2XByaXqXEuvd5jcNZBWcHct9Dhbn/OoZ1mvjPStuMf2VfW8teI59w==
X-Received: by 2002:a2e:90d0:0:b0:2fb:591d:3db8 with SMTP id
 38308e7fff4ca-2fb832009d4mr26097071fa.35.1729351139702; 
 Sat, 19 Oct 2024 08:18:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb809b2ed6sm5341491fa.50.2024.10.19.08.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 08:18:58 -0700 (PDT)
Date: Sat, 19 Oct 2024 18:18:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>, 
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 0/6] drm: Series with core improvements/refactorings
Message-ID: <vpzkrywd4fysjtiqtd64hbe2oscb4vr3dimj6vwp4lvp5ghykf@6r2fq7dx5ha2>
References: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <499229fd-5344-4799-85bf-93e4b3b45eca@gmail.com>
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

On Sun, Sep 08, 2024 at 02:04:45PM +0200, Heiner Kallweit wrote:
> Series with DRM core improvements/refactorings.
> 
> Heiner Kallweit (6):
>   drm/sysfs: Remove version attribute
>   drm/sysfs: Drop unused drm_class_device_(un)register
>   drm: Refactor drm_core_init error path
>   drm: Change drm_class from pointer to const struct class
>   drm: Add __init annotations
>   drm/sysfs: Remove device type drm_minor
> 
>  drivers/accel/drm_accel.c                |  2 +-
>  drivers/gpu/drm/drm_cache.c              |  2 +-
>  drivers/gpu/drm/drm_connector.c          |  2 +-
>  drivers/gpu/drm/drm_drv.c                | 18 +++--
>  drivers/gpu/drm/drm_internal.h           |  2 +-
>  drivers/gpu/drm/drm_panic.c              |  4 +-
>  drivers/gpu/drm/drm_privacy_screen.c     |  2 +-
>  drivers/gpu/drm/drm_privacy_screen_x86.c |  2 +-
>  drivers/gpu/drm/drm_sysfs.c              | 89 +++++-------------------
>  include/drm/drm_sysfs.h                  |  3 -
>  10 files changed, 39 insertions(+), 87 deletions(-)

Heiner, any chance of a respin? I think most of the cleanups were good,
needing just minor polishing.

-- 
With best wishes
Dmitry
