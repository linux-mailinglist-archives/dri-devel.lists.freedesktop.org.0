Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 416D263EB43
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0825910E56F;
	Thu,  1 Dec 2022 08:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1F310E55E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 08:38:29 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so908763wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 00:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=KiIz3+tb5zv7p7JFple9ARBjQPwBUaGHUgkQfj8cO3Y=;
 b=G0uvG+UozMloOv4hJ2f4eRDg2VXq9xUMtPyoelMSC/3wCA1HAoHAMYHzLZZUfOYI0z
 7ms6BGLp5zKK7TW7Aklt14VVxMcsAWJvoS8UEZpfqX9TVNcQExVmUlqyFGQXoVP4b7cO
 ILsYLXREzwL3vYwHCNVjMOtsxMaAKXk4kMR23EJ8eYLzxxd75lrwmIyz9BSu4ETNvZTu
 NTEjl+hreNOUAu7aMvc1etdC6jmMKcUEezYelGnpD5dPE+AxwtVf5cEkHmHKd4XBHtzf
 qgJpHNSxrUsVwBOiWs2v5bUB8UPcFoKBKKEwSSgUC9hmWRVZj5PIriG2HHfFINs1zEp0
 /2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KiIz3+tb5zv7p7JFple9ARBjQPwBUaGHUgkQfj8cO3Y=;
 b=iS+wCQDCxi9HWb39LiVBuY/goazqNR6wzODmHDrW4E3NX7O7IidsYpb5/210IeYyid
 VpGUKfU+lDR4GgCYItiey2Xv/XbGp+U32uXiAg4tftDoAQadc5jNSJH5EzwGgwamixit
 B2P/hjfuSUWc/nrUfCbqa/pxmcmC1tSVvTO7HXBKDbkYUhppa3rQTCCgTqCKghlWtrhE
 ceQAX2dUsmRKrovMOWfFFUpAxbwYftbeC9zLvmXqHHwfhbRq60QT/vt7bdPBkCq5VTcn
 yWBiyNIHZrSsr9aFRYhmwqNslZ0E8W8VwI7mk+UvzpCz03WifTW0XE/8UNSAlVh5fdMh
 lSow==
X-Gm-Message-State: ANoB5pkKbt6CbkGrhWTmKnbwgGspn5byOeu/Cefb+KFEwgaF6ALY1W/F
 4cYsSDs61Y4W7epKJcOsdSiJpw==
X-Google-Smtp-Source: AA0mqf6vKwxrLoekKlS7jsHZjr1A/9hOVYcrZDL6KM2Yio2b2pW7B7Keg7XYP+2wYu9j+JJollwTBA==
X-Received: by 2002:a05:600c:548b:b0:3cf:b0e4:30d9 with SMTP id
 iv11-20020a05600c548b00b003cfb0e430d9mr40406640wmb.66.1669883907845; 
 Thu, 01 Dec 2022 00:38:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bec0:73a:70e1:228f?
 ([2a01:e0a:982:cbb0:bec0:73a:70e1:228f])
 by smtp.gmail.com with ESMTPSA id
 m188-20020a1c26c5000000b003c83465ccbfsm7551042wmm.35.2022.12.01.00.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 00:38:27 -0800 (PST)
Message-ID: <7b7a7e34-af6a-cb09-e094-e42e45f45b8b@linaro.org>
Date: Thu, 1 Dec 2022 09:38:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND2 v4 2/2] drm/meson: dw-hdmi: Use
 devm_regulator_*get_enable*()
Content-Language: en-US
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
References: <cover.1669799805.git.mazziesaccount@gmail.com>
 <df0096b5aea2a18d1540cde379c5abf589ccd7c4.1669799805.git.mazziesaccount@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <df0096b5aea2a18d1540cde379c5abf589ccd7c4.1669799805.git.mazziesaccount@gmail.com>
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/11/2022 10:23, Matti Vaittinen wrote:
> Simplify using the devm_regulator_get_enable_optional(). Also drop the
> now unused struct member 'hdmi_supply'.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Missing Acked-by, I'll add it while applying.

Neil

> 
> ---
> v4 resend 2:
> Respinning unchanged code with the commit title changed as wa suggested
> by Robert Foss and commit message changed as was suggested by Martin.
> 
> I am doing a clean-up for my local git and encountered this one.
> Respinning as it seems this one fell through the cracks.
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
>   1 file changed, 3 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5cd2b2ebbbd3..7642f740272b 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -140,7 +140,6 @@ struct meson_dw_hdmi {
>   	struct reset_control *hdmitx_apb;
>   	struct reset_control *hdmitx_ctrl;
>   	struct reset_control *hdmitx_phy;
> -	struct regulator *hdmi_supply;
>   	u32 irq_stat;
>   	struct dw_hdmi *hdmi;
>   	struct drm_bridge *bridge;
> @@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>   
>   }
>   
> -static void meson_disable_regulator(void *data)
> -{
> -	regulator_disable(data);
> -}
> -
>   static void meson_disable_clk(void *data)
>   {
>   	clk_disable_unprepare(data);
> @@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	meson_dw_hdmi->data = match;
>   	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>   
> -	meson_dw_hdmi->hdmi_supply = devm_regulator_get_optional(dev, "hdmi");
> -	if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
> -		if (PTR_ERR(meson_dw_hdmi->hdmi_supply) == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> -		meson_dw_hdmi->hdmi_supply = NULL;
> -	} else {
> -		ret = regulator_enable(meson_dw_hdmi->hdmi_supply);
> -		if (ret)
> -			return ret;
> -		ret = devm_add_action_or_reset(dev, meson_disable_regulator,
> -					       meson_dw_hdmi->hdmi_supply);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = devm_regulator_get_enable_optional(dev, "hdmi");
> +	if (ret != -ENODEV)
> +		return ret;
>   
>   	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
>   						"hdmitx_apb");

