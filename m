Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC9B5F2268
	for <lists+dri-devel@lfdr.de>; Sun,  2 Oct 2022 11:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7F210E00F;
	Sun,  2 Oct 2022 09:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B8D10E00F
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Oct 2022 09:54:14 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id d42so12894888lfv.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Oct 2022 02:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=9D/v1iQUh0ooMqPhNBkoFRvVRHxHogSQdEWPpN5Jveg=;
 b=abp6LlJfR8XGpzHJa7WU7vfitgblEy5OzcxuhOc6GYNCw3Dwlpplj1vB8LtE8gyEEf
 OiwP9nL+sia2KcNBSs0VLPeHy7sy9ONA8vXKIr6bNmTU83MbSMmQcJ3c3k3xMp45T67D
 eTAMTHsyZsoNB3VDF/rYfKHj4ojoVWqCbJzUKsZ13hMfidVC5aYrw9zx3Kk7moOVaIva
 h86Td7tbxj70bDjt8mhtf4c3GzRFAMJ7nn1509tcrP//MXrggTwEBebP3uLIHXMlObNO
 CWCXqL7v9E3cj1u3I20qFtPdIRI5BlXBpXdFtrdfurs4UeG/v62O0Pzzwn0UQC55vTLq
 JtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=9D/v1iQUh0ooMqPhNBkoFRvVRHxHogSQdEWPpN5Jveg=;
 b=s3+lvw8oD/NHDQt8cxMC3R4waCBgehYOFDfFgBGrlytIn5+kxT9IdcLMZ5MFx5/Kiy
 3fmOdPvkm8xRSfhl8xMfsz7XhywXA8PeBpYaadR7mQGqgjuP6CXbSwQZJb55JmW9QJbB
 zVT0JF4YTKVCC+hhzCISNzg162uiRGHJSXmhVgWA8f1YWXhink98Jg6ApDp8F18jfGow
 /BP1D9/B59CEWvAlRZagjcAHCTWLowcliDEfB4gcPBIqGLye2iUTl41gqnUsDfLKW5DW
 kOqKrWDjDUp5FOW63m7ExNoPqVuHHZWHW/4A1wiZCJGY+3DCWVMa2cvIyuxfeWPLmIB2
 kCtg==
X-Gm-Message-State: ACrzQf09Aa0kBUVXA4iNF7nA3lizf7QX2HnHNWl2ybHxqOY5yN8MX7wq
 ub5ZHWpTlZNKEgAqNH54KrmOHQ==
X-Google-Smtp-Source: AMsMyM5REZ14b/0IRTo1CUYbHIPHIbthp0cClLpq6doOtBk8cdSr8bLkfLil09f5LdiXYQntcKFNzA==
X-Received: by 2002:a19:5f4b:0:b0:49f:a4b7:3f1c with SMTP id
 a11-20020a195f4b000000b0049fa4b73f1cmr5488979lfj.333.1664704453094; 
 Sun, 02 Oct 2022 02:54:13 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 g12-20020a05651222cc00b00492b0d23d24sm1030969lfu.247.2022.10.02.02.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Oct 2022 02:54:12 -0700 (PDT)
Message-ID: <1a1e68c7-9314-0096-b069-78a9532c44ac@linaro.org>
Date: Sun, 2 Oct 2022 11:54:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 1/2] dt-bindings: display/panel: Add Sony Tama TD4353
 JDI display panel
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20220930180812.32210-1-konrad.dybcio@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930180812.32210-1-konrad.dybcio@somainline.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 jamipkettunen@somainline.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, martin.botka@somainline.org,
 dri-devel@lists.freedesktop.org, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/09/2022 20:08, Konrad Dybcio wrote:
> Add bindings for the display panel used on some Sony Xperia XZ2 and XZ2
> Compact smartphones.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

