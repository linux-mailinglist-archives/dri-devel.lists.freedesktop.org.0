Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FD3A4320C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 01:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7200710E09F;
	Tue, 25 Feb 2025 00:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ee71tfbU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0360610E09F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 00:47:48 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-6dd15d03eacso47935476d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 16:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740444468; x=1741049268; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EpDv/XBjF+s4P5146GDNRKrfP1oGnV2PgjpHddvbttk=;
 b=Ee71tfbUe81atLw8PxDDqcRZFGVmrmCbI28kzmKrmtwdFDlenwsxYwuXR8ikbd3eZS
 ZwjE71IPL8rsjmkGisyKxUSf+DO+VehO0gDhMYcj5G5VYUqp3U/wSLdEP0KVGAD/FcSn
 NnsZGoVvo3zPHL1CVDQn3R9PXuLLC7eT2GMiHW98PSXqXg1ioN0XyRsQNUu6smz8x+SG
 pjAkbTgAg81038WcxeIv4n3jurPFh0XRU0tZzjy5/CP7EX5u7j0NK4vZj4YKrkef6j/z
 kDCspgkbY4wD0trYpV9SZ5J0rS4lbzgL05nTqIw8IYQksAP0vHUx6TPg6DgPoUy06xG0
 9FIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740444468; x=1741049268;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EpDv/XBjF+s4P5146GDNRKrfP1oGnV2PgjpHddvbttk=;
 b=LdB4Y3s3+ODjSCPi6mcOVHi6r8LuLvhnRoDZ85b7DNYHnQS49OfsS4PRSJO7X9cciM
 F7Wmdh6KH7NCV7JvywNsalSlwLaHuzw/UwFablE1o40tc8QQs/jWjMD2/UlFT/GT+/3l
 8TlNrAPJ5EYzAI3OQ4MgEibIwhOvQ4IgLui6J9Mac3pi8up4fXPxQIzGZExsCYebXk1z
 4DbW7NW6o5JDAXePrez7Y2aPjiEfr6kYOAttWA9mpojzNs2giu7x3UBVTwAg/iu12VxD
 878JpdI3lzqFUWM3Y/tCtsFiEnFkJvL06ZASg7SwVi00YJe8UCT0SZFV7L6ILS3u/U9a
 XC/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoNmjmfOcqdTOlO/AK7Mc0hMlKpSDlqUgFaLP7dmQSaMUnKBmoqRZH2isXf/x7CoTCntC5ZNcqIc4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxI66rdpxtxTbKxWSD4tjSTeoLGwBlZ+ASjHAVDnyKXtQY3/0H/
 nkYVCIThlPW8T59nEJbig6nre+HtBZwgo+SfJ9YCGn8HUFBZUjr1
X-Gm-Gg: ASbGncsA9tmYrE/20hJyHWYDFHAff9x8Yx4PBghadQFtZ8fMm7j6bzrhWWUBUOCCMe1
 iCuMvMLe0+EFVyh33HYRIz7DMKqkD3bPcG5jJwsGmrOjzeVcagYb/k2t3wfQkd9gFF5GegFDnzP
 671FaYbH3NxdSyeZ2ebFIPfab48gXEtvgVJuIDl2u9RC8r3r1QFkMbWToeSYuDTjhE1cIwEqIbL
 vsU6Nx60ohQnGJXJvZdbjRdXGmtpAw6QQjky8U4ygP6QEV/SZuwS+byo1CiVRsw729FLMZHHaGB
 kdMWACwYPfAyMZDwyKUHSvIMc5xfuDU95K/eaKyfm0w+AmPMUo4U
X-Google-Smtp-Source: AGHT+IG+6SM+Bt5UY1qGOeuFzoM5/5BVekUTVIxeOCAtQEf994Mkci1dcvUTDHwYRZ/LzO3ZtcuihA==
X-Received: by 2002:a05:6214:48c:b0:6d4:287d:b8d9 with SMTP id
 6a1803df08f44-6e6ae70a617mr221340466d6.2.1740444467841; 
 Mon, 24 Feb 2025 16:47:47 -0800 (PST)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6e87b06dc4csm3561956d6.21.2025.02.24.16.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 16:47:46 -0800 (PST)
Date: Mon, 24 Feb 2025 19:47:44 -0500
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] drm/repaper: fix integer overflows in repeat functions
Message-ID: <guxzx56pabmen5gb2mauvpyazpxvod7ofmz6zmisluugrirw4v@mzs5yg6m4pox>
References: <20250116134801.22067-1-n.zhandarovich@fintech.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116134801.22067-1-n.zhandarovich@fintech.ru>
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

On Thu, Jan 16, 2025 at 05:48:01AM -0800, Nikita Zhandarovich wrote:
> There are conditions, albeit somewhat unlikely, under which right hand
> expressions, calculating the end of time period in functions like
> repaper_frame_fixed_repeat(), may overflow.
> 
> For instance, if 'factor10x' in repaper_get_temperature() is high
> enough (170), as is 'epd->stage_time' in repaper_probe(), then the
> resulting value of 'end' will not fit in unsigned int expression.
> 
> Mitigate this by casting 'epd->factored_stage_time' to wider type before
> any multiplication is done.
> 
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
> 
> Fixes: 3589211e9b03 ("drm/tinydrm: Add RePaper e-ink driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
>  drivers/gpu/drm/tiny/repaper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
> index 77944eb17b3c..d76c0e8e05f5 100644
> --- a/drivers/gpu/drm/tiny/repaper.c
> +++ b/drivers/gpu/drm/tiny/repaper.c
> @@ -456,7 +456,7 @@ static void repaper_frame_fixed_repeat(struct repaper_epd *epd, u8 fixed_value,
>  				       enum repaper_stage stage)
>  {
>  	u64 start = local_clock();
> -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
> +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
>  
>  	do {
>  		repaper_frame_fixed(epd, fixed_value, stage);
> @@ -467,7 +467,7 @@ static void repaper_frame_data_repeat(struct repaper_epd *epd, const u8 *image,
>  				      const u8 *mask, enum repaper_stage stage)
>  {
>  	u64 start = local_clock();
> -	u64 end = start + (epd->factored_stage_time * 1000 * 1000);
> +	u64 end = start + ((u64)epd->factored_stage_time * 1000 * 1000);
>  
>  	do {
>  		repaper_frame_data(epd, image, mask, stage);

Applied! Thanks for the patch.

Best regards,
Alex
