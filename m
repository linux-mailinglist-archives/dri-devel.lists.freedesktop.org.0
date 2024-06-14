Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5C69087B1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 11:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF5510E1EF;
	Fri, 14 Jun 2024 09:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VzEudlC7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3331610E1EF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 09:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718358020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQ6vmkLbNkSPu/I9Dwqivb7WpaSBecMeWv8oRqgyEK0=;
 b=VzEudlC7Sc6ffrMl3Ar+y4UQhx4XC/CiTG4N9B6KvlQLQdIb8o1rw3o+ZCNX0+XiWOZFAn
 dwCgvTqXEJxLy8IodNCpFYXf1jEhetC/S12jHF9EdGJe08bzEJeq5LMTSzD4wkwElPG8va
 lu3E24+7/b0vkwprPA9Bl8loSUQ8JBY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-hpRX3Y1VORi1McZWyF9USw-1; Fri, 14 Jun 2024 05:40:18 -0400
X-MC-Unique: hpRX3Y1VORi1McZWyF9USw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4213441aa8cso13518745e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 02:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358018; x=1718962818;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WQ6vmkLbNkSPu/I9Dwqivb7WpaSBecMeWv8oRqgyEK0=;
 b=JEcA2R0HqmSvBPSAdsu9dQrl0WNR3MKeOz8QN2L4aSS5oH/V52bEegHI7D4T8xDHiW
 0fBZPauMMREY+STyZ4Xbx9vswxLrOHxr3HEjsW69LkE96rDXcWQKO649Q56Kn4wTOUVS
 7BCB9mUjSaZfeuwc+zgGAisMoqGMW7XY1iwVDoEqrNjDDjm2uDZN+jkkRkNRIGEMskg7
 wj4GJfBokR6MCE0Ft/mKQY3oSExfHDTEPPYyDUM7dWFWhFzkrFVknajzrRnsF74cnUf2
 x44ZtX3XyBX8axUwSJ/5xq6Om45a8PrZgG0nZ1oS1klrSJ2h5/KhGALWjr/F9vqD3d+z
 sD9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYPx6kmPR7snj8xAvAj6B1vzU6UJpBCiRZ9DFUVl19oWSLc5Z7ABtXpAHB72FrB5+tGc2qQvG/nCu2nT8Bks0R6o+PCI8bEGZ4ZYlirV5r
X-Gm-Message-State: AOJu0YxMVyDvoRpSBkIpXfdaoB0MeFPfXYNe16igDaigSI+SgOqX2Bt0
 8hm9dLyaNpWA+uwEkRG5WS+idyGINiGPzmbhuAp7zWLO6Rb4G0YwQXfVkN40kJeZVj5UIhEyn9U
 aXtOIsmemhBHQj70uNVIALVCrWnO/s7qsFMd+z6NF/43mo1kW14DJZGwAXe0iCLSzJg==
X-Received: by 2002:a05:600c:15ca:b0:421:5605:8c92 with SMTP id
 5b1f17b1804b1-4230482bd1emr18547795e9.20.1718358017890; 
 Fri, 14 Jun 2024 02:40:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFakVoq3MEUrERr87P+t+k5+jmQRc+ZytUh6W0nxxbHQtB6z8XVXp9wq7vZ5Y5GyQYgFyH93w==
X-Received: by 2002:a05:600c:15ca:b0:421:5605:8c92 with SMTP id
 5b1f17b1804b1-4230482bd1emr18547655e9.20.1718358017557; 
 Fri, 14 Jun 2024 02:40:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075104a3dsm3876092f8f.112.2024.06.14.02.40.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 02:40:17 -0700 (PDT)
Message-ID: <e705b00d-4a05-44b5-8fb2-d18e7389db7a@redhat.com>
Date: Fri, 14 Jun 2024 11:40:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] lib/fonts: Fix visiblity of SUN12x22 and TER16x32
 if DRM_PANIC
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
 <ac474c6755800e61e18bd5af407c6acb449c5149.1718305355.git.geert+renesas@glider.be>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ac474c6755800e61e18bd5af407c6acb449c5149.1718305355.git.geert+renesas@glider.be>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 13/06/2024 21:18, Geert Uytterhoeven wrote:
> When CONFIG_FONTS ("Select compiled-in fonts") is not enabled, the user
> should not be asked about any fonts.  However, when CONFIG_DRM_PANIC is
> enabled, the user is still asked about the Sparc console 12x22 and
> Terminus 16x32 fonts.
> 
> Fix this by moving the "|| DRM_PANIC" to where it belongs.
> Split the dependency in two rules to improve readability.

Sorry I think I misunderstood the SPARC && FONTS condition.
Your fix is much clearer, thanks.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Fixes: b94605a3889b9084 ("lib/fonts: Allow to select fonts for drm_panic")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>    - New.
> ---
>   lib/fonts/Kconfig | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/fonts/Kconfig b/lib/fonts/Kconfig
> index befcb463f7381d1a..3ac26bdbc3ff01a3 100644
> --- a/lib/fonts/Kconfig
> +++ b/lib/fonts/Kconfig
> @@ -105,7 +105,8 @@ config FONT_SUN8x16
>   
>   config FONT_SUN12x22
>   	bool "Sparc console 12x22 font (not supported by all drivers)"
> -	depends on (FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)) || DRM_PANIC
> +	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
> +	depends on !SPARC && FONTS
>   	help
>   	  This is the high resolution console font for Sun machines with very
>   	  big letters (like the letters used in the SPARC PROM). If the
> @@ -113,7 +114,8 @@ config FONT_SUN12x22
>   
>   config FONT_TER16x32
>   	bool "Terminus 16x32 font (not supported by all drivers)"
> -	depends on (FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)) || DRM_PANIC
> +	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
> +	depends on !SPARC && FONTS || SPARC
>   	help
>   	  Terminus Font is a clean, fixed width bitmap font, designed
>   	  for long (8 and more hours per day) work with computers.

