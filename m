Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FDC6F0B2D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 19:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375B510E289;
	Thu, 27 Apr 2023 17:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5267E10E32B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 17:42:55 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-94eff00bcdaso1634376466b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 10:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682617373; x=1685209373;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F1SAc0HcV8hEhAyAPR7y6pjkMxfBvrPrHvmJ+SfKKKc=;
 b=yAG0oIoiiWeumBvBDJF3ZsFnf5PXkOXoWw6EID+Y9XG2yTvAP6xsv/sk/ewXuqM0oW
 kD66hLM4pYZMHDuCQu+Q5guEZf51fsHDyuLmd31M8c1eKL3aCScUS9JDqtCRIMfaDsS7
 2CtcYjL6PQjAcDPdU0WRsCrK5uHcLbBA9kJ+jaTHKGPBcYmJyNAog8+o3L5TLekxUOlp
 gGweK9Db5qU1UYMMNoySSkIYeJHUvtLL1wbp+VABgDfRUm4GyyG8/Fjf30gzrmiA9d7b
 8uOM1wMSMFss8xyQss08PlH1AImkWl1clD0/A81X9T9N3gUzcmZom5JZu3ph7LIcTZbY
 fEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682617373; x=1685209373;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F1SAc0HcV8hEhAyAPR7y6pjkMxfBvrPrHvmJ+SfKKKc=;
 b=VLhXHnxH009CyRDLpmMlfJx5QRg3BpLUQOkRoodNC1euchzVD29Alxmn7wGlxv776E
 2RJ63t2hb9KgW0P0uV0Q/ghstI3ac8IFSXzEfXXBdzHepILvGjn6+Qug1ua5woxx5CeT
 t+vD1ePWs2k+w3cLkygXebC5Bwxo6Gm76EZ++vUfSlLRosvxKYndk5WMFcUgdchQoXvW
 dHR60vR0YvugEfud+XQXnAxgif9ABlS+vUyLb+u00NxU8YDt9o0YtoulOiE5CU0iXIvg
 LSMdcp6pZnUZrPRQthzM80j7HvFyY5aOPCV9d5d1z52eIdfcWKaap1EU0oRTkH/zRApJ
 zohQ==
X-Gm-Message-State: AC+VfDwFsgIPEsc5FnTs4SBQb0a2tzSIRHbOHiB0VGcD7p+dhqNTP1sR
 BTJE5VTTBNKLmuR56Pe3gWkrpg==
X-Google-Smtp-Source: ACHHUZ4+E/IFCnlWTF5xlWJOov/l6OzVHmSPhNh/zH0h6Ak5Scx+1Je+GsxGhmB2P5fMQ8VujrmzGg==
X-Received: by 2002:a17:907:7fa7:b0:94f:3bf7:dacf with SMTP id
 qk39-20020a1709077fa700b0094f3bf7dacfmr3268721ejc.71.1682617372720; 
 Thu, 27 Apr 2023 10:42:52 -0700 (PDT)
Received: from [172.23.2.5] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a1709062e9300b0094f281bd279sm9930523eji.198.2023.04.27.10.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 10:42:51 -0700 (PDT)
Message-ID: <e0af881f-7350-05b8-4ec0-b56b4f70254f@linaro.org>
Date: Thu, 27 Apr 2023 20:42:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 07/22] drm/msm/dpu: Set PINGPONG block length to zero
 for DPU >= 7.0.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
References: <20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org>
 <20230411-dpu-intf-te-v4-7-27ce1a5ab5c6@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v4-7-27ce1a5ab5c6@somainline.org>
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/04/2023 01:37, Marijn Suijten wrote:
> Despite downstream DTS stating otherwise, the PINGPONG block has no
> registers starting with DPU revision 7.0.0.  TEAR registers are gone
> since DPU 5.0.0 after being moved to the INTF block, and DSC registers
> are gone since 7.0.0, leaving only the dither sub-block.
> 
> A future patch, part of the DSC 1.2 series, should disable DSC functions
> on the PINGPONG block for all DPU >= 7.0.0 hardware.
> 
> Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
> Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 16 ++++++++--------
>   4 files changed, 24 insertions(+), 24 deletions(-)

https://patchwork.freedesktop.org/patch/534306/?series=116327&rev=2

-- 
With best wishes
Dmitry

