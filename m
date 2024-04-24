Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E558B06F3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 12:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BA2D10E5F9;
	Wed, 24 Apr 2024 10:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JnC9FdC0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BD310E5F9
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 10:08:19 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-41aa2f6ff2dso16620315e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 03:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713953298; x=1714558098; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hWKDax4TuNvBE1FyIl8irPm+6EhpYQ3vGRHf4jX8q2k=;
 b=JnC9FdC0oS4rPbEXeb/j0ees+WtPs+89xVFQR1sXYZZ9HTduQOyiDqNYTG36YdJr4e
 KiksYwmxyodVJ0Le9U8+S9qrsijdAt8PNMJTAsdA3gPi4LwLE6XcnGuI7gxVolaIh8pa
 OXxAB3607lioEc1etCdsIwJWzJ/RGRNgMMZg83kHYmt+UlXp5eabdKRUfqiEk70ALxLR
 Bz86i+e8OJs7LFhEPCfZ4s2zwTJAw9vomoKxIGVF0FArcjWLPFe6Z06hc4z4VRt+juLU
 tfQXq0GIDYlI5i+dscboWyEzYu1YF94uV0CyQ6YoL2Svhgvj5W8esscDq+0ngrfVwGpC
 wxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713953298; x=1714558098;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hWKDax4TuNvBE1FyIl8irPm+6EhpYQ3vGRHf4jX8q2k=;
 b=PejxIXQg73XCMGoFUh4j+2jj68jseAT9/SpROoibmMweDmGMFyjC0fYdWjFAvXq+Uq
 7jYCJ4jIKNhRYThUbMMgg+dL5cY3MaPaEVGTSLK+gweKadfQ3Mb3pDsptwz2K0KGhHbZ
 5lpPeDnKX2jlxyrrSkVAj8j5h7G/PWbY5FO9DrFPXZ7ughxKEhs+ufD0Vn/sXazK7fzX
 LCZrxx4GY2BqneYQvgSJD+49F4GZXecyU3jEasi83xVyzGekGEaUE62rp4IM1vHmbKpo
 uuhNSJVrjTy7HRf2UFEq/AxtOfC3c0/A8SoRTsRaed/1NiW3cP8ny7hzqVmft1FEF0z6
 nnPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlzyDZ1NOk0qZBJGvAMlmHk/JlXsY0teNKGLhUPpkwHeYcVuaHW6Y2fBk5puxO/W48ngcYQNBlxQK4AMG3tCOTvewNXCCr+7EOXdD0qHkX
X-Gm-Message-State: AOJu0Yy0bUuWfe0j4IqxlS0JNmoOgNFa5LfanQT5CNg2xPbkE9BeoEOx
 FjZMa1JmAlRUiKuXP0eTD3dP2FokcJ4Jym43HW9Wd/Kp3BkrVzUFgHzIdg7wW9U=
X-Google-Smtp-Source: AGHT+IF77S0eO7Dutrp6EQMSf6hVu3p2iJBEOx/XxaPtob8SJQvhDdTvZkjJjS4pcN8hkeXUmu2lXw==
X-Received: by 2002:a05:600c:45c6:b0:41a:a521:9699 with SMTP id
 s6-20020a05600c45c600b0041aa5219699mr1556544wmo.4.1713953297960; 
 Wed, 24 Apr 2024 03:08:17 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 jg3-20020a05600ca00300b0041affdeeb99sm1634085wmb.39.2024.04.24.03.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 03:08:17 -0700 (PDT)
Date: Wed, 24 Apr 2024 11:08:15 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org,
 Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v2 19/19] const_structs.checkpatch: add lcd_ops
Message-ID: <20240424100815.GE1567803@aspen.lan>
References: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
 <20240424-video-backlight-lcd-ops-v2-19-1aaa82b07bc6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424-video-backlight-lcd-ops-v2-19-1aaa82b07bc6@kernel.org>
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

On Wed, Apr 24, 2024 at 08:33:45AM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core code.
>
> Suggested-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
