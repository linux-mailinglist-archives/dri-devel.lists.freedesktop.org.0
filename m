Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B36C066225C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B0210E3A9;
	Mon,  9 Jan 2023 10:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F16410E3A3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 10:02:20 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id c82so753592ybf.6
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 02:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9fhCNkHD8R84SoJprEs3JUZC7/T4pbSbQNPTyFgf4Mk=;
 b=haVBrLGAAw8RBM8DDoq/NYfhLGT3AQr+HDpqy55lprYj7DT2jCySVtSxw7KrqBnvNj
 p3C/pv/7KzpIslQILpCkRuFYvlF0jLcju5l5ocI6UwqzLwzWNhRCFqzodR9RNFb9VI4v
 HdEnRIfTQ7+p11jpYUsn7wFwGgHy4YgSCVb4pM0A7yY99R9s9jKim7KYuo8ROHN1aoxB
 IRsD0viL7tZmoHykMhESoyGsL5UHuHENxhgHHlnsqimd4WipoS3urdr/EyFfLgvohaE9
 eInJ1BTf/d9o4JeK+F5H90/EFUPUwzHZlBA3qTr6VA/th/JHVWz39xkut8vhFkRNAcox
 j3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9fhCNkHD8R84SoJprEs3JUZC7/T4pbSbQNPTyFgf4Mk=;
 b=3zAiQNIMNDGeGY1GOP8Kev2WzMtSxS9L6dmHLekuHJsAcoKBLz0exQf8VoWIskvzo6
 bMPGPlT4C3YEdCJ1FXHMPZ6PG8T83oN6mJfCPrPBfxQAbMasbLUGOgpduVpIhK6urTS9
 3RCoUytM2KY+3h3kYsZfNJs7i4P6jn4gwOUqyiinh9yaB8NK7LHuGI0rc72+LsvMZFI/
 x0DHxNTppwipH7v64ntUhJNhtqU3r/5dVMLK8odDt1NHYFs3/IY5KiKOA/LhuSc5uIpT
 KcI4z293Iw3+n3+8NiGLF9Kd5KenT8Ie27bf/X83A5CmHzIt5Rdwv3Fdy2Vs/yGjFg43
 NQKA==
X-Gm-Message-State: AFqh2koRn8U+g4NUTuHKArFbwW8lYagaUQG2bbLzfCg5DcM9cXfqpqi9
 jEJxHv02Ot9FXolDswIf9Vn4JQwemrivS9Yz7LuVjA==
X-Google-Smtp-Source: AMrXdXutmkdZr1tZGgCofhg5egpYmyIguSqC+tRQCcIDkVre+FY2EQqw3dOrugo0Zgf8XYKSI8LzafLyL3PjcHm8g/k=
X-Received: by 2002:a25:e90c:0:b0:73a:3b94:47fc with SMTP id
 n12-20020a25e90c000000b0073a3b9447fcmr7050410ybd.152.1673258539540; Mon, 09
 Jan 2023 02:02:19 -0800 (PST)
MIME-Version: 1.0
References: <20230103-topic-sm8550-upstream-mdss-dsi-v2-0-87f1c16d7635@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v2-6-87f1c16d7635@linaro.org>
 <b8e05110-e96d-0454-6990-27e2567c0e9a@linaro.org>
In-Reply-To: <b8e05110-e96d-0454-6990-27e2567c0e9a@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Jan 2023 12:02:08 +0200
Message-ID: <CAA8EJppG5PeaZZ9j6D8aPn3K7ZO+D=pN6dzqKdDztPshGp+f5A@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] drm/msm/dsi: add support for DSI-PHY on SM8550
To: neil.armstrong@linaro.org
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
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Jan 2023 at 11:38, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 09/01/2023 10:26, Neil Armstrong wrote:
> > SM8550 use a 4nm DSI PHYs, which share register definitions
> > with 7nm DSI PHYs. Rather than duplicating the driver, handle
> > 4nm variant inside the common 5+7nm driver.
> >
> > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/Kconfig               |  4 +-
> >   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 +
> >   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
> >   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 88 ++++++++++++++++++++++++++-----
> >   4 files changed, 79 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index e7b100d97f88..949b18a29a55 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -140,11 +140,11 @@ config DRM_MSM_DSI_10NM_PHY
> >         Choose this option if DSI PHY on SDM845 is used on the platform.
> >
> >   config DRM_MSM_DSI_7NM_PHY
> > -     bool "Enable DSI 7nm/5nm PHY driver in MSM DRM"
> > +     bool "Enable DSI 7nm/5nm/4nm PHY driver in MSM DRM"
> >       depends on DRM_MSM_DSI
> >       default y
> >       help
> > -       Choose this option if DSI PHY on SM8150/SM8250/SM8350/SM8450/SC7280
> > +       Choose this option if DSI PHY on SM8150/SM8250/SM8350/SM8450/SM8550/SC7280
> >         is used on the platform.
> >
> >   config DRM_MSM_HDMI
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > index 04126af74bb5..798cd3c86031 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > @@ -573,6 +573,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
> >         .data = &dsi_phy_5nm_8350_cfgs },
> >       { .compatible = "qcom,sm8450-dsi-phy-5nm",
> >         .data = &dsi_phy_5nm_8450_cfgs },
> > +     { .compatible = "qcom,dsi-phy-4nm-8550",
>
> Forgot to change this... I can resend a v3 with this fixed.

Yes, please.

>
> Neil
>
> > +       .data = &dsi_phy_4nm_8550_cfgs },
> >   #endif
> >       {}
> >   };
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > index f7a907ed2b4b..58f9e09f5224 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > @@ -59,6 +59,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
> >   extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
> >   extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
> >   extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
> > +extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
> >
> >   struct msm_dsi_dphy_timing {
> >       u32 clk_zero;
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > index 7b2c16b3a36c..af5c952c6ad0 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > @@ -47,6 +47,8 @@
> >   #define DSI_PHY_7NM_QUIRK_V4_2              BIT(2)
> >   /* Hardware is V4.3 */
> >   #define DSI_PHY_7NM_QUIRK_V4_3              BIT(3)
> > +/* Hardware is V5.2 */
> > +#define DSI_PHY_7NM_QUIRK_V5_2               BIT(4)
> >
> >   struct dsi_pll_config {
> >       bool enable_ssc;
> > @@ -124,14 +126,25 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
> >
> >       if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)
> >               config->pll_clock_inverters = 0x28;
> > -     else if (pll_freq <= 1000000000ULL)
> > -             config->pll_clock_inverters = 0xa0;
> > -     else if (pll_freq <= 2500000000ULL)
> > -             config->pll_clock_inverters = 0x20;
> > -     else if (pll_freq <= 3020000000ULL)
> > -             config->pll_clock_inverters = 0x00;
> > -     else
> > -             config->pll_clock_inverters = 0x40;
> > +     else if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
> > +             if (pll_freq <= 1300000000ULL)
> > +                     config->pll_clock_inverters = 0xa0;
> > +             else if (pll_freq <= 2500000000ULL)
> > +                     config->pll_clock_inverters = 0x20;
> > +             else if (pll_freq <= 4000000000ULL)
> > +                     config->pll_clock_inverters = 0x00;
> > +             else
> > +                     config->pll_clock_inverters = 0x40;
> > +     } else {
> > +             if (pll_freq <= 1000000000ULL)
> > +                     config->pll_clock_inverters = 0xa0;
> > +             else if (pll_freq <= 2500000000ULL)
> > +                     config->pll_clock_inverters = 0x20;
> > +             else if (pll_freq <= 3020000000ULL)
> > +                     config->pll_clock_inverters = 0x00;
> > +             else
> > +                     config->pll_clock_inverters = 0x40;
> > +     }
> >
> >       config->decimal_div_start = dec;
> >       config->frac_div_start = frac;
> > @@ -222,6 +235,13 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
> >                       vco_config_1 = 0x01;
> >       }
> >
> > +     if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
> > +             if (pll->vco_current_rate < 1557000000ULL)
> > +                     vco_config_1 = 0x08;
> > +             else
> > +                     vco_config_1 = 0x01;
> > +     }
> > +
> >       dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_1,
> >                     analog_controls_five_1);
> >       dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_VCO_CONFIG_1, vco_config_1);
> > @@ -860,7 +880,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
> >               pr_warn("PLL turned on before configuring PHY\n");
> >
> >       /* Request for REFGEN READY */
> > -     if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
> > +     if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
> > +         (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
> >               dsi_phy_write(phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x1);
> >               udelay(500);
> >       }
> > @@ -894,7 +915,19 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
> >               lane_ctrl0 = 0x1f;
> >       }
> >
> > -     if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
> > +     if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
> > +             if (phy->cphy_mode) {
> > +                     vreg_ctrl_0 = 0x45;
> > +                     vreg_ctrl_1 = 0x45;
> > +                     glbl_rescode_top_ctrl = 0x00;
> > +                     glbl_rescode_bot_ctrl = 0x00;
> > +             } else {
> > +                     vreg_ctrl_0 = 0x44;
> > +                     vreg_ctrl_1 = 0x19;
> > +                     glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3c :  0x03;
> > +                     glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3c;
> > +             }
> > +     } else if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3)) {
> >               if (phy->cphy_mode) {
> >                       glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
> >                       glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3b;
> > @@ -943,9 +976,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
> >       dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_RBUF_CTRL, 0x00);
> >
> >       /* program CMN_CTRL_4 for minor_ver 2 chipsets*/
> > -     data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_REVISION_ID0);
> > -     data = data & (0xf0);
> > -     if (data == 0x20)
> > +     if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
> > +         (dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_REVISION_ID0) & (0xf0)) == 0x20)
> >               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_CTRL_4, 0x04);
> >
> >       /* Configure PHY lane swap (TODO: we need to calculate this) */
> > @@ -1058,7 +1090,8 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
> >       dsi_phy_hw_v4_0_config_lpcdrx(phy, false);
> >
> >       /* Turn off REFGEN Vote */
> > -     if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
> > +     if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
> > +         (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
> >               dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x0);
> >               wmb();
> >               /* Delay to ensure HW removes vote before PHY shut down */
> > @@ -1092,6 +1125,10 @@ static const struct regulator_bulk_data dsi_phy_7nm_97800uA_regulators[] = {
> >       { .supply = "vdds", .init_load_uA = 97800 },
> >   };
> >
> > +static const struct regulator_bulk_data dsi_phy_7nm_98400uA_regulators[] = {
> > +     { .supply = "vdds", .init_load_uA = 98400 },
> > +};
> > +
> >   const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
> >       .has_phy_lane = true,
> >       .regulator_data = dsi_phy_7nm_36mA_regulators,
> > @@ -1201,3 +1238,26 @@ const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs = {
> >       .num_dsi_phy = 2,
> >       .quirks = DSI_PHY_7NM_QUIRK_V4_3,
> >   };
> > +
> > +const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
> > +     .has_phy_lane = true,
> > +     .regulator_data = dsi_phy_7nm_98400uA_regulators,
> > +     .num_regulators = ARRAY_SIZE(dsi_phy_7nm_98400uA_regulators),
> > +     .ops = {
> > +             .enable = dsi_7nm_phy_enable,
> > +             .disable = dsi_7nm_phy_disable,
> > +             .pll_init = dsi_pll_7nm_init,
> > +             .save_pll_state = dsi_7nm_pll_save_state,
> > +             .restore_pll_state = dsi_7nm_pll_restore_state,
> > +             .set_continuous_clock = dsi_7nm_set_continuous_clock,
> > +     },
> > +     .min_pll_rate = 600000000UL,
> > +#ifdef CONFIG_64BIT
> > +     .max_pll_rate = 5000000000UL,
> > +#else
> > +     .max_pll_rate = ULONG_MAX,
> > +#endif
> > +     .io_start = { 0xae95000, 0xae97000 },
> > +     .num_dsi_phy = 2,
> > +     .quirks = DSI_PHY_7NM_QUIRK_V5_2,
> > +};
> >
>


-- 
With best wishes
Dmitry
