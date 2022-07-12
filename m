Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C60572143
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 18:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B6114B3B2;
	Tue, 12 Jul 2022 16:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19B214B3B2;
 Tue, 12 Jul 2022 16:44:20 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 o19-20020a05600c511300b003a2de48b4bbso5723232wms.5; 
 Tue, 12 Jul 2022 09:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ifJdjMfhd2iKk/La1sz317DTxpZaVFErLsB8EAQCqWU=;
 b=buHV1961ijmLk+EpDYD/b3kQlIAzwXwGHkrSa+qr3YJD8K0JOQTBH18npKu2UAxJI9
 if6nRVZTEsq/N1LXwqAzDW3chSsMT76XzXAV3nIoNRlEvtaMnYamL/Th/dLMoQ/+FKgy
 DuD2ZFZKJ0h6Vk6nl/30AkDRlp+myyLiNQ5J7bbsbS977XiH38IjxU2IBB9+idJTNIlK
 eorXwQ+wZXNQBzGP7DTp0ICtHSXHz2LbwPYgpmC5WYZcErPp4UFOjrr6ZA6k/ncGseGj
 mhc0m97E9Jcq8Z+LwxTMT/NTS3QBA8gVrwg6F685n7+WmKsLURlmnXGApQ8LEn/Bsi+X
 BgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ifJdjMfhd2iKk/La1sz317DTxpZaVFErLsB8EAQCqWU=;
 b=bh5aO9/IATLZSMdNklOctt0iMcTSt1v1UlS7dxXOnDnchnoAZICGz1ArWIIZevZHsp
 tWHw4meK4IzRXjkpp7zfnhKNifJ7N9JsdxLUbQLLhdqdvko4zvwIFh3t6nClGaXRAEGG
 mthpkiRkDOzFCDIpc9x0ITbJd17CznShK+1QYNDqn1w46J1HBc30XOcvBM/AIzTLCzoa
 ZE5CfR4RJi4EIZ0ZL7KCsgNk0OMh4RB1gTmx4sPMCGIuFAtgjk1YBYNN1Sdz4U8hb1ZV
 ObXXi0nXqQYImMBfjKfa1/6isd9yMUKVInLsl5++wq5MVg7/TN6B/x4d1us+4Hg1UbUN
 7+Dw==
X-Gm-Message-State: AJIora/+trKTB19KFBCnO7n+3lZeudsQ66NNFiGKkO4aBe4E+6z4snZi
 SDY3nLUSKSFkqS53FUWWT9bRzrqZHgHs0OG1RfhAoDNK
X-Google-Smtp-Source: AGRyM1uF+nw1gsr9kC8U/QPMlY+svjw4dZlywScEVKJHQeUujCWzemXKgKo0sXo6LZbNZ/jGNbp/rV8RVM2souj65kk=
X-Received: by 2002:a05:600c:4f83:b0:3a1:7310:62e7 with SMTP id
 n3-20020a05600c4f8300b003a1731062e7mr5133866wmq.84.1657644258936; Tue, 12 Jul
 2022 09:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220709112837.v2.3.I4ac27a0b34ea796ce0f938bb509e257516bc6f57@changeid>
 <CAD=FV=U=J+yf6Qu0VgJ8A5Lhs_s8Fszw=Oa0XUny5XT-5z56xQ@mail.gmail.com>
 <1299312f-e614-e4e2-72cb-fd7fb99922ce@quicinc.com>
In-Reply-To: <1299312f-e614-e4e2-72cb-fd7fb99922ce@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 12 Jul 2022 09:44:35 -0700
Message-ID: <CAF6AEGvjD3LRm40mPr4n+jzx71WmwYpVWizUDLct9cgafjFRyw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 3/7] drm/msm: Fix cx collapse issue during
 recovery
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse <jordan@cosmicpenguin.net>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Matthias Kaehlcke <mka@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 11, 2022 at 10:05 PM Akhil P Oommen
<quic_akhilpo@quicinc.com> wrote:
>
> On 7/12/2022 4:52 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Jul 8, 2022 at 11:00 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >> There are some hardware logic under CX domain. For a successful
> >> recovery, we should ensure cx headswitch collapses to ensure all the
> >> stale states are cleard out. This is especially true to for a6xx family
> >> where we can GMU co-processor.
> >>
> >> Currently, cx doesn't collapse due to a devlink between gpu and its
> >> smmu. So the *struct gpu device* needs to be runtime suspended to ensure
> >> that the iommu driver removes its vote on cx gdsc.
> >>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> ---
> >>
> >> (no changes since v1)
> >>
> >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 ++++++++++++++--
> >>   drivers/gpu/drm/msm/msm_gpu.c         |  2 --
> >>   2 files changed, 14 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> index 4d50110..7ed347c 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -1278,8 +1278,20 @@ static void a6xx_recover(struct msm_gpu *gpu)
> >>           */
> >>          gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
> >>
> >> -       gpu->funcs->pm_suspend(gpu);
> >> -       gpu->funcs->pm_resume(gpu);
> >> +       /*
> >> +        * Now drop all the pm_runtime usage count to allow cx gdsc to collapse.
> >> +        * First drop the usage count from all active submits
> >> +        */
> >> +       for (i = gpu->active_submits; i > 0; i--)
> >> +               pm_runtime_put(&gpu->pdev->dev);
> >> +
> >> +       /* And the final one from recover worker */
> >> +       pm_runtime_put_sync(&gpu->pdev->dev);
> >> +
> >> +       for (i = gpu->active_submits; i > 0; i--)
> >> +               pm_runtime_get(&gpu->pdev->dev);
> >> +
> >> +       pm_runtime_get_sync(&gpu->pdev->dev);
> > In response to v1, Rob suggested pm_runtime_force_suspend/resume().
> > Those seem like they would work to me, too. Why not use them?
> Quoting my previous response which I seem to have sent only to Freedreno
> list:
>
> "I believe it is supposed to be used only during system sleep state
> transitions. Btw, we don't want pm_runtime_get() calls from elsewhere to
> fail by disabling RPM here."

The comment about not wanting other runpm calls to fail is valid.. but
that is also solveable, ie. by holding a lock around runpm calls.
Which I think we need to do anyways, otherwise looping over
gpu->active_submits is racey..

I think pm_runtime_force_suspend/resume() is the least-bad option.. or
at least I'm not seeing any obvious alternative that is better

BR,
-R
