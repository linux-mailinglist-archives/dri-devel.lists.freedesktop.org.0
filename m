Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F657696B7
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 14:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3265210E28A;
	Mon, 31 Jul 2023 12:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9717110E28A
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 12:47:50 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31751d7d96eso3722036f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 05:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690807669; x=1691412469;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rPU6eBBNbIAUUcoRKzr9LvgIXHs3reta3/hSqcIIka0=;
 b=L+1xo/oFoGsKVxd88ug1QeqWyeiIDVnZy++TpYkyIg33WxifI2I247bCPLkjFeUdyk
 sdjjgp57pIedzUv2k+sgPtwDUFlWsMUEQ2khqkDCNnME+GUnEYdG0DBOZJ3wvrNFIogX
 RrZolDnx34gei2bhFRioFzTT0zsqo/t/v4MQ28to9yp3wb0WZYnoo+MTityK05SS29RJ
 gdC5GzA9Ms0PSSXc8IY5oryT81Oa1awDZZJvYwjDNJtjEFUcZSpCoIyWUA16ayIA4oYq
 7RucrTFj/LM280fg3wp1yarJpq+9QEAme1Xq/XctuuOi7QarT9KswKjhF88YvlOmbnik
 9sQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690807669; x=1691412469;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rPU6eBBNbIAUUcoRKzr9LvgIXHs3reta3/hSqcIIka0=;
 b=M3xcRFg8Wv9XVvJQK6KSnQ9cEZErgMUUwa6gBI2Y3VFuXaV7mJ8B3x+cRfyVdDPHN1
 5u20exJxLGMZtFGPCx3ZJv3BTl2h5KGmfM6a7twOBoKssyWqjwWyudgNYFPIMHOdzFQr
 6WB8XMkMQ3vrt1xLS9qT2xbfhf2V7qxI853A/Yr90NkBTWSWl17Ph5AXWwnotWSTGUzq
 Tzh4ZqOp8i8x7KARqtxDsUBpM2AiRINWtPuMTOijlBvyjnbcD7syj0uMrNs4qj+1+SNp
 56zT0oSyk5zc1/vdNVjBv0ikVmPUmbStQuGWWOFAGqWEOf6MMfQT23obXUr3bsPeSWR0
 YaRg==
X-Gm-Message-State: ABy/qLbrOCPceDoDStVLA/OyD+8qnLrol6yxb8Z6mlO3ISgHHCCQU95q
 GZ57FxlNVrHlCE90DAtbOnsgEw==
X-Google-Smtp-Source: APBJJlESrCKo/ikkURiFbnoDGFNpbTRS4wGqIfLfT9hGuTHu5LcWqjptQFBRmY5KpVWbHS1cS9wadg==
X-Received: by 2002:adf:f611:0:b0:315:9ee6:132f with SMTP id
 t17-20020adff611000000b003159ee6132fmr7942767wrp.68.1690807668858; 
 Mon, 31 Jul 2023 05:47:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f723:b60b:92cd:4df4?
 ([2a01:e0a:982:cbb0:f723:b60b:92cd:4df4])
 by smtp.gmail.com with ESMTPSA id
 i15-20020adffdcf000000b003145559a691sm12996489wrs.41.2023.07.31.05.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 05:47:48 -0700 (PDT)
Message-ID: <733a1f2e-708b-6119-6cf9-af18f185fc77@linaro.org>
Date: Mon, 31 Jul 2023 14:47:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm: panel: simple: specify bpc for
 powertip_ph800480t013_idf02
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230727172445.1548834-1-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230727172445.1548834-1-dmitry.baryshkov@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/07/2023 19:24, Dmitry Baryshkov wrote:
> Specify bpc value for the powertip_ph800480t013_idf02 panel to stop drm
> code from complaining about unexpected bpc value (0).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index a247a0e7c799..4c4c24ab4d12 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3207,6 +3207,7 @@ static const struct drm_display_mode powertip_ph800480t013_idf02_mode = {
>   static const struct panel_desc powertip_ph800480t013_idf02  = {
>   	.modes = &powertip_ph800480t013_idf02_mode,
>   	.num_modes = 1,
> +	.bpc = 8,
>   	.size = {
>   		.width = 152,
>   		.height = 91,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
