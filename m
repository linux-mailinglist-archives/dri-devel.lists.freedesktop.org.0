Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ACC9842CD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 11:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF0A10E6A4;
	Tue, 24 Sep 2024 09:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YmgOVGsg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB8410E6A4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 09:59:27 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2f74e468baeso57206001fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 02:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727171965; x=1727776765; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Cue4W9TL93NwHbM6aNpd7v3/ibP9k+0QyUerPzS+jBk=;
 b=YmgOVGsgMO64OpLM7d4LybPyF8BF3b+BNBEfCc1ShtPoWkZSzEmyU4fmlu3189RKsb
 SZGJsSLqvDbj6djR8jouUJ9rmKHQ+5o6kXqq+rnK92jdZ7S+dRr92CalbWyQ1TNe+Usp
 eG2Uu2uuY1YUCuriO4mC7vX5+VA280V4GVwgvITzoJZuVJtfrxxmMIUmQ7uFPSNYfJIu
 Yh7ckY4ZPRwhTN693pXuPASCCNMeWRm/TKL0puRgUDAx6KZ3wu4SQI15Khz/+a3ayIii
 YOeGxCk53mrBSQvLR9tWi+BrSf4tuom4k4RrMtGj4APThteQqBbckKAm65F96aLxLBEb
 YbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727171965; x=1727776765;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cue4W9TL93NwHbM6aNpd7v3/ibP9k+0QyUerPzS+jBk=;
 b=cPHpinXr4NUUQwGiXOU2/zu8T6nFn5AI6UQDH38Hvok024x0VR/DNb7Jcrvu8fjKC5
 CuPNoNlPNLtOCC4sPvaKXSQncvuPRhOBYYjnbRj5u3FUOQlIXepG2rIDC1vaEu+fEqZg
 HnQeNlwPurLcNau1AdU/nnDH0GzTHuIvj1Zy9Oy4ILgQ+zMQBtL2SScw4+YGBQRRlwCQ
 guj/kTmI0frx+1fK45ozPGFswOasle9f6IkkbfjyueX1ZprmKoTQf02HIafTTkeBPnk/
 zPyDMD4rBvBBcCENM0C2W9Kkl8tz+4a76uGLahhGgq/yQFYd03dUgqNXX9v7a5eAGVMy
 8/dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJHuTm1gmsrZ/G4UECfIUdgu+5MlXjz1bjEmJY2k8IQQfEZKyRiBuPnAZ0BuKCYwHvpcaHhxCM1Yk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yymi+fKQhrgSBn8+RVZAs0G64Thp1aiI1QE5TeNI9z8YqMG8f5s
 dRfjT2u7ZWw3OAvsRrxmshlHSUW11BGfjTOO0/uXi+SckNwi8W6XKEAXNnksBtQ=
X-Google-Smtp-Source: AGHT+IGxXBr3ISMNgRfS1/EiFBTfON23QMpcYn/pHSiLqk0vW/L3gbH5rzPUZk7NUx4bYMaTwS6m/g==
X-Received: by 2002:a05:651c:2206:b0:2f7:5914:c22e with SMTP id
 38308e7fff4ca-2f7cb2cfe6bmr79444711fa.6.1727171965324; 
 Tue, 24 Sep 2024 02:59:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d289b533sm1714211fa.106.2024.09.24.02.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 02:59:23 -0700 (PDT)
Date: Tue, 24 Sep 2024 12:59:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.Wu@ite.com.tw
Cc: treapking@chromium.org, Kenneth.Hung@ite.com.tw, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] drm/bridge: it6505: Add MCCS support
Message-ID: <lxh4anqlrrfqs5iljf5iughavosvqt6dzcff6flcoruimxgeq2@d5ig536voy5q>
References: <20240923094826.13471-1-Hermes.Wu@ite.com.tw>
 <20240923094826.13471-4-Hermes.Wu@ite.com.tw>
 <x4eixnu3kta6u2xqf6mn7ons2pupr7oe5fzjur2pfhgppmozoq@lgmk7zwqhcqm>
 <217c3d82f89040e7b29465ea71080cd2@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <217c3d82f89040e7b29465ea71080cd2@ite.com.tw>
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

On Tue, Sep 24, 2024 at 03:52:34AM GMT, Hermes.Wu@ite.com.tw wrote:
> >On Mon, Sep 23, 2024 at 05:48:29PM GMT, Hermes Wu wrote:
> >> From: Hermes Wu <Hermes.wu@ite.com.tw>
> >> 
> >> Changes in v3:
> >>  -remove non used definition for aux i2x cmd reply
> >> 
> >> Add Aux-I2C functionality to support MCCS.
> >> 
> >> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> >> ---
> >>  drivers/gpu/drm/bridge/ite-it6505.c | 174 
> >> +++++++++++++++++++++++++++-
> >>  1 file changed, 172 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c 
> >> b/drivers/gpu/drm/bridge/ite-it6505.c
> >> index 156440c6517e..5aedc5570739 100644
> >> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> >> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> >> @@ -125,6 +125,9 @@
> >>  #define REG_AUX_ADR_16_19 0x26
> >>  #define REG_AUX_OUT_DATA0 0x27
> >>  
> >> +#define REG_AUX_I2C_ADR 0x25
> >> +#define REG_AUX_I2C_OP 0x26
> >> +
> >
> >Are these registers CMD-specific? Because I see that you already have defines for 0x25 and 0x26.
> >
> 
> The AUX packet i2c into aux transfer frames,
> and I think it's easier to understand how it6505_aux_i2c_operation() packet i2c request into aux frame.

I'm really sorry, but I don't think I can parse this or how this answers
my question. If for the user I2C a part of the register space gets
repurposed, please comment that before the defines (and maybe separate
such defines so that it's obvious to anybody reading the driver).

> 
> >>  #define REG_AUX_CMD_REQ 0x2B
> >>  #define AUX_BUSY BIT(5)
> >>  
> >> @@ -266,6 +269,19 @@
> >>  #define REG_SSC_CTRL1 0x189
> >>  #define REG_SSC_CTRL2 0x18A
> >>  
> >> +#define REG_AUX_USER_CTRL 0x190
> >> +#define EN_USER_AUX BIT(0)
> >> +#define USER_AUX_DONE BIT(1)
> >> +#define AUX_EVENT BIT(4)
> >> +
> >> +#define REG_AUX_USER_DATA_REC 0x191
> >> +#define M_AUX_IN_REC   0xF0
> >> +#define M_AUX_OUT_REC  0x0F
> >> +
> >> +#define REG_AUX_USER_TXB 0x190
> >
> >And two defines for 0x190 too.
> >
> >> +#define REG_AUX_USER_REPLY 0x19A
> >> +#define REG_AUX_USER_RXB(n) (n + 0x19B)
> >> +
> >>  #define RBR DP_LINK_BW_1_62
> >>  #define HBR DP_LINK_BW_2_7
> >>  #define HBR2 DP_LINK_BW_5_4

-- 
With best wishes
Dmitry
