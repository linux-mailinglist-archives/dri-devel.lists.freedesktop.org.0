Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E896E869E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 02:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDE810E67B;
	Thu, 20 Apr 2023 00:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CCE10E65F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:34:48 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id l15so924381ljq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681950888; x=1684542888;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SiD2IbSXDlZieZbHjHSUCYuY9cMoYEC6NH0/3B6dQu8=;
 b=O+lCT+vKd5Oa5GiRbxw7qL8wkuSG00ORMMDBlLOwsPgT/jhrHekej/EItt7u9FaeT1
 d/yx5FefelzVb3CAYwoW/XSy5fhpjns+UN9N8OuVRkdpfUxBXFTWhN55CaFiPVIP4THf
 sAOV+BnefWKLauLviLr9u+yeYkKoMM+groigIxvyiNGQYevkGSKLZqClA5AurBNQd+zD
 vlGz6UUqk0sP0dr4ubWoyJWIleyQpiJr1UcdzQ/tmwGQZUzQMSiRwe6d9ta8+7NIm15n
 A4mFpDJWkolxId1eqdrfdgtb5yI0RrlH7hXc3s726PXkzOIttC1E5Mhhc9PxQxocB1zf
 Lawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681950888; x=1684542888;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SiD2IbSXDlZieZbHjHSUCYuY9cMoYEC6NH0/3B6dQu8=;
 b=ZYm0nzjJC82tKjgRwslXMdwJoqKUadWlay3s+UaAxbbVH3+6D+SuBDD/g4k+Ens3VK
 8cRfpuVUKko2ZwXE/QOxecB47g7totgTSg0TG8CPbnr2n/Mzpua885IpdZySiOhlK651
 TV+DeahESYmGOksPoTc1S5qLaJMOEHK6RwCetqYPHkLcDH4ojKItlNCZjLTdGStQsHXL
 TJaD6GtwMihjmRYZpQQnaFhBTFOkq+KhTn9kaYMrsTOVocmE6eMljTpvHHbuCRBD/l8a
 +/0TsjQGhkv6Xdqr5I4inn5fsCJgzieFItBliOxfkupgq4xYbG/AYK5a2j3NIBq7tdqD
 t6fQ==
X-Gm-Message-State: AAQBX9dkM3BEZCkie0ncVCnTC8PwjJM2Qk52DAfXjhfD2r8NKqdyKqiM
 EgvNaQW1n7rYhWx/gO2aqbyTfQ==
X-Google-Smtp-Source: AKy350YvIZfOnGNH4KiFjQVFRnlA3Yfawn3xwcpbRrpe+vuboDSOq1oyRB6ko/rWn8vrrq6E6cVPTQ==
X-Received: by 2002:a2e:9f44:0:b0:2a8:a07a:a46d with SMTP id
 v4-20020a2e9f44000000b002a8a07aa46dmr2286782ljk.33.1681950888099; 
 Wed, 19 Apr 2023 17:34:48 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a2e9b0c000000b002a8b205bb50sm11977lji.61.2023.04.19.17.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:34:47 -0700 (PDT)
Message-ID: <6f8eab89-c04d-9144-9aa9-3566c0abac77@linaro.org>
Date: Thu, 20 Apr 2023 03:34:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 01/17] drm/msm/dpu: Remove unused INTF0 interrupt mask
 from SM6115/QCM2290
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-1-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-1-ef76c877eb97@somainline.org>
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/04/2023 23:21, Marijn Suijten wrote:
> Neither of these SoCs has INTF0, they only have a DSI interface on index
> 1.  Stop enabling an interrupt that can't fire.
> 
> Fixes: 3581b7062cec ("drm/msm/disp/dpu1: add support for display on SM6115")
> Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
>   2 files changed, 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

