Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AE4715790
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 09:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7AB710E36C;
	Tue, 30 May 2023 07:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764BD10E36C
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 07:49:18 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f6dfc4dffaso27872545e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 00:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685432956; x=1688024956;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=3yzDJiO92tk0bxoG2nEqpyCLLDHUupgzwTW49Ku5GEo=;
 b=AWXODoAuHoLWQJkyUfkIlriTJYyc7oFKMQbHDVpaH016DnDI3eXFICHNWPpXOVemD4
 o7JsxtjOrEJbixQc8OMRSAJ/E++HoRbbnuYA7d7O74SVyqQ37fK4Sv2O4L4J/wjvEX0s
 wkUt1WoMsR432PwirW683j+mRruqVccxxxokic8Sqbpw9JupD805MZApvax5Jou3OOYR
 cpqlaYu+8mPkuLUCy7eLvi3QsJLrUopSvTeYPlglVw9WQIcLkqhPe011ZmYuHpOiFNAa
 3T5kLdDW2OQVI4kLOEmkAIjJCUStD/STk6jiJJLFH7Oi7woFgtdzmOqtAUgg9Tj2uaMc
 JANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685432956; x=1688024956;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3yzDJiO92tk0bxoG2nEqpyCLLDHUupgzwTW49Ku5GEo=;
 b=gULofVmEKidFfeq5XawZ5Qu7N55rTOkM8gZ4IzrBXjtt+yYq/KkXJHt3K4I18c+35C
 KlR3Eb6xmXAonV1JCkWhTctIXDLcRfLq6kUYxQKVhWRq+WCXQo7B5AMa9nOvyI5YEKsw
 9AZ5lW/FWh5qAv8fF0NnjoQjZFbX49AoJ+xqqfHjTJib7Apbx2idJCOcsSxGyxZScc3m
 uMI29a3jAjpskVpw/+tfKfOgp+kf1A6wPWOzxoyd9ixmJ7GExL/pb15PclDrROqUI0sI
 DhLSg6mMGf+IH9XmcmeC2iRvbTdSsahPgsrs3HPB/SrfJDvV398vS1IVp7Ru1gYld5MY
 YqoQ==
X-Gm-Message-State: AC+VfDylDFnc+uyYYz7rKXQtnrVz+F20j9glif3HqnhCX8DXmBjBKWFv
 97dxF5HT/cW+EXjr4us8n6cWQg==
X-Google-Smtp-Source: ACHHUZ4gLjpSdu/61modjFAKen/mfbt/HGkIZBNy6fQEvijiipYvM5rMo3kOeQ0U9/OW6n4cC6NT2Q==
X-Received: by 2002:a05:600c:2214:b0:3f6:2d8:4823 with SMTP id
 z20-20020a05600c221400b003f602d84823mr948485wml.3.1685432956587; 
 Tue, 30 May 2023 00:49:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4294:2221:d2df:9e87?
 ([2a01:e0a:982:cbb0:4294:2221:d2df:9e87])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c00c500b003f0ad8d1c69sm20042544wmm.25.2023.05.30.00.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 00:49:16 -0700 (PDT)
Message-ID: <3b48e709-5bc5-74ed-05a4-2e9909e2f0ed@linaro.org>
Date: Tue, 30 May 2023 09:49:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/3] dw-hdmi: remove dead code and fix indentation
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 rfoss@kernel.org, andrzej.hajda@intel.com
References: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
 <20230528140001.1057084-4-adrian.larumbe@collabora.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230528140001.1057084-4-adrian.larumbe@collabora.com>
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

On 28/05/2023 16:00, Adrián Larumbe wrote:
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 22 ++++------------------
>   1 file changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 1afb8f2603a0..0accfb51509c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -49,20 +49,6 @@
>   
>   #define HDMI14_MAX_TMDSCLK	340000000
>   
> -enum hdmi_datamap {
> -	RGB444_8B = 0x01,
> -	RGB444_10B = 0x03,
> -	RGB444_12B = 0x05,
> -	RGB444_16B = 0x07,
> -	YCbCr444_8B = 0x09,
> -	YCbCr444_10B = 0x0B,
> -	YCbCr444_12B = 0x0D,
> -	YCbCr444_16B = 0x0F,
> -	YCbCr422_8B = 0x16,
> -	YCbCr422_10B = 0x14,
> -	YCbCr422_12B = 0x12,
> -};
> -
>   static const u16 csc_coeff_default[3][4] = {
>   	{ 0x2000, 0x0000, 0x0000, 0x0000 },
>   	{ 0x0000, 0x2000, 0x0000, 0x0000 },
> @@ -856,10 +842,10 @@ static void dw_hdmi_gp_audio_enable(struct dw_hdmi *hdmi)
>   
>   	if (pdata->enable_audio)
>   		pdata->enable_audio(hdmi,
> -					    hdmi->channels,
> -					    hdmi->sample_width,
> -					    hdmi->sample_rate,
> -					    hdmi->sample_non_pcm);
> +				    hdmi->channels,
> +				    hdmi->sample_width,
> +				    hdmi->sample_rate,
> +				    hdmi->sample_non_pcm);
>   }
>   
>   static void dw_hdmi_gp_audio_disable(struct dw_hdmi *hdmi)

With proper commit description:

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
