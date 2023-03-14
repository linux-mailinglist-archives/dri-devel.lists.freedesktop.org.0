Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BBE6B9059
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 11:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C8410E767;
	Tue, 14 Mar 2023 10:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2B010E767
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 10:42:33 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id x17so3249849lfu.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 03:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678790552;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ddsEOqN0WCluTndil1PR5ITOkumrYADNMRhiGg1TLi8=;
 b=GiEuRVL3oLL6Vh+sncGzeoqofKVyv0oQaQnK1B5lKE+IQYpEUJO49q0Ycv97g9BFz6
 j7uwVrrCtpJnqtKgzkBL/w0bRPBjLXWpbze6CYBufebtkM0r9b2Y+5yqHCBpLtswdHlp
 aGh5wMAJHKCwYF/y0SQRrhVTo/4DIp9SQEJtriEoTcP7tnmd7lDJoocMm8AbU+mpRr5C
 avraMcBFlllF1GlbnCWfFwzWwfCa7lOa+84bjo6iligIncVgXzpS9DaiaXp6SH5aFxw/
 czRrXARjCNVbIFY8TP5VKCZK5UVeMH0JMDOYIMryU71nI3pt8Mu+ebvGe/ChjS8lvS08
 yQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678790552;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ddsEOqN0WCluTndil1PR5ITOkumrYADNMRhiGg1TLi8=;
 b=zmZS9svrW853WwAgXg4SvZ5PCf9CTWxmgchEBFs705aHPlTwgOAoIF2DN3hz8AqiG7
 swZtP61oSPN9jXr6ImLNcpLGLh3tm26u/Fjx4ZrVRQAYaEilA2B+r9n9obfgJXzbqITn
 P9dnlr5TRgYFrxseWj5QRcrDZa5Fme6K8R3dV1BViQjdKe/q5bOaS0WKNAQbN1nR9dik
 Y/YTgB2SVjGdkMd6FpsL8xJG3DMcCAKPIcjdGnLGnlv8xXyevNEimP61UHh00Yfr5LTd
 B/c++y7uARrWYDb9WS7YNi4XZeOkAOOYE6XVpbsj78e7Mc+/ubQRB6bXYgnXeWDyCAp7
 dDbw==
X-Gm-Message-State: AO0yUKW4nDCigYwLzIQ10t+vA0NkJslgaNLpyQnh4Jz/84+lGCCfDyw5
 lsXD4SoxG8eNStMqsVyqI/3Sww==
X-Google-Smtp-Source: AK7set/wgp8O8fMeZ11Mfbu0XNr4HVywv2i7lajlKxdFLMuiU8qd3wZT0aGnXXqUMdnxSLfygLGJYg==
X-Received: by 2002:a05:6512:3743:b0:4cc:ff7c:4846 with SMTP id
 a3-20020a056512374300b004ccff7c4846mr518444lfs.0.1678790551852; 
 Tue, 14 Mar 2023 03:42:31 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 w30-20020ac2599e000000b004b58500383bsm345858lfn.272.2023.03.14.03.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 03:42:30 -0700 (PDT)
Message-ID: <5a921230-c84f-aa10-1f5c-e9c2972fb9fd@linaro.org>
Date: Tue, 14 Mar 2023 11:42:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 07/10] drm/msm/dsi: Remove custom DSI config handling
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
 <20230307-topic-dsi_qcm-v3-7-8bd7e1add38a@linaro.org>
 <20230314000744.otbglr33ndizq5pc@SoMainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230314000744.otbglr33ndizq5pc@SoMainline.org>
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



On 14.03.2023 01:07, Marijn Suijten wrote:
> On 2023-03-07 14:01:45, Konrad Dybcio wrote:
>> Now that the only user is handled by common code, remove the option to
>> specify custom handlers through match data.
>>
>> This is effectively a revert of commit:
>> 5ae15e76271 ("drm/msm/dsi: Allow to specify dsi config as pdata")
> 
> Would it also be worth to mention something along these lines in the
> previous patch, but for ee1f09678f14 ("drm/msm/dsi: Add support for
> qcm2290 dsi controller")?
50/50, it wouldn't hurt but it doesn't sound groundbreaking to skip it..

Konrad
> 
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>  drivers/gpu/drm/msm/dsi/dsi.c      | 4 ++--
>>  drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ----
>>  2 files changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
>> index 90d43628b22b..e0b911af618d 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
>> @@ -173,10 +173,10 @@ static int dsi_dev_remove(struct platform_device *pdev)
>>  }
>>  
>>  static const struct of_device_id dt_match[] = {
>> -	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
>> +	{ .compatible = "qcom,mdss-dsi-ctrl" },
>>  
>>  	/* Deprecated, don't use */
>> -	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = NULL },
>> +	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290" },
>>  	{}
>>  };
>>  
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index 9cfb9e91bfea..961689a255c4 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -214,10 +214,6 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
>>  	int ret;
>>  	u32 major = 0, minor = 0;
>>  
>> -	cfg_hnd = device_get_match_data(dev);
>> -	if (cfg_hnd)
>> -		return cfg_hnd;
>> -
>>  	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
>>  	if (IS_ERR(ahb_clk)) {
>>  		pr_err("%s: cannot get interface clock\n", __func__);
>>
>> -- 
>> 2.39.2
>>
