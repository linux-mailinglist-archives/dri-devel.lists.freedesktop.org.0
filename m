Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F20746BE7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 10:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A129510E2B1;
	Tue,  4 Jul 2023 08:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B636210E2B1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 08:30:27 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-98df3dea907so626460666b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 01:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688459425; x=1691051425;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KFaFw3uJoDRm9laNgejEO9i+oEQ6almWqyPQQo3h6WE=;
 b=ZjbvfgYAzGqBD47D3/HU4Ni1J28WS1B5YSh1SFPyYXLkUmMDIN2E/pEoKqc/thhJnc
 EJCRBaAk8au/+WFGd77G2GE6y8PU7GEb3mRq5+f5d4AsjuTfTwRls+apoEeBWhb2H5VZ
 8AFgoOU45puo+4H7CU4UJ2MPQgcTcn8qAw6oRkDUgYsy284cQfmjn08AWh9izQD0rcdj
 vrBWlheExtcEdjf59szC4Qahl0pCKuKwe1ImyLp1SyyTaCd9WBKmD1dzfyhusWtOzyZk
 Mu7TrkQto5OAFRBhDsAraehkOhPhhiP6UqlqXlSTelHdbK3qfoZZFOsKQymgmDzpY7rh
 wzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688459425; x=1691051425;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KFaFw3uJoDRm9laNgejEO9i+oEQ6almWqyPQQo3h6WE=;
 b=V2mx97VxCXhYHaxP2Pje8sPHD3e42eeQPjPl1PjOZhYuLwOiIAEdfq8dcXSV3C3fNO
 glyco1/kt+E4DK5OPGa5kS7YmE8acbGc1Dw/eblMjnRqpkSxtAfbP+6rxDyJtKrFz6U2
 0kf8iRgvTssZQPdCivZWYVpadUo+OuV0POfXHbXgIZBURYPFjL1ge4oLq/j9g0iWBmKc
 2augbdfV634oYujoltWuq+1Xbd7ihNRhMT1ZGsYWnGogsC5TdEFuWta3FY2hF8Y1z2GV
 PxFo2P2aVGDm49X3GAAq3DI+kAGa9slfvYJMXjQKW7EbqsZ0tcLNz6cRRAaC+qHG6hky
 3h7Q==
X-Gm-Message-State: ABy/qLaZABg1Il81LbAcsX6MjBs1GAQtcL+He/mpjrWf2F9lVhUvxVSx
 TPXpGj9TXe0mmE1kcN90dGTTaw==
X-Google-Smtp-Source: APBJJlEe8seu86IJuy45hmgLX9aDLTpaeFtaYyGZDUMtQ9+B79h7OgG0fN5PxW+lwAOJaVYdiyE8pw==
X-Received: by 2002:a17:906:34c9:b0:982:9b01:a582 with SMTP id
 h9-20020a17090634c900b009829b01a582mr9389985ejb.1.1688459425722; 
 Tue, 04 Jul 2023 01:30:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 a16-20020a170906369000b009887c9b2812sm13234240ejc.8.2023.07.04.01.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 01:30:25 -0700 (PDT)
Message-ID: <c6dc324c-2946-3af5-8ddb-11d0a0e824cb@linaro.org>
Date: Tue, 4 Jul 2023 10:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/14] dt-bindings: display/msm/gpu: Allow A7xx SKUs
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
 <20230628-topic-a7xx_drmmsm-v1-3-a7f4496e0c12@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-3-a7f4496e0c12@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/06/2023 22:35, Konrad Dybcio wrote:
> Allow A7xx SKUs, such as the A730 GPU found on SM8450 and friends.
> They use GMU for all things DVFS, just like most A6xx GPUs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

