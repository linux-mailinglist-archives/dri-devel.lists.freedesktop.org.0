Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99A759C4C8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 19:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1E49A778;
	Mon, 22 Aug 2022 17:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41E29A682
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 17:14:03 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id n24so9211244ljc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 10:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=tz0j2pf87w5WDgyn6bI1nYe8CCFyc7tqWxzOVvSy5yA=;
 b=bMCoqFUFRDRcnLvuZWIWvV56U00hHyXhKR/B1t7o6r54jBUgfV7m42RYzXiuemjAgy
 8VrqRmwCp3zjEG00QJMPTUrDyO3yCtW/B8c+EXJ8MPRfFp2AUVDysnNw+lcDBQW3Gf6Z
 NwqzL0Ig4cGzYOkOTJ9/iamTuRPReDlpCyJgHAlYk2aZAsXdmAqoYLF1IRdbtK8on/kP
 eQtDJrO1uGBhOA6/yY5XpTh/nVGT67zLtP5ANGUf2R1eUprI1CBhRBchBBq/+vXXV9X5
 iL1hpo96/UVpmDpEHdR3oNMpb7LvnMYhzjaX89pl1NDGKJS7tESYSJaxaJ9EM1aeTAtO
 iqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=tz0j2pf87w5WDgyn6bI1nYe8CCFyc7tqWxzOVvSy5yA=;
 b=B+Hag70s/ZCYsJeAhkGjY+HEh+Sy/T+vz9RQErwFnuLysLpsg1jZexqUAzRNakZEYK
 lRG9wlqDi1eYOEex1RJHv4tG9MDISQmV+tRBPmlFZA645EXuF2++1gJ+YCVtaO7F3Fit
 hMiaswSuSmSMiW1/UHd5IebRKKo7cJ/9wbaauEKIGI2ExMkxW9YDPxt8hVv+7CL94CyP
 r70oRMN23iW8FH9mzlE6ipu3ywLdhHeso4KxuMmm+o7VZqU/moF2Vb09x+vIiwyVmwxg
 BEYJH5b5aIDoACEaxrQnNWQNU39QNiaQcQVo70Iw91Sk8UuNGf8EQpoHMWKKn6UpFhry
 FhRA==
X-Gm-Message-State: ACgBeo1P6KkTPsoLVCL1Ezhsz71FTsrwmsAwKDhutW6F4DhLjSLHv4rJ
 Pst4rkvkbG/rQMOLt+U+E7r7Vw==
X-Google-Smtp-Source: AA6agR4U2zYSyYPBPPu79ExcvuOqTDFUMXw12tok1EyJWkv5IwwycdoPuWKbIRu+wwZLauHCRuEaTg==
X-Received: by 2002:a05:651c:1503:b0:24c:81df:e1f2 with SMTP id
 e3-20020a05651c150300b0024c81dfe1f2mr5730733ljf.182.1661188442236; 
 Mon, 22 Aug 2022 10:14:02 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a2e93c4000000b0025fe7f33bc4sm1911981ljh.49.2022.08.22.10.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 10:14:01 -0700 (PDT)
Message-ID: <4a5a664a-2ada-5657-9dc1-a999230d798d@linaro.org>
Date: Mon, 22 Aug 2022 20:14:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v4 2/6] clk: qcom: Allow custom reset ops
Content-Language: en-GB
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>
References: <1660927246-11327-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220819221017.v4.2.I75baff799a363bbb960376539e3a0f737377c3f1@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220819221017.v4.2.I75baff799a363bbb960376539e3a0f737377c3f1@changeid>
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, Andy Gross <agross@kernel.org>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/08/2022 19:40, Akhil P Oommen wrote:
> Allow soc specific clk drivers to specify a custom reset operation. We
> will use this in an upcoming patch to allow gpucc driver to specify a
> differet reset operation for cx_gdsc.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

