Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64FD8D4227
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 01:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7BE511A9A8;
	Wed, 29 May 2024 23:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aLfcQwND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583C911A985
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 23:56:03 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dfa59c35e44so272853276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 16:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717026962; x=1717631762; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f7L392EnXrVzvTNd9aY5ubW45gbNxK2/4AAEq4fHMB4=;
 b=aLfcQwNDSpdZJ3hI5kzFIT74l4RZ8nFFn7d65xgd5BaebEOl79TM3Xu9q4SkZ67jTI
 pDXO9Oquy7BGDTRO1RtVF/S6dJhNwxauXhati/+sOU45pTHWZ+5l5B57dsg0DKXVPYuo
 3B966/Ruwla5lw4QyiEwHGRznSCFQ1teFaEGyqSYngw4k62rSL1Aa57FXwe+vf2Bw+kc
 FfFde765s8PiN2PFvm7pL0Sno4itE+6cM3X0M/+9NTm+SxRd47lPpBzElwpe2EU42cXx
 LV859nnT5aP6XI/aVtm2QzIHqvwtsukO9PcPZoiw5CjTthQlVaqDl0VEFheHNv91O2YE
 8Plw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717026962; x=1717631762;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f7L392EnXrVzvTNd9aY5ubW45gbNxK2/4AAEq4fHMB4=;
 b=Gyn9ZI119Jwf90spLxYuO0L/dljO2PYsPp5wi8EKesCA/I6z8kOwO6bMpBLahfC+qX
 tLDe6iYLL6qs+aS2UetNIm4R+NUXahzjTY4hyNb3HLnbbSKQOUuvYKKRmd/FTVjcVXpi
 0KsAGy5YhmgULpbQ54JsWnce+pZaq2RKQ+fO+77vg1/2mdku3F5XX0r7eych9vizo/AU
 JmD4UW2e2KRsg7hdOtnIq8hSP3ABEtQG4RQH7d3B++CCSbRwGhBvGFedQD6z62/BZ7Jj
 nwCU49GT7uCgPNpqUpjtkoSjOBd2yvJJcZ0ueP3zZKlKuWz5qbDaDzZIRTnqfFXvfm7D
 lM0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKKvOv5y2Q0PfOrjIthc56lSHUsWrE7EiPzEC388mA9JSHzn89KsGTGYdNFU5DVNJwkhDWBGvlRFJPQXJFHuOgXWMsfrsz153ujYE2LpEw
X-Gm-Message-State: AOJu0YzuqpKPibZRJI7zOQ+3OO+diMyav5dBLQ3PKErwpwRsEo+TJ+cB
 mhp5eEPts+dKVkUdoY1W1C3+PVlymZ66u/5oht5Ug0wDmDRBftPJqyjkwJuLd+xbaxEVCqexu3l
 RczG+VjvFTDmgg6FObBhzzWmqxuvU7H9JjodFTA==
X-Google-Smtp-Source: AGHT+IH/NUIgBB0ReBSpD1tKmhU+t/VSQ1Q6ntm3hWL/Kgf547FVO4mO787dHVCZtSDZ+DYEbaAEHhngmUOMr9u4H+A=
X-Received: by 2002:a25:ae68:0:b0:de1:1b21:4f8 with SMTP id
 3f1490d57ef6-dfa5a7ff5e2mr754001276.62.1717026961783; Wed, 29 May 2024
 16:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <9fc7e388-d9c7-12d1-bee5-803dd6f1ca60@quicinc.com>
 <CAA8EJpoWUEGX8fq5qxXUebA-E25ONycm4NXscFhXAhFwcJGf0w@mail.gmail.com>
 <1ac17233-61ee-6eff-1e28-bd2d74bbc5cc@quicinc.com>
In-Reply-To: <1ac17233-61ee-6eff-1e28-bd2d74bbc5cc@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 01:55:51 +0200
Message-ID: <CAA8EJpod-Zdea2AM_frsLUZ4symFuVCY0BU-6nyj8+jahifH0Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] drm/msm/dpu: handle non-default TE source pins
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org
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

On Thu, 30 May 2024 at 01:11, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/22/2024 12:59 PM, Dmitry Baryshkov wrote:
> > On Wed, 22 May 2024 at 21:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
> >>> Command-mode DSI panels need to signal the display controlller when
> >>> vsync happens, so that the device can start sending the next frame. Some
> >>> devices (Google Pixel 3) use a non-default pin, so additional
> >>> configuration is required. Add a way to specify this information in DT
> >>> and handle it in the DSI and DPU drivers.
> >>>
> >>
> >> Which pin is the pixel 3 using? Just wanted to know .. is it gpio0 or gpio1?
> >
> > gpio2. If it was gpio0 then there were no issues at all.
> >
>
> Got it. Instead of asking gpio1 or gpio2, I mistyped and asked gpio0 or
> gpio1.
>
> While reviewing the code , I think the function
> dpu_hw_setup_vsync_source is poorly named . It really doesnt configured
> vsync_source. It actually configured watchdog timer.
>
> Can you pls include one more patch in this series to rename
> dpu_hw_setup_vsync_source ---> dpu_hw_setup_wd_timer()

Ack, sounds like a good idea.

>
> >>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>> Dmitry Baryshkov (7):
> >>>         dt-bindings: display/msm/dsi: allow specifying TE source
> >>>         drm/msm/dpu: convert vsync source defines to the enum
> >>>         drm/msm/dsi: drop unused GPIOs handling
> >>>         drm/msm/dpu: pull the is_cmd_mode out of _dpu_encoder_update_vsync_source()
> >>>         drm/msm/dpu: rework vsync_source handling
> >>>         drm/msm/dsi: parse vsync source from device tree
> >>>         drm/msm/dpu: support setting the TE source
> >>>
> >>>    .../bindings/display/msm/dsi-controller-main.yaml  | 16 ++++++++
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 11 ++---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  5 +--
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  2 +-
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  2 +-
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        | 26 ++++++------
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |  2 +-
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 44 ++++++++++++++++++++
> >>>    drivers/gpu/drm/msm/dsi/dsi.h                      |  1 +
> >>>    drivers/gpu/drm/msm/dsi/dsi_host.c                 | 48 +++++-----------------
> >>>    drivers/gpu/drm/msm/dsi/dsi_manager.c              |  5 +++
> >>>    drivers/gpu/drm/msm/msm_drv.h                      |  6 +++
> >>>    12 files changed, 106 insertions(+), 62 deletions(-)
> >>> ---
> >>> base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
> >>> change-id: 20240514-dpu-handle-te-signal-82663c0211bd
> >>>
> >>> Best regards,
> >
> >
> >



-- 
With best wishes
Dmitry
