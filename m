Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A8D7368E1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 12:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D52610E2A3;
	Tue, 20 Jun 2023 10:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FE4D10E2A3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 10:10:33 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3112f2b9625so2865446f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 03:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687255830; x=1689847830;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=adiq72BfbU5iOJAlJfaYlhdmdEeQYj2m6Qpk4ygAtPc=;
 b=RlWCYYag28UjTbIn90+u2TDtqtN77r01hMMCqJgcm5hFM3uIOCQGdPDnKTEsVFzoub
 UMZXNuQBbxv6rDMGVamWqwdVICdamX/qzJehOIpfj1LeiVAg62DRyvJbIvLQZ1El/wfw
 ZY8sR6HzH+7+TfRxRQk8teKenKkQESQ1jpqwDdhtF18FpKYIBfgImm/vSw9V1NV/wBWM
 G3j9gpe5/dNQqKd6q0ZSoYNgguWbubcbhIVZGxhqoJKCbgmx6MP7WiEBVyy5HSXAWGAX
 nvM3DU6ds4Dl2Gj2/52q83m1ed8lPHgFlhbJqIZ1umlknRspdlr3H39VJqGlWnYIKhLQ
 vU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687255830; x=1689847830;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=adiq72BfbU5iOJAlJfaYlhdmdEeQYj2m6Qpk4ygAtPc=;
 b=Lzj9S5/lKoAvZUamBOE7ts9m8rmNeB0lB2KKI/AsNvTmAJwRAvgcuWtZ5vsYsjSs21
 2NYFPAZV1JRC9Up1OPK4ankFIOoeDI9391X9ycxxNQfqoMO3OA/qlNuJFZHpJz9RyHor
 Y1ISGe1Wvp8AqrjSD9it6f5uQUxCIin+1fiZghPawcCclwrxxR/yBGud07kTplwaNwym
 Au1n3MPU5NJQJJDRaiFpRuFvBuuiejC3Bd1VQrq1CcQFakev5nxOg4/Q95SgBuC+usKg
 Tv0Nk6HEGytvUCsXyr39uJ6RqCeoFdvgtyxXPDtDmoaQ3o080GWUhWHGCkUNOt9HZNe1
 oSZw==
X-Gm-Message-State: AC+VfDzXqFyIDMGazLkHyC8g/VynKAXWvLL324wx6Uzcd3IbzefyeKsQ
 VkZBR8tWHe5MDHw/YMBYgCZmtg==
X-Google-Smtp-Source: ACHHUZ6Fb0rqPVFNO1Jcrref9z2nk0deR4lMqEHUGSVdFk/IPhFryMgFZRKfaL8vc9JepytOcS1nQA==
X-Received: by 2002:a5d:414f:0:b0:311:178b:bb74 with SMTP id
 c15-20020a5d414f000000b00311178bbb74mr8022899wrq.4.1687255829885; 
 Tue, 20 Jun 2023 03:10:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:496f:4432:b5b2:1b3b?
 ([2a01:e0a:982:cbb0:496f:4432:b5b2:1b3b])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a5d4dcf000000b0030ae53550f5sm1643160wru.51.2023.06.20.03.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:10:29 -0700 (PDT)
Message-ID: <9e9cd11e-5eee-71d7-8084-597e2c5a608a@linaro.org>
Date: Tue, 20 Jun 2023 12:10:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/panel: simple: Add connector_type for
 innolux_at043tn24
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>
References: <20230619202632.604748-1-festevam@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230619202632.604748-1-festevam@gmail.com>
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
Cc: Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 19/06/2023 22:26, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The innolux at043tn24 display is a parallel LCD. Pass the 'connector_type'
> information to avoid the following warning:
> 
> panel-simple panel: Specify missing connector_type
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Maybe a fixes tag ?

Neil

> ---
>   drivers/gpu/drm/panel/panel-simple.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index a247a0e7c799..7c80528d571e 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2178,6 +2178,7 @@ static const struct panel_desc innolux_at043tn24 = {
>   		.height = 54,
>   	},
>   	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
>   	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
>   };
>   

