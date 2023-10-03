Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB8D7B6FA6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 19:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B6210E303;
	Tue,  3 Oct 2023 17:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B62B10E013
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 17:24:12 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-59f6492b415so463867b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Oct 2023 10:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696353851; x=1696958651; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=thG43+UboCLsh1Q91ZvIyopFQTEYZrf70FwL33ZjCMU=;
 b=lDB046bIGy0+0pwzKAfHiiRtgfp0nEy39ivH3WIxtswV2YiKkoMv3n1hoNahprRp1K
 dca0skkbS0kSJEdB/rxYRFGxUYDFT0wiZumbM0MuvXqeNqJNK0UtA7qYTZtsl6sJAcok
 VR4Yc6BhDeySw7e+aPaYh8Fj0wKKJhbp9RLyOVE4wP/saU8e9sGUrD/u5ABfW5Un48iR
 J1j7RanO+QeE91Q8LI9cy4pe76kG+afO6BfWa69mFwLF3evtkO9mpva7eIU8UitKGUGy
 5E7L25sNeIL/C9Rezjtjd5Yb0/tSiIjUZjScQ8u1TcCAsoD16+y48mYx7uTtc9Pk+ehn
 JujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696353851; x=1696958651;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=thG43+UboCLsh1Q91ZvIyopFQTEYZrf70FwL33ZjCMU=;
 b=ZQ7cQUCHd20xh9Ml/ASWuYJoUWXuuptpEZ1YApbJ5cA/oTyBG0Iex2ih7Zp0DfE+eq
 MPlNuZvmFuMLmJ413Ujy4ET+C/YdWiR7hpXVJdEQVJhDLTKIz6jI8Fzp9jPhg1FxQn63
 BuHa7X4z6MSNYVVv2relqIFJWY81gnDMWC1MFhOQmwXTMIliwPMAbsBF4m/TXEmHNb4R
 NAQbE1vY1MJ+3kU2DInwjqIhY+iXpgSQXbzyxHgsHzuSohDIZYIzKuMFuRz7wPaNzyyj
 gYfN2m/p7R+7iY7d3Fa7umWv648z9TJsLmhmJQ5ce12/RftSNi+h0ov31l702WV1wX7V
 6j0A==
X-Gm-Message-State: AOJu0YzvlSM2tRcc0x1Bft0EyxEKM1EZcp0kZ6djhxXcrOO0Vg6i2IYF
 8cfvuo4HtYbMnH13opWm1vmL6unEaMyUDaEE5N3OI3KOhPIvtslk
X-Google-Smtp-Source: AGHT+IH5j0fbG7NgjzWevuE/HObPmlPu9noPzeMJCjDPQNUhLIUyFJgh+GLeEaZJSWodaBgSINVEcmZWOm2carpu1Fs=
X-Received: by 2002:a81:a1d3:0:b0:59b:e743:630 with SMTP id
 y202-20020a81a1d3000000b0059be7430630mr2726908ywg.22.1696353851538; Tue, 03
 Oct 2023 10:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
 <1695848028-18023-9-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprfjt7w+3YJAieBabuMso=-obRXss7-9Jrif23WmOJw5w@mail.gmail.com>
 <456136f5-1e4d-3866-603f-16f308f06028@quicinc.com>
In-Reply-To: <456136f5-1e4d-3866-603f-16f308f06028@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Oct 2023 20:24:00 +0300
Message-ID: <CAA8EJprW72+oDL4vsQp9RKcAv9iAz2m0vfT1X3OLGxGNmJ=Y8Q@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] drm/msm/dp: move of_dp_aux_populate_bus() to eDP
 probe()
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

On Tue, 3 Oct 2023 at 20:16, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 9/27/2023 2:57 PM, Dmitry Baryshkov wrote:
> > On Wed, 27 Sept 2023 at 23:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> Currently eDP population is done at msm_dp_modeset_init() which happen
> >> at binding time. Move eDP population to be done at display probe time
> >> so that probe deferral cases can be handled effectively.
> >> wait_for_hpd_asserted callback is added during drm_dp_aux_init()
> >> to ensure eDP's HPD is up before proceeding eDP population.
> >>
> >> Changes in v4:
> >> -- delete duplicate initialize code to dp_aux before drm_dp_aux_register()
> >> -- delete of_get_child_by_name(dev->of_node, "aux-bus") and inline the function
> >> -- not initialize rc = 0
> >>
> >> Changes in v3:
> >> -- add done_probing callback into devm_of_dp_aux_populate_bus()
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_aux.c     | 34 ++++++++++++++----
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 69 ++++++++++++++++++-------------------
> >>   2 files changed, 60 insertions(+), 43 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> >> index 22eb774..425b5c5 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> >> @@ -480,7 +480,6 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux)
> >>
> >>   int dp_aux_register(struct drm_dp_aux *dp_aux)
> >>   {
> >> -       struct dp_aux_private *aux;
> >>          int ret;
> >>
> >>          if (!dp_aux) {
> >> @@ -488,12 +487,7 @@ int dp_aux_register(struct drm_dp_aux *dp_aux)
> >>                  return -EINVAL;
> >>          }
> >>
> >> -       aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> >> -
> >> -       aux->dp_aux.name = "dpu_dp_aux";
> >> -       aux->dp_aux.dev = aux->dev;
> >> -       aux->dp_aux.transfer = dp_aux_transfer;
> >> -       ret = drm_dp_aux_register(&aux->dp_aux);
> >> +       ret = drm_dp_aux_register(dp_aux);
> >>          if (ret) {
> >>                  DRM_ERROR("%s: failed to register drm aux: %d\n", __func__,
> >>                                  ret);
> >> @@ -508,6 +502,21 @@ void dp_aux_unregister(struct drm_dp_aux *dp_aux)
> >>          drm_dp_aux_unregister(dp_aux);
> >>   }
> >>
> >> +static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
> >> +                                unsigned long wait_us)
> >> +{
> >> +       int ret;
> >> +       struct dp_aux_private *aux;
> >> +
> >> +       aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> >> +
> >> +       pm_runtime_get_sync(aux->dev);
> >> +       ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
> >> +       pm_runtime_put_sync(aux->dev);
> > Ok, so here you have used put_sync instead of autosuspend. Can we have
> > some uniformity? (I'd prefer to see put_sync or just put everywhere)
> >
> >> +
> >> +       return ret;
> >> +}
> >> +
> >>   struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
> >>                                bool is_edp)
> >>   {
> >> @@ -531,6 +540,17 @@ struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
> >>          aux->catalog = catalog;
> >>          aux->retry_cnt = 0;
> >>
> >> +       /*
> >> +        * Use the drm_dp_aux_init() to use the aux adapter
> >> +        * before registering aux with the DRM device so that
> >> +        * msm edp panel can be detected by generic_dep_panel_probe().
> > eDP, AUX, generic_edp_panel_probe().
> >
> >> +        */
> >> +       aux->dp_aux.name = "dpu_dp_aux";
> >> +       aux->dp_aux.dev = dev;
> >> +       aux->dp_aux.transfer = dp_aux_transfer;
> >> +       aux->dp_aux.wait_hpd_asserted = dp_wait_hpd_asserted;
> >> +       drm_dp_aux_init(&aux->dp_aux);
> >> +
> >>          return &aux->dp_aux;
> >>   }
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 711d262..9a2b403 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -1203,6 +1203,28 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
> >>          return NULL;
> >>   }
> >>
> >> +static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
> >> +{
> >> +       int rc;
> >> +
> >> +       rc = component_add(aux->dev, &dp_display_comp_ops);
> >> +       if (rc)
> >> +               DRM_ERROR("eDP component add failed, rc=%d\n", rc);
> > drop.
> are you mean dropping this line?
> >> +
> >> +       return rc;
> >> +}
> >> +
> >> +static inline int dp_display_auxbus_population(struct dp_display_private *dp)
> > It's not `population`. It is just `populate`.
> >
> > Also please inline this function.
> Are you means moving this function to header file?

No. I mean inlining this function.

-- 
With best wishes
Dmitry
