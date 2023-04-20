Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D55AD6E868C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 02:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D8510E059;
	Thu, 20 Apr 2023 00:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4BA10E059
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:31:10 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id z38so881359ljq.12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681950668; x=1684542668;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fi7p0X7yko8Mx4oIRrg6YnMb1P1Vd3sNhAz3iheygcw=;
 b=n8o+MuQNehdCavTYlTZeOI9vdjMwDW+cYtyJMDyCO3xHji7UBepRk7TvOjgn4zuB93
 i2Bqs2O0B/H+ir8he/hX/I6mDZRrWT7C8sz54t8o17VPmhZDn0wtmRRTD3tEWJr8RFWk
 g4oLbC/7ovXIoMCaFu5TkcMz/UUDSPjdHYgEHGT6xbMZ4bqo8QsZWHezTXlQ89CuZ1K3
 JBoGRjbHN2pp0Gewe5kyTpdQoTBrM5drdwqtqQmT5emn2x0Qkj9uL+x7x//hAoyPmFB3
 +2uXbVslAToxHXwmiWL+altupL0ZOyGQSEzDdhB68sMAIZPhH508PV7Ue0J7KrnKb567
 AEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681950668; x=1684542668;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fi7p0X7yko8Mx4oIRrg6YnMb1P1Vd3sNhAz3iheygcw=;
 b=dqU5ri7ZpjXt9Iy5ADovyGjW89L26H2NHOL3ojRZ0TjNZmdAsIkdp2P1TxwYLBAbxD
 ABKnbfVnrlgzhrYE+2Yy4Y8P6ugFo46kza9+FuVbkWN+3kAdyyydVTCO0rCTY/VwTFtn
 hAbs7bdDIrOwOZ6CS3KRpkEgUHzvQ+CvjlfJrRTNLaycNfszEBndPwufd7ANZ0ObWhie
 uKX0o5ajtchwGMXEZbXGEF/AaeiXcf3HfcavjBa2bWJzPwh8E1n3wbhaKUef8b/nQPsG
 L/8+/s9uwn5rIv2GHXOi9whIx0GrTv3BrChg2IcAilzX2Su4GtfNm2lQAKKakqFmkYGU
 dRyA==
X-Gm-Message-State: AAQBX9dNNirvqU7NI1sKW0xV2hgWA0YxqiZk7ZeESm274tbYpzOjIIgy
 b/7cSZ1d8+n2dTCUvTdEnY+Phw==
X-Google-Smtp-Source: AKy350ZIFzvoFFdXkm/nOq/57c5CQDUjJmj7zSd2AdJrCfHfyIPD9k7QvTzEC2VbqCTx89kkyxFAwQ==
X-Received: by 2002:a2e:86ca:0:b0:298:9e7b:d07b with SMTP id
 n10-20020a2e86ca000000b002989e7bd07bmr2327446ljj.30.1681950668589; 
 Wed, 19 Apr 2023 17:31:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l24-20020ac24318000000b004dc48d91061sm49743lfh.304.2023.04.19.17.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:31:08 -0700 (PDT)
Message-ID: <023a0e8c-651a-2248-a23e-dee8249a70fa@linaro.org>
Date: Thu, 20 Apr 2023 03:31:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/5] drm/msm/dpu1: Rename path references to mdp_path
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
 <20230417-topic-dpu_regbus-v2-2-91a66d04898e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v2-2-91a66d04898e@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2023 15:10, Konrad Dybcio wrote:
> The DPU1 driver needs to handle all MDPn<->DDR paths, as well as
> CPU<->SLAVE_DISPLAY_CFG. The former ones share how their values are
> calculated, but the latter one has static predefines spanning all SoCs.
> 
> In preparation for supporting the CPU<->SLAVE_DISPLAY_CFG path, rename
> the path-related struct members to include "mdp_".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 +++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 ++--
>   3 files changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

