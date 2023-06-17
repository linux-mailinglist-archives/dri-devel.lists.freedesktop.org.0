Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BC9733D3B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 02:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BCCD10E6AB;
	Sat, 17 Jun 2023 00:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D6410E6AB
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jun 2023 00:38:39 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f655293a38so1851885e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 17:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686962317; x=1689554317;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FaAFv9diu+2GntNFHHd2iqlhl6ioeLBHNICmiU3KZV8=;
 b=n5wQL0y+IigIdbYTLWY3sCQhh3h9tnktHjUZctHRKcRVlGS0nCSi7sOQw9XSWdrvPw
 Bk/X+YsBpMESlDsEnYIRZeiP18ej6cJ429oKnaoRL3qM5viO9uLy1h4bvzt8Ng4diuFH
 +bhcRgg2RIdzXYKfQgVFicFhNva9cqrwaXi4sUN94PD2prKqZZisx2rxzNtPT0hB+10u
 MxQSe00b+ftSURqWHqygFwwisHzyrhfZ88V6BUnmciOO8kscavbGEznBpvoWTWuMnHBh
 SUFgddjN4aBGMcK4Jqjii5YOJ6ais481W+rnX6c7a1wS+frPSC/j0bT3OwUqGJNWgX6/
 MZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686962317; x=1689554317;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FaAFv9diu+2GntNFHHd2iqlhl6ioeLBHNICmiU3KZV8=;
 b=FrTD3mdjKZ4clH5RyhDFeln7vu0ukiFfNFwy0qnv33swVBlHaf2mvBV/B+wFfbV2BM
 3HCE2RpNC9zLu8owdwqFNxca8Bg8ctY/tsf5ZpwNlO6/LNEtkcrhki0YlXzCFYKbIwEE
 KOohkHvIAt+T65+HG2zPf1ChHPIblyujB104hde7Qs9zWEuFwF57lIlebjl3SR4NBn6d
 hlWpOsObZjDKACEfrr3pHSoVix+S3uxSag2y2dNuJzawZ6LUoRSHpBDE5DEy7hw2VZ1e
 qiBggqauGGxgLql06Q8mTxhZflR5nAvEc2qZEbbEq13VM1dDKQENvlB8FkZ44FPWuM2F
 X16A==
X-Gm-Message-State: AC+VfDxNjF5BATfY/FCaiCflhSuj246migEvrgYLjg5ETw7o74mwtIRc
 EZm0ZbuAmILpOMd+5j1JvFIOQA==
X-Google-Smtp-Source: ACHHUZ7sMmxGRUiPl5CdnszXhiCdm5cv1O0YZuGsNI+lerkiojPmHN74Jz9+3tGXMbrSMJO2PLuxsg==
X-Received: by 2002:a19:5e47:0:b0:4f3:b708:f554 with SMTP id
 z7-20020a195e47000000b004f3b708f554mr1894705lfi.47.1686962317001; 
 Fri, 16 Jun 2023 17:38:37 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 h22-20020ac25976000000b004f5e681eec1sm3254630lfp.92.2023.06.16.17.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 17:38:36 -0700 (PDT)
Message-ID: <39101e65-f8f7-4303-dd17-e94d5f998d24@linaro.org>
Date: Sat, 17 Jun 2023 03:38:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 04/19] drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-5-dmitry.baryshkov@linaro.org>
 <gnffmawpcboaxxlpfictfkcqozppzpzaofqu5e75youwicltdz@acpdxcu73k7b>
 <5jevnbocflm3tzyensi5uex4umptyy3wsbjbercm3vodqxx3md@jnbi7g5oyys6>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5jevnbocflm3tzyensi5uex4umptyy3wsbjbercm3vodqxx3md@jnbi7g5oyys6>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/06/2023 01:44, Marijn Suijten wrote:
> On 2023-06-17 00:41:40, Marijn Suijten wrote:
> <snip>
>>> -	cfg = _top_offset(idx, m, addr, &mdp->hw);
>>> -	if (IS_ERR_OR_NULL(cfg)) {
>>> -		kfree(mdp);
>>> -		return ERR_PTR(-EINVAL);
>>> -	}
>>> +	mdp->hw.blk_addr = addr + m->mdp->base;
>>> +	mdp->hw.log_mask = DPU_DBG_MASK_TOP;
>>
>> You lost the assignment of m->mdp to the local cfg variable, causing
>> mdp->caps = cfg; below to remain NULL.
> 
> To solve that in a clean way, you might as well pass `const struct
> dpu_mdp_cfg *cfg` directly from dpu_kms.c into dpu_hw_mdptop_init, as I
> did for the other HW blocks in "Pass catalog pointers in RM to replace
> for-loop ID lookups".

Sounds good.

-- 
With best wishes
Dmitry

