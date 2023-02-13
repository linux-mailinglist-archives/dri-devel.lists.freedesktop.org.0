Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570426951CA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 21:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4853910E703;
	Mon, 13 Feb 2023 20:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17F610E703
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 20:24:41 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-52ec329dc01so159819667b3.10
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 12:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IozIfz/lMOPx2rs8ffv5j6yodYzusrmdIZCeFx4II1E=;
 b=YiRsAA8Os3DmpiNGwzSvpeSFM2FCzNEpYpUMkECOQzKYp2RDpc01r1XqGhVjYrAdLn
 2mtpZpQ6hdSDJ+3QYcGs+XvXOuHSkouqHaWkSgD8b6A/6S8S7iJKSrFGTjQs8nHLjrQW
 +fmbnL90JLrju3GlqlvRl0FVVTebkAvc2v+HfQ/WKEoDeBraXZImDpF2SnkvMRwezNG4
 TXiK8bMQUKXU2tEwNl1Ki1HBiALrIgnYeUyoBjhtprgd9dTQ6RSXkLka2mFpQv08pSEY
 MVSVjP0AlF6jIlfp1jUmPZEIjURzDtYVbQotGHyeX6VXTgATlXtrj42eZowObKjQ7Ybd
 O2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IozIfz/lMOPx2rs8ffv5j6yodYzusrmdIZCeFx4II1E=;
 b=MJhj1ZfrD/3ROOdtLvejnL44qnmzFHm94ewnZI4dtGTnG/4nmivYPLV7qWRqCBQzPl
 DGmycSJAvO+naaV918XwXDfiehAaRaIQPKmfWtX5qpbpm+0VhW+D9Qb76inhldD92mV+
 v+d9kB3vCtPvOl8GeFPfvy6Krt+5HtBM0aEssB1VKYqN10aihB2l3m7Uy6niMw3p1tKo
 71YThcKAcJjGwKOvkV02o5in7W649jTtorjpvf6dswAcHsmOfHElfTMZZ2ov7+Bn76gc
 6yDB80atwootz/VuC1a8yxgVfgrCsbzb5lk2tiqUrpK03BCgBlnUsGgzKMoqnGd2VYzV
 UPsg==
X-Gm-Message-State: AO0yUKV8MqEot248Wcj2jQQBhm6VL84fbwjUq2bmynYB+paiCKTHZGKp
 4x276xKR2FPgA6t/V6TRNYdVByGrH8wXY/hS5tYEqw==
X-Google-Smtp-Source: AK7set88SCxq80AaNbdYEdAzMQhu6gTClIokiS5I8cC4uNE+rETzLwdIDBKFIOyCT6jtH1wbwH134P1scqVX1Q83S1c=
X-Received: by 2002:a0d:d696:0:b0:52f:230a:f922 with SMTP id
 y144-20020a0dd696000000b0052f230af922mr618289ywd.481.1676319880944; Mon, 13
 Feb 2023 12:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-7-konrad.dybcio@linaro.org>
 <a18cf663-115d-edc8-5e4b-3d19fcd9a02c@linaro.org>
 <cc364658-478a-f239-5d17-5ca2b7f7df8b@linaro.org>
 <20230213113008.ih7ii5m3cz4w3lmz@SoMainline.org>
 <8560b69f-8d42-995d-2f4d-11d6a64afef0@linaro.org>
 <20230213142831.hbzfp2chekshsqyy@SoMainline.org>
 <28c9ea04-fedb-16cf-f874-f4c965fbc445@linaro.org>
 <20230213151413.qhpzzcz4c6m6rynk@SoMainline.org>
 <56281f37-2c7f-5f70-6c9e-87e950f06b0e@linaro.org>
 <cf77995f-3adf-d1a4-40ac-2f524b926835@quicinc.com>
In-Reply-To: <cf77995f-3adf-d1a4-40ac-2f524b926835@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 13 Feb 2023 22:24:29 +0200
Message-ID: <CAA8EJpqrHAUcpgPOnHtqrMLb1ZoSvNNj=fcXwXFpqMBh3i6=7g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 06/10] drm/msm/dpu: Add SM6350 support
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
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Robert Foss <rfoss@kernel.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Liu Shixin <liushixin2@huawei.com>, krzysztof.kozlowski@linaro.org,
 Vinod Koul <vkoul@kernel.org>, agross@kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Feb 2023 at 21:14, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 2/13/2023 8:25 AM, Dmitry Baryshkov wrote:
> > On 13/02/2023 17:14, Marijn Suijten wrote:
> >> On 2023-02-13 16:58:00, Dmitry Baryshkov wrote:
> >>> So, *possible* the merge order is the following:
> >>> - fixes from https://patchwork.freedesktop.org/series/113910/ go to
> >>> msm-fixes
> >>> - fixes from your intf-te go to msm-fixes
> >>> - https://patchwork.freedesktop.org/series/111751/
> >>> - the rest of intf-te and catalog (*see below)
> >>> - DPU features
> >>> - new DPU platforms (might go together with DPU features)
> >>>
>
> Fixes from https://patchwork.freedesktop.org/series/113910/ can be
> pulled into -fixes. Will send it out in a MR. I can see that you have
> absorbed a couple of independent fixes into this too (which were already
> reviewed outside the HW catalog rework series)
>
> And from the intf TE series only this one right?
>
> https://patchwork.freedesktop.org/patch/516429/

I think so. At least in the first submission.

>
> Other than this there are no "fixes" in that series.
>
> >>> * That really depends on the availability of the patchsets. Most
> >>> probably, as your patchset also contains several fixups, it would be
> >>> easier to land it before catalog split/rework.
> >>>
> >>> So, if you have the available timeslot, could you please finish & send
> >>> intf te on top of msm-next.
> >>
> >> Ack, I'll get to that immediately.  You might even pull in the
> >> intermediate patches linked above (that touch the catalog) to see how it
> >> integrates, if I remember correctly (it has been a while) the catalog
> >> changes should now be independent of driver changes...?
> >
> > I'll check and if it goes well, I'll just cherry-pick them into my branch.
> >
> >>
> >>>> Sure, I will at least start looking at your 50-patch as part of
> >>>> catching
> >>>> back up.  Do you want to process that on the mailing list or via
> >>>> https://gitlab.freedesktop.org/drm/msm/-/merge_requests/44?
> >>>
> >>> I'd prefer to use email. The MR was open to doublecheck that nothing got
> >>> broken on sc7180.
> >>
> >> Ack; will try providing feedback on the 50-patch series via email in
> >> parallel to getting INTF TE v2 out ASAP.  As discussed before I should
> >> probably add myself as reviewer to the drm/msm subsystem to have these
> >> patches in my inbox from the get-go though...
> >
>
> Jessica had some minor comments/questions on the intf te series. We have
> finished integrating and testing that on sm8350 while bringing up the
> DSC 1.2 panel and thats what led to
> https://patchwork.freedesktop.org/series/113851/
>
> Please wait for her comments / R-b .

Yes. My plan is to think about cherry-picking hw-catalog entries from
that patchset, which hopefully are good on their own.

-- 
With best wishes
Dmitry
