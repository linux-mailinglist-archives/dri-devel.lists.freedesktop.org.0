Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B0D70B823
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 10:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BA610E27D;
	Mon, 22 May 2023 08:56:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5881A10E27D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 08:56:01 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-309553c5417so3070581f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 01:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684745759; x=1687337759;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2g8LwJZM8KGfhtnoH1qIOIMLZ0KOrIyccEYwFZJvPJI=;
 b=u/WPWtnLe1zhYynZyJx6cLlZmD7/iJhiZZferm/FeN2pTM0Sso2KIDyHuWyhCsIhyN
 ft7HxRR5Nfk+kZZlfifi1EA7cfB8Afl/rJFmc6fzaHHStCN0HmqL4K8hazl8r2CJgARD
 HU+x2yxZ6grpKPb3ADtqJsqIqwVL5yM4Uqv2Shs4Nygn1jTP+aT96e5aOFiOo1sp05xJ
 NXONRxz1sYgETwrC8Av2gN2E4W7FO+HNjWSKn2AHvdaWckze+TETDwZf6TF0GHrnHxo9
 HD3fheBk9CVQxKEO+zxlTfinSZ0XBYoujd4qj7SuoHLaNipr1ooTqwdPQSCdDAXbuoyH
 dzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684745759; x=1687337759;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2g8LwJZM8KGfhtnoH1qIOIMLZ0KOrIyccEYwFZJvPJI=;
 b=lyQl/Oz0JQiB4rEGBqnKQUqtyMP++h4AUvIq1bcHIBX8VyF9/aEQ+wSHkNVpeqxmW7
 hrh/WHfl8v7NvgQIrAdGme8/zRW23o8TAdN+tu5dOdWZ+2hg/ljpomeX2PUxPoX1nSiD
 UGdav8O1RIOwOeoEB35qt5PjHjpFkhnrgOrRsv7ydYyn4lpsVIGx2WXQCGgTknXQbGkE
 TA2cep4dLWWWMvYnXiF7DUbiwp+BTsknyC6SSVNmFLEjU08+SsT5sVjOT8JZmw2WpEaa
 FD+gngnmGC1vK4uslxcpJFRQIBZL03HGjd+zyewSeL/f8J7HZIvJpBWuYUHbjiuLKhC9
 ABcA==
X-Gm-Message-State: AC+VfDzrqMd/AQ0jVL89p636hWhTJUIvZfvlCLQRdAQBBctHLux4Lofq
 yGCVbegH3stdzImqAE+0cl/xEw==
X-Google-Smtp-Source: ACHHUZ7gRgnuE/zET6SwgFQjgi6Lss+jLfYgRbSsHZFIEka9heDi5yUaGk0eucTuDO7GPW3aFwsktQ==
X-Received: by 2002:adf:dd89:0:b0:306:45c0:f070 with SMTP id
 x9-20020adfdd89000000b0030645c0f070mr6842962wrl.39.1684745759560; 
 Mon, 22 May 2023 01:55:59 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a5d4dc5000000b002fe13ec49fasm6938803wru.98.2023.05.22.01.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 01:55:59 -0700 (PDT)
Message-ID: <c0932a06-175c-3294-98ec-b26e961e34c1@linaro.org>
Date: Mon, 22 May 2023 10:55:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/2] drm/panel: add fannal c3004 panel
Content-Language: en-US
To: Paulo Pavacic <pavacic.p@gmail.com>, sam@ravnborg.org, airlied@gmail.com, 
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
References: <20230519142456.2588145-1-pavacic.p@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230519142456.2588145-1-pavacic.p@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2023 16:24, Paulo Pavacic wrote:
> Fannal C3004 is a 2 lane MIPI DSI 480x800 panel which requires initialization with DSI DCS commands. After some commands delay is required.

By curiosity, on which board is this panel used ?

Neil

> 
> In previous discussions for device tree [1] [2] and device driver [3] were named mipi-dsi-bringup.
> 
> [1] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/CAO9szn3t-giVipb5oH_3mzQZbnXbDqqz0WEg8uAmo-1W2uKzFg@mail.gmail.com/
> [2] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com/
> [3] https://lists.freedesktop.org/archives/dri-devel/2023-May/404775.html
> 
> Paulo Pavacic (2):
>    dt-bindings: display: panel: add fannal,c3004
>    drm/panel-fannal-c3004: Add fannal c3004 DSI panel
> 
>   .../bindings/display/panel/fannal,c3004.yaml  |  75 ++++
>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>   MAINTAINERS                                   |   7 +
>   drivers/gpu/drm/panel/Kconfig                 |  11 +
>   drivers/gpu/drm/panel/Makefile                |   1 +
>   drivers/gpu/drm/panel/panel-fannal-c3004.c    | 405 ++++++++++++++++++
>   6 files changed, 501 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
>   create mode 100644 drivers/gpu/drm/panel/panel-fannal-c3004.c
> 

