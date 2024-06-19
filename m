Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B32B590E1F7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 05:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8E910EA75;
	Wed, 19 Jun 2024 03:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QD+dutob";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224DC10E949
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 03:27:09 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6327e303739so47268377b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 20:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718767628; x=1719372428; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3dfrBK+ORKFv40UvbjMXJU0JxToJEbOmqk2ygnUzNWA=;
 b=QD+dutobmokzShiEsgCTPLenOyFk6KjAr6zxzTT63n5GeA6iZFxCeGcAvhOGFHRwpB
 iAwk4NM+tUKw1nrg3w8P/fCSZ/NY2acYno0HqC75kbIL8Q0Xykn+cxUaILKuDMea3X0X
 NTRB0P2dZq/+tpk/kY2F0fAY0WTXuDPgdNY9VHuNQxCjY13XJM4wedAeU3HXMkeC58pQ
 n+t9HFzDuPa5kienoR1eugG9CgadFZQr5MzOp5NDFAFa2hCmPrg6ywoLbfnx7gsF6oF9
 Xw6aOAzOVgWYsHhH+zdRdBgZ0ENzc02I/ilX9jx3H77zckaBhTumZ1BxUhfJ22PmvQNK
 iU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718767628; x=1719372428;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3dfrBK+ORKFv40UvbjMXJU0JxToJEbOmqk2ygnUzNWA=;
 b=PsCWCdc2rijhI7Kkk5aSskKu52vJpWnhRVjRQFSzyU7hf+0kHwm1z+LADtWmvZM8sr
 TSAb51/vRJ2GvQHoqRRNHplHWkriFFJejcBsRbwR4cUH3K2tZ4VPsD5hNRHD7YtU/mhD
 bA2i90yWrh78I01HUfTsflugrJiBLhKZmIw0c2K4Lyj2DsXPpMlWsS14HcTDMvtW6CFV
 y0htbbbobHs3Hq48wjL+VQy3Kz3tGWv92oEEY7Qle5RYu3Pq9mt8ZEa3NgcaT/xkEsLs
 Omxovp3KnGmRUVGNJmv0jRb0/X+teSfhCZ8LANWPMACv8FhQlHQ78UXqDyM0+CMbMX8J
 tktg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+8RpXuLntOfVeqOGbNj7AS6iHPrh7N/hqVIDO2kuarpMylI3MLkma18ZgBdgDwIxRvni7+/HcuiUXKOSF4aivjqQQnXA4uCgj6gZSFnHr
X-Gm-Message-State: AOJu0YxaNqIcPk6BveQIXu97bNq788X4GeHKh9Xkklb6BcOxhWQVJij0
 l1ZjggRVY1mgSeVbI0twtzIaNnXcIhvEe3XIR57rYANcYH3JlAH9tfEgVFMbumsN0iJT6E6u822
 Hb3c/Fi0uN19xS8DtjGqD6Mic7GGcCZ4idGixsA==
X-Google-Smtp-Source: AGHT+IGZv3mlZlyXqzu6CBGJhkJXhV9REwNTqZrZkdS6fZsHZVc+LmTu4SZ5pHj7J8TceMemNz9OzjXDLAdW2y1/qZ0=
X-Received: by 2002:a0d:d483:0:b0:61b:28a:e567 with SMTP id
 00721157ae682-63a8d44b79fmr14657867b3.5.1718767628046; Tue, 18 Jun 2024
 20:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
 <20240614-dpu-mode-config-width-v3-7-29ec4069c99b@linaro.org>
 <e191758e-3fb2-947f-09c6-71f37ab34891@quicinc.com>
 <f9b63458-6d85-b8d4-f9f8-5e1966323a54@quicinc.com>
In-Reply-To: <f9b63458-6d85-b8d4-f9f8-5e1966323a54@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 19 Jun 2024 06:26:57 +0300
Message-ID: <CAA8EJppDcjf1JYi+iCheNt7XR-vfYx+JQ_QsBkXbR3wJD2egpg@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] drm/msm/dpu: drop
 _dpu_crtc_check_and_setup_lm_bounds from atomic_begin
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Wed, 19 Jun 2024 at 01:56, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 6/13/2024 4:20 PM, Abhinav Kumar wrote:
> > On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
> >> The dpu_crtc_atomic_check() already calls the function
> >> _dpu_crtc_check_and_setup_lm_bounds().  There is no need to call it
> >> again from dpu_crtc_atomic_begin().
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
> >>   1 file changed, 2 deletions(-)
> >>
> >
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
>
> This change is causing a small regression on sc7280 chromebook.
>
> I have tested and concluded that this is causing the chrome boot
> animation to disappear.
>
> I have tested a couple of times and without this change it works fine.
>
> If this change was meant as an optimization, can we drop this one and
> investigate later why this is causing one? I have not spent time
> investigating why it happened. Rest of the series works well and I dont
> see any dependency as such. Let me know if that works for you. Otherwise
> I will have to spend a little more time on this patch and why chrome
> compositor does not like this for the animation screen.

Oh, my. Thank you for the test!
I think I know what's happening. The cstate->num_mixers gets set only
in dpu_encoder_virt_atomic_mode_set(). So during
dpu_crtc_atomic_check() we don't have cstate->num_mixers is stale (and
if it is 0, the check is skipped).

I guess I'll have to move cstate->mixers[] and cstate->num_mixers
assignment to the dpu_encoder_virt_atomic_check(). And maybe we should
start thinking about my old idea of moving resource allocation to the
CRTC code.

-- 
With best wishes
Dmitry
