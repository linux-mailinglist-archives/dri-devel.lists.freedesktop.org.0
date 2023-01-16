Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D13066C211
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 15:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B032E10E44F;
	Mon, 16 Jan 2023 14:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B990B10E06A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 14:18:40 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id br9so7635891lfb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 06:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=slDvNSXAJAnJLiEBukDiWieNTlz1AsAaE1WqqEMwQIQ=;
 b=ShC0ZOWyY8rS2sZui0cQWppHUDXFiAB3Kexyg0zzG5TBH73fw0ck3aNHoG+s04F31f
 qlawK3OhURIbgn0M1vLuL84r3kWgY3Eb6ma6raj53cnq7RkSWvIJ6zltENXFQSGDBbE5
 r7D+HksV9NM52wn7aI2eJTRrbyKGVJiQln9rPjQ7xYvsJW0FzEBAebD67IiohNJRhE5H
 t3aj/VAGKcw3am77haZ84qmlZODePFqqKIupgMVeI2hr21GyKYnUaMtX79Md29lo3bk0
 ZvLpWgkRkPUkeLBOzcy9XXRLg5MEOateBpfRDRiIr/bXbvlZHlrkY+W8ecXUOmNOd96G
 IIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=slDvNSXAJAnJLiEBukDiWieNTlz1AsAaE1WqqEMwQIQ=;
 b=YBZ84kPgjExfv7qOiYtOg0FowKJs6lXo/DxMhhRpxNCM5LpoLveBcpGl6Gjv+Chvlg
 GAxi42ngEFwS8Mg57FgfARxE9KJ+R+iQICNo8tmkUXMpVext2d06iZpYHFHyumTPXbFH
 0oxXDd9nfailpYzYI3jozAR3LMYwKcIT+Cq8O4g8zaLsnortSe9B/p/PdmT3CWnpFNbN
 rR290xOgbm5ynvVu2EM3gkPF6ZEbD3ig6H7M1A/pu2zCAMuydpW34YFNI1FmKdQk81FP
 RfiPRSEmpiEdpAt0mPfPK5hRsfMmkjUOuHX7LDlnIUzT273iKC5xUrhf0q6l6FoK0pv5
 nfzg==
X-Gm-Message-State: AFqh2kqyu7ne8BuhQGTRvXRvxqfsygs9Na4s+xA1jOjc9iwkF+IM6G8W
 iPSaopKltVLkcQOAZJqQfan0UA==
X-Google-Smtp-Source: AMrXdXtm9IhxsXuJ3onLpyyBzZemmPaIMqa9NXW78S49UorNPyK233cYb/xj0vlWalHC+tSq3XtAaA==
X-Received: by 2002:a05:6512:3ba1:b0:4b5:8fbf:7dd6 with SMTP id
 g33-20020a0565123ba100b004b58fbf7dd6mr39391026lfv.61.1673878719081; 
 Mon, 16 Jan 2023 06:18:39 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a056512118500b004d57ca1c96csm218388lfr.172.2023.01.16.06.18.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 06:18:38 -0800 (PST)
Message-ID: <e0230675-9451-f5d7-b85e-15066d611fe6@linaro.org>
Date: Mon, 16 Jan 2023 15:18:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: msm/dsi: Don't require vdds-supply on 7nm PHY
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230116115132.348961-1-konrad.dybcio@linaro.org>
 <CAA8EJprNzLMnU7cguMit6Y4sgU0-SOkiiL+=s_BFBZiyvNvsAw@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJprNzLMnU7cguMit6Y4sgU0-SOkiiL+=s_BFBZiyvNvsAw@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 krzysztof.kozlowski@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, agross@kernel.org,
 dri-devel@lists.freedesktop.org, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 16.01.2023 13:52, Dmitry Baryshkov wrote:
> On Mon, 16 Jan 2023 at 13:51, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On some SoCs (hello SM6375) vdds-supply is not wired to any smd-rpm
>> or rpmh regulator, but instead powered by the VDD_MX/mx.lvl line,
>> which is voted for in the DSI ctrl node.
> 
> I think we should have an explicit `if compatible then required:
> vdds-supply' clause. WDYT?
Well, the driver will still probe and function without it,
so I'm not sure if it's strictly required..


Konrad
> 
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> index 9c9184f94c44..8e9031bbde73 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> @@ -48,7 +48,6 @@ required:
>>    - compatible
>>    - reg
>>    - reg-names
>> -  - vdds-supply
>>
>>  unevaluatedProperties: false
>>
>> --
>> 2.39.0
>>
> 
> 
