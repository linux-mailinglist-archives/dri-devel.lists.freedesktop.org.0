Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A52946CC676
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 17:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509BC10E94F;
	Tue, 28 Mar 2023 15:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B07D10E93B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 15:35:13 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id g17so16369999lfv.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680017711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3N8h1DChvaLnm2TUkq7RCFOUn72LEkPBuvQVgji2prc=;
 b=MWTvY67pF8MEgiGs0jD2F1Vba+LhJPWz/XGiFuofZNJLlEA3NardYys19LQAJ2Nutk
 m0Fo1FrI6Hi+fJuGrEHQ+pTH1mPbkH11n2Poeu7kSgO6C1LbRjccfRcMXT61KZUorXQe
 AmuQnfQHrzT2QoYg91RCtwoqwkCgFVd3st/0qc28pr8D04tbsuDjbWUFdABzBDZFoJ0p
 k4x21jaRhb7KwdYmVywi5vlO/jlQgqOGHQiJzsSwCkOYO10V3g1/BRKivvz0L52A7gM1
 zJSYmHOo+yIicNDz6RQFY1UmNKvO71ygggA9+Aj8sGVBFeyY6guMH8GWq3Ba3KTpnHi2
 E6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680017711;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3N8h1DChvaLnm2TUkq7RCFOUn72LEkPBuvQVgji2prc=;
 b=Zlyl1Jnl/Q2aXQLRx7SQ21Rdo5Utunpg6ax20Vu/Jz/dmTFv46/fVKzRAlSd6g41SL
 naGwTaoTekhVA6xnASQ+zgrWVcS0VALv+oz6ZCNqFlbZPcjcYgWSD0LNZoP4/cJnC3Sm
 wVsjxVmjNN3Fu1fak/OEEusNy5JIPBCaq1UAP+mUP+sONC4j9OLlB/46pnKR/MFbTPMC
 gNCot+MFJJGik1KnR/QrkscM6Ga+vlZrT4HNCpWlVgGw/zBJgUlSJTvI9e356AqcJPcr
 aJoAQRVSnl1//D3lp5CAiWt4pfFrNRCC6VG8nEck53U8WgpqmN/L8tOxDBNVHzsEPzD/
 bSnA==
X-Gm-Message-State: AAQBX9eMGOC07+savLtgh+xmEf94+Rw0/tNMytsZjHf88xCGLOGOFf50
 ixKcPnCx0fM3gOkRatd4dm0ZaQ==
X-Google-Smtp-Source: AKy350aVn3vQwYsmxvtq+7/O1t34Z5xIpUuSNYCnORBUR752Ec2avam/4Q48gjVlzD+IBjLDYgwZ7w==
X-Received: by 2002:ac2:51a1:0:b0:4df:830d:4a3a with SMTP id
 f1-20020ac251a1000000b004df830d4a3amr5009867lfk.23.1680017711678; 
 Tue, 28 Mar 2023 08:35:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m10-20020ac2428a000000b004b6f00832cesm5086017lfh.166.2023.03.28.08.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 08:35:11 -0700 (PDT)
Message-ID: <2b0506b7-1a3a-b45a-8514-42066231d2ea@linaro.org>
Date: Tue, 28 Mar 2023 18:35:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 06/14] drm/msm/a6xx: Remove both GBIF and RBBM GBIF
 halt on hw init
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
 <20230223-topic-gmuwrapper-v4-6-e987eb79d03f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-6-e987eb79d03f@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/03/2023 17:28, Konrad Dybcio wrote:
> Currently we're only deasserting REG_A6XX_RBBM_GBIF_HALT, but we also
> need REG_A6XX_GBIF_HALT to be set to 0. For GMU-equipped GPUs this is
> done in a6xx_bus_clear_pending_transactions(), but for the GMU-less
> ones we have to do it *somewhere*. Unhalting both side by side sounds
> like a good plan and it won't cause any issues if it's unnecessary.
> 
> Also, add a memory barrier to ensure it's gone through.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

