Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2070579461D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 00:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF37810E731;
	Wed,  6 Sep 2023 22:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819A410E735
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 22:19:35 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-d7b9de8139fso276327276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 15:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694038774; x=1694643574; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0Tnj8GJBcGOqoSNZE01aLcIiGwYJS0wicspbPN1sH9Q=;
 b=nCzmNPzq+49AjUS8WYGVurAc1QsUL74BFnJjBxTgIdXH5+g2dlmllGLtYJbMhrpzBD
 wINObdAiG5IVxyoiId/T6yynM6oXWL9tHk9ulz1NzJ4RynfHfpNnTsOtNWt+gZ+W5EKB
 lv1umbTucmMJruEcr/KMhPCnmxtMqIyZz5jCSK1DqYikV0NsNJLjJEu3+cX8PqGotrFl
 73Ype9NGCtWDEzhQ9Mi+A+G4ET4UN5PaL1Rw5Lhh8ShWFUcTr8CnYm7HRCL0YWxuKtIN
 MevJDtO0PYl3ixYow5GFOb1BwT5MKFWjRn6m51drry8NQDl67LpEb9yYKLU6pS0scbKV
 avYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694038774; x=1694643574;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Tnj8GJBcGOqoSNZE01aLcIiGwYJS0wicspbPN1sH9Q=;
 b=ScM0joBEvNG8x7E3Q3wSXmJBD0br3tqDvA1O2fK+MwIodlP4p40+hLsR/8V3NiPbph
 D13FcFHxBB1q2KoZ5O+Vh9/Foh8Wgi5udTJopjlMuYDfluZsnDod5xU4WcdO+IlO3OVY
 cDWiRi1LyKnM37B6bJH5kAQKYrmQwzx6xAvlfvwS9LRdKBM28i+Ze0VjuRGZCePrYAJd
 hieszay3TMwXwOJ50ifNpUGLcjF/r1VZfR8rLPDk2Gwnwogqy1f9g2+4Mk9l0F+OIvGd
 oolMvZhRvr6rr4tFYhAVvI+F4MNq768BasgSSmAMhcWv//sRoAkop/gb/ux7rEvRXCbV
 H83w==
X-Gm-Message-State: AOJu0Yyp3zuv9bWHIIvMKSlR6SPLffatFDPOTQ6RIkGmCOeDNhZzUlVh
 CLnA7vGuVvBMmCeUtQp92V2YpqT1bfhzOjwOIwPkXA==
X-Google-Smtp-Source: AGHT+IGnvVzqDyTaDQN1RRv9vQQEUFxQPYrxhhVQohIrfL86E3wNMufaAcRSF8iiMtJ+eOtngxBck7gdISwdKBFtedU=
X-Received: by 2002:a25:2d15:0:b0:d78:341d:9ae7 with SMTP id
 t21-20020a252d15000000b00d78341d9ae7mr18444235ybt.46.1694038774649; Wed, 06
 Sep 2023 15:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
 <20230905174353.3118648-4-dmitry.baryshkov@linaro.org>
 <CAE-0n509t5hFfKMEHL=3muvn-qo7qZhauzgohgOxDto1oPj2qA@mail.gmail.com>
In-Reply-To: <CAE-0n509t5hFfKMEHL=3muvn-qo7qZhauzgohgOxDto1oPj2qA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 7 Sep 2023 01:19:23 +0300
Message-ID: <CAA8EJprF1BZTi=Ar+D86W58w2byugA8vVpncKMARBfuSHopuLQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm/dpu: support binding to the mdp5 devices
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

On Thu, 7 Sept 2023 at 01:17, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2023-09-05 10:43:50)
> > diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> > index 59d2788c4510..9d0d76f3a319 100644
> > --- a/drivers/gpu/drm/msm/msm_io_utils.c
> > +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> > @@ -50,6 +50,24 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
> >         return clk;
> >  }
> >
> > +void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
> > +                              struct platform_device *pdev,
> > +                              const char *name)
> > +{
> > +       struct resource *res;
> > +       void __iomem *ptr;
> > +
> > +       res = platform_get_resource_byname(mdss_pdev, IORESOURCE_MEM, name);
> > +       if (!res)
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       ptr = devm_ioremap_resource(&pdev->dev, res);
> > +       if (!ptr)
>
> devm_ioremap_resource() returns an error pointer. Too bad we can't use
> devm_platform_ioremap_resource_byname() here.

Unfortunately :-(

>
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       return ptr;
> > +}



-- 
With best wishes
Dmitry
