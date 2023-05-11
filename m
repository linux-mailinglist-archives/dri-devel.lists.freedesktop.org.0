Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE15F6FEA9A
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 06:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C204010E592;
	Thu, 11 May 2023 04:26:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB7B10E591
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 04:26:31 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f13a72ff53so9072008e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 21:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683779190; x=1686371190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eUmCpvjWDhQdxf3lwZ60FBKbTN2JHorB/w60u1Mv/vU=;
 b=xFnk2tKBhuiOr+yfiGKI65TTdYUo5p01mFQkE996K2jQMkk71QArG+exw/q+dw1kky
 Hn32/yrkwCyu/kNf4wcSTK4ic3eTul1cEgNjC71cnJ/KeHig3gs7V7+YClbWl8ayTblq
 HDJKV0Zww1ttyDWPmBiGThd9899NAra3Spb/YWFdFkjQcaLFv95Mntd4BgrJH63XViIX
 5p5wSUTiS9UpFlBg2fC+SBG0z5GNYs2fM64+6SAKuBhsEmlRMUz1ybz+RYDK3xVr9+3K
 s2TQQQV1TbHZngVStrDc2VgeTSf0YW/2pmYRN4spASI8hxKI0iXfheOBPbzz88LUqXpP
 nshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683779190; x=1686371190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eUmCpvjWDhQdxf3lwZ60FBKbTN2JHorB/w60u1Mv/vU=;
 b=FYTuiLG/R1ipTYk+M4VNc3lSyJWrnadhY6MdTXHLaxd7DAeZENasvff/QnKrfKrOQY
 hMG/0CqROYaT3iiLW/RRZuJjr2mp9izkcEMMixGXA+CJFLwVgWzuA9ZmQTE2pirhnmit
 XXfqLh9vyXPnyLowfsUTGtmWjnUnaOYImMe84G+7I66heT1dJBtYnZjOj7+0AcOfuGYt
 REIVViGF+XKh1uOg8/f7V14J1UYzeC3RbUT54+b7PK49Vh6WkDfJ8GEtTBGIAg5LrD53
 n7zeX9W7afPMi/afWVQDdufqEbZpzNvCMk6enEfnr33jie1IZBGNTFLhUYAgmglClkEQ
 PNmA==
X-Gm-Message-State: AC+VfDzJq67lZPO46UxTFm2t/o+NsCtUKyJHyKX0pcHnuwa8EFMUrOZF
 BjDOo3BKU7V/yofXEHPuXFlA2A==
X-Google-Smtp-Source: ACHHUZ4xVPNCG/PgCri7O7YabARlUEbPecdbRrz/JhmgxofTMJUuDeraPp0vq+ZhTEWCWxbOLpb9wg==
X-Received: by 2002:ac2:4313:0:b0:4ef:f630:5c1e with SMTP id
 l19-20020ac24313000000b004eff6305c1emr2108356lfh.51.1683779189789; 
 Wed, 10 May 2023 21:26:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a2e88ca000000b002a8d01905f7sm2184933ljk.101.2023.05.10.21.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 21:26:29 -0700 (PDT)
Message-ID: <7eeac1dd-8cd1-60e7-5dc0-f8f5adc18ffe@linaro.org>
Date: Thu, 11 May 2023 07:26:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 2/8] drm/display/dsc: add helper to set semi-const
 parameters
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-2-df48a2c54421@quicinc.com>
 <tl5zijcxx7326jdgr6lyjptvvvyxosoupz3vekvhex3vnviw5t@3vswzg244tme>
 <05021e78-6c1a-b4b1-6312-4dd3f1647074@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <05021e78-6c1a-b4b1-6312-4dd3f1647074@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05/2023 01:35, Jessica Zhang wrote:
> 
> 
> On 5/9/2023 11:29 PM, Marijn Suijten wrote:
>> On 2023-05-09 15:06:48, Jessica Zhang wrote:
>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Add a helper setting config values which are typically constant across
>>> operating modes (table E-4 of the standard) and mux_word_size (which is
>>> a const according to 3.5.2).
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>
>> Same question about ordering.
> 
> Hi Marijn,
> 
> This patch was authored by Dmitry and originally part of his DRM DSC 
> helpers series [1], but was removed from that series for mergeability 
> reasons.
> 
> Looking over the kernel documentation, the last Signed-off-by should be 
> from the patch submitter [2], so I think my s-o-b tag should be at the 
> bottom.
> 
> As for the order in the previous patch, I can add a duplicate s-o-b 
> before Dmitry's so that it reflects the history of the patch.

I think this is an overkill. Instead you can drop my SOB from the patch 
1. We do not need this level of detail.

For this patch the ordering of tags is correct.

-- 
With best wishes
Dmitry

