Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D783446A0
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 15:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DFA6E4AF;
	Mon, 22 Mar 2021 14:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163ED6E4AF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 14:06:54 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id y6so19525160eds.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 07:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t/2s+954obYYYvfPPKYV/MKVFqMujQRZpsixAvLm03g=;
 b=a/yO+V560t7ce7Vt/0d1tZoDYsIUrdm7HOfwvQTIReziWQirYigLPA4zQEy2hpbC4+
 8gH2Pjn+GgwBgy0b+XpsyRfw4ln+RgJUwa3rO0cweDWpui3CcSco+LgEzXJBtEADych3
 ya6Dxs3t127us8Fi/1i2VUUITBbyfnKGuhKUBs3c/18zGNWzz416gmorjXcz+w0kub7b
 a73uuBETvimdvEE3WmdsPQ4Jzit7IWtEZSKYAR7vslVCdLL+d1rONDob7UyyUCw7WFER
 Al0IZNkn9+6y0Udbt6eEUDVvqAlOblj+oxDUnRkGbokWa0EuhmTCOYg0jchiJFGE4HR/
 MjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t/2s+954obYYYvfPPKYV/MKVFqMujQRZpsixAvLm03g=;
 b=FzDoT1h66fsZE8f/qYhUZDCH3a9nl8NelicHCAxQUnSSd7RqLQAgUd5/AVmvYffwm/
 LJ4gsktBEa7kCoyclEWtg4r7OJW3lhLP00fUdrVr1RAcP/1ulQf7KvKRiyADlT0edcQH
 KNnkJ5r6I46gio8tB8xAj4/yFhYv+eBRj6KYSYwAQLkPpWwKEz89I3XE4YbiokCU7FHC
 WxS8uiN4gF0B8r7TGVopmwonLJRQzBwdFx6mX1dcvAFq6hwbWTtYHAEbDsdDSD7ZLbwQ
 C5kWTAWA1aSerSW4y02j0MjyrAe4I3PKmzK25iFA1JOLuyIOWJ3NJpxK9k+bKZc5sZer
 RPoA==
X-Gm-Message-State: AOAM5326ySZvu0Ry0ZF6No4Y2DVDKBPxBORAlPrD56wiG6PiPUPmlV8l
 3VpJmTMsqnAE30/k9V2ft0IXXg==
X-Google-Smtp-Source: ABdhPJwlWitXU19J0QjeDakKTr92retcrdsPMIXS8/k0WgpObLsS3k6Y2SE5vuYTyTLpZW84noUZBw==
X-Received: by 2002:aa7:dc49:: with SMTP id g9mr25392553edu.60.1616422012759; 
 Mon, 22 Mar 2021 07:06:52 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id q16sm11735184edv.61.2021.03.22.07.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:06:52 -0700 (PDT)
Date: Mon, 22 Mar 2021 14:06:50 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] backlight: ktd253: Support KTD259
Message-ID: <20210322140650.hjv7aa4s3ldonqc2@maple.lan>
References: <20210321114341.944696-1-linus.walleij@linaro.org>
 <20210321114341.944696-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210321114341.944696-2-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 21, 2021 at 12:43:41PM +0100, Linus Walleij wrote:
> The KTD259 works just like KTD253 so add this compatible
> to the driver.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Oh no... there's more of them ;-) .

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>  drivers/video/backlight/ktd253-backlight.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/ktd253-backlight.c b/drivers/video/backlight/ktd253-backlight.c
> index d7b287cffd5c..a7df5bcca9da 100644
> --- a/drivers/video/backlight/ktd253-backlight.c
> +++ b/drivers/video/backlight/ktd253-backlight.c
> @@ -173,6 +173,7 @@ static int ktd253_backlight_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id ktd253_backlight_of_match[] = {
>  	{ .compatible = "kinetic,ktd253" },
> +	{ .compatible = "kinetic,ktd259" },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, ktd253_backlight_of_match);
> -- 
> 2.29.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
