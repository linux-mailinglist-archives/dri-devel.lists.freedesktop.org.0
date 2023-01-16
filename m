Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9099966BD23
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 12:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9943010E3D7;
	Mon, 16 Jan 2023 11:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5863510E3D8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 11:47:42 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id 188so29917677ybi.9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 03:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RBf39+z4ErBa48WOVq36Ef3lCWm7DQwVSyfmLd9/PQE=;
 b=SZtEaI37+UvOiuCsh7Z8U1GbTRPuHHkCPFC9ujGTJKN+/e5MxOWwDXcd17t8kRciqM
 LuAZN9jlv+Uif6o6JolMySPsGuwXe5KJJ5/Oi6t6jpxYJEN9T5nPJHBYJjRFTm+fT0NI
 ++ighlshCjO6sDZnRp1RoGvPz8rSVoNAVFLiw4Q4k3/BwaTpAMExtj/DT2ECOV9XbFJ8
 oud4jnAx6GuqiYSIPHqz8N86LiTALmx3gccmIyJf6BfyzL/0EHU2t+QtTzwtz8sDVZSt
 LSOAbvoZMNpAT5S1EG3SBZHidrBMYzo7Y0sj1KhMzEscdU8e+3FxPI46hhS04NJ3xCTh
 87uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RBf39+z4ErBa48WOVq36Ef3lCWm7DQwVSyfmLd9/PQE=;
 b=4GJf6rExmnKw7qYS1JyryV9L06JNipqpu7DRsPKk04GVVDpkk01hlQvk2Yf1LW468X
 /BtqgjCLV9xmihaOTVOCRW8jEUHmrOgZuUER1NI6mRpheGo2VYpNLqfZDOSwHP11M4k3
 ySXlsWrL1fDhgb5Av7saM/8owGZ6bLP7SNXRp6YGkuZ6JqjHKCuaKzLa9FroW6YC7hUz
 xDITipbXikMdHUSk8SKHUjEMZmDBM5vlLHKFq3yNJNdnshPn4JLbt39HblTUr6LeUu+E
 WiuoNE8dVUiOB8UtBEOnCS24IudgkJhNcysRbZfxsTNNt0n9cPfdzlva76oOtbOTmtDa
 URIg==
X-Gm-Message-State: AFqh2kpJW48DgDs8wE/eHRhVz553cN63CE0pAWpGTTP+jPaxFTFTMPYF
 M8rZEIf/1mkRsuOLw7bw1QaeKO0kA4S5PgRDykqz5g==
X-Google-Smtp-Source: AMrXdXtHHHK1YcteV3Q0i4v+HDquYjRu4C/hl7moGBKdK9coM9J1UhmoR+Sv0CC5pOUAkzLqAAKY7j4Gk17/dJEEn0E=
X-Received: by 2002:a25:606:0:b0:709:9335:236e with SMTP id
 6-20020a250606000000b007099335236emr7936674ybg.288.1673869661448; Mon, 16 Jan
 2023 03:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20230116114059.346327-1-konrad.dybcio@linaro.org>
 <20230116114059.346327-2-konrad.dybcio@linaro.org>
 <3b4e5183-25c4-ab04-6b0c-74a57540d00e@linaro.org>
In-Reply-To: <3b4e5183-25c4-ab04-6b0c-74a57540d00e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Jan 2023 13:47:30 +0200
Message-ID: <CAA8EJprgFA-vod9vnt+uzptzgbvbrMSe+zOpd2ftsz0pS9jb8w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dsi: Add phy configuration for SM6375
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 marijn.suijten@somainline.org, Jonathan Marek <jonathan@marek.ca>,
 agross@kernel.org, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, andersson@kernel.org,
 Douglas Anderson <dianders@chromium.org>, krzysztof.kozlowski@linaro.org,
 sunliming <sunliming@kylinos.cn>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 Jan 2023 at 13:42, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 16.01.2023 12:40, Konrad Dybcio wrote:
> > From: Konrad Dybcio <konrad.dybcio@somainline.org>
> >
> > SM6375 uses a boring standard 7nm PHY. Add a configuration entry for it.
> >
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> > ---
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Sorry, bit messy revisiting old patches before the email change..
>
> Konrad
> > Depends on [1] to work properly, but won't hurt for it to land
> > separately..
> >
> > [1] https://patchwork.kernel.org/project/linux-arm-msm/patch/1642586079-12472-1-git-send-email-loic.poulain@linaro.org/
> >
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 20 ++++++++++++++++++++
> >  3 files changed, 23 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > index cbe669fca26d..57445a5dc816 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> > @@ -569,6 +569,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
> >         .data = &dsi_phy_7nm_8150_cfgs },
> >       { .compatible = "qcom,sc7280-dsi-phy-7nm",
> >         .data = &dsi_phy_7nm_7280_cfgs },
> > +     { .compatible = "qcom,sm6375-dsi-phy-7nm",
> > +       .data = &dsi_phy_7nm_6375_cfgs },
> >       { .compatible = "qcom,sm8350-dsi-phy-5nm",
> >         .data = &dsi_phy_5nm_8350_cfgs },
> >       { .compatible = "qcom,sm8450-dsi-phy-5nm",
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > index 5f0b1c9b09ef..c849bfd7494e 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> > @@ -55,6 +55,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
> > +extern const struct msm_dsi_phy_cfg dsi_phy_7nm_6375_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
> >  extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > index af5c952c6ad0..3b1ed02f644d 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > @@ -1152,6 +1152,26 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs = {
> >       .quirks = DSI_PHY_7NM_QUIRK_V4_1,
> >  };
> >
> > +const struct msm_dsi_phy_cfg dsi_phy_7nm_6375_cfgs = {
> > +     .has_phy_lane = true,

Any regulators here?

> > +     .ops = {
> > +             .enable = dsi_7nm_phy_enable,
> > +             .disable = dsi_7nm_phy_disable,
> > +             .pll_init = dsi_pll_7nm_init,
> > +             .save_pll_state = dsi_7nm_pll_save_state,
> > +             .restore_pll_state = dsi_7nm_pll_restore_state,
> > +     },
> > +     .min_pll_rate = 600000000UL,
> > +#ifdef CONFIG_64BIT
> > +     .max_pll_rate = 5000000000ULL,
> > +#else
> > +     .max_pll_rate = ULONG_MAX,
> > +#endif
> > +     .io_start = { 0x5e94400 },
> > +     .num_dsi_phy = 1,
> > +     .quirks = DSI_PHY_7NM_QUIRK_V4_1,
> > +};
> > +
> >  const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
> >       .has_phy_lane = true,
> >       .regulator_data = dsi_phy_7nm_36mA_regulators,



-- 
With best wishes
Dmitry
