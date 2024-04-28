Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4708B4C11
	for <lists+dri-devel@lfdr.de>; Sun, 28 Apr 2024 16:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A94F10F731;
	Sun, 28 Apr 2024 14:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xjn0bTt1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0036310F7A9
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 14:03:32 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5709cb80b03so3568299a12.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Apr 2024 07:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714313011; x=1714917811; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4LkwHkM4YstZ7I6Hr8RDgjhYJhml/L2D5NhBnPSk8m0=;
 b=Xjn0bTt1GAzZRz7/1aJN1rbO4n3wxt2R5UrxFQ7L679pdD4PxYY+aQkHpmyyYX026z
 inoJ591QWPEbza15A/ov1rHa5MkIZjgiLZ8hZvzXyBMD3eTTX+Ijzl4SO4i7Ie6Hp5ER
 5I1hQwmxpruKVdxb9zrwMVLMo2FKgD8F/y3xBqXI9N4JOflXerpYPnuS5ROL+W+UIBOT
 b9GMYgNbAxCizAfq2mYK5GRnBvX3EP700rXMHR5pqYeN3z1icxCgN8BMKTLVfm9mQTu5
 iKiYdEzgbBNEMornsbO1ni6mUsEe7xK4PvOBcOo8ecip1ODHsGRM+nYeVj7ZMwvDzJo4
 Uelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714313011; x=1714917811;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4LkwHkM4YstZ7I6Hr8RDgjhYJhml/L2D5NhBnPSk8m0=;
 b=o5smbcjE3oT/hUYWeP36W3L+IxSa2ACjhmV49ElekuGKFi4bkcsV34v9D3BF70DfkT
 t0uQwEVP0ARtvuKmGaAVCmkBG5wv+2LHK3UyA+4abWW3GJ5ZYMAEbnON5Iy17EQ2Xp58
 VGtZ++l6tRHlESyhaqOs9rDI/47MnITyLS5iBs2EueBaNh7ZSXbG+Pl+pbdmXFlZe0vO
 1xcVF/9tWGRlsHDvRJjHKPNplbTtBsBQjLqrfPVL7YOxPPv7A/06881zGkTVZVSUlugd
 QEoeFKD587/7gYoJsaawe/mS1GGyZz5wpHLGMoJOQw5XAcVmIZyVZnoXisdcDilakrY9
 5eBA==
X-Gm-Message-State: AOJu0Yx8KGRHetV32t5/+rw0DEGvP9Q6PQvD4kzawYlIKvTajSbJ8g2C
 rOJY4bTchFd8EQY6shnD9uwFv6Yjz76Fm0/XgaNBbAtNIH/0qqqjV29maZLrtA0=
X-Google-Smtp-Source: AGHT+IEsYnfmO00nQBKypL68lPb0+Y9MZyh6Sub86JRNTqRLbUZ2ckphZO76Q5wRWKp2auF76BFgvA==
X-Received: by 2002:a05:6402:26cc:b0:572:57d8:4542 with SMTP id
 x12-20020a05640226cc00b0057257d84542mr4475106edd.8.1714313010990; 
 Sun, 28 Apr 2024 07:03:30 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 j2-20020aa7de82000000b005720e083878sm7545949edv.49.2024.04.28.07.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Apr 2024 07:03:30 -0700 (PDT)
Date: Sun, 28 Apr 2024 17:03:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: pipishuo <1289151713@qq.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft:fixes unnecessary parentheses
Message-ID: <ec7398c5-2bed-4121-bf95-44a7fe3438cf@moroto.mountain>
References: <tencent_FDF9E162435F21368C39AB61255D2F2C8D08@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_FDF9E162435F21368C39AB61255D2F2C8D08@qq.com>
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

On Sun, Apr 28, 2024 at 08:19:08PM +0800, pipishuo wrote:
> This patch fixes the checks reported by checkpatch.pl
> for unnecessary parentheses
> 
> Signed-off-by: pipishuo <1289151713@qq.com>
> ---
>  drivers/staging/fbtft/fb_ili9320.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fb_ili9320.c b/drivers/staging/fbtft/fb_ili9320.c
> index 0be7c2d51548..045275a9bc0b 100644
> --- a/drivers/staging/fbtft/fb_ili9320.c
> +++ b/drivers/staging/fbtft/fb_ili9320.c
> @@ -37,7 +37,8 @@ static int init_display(struct fbtft_par *par)
>  	devcode = read_devicecode(par);
>  	fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, "Device code: 0x%04X\n",
>  		      devcode);
> -	if ((devcode != 0x0000) && (devcode != 0x9320))
> +	if (devcode != 0x0000 &&
> +	    devcode != 0x9320)


Nah, just leave it.  It's a personal preference for Greg.

https://lore.kernel.org/all/?q=init_display%20devcode

regards,
dan carpenter

