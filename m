Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 395E746229D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 21:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066AB6E21D;
	Mon, 29 Nov 2021 20:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2116E17C;
 Mon, 29 Nov 2021 20:56:56 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a9so39622112wrr.8;
 Mon, 29 Nov 2021 12:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ql+suTnFvydSezbeHxVyPeDhtZlxR55/pcfoLfrc7+k=;
 b=Ens7ubDTOxqILotmtNmGg8U+4zE7BrADm8c85OPM9xJDZ/hgVyIKJZjoV+78BP7c7k
 /42TkHcAidV1uMsYtQMyGrV1m46QqeIWB61TSLpW4zNiUKOLWvUdPvCHt6tFReeOyvkj
 ohe4+m5f4e3OgOcc7zYxKRjV2MHoZGYlBLqmAftUa3pwuorsO8l/oHwYsC2bgaftikab
 hecr4tOEXJJAYjQ0mhefuLilKbAr95aBIF2o8Hj/FkBh6r+CAD7AtoWA7Ynw3C9yUmIm
 +/ggRVfCsqiUMEwKZp2FlaERAsIBfSkbyxqR16melEVlK/TkaFlefutwni+FeVH85os8
 5ZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ql+suTnFvydSezbeHxVyPeDhtZlxR55/pcfoLfrc7+k=;
 b=iQgLiNkIq6P9dvjJjz/rLLXjoewvCPbkV24SythMSQdo6eXamq9UJ8sJ0Pib6AL2r/
 b1E2jD7IYuKOoqubtWcSk6dY3nUUGG8Ye/kei75TLHW1vCSs1eTp0GOPBV7VfcIsnDT6
 F1ZeO3dRWtiV/5QqKImc4svl+o7vwZ/g0r4Sxk9ndiLdAlEwB8ioKujFkBDcel8V2Of9
 HKvUso8YbQEDQGz470G4z9PT5DU+57nF73cFMw/qaJPKwVl0gkzOhip3Fcie5oXQ3zb6
 5hmk7VhPq8dc/jI96LlGZtQK2nr0lbPn2lKNu0vkFowANdFzf2Rg6mgOuKjcn4CpBhPu
 v2TQ==
X-Gm-Message-State: AOAM532NjGRYSgNAbfwMU6n1F0iURUoFUPkCPnckWC5CUgsiBtWchc20
 1PJ73AGySidagSa85+1VjKqo3l+l6CA1KdTM1mEiRzOtNUk=
X-Google-Smtp-Source: ABdhPJyrJ30OAXdBPr/U7cQs7gHEQbhx9D9YurENX81bSHU6lw8F1FvL1j+nliIEMNEguTJT6UDhj1LZLQ4tblRLOcg=
X-Received: by 2002:adf:e904:: with SMTP id f4mr35829349wrm.245.1638219414380; 
 Mon, 29 Nov 2021 12:56:54 -0800 (PST)
MIME-Version: 1.0
References: <20211129182344.292609-1-robdclark@gmail.com>
In-Reply-To: <20211129182344.292609-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 29 Nov 2021 13:02:05 -0800
Message-ID: <CAF6AEGtLoT7XE-KoASfn=FjMvPmSijmjUYSyd_dFgubnjio3zw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gpu: Don't allow zero fence_id
To: dri-devel <dri-devel@lists.freedesktop.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 29, 2021 at 10:18 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Elsewhere we treat zero as "no fence" and __msm_gem_submit_destroy()
> skips removal from fence_idr.  We could alternately change this to use
> negative values for "no fence" but I think it is more clear to not allow
> zero as a valid fence_id.
>

probably should have added:

Fixes: a61acbbe9cf8 ("drm/msm: Track "seqno" fences by idr")

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 282628d6b72c..6cfa984dee6a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -881,7 +881,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>          * to the underlying fence.
>          */
>         submit->fence_id = idr_alloc_cyclic(&queue->fence_idr,
> -                       submit->user_fence, 0, INT_MAX, GFP_KERNEL);
> +                       submit->user_fence, 1, INT_MAX, GFP_KERNEL);
>         if (submit->fence_id < 0) {
>                 ret = submit->fence_id = 0;
>                 submit->fence_id = 0;
> --
> 2.33.1
>
