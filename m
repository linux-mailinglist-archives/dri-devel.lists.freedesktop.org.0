Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1985055B0F8
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 11:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1649E10EAE2;
	Sun, 26 Jun 2022 09:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786CB10EBFA
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 09:59:08 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id fd6so9203613edb.5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 02:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ba2A2LUzBT/BXK5YWoAonhgXhHOBit1X/l8wGNO4e5o=;
 b=aBeuPpI0SggqA/KaJcJ7Q+aPU6VYyfRMpHsrQ6rA/iTyRFLgiFkn/k2z6xtbJIC98U
 iKt2O35MsfRW7dGjd19S7xHb3m1C5WclzK6eZeZ/9YWqELUMsEXcaUhU4OxP9mOSTTlz
 k2ObNHN6+AHPNa7eYKINo9HV/cfIfgl7T7PNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ba2A2LUzBT/BXK5YWoAonhgXhHOBit1X/l8wGNO4e5o=;
 b=3pCEKc2v1qwqykqklTox+/e+k43Hy0OW61hLKg5nUOy1FKyqu5WS6UHSJBBHB4BymS
 Can+KRtdxpY4YTvvWAcNVVpi4bppZt6FAiWqmLy80fDeMlmV03XRQxBkmF/uH+J82Hqp
 +mc9oG8qv0WLp5ugzxfOotSLthj0muOcWuq9IxXSMMdna+LFIsXM0E8BEmFghHPpTq4G
 MpDdGmb5a3roYiTKcE0rwQwxERoqU7gqRqzVwRd0O1NLI62kDfVthxOOiPPgBtPmGIkP
 RMslod7NctNZVRVIOaOcCr4DWrGNClJFFl7coXSYQpoHqR5K0RWSvmKzGTTaAdq92mXV
 a4KA==
X-Gm-Message-State: AJIora/t+kU/KLKJfhuCO+m5vHP4OQwK3dxcf5NlQ/5erk9Nm9KKBArj
 MOeqccvpXCzPnUlyWEJAHUw/kw==
X-Google-Smtp-Source: AGRyM1soovyaHhL8DMkp9YxG+GVp54YnlsbV4N628bbSUrne9pRBo3a/ANnKNLheNmWKfpXiRRCYFg==
X-Received: by 2002:a05:6402:3511:b0:437:7eec:c44c with SMTP id
 b17-20020a056402351100b004377eecc44cmr3948744edd.11.1656237547002; 
 Sun, 26 Jun 2022 02:59:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 rl19-20020a170907217300b00722df6db8f3sm3536367ejb.115.2022.06.26.02.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jun 2022 02:59:06 -0700 (PDT)
Date: Sun, 26 Jun 2022 11:59:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v5 4/4] fbcon: Use fbcon_info_from_console() in
 fbcon_modechange_possible()
Message-ID: <Yrgt6PIyHz3dzJIk@phenom.ffwll.local>
References: <20220626085615.53728-1-deller@gmx.de>
 <20220626085615.53728-5-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220626085615.53728-5-deller@gmx.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 26, 2022 at 10:56:15AM +0200, Helge Deller wrote:
> Use the fbcon_info_from_console() wrapper which was added to kernel
> v5.19 with commit 409d6c95f9c6 ("fbcon: Introduce wrapper for console->fb_info lookup").
> 
> Signed-off-by: Helge Deller <deller@gmx.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/video/fbdev/core/fbcon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 69c7261ac334..2ab7515ac842 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2751,7 +2751,7 @@ int fbcon_modechange_possible(struct fb_info *info, struct fb_var_screeninfo *va
>  	/* prevent setting a screen size which is smaller than font size */
>  	for (i = first_fb_vc; i <= last_fb_vc; i++) {
>  		vc = vc_cons[i].d;
> -		if (!vc || registered_fb[con2fb_map[i]] != info)
> +		if (!vc || fbcon_info_from_console(i) != info)
>  			continue;
> 
>  		if (vc->vc_font.width  > FBCON_SWAP(var->rotate, var->xres, var->yres) ||
> --
> 2.35.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
