Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DC7764135
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 23:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF21110E4BD;
	Wed, 26 Jul 2023 21:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4EE10E4BD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 21:33:15 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-d1fb9107036so260725276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 14:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690407194; x=1691011994;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CFNQJOAD0fO9fjODgv9Vgz/m4W/3GjQnJ0WkDekZYbo=;
 b=Hco0ofCImpyA8iT5sXSj8CMf3yH3596t+DYzL3By4zXYzvZna9PKQMiOPw0mrRWpsN
 deJ4HHoaZllAusSDSnvG8hKPqGWboZYijVhF6n3z23ojF5BRwn5tJ5s4/VrSo/H/Dojr
 xB3JVP94osbcugaAl67f+mNWdExytgiMzDXP6Vap5PVOCZvU8bt1QVHwISezBEm5GvxT
 GIHi+qTdKX5PynASC9qks9McsQHIFXgfkhCu8MM+Hs7Kg6DJjjCHOJr3YFx0MKLNmpPz
 31sxr5f5dHxZdCgl65TJR7g2Dx4WczB7JjvHcIaeWUKzEbUnSgZoFPuClshcvFBpW/ty
 gOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690407194; x=1691011994;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CFNQJOAD0fO9fjODgv9Vgz/m4W/3GjQnJ0WkDekZYbo=;
 b=HnkPqYbApsfZKrS2rtS/CWs7r9en5RyxDROPJONl5WrDJHqLlbJaT2Vpw/b3FkZfKK
 hVgXQFtec35JcR0KnaUbu9UDi14a8FbuTcGyTddqDpmbe8fWIIzSI+B5sg9d+YHQdvDg
 utmuYTAls/Bankn3/7y9vZnkrzYWoD65qWr/ZwFub8wUD5W3sxremrkPGIkeS9n/D3By
 PuwtOPj1KbICX1tj6LyCCYAA21nusWZttutualgAx9llV5rBsV2mo1IU55DyZVLnN72u
 pJEYMgE6IyrXyfIzyXX8H9PLzDxnkUSx4CdPnMXUh08EtSWjeYCwRvUARfNiwXHGYClW
 ufmA==
X-Gm-Message-State: ABy/qLbsA49zqOpcxIWG+AyWdoXLFBSJVLAFoqyYxX0DasX9GBIsIXB1
 66vYWdlvTEyLA9P2iMFP2FEuqJLvorjwxzK2BG3d7Q==
X-Google-Smtp-Source: APBJJlGXCjGO5xZaDzUx5cqSF6j27WCBpolM7Ziry3yh8CuILT8K/BWuLDciZXYpnM0MusKUmuadhMGz0Ix7z+n+R94=
X-Received: by 2002:a25:b29e:0:b0:d07:f1ed:51f6 with SMTP id
 k30-20020a25b29e000000b00d07f1ed51f6mr2959956ybj.2.1690407193694; Wed, 26 Jul
 2023 14:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <20230521171026.4159495-4-dmitry.baryshkov@linaro.org>
 <05f4708d-5db7-37ff-2d79-b4a9483606f9@quicinc.com>
In-Reply-To: <05f4708d-5db7-37ff-2d79-b4a9483606f9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jul 2023 00:32:52 +0300
Message-ID: <CAA8EJpqc69tUwt4345wQ-S4yP9-WhwdqV8760ESmxJZ1w26WQw@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm/mdss: export UBWC data
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

On Thu, 27 Jul 2023 at 00:21, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/21/2023 10:10 AM, Dmitry Baryshkov wrote:
> > DPU programming requires knowledge of some of UBWC parameters. This
> > results in duplication of UBWC data between MDSS and DPU drivers. Export
> > the required data from MDSS driver.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/msm_mdss.c | 30 +++++++++++++-----------------
> >   drivers/gpu/drm/msm/msm_mdss.h | 27 +++++++++++++++++++++++++++
> >   2 files changed, 40 insertions(+), 17 deletions(-)
> >   create mode 100644 drivers/gpu/drm/msm/msm_mdss.h
> >
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index d1e57099b517..ed836c659688 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -13,7 +13,7 @@
> >   #include <linux/pm_runtime.h>
> >   #include <linux/reset.h>
> >
> > -#include "msm_drv.h"
> > +#include "msm_mdss.h"
> >   #include "msm_kms.h"
> >
> >   #define HW_REV                              0x0
> > @@ -26,16 +26,6 @@
> >
> >   #define MIN_IB_BW   400000000UL /* Min ib vote 400MB */
> >
> > -struct msm_mdss_data {
> > -     u32 ubwc_enc_version;
> > -     /* can be read from register 0x58 */
> > -     u32 ubwc_dec_version;
> > -     u32 ubwc_swizzle;
> > -     u32 ubwc_static;
> > -     u32 highest_bank_bit;
> > -     u32 macrotile_mode;
> > -};
> > -
> >   struct msm_mdss {
> >       struct device *dev;
> >
> > @@ -185,12 +175,6 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
> >       return 0;
> >   }
> >
> > -#define UBWC_1_0 0x10000000
> > -#define UBWC_2_0 0x20000000
> > -#define UBWC_3_0 0x30000000
> > -#define UBWC_4_0 0x40000000
> > -#define UBWC_4_3 0x40030000
> > -
> >   static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
> >   {
> >       const struct msm_mdss_data *data = msm_mdss->mdss_data;
> > @@ -236,6 +220,18 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
> >       }
> >   }
> >
> > +const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
> > +{
> > +     struct msm_mdss *mdss;
> > +
> > +     if (!dev)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     mdss = dev_get_drvdata(dev);
> > +
> > +     return mdss->mdss_data;
> > +}
> > +
> >   static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >   {
> >       int ret;
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
> > new file mode 100644
> > index 000000000000..02bbab42adbc
> > --- /dev/null
> > +++ b/drivers/gpu/drm/msm/msm_mdss.h
> > @@ -0,0 +1,27 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2018, The Linux Foundation
> > + */
>
> Fix the copyright year .

No, the copyright year is correct. The data was moved from the c file
(which has this copyright) and there are no copyrightable additions.

>
> Apart from that,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



-- 
With best wishes
Dmitry
