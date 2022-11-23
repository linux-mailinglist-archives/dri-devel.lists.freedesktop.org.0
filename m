Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D0F636ABA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 21:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D340210E613;
	Wed, 23 Nov 2022 20:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4178410E613
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 20:18:16 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id a29so29743750lfj.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 12:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ecST9nT/YcQwW35//EplrlkRqIWIVC66eBdnZLwwM+4=;
 b=QZQ/jJ7LjkL8hAeYXlFlOg1bxlT95iqex3nxXJ24iN/ZfpuN3mB3zvf2T4zslMD+g5
 mfAYwNdQ5MUD0WvmDjTILGmB+zMgPGuI/FlxGarsrblHRVx7MBK/nLJ4RxOYD2NTjtIt
 0O6YEh/5AfLIrLQvawbJ/bWrFyEYAldFCnTNedKUDQ3c82n1BwVBPztKsvXMujwNaQhL
 1mruzN2ERFvlhdgYLHD9qpYTI5CPlFN3JJjRMvrfDDZZE3DOblGKNG7oBnAdEmm/s03z
 golL4ZLItXDI0sNKPuKdkgp6cwsBWlQi7rS4T/DN8EKetDXdStgx2GF5dKsKBvc5HZIB
 4Jqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ecST9nT/YcQwW35//EplrlkRqIWIVC66eBdnZLwwM+4=;
 b=pFjCQZzKmjBcCFrIyIw9UeMU9dyHtWK/U4kQRLwHQE34KmStLlZCeFR0rSAqeQK7WM
 /cl9sXBz1iEG4sPhctqdoEnQb031ndJlDwDSb1amKY9am0Zx5zFT/4Lk5YcTQvcLXzee
 ybMHNP5CYxqiAWus7DL6p+3+SayCxvPQALVMIT44wsZGM/ipyBcQqj5RzwILg7RUNScC
 7D60yzINSMdD3e8GiaQJ+Y8DSIOAoiAZpCKAM/oeSZWXJg7oDjwRqHKgwJrl3TXmnVsz
 dbhZnq0JIp68BNyePIr5CpzXt51bDoTVjI2QHZk/2yVZpMCVRcUj4fpLdZt+f8hmAjqv
 rSZQ==
X-Gm-Message-State: ANoB5pm+qB8oRzUjAuMHdMuYaucNimOy8JmH5wdVqReVK1/dRxCu46QE
 cLawliTTKu4TJo56g13eA/M2aw==
X-Google-Smtp-Source: AA0mqf4BQ4FuKuZDygKHET70fMHELwqB+ogCPgJHghJ08EZZIhz4651jCGxWeDveGnGlGKWQHheJXg==
X-Received: by 2002:ac2:43d9:0:b0:4a4:3059:af15 with SMTP id
 u25-20020ac243d9000000b004a43059af15mr4353327lfl.258.1669234694420; 
 Wed, 23 Nov 2022 12:18:14 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v17-20020ac258f1000000b004a03eb21c4fsm81985lfo.288.2022.11.23.12.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 12:18:13 -0800 (PST)
Message-ID: <5fd29bdb-c93c-fa77-19ce-175fbfb8e639@linaro.org>
Date: Wed, 23 Nov 2022 22:18:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 03/11] dt-bindings: display/msm: mdss-common: make
 clock-names required
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
 <20221122231235.3299737-4-dmitry.baryshkov@linaro.org>
 <40d5c7f3-148a-a5fa-fdf7-6fd301ec3a2d@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <40d5c7f3-148a-a5fa-fdf7-6fd301ec3a2d@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/11/2022 12:19, Krzysztof Kozlowski wrote:
> On 23/11/2022 00:12, Dmitry Baryshkov wrote:
>> Mark clock-names property as required to be used on all MDSS devices.
> 
> This we see from the diff. Please tell why you are doing it. In some
> other recent bindings we dropped clock-names from required, so this is
> confusing.

Thanks for the question. It looks like you are correct and we do not 
need clock-names for the new mdss devices (only for the DPU devices and 
for the old qcom,mdss binding, but it's another story).

So, I'll drop this patch from the series. And for the next cycle I will 
check whether we can drop the clock-names from existing dtsi files (and 
from schema too).

-- 
With best wishes
Dmitry

