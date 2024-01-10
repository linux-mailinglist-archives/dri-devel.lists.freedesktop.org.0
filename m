Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED3C82A4EC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 00:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDF110E6A0;
	Wed, 10 Jan 2024 23:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FD910E15F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 23:22:57 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5e7467eb93aso38848697b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 15:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704928976; x=1705533776; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IP0kPmjJQz5xdnO9Zw1vVvFueYTNz/6OxEEXA7YZ1Dg=;
 b=b4x1YAtT2qALcrWyQ8gz89awnNNJWaHIIZEjvIMHVLkQ9eQnTexqQDM9i4nTXiCZRk
 U+RNSJt4eChQP4cH0pOb1hvFR02VFxWa2ep+fQXHyy0jR7hP5aN99Ymc+AZPkFJ4tyxp
 +AilkQTnFtzODqK4xVG4RuPaCALbojn9by6fMUKOmfubcQn3A4+FmDUoM3nAad3BrVDz
 Qwrb1wxq0ZOtwHvetDx4mIyeQaBoXj13w3eIyH6adARNmerhyQm65+T2pwBLsRtO/aaj
 bMx/bpezAjSEyzWzCny92HObcZU4eoWNRlZMdl1IiyV/LB0iDHPYdf1Dh2vbydlgxNYK
 5KPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704928976; x=1705533776;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IP0kPmjJQz5xdnO9Zw1vVvFueYTNz/6OxEEXA7YZ1Dg=;
 b=beEP4rRvs67kuleISqEgL1sRlFCyVkPlhDOSuDtXOfzS4PEvsfW2hYWUpzuIvJIQdw
 n2bXZuC7Y+2xiluUgmZpj5UYsHNa4VKU7aCr3ffUWSGSjJ0DLjjnZeVRwFi+y2aRrCEO
 zUpflKiiLXmmtIB0UkCdRb4FfOeomvdyXQyzckwoeLctuf+Ul9pSHPyrfcetM1I6/o4r
 KyCfUAYfC9oAaJAY+1Qq8ZzcwEafUH7xNvrLC6JbIHWNCZmRHw6MA4lOiXSX9aERMkmb
 kVJqnKcEOGyWQT3WNpZR7MJDZxHqTa78xx+IhEVqrySLxgA3sMwL7tO6VZIQWGvrmWB5
 wPKg==
X-Gm-Message-State: AOJu0YwDwEIITpL5lIyVlPIEiIYrLqiFwmG5YGAbliCM5iiAQF/+ShX7
 joMev2a6E8TDMwXS6tzKqCR81tpTFagX1V/nBzq8V3nN+TikmQ==
X-Google-Smtp-Source: AGHT+IFqBQqIGJ/G1jHMlkSuLZ9HFAiFLALAjQuy4Zj7oSL4IC41zFAAgk0OSkkJdHgkbDhmybdpD7SWug2Rj/DJZhQ=
X-Received: by 2002:a81:a1d6:0:b0:5eb:9192:114 with SMTP id
 y205-20020a81a1d6000000b005eb91920114mr396803ywg.72.1704928976306; Wed, 10
 Jan 2024 15:22:56 -0800 (PST)
MIME-Version: 1.0
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
 <20231009205727.2781802-6-dmitry.baryshkov@linaro.org>
 <d11ffecb-010d-769a-2d3c-9634a046a453@quicinc.com>
In-Reply-To: <d11ffecb-010d-769a-2d3c-9634a046a453@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jan 2024 01:22:45 +0200
Message-ID: <CAA8EJpqBgLxd6kRsi2zgnah55fPHJE5_9_xv9PHR6ec40Dk-0w@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/mdp5: drop split display support
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Jan 2024 at 01:01, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/9/2023 1:57 PM, Dmitry Baryshkov wrote:
> > The MSM DSI driver has dropped support for calling
> > mdp_kms_funcs::set_split_display() callback. Drop corresponding callback
> > from the mdp5 driver together with the rest of the infrastructure.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  | 42 -------------------
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  | 42 -------------------
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 14 -------
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h      |  9 ----
> >   drivers/gpu/drm/msm/msm_kms.h                 |  4 --
> >   5 files changed, 111 deletions(-)
> >
>
> The programming inside the set_split_display() looks right from what i
> see, so whenever (if at all) bonded_dsi is implemented for mdp5, this
> will remain intact. Its just that there are no consumers left for
> set_split_display anymore so its dead code. If someone wants to add that
> support, I guess they have to start by reverting this commit first. If
> thats the plan and agreement,

Either by reverting this commit or by introducing a wrapper like the
one present in dpu_encoder_virt.

>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



-- 
With best wishes
Dmitry
