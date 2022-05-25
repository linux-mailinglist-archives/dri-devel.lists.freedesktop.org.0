Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBD3534528
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 22:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF7EB10F00D;
	Wed, 25 May 2022 20:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9ED10F006
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 20:42:18 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id gi33so35458742ejc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 13:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r1tmkvp6sDA4X5j5VRkmkL2D7IkhmAAW95A+ijZhkJU=;
 b=hdSlEDp6nSKW7SL4b+AAwfShBQ5wbLAsHH1qJvozSkZcPfy7F/OpM87KatYUA6vrCY
 YxJ6g9EIN21FrdFF6xXIgjDU7gyTD6ce6WiCIQSDeEly7Ydtv7jbbckJmndfgWjC7Xwd
 D/tuOIe/q2WnOKZglCmgOxs0ik1oxM7G9rcbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r1tmkvp6sDA4X5j5VRkmkL2D7IkhmAAW95A+ijZhkJU=;
 b=ESghAa9q7S7FoXD5yvnPfic5PUbBttmEsSSPNIlR+4cr5IxoznLaOJOp8xuDDZ2Ud/
 92FfDqDE4q+8KN4GfD2xz7Bnb+/k/kDr5tp5MpQIQNbDbLCokZ0+O63LKww5uEKvEH5M
 4A9dbBEGYHHpgkmB3HM2/0K1b2qSfsl4gp+ba69NfHeQa2WyvbfvCwbu8B1clbS79fLM
 cAYEb6Gh1sSfmoBgv+cHXNkVbJovDwSbASYFRShVrCrYLs2XMKFTNtHC13j/PAQ3TDMa
 8AZg5ujzH8s7BShaah2KNIbCNkAuXoi6n19q6rL6ZZPksu2Z5tHsPyiQKhEHF+92F1on
 iIjQ==
X-Gm-Message-State: AOAM5309zWeATFPmAbOTSsdQP6LQVyEl+378eI2hRHQJwoGfpCtjYNIW
 DPsOnK3vOg4t3NXz6OR7QwJJDOYYJAc6Ppmwy4A=
X-Google-Smtp-Source: ABdhPJyIdgTRwlmmWcXxMnIOpgtwRCUXPvdhdWh0zn2wDM9KVCo55G5xk5XjGrId/ch+qSLZeznrTg==
X-Received: by 2002:a17:906:5d06:b0:6fe:94f7:b187 with SMTP id
 g6-20020a1709065d0600b006fe94f7b187mr31786010ejt.591.1653511336091; 
 Wed, 25 May 2022 13:42:16 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com.
 [209.85.221.54]) by smtp.gmail.com with ESMTPSA id
 z9-20020a1709063ac900b006fedcb78854sm3686130ejd.164.2022.05.25.13.42.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 13:42:14 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id l30so3077475wrb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 13:42:14 -0700 (PDT)
X-Received: by 2002:a05:6000:1548:b0:20f:c4e3:637a with SMTP id
 8-20020a056000154800b0020fc4e3637amr19353512wry.513.1653511334048; Wed, 25
 May 2022 13:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <1653507433-22585-1-git-send-email-quic_khsieh@quicinc.com>
 <1653507433-22585-3-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1653507433-22585-3-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 25 May 2022 13:42:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VgZi7TpC6q2jvE+jfUQxUjXRZP3QAp-aP39zfD1XjRkg@mail.gmail.com>
Message-ID: <CAD=FV=VgZi7TpC6q2jvE+jfUQxUjXRZP3QAp-aP39zfD1XjRkg@mail.gmail.com>
Subject: Re: [PATCH v12 2/3] phy: qcom-qmp: add regulator_set_load to dp phy
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 25, 2022 at 12:37 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> This patch add regulator_set_load() before enable regulator at
> DP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 41 +++++++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index b144ae1..5fda39f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -3075,6 +3075,17 @@ static const struct qmp_phy_init_tbl sm8450_qmp_gen4x2_pcie_pcs_misc_tbl[] = {
>         QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN, 0x2e),
>  };
>
> +/* list of regulators */
> +struct qmp_regulator_data {
> +       const char *name;
> +       unsigned int enable_load;
> +};
> +
> +struct qmp_regulator_data qmp_phy_vreg_l[] = {
> +       { .name = "vdda-phy", .enable_load = 21800 },
> +       { .name = "vdda-pll", .enable_load = 36000 },
> +};
> +
>  struct qmp_phy;
>
>  /* struct qmp_phy_cfg - per-PHY initialization config */
> @@ -3129,7 +3140,7 @@ struct qmp_phy_cfg {
>         const char * const *reset_list;
>         int num_resets;
>         /* regulators to be requested */
> -       const char * const *vreg_list;
> +       const struct qmp_regulator_data *vreg_list;
>         int num_vregs;
>
>         /* array of registers with different offsets */
> @@ -3341,11 +3352,6 @@ static const char * const sdm845_pciephy_reset_l[] = {
>         "phy",
>  };
>
> -/* list of regulators */
> -static const char * const qmp_phy_vreg_l[] = {
> -       "vdda-phy", "vdda-pll",
> -};
> -
>  static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
>         .type                   = PHY_TYPE_USB3,
>         .nlanes                 = 1,
> @@ -5488,16 +5494,33 @@ static int qcom_qmp_phy_vreg_init(struct device *dev, const struct qmp_phy_cfg *
>  {
>         struct qcom_qmp *qmp = dev_get_drvdata(dev);
>         int num = cfg->num_vregs;
> -       int i;
> +       int ret, i;
>
>         qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
>         if (!qmp->vregs)
>                 return -ENOMEM;
>
>         for (i = 0; i < num; i++)
> -               qmp->vregs[i].supply = cfg->vreg_list[i];
> +               qmp->vregs[i].supply = cfg->vreg_list[i].name;
>
> -       return devm_regulator_bulk_get(dev, num, qmp->vregs);
> +       ret = devm_regulator_bulk_get(dev, num, qmp->vregs);
> +       if (ret) {
> +               dev_err(dev, "failed at devm_regulator_bulk_get\n");
> +               goto err;

There's no reason for a goto and in general kernel style that I've
seen would suggest just "return ret;" here


> +       }
> +
> +       for (i = 0; i < num; i++) {
> +               ret = regulator_set_load(qmp->vregs[i].consumer,
> +                                       cfg->vreg_list[i].enable_load);

super nitty, but there should be one more space before "cfg" to line
up under the parenthesis.


> +               if (ret) {
> +                       dev_err(dev, "failed to set load at %s\n",
> +                               qmp->vregs[i].supply);
> +                       break;

optional: I guess I don't care tons, but I'd be tempted to just
"return ret;" here. Then at the end of the function just "return 0;"


All of these are pretty nitty though, so I'm happy enough with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

On Wed, May 25, 2022 at 12:37 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> This patch add regulator_set_load() before enable regulator at
> DP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 41 +++++++++++++++++++++++++++++--------
>  1 file changed, 32 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index b144ae1..5fda39f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -3075,6 +3075,17 @@ static const struct qmp_phy_init_tbl sm8450_qmp_gen4x2_pcie_pcs_misc_tbl[] = {
>         QMP_PHY_INIT_CFG(QPHY_V5_20_PCS_PCIE_G4_PRE_GAIN, 0x2e),
>  };
>
> +/* list of regulators */
> +struct qmp_regulator_data {
> +       const char *name;
> +       unsigned int enable_load;
> +};
> +
> +struct qmp_regulator_data qmp_phy_vreg_l[] = {
> +       { .name = "vdda-phy", .enable_load = 21800 },
> +       { .name = "vdda-pll", .enable_load = 36000 },
> +};
> +
>  struct qmp_phy;
>
>  /* struct qmp_phy_cfg - per-PHY initialization config */
> @@ -3129,7 +3140,7 @@ struct qmp_phy_cfg {
>         const char * const *reset_list;
>         int num_resets;
>         /* regulators to be requested */
> -       const char * const *vreg_list;
> +       const struct qmp_regulator_data *vreg_list;
>         int num_vregs;
>
>         /* array of registers with different offsets */
> @@ -3341,11 +3352,6 @@ static const char * const sdm845_pciephy_reset_l[] = {
>         "phy",
>  };
>
> -/* list of regulators */
> -static const char * const qmp_phy_vreg_l[] = {
> -       "vdda-phy", "vdda-pll",
> -};
> -
>  static const struct qmp_phy_cfg ipq8074_usb3phy_cfg = {
>         .type                   = PHY_TYPE_USB3,
>         .nlanes                 = 1,
> @@ -5488,16 +5494,33 @@ static int qcom_qmp_phy_vreg_init(struct device *dev, const struct qmp_phy_cfg *
>  {
>         struct qcom_qmp *qmp = dev_get_drvdata(dev);
>         int num = cfg->num_vregs;
> -       int i;
> +       int ret, i;
>
>         qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
>         if (!qmp->vregs)
>                 return -ENOMEM;
>
>         for (i = 0; i < num; i++)
> -               qmp->vregs[i].supply = cfg->vreg_list[i];
> +               qmp->vregs[i].supply = cfg->vreg_list[i].name;
>
> -       return devm_regulator_bulk_get(dev, num, qmp->vregs);
> +       ret = devm_regulator_bulk_get(dev, num, qmp->vregs);
> +       if (ret) {
> +               dev_err(dev, "failed at devm_regulator_bulk_get\n");
> +               goto err;
> +       }
> +
> +       for (i = 0; i < num; i++) {
> +               ret = regulator_set_load(qmp->vregs[i].consumer,
> +                                       cfg->vreg_list[i].enable_load);
> +               if (ret) {
> +                       dev_err(dev, "failed to set load at %s\n",
> +                               qmp->vregs[i].supply);
> +                       break;
> +               }
> +       }
> +
> +err:
> +       return ret;
>  }
>
>  static int qcom_qmp_phy_reset_init(struct device *dev, const struct qmp_phy_cfg *cfg)
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
