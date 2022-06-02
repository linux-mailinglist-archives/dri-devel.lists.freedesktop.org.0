Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1390453BB40
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 16:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D45910E45B;
	Thu,  2 Jun 2022 14:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E2510E45B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 14:56:16 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id g12so5534423lja.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 07:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ex4b4TnhWybZyjVbUNL7d03f2NgaeAD4hH+6kwOL0lQ=;
 b=BiVI4J6HA0A+rErH7CN0jpx+xan3lJasSd9jH5HppAcqLcusr6GtGe5OLXhfT3rp1u
 G7XBwbSzUDh0R4GMsQlWtdNsHHxamFHuMr9NX4Zlg+3FyEuogqOUUbmQcRLWnI8ZPZjt
 ZcpfE6AyXoqZAP1oLUv4js7ytJxeQN9uVjL3+fRaceBfDtHkMtS/a8IyVVrmpJ6jXP3b
 vTR/3KME/gipO66b2H1QHmJOvPHar2YFB1guW1AcVGE7/hKzF+DrFTKuFGo2kZqDAuEq
 aXitMDOHNCVy3utE1kE347qWGmIWYaVEn7niopOpZFAKVwaaxKZXwb7E2mf2l9fsAuDX
 XFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ex4b4TnhWybZyjVbUNL7d03f2NgaeAD4hH+6kwOL0lQ=;
 b=SsGRpTf+eCHc6wga9Mk7xFhrZdmVBTo28u9oHhWxPeRh1JoTSCUCEBILcHGCPFGitP
 1QaQtFW4BcPxQUevaQCvls1wRMtMQIYZ7YX0yDkplCFDpaMAVMWc21jt2ZfGEjRQ90TI
 P0x10vQ2fqEdte+AGcBMTopckf0PoqJWSnxcTyBcys3oF0UGsFE4KAg2jq2rkPA/PE76
 +my42Bbp9XXu2yh61n6OBhN8qFy08DxMnBJGnhRvg5PAmaiNdzyd/sd1snBTpF428cFP
 9h8ZeSnN2qRYhu6HrJLfkQww4+E1CuIBbohqLksyhFvFVbnh/B2wlpO/RZsdbY53CYvE
 C1jA==
X-Gm-Message-State: AOAM530CnwBSEGymA03+nhjlEEmUWiHltOD7b6kishmUrsg+Rt1YKNhy
 bq0fbj8Zx6TdSKECByE36Yg/kw==
X-Google-Smtp-Source: ABdhPJz8vZyGeExLYDD7aZ8JYjAIwoFwfD6FNur7hEwgtI5H9bz+uHvyGCB08TqE/f62Vs6uNfX/1Q==
X-Received: by 2002:a05:651c:179f:b0:24b:1406:5f55 with SMTP id
 bn31-20020a05651c179f00b0024b14065f55mr41684120ljb.361.1654181774484; 
 Thu, 02 Jun 2022 07:56:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a05651200cf00b00478f6f63c00sm1067749lfp.146.2022.06.02.07.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 07:56:14 -0700 (PDT)
Message-ID: <075b907c-fd12-2e91-199b-c43d27340ed2@linaro.org>
Date: Thu, 2 Jun 2022 17:56:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 4/4] drm/bridge: parade-ps8640: Provide
 wait_hpd_asserted() in struct drm_dp_aux
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
References: <20220418171757.2282651-1-dianders@chromium.org>
 <20220418101725.v3.4.Ie827321ce263be52fdb8c1276f6f8cc00d78029f@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220418101725.v3.4.Ie827321ce263be52fdb8c1276f6f8cc00d78029f@changeid>
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
 Philip Chen <philipchen@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2022 20:17, Douglas Anderson wrote:
> This implements the callback added by the patch ("drm/dp: Add
> wait_hpd_asserted() callback to struct drm_dp_aux").
> 
> With this change and all the two "DP AUX Endpoint" drivers changed to
> use wait_hpd_asserted(), we no longer need to have an long delay in
> the AUX transfer function. It's up to the panel code to make sure that
> the panel is powered now. If someone tried to call the aux transfer
> function without making sure the panel is powered we'll just get a
> normal transfer failure.
> 
> We'll still keep the wait for HPD in the pre_enable() function. Though
> it's probably not actually needed there, this driver is used in the
> old mode (pre-DP AUX Endpoints) and it may be important for those
> cases. If nothing else, it shouldn't cause any big problems.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below

> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Change is_hpd_asserted() to wait_hpd_asserted()
> 
>   drivers/gpu/drm/bridge/parade-ps8640.c | 34 ++++++++++++++++----------
>   1 file changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 9766cbbd62ad..2f19a8c89880 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -168,23 +168,30 @@ static bool ps8640_of_panel_on_aux_bus(struct device *dev)
>   	return true;
>   }
>   
> -static int ps8640_ensure_hpd(struct ps8640 *ps_bridge)
> +static int _ps8640_wait_hpd_asserted(struct ps8640 *ps_bridge, unsigned long wait_us)
>   {
>   	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
> -	struct device *dev = &ps_bridge->page[PAGE2_TOP_CNTL]->dev;
>   	int status;
> -	int ret;
>   
>   	/*
>   	 * Apparently something about the firmware in the chip signals that
>   	 * HPD goes high by reporting GPIO9 as high (even though HPD isn't
>   	 * actually connected to GPIO9).
>   	 */
> -	ret = regmap_read_poll_timeout(map, PAGE2_GPIO_H, status,
> -				       status & PS_GPIO9, 20 * 1000, 200 * 1000);
> +	return regmap_read_poll_timeout(map, PAGE2_GPIO_H, status,
> +					status & PS_GPIO9, wait_us / 10, wait_us);
> +}
>   
> -	if (ret < 0)
> -		dev_warn(dev, "HPD didn't go high: %d\n", ret);
> +static int ps8640_wait_hpd_asserted(struct drm_dp_aux *aux, unsigned long wait_us)
> +{
> +	struct ps8640 *ps_bridge = aux_to_ps8640(aux);
> +	struct device *dev = &ps_bridge->page[PAGE0_DP_CNTL]->dev;
> +	int ret;
> +
> +	pm_runtime_get_sync(dev);
> +	ret = _ps8640_wait_hpd_asserted(ps_bridge, wait_us);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);

I'd add a note here, that the called should have already woken up the 
device.

>   
>   	return ret;
>   }
> @@ -323,9 +330,7 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
>   	int ret;
>   
>   	pm_runtime_get_sync(dev);
> -	ret = ps8640_ensure_hpd(ps_bridge);
> -	if (!ret)
> -		ret = ps8640_aux_transfer_msg(aux, msg);
> +	ret = ps8640_aux_transfer_msg(aux, msg);
>   	pm_runtime_mark_last_busy(dev);
>   	pm_runtime_put_autosuspend(dev);
>   
> @@ -369,8 +374,8 @@ static int __maybe_unused ps8640_resume(struct device *dev)
>   	 * Mystery 200 ms delay for the "MCU to be ready". It's unclear if
>   	 * this is truly necessary since the MCU will already signal that
>   	 * things are "good to go" by signaling HPD on "gpio 9". See
> -	 * ps8640_ensure_hpd(). For now we'll keep this mystery delay just in
> -	 * case.
> +	 * _ps8640_wait_hpd_asserted(). For now we'll keep this mystery delay
> +	 * just in case.
>   	 */
>   	msleep(200);
>   
> @@ -406,7 +411,9 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
>   	int ret;
>   
>   	pm_runtime_get_sync(dev);
> -	ps8640_ensure_hpd(ps_bridge);
> +	ret = _ps8640_wait_hpd_asserted(ps_bridge, 200 * 1000);
> +	if (ret < 0)
> +		dev_warn(dev, "HPD didn't go high: %d\n", ret);
>   
>   	/*
>   	 * The Manufacturer Command Set (MCS) is a device dependent interface
> @@ -652,6 +659,7 @@ static int ps8640_probe(struct i2c_client *client)
>   	ps_bridge->aux.name = "parade-ps8640-aux";
>   	ps_bridge->aux.dev = dev;
>   	ps_bridge->aux.transfer = ps8640_aux_transfer;
> +	ps_bridge->aux.wait_hpd_asserted = ps8640_wait_hpd_asserted;
>   	drm_dp_aux_init(&ps_bridge->aux);
>   
>   	pm_runtime_enable(dev);


-- 
With best wishes
Dmitry
