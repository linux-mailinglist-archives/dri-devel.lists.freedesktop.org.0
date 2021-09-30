Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA8541E36F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 23:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC7A6EC90;
	Thu, 30 Sep 2021 21:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C3D6EC90
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 21:35:26 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id x124so9052092oix.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 14:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=e0NcfULf3wNNjVF33uwiRx+dy6Dmhwkfi1qdAZs9US4=;
 b=DBjew3S0URka73F8hSVwAUYD20OGHDuGURaoBEn3oYxUADnCPbuh2AkHxd1rWzWBWb
 CT67tzsTYkVTDq03fcfZAEdnq8OfBHkIzO8dVmgq8aXWXDO+dr0qKnWkYc/iInzciKrI
 qf94lP+haQyQtcD/9YWmnGQz59MfjETnwL1VthNXS7D8tVXddyVGX8bxyasjYcZfATcC
 fjasSaMS8S72GOuG5glNpDe3++79AAN+UBKQaI0He99CT4idFjPqVbxMMzrgwELHkBnn
 ZxYBAVOCh0HJ+fgW1izeqqzlpAADFgXWh8RmiAIqS/5JHVLemV7NcIt5PHsXQfJ1dG6J
 ebBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=e0NcfULf3wNNjVF33uwiRx+dy6Dmhwkfi1qdAZs9US4=;
 b=WHTOQozNYhQ/fuejyvYJsqiWHcxhraxXLDQSCybfghlmoTMGECqBHbCGkWJpq7AjmT
 HJyswgaNxcnadGqDMeOpso6nVmScPnklxmAsfCMJp43PbAMwkTyt0RVs7g3S0/PCspj4
 KTq4DgY1KcDY50t7mwJGSFmruBc6kQmcki6QChjZZ49hgXpqKawPKHR/xXiT+cppmcLR
 5c1X72jOxHPWYI9Xn/rnu1OpdNWQabZKBsa7stNfCecY+nyBGenm7UP0ua1BiE98PAlR
 x3JroNOUU5R+IzAY4PzyNsdEklp26w2Hb/K0e63OuVqyGOYuRlZjOpe9ZYuFz5UMetIc
 53xA==
X-Gm-Message-State: AOAM5322Dqb8X/k1Ahzpbv7f3ZmkZ7DZGe9nptwRiBQAqwjnScFQB4ud
 qO2QwBWonnFH6u1mmhX/hbhicw==
X-Google-Smtp-Source: ABdhPJz6lc6vrB1jwZXEZfb6aq4lDeyCWpNlrFW0PbVZaw3Sux9WhXMMhsglFjUCTTV3T9ZfmG/FKQ==
X-Received: by 2002:a05:6808:107:: with SMTP id
 b7mr1237518oie.146.1633037725892; 
 Thu, 30 Sep 2021 14:35:25 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net
 (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
 by smtp.gmail.com with ESMTPSA id w17sm775133otu.54.2021.09.30.14.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 14:35:25 -0700 (PDT)
Subject: Re: [PATCH v6 1/3] pwm: Introduce single-PWM of_xlate function
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Doug Anderson <dianders@google.com>
References: <20210930030557.1426-1-bjorn.andersson@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Message-ID: <aa563e12-4c3c-1854-ce91-efa7676d1676@kali.org>
Date: Thu, 30 Sep 2021 16:35:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210930030557.1426-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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


On 9/29/21 10:05 PM, Bjorn Andersson wrote:
> The existing pxa driver and the upcoming addition of PWM support in the
> TI sn565dsi86 DSI/eDP bridge driver both has a single PWM channel and
> thereby a need for a of_xlate function with the period as its single
> argument.
>
> Introduce a common helper function in the core that can be used as
> of_xlate by such drivers and migrate the pxa driver to use this.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v4:
> - None
>
>  drivers/pwm/core.c    | 26 ++++++++++++++++++++++++++
>  drivers/pwm/pwm-pxa.c | 16 +---------------
>  include/linux/pwm.h   |  2 ++
>  3 files changed, 29 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index 4527f09a5c50..2c6b155002a2 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -152,6 +152,32 @@ of_pwm_xlate_with_flags(struct pwm_chip *pc, const struct of_phandle_args *args)
>  }
>  EXPORT_SYMBOL_GPL(of_pwm_xlate_with_flags);
>  
> +struct pwm_device *
> +of_pwm_single_xlate(struct pwm_chip *pc, const struct of_phandle_args *args)
> +{
> +	struct pwm_device *pwm;
> +
> +	if (pc->of_pwm_n_cells < 1)
> +		return ERR_PTR(-EINVAL);
> +
> +	/* validate that one cell is specified, optionally with flags */
> +	if (args->args_count != 1 && args->args_count != 2)
> +		return ERR_PTR(-EINVAL);
> +
> +	pwm = pwm_request_from_chip(pc, 0, NULL);
> +	if (IS_ERR(pwm))
> +		return pwm;
> +
> +	pwm->args.period = args->args[0];
> +	pwm->args.polarity = PWM_POLARITY_NORMAL;
> +
> +	if (args->args_count == 2 && args->args[2] & PWM_POLARITY_INVERTED)
> +		pwm->args.polarity = PWM_POLARITY_INVERSED;
> +
> +	return pwm;
> +}
> +EXPORT_SYMBOL_GPL(of_pwm_single_xlate);
> +
>  static void of_pwmchip_add(struct pwm_chip *chip)
>  {
>  	if (!chip->dev || !chip->dev->of_node)
> diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
> index a9efdcf839ae..238ec88c130b 100644
> --- a/drivers/pwm/pwm-pxa.c
> +++ b/drivers/pwm/pwm-pxa.c
> @@ -148,20 +148,6 @@ static const struct platform_device_id *pxa_pwm_get_id_dt(struct device *dev)
>  	return id ? id->data : NULL;
>  }
>  
> -static struct pwm_device *
> -pxa_pwm_of_xlate(struct pwm_chip *pc, const struct of_phandle_args *args)
> -{
> -	struct pwm_device *pwm;
> -
> -	pwm = pwm_request_from_chip(pc, 0, NULL);
> -	if (IS_ERR(pwm))
> -		return pwm;
> -
> -	pwm->args.period = args->args[0];
> -
> -	return pwm;
> -}
> -
>  static int pwm_probe(struct platform_device *pdev)
>  {
>  	const struct platform_device_id *id = platform_get_device_id(pdev);
> @@ -187,7 +173,7 @@ static int pwm_probe(struct platform_device *pdev)
>  	pc->chip.npwm = (id->driver_data & HAS_SECONDARY_PWM) ? 2 : 1;
>  
>  	if (IS_ENABLED(CONFIG_OF)) {
> -		pc->chip.of_xlate = pxa_pwm_of_xlate;
> +		pc->chip.of_xlate = of_pwm_single_xlate;
>  		pc->chip.of_pwm_n_cells = 1;
>  	}
>  
> diff --git a/include/linux/pwm.h b/include/linux/pwm.h
> index 725c9b784e60..dd51d4931fdc 100644
> --- a/include/linux/pwm.h
> +++ b/include/linux/pwm.h
> @@ -414,6 +414,8 @@ struct pwm_device *pwm_request_from_chip(struct pwm_chip *chip,
>  
>  struct pwm_device *of_pwm_xlate_with_flags(struct pwm_chip *pc,
>  		const struct of_phandle_args *args);
> +struct pwm_device *of_pwm_single_xlate(struct pwm_chip *pc,
> +				       const struct of_phandle_args *args);
>  
>  struct pwm_device *pwm_get(struct device *dev, const char *con_id);
>  struct pwm_device *of_pwm_get(struct device *dev, struct device_node *np,


I've tested these v6 all 3 patches on the Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>

