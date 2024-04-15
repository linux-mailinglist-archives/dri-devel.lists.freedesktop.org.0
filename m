Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB7F8A4F8D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0853511253E;
	Mon, 15 Apr 2024 12:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UouT7YvP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D215112537
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:49:55 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-41869c1a95aso3887035e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 05:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713185394; x=1713790194; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YQTOMiU6gYM5FdXLFvC0kzpvxWDYETwVK1r4K+Qq21U=;
 b=UouT7YvPHDj0ks8VCiYIL1qSLIgfx9i9byVk4BhlL1fQuRKB1jF4TphKLO1ohYYWCK
 2ZdrJWeEJbIkTblEAQmJBdnWvOVCvFxRNIZ0la5vyXQ7+IXaLr2uC/ZfqZEbspyfi7Pw
 l6E8gMLWecAOfdh75FeNNhTdkqWx30TcoK1Q35+F0C07aYEe0p7qqbQLdfeZdE+BGFAd
 C6+Epdcad2zoGSrNdmqcKFFpUbQO0yoG/E0o5Frp1bZNnXfkXyhsDyYtfb2SgFXUE1O3
 CqnsyhIVmjwR7bd0vM+UM1LlNte/Sk0uz8uR2jZcFx8uFuZ/oIohm6f4lThNVcWL1cY4
 0SRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185394; x=1713790194;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YQTOMiU6gYM5FdXLFvC0kzpvxWDYETwVK1r4K+Qq21U=;
 b=DnWyM//3W1AIaGLzTR983B/68qqw8ac/FBIuuW40YJUKdCiHicOPB4DfiVs/LYkVYS
 4au2BZu6dAJ0dkmzdN82+CMRKd6CLCu0jfXlOZP0jCoqjRer8m3lkJQoiuL5mvFtlX55
 PnRg8veCRRyK2onbBR2DvnLjFiv55rzg6u1vFcVhlhUoudPabkS5fP05YPUafVZJ+ful
 LIOAzfSSNEa8WRScB/NiwEFjujQUnzMSjOy/dMXewddWEPgahF3i9ez2P0icSzdzOiAz
 FAHWUz+7D+hPs+ULlrzUPGaAEKAXucnl0KyxNbkVzzOM6r/gJlWPfJU+dEs1Tb3f1yYv
 PBxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf86PpnONvzOrnGzyzXMG3jmMxJwlVuSnGPlu/37DkxLZnzbV/uwouFP1/Kc28BotNrh9shkjkdGgdcy7vSosl3WrauaW2eC+3ioGGUlv8
X-Gm-Message-State: AOJu0YyCYXRAsd5lHah+iszGi9pVbXv2jlrBcodtkRZIaUs0832LDxHR
 d/uE9NH2O0I8lRMWjddivmC6SffSOAWtNCNs5WzLBiSJfbDi5DHJpIWCNvQhT/0=
X-Google-Smtp-Source: AGHT+IE0jfEg8j9eNQ32UlJgwwRwcJBMnq8mxk2glq1rj3pDzq37W/GBcRUB+mKPUDxRmuZRlave7w==
X-Received: by 2002:a05:600c:458d:b0:416:b74d:eb94 with SMTP id
 r13-20020a05600c458d00b00416b74deb94mr7708786wmo.1.1713185394484; 
 Mon, 15 Apr 2024 05:49:54 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a05600c3b1000b004182b87aaacsm8741388wms.14.2024.04.15.05.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 05:49:54 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:49:52 +0100
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
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 06/18] backlight: ili9320: Constify lcd_ops
Message-ID: <20240415124952.GF222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-6-9b37fcbf546a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-6-9b37fcbf546a@kernel.org>
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

On Sun, Apr 14, 2024 at 06:36:04PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
