Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560E1678CE5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 01:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69CD10E227;
	Tue, 24 Jan 2023 00:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC6710E227
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 00:32:49 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id hw16so34920566ejc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 16:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W6U+g9mZDv/qdEWNSc6qb0RyFwuSw45Rdcs0sHA30rU=;
 b=UAC92RfGCjw5VHdjja7nSvpkD7lGZgdqtEEws72SkZddUaYBD8a4Pr0RYDqO2ugYEJ
 NHaQ7mmsuVZYykX4roJrWoPY/2SrmgXoGoSD5bRNKB/pi2jE9DXWKWiM3XP/eCbE7zsG
 CO6z/nlK+h6AqBIyhyeG/EXyFopg73oIR0b7EfyUp5fIwTo++9rz9ypDN9lZ4eUAohjZ
 eNT9Jlo3vHzs276uup8f+H9TRVGW9NYFljtEUSCp1cacpn/NXJeFjoBDToKfkg1Z9cP7
 Z4yYZwLjydPeNvMJlqurQotP+ppWHVjU9vzWqVtKYkDUJz00+ghZvp0cr2QNn6DXG1Dg
 uqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W6U+g9mZDv/qdEWNSc6qb0RyFwuSw45Rdcs0sHA30rU=;
 b=X9WJRPSzWFxYjdyNj/Lja7Lpx/V5xZvQfG9rpKcnDqzUqSVnNICppq/80ZUg5yfw4C
 yk3m3g5IuGEbilhJVtEckHjKOvD/W9Pvnb3ObNg3KVdFMLZGAVOgAvokP55apYfkXShL
 k8oFjMUK1QvK4g/07ZU3mwBAISWCmeUF0xCOH+oe51w+CwXShoyzaMlChFCsrvGdxlmJ
 RpbJ4hs0Tu4CrdaMyqbQQmvy1crX9U9W29pW+zN8rsyd2nqImizzRjRRGmaPrRcDVJFB
 pLr8dDhXVKdkTwdNin5iT2SLkvVI6GTWxwErvoG0TnqUA/HQrSewAEn+U7FkZQozk2v+
 ZAIA==
X-Gm-Message-State: AFqh2ko1x/6DCImLM4es47pUG2alyL2SQhrPzqrazj68djQ2hQqAqeBF
 i8dN6jOgLob79aitfVbcS+reTw==
X-Google-Smtp-Source: AMrXdXsM5FQQXWJV4H6RJU3m/XRhGDnVhnxs5GqEpVMOzj1MTr45Rr2Zo4LktpGzHWioeYlXvKy0Dg==
X-Received: by 2002:a17:907:a07b:b0:7c1:3f04:efa2 with SMTP id
 ia27-20020a170907a07b00b007c13f04efa2mr39412563ejc.29.1674520368339; 
 Mon, 23 Jan 2023 16:32:48 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a1709066d1a00b008779b5c7db6sm134758ejr.107.2023.01.23.16.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 16:32:47 -0800 (PST)
Message-ID: <e74a8889-d864-0d61-8e64-d5a928331d0f@linaro.org>
Date: Tue, 24 Jan 2023 02:32:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH Resend v11 00/15] Add PSR support for eDP
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1674138393-475-1-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1674138393-475-1-git-send-email-quic_vpolimer@quicinc.com>
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

On 19/01/2023 16:26, Vinod Polimera wrote:
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
> Sankeerth Billakanti (1):
>    drm/msm/dp: disable self_refresh_aware after entering psr
> 
> Vinod Polimera (14):
>    drm: add helper functions to retrieve old and new crtc
>    drm/msm/dp: use atomic callbacks for DP bridge ops
>    drm/msm/dp: Add basic PSR support for eDP
>    drm/msm/dp: use the eDP bridge ops to validate eDP modes
>    drm/bridge: use atomic enable/disable callbacks for panel bridge
>    drm/bridge: add psr support for panel bridge callbacks
>    drm/msm/disp/dpu: use atomic enable/disable callbacks for encoder
>      functions
>    drm/msm/disp/dpu: check for crtc enable rather than crtc active to
>      release shared resources
>    drm/msm/disp/dpu: add PSR support for eDP interface in dpu driver
>    drm/msm/disp/dpu: get timing engine status from intf status register
>    drm/msm/disp/dpu: wait for extra vsync till timing engine status is
>      disabled
>    drm/msm/disp/dpu: reset the datapath after timing engine disable
>    drm/msm/disp/dpu: clear active interface in the datapath cleanup
>    drm/msm/disp/dpu: update dpu_enc crtc state on crtc enable/disable
>      during self refresh

1) Please move core patches to the beginning of the series, so that it 
is possible to pick them up separately

2) Please follow Daniel's comment in 
https://lore.kernel.org/all/Y7bMcLHr79uhfJv2@phenom.ffwll.local/ and 
apply corresponding Reviewed-by tags.

> 
>   drivers/gpu/drm/bridge/panel.c                     |  68 ++++++-
>   drivers/gpu/drm/drm_atomic.c                       |  60 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  42 ++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  29 ++-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  22 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   3 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  12 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   8 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +-
>   drivers/gpu/drm/msm/dp/dp_catalog.c                |  80 +++++++++
>   drivers/gpu/drm/msm/dp/dp_catalog.h                |   4 +
>   drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  80 +++++++++
>   drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   3 +
>   drivers/gpu/drm/msm/dp/dp_display.c                |  36 ++--
>   drivers/gpu/drm/msm/dp/dp_display.h                |   2 +
>   drivers/gpu/drm/msm/dp/dp_drm.c                    | 196 ++++++++++++++++++++-
>   drivers/gpu/drm/msm/dp/dp_drm.h                    |   9 +-
>   drivers/gpu/drm/msm/dp/dp_link.c                   |  36 ++++
>   drivers/gpu/drm/msm/dp/dp_panel.c                  |  22 +++
>   drivers/gpu/drm/msm/dp/dp_panel.h                  |   6 +
>   drivers/gpu/drm/msm/dp/dp_reg.h                    |  27 +++
>   include/drm/drm_atomic.h                           |   7 +
>   22 files changed, 710 insertions(+), 44 deletions(-)
> 

-- 
With best wishes
Dmitry

