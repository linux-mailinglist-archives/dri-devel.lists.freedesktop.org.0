Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0FB663AF7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B250710E54C;
	Tue, 10 Jan 2023 08:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232EF10E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 08:26:35 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so11167834wms.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 00:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=xdQwcImRyUjKYYTm5SoHXvQfKv/r00nti1RsG4mwEb4=;
 b=E3UE49FdnABecUo2IS6pY76NJt4MrCIYofmLUvNQEMpZy5M8o6oe0pQvqCM4cPDzxb
 vVjzoKtXpc+gYjcQghn58n3m+ygmal1vYnsZQZEHzRjL5pf+bke3H93APU7Cs7d9B4R6
 oLW53gxQUbPKqtcvuxzyOtg2eNVrDvrkxSFfM3o4tNkop7D64oo1QxxQos5hFsVBRtRv
 JDoHDZNwlZi4aLmr2mniDq5NE4iJEoYgwKJudFBJFx4h3n/t8yvKFiyP8P6A/bdfqVZj
 r0eCmc7ZVcgz6TnSRraAEq7dTP+aJBTbtedmsBgBbDtb5B7UKvvs0M5CEGinQMUqKvVH
 1BRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xdQwcImRyUjKYYTm5SoHXvQfKv/r00nti1RsG4mwEb4=;
 b=M1S7eOtqkhRQPNQgfdLF7d4LGquRokATGsuVSdFgbIRuvghKata9ZsEotlyVFS3dp0
 T+UYowvx1kZWThBWi8/83qPnZaJ3UPxDm0OpiF08IDIvqCZtgzrlTkgTFP6//oODdAyc
 dXhzrvUbhrtkD+tXQ+tMBGZViUNvEowQvj5BKVjxROdg11Venevi+/GiQP6UOC0T0uNR
 rzctN9WjUApMwkG/w9doFpVTK9xRoCxx81fzmNLytxqO6LXLmFcOS3tCbqaPfR9LnDQG
 pEYc2+ay2IOf45OvCJ0elcy2MG4xbfCsJjnVOQR+TzJ+wEkYnNVX1FAgdkRYTqG4f21G
 C7Ig==
X-Gm-Message-State: AFqh2kq6dA1OsavRGYh7YF+XaHwFQRaCutF1kJdQEFWQyZhMkAtJElEe
 5FK8XnsWBMUofhlU4SdOX/X4Tg==
X-Google-Smtp-Source: AMrXdXvb23jIXo1TjFZZKj9eNVGzFoIe1B+xqOkr7rnwshvPbRV08OtOu0wqUFcWh/bSxiIBBN84ug==
X-Received: by 2002:a05:600c:1c20:b0:3d2:2f48:9443 with SMTP id
 j32-20020a05600c1c2000b003d22f489443mr47863084wms.15.1673339193664; 
 Tue, 10 Jan 2023 00:26:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:26cc:e5e1:3044:b226?
 ([2a01:e0a:982:cbb0:26cc:e5e1:3044:b226])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a05600c0ad200b003d9c97d82f2sm13858017wmr.8.2023.01.10.00.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 00:26:33 -0800 (PST)
Message-ID: <ffc69ded-5c42-355c-0326-3a34189b0cbe@linaro.org>
Date: Tue, 10 Jan 2023 09:26:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*()
 conversion
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
References: <CGME20230109220056eucas1p26418012878272961a3a21a365192ef60@eucas1p2.samsung.com>
 <20230109220033.31202-1-m.szyprowski@samsung.com>
Organization: Linaro Developer Services
In-Reply-To: <20230109220033.31202-1-m.szyprowski@samsung.com>
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
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/01/2023 23:00, Marek Szyprowski wrote:
> devm_regulator_get_enable_optional() function returns 0 on success, so
> use it for the check if function succeded instead of the -ENODEV value.
> 
> Fixes: 429e87063661 ("drm/meson: dw-hdmi: Use devm_regulator_*get_enable*()")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 7642f740272b..534621a13a34 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -718,7 +718,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>   
>   	ret = devm_regulator_get_enable_optional(dev, "hdmi");
> -	if (ret != -ENODEV)
> +	if (ret < 0)
>   		return ret;
>   
>   	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,


Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
