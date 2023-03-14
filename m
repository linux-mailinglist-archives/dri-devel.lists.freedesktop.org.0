Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E516B926D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 12:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FBA10E77E;
	Tue, 14 Mar 2023 11:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677ED10E77E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:59:45 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id a32so15734148ljr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 04:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678795183;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1sKgb2Mq4gRjAq9lF2tbCgSPHex9wjrQCKvZTk86UJY=;
 b=y5eLJn9+xp0hoNORojvoyotCZKx+cmXw2u8ngcDDlP6ZUKbhoEZEeN/8jJC28XF8rc
 9HHbfmX7ihAb5iGac0MaOXG/WKmxHza9fGuSiS+I1tlntfiZPkyRHRQxETxvlL4Ef+qX
 iePB7WptDzDPbvoeOXIQ2uC8weHp+k64mZtVWSGT6ktvNtnvfClK468k+B9lP1PFsAXK
 UwfEnRPa++dLs1vudM41qvGTXWcATYY3msqY/0j8yeJjlAKhE4rVKzeNO4wXrDGIkwii
 tynY4if7BQoeW/6Pga3QAsT3XZK9Sps6WNeL3AKYJmLTEtasSM1LGauqSM7+Pq282X9s
 o/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678795183;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1sKgb2Mq4gRjAq9lF2tbCgSPHex9wjrQCKvZTk86UJY=;
 b=0O/gVcQaNdRXiOsLFrVieao0jNR7Xu6EB/y+HhPXd4HTIeNhM8KhzrL82imi9BaayA
 RyjlPxul5HzJ6uisL34uEmfy5eE+GCnl0zWwozQqHgwSaWsEqx+L4DDKpsQZn7KyyXOv
 lEGJHsEGJDtFYdpT5zy2rHzsrZoctZ9PzaLDY775Qmas/MgQhUdTTPF2fDTOA6g5c+Aq
 RJLhnbAbIACgDvbpV1+e4IgAyfBZ6qhiIKfvuYmmlAiH0dLS7ZFgwm3wtzZYmZxgRNgq
 EMePiKYsrzsrG2uKMM1J6TslbeT3BW2WRgRfgKzDi4C6FZxBRH2PPka35EHgnj09gVXZ
 ZU5Q==
X-Gm-Message-State: AO0yUKVCNOujotos2lOARfCHI8d8eV44syJpt/8CGERcC5Kv2YQr+B0r
 H39HWflllzxDTYo1nKARKH42Rg==
X-Google-Smtp-Source: AK7set/DARPmBul9NCqse8wxkiSO55gWa8Vwl3NTZ1oXoRY8LHh5qhoQNHuMitTGhhC5XgD0oyv1wA==
X-Received: by 2002:a2e:b70e:0:b0:28f:265d:11da with SMTP id
 j14-20020a2eb70e000000b0028f265d11damr4300985ljo.13.1678795183552; 
 Tue, 14 Mar 2023 04:59:43 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 bg39-20020a05651c0ba700b00295a36fedadsm415818ljb.26.2023.03.14.04.59.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 04:59:42 -0700 (PDT)
Message-ID: <1eea079d-c0e8-b941-60d2-e0656cbb73be@linaro.org>
Date: Tue, 14 Mar 2023 12:59:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 03/10] drm/msm/dsi: Fix DSI index detection when
 version clash occurs
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
 <20230307-topic-dsi_qcm-v3-3-8bd7e1add38a@linaro.org>
 <20230313235109.u7cpusjr6t2xyxmk@SoMainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230313235109.u7cpusjr6t2xyxmk@SoMainline.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14.03.2023 00:51, Marijn Suijten wrote:
> On 2023-03-07 14:01:41, Konrad Dybcio wrote:
>> Currently, we allow for MAX_DSI entries in io_start to facilitate for
>> MAX_DSI number of DSI hosts at different addresses. The configuration
>> is matched against the DSI CTRL hardware revision read back from the
>> component. We need a way to resolve situations where multiple SoCs
>> with different register maps may use the same version of DSI CTRL. In
>> preparation to do so, make msm_dsi_config a 2d array where each entry
>> represents a set of configurations adequate for a given SoC.
> 
> Note that this code isn't fool-proof against different SoCs sharing the
> same DSI host address but for different indices (for example, the
> address at variant 0 DSI 0 could be the same as variant 1 DSI 1) and the
> matching logic would wrongly return ID 0 instead of 1 for SoC variant 1,
> because that's the first matching address it finds.
I don't think we've had that happen yet, but if it ever does, that's out
of scope of this patchset.

> 
>> This is totally fine to do, as the only differentiating factors
>> between same-version-different-SoCs configurations are the number of
>> DSI hosts (1 or 2, at least as of today) and the set of base registers.
>> The regulator setup is the same, because the DSI hardware is the same,
>> regardless of the SoC it was implemented in.
>>
>> In addition to that, update the matching logic such that it will loop
>> over VARIANTS_MAX variants, making sure they are all taken into account.
> 
> "in addition to that" makes it sound like you're doing a separate new
> thing in this patch, when the match logic must in fact be updated to
> make it compatible with the change described above (as in, it doesn't
> compile if you don't account for the extra depth in the array).
I really think you're nitpicking here..

> 
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Regardless of the above, I don't think it's a problem right now and I
> really like the direction this is headed in: miles better than having a
> single distinct SoC with a separate way (compatible) of selecting the
> host DSI CTRL, rather than the hw revision readback.
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Thanks!

Konrad
> 
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi_cfg.c  | 52 ++++++++++++++++++++++++++++----------
>>  drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  5 +++-
>>  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++----
>>  3 files changed, 48 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> index 4515f52b407a..6c192963c100 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
>> @@ -21,7 +21,9 @@ static const struct msm_dsi_config apq8064_dsi_cfg = {
>>  	.num_regulators = ARRAY_SIZE(apq8064_dsi_regulators),
>>  	.bus_clk_names = dsi_v2_bus_clk_names,
>>  	.num_bus_clks = ARRAY_SIZE(dsi_v2_bus_clk_names),
>> -	.io_start = { 0x4700000, 0x5800000 },
>> +	.io_start = {
>> +		{ 0x4700000, 0x5800000 },
>> +	},
>>  };
>>  
>>  static const char * const dsi_6g_bus_clk_names[] = {
>> @@ -40,7 +42,9 @@ static const struct msm_dsi_config msm8974_apq8084_dsi_cfg = {
>>  	.num_regulators = ARRAY_SIZE(msm8974_apq8084_regulators),
>>  	.bus_clk_names = dsi_6g_bus_clk_names,
>>  	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
>> -	.io_start = { 0xfd922800, 0xfd922b00 },
>> +	.io_start = {
>> +		{ 0xfd922800, 0xfd922b00 },
>> +	},
>>  };
>>  
>>  static const char * const dsi_8916_bus_clk_names[] = {
>> @@ -58,7 +62,9 @@ static const struct msm_dsi_config msm8916_dsi_cfg = {
>>  	.num_regulators = ARRAY_SIZE(msm8916_dsi_regulators),
>>  	.bus_clk_names = dsi_8916_bus_clk_names,
>>  	.num_bus_clks = ARRAY_SIZE(dsi_8916_bus_clk_names),
>> -	.io_start = { 0x1a98000 },
>> +	.io_start = {
>> +		{ 0x1a98000 },
>> +	},
>>  };
>>  
>>  static const char * const dsi_8976_bus_clk_names[] = {
>> @@ -76,7 +82,9 @@ static const struct msm_dsi_config msm8976_dsi_cfg = {
>>  	.num_regulators = ARRAY_SIZE(msm8976_dsi_regulators),
>>  	.bus_clk_names = dsi_8976_bus_clk_names,
>>  	.num_bus_clks = ARRAY_SIZE(dsi_8976_bus_clk_names),
>> -	.io_start = { 0x1a94000, 0x1a96000 },
>> +	.io_start = {
>> +		{ 0x1a94000, 0x1a96000 },
>> +	},
>>  };
>>  
>>  static const struct regulator_bulk_data msm8994_dsi_regulators[] = {
>> @@ -94,7 +102,9 @@ static const struct msm_dsi_config msm8994_dsi_cfg = {
>>  	.num_regulators = ARRAY_SIZE(msm8994_dsi_regulators),
>>  	.bus_clk_names = dsi_6g_bus_clk_names,
>>  	.num_bus_clks = ARRAY_SIZE(dsi_6g_bus_clk_names),
>> -	.io_start = { 0xfd998000, 0xfd9a0000 },
>> +	.io_start = {
>> +		{ 0xfd998000, 0xfd9a0000 },
>> +	},
>>  };
>>  
>>  static const char * const dsi_8996_bus_clk_names[] = {
>> @@ -113,7 +123,9 @@ static const struct msm_dsi_config msm8996_dsi_cfg = {
>>  	.num_regulators = ARRAY_SIZE(msm8996_dsi_regulators),
>>  	.bus_clk_names = dsi_8996_bus_clk_names,
>>  	.num_bus_clks = ARRAY_SIZE(dsi_8996_bus_clk_names),
>> -	.io_start = { 0x994000, 0x996000 },
>> +	.io_start = {
>> +		{ 0x994000, 0x996000 },
>> +	},
>>  };
>>  
>>  static const char * const dsi_msm8998_bus_clk_names[] = {
>> @@ -131,7 +143,9 @@ static const struct msm_dsi_config msm8998_dsi_cfg = {
>>  	.num_regulators = ARRAY_SIZE(msm8998_dsi_regulators),
>>  	.bus_clk_names = dsi_msm8998_bus_clk_names,
>>  	.num_bus_clks = ARRAY_SIZE(dsi_msm8998_bus_clk_names),
>> -	.io_start = { 0xc994000, 0xc996000 },
>> +	.io_start = {
>> +		{ 0xc994000, 0xc996000 },
>> +	},
>>  };
>>  
>>  static const char * const dsi_sdm660_bus_clk_names[] = {
>> @@ -148,7 +162,9 @@ static const struct msm_dsi_config sdm660_dsi_cfg = {
>>  	.num_regulators = ARRAY_SIZE(sdm660_dsi_regulators),
>>  	.bus_clk_names = dsi_sdm660_bus_clk_names,
>>  	.num_bus_clks = ARRAY_SIZE(dsi_sdm660_bus_clk_names),
>> -	.io_start = { 0xc994000, 0xc996000 },
>> +	.io_start = {
>> +		{ 0xc994000, 0xc996000 },
>> +	},
>>  };
>>  
>>  static const char * const dsi_sdm845_bus_clk_names[] = {
>> @@ -169,7 +185,9 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
>>  	.num_regulators = ARRAY_SIZE(sdm845_dsi_regulators),
>>  	.bus_clk_names = dsi_sdm845_bus_clk_names,
>>  	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
>> -	.io_start = { 0xae94000, 0xae96000 },
>> +	.io_start = {
>> +		{ 0xae94000, 0xae96000 },
>> +	},
>>  };
>>  
>>  static const struct regulator_bulk_data sm8550_dsi_regulators[] = {
>> @@ -182,7 +200,9 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
>>  	.num_regulators = ARRAY_SIZE(sm8550_dsi_regulators),
>>  	.bus_clk_names = dsi_sdm845_bus_clk_names,
>>  	.num_bus_clks = ARRAY_SIZE(dsi_sdm845_bus_clk_names),
>> -	.io_start = { 0xae94000, 0xae96000 },
>> +	.io_start = {
>> +		{ 0xae94000, 0xae96000 },
>> +	},
>>  };
>>  
>>  static const struct regulator_bulk_data sc7180_dsi_regulators[] = {
>> @@ -195,7 +215,9 @@ static const struct msm_dsi_config sc7180_dsi_cfg = {
>>  	.num_regulators = ARRAY_SIZE(sc7180_dsi_regulators),
>>  	.bus_clk_names = dsi_sc7180_bus_clk_names,
>>  	.num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
>> -	.io_start = { 0xae94000 },
>> +	.io_start = {
>> +		{ 0xae94000 },
>> +	},
>>  };
>>  
>>  static const char * const dsi_sc7280_bus_clk_names[] = {
>> @@ -212,7 +234,9 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>>  	.num_regulators = ARRAY_SIZE(sc7280_dsi_regulators),
>>  	.bus_clk_names = dsi_sc7280_bus_clk_names,
>>  	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
>> -	.io_start = { 0xae94000, 0xae96000 },
>> +	.io_start = {
>> +		{ 0xae94000, 0xae96000 },
>> +	},
>>  };
>>  
>>  static const char * const dsi_qcm2290_bus_clk_names[] = {
>> @@ -229,7 +253,9 @@ static const struct msm_dsi_config qcm2290_dsi_cfg = {
>>  	.num_regulators = ARRAY_SIZE(qcm2290_dsi_cfg_regulators),
>>  	.bus_clk_names = dsi_qcm2290_bus_clk_names,
>>  	.num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
>> -	.io_start = { 0x5e94000 },
>> +	.io_start = {
>> +		{ 0x5e94000 },
>> +	},
>>  };
>>  
>>  static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> index 6b6b16c5fd25..8772a3631ac1 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> @@ -32,13 +32,16 @@
>>  
>>  #define DSI_6G_REG_SHIFT	4
>>  
>> +/* Maximum number of configurations matched against the same hw revision */
>> +#define VARIANTS_MAX			2
>> +
>>  struct msm_dsi_config {
>>  	u32 io_offset;
>>  	const struct regulator_bulk_data *regulator_data;
>>  	int num_regulators;
>>  	const char * const *bus_clk_names;
>>  	const int num_bus_clks;
>> -	const resource_size_t io_start[DSI_MAX];
>> +	const resource_size_t io_start[VARIANTS_MAX][DSI_MAX];
>>  };
>>  
>>  struct msm_dsi_host_cfg_ops {
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 9021f0d65515..9cfb9e91bfea 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -1862,16 +1862,16 @@ static int dsi_host_get_id(struct msm_dsi_host *msm_host)
>>  	struct platform_device *pdev = msm_host->pdev;
>>  	const struct msm_dsi_config *cfg = msm_host->cfg_hnd->cfg;
>>  	struct resource *res;
>> -	int i;
>> +	int i, j;
>>  
>>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dsi_ctrl");
>>  	if (!res)
>>  		return -EINVAL;
>>  
>> -	for (i = 0; i < DSI_MAX; i++) {
>> -		if (cfg->io_start[i] == res->start)
>> -			return i;
>> -	}
>> +	for (i = 0; i < VARIANTS_MAX; i++)
>> +		for (j = 0; j < DSI_MAX; j++)
>> +			if (cfg->io_start[i][j] == res->start)
>> +				return j;
>>  
>>  	return -EINVAL;
>>  }
>>
>> -- 
>> 2.39.2
>>
