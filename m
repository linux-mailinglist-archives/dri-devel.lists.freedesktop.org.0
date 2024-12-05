Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E679E5579
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 13:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A7410EE4F;
	Thu,  5 Dec 2024 12:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="apdXMD7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6DE10EE48
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 12:29:09 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53dde4f0f23so791980e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 04:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733401747; x=1734006547; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DzZzeW6LtUsNwMv+kA0kTMV9+3xVaKazBCL45YLJgXw=;
 b=apdXMD7g8InROwhN91k8b9miZjBAmGxTuHVTNFQPYYLMdft8HyD5Nnnx+9WNinF8RJ
 3RT6E0WXEEBCNBAIrIlW1YVxyrcGAt25gIUfsIOp1vY72PdRDr51rzwYwr6W4uIEiM2A
 XrhdxvMFIiNCeJ0o3pXjTbewprbl/G57asbp6zlEgjBhPGpefT+FzhdRj6SiFATVXUew
 Meuh68j7olMjdo2cf8FNbDIvYIi7B9BsJ6CCTghNXi10n1CuyI+Q8CrJYa4xJppS0j6P
 odUGZL7Fyd3m0xQ9VpbCA9baYNwdcl7jOU8W+kN2j7nk20mQZE1zYH/ggqUL3ru+EF9y
 CJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733401747; x=1734006547;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DzZzeW6LtUsNwMv+kA0kTMV9+3xVaKazBCL45YLJgXw=;
 b=MqLUUlf7UVij4TXYIi9TC6dQOoNLvorGpItniQ+U+Ndh2uueuHP2may9sswW1Nz/5y
 XBaJCotpFmGOB/HSGG8/uxDmcAPksC0RsafuXBVlUW7MtqAdUvDhOxhSmQKUwaJAUGZJ
 2XzHaXCGERCgJqIboapwebKQ81kgJV4V8kljDmG5CYJmX4P2h+eFPF6YwyJK7HMQhaGJ
 4YTU9QR9qqbXb1DWH2ik477sgwvNIgs8FvZs1dgNLPotQ0By5WvL0X0Hv/C8XovLTE+0
 O1kQ0hoK5mjwkegfRiTTVnU5jTwOua3/gwqyyFb+2xxHvBqe5WTtHR67fImPd0TYLrot
 UCeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbM41j5ebqFij1vqLLEV0QwftwFxo2jJB0qHFb2s+qBKT6YNO34bNNq+zMdTRAuSooW1sJBQnpelA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziXOsYP8etTWg9dtjv1KZq5iRYMih2eqC6fzreAZn0aQtv5rto
 c6Pwz3gJkaV3g8uLlcnB7G/hn08u4/J2f/v3QoRrBDC+uVqwvRZ1o039hUec5o4=
X-Gm-Gg: ASbGncvZdP3tRlYSvPZ8Ed6jMSBAF75GBkIW+c9lixevJ7TRVhskDwe+5C5cGgz/34+
 zZgiCUds9eRrhjsVNvoQprGwXlKYrBA9BUkLS5pCTnz4bRz/R8avT6wI830CBc4L55+JbEd+s8T
 01hiX+xn+/8SAzkKGa0q7Wpf3EKRHafzdBOccU6EEWFVeukObVtBeUxjZlMplObwg5IdIn8ha6S
 ldSqA7gdDxS3clUQQDNAkGtNfJkZmoZNbRPGOybg3ZXcomEjSbgHGL41hbs5URGVQvhkKZEnfqe
 6kuCHOOG0wtACKML92Y9LGPyN8aCmA==
X-Google-Smtp-Source: AGHT+IGWyrIJVNkXZfMk2D77Z12NxWguDqxu6KGooscExaYt6vk4bYi8IUDxyjnT5IkrNFyNFyZrTg==
X-Received: by 2002:a05:6512:3f1f:b0:53d:eefc:2b48 with SMTP id
 2adb3069b0e04-53e12a01888mr5509943e87.33.1733401747192; 
 Thu, 05 Dec 2024 04:29:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229c1d6dsm233341e87.183.2024.12.05.04.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 04:29:05 -0800 (PST)
Date: Thu, 5 Dec 2024 14:29:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jie.qiu@mediatek.com, 
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 12/15] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Message-ID: <olxtqto5mbgofxg4iqjvsmpxxzz6zoj7pbwmoeklhfjiavqfvv@dyveek7hgtki>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
 <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
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

On Thu, Dec 05, 2024 at 12:45:14PM +0100, AngeloGioacchino Del Regno wrote:
> In preparation for adding a new driver for the HDMI TX v2 IP,
> split out the functions that will be common between the already
> present mtk_hdmi (v1) driver and the new one.
> 
> Since the probe flow for both drivers is 90% similar, add a common
> probe function that will be called from each driver's .probe()
> callback, avoiding lots of code duplication.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/Kconfig           |  11 +-
>  drivers/gpu/drm/mediatek/Makefile          |   1 +
>  drivers/gpu/drm/mediatek/mtk_hdmi.c        | 724 +++------------------
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 425 ++++++++++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 203 ++++++
>  5 files changed, 729 insertions(+), 635 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> 
> @@ -1026,19 +812,12 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
>  	return 0;
>  }
>  
> -static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
> +static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi, u8 *buffer_spd, size_t bufsz_spd,
> +				    u8 *buffer_avi, size_t bufsz_avi,
> +				    struct drm_display_mode *mode)
>  {
> -	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
> -
> -	hdmi->csp = HDMI_COLORSPACE_RGB;
> -	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
> -	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
> -	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
> -	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
> -	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
> -	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
> -
> -	return 0;
> +	mtk_hdmi_setup_avi_infoframe(hdmi, buffer_avi, bufsz_avi, mode);
> +	mtk_hdmi_setup_spd_infoframe(hdmi, buffer_spd, bufsz_spd, "mediatek", "On-chip HDMI");

Please use the HDMI Connector framework instead of handling everything
on your own.

>  }
>  
>  static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)

-- 
With best wishes
Dmitry
