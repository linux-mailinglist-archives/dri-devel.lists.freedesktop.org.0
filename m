Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44D5B05B7B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:21:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B5B10E5C2;
	Tue, 15 Jul 2025 13:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Sc3O3YxL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F5010E5C3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:20:59 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4561ca74829so19054125e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752585658; x=1753190458; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2aER99iRVzHm/yjHj1djxkk2abTrxMFAl8DKmvxNC7E=;
 b=Sc3O3YxLmhuIWGpDyYFcsNvxCf7N4M/TMk2lWAynMylucqQFJXlDTo8/rWrjkEkMpS
 8Epe6/URgIKlhKKYJbfqflpmZSsI0SQ0XvfZUfOOLZ6tYS2QHtA2Q1It7Kl/GPEBs+65
 71g+mjyOPxCoB54TPzHBiNisswNdeKbo+4Jug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752585658; x=1753190458;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2aER99iRVzHm/yjHj1djxkk2abTrxMFAl8DKmvxNC7E=;
 b=CjRrxzAMXYaai81lB94lX6FhkfQUA65CzjMvEWdNUpLVt29EvdtyhpolsPtUEcKmP2
 6j87SV+Ft6+VZqJ8E1DXo3BHDEENg2pDes04WGtcBlKQ8Ak7h9G64o9jpiy6209wzZUP
 gSpjf60Q4Y/1pxntUTcWOmVo15QTwRQ9Ia+8B2NRHTtgm1JmOa7kmnd5l9GSTqgM5TKI
 ng7Fuseib0lAC5z+voXGDu+t9hYyUOKPePTcX1Onw9WhXXdoRhdYmzVwmEGOrAwfjfuy
 wFg/7Fg5P929i/nwM6YOro07GeZypQTbMK17di95ySBc0neE7DC/d/ST5S0NR7Spuwy3
 oXNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkJStduVcRdiW1WR5dAaPddSDEWkfrKYGi4XuCBZT3A2LpGd3VtxXzGj22NgGYplgnRaRTb9J5rPU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTkQ/Hrk6AK0ACSMCFuZVTbawMSxLPyMlGI96etDwXcmg6a+ry
 QL78dcDSGMA02F7iCrDxehT8zYwXbzqR5d9EKhehk1e1a6b36FlhQfIx3psP8fOK/B4=
X-Gm-Gg: ASbGncvNPlQhR51V7oEG0axxV2KsR1jXMRAJPBA2EGdZS2WCt/AQqK358uXQ2B5UdQC
 tOFcLY+SuqRK2dOf4J1VmKx0sivXjmcIM4F0k4y4XqkDu2m9Cbd7l5vbP2iyRU06WmMmUXIuwCa
 pw42dCMoer9Tdg7aCN8q6zRQv+N5v9DPi1fxGalEBb6TFE9VMzdH9KNi2JsG7Zn8jGt2Gg85znH
 Az5w1em49YPLxtSxwYTIkCvfdQPuwrp6ToP4Lvj5pkXC8sOKLyF6djpo1MazwXf47kSZ1FZrlLu
 s8NF5Oi1Vmub0l3YGmJUMeUTXD/xKwj/ww75gSThJVGLKoUShfOFU1AYukUEvy5wSNaluzW0Kin
 gU4owgb3X3srkO5BzdLyqQJnvJNf9oEeYOw==
X-Google-Smtp-Source: AGHT+IGinrr6VlQ7VPBCrVc59xWEOcpuzjncDgPBrTWdeNMpcUJW8rPWbAvhsIGRi9zIwLALwbGYCg==
X-Received: by 2002:a5d:64e4:0:b0:3ab:27f9:e4f with SMTP id
 ffacd0b85a97d-3b5f2e1b872mr13361758f8f.35.1752585657761; 
 Tue, 15 Jul 2025 06:20:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562b54b439sm3676615e9.16.2025.07.15.06.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 06:20:57 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:20:55 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, sven@kernel.org,
 alyssa@rosenzweig.io, neal@gompa.dev,
 support.opensource@diasemi.com, duje.mihanovic@skole.hr,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 05/15] fbcon: Add necessary include statements and
 forward declarations
Message-ID: <aHZVt86l-sXKQpMI@phenom.ffwll.local>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-6-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Tue, Jul 15, 2025 at 02:24:42PM +0200, Thomas Zimmermann wrote:
> Make the header self contained for including.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  include/linux/fbcon.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
> index 2382dec6d6ab..81f0e698acbf 100644
> --- a/include/linux/fbcon.h
> +++ b/include/linux/fbcon.h
> @@ -1,6 +1,13 @@
>  #ifndef _LINUX_FBCON_H
>  #define _LINUX_FBCON_H
>  
> +#include <linux/compiler_types.h>
> +
> +struct fb_blit_caps;
> +struct fb_info;
> +struct fb_var_screeninfo;
> +struct fb_videomode;
> +
>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE
>  void __init fb_console_init(void);
>  void __exit fb_console_exit(void);
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
