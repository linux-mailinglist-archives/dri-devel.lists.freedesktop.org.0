Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB966818D69
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0407510E4FF;
	Tue, 19 Dec 2023 17:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A311B10E4FF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:04:36 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-35f89f18daeso18833105ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 09:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703005476; x=1703610276; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R3vdGyZ+giFIRD6X/bv1+u6PRAF0RuL1pLhWZ53wREY=;
 b=kSw0ZeHtrsADAGsirZQxgNpZ52XXO1Cv6nxkS5PJvTlAu9X/F49WS+A+xdnOfHpdPo
 Zqi3wzJg1rTRwBldMrMYrElFSw9VgeC8ul9GPeIgP6jh7XwI9LMBSmKCbpMxIQn/JaXl
 RSdb9FVjmD1qSEf9GrhGAEXZrDDv5qYpDHX0vTqLSlcnHOUd2UKwtTpW0rSc5fPcgtSG
 ceYKqN0CIcRfAtP4bzUc7eiq+44Y9/93jg9BJhvkCGju7cmZlqo74aXF0jauOaaT3itq
 eeXZ9o6ky+Sk/qIPZDREs5krWgqkOs/yi6s+np7appYXcy9cPZ1HRnt1Qa5NudkW0mUB
 XTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703005476; x=1703610276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R3vdGyZ+giFIRD6X/bv1+u6PRAF0RuL1pLhWZ53wREY=;
 b=NS06uLB9VeHOoLWGMFWOxAFlUp4r8dBOFdBRQc5AIx9pVLqGrslZeTNXB+zIg2H380
 bmt2LaZU7g1DLYOfUOPKJJK82hh/8fKeBi9cFByJS+wQ98G8hvmHrxpGRNmtvSORaWsH
 alrHyTF4V4HDCK6vmBT1weSCdTdeK+kOLHqGcTRywYLPYHHLWWYooEVPo6vZ5tbaUATR
 /wo+XMyG3PYoyVkh0JCUIxMba/WtHPStMaDbdnv5zx7EWX7V4AfV04c8mLTrqTn6NtEA
 6wZvRAns6FxUruw+E5g/7sUY/+KNIfr30+bCcZ/qO+mQPrWUhQQCn2riYk6FzY3Nmkaz
 oSRA==
X-Gm-Message-State: AOJu0YwDPFcgLrZV63T3kOni7W8k7jkAgr4hYbkiFShSOnals2IHYSEc
 xGzhzgDE2jQdIg4/pAcm5qQ=
X-Google-Smtp-Source: AGHT+IHTnWFbi3tnLUi55hj74IPei992iitC3hJxS75IRffKP/GDwsXkYn/gQjSWJRug8oGL8oZx1Q==
X-Received: by 2002:a05:6e02:20e3:b0:35f:c6d4:5d59 with SMTP id
 q3-20020a056e0220e300b0035fc6d45d59mr273364ilv.43.1703005475772; 
 Tue, 19 Dec 2023 09:04:35 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 w1-20020a056e021a6100b0035161817c37sm7488495ilv.1.2023.12.19.09.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 09:04:35 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH 5/5] drm/panel: st7703: Drive XBD599 panel at higher clock
 rate
Date: Tue, 19 Dec 2023 18:04:29 +0100
Message-ID: <10386431.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20231218-pinephone-pll-fixes-v1-5-e238b6ed6dc1@oltmanns.dev>
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <20231218-pinephone-pll-fixes-v1-5-e238b6ed6dc1@oltmanns.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Frank Oltmanns <frank@oltmanns.dev>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne ponedeljek, 18. december 2023 ob 14:35:23 CET je Frank Oltmanns napisal(a):
> This panel is used in the pinephone that runs on a Allwinner A64 SOC.
> Acoording to it's datasheet, the SOC requires PLL-MIPI to run at more
> than 500 MHz.
> 
> Therefore, change [hv]sync_(start|end) so that we reach a clock rate
> that is high enough to drive PLL-MIPI within its limits.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

I'm not too sure about this patch. I see that PLL_MIPI doesn't have set
minimum frequency limit in clock driver. If you add it, clock framework
should find rate that is high enough and divisible with target rate.

Best regards,
Jernej  

> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index b55bafd1a8be..6886fd7f765e 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -320,14 +320,14 @@ static int xbd599_init_sequence(struct st7703 *ctx)
>  
>  static const struct drm_display_mode xbd599_mode = {
>  	.hdisplay    = 720,
> -	.hsync_start = 720 + 40,
> -	.hsync_end   = 720 + 40 + 40,
> -	.htotal	     = 720 + 40 + 40 + 40,
> +	.hsync_start = 720 + 65,
> +	.hsync_end   = 720 + 65 + 65,
> +	.htotal      = 720 + 65 + 65 + 65,
>  	.vdisplay    = 1440,
> -	.vsync_start = 1440 + 18,
> -	.vsync_end   = 1440 + 18 + 10,
> -	.vtotal	     = 1440 + 18 + 10 + 17,
> -	.clock	     = 69000,
> +	.vsync_start = 1440 + 30,
> +	.vsync_end   = 1440 + 30 + 22,
> +	.vtotal	     = 1440 + 30 + 22 + 29,
> +	.clock	     = (720 + 65 + 65 + 65) * (1440 + 30 + 22 + 29) * 60 / 1000,
>  	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>  	.width_mm    = 68,
>  	.height_mm   = 136,
> 
> 




