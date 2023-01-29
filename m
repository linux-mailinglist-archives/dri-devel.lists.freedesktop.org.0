Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 715EC67FFAC
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 15:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC60110E079;
	Sun, 29 Jan 2023 14:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0BB10E079
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 14:59:18 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t7so576867wrp.5
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 06:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pkYdbcUfukIthtd0r0b7QQIU7hJvHQCUD0UgIfwX48g=;
 b=Rgf5I6a5W6LV986SXUsrBWelksbM0i4FXT1HC97i/SSzvpCaZbPRbBo9DZv/bTM0eh
 dteXweklQFLuPQWCS4LQDxr0mBXcNgzQ4t8Frm3wZfaJ7qJlrlwj6U/54IY1HWdRXAoT
 938j3DbLNIq72jEZPVDOxIw/xTwiIX522fIFHn5Eff19qpTfJMh6hOfdJKvOuJ7zQZB2
 oKw7FZ2nOO0gIL2xnBsFuYW4xj9ulnYFROKpTxPDGJcJuAeW+fVrPvD0biHPQSpoeZdg
 eIpkqPsunRxZnVl3lAzj9u696I97dhkjFd5FQ0qBHqS5Js2fky1dTo7p0hyhJB+7m8bQ
 Kydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pkYdbcUfukIthtd0r0b7QQIU7hJvHQCUD0UgIfwX48g=;
 b=oMUBmtBx9pCtQkJP9aRVH0aNIcVF7oVJfSOYCPqyNSJU96IAyJn1CuIzRrOJypXTzu
 2S6F2TGV+Sl0A1HyZG7Qudb3sdYlfuECWR2I0LliwakluJDssYJDDyDbSlmp+FK2bHI7
 aszf7YQ2H6H/z+EPkM/VOKKrY077RzSEdNz7b0YPd5lVWiGiA7pAnpIUvAPWQuHDkX6p
 UmnsSrhN6dTgCiCkVWIm0wOirT52H09paEr+m6My6ggKxJNpxYwMSs3IyKoxX7IlZO9u
 WtbIFm6+0DgPnxPlnxGoE3qkqGV4OWBsGc8SLvi3FwbHdrNVy3BXo804ym2bNotzsuAv
 sDwQ==
X-Gm-Message-State: AO0yUKWuDaS30D1cYcz6UDflzNWMPlTIPYd3x0zcbNGr7jTSgGSL+C9/
 u0V48tEiJx0sNLjyz1grrvIHTw==
X-Google-Smtp-Source: AK7set9lhBibwCPMEZTCkQwTk/Ur2R6HM3k4cpVtVT2vBoRMKmwSGZlH4f5o5iVDq5EyI0dHIaXfOA==
X-Received: by 2002:a05:6000:1204:b0:2bf:b33b:fb7d with SMTP id
 e4-20020a056000120400b002bfb33bfb7dmr17152701wrx.61.1675004356655; 
 Sun, 29 Jan 2023 06:59:16 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 e21-20020a5d5955000000b002b57bae7174sm9217250wri.5.2023.01.29.06.59.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Jan 2023 06:59:16 -0800 (PST)
Message-ID: <19b4be07-ac5e-b4b6-acf9-621e567aa8c6@linaro.org>
Date: Sun, 29 Jan 2023 15:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: sitronix,st7701: Add
 another panel
To: Maya Matuszczyk <maccraft123mc@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230129143141.173413-1-maccraft123mc@gmail.com>
 <20230129143141.173413-2-maccraft123mc@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230129143141.173413-2-maccraft123mc@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/01/2023 15:31, Maya Matuszczyk wrote:
> Add compatible for 854x480 Elida KD50T048A panel, found in Odroid Go Super and Odroid Go Ultra

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586

> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/sitronix,st7701.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
> index 34d5e20c6cb3..dbc92c4e26ed 100644
> --- a/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7701.yaml
> @@ -29,6 +29,7 @@ properties:
>        - enum:
>            - densitron,dmt028vghmcmi-1a
>            - techstar,ts8550b
> +          - elida,kd50t048a

Alphabetical order, please.


Best regards,
Krzysztof

