Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE06E9F47
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 00:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8F610ED20;
	Thu, 20 Apr 2023 22:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2CFC10ED20
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 22:49:05 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4ec81245ae1so987123e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682030944; x=1684622944;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fdP8MC3XaEqA32rWPdIckKxRCI4GJxh3IXEDH13XKh4=;
 b=Uo5s2ZVJ8f0YtJNR2V/QAw9DClxjdNn9cqFYEbfOZQUbcrDWvI3kZIG/ZvuvSdVhU7
 pfh5B5a9RphGrqWEwNIRlbMY45cfKU38pWY1e0FY61FUJh0Jb1svYJ9R0LJakfx9tu3m
 nbekIr7F6ZW68EnD6s+zO6qcATzgxFBHn6w9fyAO0JcooAsehyLQcDBDOcntPm0NyGoN
 Oifnhlo7c89uxuHM+wDtJ0RnSGZNiKDCUdarMsAhcx8sziEmaqPjUGiTtCmM0BS8tN6v
 sj4Ln9lcUStQlwf/nzgnSZ0qMbfnh5CtcwwFPN++psWNdyfLRUKvJWy/6+3gbGTZVDBk
 ty5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682030944; x=1684622944;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fdP8MC3XaEqA32rWPdIckKxRCI4GJxh3IXEDH13XKh4=;
 b=AYc4j193FO2dxOJ6PtkHuKyXlE/308OzVgX51j3Y0LRDNTq2vJOHLcM4Wg7PiXfdZO
 LG+PN8jxjoxUcH0/+BKQhLUfrKvqIDcZxzyWw19PB9eRpJUqUpwVns319euwhPfNOa3w
 rxbzMV2PyJ2Zf6FW2pZKUfwbpFrTX9B++U8uzfe0hTCF9TrxVJjV0ugMja5g7kcnoj+b
 O0JbhqWdd+ELyWG8WCO1vmVLDoXtc7l1eTu2ddHJ86aVgSSsps2adJv1r/GQ2yqxSvdT
 JTct2v1h+DOdfszKMshKNcHc2sbbg/SO+a33FvIJmGYItQf521WDQ2PRFmlxr1tOPJFa
 BGZA==
X-Gm-Message-State: AAQBX9doc9eiVuP5BzZJQ5r4vxv3cJt29EWK00+BSx4RsWsNnI6cfQ4l
 /d7NCO3fsVAYBaiaStfvUa/DnQ==
X-Google-Smtp-Source: AKy350ZInjPaVxyUTYhwDYw+L3xY8vOz8c952eS4vzPQ6cipzNOj58Pw/XifVqqdE8XeIyyL0HzukA==
X-Received: by 2002:ac2:4905:0:b0:4ed:c9b0:6a42 with SMTP id
 n5-20020ac24905000000b004edc9b06a42mr780084lfi.12.1682030944156; 
 Thu, 20 Apr 2023 15:49:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 x13-20020ac2488d000000b004ef11b30a17sm94609lfc.91.2023.04.20.15.49.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 15:49:03 -0700 (PDT)
Message-ID: <d2b6ebad-dd38-0bb3-7c98-27cda45c7ed9@linaro.org>
Date: Fri, 21 Apr 2023 01:49:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 10/13] drm/msm: mdss: Add SM6375 support
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Will Deacon
 <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-10-5def73f50980@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-10-5def73f50980@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 01:31, Konrad Dybcio wrote:
> Add support for MDSS on SM6375.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

