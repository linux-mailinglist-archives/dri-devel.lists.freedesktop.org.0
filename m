Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D081070CDB4
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 00:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE28710E3A3;
	Mon, 22 May 2023 22:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D92710E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 22:19:08 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-561c1768bacso87596127b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 15:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684793946; x=1687385946;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=THMVQzDGBXx0ND+du60VqV2q7Gov8B3ICvcMaV7i1bI=;
 b=sI/UWK7oVhl0VzoMG9q+RoaPsUOEKuosbKFHN66ghF6ZzK+uhC98O6x7NsanhZKX6h
 Y9sYBf9tSMpSQ0zlorAdXkbwWjURRVlb5W+ztz1U3IrXRf9LdquOFzqU6xa3ilbfrw9b
 PLI5GiFr0gBhE90syk+bAzHTp/mtSzs+88jHivA8vxAf+TBInQ7FDzPnCIRykPBVzhlM
 cE09i/w8lvDuOtyR7qLUABJS/IOjdlae0STUE7sGxuJdlBEFrw+6FkKm+3kfsZLYXGKT
 ILgkWz7n3AbAcMDo8M1c0C0gQJayoC+ui0Swnj2Qu0lP+m2kLn+sN0gVBUpr2kRbBShr
 jKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684793946; x=1687385946;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=THMVQzDGBXx0ND+du60VqV2q7Gov8B3ICvcMaV7i1bI=;
 b=RPDS4hFf/C8So1wtadtQNRXMgl16vVJbUa8UB78mxR3vD4Yk4KJsMs5SCLbkXKSXv4
 LKepM+3qxZ+Y+n0vxmXk1jyWImrzBssCbZTaOjWDBW6a4G9XngMpaKPC4k+MiE92ONfD
 nYxrNY/5XrLOIwm3SQC7f1mVo/DPtPvAYQ1jimrMBRghe0MPz7XRpSEU8JLTwg13DnVU
 6cqyZDBRmOUH6iv7Jau96nJZFgw/sz0+vuHz12zMC7JdawlHrz4fF1pgt7SyESEmlATe
 elrrBwRsXRYAXCWrMQJ/HM1gLDchcUq1u//8alL2JvmD6AsftuOQuLswlJBOEhYozFhO
 Zgaw==
X-Gm-Message-State: AC+VfDw7s3282+4acRc5f94Sp66YFGZJ6ZaxVb/tBYJMlP0P1zGZybrG
 a4kgEk2cwz8sg9go18+GHrYQkQIIQrbXqabYAUKCJA==
X-Google-Smtp-Source: ACHHUZ6dMo160c1XBzrYJtRAYORkJwxN9FFnXPOghWueVmFKU3yl1oaLOXE7TIMrVUOzUF2VYwrm1GB6cLNKSOWoCQE=
X-Received: by 2002:a0d:e654:0:b0:55a:30f5:3d65 with SMTP id
 p81-20020a0de654000000b0055a30f53d65mr12047093ywe.41.1684793946631; Mon, 22
 May 2023 15:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
 <20230522214527.190054-6-dmitry.baryshkov@linaro.org>
 <jvyy32g67ekqycdx4dpjkvucxe7trvu2aqjfkxui3ca7x72gux@q4wnhcjtbics>
In-Reply-To: <jvyy32g67ekqycdx4dpjkvucxe7trvu2aqjfkxui3ca7x72gux@q4wnhcjtbics>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 May 2023 01:18:55 +0300
Message-ID: <CAA8EJpr920jA--H2ArhYusaiOc55cAo0nSeGWnOZ+nDzGzGLDQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] drm/msm/dpu: drop now-unused mdss_irqs field from
 hw catalog
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 May 2023 at 01:15, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-05-23 00:45:26, Dmitry Baryshkov wrote:
> > Now as the list of the interrupts is constructed from the catalog
> > data, drop the mdss_irqs field from catalog.
> >
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  8 --------
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  9 ---------
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 11 -----------
> >  .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 13 -------------
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h | 10 ----------
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  6 ------
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  5 -----
> >  .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  5 -----
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  9 ---------
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  7 -------
> >  .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 14 --------------
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  9 ---------
> >  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  9 ---------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  3 ---
> >  14 files changed, 118 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > index 3c732a0360c7..ff7c3d522046 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > @@ -204,14 +204,6 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
> >       .vbif_count = ARRAY_SIZE(msm8998_vbif),
> >       .vbif = msm8998_vbif,
> >       .perf = &msm8998_perf_data,
> > -     .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> > -                  BIT(MDP_SSPP_TOP0_INTR2) | \
> > -                  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > -                  BIT(MDP_INTF0_INTR) | \
> > -                  BIT(MDP_INTF1_INTR) | \
> > -                  BIT(MDP_INTF2_INTR) | \
> > -                  BIT(MDP_INTF3_INTR) | \
> > -                  BIT(MDP_INTF4_INTR),
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> > index 36ea1af10894..c4ccd742690a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> > @@ -202,15 +202,6 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
> >       .vbif_count = ARRAY_SIZE(sdm845_vbif),
> >       .vbif = sdm845_vbif,
> >       .perf = &sdm845_perf_data,
> > -     .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> > -                  BIT(MDP_SSPP_TOP0_INTR2) | \
> > -                  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > -                  BIT(MDP_INTF0_INTR) | \
> > -                  BIT(MDP_INTF1_INTR) | \
> > -                  BIT(MDP_INTF2_INTR) | \
> > -                  BIT(MDP_INTF3_INTR) | \
> > -                  BIT(MDP_AD4_0_INTR) | \
> > -                  BIT(MDP_AD4_1_INTR),
>
> I don't think you're adding AD4 back anywhere?  Not that there is
> any code handling AD4 (e.g. registering those interrupts) anywhere, but
> that should be done and documented in a separate patch then.
>
> After dropping that from this patch and describing it in a preliminary
> one:
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Good point.

>
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > index b5f751354267..fb7069d470ff 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > @@ -231,17 +231,6 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
> >       .vbif_count = ARRAY_SIZE(sdm845_vbif),
> >       .vbif = sdm845_vbif,
> >       .perf = &sm8150_perf_data,
> > -     .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> > -                  BIT(MDP_SSPP_TOP0_INTR2) | \
> > -                  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > -                  BIT(MDP_INTF0_INTR) | \
> > -                  BIT(MDP_INTF1_INTR) | \
> > -                  BIT(MDP_INTF1_TEAR_INTR) | \
> > -                  BIT(MDP_INTF2_INTR) | \
> > -                  BIT(MDP_INTF2_TEAR_INTR) | \
> > -                  BIT(MDP_INTF3_INTR) | \
> > -                  BIT(MDP_AD4_0_INTR) | \
> > -                  BIT(MDP_AD4_1_INTR),
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > index 8ed2b263c5ea..bd7422e597aa 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> > @@ -237,19 +237,6 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
> >       .vbif_count = ARRAY_SIZE(sdm845_vbif),
> >       .vbif = sdm845_vbif,
> >       .perf = &sc8180x_perf_data,
> > -     .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> > -                  BIT(MDP_SSPP_TOP0_INTR2) | \
> > -                  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > -                  BIT(MDP_INTF0_INTR) | \
> > -                  BIT(MDP_INTF1_INTR) | \
> > -                  BIT(MDP_INTF1_TEAR_INTR) | \
> > -                  BIT(MDP_INTF2_INTR) | \
> > -                  BIT(MDP_INTF2_TEAR_INTR) | \
> > -                  BIT(MDP_INTF3_INTR) | \
> > -                  BIT(MDP_INTF4_INTR) | \
> > -                  BIT(MDP_INTF5_INTR) | \
> > -                  BIT(MDP_AD4_0_INTR) | \
> > -                  BIT(MDP_AD4_1_INTR),
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> > index daebd2170041..75a5c1b5a74a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> > @@ -239,16 +239,6 @@ const struct dpu_mdss_cfg dpu_sm8250_cfg = {
> >       .wb_count = ARRAY_SIZE(sm8250_wb),
> >       .wb = sm8250_wb,
> >       .perf = &sm8250_perf_data,
> > -     .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> > -                  BIT(MDP_SSPP_TOP0_INTR2) | \
> > -                  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > -                  BIT(MDP_INTF0_INTR) | \
> > -                  BIT(MDP_INTF1_INTR) | \
> > -                  BIT(MDP_INTF1_TEAR_INTR) | \
> > -                  BIT(MDP_INTF2_INTR) | \
> > -                  BIT(MDP_INTF2_TEAR_INTR) | \
> > -                  BIT(MDP_INTF3_INTR) | \
> > -                  BIT(MDP_INTF4_INTR),
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> > index 0b05da2592c0..84be02ce9c9c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> > @@ -149,12 +149,6 @@ const struct dpu_mdss_cfg dpu_sc7180_cfg = {
> >       .vbif_count = ARRAY_SIZE(sdm845_vbif),
> >       .vbif = sdm845_vbif,
> >       .perf = &sc7180_perf_data,
> > -     .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> > -                  BIT(MDP_SSPP_TOP0_INTR2) | \
> > -                  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > -                  BIT(MDP_INTF0_INTR) | \
> > -                  BIT(MDP_INTF1_INTR) | \
> > -                  BIT(MDP_INTF1_TEAR_INTR),
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> > index ba9de008519b..71d6e036a7a7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> > @@ -122,11 +122,6 @@ const struct dpu_mdss_cfg dpu_sm6115_cfg = {
> >       .vbif_count = ARRAY_SIZE(sdm845_vbif),
> >       .vbif = sdm845_vbif,
> >       .perf = &sm6115_perf_data,
> > -     .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> > -                  BIT(MDP_SSPP_TOP0_INTR2) | \
> > -                  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > -                  BIT(MDP_INTF1_INTR) | \
> > -                  BIT(MDP_INTF1_TEAR_INTR),
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> > index 92ac348eea6b..d80b383d874d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> > @@ -112,11 +112,6 @@ const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
> >       .vbif_count = ARRAY_SIZE(sdm845_vbif),
> >       .vbif = sdm845_vbif,
> >       .perf = &qcm2290_perf_data,
> > -     .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> > -                  BIT(MDP_SSPP_TOP0_INTR2) | \
> > -                  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > -                  BIT(MDP_INTF1_INTR) | \
> > -                  BIT(MDP_INTF1_TEAR_INTR),
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> > index 320cfa4be633..649784aa6567 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> > @@ -223,15 +223,6 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
> >       .vbif_count = ARRAY_SIZE(sdm845_vbif),
> >       .vbif = sdm845_vbif,
> >       .perf = &sm8350_perf_data,
> > -     .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> > -                  BIT(MDP_SSPP_TOP0_INTR2) | \
> > -                  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > -                  BIT(MDP_INTF0_7xxx_INTR) | \
> > -                  BIT(MDP_INTF1_7xxx_INTR) | \
> > -                  BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
> > -                  BIT(MDP_INTF2_7xxx_INTR) | \
> > -                  BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
> > -                  BIT(MDP_INTF3_7xxx_INTR),
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > index 9306c7a115e9..1e87c7f4775d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> > @@ -163,13 +163,6 @@ const struct dpu_mdss_cfg dpu_sc7280_cfg = {
> >       .vbif_count = ARRAY_SIZE(sdm845_vbif),
> >       .vbif = sdm845_vbif,
> >       .perf = &sc7280_perf_data,
> > -     .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> > -                  BIT(MDP_SSPP_TOP0_INTR2) | \
> > -                  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > -                  BIT(MDP_INTF0_7xxx_INTR) | \
> > -                  BIT(MDP_INTF1_7xxx_INTR) | \
> > -                  BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
> > -                  BIT(MDP_INTF5_7xxx_INTR),
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > index fc1e17c495f0..3082657f06f2 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > @@ -225,20 +225,6 @@ const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
> >       .vbif_count = ARRAY_SIZE(sdm845_vbif),
> >       .vbif = sdm845_vbif,
> >       .perf = &sc8280xp_perf_data,
> > -     .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> > -                  BIT(MDP_SSPP_TOP0_INTR2) | \
> > -                  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > -                  BIT(MDP_INTF0_7xxx_INTR) | \
> > -                  BIT(MDP_INTF1_7xxx_INTR) | \
> > -                  BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
> > -                  BIT(MDP_INTF2_7xxx_INTR) | \
> > -                  BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
> > -                  BIT(MDP_INTF3_7xxx_INTR) | \
> > -                  BIT(MDP_INTF4_7xxx_INTR) | \
> > -                  BIT(MDP_INTF5_7xxx_INTR) | \
> > -                  BIT(MDP_INTF6_7xxx_INTR) | \
> > -                  BIT(MDP_INTF7_7xxx_INTR) | \
> > -                  BIT(MDP_INTF8_7xxx_INTR),
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> > index eb72411c16db..ca5b82bc8322 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> > @@ -231,15 +231,6 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
> >       .vbif_count = ARRAY_SIZE(sdm845_vbif),
> >       .vbif = sdm845_vbif,
> >       .perf = &sm8450_perf_data,
> > -     .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> > -                  BIT(MDP_SSPP_TOP0_INTR2) | \
> > -                  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > -                  BIT(MDP_INTF0_7xxx_INTR) | \
> > -                  BIT(MDP_INTF1_7xxx_INTR) | \
> > -                  BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
> > -                  BIT(MDP_INTF2_7xxx_INTR) | \
> > -                  BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
> > -                  BIT(MDP_INTF3_7xxx_INTR),
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > index 8209ca317bdc..dd7c87f772ea 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> > @@ -235,15 +235,6 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
> >       .vbif_count = ARRAY_SIZE(sdm845_vbif),
> >       .vbif = sdm845_vbif,
> >       .perf = &sm8550_perf_data,
> > -     .mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
> > -                  BIT(MDP_SSPP_TOP0_INTR2) | \
> > -                  BIT(MDP_SSPP_TOP0_HIST_INTR) | \
> > -                  BIT(MDP_INTF0_7xxx_INTR) | \
> > -                  BIT(MDP_INTF1_7xxx_INTR) | \
> > -                  BIT(MDP_INTF1_7xxx_TEAR_INTR) | \
> > -                  BIT(MDP_INTF2_7xxx_INTR) | \
> > -                  BIT(MDP_INTF2_7xxx_TEAR_INTR) | \
> > -                  BIT(MDP_INTF3_7xxx_INTR),
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 72530ebb0ae6..6d8c2fa8558a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -777,7 +777,6 @@ struct dpu_perf_cfg {
> >   * @dma_formats        Supported formats for dma pipe
> >   * @cursor_formats     Supported formats for cursor pipe
> >   * @vig_formats        Supported formats for vig pipe
> > - * @mdss_irqs:         Bitmap with the irqs supported by the target
> >   */
> >  struct dpu_mdss_cfg {
> >       const struct dpu_caps *caps;
> > @@ -825,8 +824,6 @@ struct dpu_mdss_cfg {
> >       const struct dpu_format_extended *dma_formats;
> >       const struct dpu_format_extended *cursor_formats;
> >       const struct dpu_format_extended *vig_formats;
> > -
> > -     unsigned long mdss_irqs;
> >  };
> >
> >  extern const struct dpu_mdss_cfg dpu_msm8998_cfg;
> > --
> > 2.39.2
> >



-- 
With best wishes
Dmitry
