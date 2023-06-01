Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8F571F10D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 19:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A7F10E24F;
	Thu,  1 Jun 2023 17:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C0A10E24F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 17:45:29 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5148f299105so2615021a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 10:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685641526; x=1688233526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CBRDIKv9pFHHAnzSCCPWxz8E2s9GC4jBbWRxKZHWfIc=;
 b=eUliI97ZCMH6oLe3T3cDL+eDWSJ/WuoEakn5AngmP93KWXQVEzOeIENWiDjONaUKz0
 2hPU9HqsAJk7YVhQN3pJtiZ7FeST+ybszk63JY6Gc3SgB5SJFyywitzjJmN0bQrDlarS
 InTmznBm8FkkIISIN1woyXSvnuVeW4KPzSm4LGZ4aHqGShMQD7Dlr5+ocKb8emJ2V2rp
 7RZYLKe+FZMdEbWxxj6VZ8YkmNpC81UY2px9DHB/4d1rS3goJgvTPSUDC1PXzhOxKYnd
 iPHjDtGGefC9Ncpkg4h3TCW5GVwwf7uCPnq8fL/BoORHYnOwOJutIHPkICLIli8OxM2p
 DW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685641527; x=1688233527;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CBRDIKv9pFHHAnzSCCPWxz8E2s9GC4jBbWRxKZHWfIc=;
 b=essgt4fCaHVf9B6p7vOrYgMGl7hPuaD3/OaJGhI7+MqB41rcybTDwqDF83hQ+qdXWf
 JsLg+QgFYm9bFylzXGQ/WFjSmsd+kunWTRG6lkHiFCiatYK7cL7VhESDLTbmPnnbi/JJ
 0PWsLCDF+roHQGqZEKNijhFv3CqXacq7BtmXdILR4QjslPuLasbhyXmM7VT87vgc6SHA
 scMh66w2GfKCA82gpXp8Ow1Eoj+EIEs/G38W0Ejc2yUx42iiTorHWL8acJf6cjrssQql
 8kYef1yLBN+7mE+Y7ulNnBmIupfQg7EqB+pIi0UDiUx6MOLIpI48yC37yaA6wHZ79uYH
 xxgQ==
X-Gm-Message-State: AC+VfDzNlM/r+Q/Fdk0ftwGWnpYdFE+tHSAWcDZCa4BT/ZsHPtR2tegK
 Jj5yNNZfOGMfy0+FKaJyn+BbnA==
X-Google-Smtp-Source: ACHHUZ7Unk95/39P64w6MIuE0m9e+mNxNCBz6qY02E+GST/o0s5lxoRIlH/bV7R9zajjnFD7YNu7aQ==
X-Received: by 2002:a05:6402:3582:b0:514:a5cf:745b with SMTP id
 y2-20020a056402358200b00514a5cf745bmr637933edc.3.1685641526752; 
 Thu, 01 Jun 2023 10:45:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056402045000b005147f604965sm7519209edw.24.2023.06.01.10.45.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jun 2023 10:45:26 -0700 (PDT)
Message-ID: <bd257ed0-71a7-0504-0bfe-14775ac93571@linaro.org>
Date: Thu, 1 Jun 2023 19:45:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Add NXP i.MX93
 parallel display format configuration
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230531093206.3893469-1-victor.liu@nxp.com>
 <20230531093206.3893469-2-victor.liu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531093206.3893469-2-victor.liu@nxp.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, shawnguo@kernel.org,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/05/2023 11:32, Liu Ying wrote:
> NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Add device tree bindings for the display format configuration.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * No change.

How did you implement Rob's comment?

> 
>  .../display/bridge/nxp,imx93-pdfc.yaml        | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,imx93-pdfc.yaml
> 


Best regards,
Krzysztof

