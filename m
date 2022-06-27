Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB28855BA48
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 16:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEA010EEE5;
	Mon, 27 Jun 2022 14:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AD710EEE5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 14:08:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 t17-20020a1c7711000000b003a0434b0af7so3181611wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 07:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=mahcPko5Q/l61Ik8IYzCrdKLW0WVu7DFgtJr7eDzeMU=;
 b=FpVYcfDzaK8POC7mxKA2Rffo95k0xE0S5j1XTSQtUsUfm3/jMF27ewxALX1PIk7kqX
 c8HG6aIoRj9RFl24vtAvT4WOA9G0fDAORWX/EBZ6dBKMqPfFPKnMRam5b0i34zSN4T6g
 rympXkeeGoK4mb4gE7fls9e0Ujdxa7WTQzdA3Wp2B1HPx7cF3S8Dgj/MyMX4+vBi+tnz
 dSzW2QCTo2eHi19TZYVxBiSWI/9Qx0FW7+icVuPyDbG8kikrO+GZ0PRMGRPG2WaLQrKl
 2atjwiKdqr+Z0kcPAi7UXR83ZRynYIZqQ+goItSRBB1HB5xEC5ECEOwaYMUnsoidfDX3
 buDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mahcPko5Q/l61Ik8IYzCrdKLW0WVu7DFgtJr7eDzeMU=;
 b=dMBpVXqg8cB19rzW39xU3hY3RxHGNGDPadqDEyuu5usW4rMfrotvbk+Ml1iWYgpGCP
 vYLJ2jLTiHP2Syw0BdUbIdGMsEl0eXZMB8Amk2njcr3YBNISgLqLbGKpWL7s1VP3xMjz
 XVcUObJh0xA0ZmgBhofLxboVfqRpMi/ljlH4n85Y4NHbAMGDQMwjLBrz2928wvMienDC
 UEtJWsY5QJf3uX7xSlsUNbIl6mbLVEHZWZT8uKF1ljd7oCh6oNiPnR3rmCX05sQNViU4
 UzPQLVV/b/iDijrZaaWIU+fRy0fy5pU7ZezOAhRMVVgeZtkBuNvuMxf5gYQEkLVTVHxX
 k87A==
X-Gm-Message-State: AJIora/+3xJiNKXe8Iz+wwH6cczT6IsPcoP5JfIWXrQrWJ64U/69DP4a
 XurDH+Ghqwel1wb4XMjirtxdSw==
X-Google-Smtp-Source: AGRyM1vZFeymKInzIO+gklwemo43BkiJ8/H5fHHYi2uBglWy1rGRyAdw66xg6V+38wrpIbqKtAglGA==
X-Received: by 2002:a7b:c1cb:0:b0:3a0:4aec:7eb7 with SMTP id
 a11-20020a7bc1cb000000b003a04aec7eb7mr5220948wmj.96.1656338892963; 
 Mon, 27 Jun 2022 07:08:12 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 v15-20020a5d43cf000000b0021badf3cb26sm12705119wrr.63.2022.06.27.07.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 07:08:12 -0700 (PDT)
Date: Mon, 27 Jun 2022 15:08:10 +0100
From: Lee Jones <lee.jones@linaro.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v4 2/2] backlight: rt4831: Apply ocp level from devicetree
Message-ID: <Yrm5yliOqzVtJoWk@google.com>
References: <1655807788-24511-1-git-send-email-u0084500@gmail.com>
 <1655807788-24511-3-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1655807788-24511-3-git-send-email-u0084500@gmail.com>
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
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, lucas_tsai@richtek.com,
 jingoohan1@gmail.com, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, robh+dt@kernel.org, pavel@ucw.cz,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Jun 2022, cy_huang wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add 'richtek,bled-ocp-microamp' property parsing in
> device_property_init function.
> 
> This value may configure prior to the kernel driver. If it's not specified in
> devicetree, keep the original setting. Else, use clamp to align the
> value in min/max range and also roundup to choose the best selector.
> 
> Reported-by: Lucas Tsai <lucas_tsai@richtek.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
> Hi, Daniel:
> 
> I may use the wrong macro, must be 'DIV_ROUND_UP', not 'roundup'.
> the v4 is to fix it.
> 
> Since v4
> - Fix wrong macro usage, must be 'DIV_ROUND_UP', not 'roundup'
> 
> Since v2:
> - Prase the 'richtek,bled-ocp-microamp', clamp the value in min/max range, and
>   roundup to get the best selector.
> 
> ---
>  drivers/video/backlight/rt4831-backlight.c | 33 +++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
