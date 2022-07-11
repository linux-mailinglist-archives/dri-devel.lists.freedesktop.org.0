Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E03F56FE47
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 12:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E0B10FB88;
	Mon, 11 Jul 2022 10:07:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A94112D0E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 10:07:57 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id m18so7837044lfg.10
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z0gWPzpnf+Fkqqtj9BV5xWECqcqhY1y27pcs8oB10pk=;
 b=USz9x/SbaDxxtjzvjpOXTqjIY7Mz9wUW+iryz/OKPMURFKzZRjviyzbB12zhJrtslY
 6aSHB4/fWCPW83DzUcvU3/ueoVONNJDF7O0QvgmHtNJXrQcmdXl0HltHAtmNd4aAq//V
 +g11Z6ZRJGlJCc5iOOpu2RR9QafTi+rymGrPE4XhZDCpeQenMqeZHyTYbQyhzhKqLg2v
 DBITsYLlulyjx63sVrcPHmZpuzo89AINn3GNyS2GOWXYCKX3GNDNniFJ/v0U5ADeeJZ0
 jWwCYFPpwpTjMAasLOSDjhmmPxkwAtpZ3q1XIcRyO2b9HDgO0gVhV0Oyek2oK+n1qSEM
 vIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z0gWPzpnf+Fkqqtj9BV5xWECqcqhY1y27pcs8oB10pk=;
 b=01Qk0VYexAPZ63bbDeguA6O/+qnyf9R4JNC5E91SbL1+/ocl39ZOEdPxXF/6zyzM1S
 x9ZoYRZCq2V0RSuprd09HVauBGsuFwxdNnXHb18z+cEfZbqRtWHn8fqCrkKn5Zce5X8U
 eBgpLlyxhZTqP3Xd2U2oTB2w9It6YbzB6NL98aRhop2m7XMOU/JWm2FrwU6FDCyuyWYJ
 2wVnRJbxIGlMpcW7DGN07fzcqocwZdLmF1j2AfDziM4ci7/qz7mhK3XoyU/We+Iq0wfs
 e04TyfTuMZxyhS0X6FfGH9oU69jb308Nb4JXqpQ/chF2E5Bsq4dlOfdakNBnXR0/687m
 Xd0w==
X-Gm-Message-State: AJIora+YYEFU6LGRql9oKpTJaF5FNlm9AHT/7xh/rGFKbLYUIPQACAj8
 UeBAjIjn1vRO2OxeGzcexHHuiw==
X-Google-Smtp-Source: AGRyM1sQ4qfv3Gvrp6kUtXMTCc4OAJoE7ATLT59r9LNAKRYX4a5MGu0ec17krDwhI+DPHVOyIzdq/Q==
X-Received: by 2002:a05:6512:b23:b0:489:d24e:5abf with SMTP id
 w35-20020a0565120b2300b00489d24e5abfmr5358846lfu.636.1657534075775; 
 Mon, 11 Jul 2022 03:07:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a05651232b600b0047255d21190sm1449353lfe.191.2022.07.11.03.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 03:07:55 -0700 (PDT)
Message-ID: <9005c10b-01a6-b463-d150-1935e79f92eb@linaro.org>
Date: Mon, 11 Jul 2022 13:07:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 00/10] Add PSR support for eDP
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1657532880-12897-1-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657532880-12897-1-git-send-email-quic_vpolimer@quicinc.com>
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
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-kernel@vger.kernel.org, quic_khsieh@quicinc.com,
 bjorn.andersson@linaro.org, quic_aravindh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/07/2022 12:47, Vinod Polimera wrote:
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
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> 
> Vinod Polimera (10):
>    drm/msm/disp/dpu1: clear dpu_assign_crtc and get crtc from connector
>      state instead of dpu_enc

Generic comment: please use 'drm/msm/dpu:' prefix instead.

>    drm: add helper functions to retrieve old and new crtc
>    drm/msm/dp: use atomic callbacks for DP bridge ops
>    drm/msm/dp: Add basic PSR support for eDP
>    drm/msm/dp: use the eDP bridge ops to validate eDP modes
>    drm/bridge: use atomic enable/disable callbacks for panel bridge
>    drm/bridge: add psr support for panel bridge callbacks
>    drm/msm/disp/dpu1: use atomic enable/disable callbacks for encoder
>      functions
>    drm/msm/disp/dpu1: add PSR support for eDP interface in dpu driver
>    drm/msm/disp/dpu1: check for crtc enable rather than crtc active to
>      release shared resources
> 
>   drivers/gpu/drm/bridge/panel.c              |  68 ++++++++--
>   drivers/gpu/drm/drm_atomic.c                |  60 +++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  17 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  55 +++++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   8 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   2 +-
>   drivers/gpu/drm/msm/dp/dp_catalog.c         |  81 ++++++++++++
>   drivers/gpu/drm/msm/dp/dp_catalog.h         |   4 +
>   drivers/gpu/drm/msm/dp/dp_ctrl.c            |  73 +++++++++++
>   drivers/gpu/drm/msm/dp/dp_ctrl.h            |   3 +
>   drivers/gpu/drm/msm/dp/dp_display.c         |  31 +++--
>   drivers/gpu/drm/msm/dp/dp_display.h         |   2 +
>   drivers/gpu/drm/msm/dp/dp_drm.c             | 187 ++++++++++++++++++++++++++--
>   drivers/gpu/drm/msm/dp/dp_drm.h             |   9 +-
>   drivers/gpu/drm/msm/dp/dp_link.c            |  36 ++++++
>   drivers/gpu/drm/msm/dp/dp_panel.c           |  22 ++++
>   drivers/gpu/drm/msm/dp/dp_panel.h           |   6 +
>   drivers/gpu/drm/msm/dp/dp_reg.h             |  27 ++++
>   include/drm/drm_atomic.h                    |   7 ++
>   19 files changed, 634 insertions(+), 64 deletions(-)
> 


-- 
With best wishes
Dmitry
