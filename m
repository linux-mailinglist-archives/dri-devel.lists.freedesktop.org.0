Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968979B41A7
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 05:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E49D310E267;
	Tue, 29 Oct 2024 04:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ecJWpYvh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C034810E267
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 04:57:13 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7b14077ec5aso547266185a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 21:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730177833; x=1730782633; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=miRKsVITHzAukzsj+/ygTCg9k/xHlCLYaDB0d4rUOqE=;
 b=ecJWpYvhKgrOCQ2fC6ozOxF6C5YiGnZDtqkQQs2PjhrjYznYq7zadhT3IIjFlSB9r8
 lEIPQ91W+7V90WlYa3Ymf8wu6T0LedNWVhWyTemPpfQnnwsk/g67s6yzhPte2C2XSfJN
 ck4PCy2URE4qj2tQ3u/lKVclooiJ02wzZDIyhMUXc8esDYdXsWugoVOzknu19XG+PaUY
 2aupPZAFDa1QQHSfwd5+YHhbQpbjgMYB1QJl85OMakFn3N200DwCIsr4AmEeuFU3P50P
 /BNsh9qZq2VYjURV9cmloRMbu2PUzlHiSInP7HJkAyk75JCsLMECJHDBg0VqMoC6p+iQ
 rkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730177833; x=1730782633;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=miRKsVITHzAukzsj+/ygTCg9k/xHlCLYaDB0d4rUOqE=;
 b=A1CP14Vlhv53BC2jE2IqvTphBYHxLUD8/fLZKRfKh1VIypSAAKs108VmD6kS/D7LmU
 HRQThQNMhabBZ1W1g8OQ6sNdIeG6k6Cs0qNVHOC365EvBeo2C6LNESt5i6iWjxno8nbM
 21JY5e9tkwKC4t8UwaPU9Dh1HRMMR6K3nX0gD99DDD+VodMh69hzcxnDAC2Q7RM73JvP
 ymvxf9MomlBMTQ2PUAL9Si+pQG5F5RLo+fgRrDvOJdI6/91oIfgztyO7OnvZEJhdZ1p+
 qPeXdtvmHs2vC147yaEEgHFpckuuwiVh29pr6p8co4xy5bpU2O/0JaU9jNMN0ZXZpZOn
 RllQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMEz1V4oC+j+LozLxyfI1y9OLib2nefW6rZuqDN+IE9mdnz5jWhbjuiLBLLJJLE71u5LE5QLyVuGk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKpQsweOwjSx/Xk4tE134djvJnj0CTFSk5G6KUuoUN4PxP3Nv1
 rjE5sqHeqtjoL0RXs1Y1+RAr9tVFWBikBZ/cenxdSQbMHQvYg1Rd
X-Google-Smtp-Source: AGHT+IGW1ooBeldcdGoeMJo+T427girUR5zVV1hzqHzNK8xt/vLyirJwTY09tBGqdQSIjGkKrufbxQ==
X-Received: by 2002:a05:6214:2f88:b0:6cb:c661:49ce with SMTP id
 6a1803df08f44-6d2f62d4b03mr13390146d6.23.1730177832557; 
 Mon, 28 Oct 2024 21:57:12 -0700 (PDT)
Received: from yoga (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d17972f622sm39003676d6.9.2024.10.28.21.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 21:57:11 -0700 (PDT)
Date: Tue, 29 Oct 2024 00:57:08 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Mehdi Djait <mehdi.djait@bootlin.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, 
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH] drm/tiny: Fix some error handling paths in
 sharp_memory_probe()
Message-ID: <7b4y5djihc4ov7o2h6t27qakvvunkmf4ieozf3earesseny4qd@wdcpk35zt3zg>
References: <b218165cf9af60907e0912266134f1ef1d3617b9.1729924305.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b218165cf9af60907e0912266134f1ef1d3617b9.1729924305.git.christophe.jaillet@wanadoo.fr>
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

On Sat, Oct 26, 2024 at 08:32:36AM +0200, Christophe JAILLET wrote:
> If an error occurs after allocating resources based on which
> "sharp,vcom-mode" is used, then these resources must be released, as
> already done in the .remove() function.
> 
> Use 2 new devm_add_action_or_reset() for that and simplify code
> accordingly.
> 
> Fixes: b8f9f21716fe ("drm/tiny: Add driver for Sharp Memory LCD")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---
>  drivers/gpu/drm/tiny/sharp-memory.c | 66 ++++++++++++++---------------
>  1 file changed, 32 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
> index 2d2315bd6aef..01d1ce2462e1 100644
> --- a/drivers/gpu/drm/tiny/sharp-memory.c
> +++ b/drivers/gpu/drm/tiny/sharp-memory.c
> @@ -48,12 +48,6 @@ enum sharp_memory_model {
>  	LS044Q7DH01,
>  };
>  
> -enum sharp_memory_vcom_mode {
> -	SHARP_MEMORY_SOFTWARE_VCOM,
> -	SHARP_MEMORY_EXTERNAL_VCOM,
> -	SHARP_MEMORY_PWM_VCOM
> -};
> -
>  struct sharp_memory_device {
>  	struct drm_device drm;
>  	struct spi_device *spi;
> @@ -67,10 +61,6 @@ struct sharp_memory_device {
>  
>  	struct gpio_desc *enable_gpio;
>  
> -	struct task_struct *sw_vcom_signal;
> -	struct pwm_device *pwm_vcom_signal;
> -
> -	enum sharp_memory_vcom_mode vcom_mode;
>  	u8 vcom;
>  
>  	u32 pitch;
> @@ -500,25 +490,41 @@ static int sharp_memory_pipe_init(struct drm_device *dev,
>  	return drm_connector_attach_encoder(connector, encoder);
>  }
>  
> +static void sharp_memory_stop_kthread(void *data)
> +{
> +	struct task_struct *task = data;
> +
> +	kthread_stop(task);
> +}
> +
> +static void sharp_memory_disable_pwm(void *data)
> +{
> +	struct pwm_device *pwm = data;
> +
> +	pwm_disable(pwm);
> +}
> +
>  static int sharp_memory_init_pwm_vcom_signal(struct sharp_memory_device *smd)
>  {
>  	int ret;
>  	struct device *dev = &smd->spi->dev;
> +	struct pwm_device *pwm_vcom_signal;
>  	struct pwm_state pwm_state;
>  
> -	smd->pwm_vcom_signal = devm_pwm_get(dev, NULL);
> -	if (IS_ERR(smd->pwm_vcom_signal))
> -		return dev_err_probe(dev, PTR_ERR(smd->pwm_vcom_signal),
> +	pwm_vcom_signal = devm_pwm_get(dev, NULL);
> +	if (IS_ERR(pwm_vcom_signal))
> +		return dev_err_probe(dev, PTR_ERR(pwm_vcom_signal),
>  				     "Could not get pwm device\n");
>  
> -	pwm_init_state(smd->pwm_vcom_signal, &pwm_state);
> +	pwm_init_state(pwm_vcom_signal, &pwm_state);
>  	pwm_set_relative_duty_cycle(&pwm_state, 1, 10);
>  	pwm_state.enabled = true;
> -	ret = pwm_apply_might_sleep(smd->pwm_vcom_signal, &pwm_state);
> +	ret = pwm_apply_might_sleep(pwm_vcom_signal, &pwm_state);
>  	if (ret)
>  		return dev_err_probe(dev, -EINVAL, "Could not apply pwm state\n");
>  
> -	return 0;
> +	return devm_add_action_or_reset(dev, sharp_memory_disable_pwm,
> +					pwm_vcom_signal);
>  }
>  
>  static int sharp_memory_probe(struct spi_device *spi)
> @@ -595,15 +601,20 @@ static int sharp_memory_probe(struct spi_device *spi)
>  				     "Unable to find sharp,vcom-mode node in device tree\n");
>  
>  	if (!strcmp("software", vcom_mode_str)) {
> -		smd->vcom_mode = SHARP_MEMORY_SOFTWARE_VCOM;
> -		smd->sw_vcom_signal = kthread_run(sharp_memory_sw_vcom_signal_thread,
> -						  smd, "sw_vcom_signal");
> +		struct task_struct *sw_vcom_signal;
> +
> +		sw_vcom_signal = kthread_run(sharp_memory_sw_vcom_signal_thread,
> +					     smd, "sw_vcom_signal");
> +
> +		ret = devm_add_action_or_reset(dev, sharp_memory_stop_kthread,
> +					       sw_vcom_signal);
> +		if (ret)
> +			return ret;
>  
>  	} else if (!strcmp("external", vcom_mode_str)) {
> -		smd->vcom_mode = SHARP_MEMORY_EXTERNAL_VCOM;
> +		/* empty */
>  
>  	} else if (!strcmp("pwm", vcom_mode_str)) {
> -		smd->vcom_mode = SHARP_MEMORY_PWM_VCOM;
>  		ret = sharp_memory_init_pwm_vcom_signal(smd);
>  		if (ret)
>  			return ret;
> @@ -640,19 +651,6 @@ static void sharp_memory_remove(struct spi_device *spi)
>  
>  	drm_dev_unplug(&smd->drm);
>  	drm_atomic_helper_shutdown(&smd->drm);
> -
> -	switch (smd->vcom_mode) {
> -	case SHARP_MEMORY_SOFTWARE_VCOM:
> -		kthread_stop(smd->sw_vcom_signal);
> -		break;
> -
> -	case SHARP_MEMORY_EXTERNAL_VCOM:
> -		break;
> -
> -	case SHARP_MEMORY_PWM_VCOM:
> -		pwm_disable(smd->pwm_vcom_signal);
> -		break;
> -	}
>  }
>  
>  static struct spi_driver sharp_memory_spi_driver = {
> -- 
> 2.47.0
> 
Tested-by: Alex Lanzano <lanzano.alex@gmail.com>
Reviewed-by: Alex Lanzano <lanzano.alex@gmail.com>
