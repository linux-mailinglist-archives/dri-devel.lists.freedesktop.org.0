Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4391056CF7A
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 16:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE4C14AAC3;
	Sun, 10 Jul 2022 14:43:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C82114AAC4
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 14:43:31 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id p6so769800ljc.8
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 07:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=19MhE5ZfrhXv+XYWE6FLNmmTUzoahjHoCzilM+giJ+k=;
 b=a6NBszHDHT2cYh8kUOScD2ibqpT7ddU8tPcRl7sHY3jNSJ67rLDQhZaKXkmpA9VE4J
 djRGj6ZfDFIzZ3DaWFRWpNWAQKCeVRmgoxOaE5GXzYb7UqQDz4k8eJXO6qeo0GjeervX
 09kLWWT8N2WdlFT8TWP2nz0zll+8m50DANAXC316JkJvnYWJVSALekLWrpwcjz0XJIpE
 uT+7UF5KJSTFq9hJ2zH95LlIPbOCiTG6e+OcfIY1Nh210xV0hyFi6mOYmCquA9um8YAw
 bDTQTHHesldrsCGKGNQjAmmGh0Kpkotdrsw7tKmwupKa7ISfRoiBR9TwGb9tVCUNa6a1
 nq8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=19MhE5ZfrhXv+XYWE6FLNmmTUzoahjHoCzilM+giJ+k=;
 b=xENz/HF/AfjiEwC6FTsG9d0Zjdf63evtywYics+7t+x/nUd8Lj+5SUa5Av8nZRXBrg
 qCaiqq+7GLYXFaXyauay1Lg080zjfqzD7uaFHrSEjJoZJYRezy9o7rNxwB40Tibl5oNV
 w3vTj5weO5dnRMAaHkF4furQ8onEFxwLCtm01vbOMhEhu8Ljx1iizJjgePzyZ8imLpFd
 15gdpkbNkZS/IwnUFeXbAb0FnSRKwSxpDoYqlvQDpcXQfL+CBNGknbLih3WYJJGqrbHP
 ZjRiQuA9H6wJovib9cdAhW66WwVptE1W5C0edSz0L4dtIonsyByezMLy9IAU940DxZjO
 I+1g==
X-Gm-Message-State: AJIora/v3jQ3j+lNcg7WcNbK4YR0Y00RL+Ae+sdtTpk6caTp24lYk+xu
 DFEsyHeLVP2I18qHJdQGGfASEw==
X-Google-Smtp-Source: AGRyM1tJ59Oz9cXf8kXE8WHZfYzZXD2CdrY2JUdL5IwSncxq0RpO5KsqvhUTSVlUVMmSv/rTAHqY9A==
X-Received: by 2002:a2e:a54a:0:b0:25a:6609:835a with SMTP id
 e10-20020a2ea54a000000b0025a6609835amr7310297ljn.408.1657464209307; 
 Sun, 10 Jul 2022 07:43:29 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cac-200.bb.online.no. [88.92.172.200])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a056512325500b0047255d21132sm960283lfr.97.2022.07.10.07.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jul 2022 07:43:28 -0700 (PDT)
Message-ID: <b2bf6fed-2f98-da42-076f-9a4ef3b13fd5@linaro.org>
Date: Sun, 10 Jul 2022 16:43:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/6] dt-bindings/display: ingenic: Add compatible string
 for the JZ4760(B)
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20220708205406.96473-1-paul@crapouillou.net>
 <20220708205406.96473-2-paul@crapouillou.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220708205406.96473-2-paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, list@opendingux.net,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/07/2022 22:54, Paul Cercueil wrote:
> Add compatible strings for the LCD controllers found in the JZ4760 and
> JZ4760B SoCs from Ingenic.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
