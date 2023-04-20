Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F15E6E9744
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 16:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E9910EC6F;
	Thu, 20 Apr 2023 14:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FBA10EC6F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 14:36:06 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id z38so2986639ljq.12
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682001364; x=1684593364;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5uui2Wi7NVfJCrcXtN5eYVm4TxQJPj927NoxVs4YDVk=;
 b=hMdZ+zSJBPntpLYLF2I79CXNISVnLhftjCGt4NXbSX30nQuYbBrFy77L1DJI+tD20e
 QZ9nXE+o75BHUpwYyP/ZPZCRLSgeTkvFIRlXHqCr9HfKl/4ruuOQvck1fOBPMoyyNcEw
 zrBAzCLLj8Rkq1kVoVB+FxSqsEJI9LFUI/G61vXxU/2c7MdW3Q6Z03GidoFddxDAMoye
 I9JHU2qZyC0tLExd/bTM1vOWTHq8aKP9ogrv1AzU1sRYuhyEGQbnSX91qPtH1mW24YrP
 HIAfnaIN6RlZxKxiot3qQTZvLx5m7QBom2jnXQFP1nDlpcUTU7kMNSDnhYOMoIiPT4pO
 fKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682001364; x=1684593364;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5uui2Wi7NVfJCrcXtN5eYVm4TxQJPj927NoxVs4YDVk=;
 b=Yko3YKdcFu2YIA5zAPyN3gnkg83Gt+QvRQD2CjKoMi8h8BVB0R2l5yFsiHgDsGwrC3
 rh5dpFuAfctQsw8XDLAlLliyWR+1HLjrd9dEfyDZb7HPnQtYNy0OR10t/UOecWtOf6g8
 jJJohEwqkuMu4SCfiVMcI3prcgMllt9r2RJYOoclOhl214p6acfW7GRKslxu83LCDaRZ
 Ezdln6ArHmMqdf39orC/ZvwlJonM6S49j/Cav+MGPpQM0Wl8BMTVvlQPJ4rPFyDUWbjC
 TyfRIaG98S1M6X9Pcas+A5RQwmR5salPiZt6BIpPr2nDoqor5DrurnJtcbH+RpmNVr9+
 q4dQ==
X-Gm-Message-State: AAQBX9dfLxWJimr4/YI5ZsYzhdVevcJUh2kf0vFfsnp6ZkZe4o8zBg+C
 Zfy0eSMlw4+OdSQwuh7rM/zfbw==
X-Google-Smtp-Source: AKy350bxjSiFVGri7JIuuUNGtje+lkCFgGUXQ49IfKwgtbovTDHVj8OSw7gv0rVld2E0FeTECEYI7A==
X-Received: by 2002:a2e:9003:0:b0:2a6:de0:98e9 with SMTP id
 h3-20020a2e9003000000b002a60de098e9mr484011ljg.22.1682001364392; 
 Thu, 20 Apr 2023 07:36:04 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a2e8315000000b002a7899eaf9csm255146ljh.63.2023.04.20.07.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 07:36:03 -0700 (PDT)
Message-ID: <78a96f0e-738c-54b6-185c-7be4b5206463@linaro.org>
Date: Thu, 20 Apr 2023 17:36:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/3] drm/msm/dpu: Pass catalog pointers directly from RM
 instead of IDs
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230418-dpu-drop-useless-for-lookup-v1-0-b9897ceb6f3e@somainline.org>
 <20230418-dpu-drop-useless-for-lookup-v1-3-b9897ceb6f3e@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230418-dpu-drop-useless-for-lookup-v1-3-b9897ceb6f3e@somainline.org>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2023 02:14, Marijn Suijten wrote:
> The Resource Manager already iterates over all available blocks from the
> catalog, only to pass their ID to a dpu_hw_xxx_init() function which
> uses an _xxx_offset() helper to search for and find the exact same
> catalog pointer again to initialize the block with, fallible error
> handling and all.
> 
> Instead, pass const pointers to the catalog entries directly to these
> _init functions and drop the for loops entirely, saving on both
> readability complexity and unnecessary cycles at boot.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c        | 30 +++--------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h        | 10 +++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c        | 32 +++---------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h        | 11 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c       | 38 ++++-----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h       | 12 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c       | 40 ++++++-----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h       | 12 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c         | 38 ++++-----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h         | 10 +++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 33 +++----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    | 14 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 33 +++----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c       | 33 +++----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h       |  8 ++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c       | 33 +++----------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h       | 11 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c         | 33 ++++---------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h         | 11 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 17 +++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c            | 18 +++++-----
>   23 files changed, 127 insertions(+), 366 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

