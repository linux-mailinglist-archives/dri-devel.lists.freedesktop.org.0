Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F306183AD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 17:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A48810E643;
	Thu,  3 Nov 2022 16:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E93E10E643
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 16:03:59 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id x13so1420806qvn.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 09:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yKMpDhiUu/M7O0O5bkHOuOa6eYOMJH/4iBj4qwPMl7Y=;
 b=sbL6SBVeknWERt/ChyeC5xi8UZm/BhelfxrCWszU3t2KiEM9cN6xBZnpnE46zBJmCS
 UOIO2RW9QmZd8roO1mgvZLXsSFEdfkbyswDEib/+g2dI1iOH5P5ueaKjHjVuB50gAO1h
 6BdAbqyQUZI4/XXBikqYvTIDZNepjhPoKkPoKGLLhLpFtdM1saQf+Nd5b3w+gWMlWWDk
 Guc6YdiFwLeTGog7HeKBuARVibkdAQBpxbZQ9AyhJBkzC9tmL70GxbXiqqajzJ7pYbU1
 iwBbm4+jU0BHwEjMICJHU9+f6kYRY6kqujF1jvv3/aQLxPEINogM2Ms0s5iX8p/zC8Nc
 q3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yKMpDhiUu/M7O0O5bkHOuOa6eYOMJH/4iBj4qwPMl7Y=;
 b=DXowIIGLiunrHC9xFD61pSgJ57bOI8zHZuTOiyC71VZmvCpbXXryJASe3TJpUSQsCh
 szcnIAQxALAyDmjiR/H1yj214Bd6JSNRfVXpBEjYrDQN5nY5G31k1cCnaxslBFc1qIAb
 OGtiV0ZZISk9rJzMYb1/mAJ0BfDi4QhNqh6zcz+ESb0pI0bfiqA5OHW9X6jfpjO3RUcZ
 hleKU7TEeJrOvEtpeTEDmkHL5ZgVXGFUdSBqcuv+PwxjpDMljT1QQwGGnrMcXdOMST1p
 OC5YImjoU+CawDLm6wNdR/bVzDLkDRV/CawaVEszhSdcWptLKKPkJsmCOcAfDNvBpOne
 //0g==
X-Gm-Message-State: ACrzQf3CP+5B5ZxCU9PVHDmR9BBAqgUAurOnj++tg0ALVAQEX+E2xqNu
 gjZS4YryRottzMOBR4ptLb5BhQ==
X-Google-Smtp-Source: AMsMyM69i5ab1Q7nhLqQaq5bDRNkS2UxjRukihuDyZW5o6eBPkvcCOM6zqEQyHBY8YcOZGQOBrctsQ==
X-Received: by 2002:a05:6214:2b08:b0:4bb:bd9b:64e9 with SMTP id
 jx8-20020a0562142b0800b004bbbd9b64e9mr27475391qvb.53.1667491438075; 
 Thu, 03 Nov 2022 09:03:58 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb?
 ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
 by smtp.gmail.com with ESMTPSA id
 d2-20020ac85442000000b003a526675c07sm718519qtq.52.2022.11.03.09.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 09:03:57 -0700 (PDT)
Message-ID: <a4a52f69-81e9-c4a7-011b-8d79ac519cc8@linaro.org>
Date: Thu, 3 Nov 2022 12:03:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v7 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Content-Language: en-US
To: allen <allen.chen@ite.com.tw>
References: <20221103091243.96036-1-allen.chen@ite.com.tw>
 <20221103091243.96036-2-allen.chen@ite.com.tw>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221103091243.96036-2-allen.chen@ite.com.tw>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Pin-yen Lin <treapking@chromium.org>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/11/2022 05:12, allen wrote:
> From: allen chen <allen.chen@ite.com.tw>
> 
> Currently there are no "upstream" users. So, no existing users to break.
> Add properties to restrict dp output data-lanes and clock.
> 
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

