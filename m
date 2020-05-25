Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 327CB1E1C2D
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 09:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569AC89D8A;
	Tue, 26 May 2020 07:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D8889FFD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 10:54:08 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id a2so20006988ejb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 03:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=I2SbXHPPSfQYxydd3wzVxKM/dM5peIMZZus8bzRPuPo=;
 b=q4lxaU9CtOqrjY7oTsTXqky1nSVO0crs1fSCGfajCpOJOJEkhb2krEfjE2ivsNddo8
 LL4BA0vUQhaBvhZBsXjfN0SuYXpWeL6hFzInK8QZuSMOH1Faptdjtvz1+1xAQ/iJeOfS
 mgLaqeMgFHFopi+2y37hjqF4dvJMyaYHF3ZLqqoJNz3fXfxCCF+LsaTs+UvwPWEu2ITj
 Ifb2nW/EuqSEEyYkqf/KsmkKOp3oHVfzcMni37bT0PXZM3dVHQ/X8/lxkoj/VG9sf2YN
 0S+3RlGK64BfGVU2ykWHHZI1G6HExpHG3BoD9J+swJSzGUUPyY9QZ7BFj40CoeV11eIM
 YVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I2SbXHPPSfQYxydd3wzVxKM/dM5peIMZZus8bzRPuPo=;
 b=rty8c9+PSCBa5kNMOF9X0fcD2kcAMcpGyNcDo1s5RgHt59o0h+S7r1FdaVAPpq3M4/
 W5C327ipllcNwi+YtmbDsSCkdxQm6W1yXYsIbNk0+0Z9JBwPSkx/lM0VwZfjXvucAsYf
 XUZRQcBFkicleTQNVpLK8+Nskzhb7IS5ipO2ScOO3UALeVy4DG+A6aNxM+SRy8QZpNnu
 qUJvyFaxI/RgMw2/B3qEE1HEvlIK+nj6heaZTTJ/9GA2QmBjyJNCxRDG5xV2lVp7mH3b
 DKQzxNotrI5PvbWPN3w5EoT1MObqCHBiOEQUamMYbvm3r9eSf4R9zd+3exXZ0yapXdja
 OiTg==
X-Gm-Message-State: AOAM533zilUqNJQs9ZX6jcZP6iq7xkwRuHf3D9q5XHRq5ty2NkPK3Adx
 NMZbDLqXgFBrOE59VVu92bo=
X-Google-Smtp-Source: ABdhPJwi1ssc7Gtx/iriU4TwkE8NvmkswAIt2uL7Im8Q8vBREkBMDvgoet34z0Judn6oiPaJ9Kzewg==
X-Received: by 2002:a17:906:a0c2:: with SMTP id
 bh2mr19064586ejb.458.1590404047012; 
 Mon, 25 May 2020 03:54:07 -0700 (PDT)
Received: from localhost (ip1f115f16.dynamic.kabel-deutschland.de.
 [31.17.95.22])
 by smtp.gmail.com with ESMTPSA id cm26sm15127731edb.87.2020.05.25.03.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 03:54:05 -0700 (PDT)
From: Oliver Graute <oliver.graute@gmail.com>
X-Google-Original-From: Oliver Graute <oliver.graute@kococonnector.com>
Date: Mon, 25 May 2020 12:53:32 +0200
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] staging: fbtft: fb_st7789v: make HSD20_IPS numeric and
 not a string
Message-ID: <20200525105332.GB12301@archlinux.localdomain>
References: <20200521135038.345878-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521135038.345878-1-colin.king@canonical.com>
X-Mailman-Approved-At: Tue, 26 May 2020 07:26:30 +0000
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/05/20, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently HSD20_IPS is defined as "true" and will always result in a
> non-zero result even if it is defined as "false" because it is an array
> and that will never be zero. Fix this by defining it as an integer 1
> rather than a literal string.
> 
> Addessses-Coverity: ("Array compared against 0")
> Fixes: f03c9b788472 ("staging: fbtft: fb_st7789v: Initialize the Display")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/fbtft/fb_st7789v.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
> index ebc17e05ecd0..3a280cc1892c 100644
> --- a/drivers/staging/fbtft/fb_st7789v.c
> +++ b/drivers/staging/fbtft/fb_st7789v.c
> @@ -24,7 +24,7 @@
>  	"D0 05 0A 09 08 05 2E 44 45 0F 17 16 2B 33\n" \
>  	"D0 05 0A 09 08 05 2E 43 45 0F 16 16 2B 33"
>  
> -#define HSD20_IPS "true"
> +#define HSD20_IPS 1
>  
>  /**
>   * enum st7789v_command - ST7789V display controller commands

Acked-by: Oliver Graute <oliver.graute@kococonnector.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
