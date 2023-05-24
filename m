Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EC170F338
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 11:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2B110E5EB;
	Wed, 24 May 2023 09:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A77810E5EB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 09:41:11 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f60804faf4so5902195e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 02:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684921270; x=1687513270;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ErW9NMbDGzoThqImOmG7s5Odyeq8qYdmpGC8NT19/Nc=;
 b=BvSdEkZbEnXTT5vZ0s6A1P1tS7/qH7oyJMcXvPqKZ9irOLjxlmYfDhQRy1eoJkGARz
 UQnQ4BguPBoZq1Sncy4iYpvkFgBbj6I1ua7nZtx7vy2z0wgw0BqoX3vl7TLA5OO2mrww
 8SqKzm1X9WwkUMBsrSBYibY40EosHmeMPvpt/U9+icQJ35fEzLd2quZXCIlhIAO9wE80
 DIaoVZbdEZ7iygxj9cP64jIqsB9++EUsmrHmKNYrdvryFNqWV5afDxfQD1TaqrAprD4H
 4F+QSs26rX/NCiJMPsAWXHQnmROCHlfyoz5/bfMrrPJZPRqyFoWpynVrXS7hwg0baIHk
 YUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684921270; x=1687513270;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ErW9NMbDGzoThqImOmG7s5Odyeq8qYdmpGC8NT19/Nc=;
 b=DOzQpXcagYaizqHpyGoIv5EYQFnfwqFn2XI37ty4lwOsmx5tXdOi9LyUJRf92NTTFW
 uXflo2p+KL3/DJIfv/Hw0SLUCkds6Fly0t3jqI3JhuYkGBv7EhO0DszEiTW+u+8EX6ep
 vtmp6ya4z0jd0m85Nd7k/7Q5ctePrKeku0rVxvjTM6xmU0ta/2TPDdfenUlxdY9j7gTR
 3fXEOZoBGZC3xoYV0ccPs2aNdvINlAs7fWwL9Env6b8gLJPQJYho+GOrKztzU/ARyf1i
 sfzab8U5sfzXyfGO715c2rjhc98ijP0WKH4pc3PAHWJeRzx+PWzcUnqqMvu5gLiikV2D
 aOsg==
X-Gm-Message-State: AC+VfDzJYp9kd7gKSyoi7dcOrd6kqgCRN9pWL5cdWO3DkePEJz14rKcc
 ZVK19yd8Sz/3ZL12Nezfe7khBA==
X-Google-Smtp-Source: ACHHUZ4zPGK/aZ1Oc+Mc3MMO4uiV5TDtl3sq+rjmAn1IepzoMa90hFCmvMsOlVzVuHZcZOzpqjUFZg==
X-Received: by 2002:a05:600c:28b:b0:3f6:69f:75cd with SMTP id
 11-20020a05600c028b00b003f6069f75cdmr6081323wmk.0.1684921269955; 
 Wed, 24 May 2023 02:41:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:39c7:394c:5a3:4047?
 ([2a01:e0a:982:cbb0:39c7:394c:5a3:4047])
 by smtp.gmail.com with ESMTPSA id
 p26-20020a05600c205a00b003f4f1b884cdsm1654296wmg.36.2023.05.24.02.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 02:41:09 -0700 (PDT)
Message-ID: <d618bf50-816a-336d-6617-a0299cb59d61@linaro.org>
Date: Wed, 24 May 2023 11:41:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/panel: samsung-s6d7aa0: use pointer for drm_mode
 in panel desc struct
To: Artur Weber <aweber.kernel@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>
References: <20230524084324.11840-1-aweber.kernel@gmail.com>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <20230524084324.11840-1-aweber.kernel@gmail.com>
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
Cc: "kernelci . org bot" <bot@kernelci.org>, Sam Ravnborg <sam@ravnborg.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tom Rix <trix@redhat.com>, thierry.reding@gmail.com,
 Nikita Travkin <nikita@trvn.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/05/2023 10:43, Artur Weber wrote:
> Fixes compilation issues with older GCC versions and Clang after
> changes introduced in commit 6810bb390282 ("drm/panel: Add Samsung
> S6D7AA0 panel controller driver"). Tested with GCC 13.1.1, GCC 6.4.0
> and Clang 16.0.3.
> 
> Fixes the following errors with Clang:
> 
>    drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:312:14: error: initializer element is not a compile-time constant
>            .drm_mode = s6d7aa0_lsl080al02_mode,
>                        ^~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:415:14: error: initializer element is not a compile-time constant
>            .drm_mode = s6d7aa0_lsl080al03_mode,
>                        ^~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:443:14: error: initializer element is not a compile-time constant
>            .drm_mode = s6d7aa0_ltl101at01_mode,
>                        ^~~~~~~~~~~~~~~~~~~~~~~
>    3 errors generated.
> 
> Fixes the following errors with GCC:
> 
>    drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:312:14: error: initializer element is not constant
>      .drm_mode = s6d7aa0_lsl080al02_mode,
>                  ^~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:312:14: note: (near initialization for 's6d7aa0_lsl080al02_desc.drm_mode')
>    drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:415:14: error: initializer element is not constant
>      .drm_mode = s6d7aa0_lsl080al03_mode,
>                  ^~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:415:14: note: (near initialization for 's6d7aa0_lsl080al03_desc.drm_mode')
>    drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:443:14: error: initializer element is not constant
>      .drm_mode = s6d7aa0_ltl101at01_mode,
>                  ^~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:443:14: note: (near initialization for 's6d7aa0_ltl101at01_desc.drm_mode')
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Link: https://lore.kernel.org/lkml/20230523180212.GA1401867@dev-arch.thelio-3990X
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Link: https://lore.kernel.org/llvm/646c6def.a70a0220.58c1a.903d@mx.google.com
> Fixes: 6810bb390282 ("drm/panel: Add Samsung S6D7AA0 panel controller driver")
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> v2: expanded commit message
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> index f532aa018428..102e1fc7ee38 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> @@ -37,7 +37,7 @@ struct s6d7aa0_panel_desc {
>   	unsigned int panel_type;
>   	int (*init_func)(struct s6d7aa0 *ctx);
>   	int (*off_func)(struct s6d7aa0 *ctx);
> -	const struct drm_display_mode drm_mode;
> +	const struct drm_display_mode *drm_mode;
>   	unsigned long mode_flags;
>   	u32 bus_flags;
>   	bool has_backlight;
> @@ -309,7 +309,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al02_desc = {
>   	.panel_type = S6D7AA0_PANEL_LSL080AL02,
>   	.init_func = s6d7aa0_lsl080al02_init,
>   	.off_func = s6d7aa0_lsl080al02_off,
> -	.drm_mode = s6d7aa0_lsl080al02_mode,
> +	.drm_mode = &s6d7aa0_lsl080al02_mode,
>   	.mode_flags = MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_NO_HFP,
>   	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>   
> @@ -412,7 +412,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al03_desc = {
>   	.panel_type = S6D7AA0_PANEL_LSL080AL03,
>   	.init_func = s6d7aa0_lsl080al03_init,
>   	.off_func = s6d7aa0_lsl080al03_off,
> -	.drm_mode = s6d7aa0_lsl080al03_mode,
> +	.drm_mode = &s6d7aa0_lsl080al03_mode,
>   	.mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET,
>   	.bus_flags = 0,
>   
> @@ -440,7 +440,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_ltl101at01_desc = {
>   	.panel_type = S6D7AA0_PANEL_LTL101AT01,
>   	.init_func = s6d7aa0_lsl080al03_init, /* Similar init to LSL080AL03 */
>   	.off_func = s6d7aa0_lsl080al03_off,
> -	.drm_mode = s6d7aa0_ltl101at01_mode,
> +	.drm_mode = &s6d7aa0_ltl101at01_mode,
>   	.mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET,
>   	.bus_flags = 0,
>   
> @@ -458,7 +458,7 @@ static int s6d7aa0_get_modes(struct drm_panel *panel,
>   	if (!ctx)
>   		return -EINVAL;
>   
> -	mode = drm_mode_duplicate(connector->dev, &ctx->desc->drm_mode);
> +	mode = drm_mode_duplicate(connector->dev, ctx->desc->drm_mode);
>   	if (!mode)
>   		return -ENOMEM;
>   
> 
> base-commit: 37cee4876a45a5c3da79a83d34ed4f3c68548aef

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
