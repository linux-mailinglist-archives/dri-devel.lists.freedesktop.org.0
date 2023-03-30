Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 643F56D1102
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 23:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC2810F037;
	Thu, 30 Mar 2023 21:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F58B10F037
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 21:46:32 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id 20so21132776lju.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680212790;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MADZ+T3+xEjmaqwAK3HZYhv40BH/3kPLIH0NLpDWWKI=;
 b=WmHvFUjiDiAFrxZFfl+bZeBK0iAf6Tj5THXzn01fH+JxsoUeSOFGQlKsfh1VpKEe3f
 xTIQXo+y64LBXTWMgBzmiS0dEjljfvbVz7itexOdegJSt6RhHp3uUqbcsEXvlcrGojX8
 ZgokuuEsVMw/rbNeyDqHCOcNJXby2FfRzIOIwcxn1KcI1cVuS8cHtLijorcLrs5Pnl78
 qFXdem3lXnXMS8mYOjC2FTfsDNkfgRUxHLgL+Hr91UeZWe6Xpm2qWOujYGssujGv/ECK
 24LLdaDEEfkEk0gqPNpA/murHiZ20zc49BY7ht6oiSO/lWQOswcaS/FdDwplPk8kDO90
 q18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680212790;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MADZ+T3+xEjmaqwAK3HZYhv40BH/3kPLIH0NLpDWWKI=;
 b=CqNpv4n9SK3mwim69JkBW1Bwf8sbj+OXITo/F9NRF3I/DAv5ued1cpkmfLZwdmsuwD
 X8yCKIbeos9iK4bl1D4USRKspRT35FcyVQcqqRYt/8nE16qeD7bqIha/SMBc2jdKk/Ii
 PfbJZjWeMmNbrDwRFkibgkC9/0TVUI3ICII/ybkHnsKOYyu+CEw49nKiGbr7cyzNgacM
 5ELTyDu0rsW+qrxBvJcVpyohudUN62o6jGw8kaIizU41lBmccEYkIzmyMRTNK7VlThQd
 G5AgCJgLPmm0rwoa8JGPw+AwfgNgGdTgipW7H4M/PO3jXmMBX/ThNqsmCJzoISEKAbpb
 Xqfw==
X-Gm-Message-State: AAQBX9dzdtCUE9j/x8p40vkkCfPmY/4BA5N8PETzjTplIL9pol31ahPy
 QoDk16z14wI6BdjhPFm0WzJbqQ==
X-Google-Smtp-Source: AKy350ZAVBee1zE0gHQ5G0G/YmpxsOLpK53mmAjtYNsKM4JztgEI1u8WQOEpLhH2tb8GE83WwxkNEQ==
X-Received: by 2002:a2e:98c4:0:b0:299:a8e2:2176 with SMTP id
 s4-20020a2e98c4000000b00299a8e22176mr7520920ljj.24.1680212790415; 
 Thu, 30 Mar 2023 14:46:30 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 21-20020a05651c00d500b0029462e98c07sm79875ljr.35.2023.03.30.14.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 14:46:29 -0700 (PDT)
Message-ID: <8d12f4fc-8a7b-c44b-071c-014399fcfa54@linaro.org>
Date: Fri, 31 Mar 2023 00:46:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,40/50] drm/msm/dpu: enable DSPP on sc8180x
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-41-dmitry.baryshkov@linaro.org>
 <e60607e3-8786-e4fe-f0fa-0851dbb53a3a@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e60607e3-8786-e4fe-f0fa-0851dbb53a3a@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 15:39, Konrad Dybcio wrote:
> 
> 
> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>> Enable DSPP blocks on sc8180x platform, basing on the vendor dtsi.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> There's only a single difference between 8150 and 8180:
> 
> qcom,sde-dspp-dither = <0x82c 0x00010007>;
> 
> is only present on the former. Not sure if it makes any difference.

I'm not sure too. Currently we support only PP-based dither, so DSPP 
dither doesn't make any difference. Let's ignore it for now.

> 
> Konrad
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> index c51e1bba1533..457733a6986e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>> @@ -91,6 +91,8 @@ static const struct dpu_mdss_cfg sc8180x_dpu_cfg = {
>>   	.sspp = sm8150_sspp,
>>   	.mixer_count = ARRAY_SIZE(sm8150_lm),
>>   	.mixer = sm8150_lm,
>> +	.dspp_count = ARRAY_SIZE(sm8150_dspp),
>> +	.dspp = sm8150_dspp,
>>   	.pingpong_count = ARRAY_SIZE(sm8150_pp),
>>   	.pingpong = sm8150_pp,
>>   	.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),

-- 
With best wishes
Dmitry

