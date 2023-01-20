Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB3E6754CE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 13:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A6210E0F6;
	Fri, 20 Jan 2023 12:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFB810E0F6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 12:41:41 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id m15so3953193wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 04:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t9XjszmF/8qhTNMVuwNrRvWRLQzv4zG/c00mk2PH32o=;
 b=zwYVWKeymyLDPGAhMwebRVizSWIuFyjkJQGM7f7yQ8reSiP+lA0ujMEGQuyugAGhY7
 iKSap2wY46XvmlGSQkNI+nIyCkpJE1YXRlXJv8IIHqA4CGlLtavZwSZN4m8wzIE9KQ1Z
 S1NDMEjEgDKAGH252dUZgKDcLruOR5VlBLMWLr36t2YC3V2JJkfIGaLajrIeo4mxYCer
 BME8ng65YAtSoXL4GPNZBZDOqOLIu5hw5UL2OHFPc2HDxBR1S8pWRdR0fOaviH1tpbvO
 FXiCdRmbxOVoFv3e+qb30PGkkoSGslp/SVzL4FpYSKVq7odm46JnOwo/zjTVS+agBEgr
 wqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t9XjszmF/8qhTNMVuwNrRvWRLQzv4zG/c00mk2PH32o=;
 b=OQgUfUhxBDC+WKfuMTxpp0yDL8b3o6FwzZ3NFeb9eteYk7OaQyWYYr7CKViH0G0znN
 2Q/DptvzNCYmrmgWbG+SnH9LxWDaM1I6wsYIuzaKlwjRlnNoq/592YaQa2SEVlVwXk4P
 OZCNgCqJ7yz3/7sEAzme60qBkHPBQ8ZqTCbqQRjAVN0k8OHLDoAWlWTjMjuSwDexQjgT
 tLQ4V6AfN32FRjP0azfkwOjAxzuah82VYvTQ7AEk6cquQJ8zP5MDvtWmr5wgwtBHmHJt
 LkZTW8h/A1KBDCIsmajmUKreoeI6xgIST3qNxsSX+psVHja9CDi0iAiRx0Zk48XydbR/
 S8jA==
X-Gm-Message-State: AFqh2kp2h1yci7Xhw44XqKh0IiJeCWZkxIdjL2GCGv3sZABTw2Fp7OoO
 OZVWhyTpQVUppXFSN9BUYc3lOg==
X-Google-Smtp-Source: AMrXdXtCnq9tonQJY2m5G5BpVoNm8ayoj+6Kt5jmzGEGo3iBBKKX+GncF/gsCodgvhIMAjlMrRZcRQ==
X-Received: by 2002:a05:600c:4f86:b0:3db:66e:cfdd with SMTP id
 n6-20020a05600c4f8600b003db066ecfddmr12768043wmq.9.1674218499637; 
 Fri, 20 Jan 2023 04:41:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a7bc043000000b003d1d5a83b2esm2163940wmc.35.2023.01.20.04.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 04:41:39 -0800 (PST)
Message-ID: <858a06e9-1141-4b1e-cd8c-75ca70330fc2@linaro.org>
Date: Fri, 20 Jan 2023 13:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v8 1/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Helge Deller <deller@gmx.de>
References: <20230120123857.16124-1-lujianhua000@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120123857.16124-1-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/01/2023 13:38, Jianhua Lu wrote:
> Add Kinetic KTZ8866 backlight binding documentation.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

