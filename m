Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FB8639A74
	for <lists+dri-devel@lfdr.de>; Sun, 27 Nov 2022 13:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A84410E0BD;
	Sun, 27 Nov 2022 12:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D9A10E0BD
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 12:24:28 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so6576342wmi.3
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 04:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iW1UeaNHW1nZvRIYrQGKcf3kFYKlAFXkiSyrwvh4YCc=;
 b=t2GnoaLuuFss6CmlA4LndixCeDygF//BbCfYDWLz7rAAGAQC1sxkhyYYMWSyTBRwuN
 DTv95S7VVnqUDRzXo1t61TmmdGrO3F21id2jWYMivTsh+MP2U288XvKG9IqXe8qkwDru
 pX3nolCG8aKD98lZEKJ8fWOvhsViGijO+KoCXVJxRtA6NyW5BxwhYk1h0Cfza2y3yo8Y
 5c/HmqvA6Qc9zdhk2eF56pXIXCXM2sAowO8VV3L8tRgsb+kLrlRCD0ODYnoOKw0UF7wZ
 rDJUT583iNBybOKvLM3CCvgm/Au68nIAg2YuDDczgvWGJIsIGaMGIrlS5+DS8ohwBU7J
 ZhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iW1UeaNHW1nZvRIYrQGKcf3kFYKlAFXkiSyrwvh4YCc=;
 b=yEQv8NU2UG4HJ9YwQflPCkmjv0dKv9JB0t+FxClrJphsMlzT4mNilI+3Gif14vsj74
 y6ugfvBiZ52qKSvWjksVWn/y99cTLi1Rw3nEqOs1RfYbysXe/J7tlYPNTuwiQfyKRoid
 Vch3sqkYY3vpBFmCnWn+KEnSG1JqaCdqllG7Dag3gfjhdWMcTFL5YQeqCfBTLijLeLSt
 aGDTS16/zi2CHmAby/j0nYTTj4qtXGonA9YwFDncV5LIUSCchO3LCAIOqRRV9glA6QDW
 WVfHE3KyUnrNQJHA+JEl2KcE5fx4bUFye9AzwmczeWSvrZkmLF4gUWXYTNgyt/fjNwMz
 ZuMw==
X-Gm-Message-State: ANoB5pnfOwY4lJnIR8VO390LWH1jDf7IprnYv8/nfe1tJx2O7ete9LRX
 JFP5glOzVcMDomMvQLOAa8mzEw==
X-Google-Smtp-Source: AA0mqf6kuChrfZ5OyEbwXtrfM4OEbYvTKrEvGJzaEbjBadNowSbANRCdXXjdgtcT0+vBM5cBnuumNw==
X-Received: by 2002:a7b:cc89:0:b0:3d0:57ea:342c with SMTP id
 p9-20020a7bcc89000000b003d057ea342cmr1175375wma.25.1669551866536; 
 Sun, 27 Nov 2022 04:24:26 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a5d4087000000b002366b17ca8bsm9223560wrp.108.2022.11.27.04.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Nov 2022 04:24:25 -0800 (PST)
Message-ID: <5666462e-d416-84ee-ca70-7edd77bab3d0@nexus-software.ie>
Date: Sun, 27 Nov 2022 12:24:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 02/18] dt-bindings: msm: dsi-controller-main: Fix
 power-domain constraint
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-3-bryan.odonoghue@linaro.org>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20221125123638.823261-3-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 agross@kernel.org, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2022 12:36, Bryan O'Donoghue wrote:
> power-domain is required for the sc7180 dispcc GDSC but not every qcom SoC
> has a similar dependency for example the aqp8064.

Note to self "apq8064"

