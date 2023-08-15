Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC4777C72E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 07:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3B210E14C;
	Tue, 15 Aug 2023 05:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D0410E0CC
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 05:43:13 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9bf52cd08so74563461fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 22:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692078191; x=1692682991;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jw6ZKn2vNcjA9MqDmrsGFXdRmKd5KhjNUkjx2Uq1Kd0=;
 b=BKPeeD2U5MUnrhf2RZMUCETsWAXISwTYH1oSOI+t2Vck3SDjGoEiNzMWDyFmdcHs/j
 uyTL46pkrEV5ecqCe3sq2Pnn6PUCw/k+qZsRw471glKKDFPifLXrTwy2V40oVR7V+rEQ
 q3jBlmWdxIrFdkIho2LetNiOrmtJnPyxYIEXGh5vtVMQRgT3UFee42wen2p8fcX0zbg6
 0QTT1v/c2mt1LDGjwZCnJsAZqyDF1qW5UCUXq8znpC/GwRrsQMAOo2wrp950tBowieZB
 rizyV7w0X1IOn7f34tjjcw5F5PoRHjKpvJn//xBWCEld44q4wJsYWMzXy7IFITeD4IeO
 kGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692078191; x=1692682991;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jw6ZKn2vNcjA9MqDmrsGFXdRmKd5KhjNUkjx2Uq1Kd0=;
 b=GXA8T6mu6bRTCrKiy9dLuyIAsZulkCw8oG8hxs0UYZW0cjAob1QYokw58ZiEuu0XKG
 xeGDD6gsnNa8n7OBy1BZOf2t6FSjAWwRgikw0sLMASQBUD7MgPCnMyPnHD9eqEScZCYH
 RsmCxH9Xhl2JMQR2I1E1rAlqmExoVc4T/cC/Ck5tJV+QWK2zeRfCyRiJHzzowOT0wVmR
 wrz38Qc/u9XiXKbC8B72yFsRZWLAy5eILEsKO+aGbVWLR9S26Qo+Pf3nGGyONQs8zTmF
 HqjWA1nWRTfBhWbbHwpYxd/63kS4UaDSvqNo+0d0HQfoCrPWvSj9Dbul9FEw2HdUaTTo
 Y0Eg==
X-Gm-Message-State: AOJu0YwWQ2fQ9yStkNryFo+zMnTB4CwJDCZ0oACZ37H6t6HuPQptLTWc
 o+bKPqB/0ijprQhPEPCgnmBRcQ==
X-Google-Smtp-Source: AGHT+IEvyC3KHqPI4Aqoe7nlXlx/XKraQasiWSzM4QIIBy+bofI9pfUzQQxcwHNZtVA6mH3J4pDrQQ==
X-Received: by 2002:a2e:8317:0:b0:2b9:ecc5:d1de with SMTP id
 a23-20020a2e8317000000b002b9ecc5d1demr6962968ljh.37.1692078191458; 
 Mon, 14 Aug 2023 22:43:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a05600c00cb00b003fe29f6b61bsm16416026wmm.46.2023.08.14.22.43.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Aug 2023 22:43:11 -0700 (PDT)
Message-ID: <c70422eb-ca6d-ed86-dd15-dfa555e64c89@linaro.org>
Date: Tue, 15 Aug 2023 07:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 02/14] dt-bindings: display/msm/gmu: Allow passing QMP
 handle
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
 <20230628-topic-a7xx_drmmsm-v2-2-1439e1b2343f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v2-2-1439e1b2343f@linaro.org>
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/08/2023 23:02, Konrad Dybcio wrote:
> When booting the GMU, the QMP mailbox should be pinged about some tunables
> (e.g. adaptive clock distribution state). To achieve that, a reference to
> it is necessary. Allow it and require it with A730.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

