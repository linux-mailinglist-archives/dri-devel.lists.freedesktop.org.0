Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DA06172BC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 00:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2192E10E54B;
	Wed,  2 Nov 2022 23:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8F310E53A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 23:36:54 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id f37so222778lfv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 16:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hVXT9xKOOQjMytFsPaMld5kkYAuqoQzWwoJxXPr+vis=;
 b=qq8uqswx+dq+fX6MQXKZl6KoVs/QJOKnrUR21/QGaU6BhmZyhop5mTLTMcB2X1PFDd
 f1EZKnHUbAaTDwqFK6CDEgmHT3QaWkO2Go4US8Uzmgve6OwhREBDpdTm2NuHcvVaJEa/
 XG/YO4EFStcH/Fw12QgGMcXXAlTmI80b2B03c+oCCYhCRfCOO+n+2K4aESl8w96LVBF1
 dvMPEDTp3LjBwX7H2N5lhMPGF95Fupvgiosxv9/Phyhuhn0iH3W15IWQb79RumpV0a+h
 p45tZIP4CAp5DvpvZ5yw7fHBIuKQxhFyo9VX9+r7+iAtxsyAYFdXdqU3khLDm4ajWozj
 13/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hVXT9xKOOQjMytFsPaMld5kkYAuqoQzWwoJxXPr+vis=;
 b=ZhdyWT6Y2Y/NptH73VbQWKM2b/zhfULyxbZYUoRtkocGB5uQn8KAqtHIKu9OtpSbfw
 NYyWxUHg4IaW5xj3oVcCggwqiEizaDPounKmiE5cyaFSug6W9VKowaspTJZ8XGzW36DH
 BJYYiWURRtQsValdU9f2N97ehxu0+aMFfAxPdnKbLvpum7yjQRXrd2dl1JLrTm3kiaBZ
 Z4/PwhStPHwvuoeolmOy3wdH4Rt/5pJWB1pL96fCJZVF4mYcCWm7ftQi2tCRpYecMAfM
 ChyAvSNaDSQfxcyXQ1ZbTek8iF+3AvI1H/PaCkdd5ckZ1SU2x9yZYyLmzrIduF+E01mb
 CyfA==
X-Gm-Message-State: ACrzQf1dU15znXlJV71f+JgpVk6g7OT29yn9/gWf0ctUeBgM8xW/KyRQ
 CtCvrQLERY61DWPcI/QjUry0YA==
X-Google-Smtp-Source: AMsMyM5g0cJ6EynJYUzGsGjtwQSJNbnVjoJzqN+ZnX7lGyY2p2L9E9jV//Lks8s5mnLud82ZcRO4mw==
X-Received: by 2002:ac2:4bcf:0:b0:4a2:c241:1979 with SMTP id
 o15-20020ac24bcf000000b004a2c2411979mr10626606lfq.89.1667432212678; 
 Wed, 02 Nov 2022 16:36:52 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a2eb4ac000000b0026e90b478c6sm2364290ljm.114.2022.11.02.16.36.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 16:36:52 -0700 (PDT)
Message-ID: <9f11fad1-2ecc-39a0-33c5-8fb28750686c@linaro.org>
Date: Thu, 3 Nov 2022 02:36:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 04/12] drm/msm/dp: Stop using DP id as index in desc
Content-Language: en-GB
To: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20221026032624.30871-1-quic_bjorande@quicinc.com>
 <20221026032624.30871-5-quic_bjorande@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221026032624.30871-5-quic_bjorande@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/10/2022 06:26, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> In the SC8280XP platform there are two identical MDSS instances, each
> with the same set of DisplayPort instances, at different addresses.
> 
> By not relying on the index to define the instance id it's possible to
> describe them both in the same table and hence have a single compatible.
> 
> While at it, flatten the cfg/desc structure so that the match data is
> just an array of descs.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
> Changes since v2:
> - None
> 
>   drivers/gpu/drm/msm/dp/dp_display.c | 72 ++++++++++-------------------
>   1 file changed, 25 insertions(+), 47 deletions(-)-- 
With best wishes
Dmitry

