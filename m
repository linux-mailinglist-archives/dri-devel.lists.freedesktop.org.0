Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBAE6645FB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 17:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699D610E094;
	Tue, 10 Jan 2023 16:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F93910E094
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 16:26:18 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d17so12377429wrs.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 08:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Th71AAKmDZ5QLm9LWP/MGYPBbhSZ+FFSLF2yOB7TE2s=;
 b=kpE4Zcq1gu13wpwafvb2i6Z0u9wBYGLLWrrhNQIKxDPIa5C1OHDMXC+fFg9Vu2BrEr
 1PGdJR28gVhSlvWiEupF5gfHOtFmFyF3/bxbr8A4SsNB4iJx+Uc5zgTbvfWhZnZyPJgV
 RHWeGs3TluEjF9qgDAf/+Ep2OxX3pkfMwvpwxyET8qdO/srKqwBN5JkwS1/btNLI/zHU
 i2yK9CbkM6JOHGJk6tz/+HNRHD+x4G9z3uy+r+tlxqOQ0QreXtqutMDmEx+1mpgbkbfo
 B4svbjnliFLjKrCGEzdh5UjV8mY8nhKK7EAO7dbLjtokxu4kAjAzybqMu4XnJ2nYg9wd
 papA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Th71AAKmDZ5QLm9LWP/MGYPBbhSZ+FFSLF2yOB7TE2s=;
 b=psmav3gDX825H0rPLY93i9PNbIWwMjHKFg7K2SNbhRRBi7qm+2RkWtanDiS5GAPDfy
 1MD/5dViKsqur+FAFvDKj6gJjIGSzTZeB1N0EujwdJYzI6ZlnIpZ6LygWI0br8oWF3Ng
 0JNArP5j3y1n4v8cJJNxZR+AzerrhKYDdzpfE3qXbV4EsrRZxR2VXe7pWcRVKzaZWpg1
 +c7alZ1Ze3JgkthVLV1Ycn8z5IxHC2CJi/t1I4oqkkKaiGne8VqvP1l1Ab+O2lCONc1P
 F1a1Qqxm09bC2qevXRB/phfKv8mpMmZ67jEjOE6dU0XwUx3wlSNKpEXkuPte4vrjPMnC
 TLUg==
X-Gm-Message-State: AFqh2kp+r2eWT0i4JHBRN6R7UNCFg4f4Ei6zvtBSHe8yYAjVgksDfXOO
 eSGCSsakpi8OBtlhwDgWyb/Qxg==
X-Google-Smtp-Source: AMrXdXv5EJHECoPiR0GtM9s69kjB61W0jLB4YsP0QuX7myrYiYxMtrdgJv+azKjI26FYQwGZ3348mw==
X-Received: by 2002:a05:6000:a19:b0:2b1:c393:cbe with SMTP id
 co25-20020a0560000a1900b002b1c3930cbemr14799719wrb.11.1673367977022; 
 Tue, 10 Jan 2023 08:26:17 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 n16-20020a5d4010000000b002bbed1388a5sm6276513wrp.15.2023.01.10.08.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:26:16 -0800 (PST)
Date: Tue, 10 Jan 2023 16:26:14 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] backlight: pwm_bl: Don't disable the PWM to disable
 the backlight
Message-ID: <Y72RpjK4T2VEoIVI@aspen.lan>
References: <20230109204758.610400-1-u.kleine-koenig@pengutronix.de>
 <20230109204758.610400-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109204758.610400-2-u.kleine-koenig@pengutronix.de>
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
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 09:47:58PM +0100, Uwe Kleine-König wrote:
> Most but not all PWMs drive the PWM pin to its inactive state when
> disabled. Rely on the lowlevel PWM implementation to implement
> duty_cycle = 0 in an energy efficient way and don't disable the PWM.

I'm a little worried about this one.

I thought the PWM APIs allow the duty cycle to be rounded up or down
slightly during the apply.

So when you say "rely on the lowlevel to implement duty_cycle = 0 to..."
is it confirmed that this is true (and that all PWMs *can* implement
a duty_cycle of 0 without rounding up)?


Daniel.


> This fixes backlight disabling e.g. on i.MX6 when an inverted PWM is
> used.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/video/backlight/pwm_bl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> index 0509fecd5715..7bdc5d570a12 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -109,7 +109,7 @@ static int pwm_backlight_update_status(struct backlight_device *bl)
>  		pwm_backlight_power_off(pb);
>
>  		pwm_get_state(pb->pwm, &state);
> -		state.enabled = false;
> +		state.enabled = true;
>  		state.duty_cycle = 0;
>  		pwm_apply_state(pb->pwm, &state);
>  	}
> --
> 2.39.0
>
