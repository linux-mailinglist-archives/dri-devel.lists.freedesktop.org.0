Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696A26732DD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 08:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15A310E8C6;
	Thu, 19 Jan 2023 07:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0619110E8C6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 07:46:41 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso587921wmq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 23:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=IKjU9sspsf28Hk2aKvoFXfSKYmIhjsIllQAH1SIEjsw=;
 b=qCbSaKk7rAY0sKG9D/SOamGLKKWKMPakUwco4tWRa62tDjZGLza4tMWGFMQ8lSVXnf
 bzcsYT7ZglZMCW9FfUUGW5WHo8yGMEINMIGgEzVZmSsrB1dm89We8DlHoATCfE+3dFAL
 5/rDHkto2NaE1Ib/EM20EaKbtO8kcaPkIOZStKI/V3dMb6uPaIEVH4iCDvaXdRrH9pPi
 ynPnap1wqWgzG9hEGWLNE+/hz0uLcwY5xQsA+W05Z3lXY4Qy44zHolsHXAXfXqxtbPZb
 pHvA2JQ5NYWGewMHyx9vKWZkcarVa2e8tbfr91l9ro9a7IJaXpOb/jzLDm3jSarOIe2m
 mQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IKjU9sspsf28Hk2aKvoFXfSKYmIhjsIllQAH1SIEjsw=;
 b=HBsRYTQLoQyNPa5X7KgoMx2TcfHlGispb+fttx1/WCHHcItbYB/0xDBnoxPzMV12s3
 aPJIdqZJ44+2H9T/nRqHNhFiPqov21V+mVaAyDekyHE66LVugZM7RvU+xbzSERcniary
 mhNXwW2N+i2S2ab1ikv6J15unDFeBYkcqcSm0Cbg9BZ6ELpnY/Qly4mZVaeGpnkvZtBa
 cuasgdTcqKkHa28mzkviKYKuftdhn8GBTTgvHVQoHn51zw3r2Bj1PBDrZzvsVQlO/9cF
 6wbWp2WdeNwq4+AQ4QCuJwpaNOKF6yaAIp457BdiBkFkM1jUtV2vmwJVc1YWiuSTzvq5
 Ff4Q==
X-Gm-Message-State: AFqh2kpfPJvD3WeVRntS+IXryPEQ8roWMxL0FSHQzVg8iCPDUNPuPHqI
 91vQ322Vc+DGi9dxi47merITJS6DzhTt7PQltyQ=
X-Google-Smtp-Source: AMrXdXvc3NeEoiLd8D8KqsJcg9fSMBEl08AQvfegFco5mi9BdmEa1jbGUetwNcqdQ+fORVzz1unj4w==
X-Received: by 2002:a05:600c:1c83:b0:3da:fbd8:59a0 with SMTP id
 k3-20020a05600c1c8300b003dafbd859a0mr9312653wms.11.1674114399474; 
 Wed, 18 Jan 2023 23:46:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3936:d49c:4a01:ee1e?
 ([2a01:e0a:982:cbb0:3936:d49c:4a01:ee1e])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a1c5410000000b003db01178b62sm3926002wmb.40.2023.01.18.23.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 23:46:39 -0800 (PST)
Message-ID: <d259a28d-ba7e-9725-c0dd-86239fd2ed53@linaro.org>
Date: Thu, 19 Jan 2023 08:46:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/bridge: tc358767: Use devm_clk_get_enabled() helper
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <208546ce4e01973da1eb9ad7bc0f9241f650b3af.1672415956.git.christophe.jaillet@wanadoo.fr>
Organization: Linaro Developer Services
In-Reply-To: <208546ce4e01973da1eb9ad7bc0f9241f650b3af.1672415956.git.christophe.jaillet@wanadoo.fr>
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
Reply-To: neil.armstrong@linaro.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe,

On 30/12/2022 17:00, Christophe JAILLET wrote:
> The devm_clk_get_enabled() helper:
>     - calls devm_clk_get()
>     - calls clk_prepare_enable() and registers what is needed in order to
>       call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code and avoids the need of a dedicated function used
> with devm_add_action_or_reset().
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
> Change in v2:
>    - Convert to dev_err_probe()    [Andrzej Hajda]
>    - Update the error message    [Andrzej Hajda]
>    - Add R-b tag    [Andrzej Hajda]

This doesn't apply on drm-misc-next, please re-spin.

Thanks.
Neil

> 
> v1:
> https://lore.kernel.org/all/4f855984ea895e1488169e77935fa6e044912ac2.1672414073.git.christophe.jaillet@wanadoo.fr/
> ---
>   drivers/gpu/drm/bridge/tc358767.c | 25 ++++---------------------
>   1 file changed, 4 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 2a58eb271f70..99f3d5ca7257 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -2022,13 +2022,6 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
>   	return -EINVAL;
>   }
>   
> -static void tc_clk_disable(void *data)
> -{
> -	struct clk *refclk = data;
> -
> -	clk_disable_unprepare(refclk);
> -}
> -
>   static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>   {
>   	struct device *dev = &client->dev;
> @@ -2045,20 +2038,10 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>   	if (ret)
>   		return ret;
>   
> -	tc->refclk = devm_clk_get(dev, "ref");
> -	if (IS_ERR(tc->refclk)) {
> -		ret = PTR_ERR(tc->refclk);
> -		dev_err(dev, "Failed to get refclk: %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = clk_prepare_enable(tc->refclk);
> -	if (ret)
> -		return ret;
> -
> -	ret = devm_add_action_or_reset(dev, tc_clk_disable, tc->refclk);
> -	if (ret)
> -		return ret;
> +	tc->refclk = devm_clk_get_enabled(dev, "ref");
> +	if (IS_ERR(tc->refclk))
> +		return dev_err_probe(dev, PTR_ERR(tc->refclk),
> +				     "Failed to get and enable the ref clk\n");
>   
>   	/* tRSTW = 100 cycles , at 13 MHz that is ~7.69 us */
>   	usleep_range(10, 15);

