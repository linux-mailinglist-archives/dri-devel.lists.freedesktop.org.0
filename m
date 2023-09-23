Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC017AC47E
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 20:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B07510E0A1;
	Sat, 23 Sep 2023 18:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C3410E0AC
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 18:45:36 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-59f6492b415so3729467b3.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Sep 2023 11:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695494735; x=1696099535; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GmaXvBuWa7AvubraK1rqvA0Y3W4i4RTGV9iuI7F73tQ=;
 b=Tf898/TJ2q0pqn02s9D2eX0oLWjSjdawzjlYYoEnCm6f/fZKKejEdBJwsxxRUBOZ6l
 NrYDQpallYY8Nw/6tZdV5QpShlr9Oq9uKhkd4ZOn7gzGwBAsZgPDtyLYf4f29/aIrSgo
 PrhB+hgbKY8Ual1AU2uI9ons0wGDknPtFzC2prsnouyp2bK0LhnbpeoSQGtW0/BM5rUH
 bdDCP6HcDmomBSfEvoebBICQNzmD0FfGcZvKawFMBVVxzc+dtkYr1re2bMrNTao5RxVy
 UzoO2TjqJPLmzsh5bX7I27Sz0gFu4vuZ575peU7EwqSmGLWEycsaQn2Q8ZWqxFaMyIc7
 BmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695494735; x=1696099535;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GmaXvBuWa7AvubraK1rqvA0Y3W4i4RTGV9iuI7F73tQ=;
 b=o/ofrr7ic+IV9jmB79Vj1MaBbzE3SGoIcqQ2SFSu0Qk8pJfNrv5ZFUPZS0wV1rVRax
 OnFpUCYAEri2Git51HfOm8MhXQQJEgpIZmAeFsyv4GA9EEBgiskxi8KCJrfmZO63Dryd
 5LFQkeLek2mLMbElZVcvvg0luXtiezRwxpHucXbj8eqY5L2pasiyqVPBu6U4ZR1/FlGW
 hPLA0KW+UMGOJGo6Q3flNGYLUxcI3Huur8SpcmN7K9pyeaahF7uN5Q9CS208RLIRW/rM
 aRhDX/wDevShg16N9OAtEL/hpiwcohA7fMN5pdjK+CZP5CLikmh/CO66zE8eajFMG1af
 N98w==
X-Gm-Message-State: AOJu0YwqnkVc+y0CWwnh6aIPAhPq7eHYWS8Y1hOFgkcsIFk+fUqHX//1
 jgw1GcqLisQrUyd1vdCvcH0+iKajdT/CI7nC2SdNdw==
X-Google-Smtp-Source: AGHT+IHUX/HpZOHnPohy3vbcV4DvnRkwtBEzkQ60I21JGnwItYErq9DaNssYhIBNS9II39Q3/GLOrpeU1DuEsvI6y4A=
X-Received: by 2002:a81:bc0c:0:b0:59f:3343:951b with SMTP id
 a12-20020a81bc0c000000b0059f3343951bmr3528849ywi.4.1695494735537; Sat, 23 Sep
 2023 11:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-2-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprRFYMF-6yxcL75rftfii0kt7hmg_+TeOMJw+BRyDYdeg@mail.gmail.com>
 <1c82a0a6-d85f-9800-bdc4-2a4892b4239b@quicinc.com>
In-Reply-To: <1c82a0a6-d85f-9800-bdc4-2a4892b4239b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 23 Sep 2023 21:45:23 +0300
Message-ID: <CAA8EJpoW8COZD7+yg9oZ=k=x36+XQKaJgvhab=XZPwTVuixh2A@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] drm/msm/dp: tie dp_display_irq_handler() with dp
 driver
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

On Sat, 23 Sept 2023 at 02:03, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 9/15/2023 5:29 PM, Dmitry Baryshkov wrote:
> > On Sat, 16 Sept 2023 at 00:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >> Currently the dp_display_irq_handler() is executed at msm_dp_modeset_init()
> >> which ties irq registration to the DPU device's life cycle, while depending on
> >> resources that are released as the DP device is torn down. Move register DP
> >> driver irq handler at dp_display_probe() to have dp_display_irq_handler()
> >> is tied with DP device.
> >>
> >> Changes in v3:
> >> -- move calling dp_display_irq_handler() to probe
> > Was there a changelog for the previous reivions? What is the
> > difference between v1 and v2?
> >
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_display.c | 35 +++++++++++++----------------------
> >>   drivers/gpu/drm/msm/dp/dp_display.h |  1 -
> >>   2 files changed, 13 insertions(+), 23 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index 76f1395..c217430 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -1193,30 +1193,23 @@ static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
> >>          return ret;
> >>   }
> >>
> >> -int dp_display_request_irq(struct msm_dp *dp_display)
> >> +static int dp_display_request_irq(struct dp_display_private *dp)
> >>   {
> >>          int rc = 0;
> >> -       struct dp_display_private *dp;
> >> -
> >> -       if (!dp_display) {
> >> -               DRM_ERROR("invalid input\n");
> >> -               return -EINVAL;
> >> -       }
> >> -
> >> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
> >> +       struct device *dev = &dp->pdev->dev;
> >>
> >> -       dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
> >>          if (!dp->irq) {
> > What is the point in this check?
> >
> >> -               DRM_ERROR("failed to get irq\n");
> >> -               return -EINVAL;
> >> +               dp->irq = platform_get_irq(dp->pdev, 0);
> >> +               if (!dp->irq) {
> >> +                       DRM_ERROR("failed to get irq\n");
> >> +                       return -EINVAL;
> >> +               }
> >>          }
> >>
> >> -       rc = devm_request_irq(dp_display->drm_dev->dev, dp->irq,
> >> -                       dp_display_irq_handler,
> >> +       rc = devm_request_irq(dev, dp->irq, dp_display_irq_handler,
> >>                          IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
> >>          if (rc < 0) {
> >> -               DRM_ERROR("failed to request IRQ%u: %d\n",
> >> -                               dp->irq, rc);
> >> +               DRM_ERROR("failed to request IRQ%u: %d\n", dp->irq, rc);
> >>                  return rc;
> >>          }
> >>
> >> @@ -1287,6 +1280,10 @@ static int dp_display_probe(struct platform_device *pdev)
> >>
> >>          platform_set_drvdata(pdev, &dp->dp_display);
> >>
> >> +       rc = dp_display_request_irq(dp);
> >> +       if (rc)
> >> +               return rc;
> > This way the IRQ ends up being enabled in _probe. Are we ready to
> > handle it here? Is the DP device fully setup at this moment?
>
> The irq is enabled here.
>
> but DP driver hpd hardware block has not yet be enabled. this means no
> irq will be delivered.

There are other IRQ kinds, not only just HPD ones.

>
>   .hpd_enable() will call pm_runtime_resume_and_get() and
> dp_catalog_ctrl_hpd_enable().
>
> after .hpd_enable() irq will be delivered and handled properly.
>
>
>
> >> +
> >>          rc = component_add(&pdev->dev, &dp_display_comp_ops);
> >>          if (rc) {
> >>                  DRM_ERROR("component add failed, rc=%d\n", rc);
> >> @@ -1549,12 +1546,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>
> >>          dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
> >>
> >> -       ret = dp_display_request_irq(dp_display);
> >> -       if (ret) {
> >> -               DRM_ERROR("request_irq failed, ret=%d\n", ret);
> >> -               return ret;
> >> -       }
> >> -
> >>          ret = dp_display_get_next_bridge(dp_display);
> >>          if (ret)
> >>                  return ret;
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> >> index 1e9415a..b3c08de 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> >> @@ -35,7 +35,6 @@ struct msm_dp {
> >>   int dp_display_set_plugged_cb(struct msm_dp *dp_display,
> >>                  hdmi_codec_plugged_cb fn, struct device *codec_dev);
> >>   int dp_display_get_modes(struct msm_dp *dp_display);
> >> -int dp_display_request_irq(struct msm_dp *dp_display);
> >>   bool dp_display_check_video_test(struct msm_dp *dp_display);
> >>   int dp_display_get_test_bpp(struct msm_dp *dp_display);
> >>   void dp_display_signal_audio_start(struct msm_dp *dp_display);
> >> --
> >> 2.7.4
> >>
> >



-- 
With best wishes
Dmitry
