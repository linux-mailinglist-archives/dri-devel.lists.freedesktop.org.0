Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9087A762DB5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 09:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884D810E430;
	Wed, 26 Jul 2023 07:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B5D10E42F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 07:31:06 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99bccc9ec02so11849266b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 00:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690356665; x=1690961465;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AFATkPw4WNwwQSjNQCAVqXgiuGGZcvwhGAlK6VGHVcg=;
 b=BcpDFiy3iJpXA4UlVBeMFnZEGjq//3VTj4/yGEPMX3Y7LmZkyXa+9gqg1HeE30Mwet
 8k5owC2FBZNe8MOVDRU1jiGlvEz0jQeqIdarjxLPjKgBTEmgu3zmweRLwVd7XzE5LLoB
 H4mzZV8tKprzg/66DP8hcBuKrRcqB/k8KvkuWTvWd407zfQbod8kCG0IbEA01g8D8OF3
 HuAbSbX6Bp2K6LWzue5dHJEp9EEi35Fa/3qWqfi/KThCpM4O0Xo2bTj1i5E0yPvVTTZb
 73Wq2oclq+X1FTLxn0Jm7ZOb4kdJAChCRMgt7nhCHUClUQgstiAXlMMR1TBMpIhxICEo
 GjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690356665; x=1690961465;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AFATkPw4WNwwQSjNQCAVqXgiuGGZcvwhGAlK6VGHVcg=;
 b=F2eVkVmKVTYaIlQFRPhbVXzoaTQbY3FpVjnZ+IYGPvubgt8gNl7Kt8ZeY3goBtgNKF
 yH+iQ5qk+hcZ3Sg/af7ltP+Uh1OMpxYM0dQgCMKo7gz0ZEt+WiD8/EfSXb7t9pxlyG4i
 ii2EgPho7ds0Y27KbpsVi/z6fjrmPYY3G6dCzuzmjC7SaYApSVMU7QuVdWiXlw2GP0IG
 89eUE0CBtc+Lhh/EbF9hna5OQrOT8bVsd6v8xLDyhBp+RYasYPhmJ89E1+TopLVRCbbF
 yzWCzo9oBpSAGCUOKH2R+jb66JxROK9bn2YkNtcktINn+4ZQ3Q7BXFlcwJLpj07hifn/
 uS4w==
X-Gm-Message-State: ABy/qLbMKd3W3Vopf8+iQPVeru26ngLkGkJ50qAv7oc17zmj61rubp/5
 p1w4Ts2P8WaslrBva0vVhoJfrw==
X-Google-Smtp-Source: APBJJlGnbLBLUXMT391nVEmLfEYAhyvX0fuvkWBotA8krCIkuARYA7sWsS8AUvS5wFzMVVhMJDp79w==
X-Received: by 2002:a17:906:10cd:b0:99b:cc09:711e with SMTP id
 v13-20020a17090610cd00b0099bcc09711emr309696ejv.23.1690356665190; 
 Wed, 26 Jul 2023 00:31:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a170906135200b009893650453fsm9363351ejb.173.2023.07.26.00.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 00:31:04 -0700 (PDT)
Message-ID: <5576059f-ba53-1096-396e-ccfb5f9d86f1@linaro.org>
Date: Wed, 26 Jul 2023 09:31:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: display: msm: sm6125-mdss: drop unneeded
 status from examples
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230725101610.75122-1-krzysztof.kozlowski@linaro.org>
 <5w2hvzmwzqm4ffopzewveaviebq2ig7awimeo6ipcehx5a43ae@mlwffkf2ctn5>
 <11eca956-9e91-f645-9cc7-4c9f534d9821@linaro.org>
In-Reply-To: <11eca956-9e91-f645-9cc7-4c9f534d9821@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/07/2023 09:27, Krzysztof Kozlowski wrote:
> On 25/07/2023 13:46, Marijn Suijten wrote:
>> On 2023-07-25 12:16:10, Krzysztof Kozlowski wrote:
>>> Example DTS should not have 'status' property.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  .../devicetree/bindings/display/msm/qcom,sm6125-mdss.yaml   | 6 ------
>>
>> This is not needed: it has already been corrected in v3 and v4 of the
>> respective series (among other changes) and the patches were only picked
>> to a preliminary (draft) pull to get an overview of the outstanding work
>> for this subsystem.  That branch happens to be included in regular -next
>> releases though.
>>
>> 6.6 drm/msm display pull: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/69
>> v3: https://lore.kernel.org/linux-arm-msm/20230718-sm6125-dpu-v3-0-6c5a56e99820@somainline.org/
>> v4: https://lore.kernel.org/linux-arm-msm/20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org/
> 
> What do you mean? The old code (one I am fixing) is in current next...
> 
> If this was fixed, why next gets some outdated branches of drm next?
> Each maintainers next tree is supposed to be fed into the next, without
> delays.
> 

Ah, I think I understood - some work in progress was applied to
work-in-progress branch of drm/msm and this somehow got pushed to
linux-next? How anyone is supposed to work on next branches if they are
outdated or have stuff known to be incomplete?

Best regards,
Krzysztof

