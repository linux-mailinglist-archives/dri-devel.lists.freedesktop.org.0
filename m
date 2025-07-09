Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20772AFEA2D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 15:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AB910E7F6;
	Wed,  9 Jul 2025 13:29:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="LGNajlkj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A78110E7E9
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 13:29:20 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4538bc1cffdso48544095e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 06:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752067758; x=1752672558; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P7ChNGg4ytvrkyPdwTVY+tgK9qtOn9MNMSkgYieKFrs=;
 b=LGNajlkjxb8WuT7l54S41mlgoytxcyPm+PjvYLd9slPvg92DMORvPI/Qee0Ky+fsQw
 jqoJcSCsn/P9TtC1pihSZB4VZimmkP5cmsPfIVeBS4FIOwGe7sHK/jkqJh2axWpOkzRl
 ++GSrqZ8pY9xnFePwViGPciBAYfwbI1l9rLjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752067758; x=1752672558;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P7ChNGg4ytvrkyPdwTVY+tgK9qtOn9MNMSkgYieKFrs=;
 b=fTFjOjyx4Lew6OdQK6nnwWL1YZwE/QzHQAG+Ruoi4PxHUcIFt5/FiHla/mjBX3ZouP
 aAHY1B4c1KKbQ7Y0879h9KA3D/64jWfQheBfyTYeBVLLw7aqF4hcy6rQek2MuJI7PtWm
 YkI74qxlmntqKXm/OnE8Uq+6YMfVY+qwok9bO9ugUeoPujQ5KWIH4FkKeOExJjyrt1UI
 M8MyqT6eaLlP2xkHdpyLgZ32K0gXwqXJo6DwCCtLaxL3ujBggyA4S5WM2aDyI02PURek
 PvOLv8MZoXVmdyQjVAyjRF4XHd5X/dp9qSpNK34IQxfPvvKydrCR3ST+ACQp32jn9ZEg
 AuJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLc69d3gIPGzDcBcWpoMfKDkw2Zxc2bohrshalNN75YtTP5k54JGFsnBjeBBsocN53c4r2RKq4tzs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxVzQ82KmbTiFX/szbaIqPAWoF/jUaffaN85mc4Ok9KSV1RS+x
 GZfZ5kEdnKA7IYquMJysbc93RfswlIcOzx3LoDu4J4iowv7VzJ8ZnuVHvJChJzbYB1jHZUPaAXT
 t70EMqAU=
X-Gm-Gg: ASbGncsnwDqmMm8ylvUhxymFM1XYq7HNKt8oy1Z0nYbRumOxFmMIoMcf8xJuPABnzcW
 HH1mqWsgbTINzgo7QMRCsS8g86qwY8ZwAREONDKMNQuvlXIbOOslVs9/IVrrVs3XdqqmNo8Fsnw
 Xm+I7EPvE23LzOVdhzfJF4JT+7bYSXWx2QP2xgRdyJUZnxLeiNifQ1SrQcH0OP1JKts6lDHfY5L
 LzsWCb6x+jUUHiwc5YxiOY1zpX1Az43lNqcsW1lyNIeh/1mtWx1T7z/7ue4v2g/dF+4nJsWz4m9
 sF33Q+o4Zt+QEFJGsYwZw4o3neiycsKCe2BjDpeNc07BAlAn8qDEgvFCG0BqmQlrBhoOAYhnRQ=
 =
X-Google-Smtp-Source: AGHT+IFar//XMLNwcASIfuk7qcZqw3/wXyQn3J1+S0W4CZBJrV82FSt+WnK9/ttO97p5WJTa6+FvZA==
X-Received: by 2002:a5d:5c84:0:b0:3a5:1c0d:85e8 with SMTP id
 ffacd0b85a97d-3b5e44e3c24mr2126864f8f.22.1752067758459; 
 Wed, 09 Jul 2025 06:29:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47030ba29sm15624007f8f.2.2025.07.09.06.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 06:29:18 -0700 (PDT)
Date: Wed, 9 Jul 2025 15:29:16 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: oushixiong1025@163.com
Cc: Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH] fbcon: Fix outdated registered_fb reference in comment
Message-ID: <aG5urDySjLCCj86J@phenom.ffwll.local>
Mail-Followup-To: oushixiong1025@163.com, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Shixiong Ou <oushixiong@kylinos.cn>
References: <20250709103438.572309-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709103438.572309-1-oushixiong1025@163.com>
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

On Wed, Jul 09, 2025 at 06:34:38PM +0800, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
> 
> The variable was renamed to fbcon_registered_fb, but this comment was
> not updated along with the change. Correct it to avoid confusion.
> 
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>

I've added the right Fixes: line and merged this to drm-misc-next, thanks
for your patch.
-Sima

> ---
>  drivers/video/fbdev/core/fbcon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 25684f5d6523..d8eab4859fd4 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -953,13 +953,13 @@ static const char *fbcon_startup(void)
>  	int rows, cols;
>  
>  	/*
> -	 *  If num_registered_fb is zero, this is a call for the dummy part.
> +	 *  If fbcon_num_registered_fb is zero, this is a call for the dummy part.
>  	 *  The frame buffer devices weren't initialized yet.
>  	 */
>  	if (!fbcon_num_registered_fb || info_idx == -1)
>  		return display_desc;
>  	/*
> -	 * Instead of blindly using registered_fb[0], we use info_idx, set by
> +	 * Instead of blindly using fbcon_registered_fb[0], we use info_idx, set by
>  	 * fbcon_fb_registered();
>  	 */
>  	info = fbcon_registered_fb[info_idx];
> -- 
> 2.25.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
