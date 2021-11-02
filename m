Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FD8443230
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7556673051;
	Tue,  2 Nov 2021 16:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5409E73051
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 16:00:04 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d3so34037272wrh.8
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 09:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=soQC7NvwSDRBZqkI7s6xnknhSLp6r09XDuYbODEjkgc=;
 b=mI1LdYKr3uNkluaEcBClbKGUsJfGPt6nnozQwAb02R4IwXZXZYGCrtZv+Q0v5NPyVQ
 S9T/yR5BkKLFfLwvO2Vi7sjIk/Kxow9Q8jPhxeLwuO4yv7M2costSM+57epqyeJ9OFK3
 N3kSnL5rWFVzYsVblRrjKoQSO9SE+taHm0AsvZWZ+2wZmAdKWMfETwnoAWZvZcgkhLZF
 RR/vubCeacoqiI+vUEaYFxaXVaIIIXr0mouqVUgxvZFa6X2zZ9kLGkObCQYJTbP8y5lz
 58D4t340IPKY2lUP+WSppERmUJ5gPTIfnzzdrhffNcpi8qVM3i6Jxsq3XgNLibxNvYqT
 GSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=soQC7NvwSDRBZqkI7s6xnknhSLp6r09XDuYbODEjkgc=;
 b=GZm91WoRDZGnGzX42SfTKNFo/mpJ8sFyCqfgethjkZACEP4yq7ZvR2Y1XqAcyyzmog
 pMnuUAxA0xkSehijbowghVrqWpv0I6j77KBFpx9pasjfqy9viOEAWRLtXWn0ILFFGyRV
 8EIRzbJLkIzoOlefA7H6QQRSIaKHMjdHrei8dfmx7Gh4uClG1pJOQR3GaKAEQF5s0cSs
 JYmQ1oWVcT+sDF0O+igAf6VPCQ7xSGJntrdI666NQQTT4Qxh7NRp9Dp8x0+7huzicDWY
 aTvTNsM4PMJgLrIHUdgrMYD2pK4Lt+1jt0PzJotzkQFYSy+s0dLL4qvSBUuJgYu48LkG
 DDjA==
X-Gm-Message-State: AOAM532kFOhF4VavW9XZ3sQsQF8kiFhKHLY7X8ZSFsxlN3CISeBtNKSX
 Ev8pHbd1X+m0M1eMeo2CjVsDwg==
X-Google-Smtp-Source: ABdhPJw9jPPQfCPPiExh9uQm6mXjK33Pw8aA2tl7f4/xtTsMj7OHHX5OrVdH3CJO/RqZC/el9fIZYA==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr3296739wrp.226.1635868802700; 
 Tue, 02 Nov 2021 09:00:02 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id 10sm3576379wme.27.2021.11.02.09.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:00:02 -0700 (PDT)
Date: Tue, 2 Nov 2021 16:00:00 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: =?utf-8?B?TWHDrXJh?= Canal <maira.canal@usp.br>
Subject: Re: [PATCH v4] backlight: lp855x: Switch to atomic PWM API
Message-ID: <20211102160000.kvi6hhhgdjowgnft@maple.lan>
References: <YX/pWeXPv1bykg2g@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YX/pWeXPv1bykg2g@fedora>
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
 jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 01, 2021 at 10:19:21AM -0300, Maíra Canal wrote:
> Remove legacy PWM interface (pwm_config, pwm_enable, pwm_disable) and
> replace it for the atomic PWM API.
> 
> Signed-off-by: Maíra Canal <maira.canal@usp.br>
> ---
> V1 -> V2: Initialize variable and simply conditional loop
> V2 -> V3: Fix assignment of NULL variable
> V3 -> V4: Replace division for pwm_set_relative_duty_cycle
> ---
>  drivers/video/backlight/lp855x_bl.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
> index e94932c69f54..bbf24564082a 100644
> --- a/drivers/video/backlight/lp855x_bl.c
> +++ b/drivers/video/backlight/lp855x_bl.c
> @@ -233,9 +233,8 @@ static int lp855x_configure(struct lp855x *lp)
>  
>  static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
>  {
> -	unsigned int period = lp->pdata->period_ns;
> -	unsigned int duty = br * period / max_br;
>  	struct pwm_device *pwm;
> +	struct pwm_state state;
>  
>  	/* request pwm device with the consumer name */
>  	if (!lp->pwm) {
> @@ -245,18 +244,15 @@ static void lp855x_pwm_ctrl(struct lp855x *lp, int br, int max_br)
>  
>  		lp->pwm = pwm;
>  
> -		/*
> -		 * FIXME: pwm_apply_args() should be removed when switching to
> -		 * the atomic PWM API.
> -		 */
> -		pwm_apply_args(pwm);
> +		pwm_init_state(lp->pwm, &state);
> +		state.period = lp->pdata->period_ns;
>  	}
>  
> -	pwm_config(lp->pwm, duty, period);
> -	if (duty)
> -		pwm_enable(lp->pwm);
> -	else
> -		pwm_disable(lp->pwm);
> +	pwm_get_state(lp->pwm, &state);

Should this be:

	} else {
		pwm_get_state(lp->pwm, &state);
	}

As currently written this will clobber the state.period that was set
above.


Daniel.


> +	pwm_set_relative_duty_cycle(&state, br, max_br);
> +	state.enabled = state.duty_cycle;
> +
> +	pwm_apply_state(lp->pwm, &state);
>  }
>  
>  static int lp855x_bl_update_status(struct backlight_device *bl)
> -- 
> 2.31.1
> 
