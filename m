Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 774BA5A94FF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 12:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B781810E6D3;
	Thu,  1 Sep 2022 10:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6D610E6D3
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Sep 2022 10:46:40 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id m7so14891959lfq.8
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Sep 2022 03:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=q7GfTDbztJBtRyiLzAqPadkhGM0mICn7vR8np4hSo2U=;
 b=ja3k4IT1AJG3cTCogL7Ah/V1RQRMAVc58+3EPHiTIgJpWylZ6l9lvyybcbBMtwi5ja
 k58U2jE80elsd8XkoJS2GhgxfxkdJUehErE0PfH+5xVMcqZYvJSiEW9Nx+BC8zSpBHRL
 VaaJE9+ODRL9JTue5gYdc2KC9nJ9q8XGBE89uyVYg+iMqRFS8UPg3Sw0Mza6SzFxt+po
 BeEUF+igPo9ys7LxA1p4qG2/DZskUpLsee36hl2L0o+33KJNDCuDNDOuWY2sviZX17gd
 FvlQqJI1fZdUyJmO6l9DS1QgBTUpB7s0Y6iYalWWhGng3v6dpvmByewFuXjrjrJRi8H9
 yCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=q7GfTDbztJBtRyiLzAqPadkhGM0mICn7vR8np4hSo2U=;
 b=NG2SF7y9jV8l0wOg+HN+ZwasWC+8z2AwHHaVqg792WaFthGZyiRFRkl0hTp4BjpiUw
 aOJHqEIdWDcF6q9Yv5n48rr9dyu3Y85GeCbtZF7VxNqC/1149ag/Q3QsGVIoXLQcYtBa
 PtzbscpZ+i+Mq05L/4WMVH95TpKSEFfRet3RUr7HStP7LJ9AZgwLkjf5uslkrcXwnIN3
 9nCjdXgCz8eIJ07INhzmU4nIdimIZe3ue2cKIIGC5JW5ExfKtDX33Sk2r+0C2aRIQlkV
 6jNH4h1E0wui1RRrRjxVW/vlrpPgFOt9ksHfB9pf7zb4Bf6SK6bJ4u64pKQDdXHHURa3
 usgQ==
X-Gm-Message-State: ACgBeo228QFKJWuTOjQqHvUsI4SAkG+JD9Bu9I5SVYXF0Igs33lkRydA
 Q0rundUVBpf8JCJybZ1XavdGlA==
X-Google-Smtp-Source: AA6agR42QJyzzyisVHax2ivC+hHxBqHzv3MiqXDqBhGKYSNiL2vKQOpWCYeqeHW9DRVEoPuU292NYQ==
X-Received: by 2002:a05:6512:2520:b0:494:6fbe:2269 with SMTP id
 be32-20020a056512252000b004946fbe2269mr4951805lfb.387.1662029198290; 
 Thu, 01 Sep 2022 03:46:38 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a056512220300b00492f45cbbfcsm2286586lfu.302.2022.09.01.03.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 03:46:37 -0700 (PDT)
Message-ID: <ff2d8784-0cf9-fac9-4360-71cac30fbd76@linaro.org>
Date: Thu, 1 Sep 2022 13:46:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v6 4/6] clk: qcom: gpucc-sc7280: Add cx collapse reset
 support
Content-Language: en-GB
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <1661923108-789-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220831104741.v6.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
 <20220901103449.GC32271@pengutronix.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220901103449.GC32271@pengutronix.de>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, krzysztof.kozlowski@linaro.org,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/09/2022 13:34, Philipp Zabel wrote:
> On Wed, Aug 31, 2022 at 10:48:25AM +0530, Akhil P Oommen wrote:
>> Allow a consumer driver to poll for cx gdsc collapse through Reset
>> framework.
>>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>
>> (no changes since v3)
>>
>> Changes in v3:
>> - Convert 'struct qcom_reset_ops cx_gdsc_reset' to 'static const' (Krzysztof)
>>
>> Changes in v2:
>> - Minor update to use the updated custom reset ops implementation
>>
>>   drivers/clk/qcom/gpucc-sc7280.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
>> index 9a832f2..fece3f4 100644
>> --- a/drivers/clk/qcom/gpucc-sc7280.c
>> +++ b/drivers/clk/qcom/gpucc-sc7280.c
>> @@ -433,12 +433,22 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
>>   	.fast_io = true,
>>   };
>>   
>> +static const struct qcom_reset_ops cx_gdsc_reset = {
>> +	.reset = gdsc_wait_for_collapse,
> 
> This should be accompanied by a comment explaining the not-quite-reset
> nature of this workaround, i.e. what is the prerequisite for this to
> actually work as expected?
> 
>> +};
>> +
>> +static const struct qcom_reset_map gpucc_sc7280_resets[] = {
>> +	[GPU_CX_COLLAPSE] = { .ops = &cx_gdsc_reset, .priv = &cx_gdsc },
>> +};
>> +
>>   static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
>>   	.config = &gpu_cc_sc7280_regmap_config,
>>   	.clks = gpu_cc_sc7280_clocks,
>>   	.num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
>>   	.gdscs = gpu_cc_sc7180_gdscs,
>>   	.num_gdscs = ARRAY_SIZE(gpu_cc_sc7180_gdscs),
>> +	.resets = gpucc_sc7280_resets,
>> +	.num_resets = ARRAY_SIZE(gpucc_sc7280_resets),
> 
> See my comment on patch 2. I think instead of adding a const struct
> qcom_reset_ops * to gpucc_sc7280_resets, this should just add a const
> struct reset_control * to gpu_cc_sc7280_desc.

While this will work for the sc7280, the platform that Akhil was 
developing, this will not work for other platforms (like sm8250), where 
the dispcc also provides traditional BCR resets.

-- 
With best wishes
Dmitry

