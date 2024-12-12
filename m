Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C37DC9EE1E4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 09:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE6710ED06;
	Thu, 12 Dec 2024 08:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UFnarfs5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C466910ED03
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:52:26 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-6f006748fd1so2814477b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 00:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733993546; x=1734598346; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zBYYfU/SUdPVtHo0D4rKIxqkiR1eC0tO3k5fmat0Ujc=;
 b=UFnarfs5F5/k9lt9rzxk4g0Cb+qZLjJofCidPJ8nk8jxSJZahnx9eiC35E7LQ5ggWl
 EGE6a150cUBSMMDdtbX8yZPeOurn+M+E+4/VupaTBPRfLo1L+evPvkaY82GsWsnEG476
 gK9f8hZeBoFwcJh5DzN0byaXlojiua4Vezvc+qp/4iofs2Z0khc9PDkpum0s2LrkxA36
 qF5u24GPAlwzstnt4AU57AeI6s3NPrs815PumDI4DttJgpNo3KDO6M8y16M8gmu0ncxX
 /mPkwMWwMCha2Qrutz2m0LqaH8ZHl47bmMLLPPo49fKYds2i+2oLYtS3kKcn+aY9tC9L
 OxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733993546; x=1734598346;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zBYYfU/SUdPVtHo0D4rKIxqkiR1eC0tO3k5fmat0Ujc=;
 b=vXgpVBsvqrmO4m2A98FjCDZQ3YoF3d/AILNwgPDpDMxK6P9MgQjDvgA5tiQ7oTsXjZ
 6oHuDYIDf8DmlaJJ/LvKxHBWunbKaE1WeBcyCt9tFCo+v2JM7qt03JzNKD31NLHYAcG0
 R7uJ2DvTXRhxGCbDIJBGaaAFlviaTF6SHR0VwkLHGJ1HPOK17iVeBnV52tl5ZoRC9DFK
 S03L1wS9k9MV90QA49L857vEe4ZZeKCWKVO+5Rf5SmCht7kgVBlSUNVAPyKqsO0FUaiQ
 hzwxDfVcVbR27TAU7fpYIMHW7qUNGDaUJpEz+S+jHAFKkgu92wiblM8b23UfHUDwMBa+
 YWeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmhqfN42P2wWEB8MNn8R64TjbqTjAWodB6DY2Gd6Kl4fwPdDaih08L+JHw36JrYVyO6rDKYOjX0gc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+BISGUuO55hVJRyffT8RStI5QcQxHyJZmwlIYjJL7qif2efYh
 Th+LwPyFhlytUj5SIOPXT2Yp2ycdQFn/4su/6n36F8Ecd1G1dZr6PTO/dT2GrfP+d6Js4I55Plu
 aMUs67D+aaaW8jotF0XC+9RyBWIb59WeeEwMt2g==
X-Gm-Gg: ASbGncutwUDOOjMERsPIzKKTnbJpgAwRoMonk4N1jWyN7jI10jdgk3EmcW1hPni8owB
 Lp8goLHf8WMW5J/X0vL/BfjUw9nSXRfOD/vbsaw==
X-Google-Smtp-Source: AGHT+IHkVQ1Yt+kY8VtgAgi00tlSfxYbOT7T8OOEuC4FleojTSZwOUMMM2zASe42MRgtPnns3I6Kz1HZiopK744q4ng=
X-Received: by 2002:a05:690c:4489:b0:6f0:237e:fc4f with SMTP id
 00721157ae682-6f1aa5f58c0mr24536087b3.35.1733993545838; Thu, 12 Dec 2024
 00:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-4-0b1c65e7dba3@linaro.org>
 <c5090fcc-d7ec-4d49-aa21-8d1aa7f6a1c7@quicinc.com>
In-Reply-To: <c5090fcc-d7ec-4d49-aa21-8d1aa7f6a1c7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 10:52:16 +0200
Message-ID: <CAA8EJppOjAjFVUFSEXJMbJ4aV_MvzpeTuKDkL7P+t_Mw47YECw@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] drm/msm/dp: pull I/O data out of
 msm_dp_catalog_private()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Thu, 12 Dec 2024 at 04:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> > Having I/O regions inside a msm_dp_catalog_private() results in extra
> > layers of one-line wrappers for accessing the data. Move I/O region base
> > and size to the globally visible struct msm_dp_catalog.
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_catalog.c | 457 +++++++++++++++---------------------
> >   drivers/gpu/drm/msm/dp/dp_catalog.h |  12 +
> >   2 files changed, 197 insertions(+), 272 deletions(-)
> >
>
>
> Fundamentally, the whole point of catalog was that it needs to be the
> only place where we want to access the registers. Thats how this really
> started.
>
> This pre-dates my time with the DP driver but as I understand thats what
> it was for.
>
> Basically separating out the logical abstraction vs actual register writes .
>
> If there are hardware sequence differences within the controller reset
> OR any other register offsets which moved around, catalog should have
> been able to absorb it without that spilling over to all the layers.
>
> So for example, if we call dp_ctrl_reset() --> ctrl->catalog->reset_ctrl()
>
> Then the reset_ctrl op of the catalog should manage any controller
> version differences within the reset sequence.

The problem is that the register-level writes are usually not the best
abstraction. So, instead of designing the code around dp_catalog I'd
prefer to see actual hw / programming changes first.

>
> We do not use or have catalog ops today so it looks redundant as we just
> call the dp_catalog APIs directly but that was really the intention.
>
> Another reason which was behind this split but not applicable to current
> upstream driver is that the AUX is part of the PHY driver in upstream
> but in downstream, that remains a part of catalog and as we know the AUX
> component keeps changing with chipsets especially the settings. That was
> the reason of keeping catalog separate and the only place which should
> deal with registers and not the entire DP driver.
>
> The second point seems not applicable to this driver but first point
> still is. I do admit there is re-direction like ctrl->catalog
> instead of just writing it within dp_ctrl itself but the redirection was
> only because ctrl layers were not really meant to deal with the register
> programming. So for example, now with patch 7 of this series every
> register being written to i exposed in dp_ctrl.c and likewise for other
> files. That seems unnecessary. Because if we do end up with some
> variants which need separate registers written, then we will now have to
> end up touching every file as opposed to only touching dp_catalog.

Yes. I think that it's a bonus, not a problem. We end up touching the
files that are actually changed, so we see what is happening. Quite
frequently register changes are paired with the functionality changes.

For example (a very simple and dumb one), when designing code around
dp_catalog you ended up adding separate _p1 handlers.
Doing that from the data source point of view demands adding a stream_id param.

In the DPU driver we also have version-related conditionals in the HW
modules rather than pushing all data access to dpu_hw_catalog.c &
counterparts.
I think it's better to make DP driver reflect DPU rather than keeping
a separate wrapper for no particular reason (note, DPU has hardware
abstractions, but on a block level, not on a register level).

-- 
With best wishes
Dmitry
