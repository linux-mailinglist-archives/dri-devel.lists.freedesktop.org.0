Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5757985A284
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 12:53:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D2610E233;
	Mon, 19 Feb 2024 11:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X/HCRzyC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969FA10E233
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 11:53:00 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dc74435c428so3820714276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 03:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708343579; x=1708948379; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eDlnERxsGwtLXki6krZHreIryztOLvxcnQnuu/21/BE=;
 b=X/HCRzyCCgAyX6WR4UdTNoMrqRBIzPKvBwuhXO+rfH4KSUnTGRjiEGKEImSfdx7767
 yUqdxs44xL4/Zm4ssIhAnDQJ6qshZlZ2xoIaGJTG95DcsJUqgZIv+w3HBdoIC0/9ThGU
 QgGmXBTcFbEKfWz2yuN2R5OcmMQ2zsoIB+fDdfVTVlrkBXFlam1izxSe6zoR6opHEgT2
 s31W1hel7LKf6LlsCDtt4VfXAsgq8MmlykccdgX4lDvq6XFYknPk9dKttAio4+r5sEZ2
 pdOPJxO7c7DMGjpE4grIjUIKsgiX2JvWk5HgGm//2D2CIsWDtEawY7abZIc7sPLU5lCm
 wPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708343579; x=1708948379;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eDlnERxsGwtLXki6krZHreIryztOLvxcnQnuu/21/BE=;
 b=QnHHLz/WOuapAhkbe+sODn34igFaf73SwQJui1bhlbG6ucE5lad1/D+fu3bn35D/vO
 oD4KK9cig3I0pAP6m4awEptBTXanlFv2b7bIhnJB3qnualBv4pzJD//ETRa25uYAykHD
 tpqCxL45Oysxgu7JK5MP6Ei22zf2+xHre5PcQDZraI/IRhXhWtMAUZ9jOuMCWu2DuP74
 iWbsweLba6NBe1rpIHPlrMoI8rrpdypFpBcXqtfnuZHrdY65piqPZ37DyYNfnBkZnQnm
 42O9EQOy1om2XIFiXh4eWJFG0FzVuBjpVuDTOKdAzJLsPes9W/57tNkqjbxPGEzgMYH+
 B08A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeiSrZJvbsf6X6mOjjs1VJn1e99b6TMCmz4GKtoF6KkNXj9+DJrE2o2H9bFQH9EpqER2HAr8t5c+9KbC7y+Q9aH7x0lCTQZi6srboh6EEC
X-Gm-Message-State: AOJu0YxM12LYtkCBUZ/pn7/n2pEz/jyi4Om8l9+pur2ZhcN24P/PE9Gr
 uSO1PJVHmkCpxC7DG5CQvGJrh2iNDWpcfSpj+LLoen+L0ME6vQJAV7m6OwpEewjzl17YCzM6gdE
 cHgja/+RZ4JbK+b6d8TlLEpojKFxeGH2t86xq7w==
X-Google-Smtp-Source: AGHT+IEPnDswYQFtDH941jPPgVJlGCvd1CpCQH5qqUk8Fa/hDLMhAwQb5bV+etm3XhmW+ddV9H3F2J9t1vD4jdi3+lU=
X-Received: by 2002:a25:b322:0:b0:dcd:2aa3:d73b with SMTP id
 l34-20020a25b322000000b00dcd2aa3d73bmr9660313ybj.50.1708343579395; Mon, 19
 Feb 2024 03:52:59 -0800 (PST)
MIME-Version: 1.0
References: <20240208-fd-dpu-debug-timeout-v2-1-9f907f1bdd87@linaro.org>
 <1cb90bff-ce5b-c6d1-a3df-24f6306f833a@quicinc.com>
 <CAA8EJpotiHKT_NYphDs0-vhpvsybgTW281XDYbteUx8qOX=v4g@mail.gmail.com>
 <63bba15b-6d8d-5ba8-d99d-8cd2dd763262@quicinc.com>
In-Reply-To: <63bba15b-6d8d-5ba8-d99d-8cd2dd763262@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 13:52:48 +0200
Message-ID: <CAA8EJpqHmVBry9FyJ6HRB+qdVcVNN3Q7rHZz1daZL1Sz6yeZ=A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: make "vblank timeout" more useful
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Wed, 14 Feb 2024 at 22:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/14/2024 11:20 AM, Dmitry Baryshkov wrote:
> > On Wed, 14 Feb 2024 at 20:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/8/2024 6:50 AM, Dmitry Baryshkov wrote:
> >>> We have several reports of vblank timeout messages. However after some
> >>> debugging it was found that there might be different causes to that.
> >>> To allow us to identify the DPU block that gets stuck, include the
> >>> actual CTL_FLUSH value into the timeout message and trigger the devcore
> >>> snapshot capture.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>> Changes in v2:
> >>> - Added a call to msm_disp_snapshot_state() to trigger devcore dump
> >>>     (Abhinav)
> >>> - Link to v1: https://lore.kernel.org/r/20240106-fd-dpu-debug-timeout-v1-1-6d9762884641@linaro.org
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
> >>>    1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>> index d0f56c5c4cce..a8d6165b3c0a 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>> @@ -489,7 +489,8 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
> >>>                (hw_ctl->ops.get_flush_register(hw_ctl) == 0),
> >>>                msecs_to_jiffies(50));
> >>>        if (ret <= 0) {
> >>> -             DPU_ERROR("vblank timeout\n");
> >>> +             DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
> >>> +             msm_disp_snapshot_state(phys_enc->parent->dev);
> >>
> >>
> >> There is no rate limiting in this piece of code unfortunately. So this
> >> will flood the number of snapshots.
> >
> > Well... Yes and no. The devcoredump will destroy other snapshots if
> > there is a pending one. So only the console will be flooded and only
> > in case when MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE is enabled.
> >
>
> Yes, true but at the same time this makes it hard to capture a good dump
> as potentially every vblank you could timeout so this destroy/create
> cycle wont end.

Excuse me, maybe I miss something. On the first timeout the snapshot
is created. It is held by the kernel until it is fully read out from
the userspace. Other snapshots will not interfere with this snapshot.

Or are you worried that snapshotting takes time, so taking a snapshot
will also interfere with the vblank timings for the next vblank?

-- 
With best wishes
Dmitry
