Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E741645DD8
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 16:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7474B10E143;
	Wed,  7 Dec 2022 15:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785B210E143
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 15:47:33 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so2041991pjo.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 07:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9GXVtFbyLH9bXbPp6XoAN6tnNePeiBDOdXpTyQdMNU8=;
 b=qBxziTGIEROT7SzFrJFkWDorJCQs/P38DM7vdfqHze/nkpaFKYGBCX14OryUXqwC6U
 0js3/UxKdJRK+y7bI55wnV1GJNiPPxagXJssETECJoLRMa4N+utAOam1dN9EIQFi7M8z
 Yc3sa1SxKfuVxfI9ky3VUawKcgQzJ4PunzOxx4+z15IswpsslAMOjtxtbYMavVoVFOxR
 d/yqfycBOQHg3N3dK9hMSVIACD+xVPqoCTFwp0qPdlssuqjS/NXnseecyzS/SOLdE8J7
 QphHNRlExgkTaUfGepgyxMVI7dEeQKlXawqczZZsB85U45fezwIzFIv6qVRHA8FhDjKp
 +9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9GXVtFbyLH9bXbPp6XoAN6tnNePeiBDOdXpTyQdMNU8=;
 b=pUxC7VahFLLWyMBZqYGQICV+IMwerOllDKocrTSAKnNdNMNTZm3RB9D3e/rJ1NpUff
 7jNGtqolLnD1uNMCp19NnV2TPPIJFciasMNb+MEu8zM8b+J2YRIc8S2eCoFhBdSJ+E+C
 oGjsbnHxWPMTk/KLtO2rotm5O9ARKlQXDNwooTOQIJ8QP/gF+JTgYWmj+KPnmIPCMCeo
 ENlwuKpA7d0OLmOnDGXZOEaWmeiAMJCUioPnQh/nbh4Frbo6BLJW2SGrb3ITIsCc1TP2
 C4hXz6QyR8f2mdMVugfv2Kvj8jsyORqNecIA9ODV+5fNnU8Mnf9hrOOZtTYfzzq001Nh
 GyQg==
X-Gm-Message-State: ANoB5plUQH2idL4CyvfEV9EdhYQOesjefGAuin29sWj91ba5LHgC7uXG
 zly6xouCCQxltLWt0BTDgsbAWGSQ5V0mP4ubGo1fTQ==
X-Google-Smtp-Source: AA0mqf6zI+5THu783lV/KS0RegQypSJtxXtCFoiK5hcSCkIGi/jqzF9fmfUHD5ZQXNbKUlXI09uuOn20iQQL/GbIT1I=
X-Received: by 2002:a17:90b:268b:b0:219:ff4d:b64b with SMTP id
 pl11-20020a17090b268b00b00219ff4db64bmr8237396pjb.164.1670428053074; Wed, 07
 Dec 2022 07:47:33 -0800 (PST)
MIME-Version: 1.0
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221005143618.v7.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
In-Reply-To: <20221005143618.v7.4.I5e64ff4b77bb9079eb2edeea8a02585c9e76778f@changeid>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 7 Dec 2022 16:46:56 +0100
Message-ID: <CAPDyKFp8ynYSyMc+gXWuW8dC1j07X+8k3omsKKnLA_u+4X-vvA@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] clk: qcom: gpucc-sc7280: Add cx collapse reset
 support
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, krzysztof.kozlowski@linaro.org,
 Andy Gross <agross@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Oct 2022 at 11:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> Allow a consumer driver to poll for cx gdsc collapse through Reset
> framework.

Would you mind extending this commit message, to allow us to better
understand what part is really the consumer part.

I was expecting the consumer part to be the GPU (adreno) driver, but I
may have failed to understand correctly. It would be nice to see an
example of a typical sequence, where the reset is being
asserted/deasserted, from the consumer point of view. Would you mind
explaining this a bit more?

>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Kind regards
Uffe

> ---
>
> (no changes since v3)
>
> Changes in v3:
> - Convert 'struct qcom_reset_ops cx_gdsc_reset' to 'static const' (Krzysztof)
>
> Changes in v2:
> - Minor update to use the updated custom reset ops implementation
>
>  drivers/clk/qcom/gpucc-sc7280.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
> index 9a832f2..fece3f4 100644
> --- a/drivers/clk/qcom/gpucc-sc7280.c
> +++ b/drivers/clk/qcom/gpucc-sc7280.c
> @@ -433,12 +433,22 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
>         .fast_io = true,
>  };
>
> +static const struct qcom_reset_ops cx_gdsc_reset = {
> +       .reset = gdsc_wait_for_collapse,
> +};
> +
> +static const struct qcom_reset_map gpucc_sc7280_resets[] = {
> +       [GPU_CX_COLLAPSE] = { .ops = &cx_gdsc_reset, .priv = &cx_gdsc },
> +};
> +
>  static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
>         .config = &gpu_cc_sc7280_regmap_config,
>         .clks = gpu_cc_sc7280_clocks,
>         .num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
>         .gdscs = gpu_cc_sc7180_gdscs,
>         .num_gdscs = ARRAY_SIZE(gpu_cc_sc7180_gdscs),
> +       .resets = gpucc_sc7280_resets,
> +       .num_resets = ARRAY_SIZE(gpucc_sc7280_resets),
>  };
>
>  static const struct of_device_id gpu_cc_sc7280_match_table[] = {
> --
> 2.7.4
>
