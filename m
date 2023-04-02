Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696006D3797
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 13:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B7410E314;
	Sun,  2 Apr 2023 11:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B49510E314
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 11:21:52 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id c29so34553429lfv.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Apr 2023 04:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680434510;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CupAYGtbQgsZ9aoIqwriIdpbZ2t5YipDIDHwTEshFbI=;
 b=XZQQ6asGIP/qPFMi76WQf7GkXCLFj31HnW2kyHo7n8NzbAxp2Vy4u7iGB1spFCftyG
 mAT77s/zSrlE6HP54uvavC3jxMQkJO0giWDmadfqjEvFn/zzCqkHCth9CRJTjcj/8kmf
 ALXWKeGhrdFSYkF5dhm9QKlhMOpuBi7goZVFYBomiydSmkwtu/RpTEsvLOXJG5/2oz17
 cPt/SkEzW8RDzyQ5/FpDeBWgB/P73iU3I794AQCELlLEu86er9CcULgeE1lsRh2BxH6s
 thWFjARZgPTsGguvi1kSk8S0UB4vcSwt66v8Iu5zFtfLPhORHdNzo6vZJJb1sQLbuDFT
 2CoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680434510;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CupAYGtbQgsZ9aoIqwriIdpbZ2t5YipDIDHwTEshFbI=;
 b=hZ9CDEqQgWUCTZr2ybP+XxlTVyT6+gz8rGB0x1WVTYTbto9ADNABklVy9RiPBRt+XO
 +rT+DJ9aD72Aq1eZyCurgGKatYNcNVY3uqw+JdrpMW9x83JNPSkcPZeYBUyqn28fKMsc
 sPL1fqO/qO01UpmogaEnPdTWw15b0fS8taeJQN1ndoIrdFgGKlUPOQTBDZRf94Ecywf3
 z6A1Z6pTlJ6QECNHl0ciI4wT8yZkExO8Jpu7Ybsy8P/6T9/iclOh9xF0m1LjO74I98sI
 rc5EEfd9sU2KIG4jmTF/e3yJtMYW/h98ajGK1HyI5JI5kuzDltP5rwgb8jNNvvroHxHH
 F+bw==
X-Gm-Message-State: AAQBX9f9n4ILmVSrsq3YHy25w9IbiwrgpNuSqVHrvNcNbUp2VH2BNzk8
 d/OgXgNnVuje2PTQ4wYLlBAbhg==
X-Google-Smtp-Source: AKy350b3ZPoFCeLxOBe6dDFl63M3ktiEY+0xGffgbBogR9v0b426QN4st+MRF7acRHebKRnwzcywDQ==
X-Received: by 2002:ac2:5304:0:b0:4de:290:1c0a with SMTP id
 c4-20020ac25304000000b004de02901c0amr9267866lfh.57.1680434510474; 
 Sun, 02 Apr 2023 04:21:50 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 g26-20020ac2539a000000b004dda80cabf0sm1247856lfh.172.2023.04.02.04.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 04:21:50 -0700 (PDT)
Message-ID: <0969da8e-a115-9ac4-81ab-09a2b363cb14@linaro.org>
Date: Sun, 2 Apr 2023 14:21:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC v2 3/6] drm/msm/dpu: Use DRM DSC helper for
 det_thresh_flatness
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v2-3-3c13ced536b2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v2-3-3c13ced536b2@quicinc.com>
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

On 31/03/2023 21:49, Jessica Zhang wrote:
> Use the DRM DSC helper for det_thresh_flatness to match downstream
> implementation and the DSC spec.
> 
> Changes in V2:
> - Added a Fixes tag
> 
> Fixes: c110cfd1753e ("drm/msm/disp/dpu1: Add support for DSC")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

