Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3508C1BD2
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 02:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA96010E069;
	Fri, 10 May 2024 00:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kgzDC2MK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5839210E069
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 00:56:09 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-51f0602bc58so2390672e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 17:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715302567; x=1715907367; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lXqP1Ltv+f2Bj5fMlF5qjaDyVYcHhqES0nW1HquL4V8=;
 b=kgzDC2MKMraLvD2ZJddMkXg4/tqrBq+tBaoBpRfaCTJvn7eBWskH4rk2np0FnsPrJc
 jFaZxifAhRtBSFkHIliGPVk0xqeSTC1/KnM7wCduPhAg5VAyijejzj3wwRM7jJCQ15vR
 +fr6rCEgipPc6iHHKNB2RmeMwx4MyzBXgqCP5cm45k5/dqNLcNzoePI1DRHq7PnGJg31
 AVeBdSVr39P/sYEd/kSiFR7hbwZHdHHU3SwGCrQ3jjDIfVDVX4eE7UM/s9sdtv0nNJQh
 XEbgs3J/FFiGR4J3nn+CyiHqTwnGyCvjXRguR3yt+bKI7dJNNp/nKnqn3UC+r6mojKbv
 GZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715302567; x=1715907367;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lXqP1Ltv+f2Bj5fMlF5qjaDyVYcHhqES0nW1HquL4V8=;
 b=vIUXdC6aBoVI3mYhFKbFbohlUCnJG45Ki8axGeqjA+GTj50D8nSCBfBGEK31PYr+ep
 0Die9G8CKzlXlsiVh2NUTVryrnX2NL7QcW4dYlJvOd23zhEEaKx3Z1pL8mC2OXcFxdLR
 HlFjDbuJsHc26ROrfivDMuKwCauCrOsBCg6OKalSHGOZ38oeU9yyav/fA1DFm+6mTeNx
 FQ3ZqHKTXqAwXJaM5O2u+cmGGj64IrdjtBPiGA0Ia5EiLd0ZAbaRslWyI4TYAFSfcvQP
 ghHkcxoxMB2+s0aesW9Mfm68nS+q7bMWb4J6ZEdY/PBs0s4GvFXFXGWUsKAJGwkBPAza
 CaMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGaKcrabiv14yXfCnIRZ8ROLL0RuCdZA6y4EgaBCUN/QU85tN7rIGHtzO6vd0wKaa9MCWo9HZ+OyKs9FbH3vcEi0u2GMwnmvPK0V2NZMjj
X-Gm-Message-State: AOJu0Yw59ZUfDEHpo8uPS5ijUWSm7ln3QbAXv27KO6m1EJ9gG1EuGEz+
 Cuc66EResX+OFFWiGjWs97Xl/zvg0W40+T+gMAA5IHo3vjiOslcqWbgeis+9j5Q=
X-Google-Smtp-Source: AGHT+IFoZTY4mV6hLkPNd/kgjZ7IP6+sOZ2PGQRzw2JpMkjYwk/CdOhvAaxKg1w2k0ngX+YIi0IDUg==
X-Received: by 2002:a19:8c46:0:b0:51f:9a88:be2a with SMTP id
 2adb3069b0e04-521e126c339mr1231384e87.23.1715302566866; 
 Thu, 09 May 2024 17:56:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35baacesm491795e87.90.2024.05.09.17.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 17:56:06 -0700 (PDT)
Date: Fri, 10 May 2024 03:56:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: jdi-fhd-r63452: move DCS off commands to
 disable
Message-ID: <rpita5o6za64p7tamasssb2fja6h6ipr5cibh6gs7klkijyk6r@mausrcet2ycx>
References: <20240509-jdi-use-disable-v1-1-5c175b2ea1ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240509-jdi-use-disable-v1-1-5c175b2ea1ee@gmail.com>
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

On Thu, May 09, 2024 at 08:14:07PM +0200, Barnabás Czémán wrote:
> Move DCS off commands from .unprepare to .disable so that they
> actually reach the DSI host.
> 
> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

I don't think this is correct. If the driver sends enable commands in
prepare, it should be able to send commands during unprepare too.

> 
> diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
> index 483dc88d16d8..f7222974d6ed 100644
> --- a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
> +++ b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
> @@ -169,6 +169,15 @@ static int jdi_fhd_r63452_prepare(struct drm_panel *panel)
>  }
>  
>  static int jdi_fhd_r63452_unprepare(struct drm_panel *panel)
> +{
> +	struct jdi_fhd_r63452 *ctx = to_jdi_fhd_r63452(panel);
> +
> +	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> +
> +	return 0;
> +}
> +
> +static int jdi_fhd_r63452_disable(struct drm_panel *panel)
>  {
>  	struct jdi_fhd_r63452 *ctx = to_jdi_fhd_r63452(panel);
>  	struct device *dev = &ctx->dsi->dev;
> @@ -178,8 +187,6 @@ static int jdi_fhd_r63452_unprepare(struct drm_panel *panel)
>  	if (ret < 0)
>  		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
>  
> -	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> -
>  	return 0;
>  }
>  
> @@ -219,6 +226,7 @@ static int jdi_fhd_r63452_get_modes(struct drm_panel *panel,
>  static const struct drm_panel_funcs jdi_fhd_r63452_panel_funcs = {
>  	.prepare = jdi_fhd_r63452_prepare,
>  	.unprepare = jdi_fhd_r63452_unprepare,
> +	.disable = jdi_fhd_r63452_disable,
>  	.get_modes = jdi_fhd_r63452_get_modes,
>  };
>  
> 
> ---
> base-commit: 704ba27ac55579704ba1289392448b0c66b56258
> change-id: 20240509-jdi-use-disable-ee29098d9c81
> 
> Best regards,
> -- 
> Barnabás Czémán <trabarni@gmail.com>
> 

-- 
With best wishes
Dmitry
