Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79156E65E6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 15:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B3E110E372;
	Tue, 18 Apr 2023 13:30:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF85F10E372
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 13:30:42 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id fw30so20424799ejc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 06:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681824641; x=1684416641;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rffFnl7mfjezGYLAktfVaaITh/gwflzEth7uD6ZC/cM=;
 b=I5eEix0qVq0SZl6LePburT2lrcPY9omUYZ8PmE++6NBF67yQ0ze2mpF6wb4Cmgw/pD
 xWQ3ro43dl+zw8hza5uydu/o8vSq++PgPVK98u3A0Wnl5bqZmGyd310bZwWkP0l2sMw5
 z6Yy1SBbFdx7bDyMWYsKVEcaqhj7vQmOjGkGgaANM1pku79ENItxKjp7376/TOeeCGdF
 pjZ85FFvXds7Wx7buAgos6OwLt6OqkOaNvxGaxOlSTWzKPGJ9IlrJeLI5KhaeGhuvLv/
 RpTP/paZReyjbfUlSPraITZm06nQ6fAs77PjQ/DVe1oP8hWzpW+5hmyncPufTmVZFH0Z
 h6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681824641; x=1684416641;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rffFnl7mfjezGYLAktfVaaITh/gwflzEth7uD6ZC/cM=;
 b=lqr8HZd+krysUmZI9q77YsIx+29C0JdR/XTjUy+9tTOxj2tekDHNGyyUgP6LbOteRu
 9OIdoZjbqc3bG4D4fZ89Kj/yFBwkRxF8ISpTTLAI5ZN0STrIMGo5PBpzVWryofgcl4gx
 GUvMV0eCkiT3LaBkUnlGH4QmtLsW/fKbCqqGGmFHUEItfCcsmQaTxn/MziqDMonLXv7w
 XLOQvHqGvoHZ7yw86LqBU9t+h3e7t1rApJQFhDAN/6efl1+sfEStZlLtwQKZ3rxKjMhk
 gyq7oBEX/KYXVze23Yik570o9AZi+APau81MQ2ehYZikwk71jYDOPr2kjQW+2Eunj5fi
 rMGg==
X-Gm-Message-State: AAQBX9cpgWVYH6UpGFkmnF+oSBTCUJDNdF1BVWDMstl7y/hfRPFdjtGF
 E8W5nVwia9Mm1kIzo6hSTeShnA==
X-Google-Smtp-Source: AKy350ZW4dBad0JSllW5uCiWq3kVnCQW9P3yk9AHbLDu7uN4k47WQuQO54FdCJYumwP+hDNYtSM5ew==
X-Received: by 2002:a17:906:b802:b0:94e:61d3:d13b with SMTP id
 dv2-20020a170906b80200b0094e61d3d13bmr10632661ejb.75.1681824640821; 
 Tue, 18 Apr 2023 06:30:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77?
 ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
 by smtp.gmail.com with ESMTPSA id
 kt2-20020a170906aac200b0094f6458157csm3523268ejb.223.2023.04.18.06.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 06:30:40 -0700 (PDT)
Message-ID: <b781b14a-0bc0-3e3a-e803-a54f24cd58d3@linaro.org>
Date: Tue, 18 Apr 2023 15:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/5] dt-bindings: display/msm: Add reg bus interconnect
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
 <20230417-topic-dpu_regbus-v2-1-91a66d04898e@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v2-1-91a66d04898e@linaro.org>
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

On 18/04/2023 14:10, Konrad Dybcio wrote:
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> 
> Gating that path may have a variety of effects.. from none to otherwise
> inexplicable DSI timeouts..
> 
> Describe it in bindings to allow for use in device trees.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

