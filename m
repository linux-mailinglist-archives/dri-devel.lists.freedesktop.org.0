Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88866704023
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 23:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE10F10E297;
	Mon, 15 May 2023 21:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9F310E297
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 21:57:41 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-55a2cb9788dso189694817b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 14:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684187860; x=1686779860;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZjFA8JG+boBHtApx1W1Y1Xhnw+KcbpR1DWdRqTv9O08=;
 b=whHh4H0na5gYCL8b5GzIJnareJWs9QEZGYrfFV4AaQaY8C2oGojtV0xpPAGdtZbFyh
 CdSDukMo9OWdIsJ+GzgLUW7m7mijnipvAAn6NLfYnYdzndDawGxhX3zKHsAH2hC7TqdJ
 uRJZlw1ShqYNQfRkVJXiJ5N0sFnOI+tVYN96rQ0rRxoPTuoauLlAgGmlSUdTTlOp4MZu
 BaqzBscIH6qM29AlXU2TeoNvyyrFnbYznPKL+T3gMUsNtEjf24VfOuy/8TcGaIEtrzSo
 LYWnMbQaSn3BVr2a4MjOF2w1y0/INjddCDp6k21CELNkt959rBc8/5/QnKHA6IrpZFMx
 XPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684187860; x=1686779860;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZjFA8JG+boBHtApx1W1Y1Xhnw+KcbpR1DWdRqTv9O08=;
 b=Ce5BiNcbpfXwPLFLK19xZdigFjSeSpxwbDA8i5GQykciPs/KfS+/8M4BqBlwDwHYFZ
 /GsPi4FzYSsS7ZMagoJgMP/AOMNh+6Rz5MGmVgpguPjlZLDJWJ7bb+DMNiu421MR8Hvs
 KSdtVBzH3Auj4Cxvmjh0w4C5gi18w3vYs2jSUZ7aJl8kKsYcKSHlE+VtkzdZSf1xCP2a
 SqKXfZAcOkZUk9G2TpU5qQMgmtX522gz7aEfyLuq6GIdg8j5wqlhVylglXSw9FqE14A7
 IXy1xel3DGdGNWlQpI9kaO/QOBwxU7RX3f9rnGfkAFQ/HEoBsvgSSV56b3HnHqE2hMHO
 WcwA==
X-Gm-Message-State: AC+VfDxU+IyFpUlFe3kwlZZ3yCbq/erlItmma+TzpuDKdZYfAM53iUFi
 EVQY3VdGxknO6zTb+t12VcSs6bFvyuudF0jtuyQSpg==
X-Google-Smtp-Source: ACHHUZ6z8gNR0nAgnuyg7d/9En/fNuzcDBO2CeB5DEkDrKfL8s5sR+oPsHGOSU9ePGTe37Ap4f810X8xaCup6UkhSJ0=
X-Received: by 2002:a81:6046:0:b0:561:7cb7:6fb4 with SMTP id
 u67-20020a816046000000b005617cb76fb4mr891313ywb.7.1684187860372; Mon, 15 May
 2023 14:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <1684185928-24195-1-git-send-email-quic_khsieh@quicinc.com>
 <1684185928-24195-4-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1684185928-24195-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 May 2023 00:57:29 +0300
Message-ID: <CAA8EJppREQYCnCiA-2vTTmiyEa+ZN8Tj5-Q3Zq=dWEg+T3SLGw@mail.gmail.com>
Subject: Re: [PATCH v9 3/8] drm/msm/dpu: test DPU_PINGPONG_DSC bit before
 assign DSC ops to PINGPONG
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
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 May 2023 at 00:25, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> DPU < 7.0.0 has DPU_PINGPONG_DSC feature bit set to indicate it requires
> both dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() to be
> executed to complete DSC configuration if DSC hardware block is present.
> Hence test DPU_PINGPONG_DSC feature bit and assign DSC related functions
> to the ops of PINGPONG block accordingly if DPU_PINGPONG_DSC bit is set.
>
> changes in v6:
> -- split patches, this patch has function handles DPU_PINGPONG_DSC bit
>
> changes in v9:
> -- remove un condition assign dsc related functions to pingpong ops

Huh? This is beyond my parsing skills.

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)


-- 
With best wishes
Dmitry
