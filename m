Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E44866D44D4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 14:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BBD10E459;
	Mon,  3 Apr 2023 12:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F72810E459
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 12:49:59 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id ew6so116799292edb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 05:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680526197;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GxZIAtNp4JwkfPgT2XU8zTmcwMxCGH1SxHL9AhchsKY=;
 b=ueFIjtcJqkqgBO07bsvy1XY6tkAIr18zJ3ohSlPLA//NnIwDq3gJHXtBNuTW/ckDyL
 8uSjLHSx9M+dkEwgaDmSeFKandjX6nbhplJ6apKp1pCAMjGWlWtlyFvSuLN08DemPt40
 pylrHrv+XIrRFeXdY5WvY9jp3ZyDxDT6yW5knRK1CnIf5UZRc328xSzOiu9L3Fyc3IwT
 z31836O9WtJlYv1OSpWIjnsR4bNe+dMHdQllm25AhtEafxzTTOrR7AioESpzfmtij4gd
 ZAQt80gHtfuOGX4qoYBEfrH/jubDMqTVq9DNBRuMqZbJlpQZt9tkwZplKmLbheQQXAM2
 iyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680526197;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GxZIAtNp4JwkfPgT2XU8zTmcwMxCGH1SxHL9AhchsKY=;
 b=cgXJcI0cEYICNje11mub4os2hplTtJ+CNfBKiarTKVSXAwajx8wsmuNq5lrJB25arL
 U+V8CnuZOWc5133dspPktcKi3F/CKOeYgkLJKDoFcfwIW07puhm5tqRviHR08DLBdgsH
 pLpa4GzacdmXSdxt/pmfVK63PX7oxkGhUq48iNil/BQO2Ed9hXP+9iCffHd0bulCKOaq
 EwVnfSfFAmQExsMDMQOvN/7C5yvjNEsVuLmi6L6k1JBiHyDGkGknRFIHXTkvjeO5SWi0
 8FpfthDLTsFD3IiGTwKYizaTarMYC/lrtx+fZCJl+1ZLmuyCJBJDYLRTF33Plgk9QTwL
 1M5g==
X-Gm-Message-State: AAQBX9fKzs8QFTXc1I9AQoz29/JDRFOdpQUjTIwO9H+fcHM3XjadkSu1
 pOitce7JTBYIWoa+A18ePYqtgg==
X-Google-Smtp-Source: AKy350bTW2X2bBx2avO62TUv0ZKTCByYYSZW/DdRAfTEv16w8Pb6Hz9vWB3S9sD7HNpgxsXyNgrnFA==
X-Received: by 2002:aa7:cc04:0:b0:4fd:2a29:ceac with SMTP id
 q4-20020aa7cc04000000b004fd2a29ceacmr30110784edt.14.1680526197529; 
 Mon, 03 Apr 2023 05:49:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805?
 ([2a02:810d:15c0:828:ae90:d80:1069:4805])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a170906230600b008d68d018153sm4496451eja.23.2023.04.03.05.49.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 05:49:57 -0700 (PDT)
Message-ID: <70060001-d935-d238-583d-b452f9a4e5bd@linaro.org>
Date: Mon, 3 Apr 2023 14:49:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: bridge: Convert Samsung MIPI DSIM bridge to
 yaml
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, neil.armstrong@linaro.org
References: <20230331195746.114840-1-festevam@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331195746.114840-1-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/03/2023 21:57, Fabio Estevam wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> Samsung MIPI DSIM bridge can be found on Exynos and NXP's
> i.MX8M Mini and Nano SoC's.
> 
> Convert exynos_dsim.txt to yaml.
> 
> Used the example node from latest Exynos SoC instead of
> the one used in legacy exynos_dsim.txt.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Missing changelog. This is v13, not v1.

Best regards,
Krzysztof

