Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7477278D6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 09:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BDA10E593;
	Thu,  8 Jun 2023 07:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C59310E594
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 07:30:42 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso381017e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 00:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686209441; x=1688801441;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2IWfjRMKXtAYJWdbpoLM6wscEMkm49OW8tpzuar45To=;
 b=ZaCXG+AYK9XoubTQgCTKf2nRHf7lLi48I1c7N9Tl1pq0ytdsxuYmhLro9CBZxfnwXo
 zWIt+9Xzicpgj6q0FEbc6vPagmXYSqcZVMMOdbSp8/AIT7cIyhnU89DUxYB3L8ekRQ2N
 O8VavVdWcjriLKCALn6IYKn7vhXZN3AwSfb6FM4pR/ji7LcC61AQ3sQrwhVApCZ4j7ax
 jkyVf5ryAfmW22OsG2VAb8dUi1gB1pRIfzBLhuQG2HKp/Y2JfNJfIxagf+oockwW+6iw
 GOJCMWN2TVu5xaZrPHNruk/mLLlqq8Gp6WFcJwFwq1ZSasjqsg5VQD6Dqo9G/B85DPYR
 FyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686209441; x=1688801441;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2IWfjRMKXtAYJWdbpoLM6wscEMkm49OW8tpzuar45To=;
 b=kYJ+Kue4cz2dtJOjoY9TlJFuS0D13x/oVD1d44V8AXClEVbC3liCusK4WqEgPIzbyT
 Pe/UqeFRHBsNFkB4oa93lnO8GXzPlKr5121ngp+R5sexmFbWzzrooOmvAiVJV8Frw1jL
 VtX/1DNDa/BsU3lIMp7unir1pt8/1/qh81EuEJBll0BgjOj7xDnd/dJDnVZarAmLOznQ
 aBXga8lUAuSmP6Kahh3IwMSWRwTZReWSk8Q2Lm4HtAMzUTQsF/6K4ZtEIS9MrlPuJc6R
 QDC/RG3tXD9yPQXry28kNiaTEWz+UEk3kzZHMtUO2CXaD9zSDEz6+x4FD5WkYf6Nl6IW
 5PUw==
X-Gm-Message-State: AC+VfDyQQ4Q+ueN+0Mns+1Jw3kNRmcv7IkK0ljmV8SCmniHB9QMx4bva
 AHeNJdCBQ3b0mZsSnn/MBo/PPw==
X-Google-Smtp-Source: ACHHUZ6IY3k/0igRAxc43HI7Ll38QthT8Wh7k9RTxrOoNxMo98cdVo430gNHE0Pdep8oYW4Yb94CsA==
X-Received: by 2002:a19:f809:0:b0:4f6:3677:54e with SMTP id
 a9-20020a19f809000000b004f63677054emr2597570lff.36.1686209440730; 
 Thu, 08 Jun 2023 00:30:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1b90:b83e:29ce:beb6?
 ([2a01:e0a:982:cbb0:1b90:b83e:29ce:beb6])
 by smtp.gmail.com with ESMTPSA id
 q7-20020adff947000000b0030af72bca98sm660713wrr.103.2023.06.08.00.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jun 2023 00:30:40 -0700 (PDT)
Message-ID: <de71fe1b-870e-fd44-ca20-593d105fc2c1@linaro.org>
Date: Thu, 8 Jun 2023 09:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: s6d7aa0: remove the unneeded variable in
 s6d7aa0_lock
Content-Language: en-US
To: Wang Jianzheng <wangjianzheng@vivo.com>,
 Artur Weber <aweber.kernel@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20230608033446.18412-1-wangjianzheng@vivo.com>
Organization: Linaro Developer Services
In-Reply-To: <20230608033446.18412-1-wangjianzheng@vivo.com>
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
Cc: opensource.kernel@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2023 05:34, Wang Jianzheng wrote:
> Remove unneeded variable and directly return 0.
> 
> Signed-off-by: Wang Jianzheng <wangjianzheng@vivo.com>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> index 102e1fc7ee38..fec0d014fd0e 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
> @@ -66,7 +66,6 @@ static void s6d7aa0_reset(struct s6d7aa0 *ctx)
>   static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
>   {
>   	struct mipi_dsi_device *dsi = ctx->dsi;
> -	int ret = 0;
>   
>   	if (lock) {
>   		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
> @@ -80,7 +79,7 @@ static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
>   			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
>   	}
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static int s6d7aa0_on(struct s6d7aa0 *ctx)

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
