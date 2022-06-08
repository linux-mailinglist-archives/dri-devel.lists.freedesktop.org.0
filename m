Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF205432AC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 16:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A065D112170;
	Wed,  8 Jun 2022 14:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5408112170
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 14:36:46 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m26so17214352wrb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 07:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=khBUE53X9QuO6dWoSeEXJmXd2fMLigTEjdoQDhHw9mU=;
 b=Zygb11Po3xDFIHW2f+svcZVUL+ZvG2ZRBoGgdGzKTr0Kbk0U0KLEHUhPGDjn9UDod4
 8YdMOQoEFnHaWsA9c5BtdfJEyOk8qA79OEExEabcm92kdN2REqzYhAYxAIChyKgBKBJv
 xrbalNL9qXh0cL+SlrXMWypEq4ZFjxKCenwUsuTr/6K5Z+dSWKaDcVR/mNHdUZzcM5Lz
 68FzKB6yp9pt75OTd1dPBnsuNgW7aiCn7Nk2BfEaBgWn9U1tT+btkuzh3xO0izONkRPh
 WLU3dkz0/JaRYem8VX/l+AWseou10xPiimxGawgdHEPTjDJunaaRhJf58Y6PIua/vQAk
 z0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=khBUE53X9QuO6dWoSeEXJmXd2fMLigTEjdoQDhHw9mU=;
 b=LYdM0ZnUyCVhEt7ykvKOuDxImYr9cINxjdwVBO8piHi1ogdB8CesyE3TLJ9wHn4kg5
 vjPyQARe7rc+LuHwmxtUENEAmU9ny+H2HlSCamR5Pi3tqTcEnmBbH2YHr2DqwLNT3AN4
 pOBLB61nQIR2z+pO4ftLutNui290OJl6w9eQEDmCjSKP7qeqUtYg/st194kXerJaAVQG
 cxRUphY69oZbxLD83EMcobifeeCHbb89UPdt0SnaC0x5uRS+kWx5ua/UL6lnIdpy8uKb
 RILKu3uMqDkhel2SqISbQ596xdkrbhisWlA8S2SuMsaAi+J/C+EKfhd0ZV49baehsEqJ
 eOXw==
X-Gm-Message-State: AOAM5333j/7FSTv3gASo7YXXi9AVUDopvvJdNKqE6B5/20RZZUhTlr03
 P1o94j/uCt/J4pMw0wLAhjO2mA==
X-Google-Smtp-Source: ABdhPJyihLbbU649/VAE29N/msO4G2EkXgHbveOzoAedQSvWja/dqHMy6G3ndT8k+NvEQCDLvtz6Vg==
X-Received: by 2002:a5d:6d8b:0:b0:218:4de1:25a0 with SMTP id
 l11-20020a5d6d8b000000b002184de125a0mr10508544wrs.8.1654699005239; 
 Wed, 08 Jun 2022 07:36:45 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 k2-20020a5d5182000000b0020c5253d8fcsm21942007wrv.72.2022.06.08.07.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 07:36:44 -0700 (PDT)
Date: Wed, 8 Jun 2022 15:36:43 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 4/4] backlight: tosa: Use backlight helper
Message-ID: <20220608143643.km7eainfqvttuoqe@maple.lan>
References: <20220607190925.1134737-1-steve@sk2.org>
 <20220607190925.1134737-5-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607190925.1134737-5-steve@sk2.org>
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
Cc: linux-fbdev@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 07, 2022 at 09:09:25PM +0200, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

... and, wowzer, the code before your change wasn't much fun to read!


>  static int tosa_bl_update_status(struct backlight_device *dev)
>  {
> -	struct backlight_properties *props = &dev->props;
>  	struct tosa_bl_data *data = bl_get_data(dev);
> -	int power = max(props->power, props->fb_blank);
> -	int brightness = props->brightness;
> -
> -	if (power)
> -		brightness = 0;
> +	int brightness = backlight_get_brightness(dev);
>  
>  	tosa_bl_set_backlight(data, brightness);


Daniel.
