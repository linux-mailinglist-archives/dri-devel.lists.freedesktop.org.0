Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF23F6BE3BA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F9B10E0F9;
	Fri, 17 Mar 2023 08:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30C510EE87
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 08:34:52 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id h8so17359633ede.8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 01:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679042091;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KIfNmjlP/emZ8VU0HYeaktKYqZYSqV2w6X7O7md3pTs=;
 b=wRZi0OVE5sRJZF8H5ne08hNllrwQSaDe7kgGBEhqxrCYqeQtS1DYfaDBWAGYGhRX1g
 9eEESgI7jotBiXvy9PDWwIfXCEKC8O+x7dZ/YPmU1MCK1MCJIMOR9TkKDyWw/ceoJbsi
 CLFpbkrE7zninvqToDa+UVdyqbScL/is+LHeiOC3sosKRFDnOvAmka/sy408NQYE3tWs
 MkLZgpqpYvAJk2+H4jiP/ACpWPtEVBdncsHNeZW1wMSZZ1HVQehNcQdVe5MP0iZl2PT7
 4ObHyUQsq6E+ghbdkrTFTOnkEqP6x7JrTtCt8Ai9gLXefM1p8G3Z+rWtt2v+8H17cf70
 +W5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679042091;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KIfNmjlP/emZ8VU0HYeaktKYqZYSqV2w6X7O7md3pTs=;
 b=6M+H3+okCkxfJjxNtKDTASAkVLTgBi/ASSdxn6dD484JrA1coUJhWxLuwdgLQ82cXw
 l20pxaIDIoyCLz6DMG3iDJ7Y2LRicWkitZa5toocPKqTodoVrs4EHw7KgKjyES3ZX98N
 iLxZ8yXrIM/Fg7pyqXCt+L4R6CyhTkq5iM+JjI1naWPFvmAWiOPOQ/zBL+TN9uVPYWYw
 +ZU3nrAMl6dSoLcdakdYYFSnoSXPalo0jg9wCzXWjyTQK9Pfmpf5fSg948EuY9NBIe3d
 V87yojwIEXedxdCD9EaUh3KEwL9uGA5a0utqp6ZFTbAGoDInSm4QqS0RygEzjldx1WwR
 BSfQ==
X-Gm-Message-State: AO0yUKVGnjd88EaGMNJwrYbTNi+UyKRDkTDh8zhkNqDCVhnIK7FRJOj3
 /KJ34QMMFYXky9jXeBJ8vIfLkw==
X-Google-Smtp-Source: AK7set9oeh/k8QPKvi6CFkwTq2accUoCK8wDEQMIU95iWYbYqUoF32/8ClKQOzwcdKOzOdUC1XZG8w==
X-Received: by 2002:a17:906:568a:b0:931:d8db:8a2f with SMTP id
 am10-20020a170906568a00b00931d8db8a2fmr1352054ejc.58.1679042091136; 
 Fri, 17 Mar 2023 01:34:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465?
 ([2a02:810d:15c0:828:848a:1971:93e0:b465])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a508717000000b004af6c5f1805sm727970edb.52.2023.03.17.01.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 01:34:50 -0700 (PDT)
Message-ID: <423d0cd0-ba3c-d163-6005-592a9d594bf3@linaro.org>
Date: Fri, 17 Mar 2023 09:34:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 08/10] dt-bindings: display/msm: dsi-controller-main:
 Fix deprecated compatible
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
 <20230307-topic-dsi_qcm-v5-8-9d4235b77f4f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v5-8-9d4235b77f4f@linaro.org>
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

On 16/03/2023 09:51, Konrad Dybcio wrote:
> The point of the previous cleanup was to disallow "qcom,mdss-dsi-ctrl"
> alone. This however didn't quite work out and the property became
> undocumented instead of deprecated. Fix that.
> 
> Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---

You have warnings caused by your previous patch and since you fix the
same commit, this should be rather squashed with #1.

Best regards,
Krzysztof

