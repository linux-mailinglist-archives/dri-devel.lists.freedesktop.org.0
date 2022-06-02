Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D5653BB69
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 17:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78503112D35;
	Thu,  2 Jun 2022 15:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AFD112D35
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 15:12:13 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id a15so8283022lfb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 08:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=M/dYHmnkSGV1dzutNBubTQIn3L/JOh4kpdNfkA1ozno=;
 b=o6x7JoZst/euEHN/7b7RpYwl7U9npG8+UKi8f0qw2s5r5nzGIf3zIFc4dYxLjBril6
 ZZ2PHdneaQk9tsJwpn0RpWf8rRQEkK66rXkz0/aqRtpleMMdJ8+b4tGTwiU6Uk9Dd2tL
 lSY8Y7s5xa7l6hJ3oVe1HPXpO2b4SSJdXUAe5F/MYudRmtSX360eFzWvX533x/lIJN7i
 L7G9pWnNECErvDHtFwsGDIBMC8Tos5FNNwt190izOWANCPBmDrTvFOYYlyntyTajQ/Iz
 fqGkDu7BBKm6nevCEeR6uvLZQU5YV/DeqfAk+ywEuZ7QqU+zgHqqV8bpHJLQo6SgkjEB
 33mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M/dYHmnkSGV1dzutNBubTQIn3L/JOh4kpdNfkA1ozno=;
 b=Jh6Fo4CmQfEgbt0Y7GDxhaEOJk1vYu8SvWlyaby3nUEcBCpa1vs3kwlqKARfx0XCrp
 VicDfRJj1wS9tbUsdE1ORNJl+cqE/5Oh8JveosEsDUQQ76gvCDaLh1G+wFlmdExI3i2e
 iuWiw3TR9MKYwZLNr6Pl/TXdMtQpbe8jUoeXO5eDai+j6gtgyYa6xwkIdOTvI3wENPgM
 5VogI1JVdDXq/dvyZV4yEhO9b5mcrQ9JUOr4nA7WP6XMA4JHl7HpV3zHzfFAf9NBvvVf
 VPoGmOYuuHFJATozQaNlnW8fui5LEChd9s6oCaddj+F1NZksD8NZ4rOfoNfrugzmW1SO
 rMEg==
X-Gm-Message-State: AOAM530IWR4vbZtQ6o5kCxy9r6MXz1RJIKm3vXhddUMe8s/Gn4B3jfsR
 3CPLQu1u3mZH6TL0GTjbZTPT2g==
X-Google-Smtp-Source: ABdhPJzNQG2JweGywHctHB6i1b+OwfsJ+fKsEK7fPzNN9ID/Rbu8LbjUFE2FmuGsrsKRJz4Cig4dOQ==
X-Received: by 2002:a05:6512:15a4:b0:477:cc23:6252 with SMTP id
 bp36-20020a05651215a400b00477cc236252mr49298222lfb.389.1654182731748; 
 Thu, 02 Jun 2022 08:12:11 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 e8-20020ac25ca8000000b00478f0799dd0sm1083250lfq.21.2022.06.02.08.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 08:12:11 -0700 (PDT)
Message-ID: <eb66c55c-cecb-0af0-8800-0a9e59d67a9b@linaro.org>
Date: Thu, 2 Jun 2022 18:12:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 2/4] drm/panel-edp: Take advantage of
 wait_hpd_asserted() in struct drm_dp_aux
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <20220418171757.2282651-1-dianders@chromium.org>
 <20220418101725.v3.2.Icea616f57331fbaa3d48c529f300c9a8ebd37fb5@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220418101725.v3.2.Icea616f57331fbaa3d48c529f300c9a8ebd37fb5@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2022 20:17, Douglas Anderson wrote:
> Let's add support for being able to read the HPD pin even if it's
> hooked directly to the controller. This will allow us to get more
> accurate delays also lets us take away the waiting in the AUX transfer
> functions of the eDP controller drivers.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Change is_hpd_asserted() to wait_hpd_asserted()
> 
>   drivers/gpu/drm/panel/panel-edp.c | 33 +++++++++++++++++++++----------
>   1 file changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 1732b4f56e38..086e0bf52fb9 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -417,6 +417,11 @@ static int panel_edp_get_hpd_gpio(struct device *dev, struct panel_edp *p)
>   	return 0;
>   }
>   
> +static bool panel_edp_can_read_hpd(struct panel_edp *p)
> +{
> +	return !p->no_hpd && (p->hpd_gpio || (p->aux && p->aux->wait_hpd_asserted));
> +}
> +
>   static int panel_edp_prepare_once(struct panel_edp *p)
>   {
>   	struct device *dev = p->base.dev;
> @@ -441,17 +446,21 @@ static int panel_edp_prepare_once(struct panel_edp *p)
>   	if (delay)
>   		msleep(delay);
>   
> -	if (p->hpd_gpio) {
> +	if (panel_edp_can_read_hpd(p)) {
>   		if (p->desc->delay.hpd_absent)
>   			hpd_wait_us = p->desc->delay.hpd_absent * 1000UL;
>   		else
>   			hpd_wait_us = 2000000;
>   
> -		err = readx_poll_timeout(gpiod_get_value_cansleep, p->hpd_gpio,
> -					 hpd_asserted, hpd_asserted,
> -					 1000, hpd_wait_us);
> -		if (hpd_asserted < 0)
> -			err = hpd_asserted;
> +		if (p->hpd_gpio) {
> +			err = readx_poll_timeout(gpiod_get_value_cansleep,
> +						 p->hpd_gpio, hpd_asserted,
> +						 hpd_asserted, 1000, hpd_wait_us);
> +			if (hpd_asserted < 0)
> +				err = hpd_asserted;
> +		} else {
> +			err = p->aux->wait_hpd_asserted(p->aux, hpd_wait_us);
> +		}

I'm close to thinking that this construct deserves a separate helper.

>   
>   		if (err) {
>   			if (err != -ETIMEDOUT)
> @@ -532,18 +541,22 @@ static int panel_edp_enable(struct drm_panel *panel)
>   	/*
>   	 * If there is a "prepare_to_enable" delay then that's supposed to be
>   	 * the delay from HPD going high until we can turn the backlight on.
> -	 * However, we can only count this if HPD is handled by the panel
> -	 * driver, not if it goes to a dedicated pin on the controller.
> +	 * However, we can only count this if HPD is readable by the panel
> +	 * driver.
> +	 *
>   	 * If we aren't handling the HPD pin ourselves then the best we
>   	 * can do is assume that HPD went high immediately before we were
> -	 * called (and link training took zero time).
> +	 * called (and link training took zero time). Note that "no-hpd"
> +	 * actually counts as handling HPD ourselves since we're doing the
> +	 * worst case delay (in prepare) ourselves.
>   	 *
>   	 * NOTE: if we ever end up in this "if" statement then we're
>   	 * guaranteed that the panel_edp_wait() call below will do no delay.
>   	 * It already handles that case, though, so we don't need any special
>   	 * code for it.
>   	 */
> -	if (p->desc->delay.prepare_to_enable && !p->hpd_gpio && !p->no_hpd)
> +	if (p->desc->delay.prepare_to_enable &&
> +	    !panel_edp_can_read_hpd(p) && !p->no_hpd)
>   		delay = max(delay, p->desc->delay.prepare_to_enable);
>   
>   	if (delay)


-- 
With best wishes
Dmitry
