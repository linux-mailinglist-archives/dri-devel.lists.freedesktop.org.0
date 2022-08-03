Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6E4588A4B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 12:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1CC10F075;
	Wed,  3 Aug 2022 10:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9488310EB9A;
 Wed,  3 Aug 2022 10:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659522040; x=1691058040;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=r2r9v+zdOXg+pjOV8cZBvnLP+wof+DIDY7ngC/evlew=;
 b=nI6CmUYF+L+HRqtoMK5mw+dZjNYzj+WaAYDW42sX4RyZ1T4EambATqdD
 sdH3ZMj/Eteco2eqaM/nYM6qSoRDpvLzBoeOGq8Uyq/jYEFVFx9BPDiBp
 pSzsjrr4tpS5O3/j2IF4JQjY2Wvn2qKdCd+AtoAzv2PowBbPvFMD2ccoC Q=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 03 Aug 2022 03:20:39 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 03:20:39 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 3 Aug 2022 03:20:39 -0700
Received: from [10.216.24.92] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 3 Aug 2022
 03:20:34 -0700
Message-ID: <624aaad9-8937-49d1-9e66-38713b5a1f0c@quicinc.com>
Date: Wed, 3 Aug 2022 15:50:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 3/5] clk: qcom: gpucc-sc7280: Add cx collapse reset support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, freedreno
 <freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, "Bjorn
 Andersson" <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220730144713.3.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
 <9098554e-5327-0b7f-f4d0-a81880556136@linaro.org>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <9098554e-5327-0b7f-f4d0-a81880556136@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
 Andy Gross <agross@kernel.org>, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/2/2022 12:45 PM, Dmitry Baryshkov wrote:
> On 30/07/2022 12:17, Akhil P Oommen wrote:
>> Allow a consumer driver to poll for cx gdsc collapse through Reset
>> framework.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> ---
>>
>>   drivers/clk/qcom/gpucc-sc7280.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gpucc-sc7280.c 
>> b/drivers/clk/qcom/gpucc-sc7280.c
>> index 9a832f2..f5df51d 100644
>> --- a/drivers/clk/qcom/gpucc-sc7280.c
>> +++ b/drivers/clk/qcom/gpucc-sc7280.c
>> @@ -433,12 +433,18 @@ static const struct regmap_config 
>> gpu_cc_sc7280_regmap_config = {
>>       .fast_io = true,
>>   };
>>   +static const struct qcom_reset_map gpucc_sc7280_resets[] = {
>> +    [GPU_CX_COLLAPSE] = { .op = gdsc_wait_for_collapse, .priv = 
>> &cx_gdsc },
>> +};
>> +
>>   static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
>>       .config = &gpu_cc_sc7280_regmap_config,
>>       .clks = gpu_cc_sc7280_clocks,
>>       .num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
>>       .gdscs = gpu_cc_sc7180_gdscs,
>>       .num_gdscs = ARRAY_SIZE(gpu_cc_sc7180_gdscs),
>> +    .resets = gpucc_sc7280_resets,
>> +    .num_resets = ARRAY_SIZE(gpucc_sc7280_resets),
>
> An implementation question. Do we have to poll for the GDSC on 
> platforms like sm8150/sm8250 which have the plain BCR resets?
Yes.

Thanks for all the feedback, Dmitry. I will post another version of this 
series.

-Akhil.
>
>>   };
>>     static const struct of_device_id gpu_cc_sc7280_match_table[] = {
>
>

