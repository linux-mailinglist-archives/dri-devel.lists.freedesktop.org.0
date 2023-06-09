Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B7B729469
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 11:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F85710E667;
	Fri,  9 Jun 2023 09:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E6410E663
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 09:12:58 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f62b552751so1855216e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 02:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686301976; x=1688893976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CVfeus2+E5nD4MhpBQlXT0XxTlLQBPr9RISFV3RUGtM=;
 b=AN2CvSTAcyzxxXP5A80X6hk1bPtbBj4syuSk+akZk9+eiMcZcPN8HFIud39D1yRw5j
 Bk3J1djy8D/1haJgaOh8Ki6MkZGfa5ZitdW3+q9aJQmewUuzxuHpjMbA4ElnlPcOzzIe
 sQk4UTDj6b8Sb2dwOnmXAOFVK6TiyKo585/vPx48ht8qGe46M4zEXfEEtjwcd3ig2Xeh
 vbelghPdA55FJPH/ZGDrnva8eqZt2uEwePGFEU8G1hz9f4ehbR6gZI7IXv1ig25undMr
 7cCeep92+CS2qdS/nTQoZDeQRpBpS1jy/wKKK4i2yomM17QL5rXIbgDq36l8T7r/sUgA
 VQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686301976; x=1688893976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CVfeus2+E5nD4MhpBQlXT0XxTlLQBPr9RISFV3RUGtM=;
 b=U4k+XJbPM4EBuazTeCLW5zQIMbifPu8RFtKgknrm1UfNtaE9A50AUtOfLlXRzX/kDM
 SasygleGGDxBPMn33WAfYLeLgJFwJZH/+3cJ6NSepLW0+GLqPmOkCQpaNwyvR8OlU1hd
 IfQW/akToqjWhWGLk03ad6iu2AUmcb71gIzDAx3KEQ1fSmAMQoBucJ1BW24uQexec42g
 JmzBP/OaO8MF5y5BOLqEFXSG/QcV9tvFCPbKy/aetkbU+H4l5mpkQxZa7qTAND4hpQAR
 eY1ChaF9OPes227gXLYb6D8kkYqx9tZ4CI7WdimRnvt0uTnpIeoRbueCwnJOmbNC8CaX
 QyaA==
X-Gm-Message-State: AC+VfDyLpaSngdtyrJBaqx61TE17+Wrf7BzUNsxkioi61gjRrnCCAval
 73GPYjeFo4+JvoxsQ7nZC/zRaw==
X-Google-Smtp-Source: ACHHUZ5TX+tKPeytqOB6c1Nsnr7i1EoxWIdysEl5KLLT0ilTcM5fc1peAWtmRZn28O+QIzBawagDGg==
X-Received: by 2002:a19:660a:0:b0:4f4:dfd4:33e7 with SMTP id
 a10-20020a19660a000000b004f4dfd433e7mr425372lfc.33.1686301975825; 
 Fri, 09 Jun 2023 02:12:55 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 q26-20020ac2511a000000b004f20d0ebe50sm478422lfb.94.2023.06.09.02.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 02:12:55 -0700 (PDT)
Message-ID: <7ed52f34-b53a-09f8-4d51-dc5ca41827ce@linaro.org>
Date: Fri, 9 Jun 2023 11:12:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v8 01/18] dt-bindings: display/msm: gpu: Document GMU
 wrapper-equipped A6xx
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
 <20230223-topic-gmuwrapper-v8-1-69c68206609e@linaro.org>
 <20230530122652.lct6tk6zseny6gxl@krzk-bin>
 <1ceeb56e-3efd-6858-358a-bd1976c625b1@linaro.org>
 <20230608205848.GA3424883-robh@kernel.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230608205848.GA3424883-robh@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8.06.2023 22:58, Rob Herring wrote:
> On Tue, May 30, 2023 at 03:35:09PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 30.05.2023 14:26, Krzysztof Kozlowski wrote:
>>> On Mon, 29 May 2023 15:52:20 +0200, Konrad Dybcio wrote:
>>>> The "GMU Wrapper" is Qualcomm's name for "let's treat the GPU blocks
>>>> we'd normally assign to the GMU as if they were a part of the GMU, even
>>>> though they are not". It's a (good) software representation of the GMU_CX
>>>> and GMU_GX register spaces within the GPUSS that helps us programatically
>>>> treat these de-facto GMU-less parts in a way that's very similar to their
>>>> GMU-equipped cousins, massively saving up on code duplication.
>>>>
>>>> The "wrapper" register space was specifically designed to mimic the layout
>>>> of a real GMU, though it rather obviously does not have the M3 core et al.
>>>>
>>>> GMU wrapper-equipped A6xx GPUs require clocks and clock-names to be
>>>> specified under the GPU node, just like their older cousins. Account
>>>> for that.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>  .../devicetree/bindings/display/msm/gpu.yaml       | 61 ++++++++++++++++++----
>>>>  1 file changed, 52 insertions(+), 9 deletions(-)
>>>>
>>>
>>> Running 'make dtbs_check' with the schema in this patch gives the
>>> following warnings. Consider if they are expected or the schema is
>>> incorrect. These may not be new warnings.
>> I think it'd be beneficial if the bot diffed the output of checks pre-
>> and post- patch.
> 
> Fix all the warnings and it will. ;)
Nice one :P

Care to donate h/w to run the build 
> twice every time?
Personally that might be a bit difficult, but I'm pretty sure KernelCI
farms don't run at full throttle 24/7, perpaps some of their capacity
could be borrowed?

> 
> Really what I care about on these is when I keep getting changes to a 
> schema and the list of warnings remains long and not getting fixed.
> 
> This case was less than useful with just the oneOf warning.
Ack

Konrad
> 
> Rob
