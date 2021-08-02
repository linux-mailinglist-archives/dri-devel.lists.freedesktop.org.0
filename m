Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8DC3DDB72
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 16:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B187E89E05;
	Mon,  2 Aug 2021 14:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A112789E05;
 Mon,  2 Aug 2021 14:46:42 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id j19so9663918vso.0;
 Mon, 02 Aug 2021 07:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TuUOxCKnvZSNTFcvco20X5jOuFpWKd95m2InPWTRPsw=;
 b=RtBUfygHY26LCx3H6AhwuFsqkg/TeNax2vo51jDZ7ZZmxLhDYNAWATRpuSA2lOk1qq
 1RzKn0/Rmgnz0mDOwlwbBZsRcB547tVGsgZ3Je/zBGaqNVZJDd3bINWmCJPrqUoankRg
 KzCG+HBiS95eEkTnQfhNZIXSgfBOHdF+TTIFOVFxqztBiPeBgGJUaINMNnPeCBe9Dl9U
 bN4J2BNmGDu44OSkjQ5fzwLamqBTEDg9+r31b/9HgGGpRms0ECnz71ELZd1c8MkC2GoK
 1MVdlLiiBxzwzxaxeHO3ZNy6dvBAtIE1jajQvGv/P7UOfpP/3+NEjzEtQMSCB3NutSJb
 qIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TuUOxCKnvZSNTFcvco20X5jOuFpWKd95m2InPWTRPsw=;
 b=Uq/wRcD94Ka4xWBG5C2yXfaPyOHCUXwyXjs2VcG6RXSEFWCI67NQbpA6hQt3fSWu5q
 Psi1SSWS5y2h3QQ46lYEl4fdsVrvo+mhx5nTLZSpQJK1JPckxM2677yrO2DuIWdSrBl8
 ekfGWLcYJBmSGlbL+wA9hnwM2SWY6Qf/VNk2UunQTqs0TfI3XY8ZuMm+VnY7KDjJ82k6
 8uU7Seiyn8uLwhPiMkj/zmdEgorti12iLmbdcRRsIGJwWCV9+cQjNv/6B5a1BIamBBV0
 0QJcR+2VddJdOK8yfBUEGUKualC+3LAKxGX/jBT0EM8ZNLnaSdvXqI3QivfQ8PQnyDQ6
 ES9Q==
X-Gm-Message-State: AOAM532Wudy6xfpHqrm1+SwZJzAO+xwdtA9vMrME/nFi+w9W94kcAEjv
 Q4BKKMl5WuG1kvnK8FxJ1/RxDUSTABK1gHJWMD4=
X-Google-Smtp-Source: ABdhPJwsMGK6fB6ykQXW0Hx1xMgqyEPEnorp+p3inrn+bk5OYy5Jq2OmodindHawgFS4opL0ZbVg2C9ViLxio48Z1lw=
X-Received: by 2002:a67:f30a:: with SMTP id p10mr9764065vsf.58.1627915599321; 
 Mon, 02 Aug 2021 07:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210709024834.29680-1-jrdr.linux@gmail.com>
 <CAE-0n51cqCz4JD75n4ZZV2LDxbB6b0QwJ-La2hU8mnPcckNmSg@mail.gmail.com>
In-Reply-To: <CAE-0n51cqCz4JD75n4ZZV2LDxbB6b0QwJ-La2hU8mnPcckNmSg@mail.gmail.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Mon, 2 Aug 2021 20:16:26 +0530
Message-ID: <CAFqt6zZYK+EdePnex_D839XzMV=zXsdAd4bHKdCgX4gtUb1K5g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Remove unused variable
To: Stephen Boyd <swboyd@chromium.org>
Cc: abhinavk@codeaurora.org, David Airlie <airlied@linux.ie>,
 chandanu@codeaurora.org, 
 Daniel Vetter <daniel@ffwll.ch>, dmitry.baryshkov@linaro.org,
 khsieh@codeaurora.org, 
 Rob Clark <robdclark@gmail.com>, sean@poorly.run, tanmay@codeaurora.org, 
 linux-arm-msm@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
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

On Thu, Jul 15, 2021 at 3:09 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Souptick Joarder (2021-07-08 19:48:34)
> > Kernel test roobot throws below warning ->
> >
> > drivers/gpu/drm/msm/dp/dp_display.c:1017:21:
> > warning: variable 'drm' set but not used [-Wunused-but-set-variable]
> >
> > Removed unused variable drm.
> >

Can we get this in queue for 5.15, if no further comment ?


> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
