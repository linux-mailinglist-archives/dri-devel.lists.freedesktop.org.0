Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E9A6F2298
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 05:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189B610E2E0;
	Sat, 29 Apr 2023 03:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C8C10E2E0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 03:12:49 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-b9a6eec8611so11932034276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 20:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682737968; x=1685329968;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nZPq6FD/3HdqkAS4gdiecZ5aV1KvKGTujZQ7g9Eep30=;
 b=bFmjAJXxy6pMgjln/PEg/IE4qffr3iiwOaftvquOqJDEeAk5e08MVLnBrv/3pMzIE3
 UUZ75M63FT5x1OkVeAUojMW+6uXRKA0zIGxxk5Z2fFxeOLjJCySORHFIGH1vUJynWFtR
 e2fKQdtDLmvdsPEeK3ac+xDetkOIPPNdU99vZMw8pxGyxUUsh1LguGeMnBcNqufPzJO1
 8TIVSR2iQryMhn8RPGKPDMAARaLuyF0Uhdhkb5bDaqqMynqm8pC87N3a7gmE4LMQIpj2
 6XkhegB5rrvxvrCRQHJFOoTdSWYwgodsE+VqukW5/gyZeNjkgwTkGga9DZikCYIAZJT0
 7OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682737968; x=1685329968;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nZPq6FD/3HdqkAS4gdiecZ5aV1KvKGTujZQ7g9Eep30=;
 b=lv86x4NSohTO9XJL+ya9gsXEP6GFOMBPxQW9i9m/mfS/W5QFUaAicie5Oq951AgoqY
 fTflFv8U5BDklacssjYStL/iYZMkUrFUHynYtMP2J+p/oyR15GrDLckG7ozU0wHUKPZS
 ipRP5jxpliqGZmsBprRnkNOL4yFXVXIWjj2RELX3PBE9Rl7JAcVjFeH+NnQm14nxydzc
 NiboaO30STiWGg0AJhGLDG21J384AN64pa2NqQcVNrwsRIQtcOhrTy0x59gA6V5T1W93
 fU1sXe1EWo2RumUN8e56zIQE/q2yimMNhmOlKJVgUXKWeHCpw0KUxGwUs/5AZ5qDFSUA
 B7IA==
X-Gm-Message-State: AC+VfDxIgx1YyXMKfymeDTVGEsdJZejarAL8M0jfejqS8j0+NPkktSCI
 v0bzwJBZIWJpYtLnD+tzSHz9LtkHfJay46O6bZxgQg==
X-Google-Smtp-Source: ACHHUZ5JBkowR4FYHJ45j/F+E6uXnfkS5GJ5kjJ+2PtHbQwKa11GayybRuy9sEXIRG6SM2/s0chaUKGVNrE40dHGjT8=
X-Received: by 2002:a81:189:0:b0:54f:6f2e:b3f5 with SMTP id
 131-20020a810189000000b0054f6f2eb3f5mr8251813ywb.13.1682737968434; Fri, 28
 Apr 2023 20:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJpqqhP1QL7TuW8JXeVFqukWggYmB1XU8OeB65fQA+jhLAg@mail.gmail.com>
 <ff60439f-9955-5e89-ee2c-17bc2b07d1e1@quicinc.com>
In-Reply-To: <ff60439f-9955-5e89-ee2c-17bc2b07d1e1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 29 Apr 2023 06:12:37 +0300
Message-ID: <CAA8EJppr7zYGTJcR4EAB3eybCz0tY=t4Srf2QhLVc4Uu5ZqNtQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] add DSC 1.2 dpu supports
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, andersson@kernel.org,
 freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, marijn.suijten@somainline.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 29 Apr 2023 at 05:51, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/28/2023 7:46 PM, Dmitry Baryshkov wrote:
> > On Sat, 29 Apr 2023 at 02:45, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>
> >> This series adds the DPU side changes to support DSC 1.2 encoder. This
> >> was validated with both DSI DSC 1.2 panel and DP DSC 1.2 monitor.
> >> The DSI and DP parts will be pushed later on top of this change.
> >> This seriel is rebase on [1], [2] and catalog fixes from [3].
> >>
> >> [1]: https://patchwork.freedesktop.org/series/116851/
> >> [2]: https://patchwork.freedesktop.org/series/116615/
> >> [3]: https://patchwork.freedesktop.org/series/112332/
> >>
> >> Abhinav Kumar (2):
> >>    drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets
> >>    drm/msm/dpu: add dsc blocks for remaining chipsets in catalog
> >>
> >> Kuogee Hsieh (5):
> >>    drm/msm/dpu: add support for DSC encoder v1.2 engine
> >>    drm/msm/dpu: separate DSC flush update out of interface
> >>    drm/msm/dpu: add DPU_PINGPONG_DSC feature PP_BLK and PP_BLK_TE
> >>    drm/msm/dpu: save dpu topology configuration
> >>    drm/msm/dpu: calculate DSC encoder parameters dynamically
> >
> > Another generic comment: this patchset doesn't have discussed RM
> > changes to allocate DSC blocks in proper pairs as required by DCE.
> >
>
> We have already made that change. It will be pushed with the DP series
> because today DSC only support 2-2-1 so they will always be allocated in
> pairs.

Then there is no reason to touch the dpu_encoder in this series as the
topology is also known to be 2:2:1.

>
> >>
> >>   drivers/gpu/drm/msm/Makefile                       |   1 +
> >>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  19 +-
> >>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   8 +-
> >>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  26 +-
> >>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  35 ++-
> >>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  26 +-
> >>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   4 +-
> >>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   2 +-
> >>   .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   2 +-
> >>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  14 +
> >>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   7 +
> >>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  16 +
> >>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  14 +
> >>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  14 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 102 ++++---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  35 ++-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  36 ++-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  22 +-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  10 +
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  14 +-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     | 335 +++++++++++++++++++++
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   9 +-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   7 +-
> >>   23 files changed, 642 insertions(+), 116 deletions(-)
> >>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c
> >>
> >> --
> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> >> a Linux Foundation Collaborative Project
> >>
> >
> >



-- 
With best wishes
Dmitry
