Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A8B6110FA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 14:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120A910E823;
	Fri, 28 Oct 2022 12:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF80F10E81C
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 12:14:30 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id g12so7998824lfh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 05:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BKq/BAGmscRdIakGFeHMFgaXLKmHS1XLU04+kzk8aUs=;
 b=mv0vzwMwoeoZPKSMypkyY+Zixy9IODdXpl1NaNgcwFr13k/Cq3iR5BWo2kftrQBv2I
 xq3dclF155wKsn4N/Ai4J63MUjsPzDyF8g9bUERvA6OQn63WM2qVUcpiRRcX1/g/T3JT
 0mpwwlsXkLy0VqTUCmtl/E2kXwWDazMjjJp0kvIhQu3+NofIePwF1G0E7lKYAflMm8nL
 35rtBStM1Mzd0GvnlN++VAzHn7rUdIfUvi7D+5H1T7NGpwXkCNGOwuAaTpNW7utfQuw0
 GuHdIdeI2PYbRCLMw6j+DTyUn7duJp4b8zhRhCDbfFshKnWFcbji4WXU+TJD8lBq9vOW
 BGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BKq/BAGmscRdIakGFeHMFgaXLKmHS1XLU04+kzk8aUs=;
 b=v+YiCnQcBY8uvqkDwnVbWv7J5DA700ySAXxVkLMQKeyzES9EgDy+c4ap2hjnD3mLdz
 30C2eltcbzKIkDa3HF5b9cFlfqjaEaMBCkAN/On+CKoRZqA3uRirGvJgDUwhJ0t5dhY7
 ckucWYsuiEuhjHitp4VHpxoX9KQVAjP5e5xjQnSFFyb7eHiZ9PRj4vKztbmyDY44Bpgn
 F/4bpL1Lf1BWM5bOU+kSQBCqbyqZv61bqQ3pjzE3sx2O1Ipoq1wgdI7eDgMPHDlcTJjG
 7ZgAEPILjh0hDHfblw5VAjOs7qMEyrlarZnuXvfufins8K8q16ERZ6tQxE89wfoPE+aS
 Kd+Q==
X-Gm-Message-State: ACrzQf2fNXl9yuYvTsEHY1q8QQPh5sP6rPw6/3pl91eAPhV8NzttzSid
 8iWInkJ4YUi0Ie5sOxKn7R2l4g==
X-Google-Smtp-Source: AMsMyM4eQd3Q/pRYd6iLWMrAfdgYq54z9EEnAEBplA25vQFQtwxb0tbZEkLhPVoctzD6fNHh+Ia1eQ==
X-Received: by 2002:ac2:44b6:0:b0:4a2:5084:6163 with SMTP id
 c22-20020ac244b6000000b004a250846163mr19435844lfm.446.1666959269207; 
 Fri, 28 Oct 2022 05:14:29 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a056512324b00b0048af3c090f8sm544422lfr.13.2022.10.28.05.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 05:14:28 -0700 (PDT)
Message-ID: <9cde097d-2cec-7222-7e38-efefc4ad1c94@linaro.org>
Date: Fri, 28 Oct 2022 15:14:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 2/9] drm/msm/dpu: Refactor sc7280_pp location
Content-Language: en-GB
To: Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, quic_kalyant@quicinc.com, swboyd@chromium.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-3-robert.foss@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221028120812.339100-3-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/10/2022 15:08, Robert Foss wrote:
> The sc7280_pp declaration is not located by the other _pp
> declarations, but rather hidden around the _merge_3d
> declarations. Let's fix this to avoid confusion.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

