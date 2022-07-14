Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BF4574947
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F08B913C0;
	Thu, 14 Jul 2022 09:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F9A913C0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 09:43:57 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id a10so1521750ljj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 02:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wbCsquwN1alwH8J3M5l4Cq/ivX95MU45M7AXoqrgl2Q=;
 b=VDTrfZBM8ClaRXetfV8CdxQ52IOBK9xRGfCl1ywFDqNZYyUfYrotPyc/Jyc9V237jq
 dQTXDJFu29YJ70kaqVKRgMLFp9d2FxNHQa7y0u4ey/KbcZqg/UltpGjY/uF2PvToXPJP
 7oazL/GFF7SdJ04NIjspWjFwsoo4iJ1NiQNi1aMTygLwiwChwtxyb9HD7mBWxhDnUZpj
 zpbqM0JIzN8Cbt5oQ80Czb8RobDEtf/x8WAT5LtaejgrCupwDwwpaSy/Dz5eAnrl+2Gp
 p1dwI/uae5d40inFHeYY1UFLyuct6WfsBXuGryhmhDNa7G8c6jP0NBY0tjlBMO5U9/d6
 BsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wbCsquwN1alwH8J3M5l4Cq/ivX95MU45M7AXoqrgl2Q=;
 b=RdwsPNBd+a/jXxorbZUXf61SkCD5vJaRyfpO0F79DUfgBXsHmqUIOna/6F34kSNkcT
 UPOE/LmHFMWNVF3p6ykR7ksKXc541GQV6EfSq+k5E3WFLY+JGJRx66cJsZGJlbLtTEW6
 M85h/M/2U3Zmmvkienot4X1ol8KF7NQuRNtRX+dBpBav5SI5Abjn2RYnq8TJ6FjFc3tc
 rUDlf2PuO+AHKSvqCZ26wQkJaILFgfPwXNym0LWI94yNx4NhW79xEilbzvPRfKbgFP1f
 MHCMVqf10cexnPtdmg3n45Odo0Us8sj+G23dpBzAz2RdtcONb/6Bzs57lf7nhWIqXeCp
 wd1A==
X-Gm-Message-State: AJIora/B7BiyfN6mG5DcWAgu63q/HJTZkpAcROjclw8uTxJ6nzTv3xzD
 z2mldin4TieHoMyVMVEQ/UPOQg==
X-Google-Smtp-Source: AGRyM1u8QlejMdqMFEqmtkhj/2HQFasgTk3M/jud4cK/2ArinXKI5Fjk/WF8hOCTkbuUXx2INzsrHg==
X-Received: by 2002:a05:651c:243:b0:25d:9aa4:d7c9 with SMTP id
 x3-20020a05651c024300b0025d9aa4d7c9mr1424686ljn.35.1657791835374; 
 Thu, 14 Jul 2022 02:43:55 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a2ea3d7000000b0025bf6099cdbsm191079lje.78.2022.07.14.02.43.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 02:43:54 -0700 (PDT)
Message-ID: <6e47e212-27a0-0adc-40c4-dea272fd2d72@linaro.org>
Date: Thu, 14 Jul 2022 11:43:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 8/9] dt-bindings: msm/dp: add missing properties
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/07/2022 10:41, Dmitry Baryshkov wrote:
> Document missing definitions for opp-table (DP controller OPPs), aux-bus
> (DP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dp-controller.yaml          | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
