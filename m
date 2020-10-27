Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 379F329C7E9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 19:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3E66EC17;
	Tue, 27 Oct 2020 18:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087866EC17
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 18:59:40 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c194so2385528wme.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 11:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=+cV+RUD4wvWlHWdV7vVioQqE9C8WBC4QcXqibckUnCU=;
 b=IU2Hb+KZPDrkgqfl11tsF4c8PfGWU/TngkRXfmks64fAtBDjcWbMzPYmVQcb+NeziP
 TvRwGlYf5bRUPR9aYgH+rUCiNf/QJ74fonilsmtsjNwz3wtd9i87cgfU/YkiRHw/1syL
 dhuAaH/N31Fe9FyLE8kbYXodf0LXbfMKnP6Xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=+cV+RUD4wvWlHWdV7vVioQqE9C8WBC4QcXqibckUnCU=;
 b=mvStbh6Ghe56YYDM6x12WqfgHxOg7OcLV+8R+h8VfJ0QmEkBZH3+MvfjoaLLaGCFOh
 buiKoebwgVtqhVssiCOvuHPLJV10PS0EDKXKh09YnBpYl8D3dDd1ZgemHKVsnPKQu2wg
 +OAecbKCHd8R/W4zmj101Wtgbkqs/GoGSvD68i5F07wjjee9GoLYbXN/eaDowxuOm4sJ
 bbBjk5n38ItPpYB/Zsz8KzseND5/UBMHxacqI1C3NITXIoKD7mmHfiUMKUvOWZmCX1eX
 vTWY3psapH7q0udz+6xCtZfqs0gjLFPwk8IB/MOXgSrWpz/tOwVoD31c5Yxl0K1/JZc6
 kYNQ==
X-Gm-Message-State: AOAM533aukT+cXIZFgkMeHbxWbxRT0p383ggwmqU8/ZnyN7FD0CRO3xx
 5xagWfZyhd5/nNvZ2YPhiunudw==
X-Google-Smtp-Source: ABdhPJxGumq1f4X66i6TO+zX+Nendi0SEOZhdwhtOKFvr5EG1M5X4XyTLpj7eu7zFc4Zf5En2cESHg==
X-Received: by 2002:a7b:c7c3:: with SMTP id z3mr4120498wmk.43.1603825178543;
 Tue, 27 Oct 2020 11:59:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y185sm2892810wmb.29.2020.10.27.11.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 11:59:37 -0700 (PDT)
Date: Tue, 27 Oct 2020 19:59:35 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [PATCH 3/5] Fonts: Add charcount field to font_desc
Message-ID: <20201027185935.GN401619@phenom.ffwll.local>
Mail-Followup-To: Peilin Ye <yepeilin.cs@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sven Schneider <s.schneider@arkona-technologies.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1603788511.git.yepeilin.cs@gmail.com>
 <cb5bb49a33ff54fef41e719ee9d301a6a73c5f9c.1603788512.git.yepeilin.cs@gmail.com>
 <54f7d42e07eca2a2f13669575a9de88023ebc1ac.1603788512.git.yepeilin.cs@gmail.com>
 <6c28279a10dbe7a7e5ac3e3a8dd7c67f8d63a9f2.1603788512.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c28279a10dbe7a7e5ac3e3a8dd7c67f8d63a9f2.1603788512.git.yepeilin.cs@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sven Schneider <s.schneider@arkona-technologies.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 12:34:26PM -0400, Peilin Ye wrote:
> Subsystems are assuming the number of characters of our built-in fonts.
> Include that information in our kernel font descriptor, `struct
> font_desc`.
> 
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

atm can't merge this because we need a backmerge of maybe -rc2 into
drm-misc-next first. Please remind me if this doesn't land next week.
-Daniel

> ---
>  include/linux/font.h       | 1 +
>  lib/fonts/font_10x18.c     | 1 +
>  lib/fonts/font_6x10.c      | 1 +
>  lib/fonts/font_6x11.c      | 1 +
>  lib/fonts/font_6x8.c       | 1 +
>  lib/fonts/font_7x14.c      | 1 +
>  lib/fonts/font_8x16.c      | 1 +
>  lib/fonts/font_8x8.c       | 1 +
>  lib/fonts/font_acorn_8x8.c | 1 +
>  lib/fonts/font_mini_4x6.c  | 1 +
>  lib/fonts/font_pearl_8x8.c | 1 +
>  lib/fonts/font_sun12x22.c  | 1 +
>  lib/fonts/font_sun8x16.c   | 1 +
>  lib/fonts/font_ter16x32.c  | 1 +
>  14 files changed, 14 insertions(+)
> 
> diff --git a/include/linux/font.h b/include/linux/font.h
> index 4f50d736ea72..abf1442ce719 100644
> --- a/include/linux/font.h
> +++ b/include/linux/font.h
> @@ -17,6 +17,7 @@ struct font_desc {
>      int idx;
>      const char *name;
>      unsigned int width, height;
> +    unsigned int charcount;
>      const void *data;
>      int pref;
>  };
> diff --git a/lib/fonts/font_10x18.c b/lib/fonts/font_10x18.c
> index 0e2deac97da0..4096c6562494 100644
> --- a/lib/fonts/font_10x18.c
> +++ b/lib/fonts/font_10x18.c
> @@ -5137,6 +5137,7 @@ const struct font_desc font_10x18 = {
>  	.name	= "10x18",
>  	.width	= 10,
>  	.height	= 18,
> +	.charcount = 256,
>  	.data	= fontdata_10x18.data,
>  #ifdef __sparc__
>  	.pref	= 5,
> diff --git a/lib/fonts/font_6x10.c b/lib/fonts/font_6x10.c
> index 87da8acd07db..32786674cf65 100644
> --- a/lib/fonts/font_6x10.c
> +++ b/lib/fonts/font_6x10.c
> @@ -3083,6 +3083,7 @@ const struct font_desc font_6x10 = {
>  	.name	= "6x10",
>  	.width	= 6,
>  	.height	= 10,
> +	.charcount = 256,
>  	.data	= fontdata_6x10.data,
>  	.pref	= 0,
>  };
> diff --git a/lib/fonts/font_6x11.c b/lib/fonts/font_6x11.c
> index 5e975dfa10a5..81e4a3aed44a 100644
> --- a/lib/fonts/font_6x11.c
> +++ b/lib/fonts/font_6x11.c
> @@ -3346,6 +3346,7 @@ const struct font_desc font_vga_6x11 = {
>  	.name	= "ProFont6x11",
>  	.width	= 6,
>  	.height	= 11,
> +	.charcount = 256,
>  	.data	= fontdata_6x11.data,
>  	/* Try avoiding this font if possible unless on MAC */
>  	.pref	= -2000,
> diff --git a/lib/fonts/font_6x8.c b/lib/fonts/font_6x8.c
> index 700039a9ceae..5618ae7ef9fa 100644
> --- a/lib/fonts/font_6x8.c
> +++ b/lib/fonts/font_6x8.c
> @@ -2571,6 +2571,7 @@ const struct font_desc font_6x8 = {
>  	.name	= "6x8",
>  	.width	= 6,
>  	.height	= 8,
> +	.charcount = 256,
>  	.data	= fontdata_6x8.data,
>  	.pref	= 0,
>  };
> diff --git a/lib/fonts/font_7x14.c b/lib/fonts/font_7x14.c
> index 86d298f38505..7708e73d491f 100644
> --- a/lib/fonts/font_7x14.c
> +++ b/lib/fonts/font_7x14.c
> @@ -4113,6 +4113,7 @@ const struct font_desc font_7x14 = {
>  	.name	= "7x14",
>  	.width	= 7,
>  	.height	= 14,
> +	.charcount = 256,
>  	.data	= fontdata_7x14.data,
>  	.pref	= 0,
>  };
> diff --git a/lib/fonts/font_8x16.c b/lib/fonts/font_8x16.c
> index 37cedd36ca5e..74125d3570cf 100644
> --- a/lib/fonts/font_8x16.c
> +++ b/lib/fonts/font_8x16.c
> @@ -4627,6 +4627,7 @@ const struct font_desc font_vga_8x16 = {
>  	.name	= "VGA8x16",
>  	.width	= 8,
>  	.height	= 16,
> +	.charcount = 256,
>  	.data	= fontdata_8x16.data,
>  	.pref	= 0,
>  };
> diff --git a/lib/fonts/font_8x8.c b/lib/fonts/font_8x8.c
> index 8ab695538395..96da4bb31ae4 100644
> --- a/lib/fonts/font_8x8.c
> +++ b/lib/fonts/font_8x8.c
> @@ -2578,6 +2578,7 @@ const struct font_desc font_vga_8x8 = {
>  	.name	= "VGA8x8",
>  	.width	= 8,
>  	.height	= 8,
> +	.charcount = 256,
>  	.data	= fontdata_8x8.data,
>  	.pref	= 0,
>  };
> diff --git a/lib/fonts/font_acorn_8x8.c b/lib/fonts/font_acorn_8x8.c
> index 069b3e80c434..ba74053fec7b 100644
> --- a/lib/fonts/font_acorn_8x8.c
> +++ b/lib/fonts/font_acorn_8x8.c
> @@ -270,6 +270,7 @@ const struct font_desc font_acorn_8x8 = {
>  	.name	= "Acorn8x8",
>  	.width	= 8,
>  	.height	= 8,
> +	.charcount = 256,
>  	.data	= acorndata_8x8.data,
>  #ifdef CONFIG_ARCH_ACORN
>  	.pref	= 20,
> diff --git a/lib/fonts/font_mini_4x6.c b/lib/fonts/font_mini_4x6.c
> index 1449876c6a27..637708e8c67e 100644
> --- a/lib/fonts/font_mini_4x6.c
> +++ b/lib/fonts/font_mini_4x6.c
> @@ -2152,6 +2152,7 @@ const struct font_desc font_mini_4x6 = {
>  	.name	= "MINI4x6",
>  	.width	= 4,
>  	.height	= 6,
> +	.charcount = 256,
>  	.data	= fontdata_mini_4x6.data,
>  	.pref	= 3,
>  };
> diff --git a/lib/fonts/font_pearl_8x8.c b/lib/fonts/font_pearl_8x8.c
> index 32d65551e7ed..06cde43c7bd2 100644
> --- a/lib/fonts/font_pearl_8x8.c
> +++ b/lib/fonts/font_pearl_8x8.c
> @@ -2582,6 +2582,7 @@ const struct font_desc font_pearl_8x8 = {
>  	.name	= "PEARL8x8",
>  	.width	= 8,
>  	.height	= 8,
> +	.charcount = 256,
>  	.data	= fontdata_pearl8x8.data,
>  	.pref	= 2,
>  };
> diff --git a/lib/fonts/font_sun12x22.c b/lib/fonts/font_sun12x22.c
> index 641a6b4dca42..d0290d79df2c 100644
> --- a/lib/fonts/font_sun12x22.c
> +++ b/lib/fonts/font_sun12x22.c
> @@ -6156,6 +6156,7 @@ const struct font_desc font_sun_12x22 = {
>  	.name	= "SUN12x22",
>  	.width	= 12,
>  	.height	= 22,
> +	.charcount = 256,
>  	.data	= fontdata_sun12x22.data,
>  #ifdef __sparc__
>  	.pref	= 5,
> diff --git a/lib/fonts/font_sun8x16.c b/lib/fonts/font_sun8x16.c
> index 193fe6d988e0..7d83760354a6 100644
> --- a/lib/fonts/font_sun8x16.c
> +++ b/lib/fonts/font_sun8x16.c
> @@ -268,6 +268,7 @@ const struct font_desc font_sun_8x16 = {
>  	.name	= "SUN8x16",
>  	.width	= 8,
>  	.height	= 16,
> +	.charcount = 256,
>  	.data	= fontdata_sun8x16.data,
>  #ifdef __sparc__
>  	.pref	= 10,
> diff --git a/lib/fonts/font_ter16x32.c b/lib/fonts/font_ter16x32.c
> index 91b9c283bd9c..a2cc25b9f8e3 100644
> --- a/lib/fonts/font_ter16x32.c
> +++ b/lib/fonts/font_ter16x32.c
> @@ -2062,6 +2062,7 @@ const struct font_desc font_ter_16x32 = {
>  	.name	= "TER16x32",
>  	.width	= 16,
>  	.height = 32,
> +	.charcount = 256,
>  	.data	= fontdata_ter16x32.data,
>  #ifdef __sparc__
>  	.pref	= 5,
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
