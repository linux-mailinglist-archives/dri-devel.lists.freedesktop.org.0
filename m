Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABCC5A13D9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 16:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0921E10E39E;
	Thu, 25 Aug 2022 14:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BA010E374
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 14:37:46 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id m5so17852141lfj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 07:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=g63m48g6pKVW9XDR0Qw7L/yMCNONa5W212iG6eOgwVY=;
 b=QqSaNSUp1lcAMQKMVTopIDHEFWnJYAKE4t4Aa214Dxy+p0MWct8ITG7C5Sl2JJ2JR5
 0GDOBulQxXM0y8hmuN23uKUQKHV8YfyC5AAeswLm3mMNfK2sW9XtjHNowDf29xq/HOKq
 Jdo3l5BbVi8Ii6E3dUr3dfblUTxG8Iz0z5g2kVXaPyAeft33yeHngMmkczZK+Bp4jfbW
 ewE6OImRXYuEd/2oeiTgG1Q29hTQvaZOjfMqoMu9lqrTuaDRzofAYUHMcZb+4gcRQB6J
 yNgmIJcQQa/26Cqn5n3l8TZp20/QQnmw6mymfDHDQSd/E81qjWr0JWEQL7Al69Vi/Mw7
 a/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=g63m48g6pKVW9XDR0Qw7L/yMCNONa5W212iG6eOgwVY=;
 b=ELEJncWM15pcvV+CVYOqJ0q521tXdpGTnIa8ExtliZTQ81c2t4kCEHtl+zkIf4amD6
 THmt34plrh57pegTPdEGv3SWwhHo/ab+oB1/NSclMF/wsk4sGoF0a5oQ1lyEkKfTXQIJ
 55zJbpI2shxqF2gv2dr7BxlCxvijDeCmf0wt9a7oqWxqc8Z/TQl4/Bo7f93LKJr3sYOW
 diGhyHBDq1hWP8c1JpEtxi1hpSv57yCp8wYrjwZ23Kh2XIUPwRpK+F8KuKDCd3jEqcqh
 jSdmqwqn1ZugqgSXyJwoxhEwEwN13IkmVvsUgBME/w4B4sZcJkARWLnPUR7B/fidV7k0
 9pHA==
X-Gm-Message-State: ACgBeo2NPY4vQC/1cC1ttqd93BysMqwiD5hU0Mt/3bd41aNZlnByG7Hd
 AaFkFwZaJ/HycGp/vmYFQF/4wA==
X-Google-Smtp-Source: AA6agR7ggezKzDkha1/jrr1gqinbb89IwcfWGyZ+Sycky0YQcHwsYNOUzF9VtkgDcYFWm2wHWG0ozw==
X-Received: by 2002:ac2:4c4e:0:b0:492:e3a0:1f01 with SMTP id
 o14-20020ac24c4e000000b00492e3a01f01mr1186682lfk.465.1661438265047; 
 Thu, 25 Aug 2022 07:37:45 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 f12-20020ac24e4c000000b00492c59a2d06sm525205lfr.164.2022.08.25.07.37.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 07:37:44 -0700 (PDT)
Message-ID: <375daf2f-9b8b-597f-41ae-b5be27e22e80@linaro.org>
Date: Thu, 25 Aug 2022 17:37:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 03/10] dt-bindings: display/msm: move qcom, sc7180-mdss
 schema to mdss.yaml
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
 <20220825095103.624891-4-dmitry.baryshkov@linaro.org>
 <8e0ab9f0-cc27-f472-ce5c-b9f4a9d94005@linaro.org>
 <b01585c9-1810-2f25-d4dd-bea31b685e79@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b01585c9-1810-2f25-d4dd-bea31b685e79@linaro.org>
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

On 25/08/2022 15:40, Dmitry Baryshkov wrote:
>>>     clock-names:
>>>       items:
>>> +      - const: bus
>>>         - const: iface
>>> -      - const: ahb
>>> +      - const: rot
>>> +      - const: lut
>>>         - const: core
>>> +      - const: vsync
>>
>> All these changes point that device schemas are simply different and
>> trying to unify them is not correct approach.
> 
> I'm not going the argue the mdss-common + platform specifics, but please 
> note that these changes are coming from me removing one extra level of 
> depth in dpu-smth.yaml. Currently these files have both mdss and dpu 
> devices, I'm stripping the mdss out of them.

True, it's second time I got myself looking at wrong part of diff hunk.
Still your allOf:if:then grows with different cases. I guess the biggest
differences came with sdm845 and later only children and clocks differ.

Best regards,
Krzysztof
