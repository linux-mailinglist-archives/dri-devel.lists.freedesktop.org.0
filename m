Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8143E59FB6E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 15:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D58E10E325;
	Wed, 24 Aug 2022 13:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D41C510E325
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 13:32:24 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id d23so19658458lfl.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 06:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=IeN3t5MN61x1tMgBpKVtQeJUWpZTemmViHvANrFvLq0=;
 b=hxACKwBHRoGmn5mdghZgJS2VvpDhRTyEs9raC6ncd2mYQAxSOx7uP3sZPWcDs9/c/b
 giNhqxT1G4YBeS2LZS1yh4WjyfZTGR0xJsiAq0LrP1xfY6O9xTqf9IW2yOM+ikIzB54j
 kRNkVOrXWBD9QsfFgod//gGhCmcrb+f+cMd6AYHJs4wXPwVPa03MqzJ1NK7ZWillT9Gj
 wvlZlzXprHT5hhuqC/1t3xNjRcdmSnW8BO9wcoyM1XaFQvSQXJ0GSpI7prd3sEOhH2e4
 ee/Ihd2jtDWqwbiRdUPQxW8Mz+xgJfAjNZIcv3Upa7jFlRnDOtoP2cjfvLqZ+rKcS8vY
 m9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=IeN3t5MN61x1tMgBpKVtQeJUWpZTemmViHvANrFvLq0=;
 b=jIUGui5Ja4BUiyKZAzjZ4EjqAktmAqNb9mlwObtA9wuOk+ZPnKpAq27j63bAyTbv0k
 2OJbg6M06hZ/8sc2K572nREqsv0BpFRWg8/+0mnhshrqwzbOfolberIDXI1nukhP4p40
 GO/hTZl4Fn8rOnw6X+opbrsUcJWL8DxTg7WojmBEXHJtcmP1XoL/k+3GGGYsFpTq2zwa
 dOaT7EW4M8BLv8KpxHdEJHnVRz6ze94F9Og9z3QpiZJhbY+i5qJAAwSrgaQZ9q1iMf75
 VOy3tehVIAZ+db5geCT1fgVcWqx0JFq/jOMv51rbECK8WLzU34rCfc+74MQp50Y5Ikow
 oh8Q==
X-Gm-Message-State: ACgBeo26f1YFMz0Pmt0BB6dLp2AM4nNQRqxm83BTOTCMESiu5Ia3xpUO
 H6BjycjtWeiiq4X0QIlp4E4hvA==
X-Google-Smtp-Source: AA6agR4OVoxt0XeiCWSMqiauS9Q2+s3634AiAakRGtl2E+frgZcTTteja3pcOyoQj43MeNC5TZKZDA==
X-Received: by 2002:a05:6512:1324:b0:490:c79b:7418 with SMTP id
 x36-20020a056512132400b00490c79b7418mr9838858lfu.404.1661347941594; 
 Wed, 24 Aug 2022 06:32:21 -0700 (PDT)
Received: from [10.243.4.185] (107-129-159-217.sta.estpak.ee.
 [217.159.129.107]) by smtp.gmail.com with ESMTPSA id
 15-20020ac25f4f000000b0048b0ef93248sm3030966lfz.62.2022.08.24.06.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 06:32:21 -0700 (PDT)
Message-ID: <f492ded6-16a8-6c15-2826-6ce2f784dffe@linaro.org>
Date: Wed, 24 Aug 2022 16:32:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/4] dt-bindings: display: Document Jadard JD9365DA-H3 DSI
 panel
Content-Language: en-US
To: Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20220823184242.3554472-1-jagan@edgeble.ai>
 <20220823184242.3554472-3-jagan@edgeble.ai>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823184242.3554472-3-jagan@edgeble.ai>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/08/2022 21:42, Jagan Teki wrote:
> Jadard JD9365DA-H3 is WUXGA MIPI DSI panel and it support TFT
> dot matrix LCD with 800RGBx1280 dots at maximum.
> 
> Document it.
> 
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

(but please wait a bit for Robs check to run, although recently there
were some Patchwork hickups)


Best regards,
Krzysztof
