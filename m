Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EFC3F16E7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 11:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1CF6E89F;
	Thu, 19 Aug 2021 09:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6676E89F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 09:59:33 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r7so8264781wrs.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 02:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xtunD2GxO/8/vmP/JIhc/Q4AXeVK5pzMLPGPI0WktNo=;
 b=ULGrdUlLjfonZ9gXeFBZL1uRfDlE0SqvpHLPwuyDblWuDL6n7yMagTIZsgstsvo+qS
 r2ts6k9+C4pXp8Sju0Va2gPM+ieguklAU4b9hD9AslIY+NgmsgLibrWbQ1LiZ0Qsk3rH
 F4JEmqWQWSRFqw+Y6qDkS74exs7H14uKfiSDwl74vGXJMZfBp4C9GqgKKDJXSQ/hupfn
 oURWGu3f4FfnLlPSov6wUBSXVnpJHIfk9oWzJA427L1hiGyatYZ/YU553dT38q8yqgAn
 d+ajJsiH6+zxUGDU4WyG1Nhdmg9w9s1BBQAhxibNshdCVsKc6AhrRapWUea8HkBS/5Ng
 uvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xtunD2GxO/8/vmP/JIhc/Q4AXeVK5pzMLPGPI0WktNo=;
 b=Hyx7oGy3fitpAwKib9MjLPvu2+/UsHObWLg0J0xeJ+PJFkeAslqa50OsplWI+sWouE
 N72+1KY4rPriJRJnwG/rv9HPwKcPjVP69QBagvEc12QmcWLb2g0SbS3+DaMXW0q54rOY
 uSMYJ1VC4S08bnU9m1+yrrel+YPzzF7iOUfwLVDsN28zpOFp+MKMOxTWYc0woeI6OOx2
 XqpVpSvuUdKyQ3p+TMfiUwu9H5E3/r6bW0I0DX16pR5Lqk6YKZZvcM7rCc9On9YiNE4m
 wOGZPSGwYp/EcQ8bB0LKXnXk9pMvq1vHtkxE74cDeW9iE8QtfuywLcdvHUVBgsITrZPJ
 4s8w==
X-Gm-Message-State: AOAM532ANczcy8jr+wfeGZko1eMJFP1SygdWN21dftVM9ILDu4H6RPbq
 /qj2ny90w+LvZ3zeyun/aIuo2A==
X-Google-Smtp-Source: ABdhPJyutlGQ6Z6gY20AlGAJAhV+LbVsUxEHKzeIqK38emB1LhIfllep0G5vUV02GJWRWcT0Ec9kgQ==
X-Received: by 2002:a5d:4290:: with SMTP id k16mr2749296wrq.224.1629367172037; 
 Thu, 19 Aug 2021 02:59:32 -0700 (PDT)
Received: from google.com ([2.31.167.59])
 by smtp.gmail.com with ESMTPSA id z5sm7338694wmp.26.2021.08.19.02.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 02:59:31 -0700 (PDT)
Date: Thu, 19 Aug 2021 10:59:29 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marek Vasut <marex@denx.de>, stable@vger.kernel.org
Subject: Re: [PATCH] backlight: pwm_bl: Improve bootloader/kernel device
 handover
Message-ID: <YR4rgXdHqLzpYfEY@google.com>
References: <20210722144623.1572816-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210722144623.1572816-1-daniel.thompson@linaro.org>
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

On Thu, 22 Jul 2021, Daniel Thompson wrote:

> Currently there are (at least) two problems in the way pwm_bl starts
> managing the enable_gpio pin. Both occur when the backlight is initially
> off and the driver finds the pin not already in output mode and, as a
> result, unconditionally switches it to output-mode and asserts the signal.
> 
> Problem 1: This could cause the backlight to flicker since, at this stage
> in driver initialisation, we have no idea what the PWM and regulator are
> doing (an unconfigured PWM could easily "rest" at 100% duty cycle).
> 
> Problem 2: This will cause us not to correctly honour the
> post_pwm_on_delay (which also risks flickers).
> 
> Fix this by moving the code to configure the GPIO output mode until after
> we have examines the handover state. That allows us to initialize
> enable_gpio to off if the backlight is currently off and on if the
> backlight is on.
> 
> Reported-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: stable@vger.kernel.org
> Acked-by: Marek Vasut <marex@denx.de>
> Tested-by: Marek Vasut <marex@denx.de>
> ---
>  drivers/video/backlight/pwm_bl.c | 54 +++++++++++++++++---------------
>  1 file changed, 28 insertions(+), 26 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
