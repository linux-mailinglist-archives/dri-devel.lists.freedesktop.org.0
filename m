Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFE19B535E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 21:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917A310E6F6;
	Tue, 29 Oct 2024 20:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WEOGGojq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B2610E6F6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 20:25:11 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6e390d9ad1dso49018237b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 13:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730233511; x=1730838311; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mBI2uNkuJz5hUFFer3XXwlG4B2x7GV7bsYE7YJzJyF0=;
 b=WEOGGojqoMeLvqczMBr8S2YUt0GK626KPw+tWtbAzv/NfYH6n5W+7mr2tF6Pmn2i8P
 yj7ff7yVJFSISyLQhAuZp+7fNRTlg5yiMIxmpfB1MrzLW19UK6TAZXxBzq/Mi18ExOU7
 o1AKf9c2bBVqA7f2RsiNstiIhLlJwZn9PF6wH5PL6lrWyggfzDTjnCU1YEd7Xvz6tE3r
 rDNnjqieXLBEGmMx57IpHNT5W0h6L96t9rli4HJZEXRdSJtTWDZj8Tnqoq7NzRLA7CkZ
 x1fTQBBQ30KFvRFE82eiPBUdHeeaERD+IOgjyNgzNsdIrv+ScTUp3STuxKq+rTaqZTXq
 YBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233511; x=1730838311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mBI2uNkuJz5hUFFer3XXwlG4B2x7GV7bsYE7YJzJyF0=;
 b=ZD4VYy7JX+73YAuQ1YohTMzGP/JSYFFBoIORxbYrQKd2GXZhuWAXY58N1fxmAssvoT
 N1GaqDL/l/8yYAQHefzdKykKDIYZDxHr+yRZQcPYLwjLzskcjkGbE9mj1b5PbX3dk++4
 G7g+YXE4hOUdTvHD6crQXLcVmtOHpOQI7Ujm4LlMSUt+7SanxaFGFMOmFnNg1zCkWD4H
 hwGT6asp3IOAf7x6hRZR/ItCK3XLCuN8fXj7BPGmAl6bjtvX+LdEaX/MKpVENbiYvDt+
 o6qYUXUbTjvXHVhJrR7EksXhjyE9Exx0qjF1PNYPiEQuJNE4+4q7fnFfntp74L+E/wex
 r79g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHpelK9XpRA8lnC3VPhKjGpEJit3Vz1tysZBnOW67dQNUxw8apxFuiUmQMsCSQxacbRf3nGOVRXLs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXn8Djo8WaE1z5+vgBIIwBxkZ/306UQEX/rapQ3rwCH/Kf2LBX
 Upekt1bg88BUyiGN1Qb0n2kUJCMfFPy8gUAMpgPqtChdnPKrCmFuKzew1BMl1QhXkXQdPdEyJce
 hxHZNzAXY5AKyfwXOPejaIvfT7WYon49aUChAXg==
X-Google-Smtp-Source: AGHT+IG6cX2wf0btAXPAAKNWp9X+HWlDbdwmWyBjB7hXl2DJFXF4XbNv617o/puLRUgalkZOG9h9QJAkPDP/9SnuOAI=
X-Received: by 2002:a05:690c:d8e:b0:6ea:34b1:62e3 with SMTP id
 00721157ae682-6ea34b1660cmr28135337b3.7.1730233511044; Tue, 29 Oct 2024
 13:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org>
 <20241028-msm-dp-rename-v1-2-a2564e9457b0@linaro.org>
 <3d142f8c-f7b1-45dc-9a4b-d0b16843a8ba@quicinc.com>
In-Reply-To: <3d142f8c-f7b1-45dc-9a4b-d0b16843a8ba@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Oct 2024 22:25:01 +0200
Message-ID: <CAA8EJpqXE4U4nH8yjtYEryJ4ZOmnDxo--+eUm2_AvDymufjVjQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dp: rename edp_ bridge functions and struct
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, 29 Oct 2024 at 20:08, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/28/2024 4:49 AM, Dmitry Baryshkov wrote:
> > Follow the estalished prefix and rename eDP bridge symbols to use
> > msm_dp_ prefix, moving the edp to the end of the symbol name.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_drm.c | 36 ++++++++++++++++++------------------
> >   1 file changed, 18 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> > index 6a0840266c0f..ff9ce9b15234 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> > @@ -115,7 +115,7 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
> >       .debugfs_init = msm_dp_bridge_debugfs_init,
> >   };
> >
> > -static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
> > +static int msm_dp_bridge_atomic_check_edp(struct drm_bridge *drm_bridge,
> >                                  struct drm_bridge_state *bridge_state,
> >                                  struct drm_crtc_state *crtc_state,
> >                                  struct drm_connector_state *conn_state)
>
> msm_dp_bridge_atomic_check_edp looks a bit odd.
>
> What about just msm_edp_bridge_atomic_check?
>
> Likewise for other edp names.

Yeah, I was torn between these two options. I'll switch to the second one.

-- 
With best wishes
Dmitry
