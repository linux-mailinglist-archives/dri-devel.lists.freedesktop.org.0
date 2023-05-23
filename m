Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA2470DCF6
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 14:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE4510E435;
	Tue, 23 May 2023 12:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF3110E092
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 12:49:37 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f3a166f8e9so5955223e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684846176; x=1687438176;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8AW95x05Cs7zVCr4QZ0d5TByJ9+4cDZxrEBugpUgmSY=;
 b=laSO6aKQAHp0nBr6G42Lzz/F0emre9Xgk0mzDLxNepoaYFbG1nIvG/RLLXxRu1i0y/
 FValRxDzMhJ4w2SvG6wfzGrpDkYeeVIkOFsE0qpiWn/mKK71ACXG++olvlvkXxry4eCu
 WNB8jzeMo75MXlsloTAdGWuCEfoRfjzAGWOyXg2vj7flWHe7aBmsvaWMqwNG2NrldkSR
 6FrKNU+rsWHs9+nL5Awnz3mm2UG5g6m5o1iPmmCKlTH177b6bQGD5Ie8GHKXRtQSrAuu
 ekLS0Sc2KTi+Uru9T4R0+EB9rydXtQnG41KEMigp+lw3ZrAwSz9VI3WcR99nmP5M3rV0
 PFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684846176; x=1687438176;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8AW95x05Cs7zVCr4QZ0d5TByJ9+4cDZxrEBugpUgmSY=;
 b=MIH4fTHRXwbWAXeCO5odEHJBDTQ05+eBwmBcWrgpWW1RFrxk+Gtc3LI83wRGXc7JHo
 iajykCOfbaWv9YQDFDOCConpK3/mHYlo4x6bFbIbFe/yZxp+nY6OaC8nwSrgCIT4bbXk
 ENZoxPh0plIqoHrWNkYTZxC+AGlCXHI96PWOqbyN/zClodPcxl0bewxNu/XcXakdb6aO
 6y74Yv6DTPq5HO2acf517NB2esc+qvN33M610M97DIyqLJbv0/anZTzSc4vRI5pkHyL7
 /0q+0z+816Ed8tmJ/CxqUfSSA/u3JBva+wG5fy61M7FWtqiKZsL/yV7GNVc1bOO6VYit
 p+6Q==
X-Gm-Message-State: AC+VfDyyTjHxxnTwQz1Mb5JSmxy8yemm0O/NGb8HTNGsxcO7PTbC5Ir6
 6Qbdo66EglMQXl5DjPeC4uc4IQ==
X-Google-Smtp-Source: ACHHUZ4vQUyqJnd5wFhpaqBfNVnWxMU8Lk+Da0svhgAJtF/dZWkT+TX10Z9dWGSspcpv4J1osJQdsA==
X-Received: by 2002:a19:f816:0:b0:4f1:4074:b4fd with SMTP id
 a22-20020a19f816000000b004f14074b4fdmr5297479lff.29.1684846176105; 
 Tue, 23 May 2023 05:49:36 -0700 (PDT)
Received: from [10.10.15.175] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a197502000000b004efee46249fsm1325560lfe.243.2023.05.23.05.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 05:49:35 -0700 (PDT)
Message-ID: <7db11395-3b57-70ff-dc7e-acf8d8d4b1b8@linaro.org>
Date: Tue, 23 May 2023 15:49:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 00/15] drm/msm/hdmi & phy: use generic PHY framework
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/05/2023 15:14, Dmitry Baryshkov wrote:
> The MSM HDMI PHYs have been using the ad-hoc approach / API instead of
> using the generic API framework. Move all the PHYs to
> drivers/phy/qualcomm and rework them to use generic PHY framework. This
> way all the QMP-related code is kept close. Also in future this will
> allow us to use a common set of functions to setup msm8974 HDMI PHY,
> 28nm DSI PHY and apq8964 SATA PHY (which all use UNI PLL internally).
> 
> This also causes some design changes. Currently on msm8996 the HDMI PLL
> implements clock's set_rate(), while other HDMI PHY drivers used the
> ad-hoc PHY API for setting the PLL rate (this includes in-tree msm8960
> driver and posted, but not merged, msm8974 driver). This might result in
> the PLL being set to one rate, while the rest of the PHY being tuned to
> work at another rate. Adopt the latter idea and always use
> phy_configure() to tune the PHY and set the PLL rate.

Forgot to mention that this also features msm8974 HDMI PLL code, so 
modeswitching HDMI output on msm8974 is now possible.
-- 
With best wishes
Dmitry

