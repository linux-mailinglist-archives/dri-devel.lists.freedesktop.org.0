Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D094E9935
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 16:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2227B10EC3F;
	Mon, 28 Mar 2022 14:18:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F285410EC3F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 14:18:14 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id q129so15737977oif.4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 07:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=flKGI/Mss7lnXrb+eI4wavm5fQi5wDxrdYLw/aDe/7E=;
 b=WyWz3pwRVT7XwEfp32cz+qZYqeFExZ/jlpXo0mevK9fhAnxcEM40ap75htUFs1NIpc
 8OtK/0roI0AFNb0EKrNUXl8SqJ/m9e1/1/S37xiBIXC77qcwFR+qkvXJK3ez+urkKRO+
 s4cAaXshcE5jFVhyXBCWE7XKKCYOqPmwFYJpLbg9qtXVUGjDimBRXpKAYzEnA87YiCrW
 4QVAoGSiKKggjWhJno4uhrhoa+7V12ME6J3nGaDMnRCHOhk4bx/RBOB2zcxhP1qy7nER
 r82b+ifxdNsKht33/k+eU2zcY+qv8UPyIepZo7BT+TqZ8PuIKaamhVjrXPqiaE/h+XPf
 e6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=flKGI/Mss7lnXrb+eI4wavm5fQi5wDxrdYLw/aDe/7E=;
 b=d0UCA4LCo8PVMHusU9tLAnCkw+U6TJK9qV9sAZZEYkx1N/NHn8L+SU/5hGjaPqxoaq
 6QibTNGxcjo+XzPn72LqB2zfn8xIV0ljGc2+bhmZ0wUnkjhQIZhK/Ypzj9QvRSB519Om
 5LgLxJrLtNlbqKmaS4J2cwdIV5OHURk5/2WUCbNGXCGPer2SwlGjsuHqrFNgCLZwLOxw
 sDBLRtGXrKCPlTr1iTnm6ouitp9uT7KEH8tKAqMpTc22/8CEj3PGbSx/1ERaMxxlgO1h
 Grh0eX/W/1vhz4cckKwQMGEsdWLLROzVsx8DTUERbdvCGAnQkXVchfaTh/eOU3Vl1HG7
 qAkw==
X-Gm-Message-State: AOAM533I5L/tTjOzgymlDJ3Rq4bSvQBm7G/A+sOeGVZVCZ1jtpG1SL/7
 bhVztbBg+QD2ujXsywD/PBBoWDofylwpHucOsSI=
X-Google-Smtp-Source: ABdhPJw97nLWTxkUGe/naEtok+By6Sppp0nx9coOnjHSRbo7atJSPfLIsUrJEvPGPEiI4hWZCO06ZezGgHRunO/Bhj4=
X-Received: by 2002:aca:d04:0:b0:2ef:8b45:d235 with SMTP id
 4-20020aca0d04000000b002ef8b45d235mr12104304oin.253.1648477094175; Mon, 28
 Mar 2022 07:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220328132532.406572-1-andrey.grodzovsky@amd.com>
In-Reply-To: <20220328132532.406572-1-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 28 Mar 2022 10:18:03 -0400
Message-ID: <CADnq5_P1nLx1+1KVm0_P4cQj2y9BDOfeodSbT8Fuq7xCo+exmw@mail.gmail.com>
Subject: Re: [PATCH] drm/sched: Fix htmldoc warning.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 9:25 AM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> Fixes the warning.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

You may want to add a Reported-by for Stephen,  WIth that,

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>


> ---
>  include/drm/gpu_scheduler.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 944f83ef9f2e..0fca8f38bee4 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -270,6 +270,7 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>   * @sched: the scheduler instance on which this job is scheduled.
>   * @s_fence: contains the fences for the scheduling of job.
>   * @finish_cb: the callback for the finished fence.
> + * @work: Helper to reschdeule job kill to different context.
>   * @id: a unique id assigned to each job scheduled on the scheduler.
>   * @karma: increment on every hang caused by this job. If this exceeds the hang
>   *         limit of the scheduler then the job is marked guilty and will not
> --
> 2.25.1
>
