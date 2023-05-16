Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4530D704B23
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 12:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1A710E342;
	Tue, 16 May 2023 10:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCDD10E344
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 10:52:57 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f4c6c4b51eso68020535e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 03:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684234376; x=1686826376;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=S8e0W9XIRRFwkTucaV524mAiYHtqA6kUJZ/8Od4Fg1I=;
 b=ox72IdHqGsLn8rjwhpNCEe+xurcOrXliCf9CMdNLrn7SBoenukNB0sd3QZSrcbzrgh
 cPPpArRj2G6AJ2t9PHQzmnSAO0WemYzbtCkMLRvqDahluj8trXc1G88EB5/IgIkWokfz
 /sKi+gG+hPSi13ifv4FHquVA3UpVuK/lAvY4iu8wFExArkRLTJ4jidkBqvR4yNwPRDaP
 XMElvl4V1Ef/AQiYpWnc/j8JZrh/26pC4diCO1+6zaMuOGdZy9HOF4HW0oIh50gBa/X3
 00Eqx3ZJdZljs06sL6jZPLcc5PPPtJt4inPu1Y6EHYISt7+Bhl7z9r+TN3LKW/wSi91M
 P9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684234376; x=1686826376;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S8e0W9XIRRFwkTucaV524mAiYHtqA6kUJZ/8Od4Fg1I=;
 b=i/NfALCyLCFbrvVxD2JeWo6TJLfOt76WSMJADV0p0Q0hMPMTicZvp3q7IYHu4hUhK1
 K0HyzBT8vqRMSo4Ni1bI0fuC3yCGhSPoZQRu5G7uo825ylnNYkqWsOdj779+zl+j35WH
 eYoqM1Q1AKa3NEsdB3kTSaCPb1cOlAfSh6taBmP+pdxJdPnf0h4pqgqqBwaxyn526g7K
 WNiHM6N/8K2qzny+K2YqqUm5l+M7hdupiVAsFkPY6uMkqzGY7hHwQaNpgNMviV8eZt+X
 piV3Vb7R+2yXEuQ2I1Ex20HoBtW8gEIoN3Qkf9H6YtPWxc+2RXJTXIUQ+NbjrRxsRnAh
 lcrw==
X-Gm-Message-State: AC+VfDyS8xkCojiuJxqvVZRKU9qIaGglIKxtWfXY+sQKECerU6aQoCjv
 /ZTHPkFg4+5hrhgxYfJ6PLjpCBYms7v7aTJmNgNvSA==
X-Google-Smtp-Source: ACHHUZ4NAGd6C/KMQbHDnesnmLick0uXIlD1Wf0A4Guj7OAALzkYL5waJbcu/xBIIOb+vJXswaJVpg==
X-Received: by 2002:a05:600c:2257:b0:3f4:2b98:428f with SMTP id
 a23-20020a05600c225700b003f42b98428fmr18097657wmm.39.1684234375886; 
 Tue, 16 May 2023 03:52:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8?
 ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a05600c21c800b003f4f8cc4285sm1910151wmj.17.2023.05.16.03.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 03:52:55 -0700 (PDT)
Message-ID: <e6ffc9e1-eead-6cd1-dd59-bc17439e6ec3@linaro.org>
Date: Tue, 16 May 2023 12:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: simple: fix active size for Ampire
 AM-480272H3TMQW-T01H
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
References: <20230516085039.3797303-1-dario.binacchi@amarulasolutions.com>
Organization: Linaro Developer Services
In-Reply-To: <20230516085039.3797303-1-dario.binacchi@amarulasolutions.com>
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
Cc: dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/05/2023 10:50, Dario Binacchi wrote:
> The previous setting was related to the overall dimension and not to the
> active display area.
> In the "PHYSICAL SPECIFICATIONS" section, the datasheet shows the
> following parameters:
> 
>   ----------------------------------------------------------
> |       Item        |         Specifications        | unit |
>   ----------------------------------------------------------
> | Display area      | 98.7 (W) x 57.5 (H)           |  mm  |
>   ----------------------------------------------------------
> | Overall dimension | 105.5(W) x 67.2(H) x 4.96(D)  |  mm  |
>   ----------------------------------------------------------
> 
> Fixes: 966fea78adf23 ("drm/panel: simple: Add support for Ampire AM-480272H3TMQW-T01H")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   drivers/gpu/drm/panel/panel-simple.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 065f378bba9d..d8efbcee9bc1 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -759,8 +759,8 @@ static const struct panel_desc ampire_am_480272h3tmqw_t01h = {
>   	.num_modes = 1,
>   	.bpc = 8,
>   	.size = {
> -		.width = 105,
> -		.height = 67,
> +		.width = 99,
> +		.height = 58,
>   	},
>   	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
