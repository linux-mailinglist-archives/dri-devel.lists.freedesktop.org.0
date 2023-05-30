Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE14715783
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 09:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4240910E369;
	Tue, 30 May 2023 07:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA98410E369
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 07:46:48 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-30abe551605so2935192f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 00:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685432807; x=1688024807;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=D3tv9LafCdtcG4LKNUeAhIv8DN2WExEc7/tKO97gh8E=;
 b=NGEDm2FkkVXGf36QtMqg5AiGLMPxoAQKsI7EHmjNDxNe92uyB26hXYuUSVOQspX67a
 xnaVOQogjhuG+TU4xBP1737ipNJtebFL2HAS6paCH4of5ZwazcqFpgTEuQlnXuFAUSd6
 CrnZ+3QWAPCc6c6msbo7d8IkEYsCzgm33eoHlGfItg9ztqiaWzxiOq+emId5Md1KsGbI
 a7rTX4ZxqyCCCt5mvB6mkFtNwahibDA0nXr28T6UrSevKiyWmpgoxLfbZHWEwKvd7z/Z
 +F0lbOvo+GILXJUyEkW8kszp0K3+di4oZ4R07VHZrdBgFAzzxbZC2o0EjMFwOgoqoyf/
 Dt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685432807; x=1688024807;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D3tv9LafCdtcG4LKNUeAhIv8DN2WExEc7/tKO97gh8E=;
 b=DWkXq5OpHDpOH7jjuqx62RfwTfKn6TvhiBOuKMD2kDC0FMoevUrRX+mO7kaUEZIT0H
 T2mbO2RpIo+Gl3Z7BYBJhpMyj0rP/QbumfwsmgKeuN08MpUpOSTAi0CHZztf2femv5Fx
 nBCWXEmzusS52/wceRcKWWMQg9pWLu5hG6XiRPWhtuWSZK8UCbiQ5cZwx1gIeFBOsin+
 HvQtRrbzz8QH9WkOmUqnv261wo8XfxRnm/ruQhHAUsQ5d45SOUAkEmeB8vl24axSAYWR
 5kAFxyGdwofI7w0rjHV28nEfMw7sCRwrYs4U0/yiBErxOAQae/s9Ukz07ntvdK8xi+CM
 8IJA==
X-Gm-Message-State: AC+VfDzncsNIFsMRks9P1Pk9WALhQLJ8a9FVQH9O4fCZDsdkmkBKNN7U
 6eApr7aJR/8bn8NRvJbn5B6NLw==
X-Google-Smtp-Source: ACHHUZ7TRqIEMVi19gXmcraFyCBW8SVvygvbDrk2U1oFebLnxtB2fJ2rx4iL8yuCfwzX2KV+ryOZbg==
X-Received: by 2002:adf:de81:0:b0:30a:d944:b765 with SMTP id
 w1-20020adfde81000000b0030ad944b765mr1261118wrl.15.1685432807252; 
 Tue, 30 May 2023 00:46:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4294:2221:d2df:9e87?
 ([2a01:e0a:982:cbb0:4294:2221:d2df:9e87])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a5d4a4c000000b003077a19cf75sm2319371wrs.60.2023.05.30.00.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 00:46:46 -0700 (PDT)
Message-ID: <e6b6ffea-8706-3305-5267-9cbf3672f65f@linaro.org>
Date: Tue, 30 May 2023 09:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/3] dw-hdmi: truly enforce 420-only formats when drm mode
 demands it
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 rfoss@kernel.org, andrzej.hajda@intel.com
References: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
 <20230528140001.1057084-3-adrian.larumbe@collabora.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230528140001.1057084-3-adrian.larumbe@collabora.com>
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
> The current output bus format selection logic is enforcing YUV420 even
> when the drm mode allows for other bus formats as well.
> Fix it by adding check for 420-only drm modes.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index d59a547f9cb2..1afb8f2603a0 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2710,9 +2710,10 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>   		/* Default 8bit fallback */
>   		output_fmts[i++] = MEDIA_BUS_FMT_UYYVYY8_0_5X24;
>   
> -		*num_output_fmts = i;
> -
> -		return output_fmts;
> +		if (drm_mode_is_420_only(info, mode)) {
> +			*num_output_fmts = i;
> +			return output_fmts;
> +		}
>   	}
>   
>   	/*

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
