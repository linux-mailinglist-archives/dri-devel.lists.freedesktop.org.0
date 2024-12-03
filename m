Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0369E2D7D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 21:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FEA10EB2F;
	Tue,  3 Dec 2024 20:46:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FgsHGZYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D8210EB42
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 20:46:39 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6efa1e49ef0so26834047b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 12:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733258798; x=1733863598; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xn6x66yZ/WtZ/1552jYEDR51bSrNbxA0suyy8emTbek=;
 b=FgsHGZYlS0P7rYG/6CLFjXWZaTxiqVUz4ObB8MCW53fMDyYFTGfQiou4wD6Fhimuus
 4cnnnrzBvVl0VlLaipcXrB3T4MIWDoV+z0vtN92Vnfc1KYx5bMXkrOP0PskEPjoaS1DQ
 +TCwTPPaEdNGUg1HP2AMsSFRRW/rrhKtZrj+xt1XbhkHyWcYH5L1NCW+6530VIfNNoIl
 QnXX/ljwYwTySyHZTvaqBxKsaL1BdAsCRnLeIdqDDRxEI+Cyz0aRkofmsxbgZjEJBLPY
 ZYNua711oZeJzuYPJEhhVV1Ln3KBazR8RpzxEn39z9naUC/CuH0UE8XXhuxjTZYziHNg
 P0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733258798; x=1733863598;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xn6x66yZ/WtZ/1552jYEDR51bSrNbxA0suyy8emTbek=;
 b=FjzlzhXgwv5JSbR6vjDDlVg4ncjjUiUfdq858t0aPOYTH66A2ZEJF0u0oqa9dgBut9
 Vgb+QMbkxHoQFxU5SBM0i7+5AUCtGAyXy1k/KB0U0Q7JSLTsXzEEvVxEoQ84+GEMRJzJ
 O2ss5WL1wl8ufQmdNIRtGuWQSwJtQ39pLF0EAPpDOwZj6wWdS26J0mmpf0DMMJonMuTu
 d+t3juoZ9NwMV58r3RQMxFZjHN6AaOV8kUt4x2E9AVv9QHmUX4eOxnK9Y5zJjwYAT04S
 qFzUQa5LUI4ct68z20KKcyk5Lc3cnyCJnIC9qadQJI/3e+/bMCTBV8+wZqMJJrFaZZfI
 NLYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9suNo1JKYk3TG/z3BOYL0rhejgKdG3aUAbz6ofKiY2ROYwC7P0sAV05OemHUecSrO85OMA0Sw66U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywcs4p1wDBN7KYNaEzUNEaQwEcTgIPusPzN5BBpz7uSTcu/jRps
 WH008X60/fvBHirz3kj5O11j950RNZYzKYJwgB+Z2N0FPhRFGzh1c64tBupC7ZRnbNAy9D87Eh1
 /OUQasDAtO240JsUyWzfU2ieGrbiKX7S3U2oyXg==
X-Gm-Gg: ASbGncs1YOcmrQhy4ZjcUYCG70okkDhotAIU6Rvtq7Ed2Pi/QTW4iwRsahuxv2A8Uik
 MrvoGsyNKrsOMS6rfnHZvsLu1vjk9jA==
X-Google-Smtp-Source: AGHT+IH8hrI8UpkvlEij0qypL74Pq/pAf4QOqyLjB1Y7xU/3KeHSuRxwQIYl7F2mGLf9kHagIekQ7TkNhcuk6salH9w=
X-Received: by 2002:a05:6902:1147:b0:e33:14fa:2273 with SMTP id
 3f1490d57ef6-e39d39ee50dmr4169526276.5.1733258798414; Tue, 03 Dec 2024
 12:46:38 -0800 (PST)
MIME-Version: 1.0
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
 <lpkhftx62hbnrftzoy6zprhvir7dffz5ynwo3kr5j5obc3dcle@73ljnmpdt7ts>
 <f8bb9597-c5b3-4dbf-a65e-7bd17cd3ffc5@quicinc.com>
In-Reply-To: <f8bb9597-c5b3-4dbf-a65e-7bd17cd3ffc5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Dec 2024 22:46:27 +0200
Message-ID: <CAA8EJpqmoOzwT5STjPggXi+hm3zwu=j=0xAxexHS477t_g9n6w@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/msm/dp: Fix and utilize TPG with a debugfs
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
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

On Tue, 3 Dec 2024 at 21:42, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/3/2024 6:31 AM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 12:41:57PM -0800, Abhinav Kumar wrote:
> >> DP Test Patten Generator is a very useful tool to debug issues such
> >> as blank screen or corruption seen on the DP monitor by isolating it
> >> to whether the corruption is coming from further upstream such as DPU
> >> OR from the DP controller and below. It was noted in [1] that this API
> >> is unused. Rather than dropping the API, it should be fixed and used.
> >>
> >> Hence, this series fixes the DP Test Patten Generator API and also utilizes
> >> it by adding a debugfs for it.
> >>
> >> [1] : https://patchwork.freedesktop.org/patch/623508/?series=141074&rev=1
> >
> > I'd prefer for this to be rebased on top of [2]. The series has been
> > posted a month ago.
> >
> > [2] https://patchwork.freedesktop.org/series/141074/
> >
>
> Well, the review of that series which tried dropping the tpg led to this
> one really.
>
> I will review that one within a couple of days. Lets first agree on that
> series before deciding to rebase.

SGTM. Note, v2 kept the TPG in place, as you have asked.

>
> >>
> >> To: Rob Clark <robdclark@gmail.com>
> >> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> To: Sean Paul <sean@poorly.run>
> >> To: Marijn Suijten <marijn.suijten@somainline.org>
> >> To: David Airlie <airlied@gmail.com>
> >> To: Simona Vetter <simona@ffwll.ch>
> >> To: Stephen Boyd <swboyd@chromium.org>
> >> To: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> Cc: linux-arm-msm@vger.kernel.org
> >> Cc: dri-devel@lists.freedesktop.org
> >> Cc: freedreno@lists.freedesktop.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >> Abhinav Kumar (3):
> >>        drm/msm/dp: account for widebus in msm_dp_catalog_panel_tpg_enable()
> >>        drm/msm/dp: do not touch the MMSS_DP_INTF_CONFIG for tpg
> >>        drm/msm/dp: add a debugfs node for using tpg
> >>
> >>   drivers/gpu/drm/msm/dp/dp_catalog.c | 15 +++++++--
> >>   drivers/gpu/drm/msm/dp/dp_debug.c   | 61 +++++++++++++++++++++++++++++++++++++
> >>   drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
> >>   3 files changed, 76 insertions(+), 2 deletions(-)
> >> ---
> >> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
> >> change-id: 20241202-tpg-3f7543c036ac
> >>
> >> Best regards,
> >> --
> >> Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>
> >



-- 
With best wishes
Dmitry
