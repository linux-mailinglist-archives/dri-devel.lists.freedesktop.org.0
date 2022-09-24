Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916B15E8A8E
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE9910E57A;
	Sat, 24 Sep 2022 09:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B4010E568
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:11:39 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id a14so2400602ljj.8
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=AJ8TUjAWCXpFYS5hKa8RQdvrp2UP+wXPk43AFleVbuI=;
 b=HfFq1UkhQyJ4W74vYLzpC9NDAJc396eNp1+8eT00urQuY/SKGKI7U+uX5Z7gI9zIkX
 VMNpuSFNtebDsYOYQ9LWP4qqBIOmCTxtgdhGOdV0wiSp1D9KJ0hQXSkmgvmjME4rkk91
 dVJiJ9Ek7NoPbJUo3OWoxjfJDZNpNO+zGfrQHsAzLaXZjx/h2I0/gf5CsP6NLWkI+6/N
 I6oO9KPjFPPG+tpsZALhgS8MR1wi7x3JfzK8EbYo4pfL/9kanHpGIDKxSIks+JpiBMGT
 HJDXyZbeLEggwcY0fOlUSGaTZOa7spZPQg0dtKW/CbGkG8vLwgh+PFl8IUXJEa8/FEY3
 P10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=AJ8TUjAWCXpFYS5hKa8RQdvrp2UP+wXPk43AFleVbuI=;
 b=N+QVZGYskXCHloqYkKxqtu8Bqf2MpGwvC3PGnPYGoI5p4eZ1Bqpx6F4kj393i0olGP
 tteI9sGkFmby0Sw6Du6dFY4Rsn22SbqlpS6n9VToEDHPR+YZFfiqlJ1Ls9YXyL/PYMZE
 asnwejL3dSC4uEzMn7ejGqI01IthRxCXRmNQ7AECqVqBDfyzN9JJKFNVRw5kx2+t9i3g
 3LALmEw9L+kssLCzloq94u8Tx1TVlAYZXoSS/j0MQ3rDfLQ1C192F/Yz4ZQA4lYA2Bdi
 VyMYIQRDgeZiZ+ogM8aM9EwQH/4yXr50JhP39p6aW+uhzU1kXDYiKnx7H+pHvKy7rWfS
 3G0g==
X-Gm-Message-State: ACrzQf0QjNvGLCrhQV+JIZB/CB6LCvQvk/5hm276MCK1CGa1bhCb9CHV
 E3RPgT/WOZyDvGllktHHKyNErQ==
X-Google-Smtp-Source: AMsMyM5HqWVwoHJfzOQRUlbcgtGM7KM3kBVB75s425FqDMdtgtYhO6sqhorIL1lG+Nh4QZ+Nx0QMYA==
X-Received: by 2002:a2e:9791:0:b0:26c:5956:30dc with SMTP id
 y17-20020a2e9791000000b0026c595630dcmr4283719lji.373.1664010698225; 
 Sat, 24 Sep 2022 02:11:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 g11-20020ac24d8b000000b00497a61453a9sm1827234lfe.243.2022.09.24.02.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 02:11:37 -0700 (PDT)
Message-ID: <fd91077b-e4ff-0187-8424-0b83b96588ef@linaro.org>
Date: Sat, 24 Sep 2022 11:11:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 0/9] arm: dts: qcom: rename DSI PHY nodes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/09/2022 11:00, Dmitry Baryshkov wrote:
> Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
> them with generic phy@ names.
> 
> Dmitry Baryshkov (9):
>   ARM: dts: qcom-apq8064: change DSI PHY node name to generic one

dsi-phy is similar to other generic names (usb-phy, ethernet-phy) [1] so
it could stay. Is there particular need for this, like coming from DT
schema?

[1]
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof

