Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AE553A1C2
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 12:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B18110E9F6;
	Wed,  1 Jun 2022 10:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BB110E9F2
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 10:04:49 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id i68so895807qke.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 03:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lHSPQr2cIR/ntw9mchA0Qp1Mf6n70DWLKdFta7FA2i8=;
 b=rf0on8d64kNqqEPTSKDTeJLGi5mhx/w+LSPJtQsnkQKzerFRuh98mE1mlZVoerdEdB
 nilWximLlUxpwJOs6aAz4ko74Qc9SI1fC0RMONIZ9o6NiK4xAhDC905SK2U7UgYVPaTj
 39HnnlavGu7ksAvSci1lRnC1b6W/qVV7Lvsn892uJV3Z3R20E63iaxso4k8FTMBFdRCY
 1I2NERWc8n/ZlpGPw9fQnlfCPLBEdGUcbAXi+7ckTakLT2rvM4VyDnQwIZoSlf7TsSqj
 GWmnEf3wePEtp1Za+lfRaKXAM5SoA+GXn1A0hgDcQEob8ruq43wLLx4r+NgtiKwX2TQf
 SNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lHSPQr2cIR/ntw9mchA0Qp1Mf6n70DWLKdFta7FA2i8=;
 b=aE1u9qmNtWn5vva/uFuOCpeYrH8ZSno89cbf6xRBDaFky7/TydtJkYgy7V/oJZV0lP
 4kS1fz/PoOfvgRyxyk55qGRrmHvf1QdcfvCbFd6k0UVeriJSpWBo2QQ1co6RG87KB+Oj
 EswQk8Vw7dk/2+8XdUYYCaJUtVuTEQRPhVmx4ni5yH/L1sqQSqy6JXkUL+s5byARwWQt
 ERSw63YZ0dprdG32h86wZF+X3NtTxmaf3z9EfAd23Xp/vXnF0+73TMq88eEL9Y9z/SCN
 aY4V7MZFpCXFb1YBfYhChEz5MBm+hw/t93/aw91dJ9HAWsRWoeRI/Z+hLxv4fVVc0o0x
 kBDA==
X-Gm-Message-State: AOAM533PwnxRJSBCJCaGVHkqdeWLtJhAwHu5kPt1yiRcfXNT8xTxuMto
 JaNg2nAvd2lMbp47dYA4DpJmYLD4Rh2PXIOqaWDiCw==
X-Google-Smtp-Source: ABdhPJzAahRdMs1ggkVHLtcwa0pM08LnUkdsm3uZvqJc3UZYhpPnwH+rgos7SIKGM+mWOnxRi1I1hPNAfmBomXzhN+c=
X-Received: by 2002:a05:620a:4311:b0:67e:8a0f:4cd5 with SMTP id
 u17-20020a05620a431100b0067e8a0f4cd5mr44362828qko.363.1654077888548; Wed, 01
 Jun 2022 03:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220531160059.v2.1.Ie7f6d4bf8cce28131da31a43354727e417cae98d@changeid>
In-Reply-To: <20220531160059.v2.1.Ie7f6d4bf8cce28131da31a43354727e417cae98d@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 1 Jun 2022 13:04:37 +0300
Message-ID: <CAA8EJpqp64eDmXPN1qMTZ78My8BKPUcu7zKunZV1SJpzjSRDuQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Move min BW request and full BW disable
 back to mdss
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 1 Jun 2022 at 02:01, Douglas Anderson <dianders@chromium.org> wrote:
>
> In commit a670ff578f1f ("drm/msm/dpu: always use mdp device to scale
> bandwidth") we fully moved interconnect stuff to the DPU driver. This
> had no change for sc7180 but _did_ have an impact for other SoCs. It
> made them match the sc7180 scheme.

[skipped the description]

>
> Changes in v2:
> - Don't set bandwidth in init.
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  8 ----
>  drivers/gpu/drm/msm/msm_mdss.c          | 57 +++++++++++++++++++++++++
>  2 files changed, 57 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2b9d931474e0..3025184053e0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -49,8 +49,6 @@
>  #define DPU_DEBUGFS_DIR "msm_dpu"
>  #define DPU_DEBUGFS_HWMASKNAME "hw_log_mask"
>
> -#define MIN_IB_BW      400000000ULL /* Min ib vote 400MB */
> -
>  static int dpu_kms_hw_init(struct msm_kms *kms);
>  static void _dpu_kms_mmu_destroy(struct dpu_kms *dpu_kms);
>

[skipped]

> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 0454a571adf7..e13c5c12b775 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -5,6 +5,7 @@
>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/interconnect.h>
>  #include <linux/irq.h>
>  #include <linux/irqchip.h>
>  #include <linux/irqdesc.h>
> @@ -25,6 +26,8 @@
>  #define UBWC_CTRL_2                    0x150
>  #define UBWC_PREDICTION_MODE           0x154
>
> +#define MIN_IB_BW      400000000UL /* Min ib vote 400MB */

As msm_mdss is now used for both DPU and MDP5 devices, could you
please confirm that this value is valid for older devices too? E.g.
db410c or 8974

> +
>  struct msm_mdss {
>         struct device *dev;
>

-- 
With best wishes
Dmitry
