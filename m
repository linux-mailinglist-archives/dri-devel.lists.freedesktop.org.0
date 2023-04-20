Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F87C6E86B6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 02:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AE710E626;
	Thu, 20 Apr 2023 00:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA5310E1F3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:45:01 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id z38so906780ljq.12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681951500; x=1684543500;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Uw7JNGYT4uLh3etMMP74RoMDPM5hJGwdSfCgrMMVoM=;
 b=mGKF03/4oZsNGaaGShd+QEVSq9NZb+b/aSYbYemAfcxB0OljlSufOAaVRPtuIk8fjk
 IsUWSPJPbKDOzGPpJCT+W5WzgPv1scbSvfzSiYTJRmWPSTTDnee6JEbWNQHrnYDiR5JV
 b7tDJyPbuydSddMmz/mhoRpZLBmECi2o/4M+j9b21LEeJUlXmQAtMTvFoBJ2ReVgnohX
 FULXv+EJG+ka/q4W9CgIsnVuwmmIk1bI4pUwmpFFNuR9bikhOOupApqX0sn/SS5suNVj
 mw4UJmXwHZnW/I30MZAMNfPpgKh214rZiexYF5nhD09XXaVTs2g9Ka0t4pf+AZLZVJtQ
 aT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681951500; x=1684543500;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Uw7JNGYT4uLh3etMMP74RoMDPM5hJGwdSfCgrMMVoM=;
 b=E+1dBqJOii7c1YyJdP+27g9AMOIWFZyWoJ3bhFZ6q03tqO5iEDddyflmoQHSo0IedD
 jaUR9P0v8EREMYELlWjJpJ1Xmgl67V5DBqopZ3RZLJPdTb9a4xPInVxlgozAJKFRpIHh
 Fxi8DqZWNEVY9/O5BdYTBhLd5CvYfxrrhbtJldynVTh6sJxpJ0jpBjNoqmK8gFIJT+wz
 XEEmwL2vIbmiLTPMuIdpa9U54axXZ+VtS+mTlzqLGcTDaTE1KVFmkH9/KRXnzygNM72b
 MCK8hxYDHjubp/pi4kEeIeZxFUxqGYMYUcln04U2gopodKi7Z+FISI1CbhGpYJnfugqK
 SVlw==
X-Gm-Message-State: AAQBX9civlAd8vAE1lwcYgDb1MXWNuqVbb+2qjLKbKIACw9Wu1eMPe4w
 lKwul5D0LLpLz0DVBLHAQHKgzg==
X-Google-Smtp-Source: AKy350ZBTBfKAQ0fZHgjW5NeO1pdUq3DqqyNPbaUxvwgl2B1P9ChdTakjvNEhN4imLkvEb7Wp/45eA==
X-Received: by 2002:a2e:9a95:0:b0:2a8:aadc:f162 with SMTP id
 p21-20020a2e9a95000000b002a8aadcf162mr2474093lji.51.1681951499837; 
 Wed, 19 Apr 2023 17:44:59 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a2e8e84000000b002a8bbd919f8sm16726ljk.6.2023.04.19.17.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:44:59 -0700 (PDT)
Message-ID: <0eb8eaf7-7649-13a1-edc4-049fd0f51dcb@linaro.org>
Date: Thu, 20 Apr 2023 03:44:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 02/17] drm/msm/dpu: Remove TE2 block and feature from
 DPU >= 7.0.0 hardware
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
 <20230411-dpu-intf-te-v2-2-ef76c877eb97@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-2-ef76c877eb97@somainline.org>
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
> No hardware beyond kona (sm8250) defines the TE2 PINGPONG sub-block
> offset downstream.  Even though neither downstream nor upstream utilizes
> these registers in any way, remove the erroneous specification for
> SC8280XP, SM8350 and SM8450 to prevent confusion.
> 
> Note that downstream enables the PPSPLIT (split-FIFO) topology (single
> LM for 2 PP and 2 INTF) based on the presence of a TE2 block.
> 
> Fixes: f0a1bdf64dd7 ("drm/msm/dpu: Introduce SC8280XP")
> Fixes: 0a72f23f6ef8 ("drm/msm/dpu: Add SM8350 to hw catalog")
> Fixes: 8cbbc3396065 ("drm/msm/dpu: add support for SM8450")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  4 ++--
>   3 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

