Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA16D1B34
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB00D10F15B;
	Fri, 31 Mar 2023 09:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE99710F132
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:03:19 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id p34so12457881wms.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 02:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680253398;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6NgF2y2gqeSjwWNBU3Vh//FDhE6SAE4mrieUrogeNQY=;
 b=BC68iOemDu1I3MASG2eRLx7neRQE3Uq3Gx7FJdgGqRfKjtKf0LKGtrggjLS2JKIS1d
 htzhH8QF/pvd950MshqrSNPczT82tVOVGdwhs1NKAt5CGw3S/nqHVsHml+dAGbTYVoB3
 ZjhgYPYirKxNoYtdCOpReZGTyrKPW5PE+durNsFSWOI3Y4JhR7sjz9XV7dV9CGSdI81r
 CNxEk9q+9HkPQ61fEKlm0QXEodkpIfWZTkLBiyxssH0J6pwva6dYl2NsiXYFusMd6J/3
 R5fUlesFIbx33+LyIDyLXRwawXySh/qZgLbWtEcD8dISOQ5jIiBpDIYGXO69/WWG6oOj
 5dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680253398;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6NgF2y2gqeSjwWNBU3Vh//FDhE6SAE4mrieUrogeNQY=;
 b=2HsO7yVR4pPHIMhJpNEr5thQZL1N3oFOLP3KRGdzF+UjI/l9ipl4mB0G787K5711uZ
 HYiXaVvJix9pX7AkyxE2M3n1RmUjZGYtOs43wZjVvMADDCnPtRaEBR1qfvM7xryNutJP
 DWPZ2Vp+IYeqiDMrkvZzmHsWEDFxOr8d7UVc9guGcu4mWEYQaekO9OgjxvSh+roSQUUc
 v4wi2LEpVRlAPiqvHn4lqhZfg16EcGnxwM9PVK4M+06jxOT7EDJuglY7bQJflp4xIF1i
 0wNT9QXDqyVFdCrG0f3+69tI2EQZB/c5A0wyBRMrwd/slvp6Q9c7BGTiEpIo8bcbLvN1
 w3fw==
X-Gm-Message-State: AO0yUKU0pPXZPvprqnD89GkHtmhMXDUR5vbJPjRt11JiGvnH54r1aHyy
 xQTLFZd6m7cDPc9JhIIB2yBcgA==
X-Google-Smtp-Source: AK7set8/X6Cq24SZ595QaP8eLxh41ZoTV/2LWoVwSD3DOKM/3TjaiNXH1tTwPsTR2k8TfARyyFT6qA==
X-Received: by 2002:a05:600c:c6:b0:3ef:df3:1693 with SMTP id
 u6-20020a05600c00c600b003ef0df31693mr20043731wmm.32.1680253398305; 
 Fri, 31 Mar 2023 02:03:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0?
 ([2a01:e0a:982:cbb0:74cb:1a96:c994:e7e0])
 by smtp.gmail.com with ESMTPSA id
 iz5-20020a05600c554500b003ef67ac3846sm9017600wmb.24.2023.03.31.02.03.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 02:03:17 -0700 (PDT)
Message-ID: <15047d72-1cc1-5afe-0003-c67d093dc297@linaro.org>
Date: Fri, 31 Mar 2023 11:03:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/3] drm/bridge: tfp410: If connected, use I2C for
 polled HPD status.
Content-Language: en-US
To: Jonathan Cormier <jcormier@criticallink.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230125-tfp410_i2c-v3-0-a85d5f0f50f1@criticallink.com>
 <20230125-tfp410_i2c-v3-3-a85d5f0f50f1@criticallink.com>
Organization: Linaro Developer Services
In-Reply-To: <20230125-tfp410_i2c-v3-3-a85d5f0f50f1@criticallink.com>
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
Cc: devicetree@vger.kernel.org,
 Michael Williamson <michael.williamson@criticallink.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bob Duke <bduke@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/02/2023 23:10, Jonathan Cormier wrote:
> From: Michael Williamson <michael.williamson@criticallink.com>
> 
> If the I2C bus is connected on the TFP410, then use the register
> status bit to determine connection state.  This is needed, in particular,
> for polling the state when the Hot Plug detect is not connected to
> a controlling CPU via GPIO/IRQ lane.
> 
> Signed-off-by: Michael Williamson <michael.williamson@criticallink.com>
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> ---
>   drivers/gpu/drm/bridge/ti-tfp410.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index 41007d05d584..eeb7202452aa 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -28,6 +28,9 @@
>   #define TFP410_BIT_BSEL BIT(2)
>   #define TFP410_BIT_DSEL BIT(3)
>   
> +#define TFP410_REG_CTL_2_MODE	0x09
> +#define TFP410_BIT_HTPLG BIT(1)
> +
>   static const struct regmap_config tfp410_regmap_config = {
>   	.reg_bits = 8,
>   	.val_bits = 8,
> @@ -105,6 +108,15 @@ static enum drm_connector_status
>   tfp410_connector_detect(struct drm_connector *connector, bool force)
>   {
>   	struct tfp410 *dvi = drm_connector_to_tfp410(connector);
> +	int ret;
> +
> +	if (dvi->i2c) {
> +		ret = regmap_test_bits(dvi->regmap, TFP410_REG_CTL_2_MODE, TFP410_BIT_HTPLG);
> +		if (ret < 0)
> +			dev_err(dvi->dev, "%s failed to read HTPLG bit : %d\n", __func__, ret);
> +		else
> +			return ret ? connector_status_connected : connector_status_disconnected;
> +	}
>   
>   	return drm_bridge_detect(dvi->next_bridge);
>   }
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
