Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E3055ACF1
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE16310E77A;
	Sat, 25 Jun 2022 22:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC7910E122
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 22:33:57 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id u12so11597305eja.8
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 15:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hBhJptopoTkt6ik5tFgrjRtOgxZF1EOY7K3onbFGODg=;
 b=GcpGUjyJt1mtMIbKTGYeFOq/rVS+KwFN1oIuATyVxolgJPEy8jQPYDVWF7CWKGw97d
 xj5k/eRTfEGGIdTtY1iSEGivgMB+dgY22CM3KH8g7shKuz2obeWpqeu96+dVhMpADsvo
 m+/513CeU+rqE2GI/2JEsRiKzAPZeZQGGe46o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hBhJptopoTkt6ik5tFgrjRtOgxZF1EOY7K3onbFGODg=;
 b=8Eq1N35v1ZrCObjSzJYEZB4zIm1cKcF8tD/bAOgjQW7G+K/TdvZPt6oyZwsZY1ihAQ
 /tWuwEPr/OP5RJM+KlcLH+FHJN6G8M2XIKpx49wuhCWhz9sgnkJkS7BG0W8DAJSZPYx7
 kGuplly12/Z0st574I4j6xPORgmZ8hobpFjKDqai/mgDQOAXy1E1aBykNNJmGS1NGkVa
 m+jv9C5uZdL11lzZhmyCnJCR2PuwZqZ0L1pMkcmPwN1cJ9LUTzIbQpM/rWUA0d/DT5B0
 xkjpAkX+A3f7NP7dKjl6tNUGwhb30sU26mt562qTKfWS2M7epHu5ecYZfjWoa1k9KSrY
 jBYg==
X-Gm-Message-State: AJIora/m772X3SKnjWmy83rorZPa2YQZFowP+iyMHqrwOP3ryuV3Alty
 HpF2pzMEyxiFDE6gLqnhYdJmeQ==
X-Google-Smtp-Source: AGRyM1trmZhTJbRK7mEkbfjEoaY4QE+COls9DqPPUCbjYE+dWCi5Kcc0m5DUpCVAadzHrUeBy/u+4g==
X-Received: by 2002:a17:906:7a0e:b0:722:e8ce:8c7f with SMTP id
 d14-20020a1709067a0e00b00722e8ce8c7fmr5684755ejo.405.1656196435810; 
 Sat, 25 Jun 2022 15:33:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p27-20020a1709060ddb00b00722e559ee66sm3023824eji.62.2022.06.25.15.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 15:33:55 -0700 (PDT)
Date: Sun, 26 Jun 2022 00:33:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v3 3/4] fbmem: Check screen resolution change against
 font size
Message-ID: <YreNUfv8d9QeJT8C@phenom.ffwll.local>
References: <20220625220630.333705-1-deller@gmx.de>
 <20220625220630.333705-4-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625220630.333705-4-deller@gmx.de>
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

On Sun, Jun 26, 2022 at 12:06:29AM +0200, Helge Deller wrote:
> Enhance the check in the FBIOPUT_VSCREENINFO ioctl handler to verify if the
> user-provided new screen size is bigger than the current font size.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org # v5.4+

Please squash with previous patch. You might also want to add a note there
that on older kernels backporters need to open-code
fbcon_info_from_console instead, since it only exists since 
409d6c95f9c6 ("fbcon: Introduce wrapper for console->fb_info lookup")

With these two nits: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/video/fbdev/core/fbmem.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index afa2863670f3..160389365a36 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1106,7 +1106,9 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
>  			return -EFAULT;
>  		console_lock();
>  		lock_fb_info(info);
> -		ret = fb_set_var(info, &var);
> +		ret = fbcon_modechange_possible(info, &var);
> +		if (!ret)
> +			ret = fb_set_var(info, &var);
>  		if (!ret)
>  			fbcon_update_vcs(info, var.activate & FB_ACTIVATE_ALL);
>  		unlock_fb_info(info);
> --
> 2.35.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
