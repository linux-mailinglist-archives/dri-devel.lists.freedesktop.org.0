Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6950E714220
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 04:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF8A10E13E;
	Mon, 29 May 2023 02:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D17610E13E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 02:43:08 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-bad010e1e50so4373415276.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 May 2023 19:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685328187; x=1687920187;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IEJy3ZwHzEy4yCdUkI2WmoNuXKG8YRae4C35/I9rrQI=;
 b=pca0tv3H16nEDflyHqTLct4q2s14vmeOwMRRAIuPZlGGf8r/09QyYaKd5+smAXfi91
 +ObXTXFYeHA9EUL7qRxyl84sYdTjazxwuHuUp0NvyQtQrqueIA5/frwVrNvOUBD/IURk
 zK0y+TJf8Ww1BtCSttM9A7dJ5jN6zBPgrKQ6c8DrJf1z243qY8+k29PIo1zpkdZRRqi3
 Bh74HCgKKz8RjzlOOjPG3mtHsfp5dcCMlu2ZjsPoO7c1l8sDEDO0YQl/tpNgkXnu8okX
 GLAgVfdYWeuqxiTVaPvLwci1XlJpo+Uc90hESJUs8EALEC5LJS5sanx/tw267tM3BpLI
 jLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685328187; x=1687920187;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IEJy3ZwHzEy4yCdUkI2WmoNuXKG8YRae4C35/I9rrQI=;
 b=dVratVQu97W3CHb1UP3a9pGVuBqVI0eWRMpFVKX81ipcGXWo7XPOargV1pvBqCJ/JX
 YnwJSxLGLcZblme7hS6ARBQuLo4SkG+zDyMTr8q/jY8eMHQKAv+0QtVmMcAO0KiGIIVg
 FAU69SJAHPG16i2TJk7e4KIVnYry8dW6ar2gozAyKN/l6UNwiPIPTAsDhCXO55Jx0zBz
 d4NvJCxGZE8X4OBaiyAGr1WVGTCdGJ5ptQF5SAjH22GTgNuZKZMffBUHNi25v94VG2Ya
 4rxxgo4o7nqn2x2aQhEh3VRv8kw+Ay8EWfgRp0ZeUO1MusW6tlHukrGuVkaVaDmRfM40
 4diQ==
X-Gm-Message-State: AC+VfDwYKznDVupxA8Tg2CV8MJJ3kOrfmOmwF7qMBioulpAMoKdUlx2B
 IC6CVfC+YITuhn5RmhY2W5lrKr2mV1ahkeGS+9VvHw==
X-Google-Smtp-Source: ACHHUZ5XV/gF2y/I0UIU3VnTl0YmVllZOQBSSNK7fEM/ZUZqxnFUeDIcm7rVQlBnxW/2PI1fPmCsA3C5q16msloHh3Y=
X-Received: by 2002:a81:4982:0:b0:565:ef60:3f2f with SMTP id
 w124-20020a814982000000b00565ef603f2fmr3962824ywa.44.1685328186991; Sun, 28
 May 2023 19:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 May 2023 05:42:56 +0300
Message-ID: <CAA8EJpo8X7KrrXoButyW0d1Lz=a5Stw2inFGt2R7KJ+2NTX6wA@mail.gmail.com>
Subject: Re: [PATCH 0/5] MDSS reg bus interconnect
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Apr 2023 at 18:30, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
>
> Gating that path may have a variety of effects.. from none to otherwise
> inexplicable DSI timeouts..
>
> This series tries to address the lack of that.
>
> Example path:
>
> interconnects = <&bimc MASTER_AMPSS_M0 0 &config_noc SLAVE_DISPLAY_CFG 0>;

If we are going to touch the MDSS interconnects, could you please also
add the rotator interconnect to the bindings?
We do not need to touch it at this time, but let's not have to change
bindings later again.

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (5):
>       dt-bindings: display/msm: Add reg bus interconnect
>       drm/msm/dpu1: Rename path references to mdp_path
>       drm/msm/mdss: Rename path references to mdp_path
>       drm/msm/mdss: Handle the reg bus ICC path
>       drm/msm/dpu1: Handle the reg bus ICC path
>
>  .../bindings/display/msm/mdss-common.yaml          |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      | 10 +++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 34 ++++++++++++++++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  5 ++--
>  drivers/gpu/drm/msm/msm_mdss.c                     | 35 ++++++++++++++--------
>  5 files changed, 57 insertions(+), 28 deletions(-)
> ---
> base-commit: d3f2cd24819158bb70701c3549e586f9df9cee67
> change-id: 20230417-topic-dpu_regbus-abc94a770952
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@linaro.org>
>


-- 
With best wishes
Dmitry
