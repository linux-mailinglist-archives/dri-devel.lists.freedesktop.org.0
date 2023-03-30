Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5AB6CF85F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 02:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18EC10EC9A;
	Thu, 30 Mar 2023 00:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE8110EC9A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 00:49:18 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id q16so22469041lfe.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 17:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680137357;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V8vjA8lbodRgcB4Q/hUrG14t5OddrbjhZVGGzITsMb4=;
 b=IC9zj+TOQPPmMngvTh4eZy7PYExWZjwodsiYNOX7Mn7zr6eneR9puI7guYjpz39RGM
 bqbmbJXvIzwiwMSfTLFpD2vesAcJSZm2Iz7WONBaKMRHrKi4jjqeRKUDjBjWVZ3GTbUK
 6i41GOpRQKHgCus7xYmEx12GOufydh9Cc66D46+M0NB63iJljy0a503BeIYBNEed6jzP
 L9pj7BahNU8nsv6bOwcCz08piLoMEjaRU6b1t8ew9uXomyUh2VMCZ32YyrnP3Lw2BmY/
 MYdcwI8x/UmrzK3DGf1BI29mdlG0jrdMpzpUncx747qfB3CAC+ji5yz6SYWT7+D/HGtd
 UrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680137357;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V8vjA8lbodRgcB4Q/hUrG14t5OddrbjhZVGGzITsMb4=;
 b=uZsTgyza/2viJNmwOzc+5yPnRfqj3YLQMp73dhnEx3GMmvD8vHWl4MG12IwX2yOZVS
 5xfmKisLYapO4xm3GwrDl+BstpvHddvmTsbKXqYHI2P16dbZiodVkMH1/I+hh9wtYpiF
 ADkzlMGb7ce6Smt+th6EMoNJDyaXKe9iEuc8eNoMNJENs4hBn6R4Vz4ejnOF3DyCGDjf
 daK9a9dK2x1/QmBOUoDm5M4O6WIOM29CIhfNghE69e9rm0IrM1NHj96daCZar3vC5tGe
 jmN+PaolXU/jUO24je4vK0Nuh5U1AGjFOcdEuLspqdyV6zdllwDo/V+CTB8ThcaLYWdL
 zUHg==
X-Gm-Message-State: AAQBX9fox4WppEK4ZkrNWQz8NWjG6vRfslJEM6yYBYZqkdhCIH6m+mjo
 xeISWGvkUpC463bQ1VUN4CPCKg==
X-Google-Smtp-Source: AKy350bVhhnR5UQqwdGHQ+qnkmSkADQU6XN82L8kOZOZr/06EYKeF6QjbVXOpru2aUC2UJGYmPvnfA==
X-Received: by 2002:a19:c202:0:b0:4db:2cdf:4c11 with SMTP id
 l2-20020a19c202000000b004db2cdf4c11mr5706512lfc.62.1680137356877; 
 Wed, 29 Mar 2023 17:49:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w19-20020ac24433000000b004eb00c0d417sm2846884lfl.130.2023.03.29.17.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 17:49:16 -0700 (PDT)
Message-ID: <c15a7b64-50a0-1093-1d35-0a308ffbcea0@linaro.org>
Date: Thu, 30 Mar 2023 03:49:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 2/5] drm/msm: Add MSM-specific DSC helper methods
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-2-f3e479f59b6d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v1-2-f3e479f59b6d@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 02:18, Jessica Zhang wrote:
> Introduce MSM-specific DSC helper methods, as some calculations are
> common between DP and DSC.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/Makefile              |  1 +
>   drivers/gpu/drm/msm/disp/msm_dsc_helper.c | 74 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/msm_dsc_helper.h | 28 ++++++++++++

Also: outside of disp, please.

>   3 files changed, 103 insertions(+)
> 

-- 
With best wishes
Dmitry

