Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28EB30BADF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 10:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936126E944;
	Tue,  2 Feb 2021 09:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9326E944
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 09:25:45 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m13so19639889wro.12
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 01:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=a1OCFu7h0TcIowMDv7zHkZMNSiLVb4YwniBrbKA3xlU=;
 b=uF0X2tH0q3rC8OeRvULloT49lCKeBEQIIw6QI9tlhujC4RF3Y6JwL4phRurV64uvih
 vIy/Bkwwwa+OwUknuhm87RzJbo3TmKLf4F4bTWnWohj0xvbesjcgJf0vvzfBB/IuDpr2
 T5sGY0IN4mRqFiNIkf4AjHGbM1BMcLte31RgDWX4v3q3MchbIgY1ke2jBZT8K57WRNa5
 pIM1hekoQS2WUKBuoyDGNSrnzcifBgBLcCwgYgsxQpKhEok5Eamv5Ksvda7NJQk69CUw
 d2ITCAYRN0sV3AErdVtbrN7+deweE3u94fcS9QmF00PXgEkmZJ1YQlK7NALcXBFTO2LM
 R6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a1OCFu7h0TcIowMDv7zHkZMNSiLVb4YwniBrbKA3xlU=;
 b=nNcW/z1v/2rCxM3f2COSh1Zjeb04WjbWRblwGLzdeE4il7vBsLKpoTrOx2W4He9Jpu
 7C8BhMRFu0AbC/4rQXlMvdL010Iz4wlsjRGriFD82fUAlEUX95kslwHmmJ9q4p0HT3wO
 vfWu8LgfNtgO9XN4MHFwRp/wZBUOK+1RUYaFZk2f4AquUAhi3kXTy1cgMnvE6XzLejxO
 ZJjPkqoLUyEB0unARbacQqAnAc6h1mi8bPbPtp3WxMIOhk6E9skvEkIesjIIv7wM9jJz
 RRjHbxMeMsfGpljGvFzilEOlUNrOu4Kp4TekeLqRHT77ovFLBBFpHsV4q3Y8aUCoxmDS
 yiiA==
X-Gm-Message-State: AOAM5317rK4Qi74esStMYmAPVSsTYq0AfCGaNEf0po7q6lXzqWfFpDON
 IAgGDV0IArArsQPYAK1jfCtoKg==
X-Google-Smtp-Source: ABdhPJy7kfZ4o7WstsegOSMCSFJFOfW1Ibzofjf5AFjyCjsHJFeZ5+FIwpQN0elV9b07P6x7DgPmdw==
X-Received: by 2002:adf:fc8a:: with SMTP id g10mr23343632wrr.189.1612257944619; 
 Tue, 02 Feb 2021 01:25:44 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id q24sm2040048wmq.24.2021.02.02.01.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 01:25:43 -0800 (PST)
Date: Tue, 2 Feb 2021 09:25:41 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Wenjia Zhao <driverfuzzing@gmail.com>
Subject: Re: [PATCH] backlight: pcf50633: pdata may be a null pointer, null
 pointer dereference cause crash
Message-ID: <20210202092541.2wvzpe53mavrd47x@maple.lan>
References: <1612190499-73818-1-git-send-email-driverfuzzing@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612190499-73818-1-git-send-email-driverfuzzing@gmail.com>
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
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 01, 2021 at 08:41:38AM -0600, Wenjia Zhao wrote:
> Signed-off-by: Wenjia Zhao <driverfuzzing@gmail.com>

There should be a patch description here explaining why the patch
is needed and how it works.


> ---
>  drivers/video/backlight/pcf50633-backlight.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/pcf50633-backlight.c b/drivers/video/backlight/pcf50633-backlight.c
> index 540dd338..43267af 100644
> --- a/drivers/video/backlight/pcf50633-backlight.c
> +++ b/drivers/video/backlight/pcf50633-backlight.c
> @@ -127,7 +127,8 @@ static int pcf50633_bl_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, pcf_bl);
>  
> -	pcf50633_reg_write(pcf_bl->pcf, PCF50633_REG_LEDDIM, pdata->ramp_time);
> +  if (pdata)
> +    pcf50633_reg_write(pcf_bl->pcf, PCF50633_REG_LEDDIM, pdata->ramp_time);

Assuming you found this issue using a static analyzer then I think it
might be better to if an "if (!pdata) return -EINVAL" further up the
file instead.

In other words it is better to "document" (via the return code) that the
code does not support pdata == NULL than to add another untested code
path.


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
