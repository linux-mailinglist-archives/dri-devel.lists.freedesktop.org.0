Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAAD56D046
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 19:00:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B56814BCDE;
	Sun, 10 Jul 2022 17:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F1E14BCDE
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 17:00:43 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u13so5277216lfn.5
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 10:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z+025bwtj1+XxqfJAYSywQz3zfNZwf8KlNReu6sIH04=;
 b=r3SWgrDqeFIihjpgWX1tGqhS9nvKTMAMwhpH+U4sAOXaUvV9tjewn2dLBHPTMq+GTs
 Ff2uJT7icSDEVCN/UYDLjVOMYKdU/iezSVoQtEmn8xcy3U0YiSIeA9ug+I1y7L6ZUzPT
 QEl3dFzenx2BBNwis/oW7FiSmEhelbQZjnk61dx6cm28RBjI5yZc5brc9zFaArLGqP83
 5atpqkhw3etHGTVclLy7WhUWAdOdsubJwxjzNT7WchU0tzoHl79G7MSVYYcNuMYQLLNY
 flT7yNC4yKbSM1ZQd31FxPechG9moAl22MNKSMzPsbdgAoh7uVFXUIh08H2sqRK1CGJl
 SXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z+025bwtj1+XxqfJAYSywQz3zfNZwf8KlNReu6sIH04=;
 b=ovif8SPbilqY2clXlDjzlTVyvRKGuX2/lRcco2+yGLxqyv3i3LfA/U8Wg0/MowlTeh
 +jd/OHwKfFG4lhXTInBHljKzS5wtklAT8s3c9TLzTq1xjPZNq1DLqD6U+1HvFQdlCSOF
 hMhhyVWVJpMrQZ6TY4X6HN6JHfFICDWSL6vBhjNTbvQB0tdVklGee1stIiuPOvs6iRBh
 08ktIP+d9ja0iwIFrqjE/LEchDcbvC/ulARqdKAJNTQ5Mtm+HLPboQ3tmJmfdJZL8118
 0VYN7CGc4n+RL6PpGW5/jMtaWxs6x3jHlUxFGn3NOlsrmcYQHrrL1Zsm1bgBKWGgKHF9
 WbBA==
X-Gm-Message-State: AJIora85rkNuwuRBI3n3h3k0XgppzriZZ/5A/BWgr5GDkBRh3NW9NKfv
 nWXeROFWELDyYoWTQzNmT2fQsw==
X-Google-Smtp-Source: AGRyM1sjRnBSq/F0i1b5lkm7tuWeJt24tjr1ryEGRO6bsTBrwKL2G8G8JFM5hXn6oM8WNvELa38Rbw==
X-Received: by 2002:a05:6512:1096:b0:489:cbad:de4f with SMTP id
 j22-20020a056512109600b00489cbadde4fmr5557082lfg.164.1657472441640; 
 Sun, 10 Jul 2022 10:00:41 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.65.244])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a19a416000000b0047968606114sm1005525lfc.111.2022.07.10.10.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jul 2022 10:00:41 -0700 (PDT)
Message-ID: <20269855-766d-4954-b6aa-bcff6d67c967@linaro.org>
Date: Sun, 10 Jul 2022 20:00:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 04/11] dt-bindings: display/msm: split qcom, mdss
 bindings
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-5-dmitry.baryshkov@linaro.org>
 <1657472056.252419.1602129.nullmailer@robh.at.kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657472056.252419.1602129.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/07/2022 19:54, Rob Herring wrote:
> On Sun, 10 Jul 2022 12:00:33 +0300, Dmitry Baryshkov wrote:
>> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
>> yaml file. Changes to the existing (txt) schema:
>>   - Added optional "vbif_nrt_phys" region used by msm8996
>>   - Made "bus" and "vsync" clocks optional (they are not used by some
>>     platforms)
>>   - Added (optional) "core" clock added recently to the mdss driver
>>   - Added optional resets property referencing MDSS reset
>>   - Defined child nodes pointing to corresponding reference schema.
>>   - Dropped the "lut" clock. It was added to the schema by mistake (it is
>>     a part of mdp4 schema, not the mdss).
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/display/msm/mdp5.txt  |  30 +---
>>   .../devicetree/bindings/display/msm/mdss.yaml | 161 ++++++++++++++++++
>>   2 files changed, 162 insertions(+), 29 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> ./Documentation/devicetree/bindings/display/msm/mdss.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/phy/qcom,hdmi-phy-qmp.yaml

The tree is based on linux-next (well, msm-next, which is a part of 
linux-next).


-- 
With best wishes
Dmitry
