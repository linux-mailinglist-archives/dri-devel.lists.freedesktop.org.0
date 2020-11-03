Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 345062A4C17
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 17:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535686E8B4;
	Tue,  3 Nov 2020 16:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045C66E8B4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 16:58:55 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h62so20308wme.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 08:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HqZuOp1IITKuiPPZaNsPGJeGO0RvbPcrP3kFi4nxuE8=;
 b=YyYsWNkrDNuDCpBgKSwGff4dnxBPuEnHIujXjJob4UwYR9oZMzoahOm0S6UDEuelBp
 0JiaTPUTaGdcEPBqTBiLK9gZ4wGWog+PhgUGKPaMeD1SiQ2wOFNxmx0YcsNVl6p7Ts70
 551GO9y9V1INFtKFyblT/ajtDwMRnyAH0sn2Fho/SZHEx/7sOvp7W0PLVuSpozEVODbX
 hzVklKagnDgIDsk7B0+YcYDLkWtyuGeMdIU0FNNIegNuaGtGTMYaezd7GKzoEcvn8Cmj
 SbhGqB/vLR3JSCyd8MgiN8b6EHd80yEgW1FgS8tQS2Sn/MpCEsXGba6CRvT1hFrUzWDr
 xwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HqZuOp1IITKuiPPZaNsPGJeGO0RvbPcrP3kFi4nxuE8=;
 b=YvpmeKMcxKPcN5loFJb0Qx6Ns7WATgdaVb9IrKytJCJBcsVGUSByETODYaq137BUbs
 fBE+fA/CltlCssQG2M4kcEjAV4UUoxktcOQcpgbhJct8UGuKpcmbaE9iYnIyuS8FPrDs
 gHir0Aqt/l6Z1eILjqGXwqb3S2BNjHbSvXrbfhwCNb6tzCDruwusmhi1JC6WPBQDD/EN
 86EVzebvW3DNzE1CgyRYIPML8lv6s4xwt/QqGUg7K/SPH1RNF1O3LFX8bb5b775/R4l5
 QkxCDVn1mKxW66pqwoJz4YitpH9BA6rS2QwgPPCbpEwJQVg9lcyUuulnhlKXxGiSgEEv
 IKYQ==
X-Gm-Message-State: AOAM5337njGbN+7UpiX2NZoGOmGqRgXJUuB2c70gV6KxBC567CmAaXO7
 Qm7tzxTSYiZH9JqIVR7sCSR9TA==
X-Google-Smtp-Source: ABdhPJyKFVzDM1bYQ7reHvRRi8XCIV24MNoWqNViuGekTs+HNbjzL62ZGEz0MRy0rZGLpTKBpe5IdQ==
X-Received: by 2002:a7b:c201:: with SMTP id x1mr100113wmi.42.1604422734274;
 Tue, 03 Nov 2020 08:58:54 -0800 (PST)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id g14sm26953238wrx.22.2020.11.03.08.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 08:58:53 -0800 (PST)
Date: Tue, 3 Nov 2020 16:58:51 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] MAINTAINERS: add Dan Murphy as TI LP8xxx drivers
 maintainer
Message-ID: <20201103165851.uabbg4zazofyis62@holly.lan>
References: <20201103162832.14085-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103162832.14085-1-krzk@kernel.org>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-iio@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Dan Murphy <dmurphy@ti.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 05:28:32PM +0100, Krzysztof Kozlowski wrote:
> Milo Kim's email in TI bounces with permanent error (550: Invalid
> recipient).  Last email from him on LKML was in 2017.  Move Milo Kim to
> credits and add Dan Murphy from TI to look after:
>  - TI LP855x backlight driver,
>  - TI LP8727 charger driver,
>  - TI LP8788 MFD (ADC, LEDs, charger and regulator) drivers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Dan Murphy <dmurphy@ti.com>
> Acked-by: Dan Murphy <dmurphy@ti.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Acked-by: Sebastian Reichel <sre@kernel.org>

> 
> ---
> 
> Dear Lee,
> 
> Could you take care about this patch?

Just in case Lee wants it:
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
