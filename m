Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2A667C691
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 10:03:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BCA10E14A;
	Thu, 26 Jan 2023 09:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FC510E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 09:02:59 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id me3so3285434ejb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 01:02:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zpTA8PogrXlsIUarI4aY2hvRwCUuO/PnjHEhsl7Xlq8=;
 b=HrGorHbg6f0q6It9pXaHKh8R3WSjeB1pOSVJ76iGBkqM8fQbD9+iN7Wj6R/oVRGgMA
 xT5e0u/IXQ9DNH45Ty/K3NXPx/Tym7vlVAxCp4eLWkuNFgNgsN8nNbDJzCrJhbbupQRR
 YyJD8sdHEUge7eBpd0p6otiTtxyqaXo9nt5QGI0YKOxeRAVMMM7g4ruKL4FFUdYsqZ/d
 pvGO8g6tVHwcUg3mrEq0Grg6Pb5kCuEkmwwISpcomRQPgftCXuM2z5GYg1B/V3JbOaOE
 uJh3obO82HTzA+nF49ZCXzFmut7cg8IKRqds3YQD7cAsCOMKxlLrIoZZH2NLwNalhlJI
 DAiA==
X-Gm-Message-State: AFqh2krXt8CJf/QeYOzV+SpQHJmZnwDxVUen4m5Bip2NVtRm36rd/ZC0
 7YJ8QievE56/41vGhCFkzxQ=
X-Google-Smtp-Source: AMrXdXvZTr1bl/my1N+x4SHitbZ1MhWds08SNNOyDBFXgOff3S0BXuCoVCAZAMhJfKWBuQ1dj1pmtg==
X-Received: by 2002:a17:907:2135:b0:86f:fe8a:be with SMTP id
 qo21-20020a170907213500b0086ffe8a00bemr35892174ejb.4.1674723777426; 
 Thu, 26 Jan 2023 01:02:57 -0800 (PST)
Received: from [192.168.1.49] (185-219-167-24-static.vivo.cz. [185.219.167.24])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a170906244f00b00877de2def77sm294393ejb.31.2023.01.26.01.02.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 01:02:56 -0800 (PST)
Message-ID: <3bcd9911-5fdd-2a1a-0a76-55e1b8f7642a@kernel.org>
Date: Thu, 26 Jan 2023 10:02:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] fbcon: Check font dimension limits
Content-Language: en-US
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 gregkh@linuxfoundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>
References: <20230126004911.869923511@ens-lyon.org>
 <20230126004921.616264824@ens-lyon.org>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230126004921.616264824@ens-lyon.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>, stable@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26. 01. 23, 1:49, Samuel Thibault wrote:
> blit_x and blit_y are uint32_t, so fbcon currently cannot support fonts
> larger than 32x32.
> 
> The 32x32 case also needs shifting an unsigned int, to properly set bit
> 31, otherwise we get "UBSAN: shift-out-of-bounds in fbcon_set_font",
> as reported on
> 
> http://lore.kernel.org/all/IA1PR07MB98308653E259A6F2CE94A4AFABCE9@IA1PR07MB9830.namprd07.prod.outlook.com
> Kernel Branch: 6.2.0-rc5-next-20230124
> Kernel config: https://drive.google.com/file/d/1F-LszDAizEEH0ZX0HcSR06v5q8FPl2Uv/view?usp=sharing
> Reproducer: https://drive.google.com/file/d/1mP1jcLBY7vWCNM60OMf-ogw-urQRjNrm/view?usp=sharing
> 
> Reported-by: Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> 
> Index: linux-6.0/drivers/video/fbdev/core/fbcon.c
> ===================================================================
> --- linux-6.0.orig/drivers/video/fbdev/core/fbcon.c
> +++ linux-6.0/drivers/video/fbdev/core/fbcon.c
> @@ -2489,9 +2489,12 @@ static int fbcon_set_font(struct vc_data
>   	    h > FBCON_SWAP(info->var.rotate, info->var.yres, info->var.xres))
>   		return -EINVAL;
>   
> +	if (font->width > 32 || font->height > 32)
> +		return -EINVAL;
> +
>   	/* Make sure drawing engine can handle the font */
> -	if (!(info->pixmap.blit_x & (1 << (font->width - 1))) ||
> -	    !(info->pixmap.blit_y & (1 << (font->height - 1))))
> +	if (!(info->pixmap.blit_x & (1U << (font->width - 1))) ||
> +	    !(info->pixmap.blit_y & (1U << (font->height - 1))))

So use BIT() properly then? That should be used in all these shifts 
anyway. Exactly to avoid UB.

thanks,
-- 
js
suse labs

