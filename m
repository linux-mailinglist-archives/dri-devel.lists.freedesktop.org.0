Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EC45E5BBC
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B119910E0F1;
	Thu, 22 Sep 2022 07:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1116110E2E1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 07:00:18 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id f9so13125455lfr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 00:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=F+tYa9zG1lEz617SbvngqftXLaVi28EmvGiziMctOWA=;
 b=GUr6AfDiziyXpZFDo1lckv4EK92Agh702QscLWhBfml0UQOwiXImKv66Kop/VDjvhm
 9TB8TccZCVqJM1aZdPGqEHy1mgB6Vmjg1FCCG2jsaKJ1tMpwnTqCaONo6iyq/TIGPHI0
 mo+gwqFa1nnoW+y30foJtznHKO3wIzYLNJolQCj/gUgfn0qTqYNPCw8UTH0bjFV+j+wK
 0j3SASt1XOVTcJ0lYZRH80faZuZuUwtWOkVFgBs/AWDyxG+G/V+rDQAxftgvR9I4jJtd
 yiFvUhS2gwMc1VuxUCyHehbYC2sHkxeB1JqxE/toCF0X+mj+wox68ZD2/EBIzC7MCHWG
 KA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=F+tYa9zG1lEz617SbvngqftXLaVi28EmvGiziMctOWA=;
 b=ywcIc17YhHazNf2oPgIUcbtwRv6pa24xdIp7ZNbVMXfofko+7dlik4XwPySaCXH9Y/
 PrQo/o4lHACXpBOfl32PwTA4XdQDwc3pvJfxgqGpfpBF0PSPa0a/ycYiquH4fQp39/Kb
 o90Fu2JiTHiGJrvY7j6kGeiaNG8nNLv89W4D9yIqWLuWnm2AZw7r+u8EtZg2qy4/J5dA
 6/6HxYdKOeAAPcFr9AOOOGOjwLJ0llIARnfKIADK0/QUBnpi8RmG00DhorX/698aW7Mp
 Xg+rTFmnEibRlXea7c3/QMHvLsfRJvKIGk76PUFJkYA2zrJnTH6fiTFSGY5erS/1LFN3
 WulQ==
X-Gm-Message-State: ACrzQf3cfXT5pu8s3EZQtvrsIQdSq3rDkhNxF86G9TZj4HqgirLz1nNE
 RyvpKjf9/4RtQeicNTPyGSFAyQ==
X-Google-Smtp-Source: AMsMyM4NFnwhRolh2/Vt3iMiCzs/YdAOUEnk9u91PyaZBajjR2brSQsIVTqDWLw01sixGhZY81z05A==
X-Received: by 2002:a05:6512:3d87:b0:499:f2b6:7021 with SMTP id
 k7-20020a0565123d8700b00499f2b67021mr635925lfv.103.1663830015901; 
 Thu, 22 Sep 2022 00:00:15 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 e2-20020a05651236c200b00494791fbd80sm776792lfs.307.2022.09.22.00.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 00:00:15 -0700 (PDT)
Message-ID: <8fea89eb-ed50-2b2c-ec00-5b9fb20b7956@linaro.org>
Date: Thu, 22 Sep 2022 09:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 03/12] dt-bindings: display/msm: add interconnects
 property to qcom,mdss-smd845
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-4-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915133742.115218-4-dmitry.baryshkov@linaro.org>
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

On 15/09/2022 15:37, Dmitry Baryshkov wrote:
> Add interconnects required for the SDM845 MDSS device tree node. This
> change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
> Add interconnects property for display"), but was not reflected in the
> schema.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

