Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C93CB850674
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 22:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D8210E3C1;
	Sat, 10 Feb 2024 21:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E0wI/xKa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DDB10E3C1
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 21:17:48 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dc74435c428so2018096276.2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 13:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707599867; x=1708204667; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=55zQ7x26tRThnlScVOXLS72ZEGRCLEQ9D4+DSgNh7Jw=;
 b=E0wI/xKaWmBuH9Hm4q5Io5I9qdSMp9Wx31KJ+fKsCBQR+/pJpiJd00TYUTCynhgqzY
 bwG+a3seqWYgLeqylXjglz5RFEm5gQqx1sBQOHbL8a5mqtjuNsHsAalcYeNbyJnWb4wQ
 3aGtzde2ND/4x8vJ0EAQYtaXNDJlHGGnZLmEdrOiigpcQ3e8WXxK+oeMLhb2V5pXFlqq
 5hHUCEaQQxf+KGB0lnwVNMXEobgC0j/GJ5UzXOHJj+pXWtUGcRQdhMo6xZfrz/Rmij2g
 lT6JQ61HxtJ3jiZLd3KJrZoI8xpdSeLOmfUCxit8AmnKllAnvGt3eZvQo2yAcTdf80cb
 MDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707599867; x=1708204667;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=55zQ7x26tRThnlScVOXLS72ZEGRCLEQ9D4+DSgNh7Jw=;
 b=NKC8p1bVZwuqeRBnNAU8LHZ9EJtntg2KPmXrTSdCPMNGqoq2aCadit7Ionbet8dSpw
 5RqJrtI5FMCUqn2j/fLkgeBGYF7qEYAO4PbaIaVk723h6Y/FfkgHr8mw0icms9ipZNjp
 ivs/a5ZOpqacMvPeXaWi5wWnH5Q/gABiN4LZm5aRHmNuwki0NmJcANmG049/fbi5C+54
 FpCl0TKomUn7MtJ9BcNFLSDu5QoB9pHAfY3uDcIxEv6TP0s9KNJR2lqYXoJsZPfPXdaU
 9yK+kNCN91axfAuDGGWanq+ivPs6oqlpC3jmqGJ3G/K8dNFqPuuGrXB4jA8/MN9uHJSR
 sTYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf3Py1T2s4uwIKSzL13o2IW/mDwlyhMEi4ssYsy4jLh0qsBSQLXdo7Ndc6ppsrwNVgAuJTjiLV/6M7EcC8frjFMXtZKZ+q9M8gPsRYP3iD
X-Gm-Message-State: AOJu0YwjanqzcdUOaJl5RasPzEcrM+a9Vn8bxStpespMapHRzn1872JA
 s5CiegZ7RwFAN/4BxdUwgkeGWSb0ULraM467a/nh8b/yfboW5YOxf4rvpsNUAF+0lEwgq5R2z40
 /Wqav3kwzJhFHr14hvLeO+JbF+h9URgsuPXl8iQ==
X-Google-Smtp-Source: AGHT+IGxAorJ/sM2MaFCSZ8ie9knRvIWkbmIr9beca0fdxoWSWDdjrQKZyPrx/1oLESTtdfwyFXhzvn4ZBbsimRIrRI=
X-Received: by 2002:a25:8745:0:b0:dc7:4776:e31 with SMTP id
 e5-20020a258745000000b00dc747760e31mr2326629ybn.24.1707599867357; Sat, 10 Feb
 2024 13:17:47 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-20-quic_parellan@quicinc.com>
 <CAA8EJpq15w_Gjx+rPzN8vBg5Z8PGzABAztqmLpfnafuvNVLmRw@mail.gmail.com>
 <56e521ab-ae57-9296-59a1-0bdbad60f882@quicinc.com>
In-Reply-To: <56e521ab-ae57-9296-59a1-0bdbad60f882@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 23:17:36 +0200
Message-ID: <CAA8EJprUeJvL_mP0x19YQCdTbErzy-RRF6GmSOK_eApsRiTALw@mail.gmail.com>
Subject: Re: [PATCH v2 19/19] drm/msm/dp: allow YUV420 mode for DP connector
 when CDM available
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
 marijn.suijten@somainline.org, neil.armstrong@linaro.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 10 Feb 2024 at 21:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/10/2024 3:33 AM, Dmitry Baryshkov wrote:
> > On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>
> >> All the components of YUV420 over DP are added. Therefore, let's mark the
> >> connector property as true for DP connector when the DP type is not eDP
> >> and when there is a CDM block available.
> >>
> >> Changes in v2:
> >>          - Check for if dp_catalog has a CDM block available instead of
> >>            checking if VSC SDP is allowed when setting the dp connector's
> >>            ycbcr_420_allowed parameter
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +++-
> >>   drivers/gpu/drm/msm/dp/dp_display.c     | 4 ++--
> >>   drivers/gpu/drm/msm/dp/dp_drm.c         | 8 ++++++--
> >>   drivers/gpu/drm/msm/dp/dp_drm.h         | 3 ++-
> >>   drivers/gpu/drm/msm/msm_drv.h           | 5 +++--
> >>   5 files changed, 16 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> index 723cc1d821431..beeaabe499abf 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> @@ -565,6 +565,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> >>   {
> >>          struct drm_encoder *encoder = NULL;
> >>          struct msm_display_info info;
> >> +       bool yuv_supported;
> >>          int rc;
> >>          int i;
> >>
> >> @@ -583,7 +584,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> >>                          return PTR_ERR(encoder);
> >>                  }
> >>
> >> -               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
> >> +               yuv_supported = !!(dpu_kms->catalog->cdm);
> >
> > Drop parentheses please.
> >
> >> +               rc = msm_dp_modeset_init(priv->dp[i], dev, encoder, yuv_supported);
> >>                  if (rc) {
> >>                          DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
> >>                          return rc;
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> >> index ebcc76ef1d590..9b9f5f2921903 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >> @@ -1471,7 +1471,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
> >>   }
> >>
> >>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> >> -                       struct drm_encoder *encoder)
> >> +                       struct drm_encoder *encoder, bool yuv_supported)
> >>   {
> >>          struct dp_display_private *dp_priv;
> >>          int ret;
> >> @@ -1487,7 +1487,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>                  return ret;
> >>          }
> >>
> >> -       dp_display->connector = dp_drm_connector_init(dp_display, encoder);
> >> +       dp_display->connector = dp_drm_connector_init(dp_display, encoder, yuv_supported);
> >>          if (IS_ERR(dp_display->connector)) {
> >>                  ret = PTR_ERR(dp_display->connector);
> >>                  DRM_DEV_ERROR(dev->dev,
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> >> index 46e6889037e88..ab0d0d13b5e2c 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> >> @@ -353,7 +353,8 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>   }
> >>
> >>   /* connector initialization */
> >> -struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> >> +struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
> >> +                                           bool yuv_supported)
> >>   {
> >>          struct drm_connector *connector = NULL;
> >>
> >> @@ -361,8 +362,11 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
> >>          if (IS_ERR(connector))
> >>                  return connector;
> >>
> >> -       if (!dp_display->is_edp)
> >> +       if (!dp_display->is_edp) {
> >>                  drm_connector_attach_dp_subconnector_property(connector);
> >> +               if (yuv_supported)
> >> +                       connector->ycbcr_420_allowed = true;
> >
> > Is there any reason to disallow YUV420 for eDP connectors?
> >
> >> +       }
> >>
>
> Major reason was certainly validation but thinking about it more
> closely, I need to check whether CDM over eDP is even possible.
>
> Historically, CDM could output only to HDMI OR WB using the bit we
> program while setting up CDM and the same HDMI path is being used by DP
> as well. But I need to check whether CDM can even output to eDP with the
> same DP path. I dont have any documentation on this part yet.

I had the feeling that the DP / eDP difference on the chips is mostly
on the PHY and software side. So I assumed that it should be possible
to output YUV data to the eDP port in the same way as it is done for
the DP port.

-- 
With best wishes
Dmitry
