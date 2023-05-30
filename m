Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D7C71578D
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 09:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3226310E36A;
	Tue, 30 May 2023 07:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6320610E36A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 07:48:49 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30aef0499b6so971580f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 00:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685432928; x=1688024928;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=1BKRl0rG6ZKz6K12wAN8zcM1jC2/NzJydK0LKcMFsXg=;
 b=ErL5SY4PpgXcTaAtTXQYwFzQpjnkQ8YOj++Y09s4FWKdnGJauP41PqYhA5ok5ep490
 0NfLswvVeBA6dVwSQdIohA2a72WltxpYoN190+7uTMXKvn9wcg25KJVXNP89/dtPa2zJ
 +VewsJVJsjzcKsjUy/308gki/aVOjhV6YdTcsdI81vAWe5nCrgQhKBtREXE/aquOX0gZ
 mXqpJz2PuNwdy5r36Y9IFrmQSTbRgfc49IxTtogNXh3GRxQ6gWuYhFnonXfgQSUXJGwC
 TDIzoaEWp6XpgPXB3ejMnx3sk3oEW2ZvX4ECPevPHlYVPI5ONqT5qdKq7ve3z8jTPwaL
 UNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685432928; x=1688024928;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1BKRl0rG6ZKz6K12wAN8zcM1jC2/NzJydK0LKcMFsXg=;
 b=evvXEHTQtnput+TLD02m8M4IM5VOXSvxwUB7tVtnpTp8RVDcdgUd03y4gg1vrn23Hk
 mYG3+Qn8OZ3qyp8KMSTXlJbR/XDL6tOOp3j0KvX9BIteIoQSH0M+98j4HBln6e8GDRyX
 oiUtHqaKLJnvDLjPp4HHgPErYAoRE7LbvaOgXHApbcS9EI1c8QrGiVl4LuMfBLFsMpEh
 sRUwQ2ylLFCBVIOyKdp30IYU021sIW23M3BXV5WhikBwJsQejGyP42fd3dUo39tdM0Dv
 60LZORa2C8+FY21VEKgG8gzG90x/Ed5ipcECNn0xU1Gyb8T4hW0TEqMJGUGpSEuBDvH7
 mTlQ==
X-Gm-Message-State: AC+VfDxzN/HAHdwmw7CGNaAaq/PuKhZ1m2rDRrTJkIsxb0Bpg3ovo1JH
 tmEp1DA9cRimiknCJiS3LSWL3AKCaOANvi9UOFlLCA==
X-Google-Smtp-Source: ACHHUZ5xuANmN4u9XoKI/GIYFwuX2Epf77N8uGbHdxQPS4+AmfAXqxxohIGalR0xb5sLOXfKgyUVGg==
X-Received: by 2002:adf:f351:0:b0:309:4ee8:35ce with SMTP id
 e17-20020adff351000000b003094ee835cemr918764wrp.21.1685432927727; 
 Tue, 30 May 2023 00:48:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4294:2221:d2df:9e87?
 ([2a01:e0a:982:cbb0:4294:2221:d2df:9e87])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d6910000000b00307a86a4bcesm2320607wru.35.2023.05.30.00.48.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 00:48:47 -0700 (PDT)
Message-ID: <b632ba5b-bbd6-aead-058f-f7466499239a@linaro.org>
Date: Tue, 30 May 2023 09:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/3] drm/meson: dw-hdmi: change YUV420 selection logic at
 clock setup
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 rfoss@kernel.org, andrzej.hajda@intel.com
References: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
 <20230528140001.1057084-2-adrian.larumbe@collabora.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230528140001.1057084-2-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/05/2023 15:59, Adrián Larumbe wrote:
> Right now clocking value selection code is prioritising RGB, YUV444 modes
> over YUV420 for HDMI2 sinks. However, because of the bus format selection
> procedure in dw-hdmi, for HDMI2 sinks YUV420 is the format that will always
> be picked during the drm bridge chain check stage.
> 
> Later on dw_hdmi_setup will configure a colour space based on the bus
> format that doesn't match the pixel value we had calculated as described
> above.
> 
> Fix it by bringing back dw-hdmi bus format check when picking the right
> pixel clock.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 ++++++
>   drivers/gpu/drm/meson/meson_dw_hdmi.c     | 4 ++--
>   include/drm/bridge/dw_hdmi.h              | 2 ++
>   3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 603bb3c51027..d59a547f9cb2 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3346,6 +3346,12 @@ static int dw_hdmi_parse_dt(struct dw_hdmi *hdmi)
>   	return 0;
>   }
>   
> +bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi)
> +{
> +	return hdmi_bus_fmt_is_yuv420(hdmi->hdmi_data.enc_out_bus_format);
> +}
> +EXPORT_SYMBOL_GPL(dw_hdmi_bus_fmt_is_420);
> +
>   struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>   			      const struct dw_hdmi_plat_data *plat_data)
>   {
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 3d046878ce6c..b49bb0d86efe 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -379,8 +379,8 @@ static int dw_hdmi_phy_init(struct dw_hdmi *hdmi, void *data,
>   			 mode->clock > 340000 ? 40 : 10);
>   
>   	if (drm_mode_is_420_only(display, mode) ||
> -	    (!is_hdmi2_sink &&
> -	     drm_mode_is_420_also(display, mode)))
> +	    (!is_hdmi2_sink && drm_mode_is_420_also(display, mode)) ||
> +	    dw_hdmi_bus_fmt_is_420(hdmi))
>   		mode_is_420 = true;
>   
>   	/* Enable clocks */
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index f668e75fbabe..6a46baa0737c 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -206,4 +206,6 @@ void dw_hdmi_phy_update_hpd(struct dw_hdmi *hdmi, void *data,
>   			    bool force, bool disabled, bool rxsense);
>   void dw_hdmi_phy_setup_hpd(struct dw_hdmi *hdmi, void *data);
>   
> +bool dw_hdmi_bus_fmt_is_420(struct dw_hdmi *hdmi);
> +
>   #endif /* __IMX_HDMI_H__ */

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
