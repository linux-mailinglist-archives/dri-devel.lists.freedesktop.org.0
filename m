Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C05E682CE2
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 13:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DE410E337;
	Tue, 31 Jan 2023 12:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7FD10E337
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 12:46:02 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ud5so41259548ejc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 04:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9b3ZutwVB465UL8tC0Rs7E2hCEX5HYXirExmQf57Ht4=;
 b=gh6SkNWYqch1A7UHzPLs3655yHEEwe6HuCmNZfla7nDOccjLXUQOE9zjjp/fv9B4Zv
 A33a5ZUOY7Xtis6upEAJVAhkgIwEmxg48/klsuIvE7rytLvjHyOmRw7g4i46Uau9MsHf
 BKQwWPO6wCXKXUFX2xXkX2/Za4nClAdJefX5KCA54xltcb94hrZ/+/mBJfrKADem03Q/
 KHP0c034YMVOHv31VJ2B87Gn7EsIs78f2IBnh4vhPFEfnowQ/Npy9XAcmbDPhEu2s+1x
 jFUlMVDahrlUJ7XM0T4E1DUSuvr4EArAUWXFTSO0GUkRngCH+aKP+REi6N42sw3u4LsT
 EosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9b3ZutwVB465UL8tC0Rs7E2hCEX5HYXirExmQf57Ht4=;
 b=VFt6LqVGgYTsxRCHSUjIjW2hyAH6m5U6IK7hd3qEUSvrkWsjeeeQKGhJTKIq/IHf+C
 5BHhp7FCggaTdhgMdCMGZvO55f43ohvUh6lyD18TqsVWavE2m4Rlmpqw4Tl9vlZJHNxu
 bFoTS2dttsxBz4z7NNGBGtkuLnTIge1YXqSoCXK6uEGqICGDrjgg1Z4NIKCf7n4N+hOJ
 i+EQPMRksGF/wAJb0gbd4bPpvcYM0vLyjV977bgMWW9tq+lBokzd5U92vYEX46pMQEuW
 qLzzBRLRm2AhX6xx0/ruecIoPk6m6FQYh1952L/hshOSwoyZmbkFleOh6ODLvwGc/QdO
 jjKw==
X-Gm-Message-State: AO0yUKWm9IPkFPVio3q8ztt0H7vwbXRJJqMVlZfkPNhTYESDmGzXKr18
 j71q7d+VIcjQjAJt0YQmplHI0g==
X-Google-Smtp-Source: AK7set9ys2iHi/hzfS1dXWVhhDZ1gb+8exVm9SMJdc4tpDgy+pVjGnJ2LG14gY48y6gXRkHg+fUOug==
X-Received: by 2002:a17:907:cc9c:b0:87b:d636:c26d with SMTP id
 up28-20020a170907cc9c00b0087bd636c26dmr12286583ejc.58.1675169160705; 
 Tue, 31 Jan 2023 04:46:00 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 mf26-20020a170906cb9a00b0088b93bfa765sm1377101ejb.138.2023.01.31.04.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 04:46:00 -0800 (PST)
Message-ID: <66b7815c-1103-54bd-adde-e08126401729@linaro.org>
Date: Tue, 31 Jan 2023 14:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v12 00/14] Add PSR support for eDP
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1675091494-13988-1-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1675091494-13988-1-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, linux-kernel@vger.kernel.org,
 quic_khsieh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/01/2023 17:11, Vinod Polimera wrote:
> Changes in v2:
>    - Use dp bridge to set psr entry/exit instead of dpu_enocder.
>    - Don't modify whitespaces.
>    - Set self refresh aware from atomic_check.
>    - Set self refresh aware only if psr is supported.
>    - Provide a stub for msm_dp_display_set_psr.
>    - Move dp functions to bridge code.
> 
> Changes in v3:
>    - Change callback names to reflect atomic interfaces.
>    - Move bridge callback change to separate patch as suggested by Dmitry.
>    - Remove psr function declaration from msm_drv.h.
>    - Set self_refresh_aware flag only if psr is supported.
>    - Modify the variable names to simpler form.
>    - Define bit fields for PSR settings.
>    - Add comments explaining the steps to enter/exit psr.
>    - Change DRM_INFO to drm_dbg_db.
> 
> Changes in v4:
>    - Move the get crtc functions to drm_atomic.
>    - Add atomic functions for DP bridge too.
>    - Add ternary operator to choose eDP or DP ops.
>    - Return true/false instead of 1/0.
>    - mode_valid missing in the eDP bridge ops.
>    - Move the functions to get crtc into drm_atomic.c.
>    - Fix compilation issues.
>    - Remove dpu_assign_crtc and get crtc from drm_enc instead of dpu_enc.
>    - Check for crtc state enable while reserving resources.
> 
> Changes in v5:
>    - Move the mode_valid changes into a different patch.
>    - Complete psr_op_comp only when isr is set.
>    - Move the DP atomic callback changes to a different patch.
>    - Get crtc from drm connector state crtc.
>    - Move to separate patch for check for crtc state enable while
> reserving resources.
> 
> Changes in v6:
>    - Remove crtc from dpu_encoder_virt struct.
>    - fix crtc check during vblank toggle crtc.
>    - Misc changes.
> 
> Changes in v7:
>    - Add fix for underrun issue on kasan build.
> 
> Changes in v8:
>    - Drop the enc spinlock as it won't serve any purpose in
> protetcing conn state.(Dmitry/Doug)
> 
> Changes in v9:
>    - Update commit message and fix alignment using spaces.(Marijn)
>    - Misc changes.(Marijn)
> 
> Changes in v10:
>    - Get crtc cached in dpu_enc during obj init.(Dmitry)
> 
> Changes in v11:
>    - Remove crtc cached in dpu_enc during obj init.
>    - Update dpu_enc crtc state on crtc enable/disable during self refresh.
> 
> Changes in v12:
>    - Update sc7180 intf mask to get intf timing gen status
> based on DPU_INTF_STATUS_SUPPORTED bit.(Dmitry)
>    - Remove "clear active interface in the datapath cleanup" change
> as it is already included.
>    - Move core changes to top of the series.(Dmitry)

Unfortunately they still are not at the top.

> 
> Sankeerth Billakanti (1):
>    drm/msm/dp: disable self_refresh_aware after entering psr
> 
> Vinod Polimera (13):
>    drm/msm/disp/dpu: check for crtc enable rather than crtc active to
>      release shared resources
>    drm/msm/disp/dpu: get timing engine status from intf status register
>    drm/msm/disp/dpu: wait for extra vsync till timing engine status is
>      disabled
>    drm/msm/disp/dpu: reset the datapath after timing engine disable
>    drm: add helper functions to retrieve old and new crtc
>    drm/msm/dp: use atomic callbacks for DP bridge ops
>    drm/msm/dp: Add basic PSR support for eDP
>    drm/msm/dp: use the eDP bridge ops to validate eDP modes
>    drm/bridge: use atomic enable/disable callbacks for panel bridge
>    drm/bridge: add psr support for panel bridge callbacks
>    drm/msm/disp/dpu: use atomic enable/disable callbacks for encoder
>      functions
>    drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver
>    drm/msm/disp/dpu: update dpu_enc crtc state on crtc enable/disable
>      during self refresh
> 
>   drivers/gpu/drm/bridge/panel.c                     |  68 +++++++-
>   drivers/gpu/drm/drm_atomic.c                       |  60 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  40 ++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  26 ++-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  22 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   6 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  12 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   8 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +-
>   drivers/gpu/drm/msm/dp/dp_catalog.c                |  80 +++++++++
>   drivers/gpu/drm/msm/dp/dp_catalog.h                |   4 +
>   drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  80 +++++++++
>   drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   3 +
>   drivers/gpu/drm/msm/dp/dp_display.c                |  36 ++--
>   drivers/gpu/drm/msm/dp/dp_display.h                |   2 +
>   drivers/gpu/drm/msm/dp/dp_drm.c                    | 194 ++++++++++++++++++++-
>   drivers/gpu/drm/msm/dp/dp_drm.h                    |   9 +-
>   drivers/gpu/drm/msm/dp/dp_link.c                   |  36 ++++
>   drivers/gpu/drm/msm/dp/dp_panel.c                  |  22 +++
>   drivers/gpu/drm/msm/dp/dp_panel.h                  |   6 +
>   drivers/gpu/drm/msm/dp/dp_reg.h                    |  27 +++
>   include/drm/drm_atomic.h                           |   7 +
>   22 files changed, 706 insertions(+), 44 deletions(-)
> 

-- 
With best wishes
Dmitry

