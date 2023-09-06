Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B6B79460C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 00:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B62210E02C;
	Wed,  6 Sep 2023 22:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C0B10E02C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 22:16:25 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6bb07d274feso256591a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 15:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694038584; x=1694643384; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TatTKafKUsYYCFxlPaO0ndc5iUmy3Qk4+A6ix/aUAqg=;
 b=FkfGFd+3Z8k7PSFSw9ew5bJxs7wu4Gwvukm4q/RTuRZqwnOAPLaSTN1E9pJGb33y4p
 +8xkNGTRLYKu1Gj8H5KF2fMjRYWOlfyK8qwk3CXDfZ+Jc39hOWtsITQ9jihOdIzRx6KZ
 MjhDWkjIYF6+EX430p7KiydsKFR5Zcf/2C3CSS61yiZ/1y6ytMvD153vqfsIBn1OVrlK
 Slqf4NuK+au/w34X/Hh7fPcxOTLZWA0XD0800jrJ1m2rX+Zx07egHDQvscfkTY2lsbM1
 2iXBHFw6AHuzZ1zHIjCX9cAOc1K8GhE8vPwCpyqw7/hnnYHktbWWnV+NZxpyLSOyzVEE
 F2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694038584; x=1694643384;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TatTKafKUsYYCFxlPaO0ndc5iUmy3Qk4+A6ix/aUAqg=;
 b=Xl1eWXfGG2UWNERY3W+1k42/f+OX9g6jTJcVdi4j74nOZ1Qfr9d2C3hzUX2GQnQRKY
 mDmzOhtJe+heBull1Lgzdr9YgqXmZLDAFvj4I7aGXx/AGr7kdsMUAZ/6LyeYkcZh4myC
 lAD0O42K9YM3hRTh7cf0lYtIGU1fqZrcWGsyqkFq3HPd21P3/ifYMPPz674R5XeCJKw3
 viiKBtdtExLMxlb3fS5x3sMdAmxHb44AimMkHjCb847NrmSmaLkk8eX84srNMqmHg8d1
 nGfEfo+TzywuBRCwBGJ+VuYFRVAUBynixjT4cDECwbnt1vfbNXj/ey5wLEev7mLXQN6z
 FaZw==
X-Gm-Message-State: AOJu0YyygY+1dOmATOz+fr9WVubIkDiFuZ46yNJG5ynd60MCZE5wZ7jJ
 bjo+32L6jtLuvqH9KN4cptxPYkQ7BJPQ44eTqs1RYg==
X-Google-Smtp-Source: AGHT+IHVsinZuWrICTKLM00Gc2dovcRGyrKhxJ37wmOiXQbsxt1Emb50py8tz36rMLpW++su49CiJheSog7u3A45VnA=
X-Received: by 2002:a05:6830:478c:b0:6bd:67c:ba9c with SMTP id
 df12-20020a056830478c00b006bd067cba9cmr18432938otb.35.1694038584610; Wed, 06
 Sep 2023 15:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-3-dmitry.baryshkov@linaro.org>
 <CAE-0n505YyrVi=5TYvYJzwfvNmsxDT_MaR5KPefDAbn3vvhdOQ@mail.gmail.com>
In-Reply-To: <CAE-0n505YyrVi=5TYvYJzwfvNmsxDT_MaR5KPefDAbn3vvhdOQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Sep 2023 01:16:13 +0300
Message-ID: <CAA8EJpqGXmip3xxWXxMt7=_vDTof52bbUQFNXL5WbkOCTL8nqQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] drm/msm/dpu: enable PINGPONG TE operations only
 when supported by HW
To: Stephen Boyd <swboyd@chromium.org>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Sept 2023 at 00:54, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2023-09-03 19:04:48)
> > The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
> > Rather than checking for the flag, check for the presense of the
>
> s/presense/presence/
>
> > corresponding interrupt line.
>
> The patch checks for the major version though?

ugh, forgot to update the commit message after rebasing on top of
Abhinav's core_major_rev series. I'll fix this in v4/



-- 
With best wishes
Dmitry
