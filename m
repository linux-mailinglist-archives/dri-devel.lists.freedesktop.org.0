Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 068CA11E4C4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 14:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64546E87D;
	Fri, 13 Dec 2019 13:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EAC6E87D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 13:37:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f4so6020983wmj.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 05:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2d2xWucb5NVSf3Waoc/JClVDtyBHbKclljSNzZn276Y=;
 b=RlFMVAXNeqM8SqqikT7dkTvFC7dEag3M5rqVFq1Ip5s7Qgg8vCbM3qxVAKWZ7DiV0/
 d49J9HQn4mCn5AOnNS7U4RQVfxPNaqf3rfeLBrjLwDd95JxWGB5AFwtUTcv3OJ6keWRZ
 Ut5/p5SR9eBQo/dxjMA9E/j/K18CADAvDmTxbvJm59cTw0S9w1x+wjnPFujbIq3NisO3
 0zKrDUqM+0Tyzbdxf8rW0oHdOIKKVeGM9Jv3LD9OUnO2YlyBYMbFh2XlqsQWmtBaxBNP
 9C61ZIQx2HqlE7ydKrv22jyk3Xm0LLfMHzhvADS9XKfJ240J50meoc/Ds/Q0OCOHFnYL
 8v5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2d2xWucb5NVSf3Waoc/JClVDtyBHbKclljSNzZn276Y=;
 b=o1f189SSpoUa8tQWELbIoyvn3M5U6b3BcFfXm15GDl7rg3LWDo7igiOIy1CejumpZm
 KW9khN/b+dQ9V/o8tx+ij7Qk7ofdQ+P9jCb0Q1gkHN/Su8N9fHBrtteLvCs1sK8xgcul
 zlkX9BmREs/PUHJ6bnl2Dz1hc3xTRnChaE+PIOvW5+XJKRR+ReeHsUeqSTPnJ9uoXXtJ
 J+x8K45p7N92qaPeH735kmG2BZO6MBqe1dllKsO6ZDMcCsGEdZQrpz3omqot5UVpBnTe
 RcfLa5NbuRL9PkvlAZBY41ijPAZY7Iaj7EkZ6vviZQ/etazmMGcUAbCpJsqwe+Z7oL1N
 JDKA==
X-Gm-Message-State: APjAAAXBM2/6ff6QA061xAuz+CQPKEC3w8iVp0Zq0/rLaQ2h9YCjvN8f
 WuB6G18RviiWRCdgqUxrWhd4m1nBRYuddw==
X-Google-Smtp-Source: APXvYqxjgUWgREh3hGaKVqpOQX0iVHHKwrbgcPwGiYoikIP7XYEEbiWqZUQMR6qq6z81knGNgJ+H3Q==
X-Received: by 2002:a1c:9d52:: with SMTP id g79mr4827562wme.148.1576244251789; 
 Fri, 13 Dec 2019 05:37:31 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id l15sm9762186wrv.39.2019.12.13.05.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 05:37:31 -0800 (PST)
Date: Fri, 13 Dec 2019 13:37:29 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] backlight: pwm_bl: Switch to full GPIO descriptor
Message-ID: <20191213133729.i2cs4hdl2zmb24by@holly.lan>
References: <20191213102346.9577-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213102346.9577-1-linus.walleij@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>,
 Guan Xuetao <gxt@pku.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 11:23:46AM +0100, Linus Walleij wrote:
> The PWM backlight still supports passing a enable GPIO line as
> platform data using the legacy <linux/gpio.h> API.
> 
> It turns out that ever board using this mechanism except one
> is pass .enable_gpio = -1. So we drop all these cargo-culted -1's
> from all instances of this platform data in the kernel.
> 
> The remaning board, Palm TC, is converted to pass a machine
> descriptior table with the "enable" GPIO instead, and delete the
> platform data entry for enable_gpio and the code handling it
> and things should work smoothly with the new API.
> 
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Guan Xuetao <gxt@pku.edu.cn>
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
