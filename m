Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6906BD49D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A83910E0D7;
	Thu, 16 Mar 2023 16:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9FB10E2DA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:03:45 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5416b0ab0ecso40807627b3.6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678982625;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y4IWQ3qm69V7nWR3kZTl127u4+HwMbKM+fr7ufWkSq4=;
 b=FHYsepG+obu7nQ3hBQZraJsz/3pb5JM1zNSX5SnPB2+Aka3UWkijGG5NGPTtS5LC4n
 1MGM1jCwejxLh6tTFoWUgnkkBYsouhHgOERdQgvOwRm56ARvSi42PgqnRgPvIRzFJc6x
 z+6KQ1um4U0Zz38wCDJqLjtnpyhxbRT23ihiZ40691I759/y7YOBcGqST5vlb78rvbrf
 ZtV5vkqEMwy7FWxvjsnA+o7Nnx7S9A3MMB6WMr0lr7WefuEyvIT734TQZX6eoi3JcTPU
 qsgN4nFIjn7wxARSIUD9A0mU3QG+pVKEvIuccQjpM3d0nfrySjVa+SsU3ceBHKbNZ87J
 s+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678982625;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y4IWQ3qm69V7nWR3kZTl127u4+HwMbKM+fr7ufWkSq4=;
 b=YhYg5feDNkwf37LDHPhuyf1snJadtJs4QXaiIErumJ9f/ZvwIUsOJIYIDkg7Yp2QiA
 LU8CBZppgIzrTB0SVFxoF9HG+4JiykWPBh6n+lQUcVE4IVz/342KBmaYdvZQCcBVtnkL
 6ITqczqLf7voYixZA2LvgkECo9SOMruwnuD+P9dRBrpBIXYISq0EWfxEF/ZbbyWFq9OB
 DpJ8ozDkBcQw25NGWhiPBHELii5APXsozqwpLrIZ0vbIFbP7+p/BSXO3jaAUAXQvzNi0
 WK726+umFriFhIENlh25OlgULSevZlMafROtoN1OOzMHkb1uXe+5WwSOmcOegJhz5V8w
 kaBg==
X-Gm-Message-State: AO0yUKVt9jZQcCfYhRTnINxq1VHDN6UEk5Vw00gxd9Zvw/TY4RoMH96T
 cqaQapYoaTFZSWP5N3qgAsMFHU9E/Y93y9bPrIsHcw==
X-Google-Smtp-Source: AK7set9W4SZAF2xF+bd2nTCNFeQnySUL0JERjAQIpc9fH2qYvBQ6oTmQNhEm0Oac7eVav3YqSLPkJHsGWryzP8RQpDY=
X-Received: by 2002:a81:a708:0:b0:541:7f69:aa8b with SMTP id
 e8-20020a81a708000000b005417f69aa8bmr2423344ywh.5.1678982624792; Thu, 16 Mar
 2023 09:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-2-git-send-email-quic_khsieh@quicinc.com>
 <42b3c193-8897-cfe9-1cae-2f9a66f7983a@linaro.org>
 <741be2a3-0208-2f40-eedf-d439c4e6795b@quicinc.com>
 <F8A4FC18-C64E-4011-BC08-18EB3B95A357@linaro.org>
 <d5ee8233-66c8-9b88-417c-6cf9cc5c84fe@quicinc.com>
 <CAA8EJpro5Q-2ZpnDJt40UhFX7Zp9oBhrto=FDOERzCDR2BDPvQ@mail.gmail.com>
 <f0dfba42-4674-3748-bf5d-39f6e1745f67@quicinc.com>
 <f1a6ee82-9502-7ea5-fe48-f296fc7df497@linaro.org>
 <3e114c0f-a042-6801-69bf-67436cb2a448@quicinc.com>
 <113a10b6-6097-c80e-c29c-6f61b2b2896a@linaro.org>
 <c4c0ebf8-275d-500f-4019-e3d7517a884f@quicinc.com>
 <CAA8EJppxX4haZSwdvVbN7bc6kXAyNO1rg6zWZv9wPFdqGrcXuw@mail.gmail.com>
 <c650e746-64c5-ce6b-933d-057349356b78@quicinc.com>
 <58E03B71-20C4-4F81-96C1-6D8CE517F3FB@linaro.org>
 <fd876ad2-3fd0-eaab-3407-dd32d494f662@quicinc.com>
 <a5d1a74f-1b7a-569d-e487-774720dfae22@quicinc.com>
In-Reply-To: <a5d1a74f-1b7a-569d-e487-774720dfae22@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Mar 2023 18:03:33 +0200
Message-ID: <CAA8EJpq_mwUt0+1yGYo6hRx8Vz12DumVdpEjJbPk8gGHhGZ2bA@mail.gmail.com>
Subject: Re: [Freedreno] [RFC PATCH 1/2] drm/msm/dpu: add dsc helper functions
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, quic_sbillaka@quicinc.com,
 dianders@chromium.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 andersson@kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, agross@kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, marijn.suijten@somainline.org,
 swboyd@chromium.org, sean@poorly.run,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

[removed previous conversation]

>
> Hi Dmitry and Abhinav,
>
> Just wanted to follow up on this thread. I've gone over the MSM-specific
> DSC params for DP and DSI and have found a few shared calculations and
> variables between both DSI and DP paths:
>
> - (as mentioned earlier in the thread) almost all the calculations in
> dpu_dsc_populate_dsc_config() match dsi_populate_dsc_params() [1]. The
> only difference in the math I'm seeing is initial_scale_value.

The value in dsi code is valid for initial_offset = 6144. Please use
the formula from the standard (= sde_dsc_populate_dsc_config) and add
it to drm_dsc_helper.c

If I remember correctly the last remaining item in
dsi_populate_dsc_params() (except mentioned initial_offset) was
line_buf_depth, see [3]. I'm not sure about setting it to bpc+1.
According to the standard it should come from a DSC decoder spec,
which means it should be set by the DSI panel driver or via
drm_dp_dsc_sink_line_buf_depth() in the case of DP output.

> - dsc_extra_pclk_cycle_cnt and dce_bytes_per_line, which were introduced
> in Kuogee's v1 DSC series [2], are used for DSI, DP, and the DPU timing
> engine. dsc_extra_pclk_cycle_cnt is calculated based on pclk_per_line
> (which is calculated differently between DP and DSI), but
> dce_bytes_per_line is calculated the same way between DP and DSI.
>
> To avoid having to duplicate math in 2 different places, I think it
> would help to have these calculations in some msm_dsc_helper.c file. Any
> thoughts on this?

dsc_extra_pclk_cycle_cnt and dce_bytes_per_line are used only in DPU
code, so they can stay in DPU driver.

>
> Thanks,
>
> Jessica Zhang
>
> [1]
> https://elixir.bootlin.com/linux/v6.3-rc2/source/drivers/gpu/drm/msm/dsi/dsi_host.c#L1756
>
> [2] https://patchwork.freedesktop.org/patch/519845/?series=113240&rev=1

[3] https://patchwork.freedesktop.org/patch/525441/?series=114472&rev=2



-- 
With best wishes
Dmitry
