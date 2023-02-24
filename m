Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A766A2543
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 00:57:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2689310E5D8;
	Fri, 24 Feb 2023 23:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1A710E56E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 23:57:13 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-536bf92b55cso22058287b3.12
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Feb 2023 15:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oTwH63vhsPUHCzwdo61GhnH28Y4i2//starUXdJIgb8=;
 b=DBw7IzE5NgvoWL7Yv3rGTZv8qnoe+Pzd9l8UT4RUfLxKwtC6hTLlnwF833rVKEmhSs
 9xOt/hKIX65JKE4DdsPv6FZLEN2rb/X2Bo342B2EThsKH1Dqer/Ovpscw1NgzpPLT8X7
 4emDysrEduOgZ9JLltkEdtPRBLVPtHgdAT0HNJkH5MZU2Dp+FgVixRp9E2nkmuv5gg/c
 2+6tW2XElSs5Zdb36sWnRpn0wTx56nEX+qF4y4JPeMLpVQJOZJKIo9MzhcpxIb9R/ATX
 +m/4KEPWint3sik9YaBKgH4CkikMVa+ad3Etdwzs5vMSmEMR9Nd8EEvy68/c9paG8HWm
 73QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oTwH63vhsPUHCzwdo61GhnH28Y4i2//starUXdJIgb8=;
 b=PQKtRXAbMeuOLIr1bAZw+XO44Ds+3hOOUAgs6wVW+iVVjdJh8f37ChJQ3vGxnVEXo+
 foKsuEkWGe6SampyB4IwBvaP+w73+g3apJl4nUtLuo7kqwSvXsPzQ873+59CAUFpekEX
 tm5KPZ6aM/kDAJd+/1fZehTJZ/b2+Pq3eEeLbKmYyPwfJQ3JgSbWpgSxXv/zCoV/UzAG
 R8EgeU4jTsRQqS5hnpAwGgfCiaZaH6AXPVkGQ1H+XLSc7sBhH6neml4jPmwkfyMuNJCK
 VqCmnPG2GL4LZ5dLOus1ONTxkQOoYgxXM8xwUp/tieh7BUotVc8B1XCFWi7i4R3Fuo6k
 BPhg==
X-Gm-Message-State: AO0yUKUps7oIL0FaXbL8K457+WBkAcEXZGfvW9k4g2V2RwONGLB2Eb2A
 Mp+46PyBZggF4nt6sKYF5KOruGlToBKhiSSpWx6HUw==
X-Google-Smtp-Source: AK7set+CKAAk4bPnyFYIOvxwz2JBmKTwmgqC3ZbR6JqTCAuMnOEE9zP/DONxCqzL8Q5pCNfKGzrSvc/9xN/AN4WKfEw=
X-Received: by 2002:a05:6902:43:b0:9f2:a18c:90ed with SMTP id
 m3-20020a056902004300b009f2a18c90edmr4212261ybh.10.1677283032150; Fri, 24 Feb
 2023 15:57:12 -0800 (PST)
MIME-Version: 1.0
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-2-git-send-email-quic_khsieh@quicinc.com>
 <42b3c193-8897-cfe9-1cae-2f9a66f7983a@linaro.org>
 <1b5afec9-454d-e1b9-0274-f0476edb4d21@quicinc.com>
In-Reply-To: <1b5afec9-454d-e1b9-0274-f0476edb4d21@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Feb 2023 01:57:01 +0200
Message-ID: <CAA8EJprowFyBMdW5QC2zG0gYUtxJ-hHXqhPfYTct2GzYJKLSHg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/msm/dpu: add dsc helper functions
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org,
 marijn.suijten@somainline.org, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Feb 2023 at 01:51, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 2/24/2023 1:13 PM, Dmitry Baryshkov wrote:
> > On 24/02/2023 21:40, Kuogee Hsieh wrote:
> >> Add DSC helper functions based on DSC configuration profiles to produce
> >> DSC related runtime parameters through both table look up and runtime
> >> calculation to support DSC on DPU.
> >>
> >> There are 6 different DSC configuration profiles are supported
> >> currently.
> >> DSC configuration profiles are differiented by 5 keys, DSC version
> >> (V1.1),
> >> chroma (444/422/420), colorspace (RGB/YUV), bpc(8/10),
> >> bpp (6/7/7.5/8/9/10/12/15) and SCR (0/1).
> >>
> >> Only DSC version V1.1 added and V1.2 will be added later.
> >
> > These helpers should go to drivers/gpu/drm/display/drm_dsc_helper.c
> > Also please check that they can be used for i915 or for amdgpu
> > (ideally for both of them).
> >
> > I didn't check the tables against the standard (or against the current
> > source code), will do that later.
> >
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/Makefile                   |   1 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c | 209
> >> +++++++++++++++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h |  34 ++++
> >>   3 files changed, 244 insertions(+)
> >>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
> >>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.h
> >>
> >> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> >> index 7274c412..28cf52b 100644
> >> --- a/drivers/gpu/drm/msm/Makefile
> >> +++ b/drivers/gpu/drm/msm/Makefile
> >> @@ -65,6 +65,7 @@ msm-$(CONFIG_DRM_MSM_DPU) += \
> >>       disp/dpu1/dpu_hw_catalog.o \
> >>       disp/dpu1/dpu_hw_ctl.o \
> >>       disp/dpu1/dpu_hw_dsc.o \
> >> +    disp/dpu1/dpu_dsc_helper.o \
> >>       disp/dpu1/dpu_hw_interrupts.o \
> >>       disp/dpu1/dpu_hw_intf.o \
> >>       disp/dpu1/dpu_hw_lm.o \
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
> >> b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
> >> new file mode 100644
> >> index 00000000..88207e9
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_dsc_helper.c
> >> @@ -0,0 +1,209 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights
> >> reserved
> >> + */
> >> +
> >> +#include <drm/display/drm_dsc_helper.h>
> >> +#include "msm_drv.h"
> >> +#include "dpu_kms.h"
> >> +#include "dpu_hw_dsc.h"
> >> +#include "dpu_dsc_helper.h"
> >> +
> >> +
> >
> > Extra empty line
> >
> >> +#define DPU_DSC_PPS_SIZE       128
> >> +
> >> +enum dpu_dsc_ratio_type {
> >> +    DSC_V11_8BPC_8BPP,
> >> +    DSC_V11_10BPC_8BPP,
> >> +    DSC_V11_10BPC_10BPP,
> >> +    DSC_V11_SCR1_8BPC_8BPP,
> >> +    DSC_V11_SCR1_10BPC_8BPP,
> >> +    DSC_V11_SCR1_10BPC_10BPP,
> >> +    DSC_RATIO_TYPE_MAX
> >> +};
> >> +
> >> +
> >> +static u16 dpu_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
> >> +        0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54,
> >> +        0x62, 0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
> >
> > Weird indentation
> >
> >> +};
> >> +
> >> +/*
> >> + * Rate control - Min QP values for each ratio type in
> >> dpu_dsc_ratio_type
> >> + */
> >> +static char
> >> dpu_dsc_rc_range_min_qp[DSC_RATIO_TYPE_MAX][DSC_NUM_BUF_RANGES] = {
> >> +    /* DSC v1.1 */
> >> +    {0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 7, 13},
> >> +    {0, 4, 5, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 17},
> >> +    {0, 4, 5, 6, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 15},
> >> +    /* DSC v1.1 SCR and DSC v1.2 RGB 444 */
> >
> > What is SCR? Is there any reason to use older min/max Qp params
> > instead of always using the ones from the VESA-DSC-1.1 standard?
>
> Standards change request, some vendors may use scr to work with their panel.
>
> These table value are provided by system team.

So, what will happen if we use values from 1.2 standard (aka 1.1 SCR
1) with the older panel?

> >> +    {0, 0, 1, 1, 3, 3, 3, 3, 3, 3, 5, 5, 5, 9, 12},
> >> +    {0, 4, 5, 5, 7, 7, 7, 7, 7, 7, 9, 9, 9, 13, 16},
> >> +    {0, 4, 5, 6, 7, 7, 7, 7, 7, 7, 9, 9, 9, 11, 15},


-- 
With best wishes
Dmitry
