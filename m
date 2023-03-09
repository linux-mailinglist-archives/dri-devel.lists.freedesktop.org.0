Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C84B6B30D4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 23:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021D610E1D2;
	Thu,  9 Mar 2023 22:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C185C10E1D2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 22:37:21 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id i28so4321123lfv.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Mar 2023 14:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678401440;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vFWvVfxVAn0JYy2RvVNotdBgoXVzu6+UA0ROvn+lkig=;
 b=gPKCt6kGrGzWI6Z5cmQ5vHx43shhCsJljJrTbLgeXdksKonaADCLSAKdrC4gArTmQx
 IA6JqX5Y9IIJOtFcV9Th5ilQfOR6I7QPGxvbO43xgKVVrte/3fvf5gP4QaXLz9QJlt0g
 9Yk0q6DzxvPFAjlIWnujD4SLdF4FGEKThIdvn9/zaQVv4Ceb0PTXwZt73TVCIxfPjFwg
 2cVz99dHc93rjymJr9jCtdOGLeZKIeMqGqLa4pTZK73SyuztsFW9Uua3KCihyF2/70Sg
 qE6ALe6EPjavtaUOYPzbYgy9aqXw1+Ec1Mwb+xf+MhmxrxNCxch7HW6WnAyw+G8s7j3d
 hkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678401440;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vFWvVfxVAn0JYy2RvVNotdBgoXVzu6+UA0ROvn+lkig=;
 b=v1k0u07nPG8BglaGBnLuHMcX//SrtPDv/PhhFeGTnr31yIf4DpGbMiR8gCMnIuwImT
 NVbq676uzBiNW6F1NLqkXg4v5DUuUcrzYwKfVVyEPxD9/VJSYpJ7JMK6ue9QNehWypcZ
 W5fjJ9VBprC7VIbZSQaHgAOU88s2sYylLxKbYj26ec2M8yhXx7tmbi3pDY6kHMe4R3an
 c1y5EJUKukJkgdbRl4buNmeqBRV+r3kPLkIGyqeLDtOYTGYW4klh40SD3rpq8U0Y1tWG
 KG0nvYBBwnl2tv9oHBh0uKMAp2ORT43jPXBPAVgA968BXGij4dc+VIoWJI6AtxA9nrF8
 eb7Q==
X-Gm-Message-State: AO0yUKXokPVPxic5liU03hVUFKfDW7GpdIxqR5FqpDkcP6Ykb8X3B9qV
 Mi87Df8/qp5vJPZIvWLuIrNsdw==
X-Google-Smtp-Source: AK7set9NFAA7v78zu5aKYNTQcuPQtA5qn6A3AwSO27Qt8087MIkK12e2UayAT0g7EVrmj6Jhuti/2w==
X-Received: by 2002:ac2:4c09:0:b0:4b4:6490:cbf1 with SMTP id
 t9-20020ac24c09000000b004b46490cbf1mr7060611lfq.15.1678401440025; 
 Thu, 09 Mar 2023 14:37:20 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a2e9808000000b002934a7c04efsm42146ljj.98.2023.03.09.14.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 14:37:19 -0800 (PST)
Message-ID: <aac6ba9c-4230-aff7-c93d-23eaf6895464@linaro.org>
Date: Thu, 9 Mar 2023 23:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] drm/panel: Add driver for Novatek NT36523
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>
References: <20230308043706.16318-1-lujianhua000@gmail.com>
 <20230308043706.16318-2-lujianhua000@gmail.com>
 <66d293a8-f850-cb80-0c83-2ebf7e29d0c2@linaro.org> <ZAh3MSpQ30YyPAVe@Gentoo>
 <1cbe9e29-13a4-574e-6d8c-b2506e7a36b3@linaro.org> <ZAiPTat/kmLyaJmA@Gentoo>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZAiPTat/kmLyaJmA@Gentoo>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[...]
= of_graph_get_remote_node(dsi->dev.of_node, 1, -1);
>>>>> +		if (!dsi1) {
>>>>> +			dev_err(dev, "cannot get secondary DSI node.\n");
>>>>> +			return -ENODEV;
>>>>> +		}
>>>>> +
>>>>> +		dsi1_host = of_find_mipi_dsi_host_by_node(dsi1);
>>>>> +		of_node_put(dsi1);
>>>> Shouldn't you put the reference only if it's found?
>>> thanks for spot it.
Apparently not.. please don't change this

Konrad
>>>>
>>>>> +		if (!dsi1_host) {
>>>>> +			dev_err(dev, "cannot get secondary DSI host\n");
>>>>> +			return -EPROBE_DEFER;
>>>> dev_err_probe, here and in neighbouring exit return paths?
>>> Acked.
>>>>
>>>>
>>>> Konrad
