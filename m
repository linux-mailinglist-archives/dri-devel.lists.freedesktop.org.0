Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B38538C974D
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 00:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C7310E2D7;
	Sun, 19 May 2024 22:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hfmhbT+3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40E210E2D7
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 22:28:14 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-51f40b5e059so3035042e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2024 15:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716157693; x=1716762493; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cBa09DmBy2jqIF3DZr0Bwzme9COeLXE6oZ83JxnH2Ws=;
 b=hfmhbT+36IkFo+QE8EI//g8+naviq3NOyfEzWeaWxwFSi9+wcKiaSpxi9pqcgiRC3m
 dEOtYGYKWII9W3LD6EbfMhZ/c2CimXtEralg9EFXFC2mTgWHge1JDd0QZH53krmg3M4m
 BZDFpW2EtKbRvPtJ3eoEhQ91/pe9+tygUrMNRv522AHyeUbTzw5xnluZwzHAfFRk6XFr
 d4Z6l87aYSOlxxscAiKXOkGAITSal1/h8jh6DpDQIR6NkJNanLxDHAk3LLelBzXq7HLS
 0hcnJ3YGZ4cpuq1RNcBGViVuubxDJP0CepK22ftAxFk6knK6IsJOOlJo5kTw0cqgqdo+
 YgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716157693; x=1716762493;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cBa09DmBy2jqIF3DZr0Bwzme9COeLXE6oZ83JxnH2Ws=;
 b=ZGAsjvWS9Q2Am7uyH/6TBqkqiBdOAu9O2yPWKOc1FdDI/F532Ac0b2MMivNN1zhgae
 8gp1TQ23BYzOY+g6WW+MPluHD2Kd8VFnQlkFqQGeeFiPq0sHpN2IIVO6hNJJUGn3OUW4
 yyhlxGYLP6Nw7qVBLHCaE0eK97Kd1WRWGMTGjOwHOtkqEwOo5QjRg1lHbGGZcPdHEC1D
 MX0iRa5kCaw/neheM9MDfIrjYwb/gC0aBriIHF95KMyQM4wbeTvZhw/0MBhajxe5A8q0
 yYKAEgekwnugWEGHsaYBcz3g0G1+2k+cYUI2LYPFLd2kOPNbwX2gqvox/FrPrVXGSa1R
 cgcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBxBtMx75w39de5bLD0lqgpIzDgq7r7PEOTqpeLk+ECbubhd1alUU+pQdccOJVdN8PLlYxMYD8jSmIj0OEsUTjBlSX24C5jjmZ8nlHjb63
X-Gm-Message-State: AOJu0YwrBFocTyOJuMJlZIO+L62GfLbBdFXWZUjSqcOzKkrAIxfEWzXJ
 frly6H+BkbNNNuovDuaMSDJCjrG6R31ObJjStkNMnqfKyQaMgYcPWDrWTBqaAoE=
X-Google-Smtp-Source: AGHT+IHPw1Hd6p5weeCqyIthj4Yo78FUof006uG8oBvotqfwPaBsoFD/W3ipq2kE+BlGH2dDU+qpyg==
X-Received: by 2002:a05:6512:39d1:b0:523:99a4:a187 with SMTP id
 2adb3069b0e04-52399a4a231mr11424053e87.26.1716157692887; 
 Sun, 19 May 2024 15:28:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ba76esm4068463e87.89.2024.05.19.15.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 15:28:12 -0700 (PDT)
Date: Mon, 20 May 2024 01:28:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] drm/panel: himax-hx83102: use wrapped MIPI DCS
 functions
Message-ID: <2ltjatqcq5bewekkt6lfg56vhx5mxfebghr3sd56cmjkkgamve@7jfsft35r6k3>
References: <20240517213712.3135166-1-dianders@chromium.org>
 <20240517143643.8.If761d37b5d511867ac8207fe8220ae48d444a04f@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517143643.8.If761d37b5d511867ac8207fe8220ae48d444a04f@changeid>
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

On Fri, May 17, 2024 at 02:36:43PM -0700, Douglas Anderson wrote:
> Take advantage of some of the new wrapped routines introduced by
> commit f79d6d28d8fe ("drm/mipi-dsi: wrap more functions for streamline
> handling") to simplify the himax-hx83102 driver a bit more. This gets
> rid of some extra error prints (since the _multi functions all print
> errors for you) and simplifies the code a bit.
> 
> One thing here that isn't just refactoring is that in a few places we
> now check with errors with "if (err)" instead of "if (err < 0)". All
> errors are expected to be negative so this is not expected to have any
> impact. The _multi code internally considers anything non-zero to be
> an error so this just makes things consistent.
> 
> It can also be noted that hx83102_prepare() has a mix of things that
> can take advantage of _multi calls and things that can't. The cleanest
> seemed to be to use the multi_ctx still but consistently use the
> "accum_err" variable for error returns, though that's definitely a
> style decision with pros and cons.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 92 +++++++--------------
>  1 file changed, 28 insertions(+), 64 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
