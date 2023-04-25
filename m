Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5D26EE3DD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 16:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6B810E301;
	Tue, 25 Apr 2023 14:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F019310E301
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 14:26:57 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-b8f32969ab0so10370313276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 07:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682432816; x=1685024816;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kbD1oCQK52/WTKujUBAVRhz/h35B5FS7o9GLDaVgvUg=;
 b=LGMfNC+nTBPrgf5Af4/ohQbKn6AHdljSnvffiECsphEFyX2qT8Hs2n0Gx7F3gWZykf
 qoFYEV1yL3d6olaNXixbV0ToXH+YiGnkItVrvaUAgVuVEOMMA3b59FZ31O/b1spF5HEr
 kDnVT6TuLrCVaHerZkdIlH2BxP8CF+RxHQIk1zHiKAbASGrAmQg3aFaObODMbiSf+D3p
 txoJTRej2XbvfmsWEYM9WCjZx/W05d3b/tdEKIiUMYuMLymdXjKs5mfEQupYxeNm+E9u
 v22VYQphIBWtpGwWL9GmzD17igHcxbfeKxYaPp57XcSozb8Tiy5dWmHA9WCZLnSt64eK
 qHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682432816; x=1685024816;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kbD1oCQK52/WTKujUBAVRhz/h35B5FS7o9GLDaVgvUg=;
 b=Cuh/jrgeO83m078ttjD+YF7KC9EI1En2fezkfyL5PLQnFZxJaF+dcR/FZMXof6Z7E6
 MXSPZcEuE0iaOgfJZzlohzFy0YUHuzotD2XOTz8K88TJkm/83LtBgSqsps5alPCqlPfx
 4LdyLjEQJqbUJEDI53+A24yHGhCF7P/mjEqP2PC0MhFr1Lqfu4+lqla9ws+qMFYnxzX2
 NqwQPiXF0x93ut8MT03Bbp3IiJRz1eKHRtkFZV9L/4mXyXmRqwO3D9dGlYJO/9cqbxTD
 G7yMnsHACJjrJEG/W0lG+Q85sEYbfYzbKO0GyZzJGGGT8qA5wqh0LA/Vvk7oiMkxcxDJ
 90Xg==
X-Gm-Message-State: AAQBX9eJnTiXcW6SYBx+IGQYqj2x/cEd8CXFOFO31Xhz7llSX0ZxDybQ
 0Fe18ODSjjrixlEZADBuFkPDcZCx2maeoRqxz8LSUA==
X-Google-Smtp-Source: AKy350aTQoPi8zTpL/bCLMkql0SQ8OHvzQ1OTTg3cKITKDykkBSd009WKdo8gkgJlYdMZLO5iqTwEK2tJwdYiHg9Gxc=
X-Received: by 2002:a25:aab2:0:b0:b92:32aa:be5c with SMTP id
 t47-20020a25aab2000000b00b9232aabe5cmr12680159ybi.49.1682432816630; Tue, 25
 Apr 2023 07:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230418-dpu-drop-useless-for-lookup-v2-0-acb08e82ef19@somainline.org>
 <20230418-dpu-drop-useless-for-lookup-v2-3-acb08e82ef19@somainline.org>
 <50d22e0c-84b3-0678-eb06-30fb66fd24cf@quicinc.com>
 <ymq4kstme55dm3j5kr6trevnwdelhjq7e7m4yky6zcbnf7auid@66l7inxz4oq2>
 <CAA8EJprYQUFER6x1+ucHX_Ze2uqWc6xoEaYDdJ1s0jgZjPJ0QQ@mail.gmail.com>
 <c809476f-74bc-0399-08f9-1bf26e7170fa@quicinc.com>
 <r2tndjr5jbjtrwwti6l3ag7562e53nqx2uk6vz6fx43yc7sncl@eypc37r2ey3j>
 <31f116f6-a6b7-1241-83bc-96c31e718f3f@linaro.org>
 <m5z5mv5hbdgpjbfo3mqo5s3egshnlu77nla4b7txddlsbk5fvi@jitwvapbr7wr>
In-Reply-To: <m5z5mv5hbdgpjbfo3mqo5s3egshnlu77nla4b7txddlsbk5fvi@jitwvapbr7wr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Apr 2023 17:26:45 +0300
Message-ID: <CAA8EJpoCeCkucvb=a+1ken_yR=8FvcECrvajOk5MxgO-j2nD6A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: Pass catalog pointers directly from
 RM instead of IDs
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org,
 Jami Kettunen <jami.kettunen@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Apr 2023 at 11:55, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-04-25 10:54:47, Dmitry Baryshkov wrote:
> > On 25/04/2023 10:16, Marijn Suijten wrote:
> > > On 2023-04-24 16:23:17, Abhinav Kumar wrote:
> > >>
> > >>
> > >> On 4/24/2023 3:54 PM, Dmitry Baryshkov wrote:
> > >>> On Tue, 25 Apr 2023 at 01:03, Marijn Suijten
> > >>> <marijn.suijten@somainline.org> wrote:
> > >>>>
> > >>>> On 2023-04-21 16:25:15, Abhinav Kumar wrote:
> > >>>>>
> > >>>>>
> > >>>>> On 4/21/2023 1:53 PM, Marijn Suijten wrote:
> > >>>>>> The Resource Manager already iterates over all available blocks from the
> > >>>>>> catalog, only to pass their ID to a dpu_hw_xxx_init() function which
> > >>>>>> uses an _xxx_offset() helper to search for and find the exact same
> > >>>>>> catalog pointer again to initialize the block with, fallible error
> > >>>>>> handling and all.
> > >>>>>>
> > >>>>>> Instead, pass const pointers to the catalog entries directly to these
> > >>>>>> _init functions and drop the for loops entirely, saving on both
> > >>>>>> readability complexity and unnecessary cycles at boot.
> > >>>>>>
> > >>>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > >>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >>>>>
> > >>>>> Overall, a nice cleanup!
> > >>>>>
> > >>>>> One comment below.
> > >>>>>
> > >>>>>> ---
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c        | 37 +++++----------------
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h        | 14 ++++----
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c        | 32 +++---------------
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h        | 11 +++----
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c       | 38 ++++-----------------
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h       | 12 +++----
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 +-
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c       | 40 ++++++-----------------
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h       | 12 +++----
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c         | 38 ++++-----------------
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h         | 10 +++---
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 33 +++----------------
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    | 14 ++++----
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 33 +++----------------
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++++----
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c       | 39 ++++------------------
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h       | 12 +++----
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c       | 33 +++----------------
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h       | 11 +++----
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c         | 33 ++++---------------
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h         | 11 +++----
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 17 +++++-----
> > >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c            | 18 +++++-----
> > >>>>>>     23 files changed, 139 insertions(+), 375 deletions(-)
> > >>>>>>
> > >>>>>
> > >>>>> <snipped>
> > >>>>>
> > >>>>>> -struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
> > >>>>>> -           void __iomem *addr,
> > >>>>>> -           const struct dpu_mdss_cfg *m)
> > >>>>>> +struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
> > >>>>>> +           void __iomem *addr)
> > >>>>>>     {
> > >>>>>>       struct dpu_hw_intf *c;
> > >>>>>> -   const struct dpu_intf_cfg *cfg;
> > >>>>>> +
> > >>>>>> +   if (cfg->type == INTF_NONE) {
> > >>>>>> +           pr_err("Cannot create interface hw object for INTF_NONE type\n");
> > >>>>>> +           return ERR_PTR(-EINVAL);
> > >>>>>> +   }
> > >>>>>
> > >>>>> The caller of dpu_hw_intf_init which is the RM already has protection
> > >>>>> for INTF_NONE, see below
> > >>>>>
> > >>>>>            for (i = 0; i < cat->intf_count; i++) {
> > >>>>>                    struct dpu_hw_intf *hw;
> > >>>>>                    const struct dpu_intf_cfg *intf = &cat->intf[i];
> > >>>>>
> > >>>>>                    if (intf->type == INTF_NONE) {
> > >>>>>                            DPU_DEBUG("skip intf %d with type none\n", i);
> > >>>>>                            continue;
> > >>>>>                    }
> > >>>>>                    if (intf->id < INTF_0 || intf->id >= INTF_MAX) {
> > >>>>>                            DPU_ERROR("skip intf %d with invalid id\n",
> > >>>>> intf->id);
> > >>>>>                            continue;
> > >>>>>                    }
> > >>>>>                    hw = dpu_hw_intf_init(intf->id, mmio, cat);
> > >>>>>
> > >>>>> So this part can be dropped.
> > >>>>
> > >>>> I mainly intended to keep original validation where _intf_offset would
> > >>>> skip INTF_NONE, and error out.  RM init is hence expected to filter out
> > >>>> INTF_NONE instead of running into that `-EINVAL`, which I maintained
> > >>>> here.
> > >>>>
> > >>>> If you think there won't be another caller of dpu_hw_intf_init, and that
> > >>>> such validation is hence excessive, I can remove it in a followup v3.
> > >>>
> > >>> I'd prefer to see the checks at dpu_rm to be dropped.
> > >>> dpu_hw_intf_init() (and other dpu_hw_foo_init() functions) should be
> > >>> self-contained. If they can not init HW block (e.g. because the index
> > >>> is out of the boundaries), they should return an error.
> > >>>
> > >>
> > >> They already do that today because even without this it will call into
> > >> _intf_offset() and that will bail out for INTF_NONE.
> > >>
> > >> I feel this is a duplicated check because the caller with the loop needs
> > >> to validate the index before passing it to dpu_hw_intf_init() otherwise
> > >> the loop will get broken at the first return of the error and rest of
> > >> the blocks will also not be initialized.
> > >
> > > To both: keep in mind that the range-checks we want to remove from
> > > dpu_rm_init validate the ID (index?) of a block.  This check is for the
> > > *TYPE* of an INTF block, to skip it gracefully if no hardware is mapped
> > > there.  As per the first patch of this series SM6115/QCM2290 only have a
> > > DSI interface which always sits at ID 1, and ID 0 has its TYPE set to
> > > INTF_NONE and is skipped.
> > >
> > > Hence we _should_ keep the graceful TYPE check in dpu_rm_init() to skip
> > > calling this function _and assigning it to the rm->hw_intf array_.  But
> > > I can remove the second TYPE check here in dpu_hw_intf_init() if you
> > > prefer.
> >
> > We can return NULL from dpu_hw_foo_init(), which would mean that the
> > block was skipped or is not present.
>
> An then replace the `if INTF_NONE continue` logic in dpu_rm_init with a
> check for NULL that skips, and a check for IS_ERR` that goes to `fail`?

You can just drop the INTF_NONE in dpu_rm. If dpu_hw_intf_init()
returns NULL, the rest of the code in dpu_rm will work correctly.

>
> Should I do that in a new or the same patch for v3?
>
> Note that there's a similar check for the `pingpong` "id" member of
> every Layer Mixer.
>
> - Marijn



-- 
With best wishes
Dmitry
