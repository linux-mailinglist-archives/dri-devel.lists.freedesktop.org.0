Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10928341895
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 10:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E5B6E33F;
	Fri, 19 Mar 2021 09:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA8D6E33F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 09:41:19 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so6944012wmy.5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 02:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dE/FMXXwTOcZLfKWiTm5qvJwQlSCibf7/ZnsQ3VuA+I=;
 b=cUvirTqY+bHdROH4xdfpGMrp7CwT1frnVIdSmYUtaWWWWj954Z8j45z71527sO+KrZ
 5WQkEOopheMKChAfrdE9h32SdNhfHFZO0zKs7NPsr2x5b5XK3DrR2cl0OZjZkpcwRPCD
 uyUg6tjYCdewlJ2318NC43fksCK75iQU6y4nAXvkOYfja309Ndyn/kcx+rSunDpADNqj
 7xGGjSPrCOPoP26K9qEQsLNvHBw5r4DrHb1BWvR97GcN4NcnYd3Zs5FrtkbZG8d9W1Nn
 R6AJBNeFdMZFJle8Ob1eyXT4ONSp1qP/ZoB9f8urGPwzK+mHzxAUFh4idR4bZzsc2sq8
 3sjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dE/FMXXwTOcZLfKWiTm5qvJwQlSCibf7/ZnsQ3VuA+I=;
 b=PD2RyT/VaY3Y0lk1s3hxtsKKJBtJMzq5YwwnbH6IeXO7dWJiz+jBJxQfMaYNykWopu
 mDJ1gWY6AcsrpZsXSB7L+9yVGlaOo8JEYvvEraK0BldL9Aez45RCXnxmV2lTqFiMQH4t
 MzLH1IMh9N2jSqE5pfB0QqDcGqZ+bFDTt7xr352XypDHHR7hAAl4/KUj1Rk/laZ/+/eC
 qJMMYCm8nUnzIdSB2MKTp2Ey/Pj/TMHVttf2TvuYV6j5dPJUt5tZj0Pb3AHTuoV0WkDK
 cVKXL0Fg4vswIDWvCvYSj36QgaUmENtm2H1LBvRUm0PH+nfpniYPJxPJPLuZnz6nmhFC
 fCzw==
X-Gm-Message-State: AOAM533Yz+t4a5547IvmHlFftC8Xi/AlcDmLcb84d9NOYBuEotN6d3qb
 laE3ikBJ0abHIu+xluZPfzVhyA==
X-Google-Smtp-Source: ABdhPJyhmKqPRcT1Q2L0MAxywvHaux8gt0MC/4MXTIbjMyfjntyMA+cOtPLJ+giH8rEkY7Tb8COX6Q==
X-Received: by 2002:a1c:4e12:: with SMTP id g18mr2803941wmh.56.1616146877840; 
 Fri, 19 Mar 2021 02:41:17 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:62a:14da:7a4b:4aee?
 ([2a01:e0a:90c:e290:62a:14da:7a4b:4aee])
 by smtp.gmail.com with ESMTPSA id m17sm7082516wrx.92.2021.03.19.02.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 02:41:17 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: Fix few typo
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, airlied@linux.ie,
 daniel@ffwll.ch, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210318110046.14830-1-unixbhaskar@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <fd1f66c1-b1ca-bfd2-8a04-64a9b7af4e3c@baylibre.com>
Date: Fri, 19 Mar 2021 10:41:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318110046.14830-1-unixbhaskar@gmail.com>
Content-Language: en-US
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
Cc: rdunlap@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/03/2021 12:00, Bhaskar Chowdhury wrote:
> 
> s/initialy/initially/
> s/desined/designed/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  drivers/gpu/drm/meson/meson_venc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
> index 5e2236ec189f..3c55ed003359 100644
> --- a/drivers/gpu/drm/meson/meson_venc.c
> +++ b/drivers/gpu/drm/meson/meson_venc.c
> @@ -45,7 +45,7 @@
>   * The ENCI is designed for PAl or NTSC encoding and can go through the VDAC
>   * directly for CVBS encoding or through the ENCI_DVI encoder for HDMI.
>   * The ENCP is designed for Progressive encoding but can also generate
> - * 1080i interlaced pixels, and was initialy desined to encode pixels for
> + * 1080i interlaced pixels, and was initially designed to encode pixels for
>   * VDAC to output RGB ou YUV analog outputs.
>   * It's output is only used through the ENCP_DVI encoder for HDMI.
>   * The ENCL LVDS encoder is not implemented.
> --
> 2.26.2
> 

Thanks,
Applied to drm-misc-next

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
