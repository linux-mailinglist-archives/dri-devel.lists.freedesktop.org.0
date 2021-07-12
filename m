Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E3F3C46F7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 12:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC92F89A4F;
	Mon, 12 Jul 2021 10:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8079989A4F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 10:25:57 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 k16-20020a05600c1c90b02901f4ed0fcfe7so11127511wms.5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 03:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lLjUDjdWxPclbryuFR9izI75sQqrpyAMRrc80ykdjNY=;
 b=awyJadfSI81+vFylzF4VuEQTlG1d+tBVabVVugUGOXe0DCvV/DveP6MFR2Aei/nrNc
 +zK9YhQqWQUjxLJCcgiiskDw9IXv6PrWlUMiGuduvSGUk1GSoZOIjUNwxXZHR0tkrld3
 7THO61XKQfgFfxbSkDhDktf8x0IZ8VsTsDihZ/vlu3FttAlTpAiYzyuyVGUn7QsVheE6
 vQrqtmAXXaqBOCPiS6YYbLQd3CJSJRwhUxYfzdqcyo5y6ySMkODOC7QUUL9yC3iI+qMs
 0GlUsGcihNcriVKLmFla4idBo89BQUHCAe3YcqzJ8bhyOaL1UAaDoIctzj54lrp9yQCa
 ewOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lLjUDjdWxPclbryuFR9izI75sQqrpyAMRrc80ykdjNY=;
 b=U+0exTj9eZfH7drcvShG6N0QiFNzqY7uP0evqvJzyJt7uOA4xVpmI+1cAU9tJopE+V
 8hNdj0KpJYHhgxhOiFWg3hzk3bnfS79ywCVrHfMEoBkIVO3gaKsCndfIncP6A5YHiKZE
 oaWiuI99WvzRXI4E/b8zqfnhpV7FvXwc2sfmxt2af4BE8MYM/C6Gx97I7ckFM22mdV4n
 9N+prAFklhVZk0H5j9xgEjSpy06w0MnwEia2pYxxEZHIZe3JGJFBBvl/vKRNE/qevsat
 4Ej9/Fl2a2Gmg2H5n3bnCvC3gVNRnlPZMWetSPQbHpgnzi9dYeHiBoKQXRJjtbBXFgLZ
 cdXw==
X-Gm-Message-State: AOAM532UJkw36vgV0QfNCOgQPg+WcU2T+AUY62JoHY7n1pZGLes/C/zL
 anKMVeE3qZtxB+IS/e1P8A1T+A==
X-Google-Smtp-Source: ABdhPJyboP90WE/DsXxubQCq3b4TFqGRmnfmdseq3xPSGUo2tQZ11zJw2RRXien+JB0uKG1A6gtTQg==
X-Received: by 2002:a05:600c:4fc7:: with SMTP id
 o7mr53768712wmq.16.1626085555727; 
 Mon, 12 Jul 2021 03:25:55 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id b9sm16533947wrh.81.2021.07.12.03.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 03:25:55 -0700 (PDT)
Date: Mon, 12 Jul 2021 11:25:53 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH] video: backlight: Drop maximum brightness override for
 brightness zero
Message-ID: <20210712102553.ehsgp2ozrveuwaxv@maple.lan>
References: <20210709132600.5417-1-marex@denx.de>
 <0822c219-c1c6-0bb4-f379-e73f40adfa8e@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0822c219-c1c6-0bb4-f379-e73f40adfa8e@tronnes.org>
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
Cc: Marek Vasut <marex@denx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Meghana Madhyastha <meghana.madhyastha@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 09, 2021 at 03:53:16PM +0200, Noralf Trønnes wrote:
> 
> 
> Den 09.07.2021 15.26, skrev Marek Vasut:
> > The note in c2adda27d202f ("video: backlight: Add of_find_backlight helper
> > in backlight.c") says that gpio-backlight uses brightness as power state.
> > This has been fixed since in ec665b756e6f7 ("backlight: gpio-backlight:
> > Correct initial power state handling") and other backlight drivers do not
> > require this workaround. Drop the workaround.
> > 
> > This fixes the case where e.g. pwm-backlight can perfectly well be set to
> > brightness 0 on boot in DT, which without this patch leads to the display
> > brightness to be max instead of off.
> > 
> > Fixes: c2adda27d202f ("video: backlight: Add of_find_backlight helper in backlight.c")
> 
> I not sure about the rules, but if this is automatically picked up for
> stable, maybe this is needed to avoid changing behaviour on 4.19:
> 
> 
> of_find_backlight() was added in 4.17 and the gpio fix in 5.4.
> 
> Or perhaps there are other ways to signal this dependency.

Agree we need to make sure the Fixes: tag doesn't provoke regressions
in v4.19.

Is this the syntax appropriate?

Cc: <stable@vger.kernel.org> # 5.4+
Cc: <stable@vger.kernel.org> # 4.19.x: ec665b756e6f7: backlight: gpio-backlight: Correct initial power state handling


> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Meghana Madhyastha <meghana.madhyastha@gmail.com>
> > Cc: Noralf Trønnes <noralf@tronnes.org>
> > Cc: Sean Paul <seanpaul@chromium.org>
> > Cc: Thierry Reding <treding@nvidia.com>
> > ---
> 
> Acked-by: Noralf Trønnes <noralf@tronnes.org>

With the above (or something similar to avoid problems with v4.19):
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
