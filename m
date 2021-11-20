Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2A8457A1C
	for <lists+dri-devel@lfdr.de>; Sat, 20 Nov 2021 01:22:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DFA6E5C8;
	Sat, 20 Nov 2021 00:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9387E6E5C8
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Nov 2021 00:21:57 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id w22so14984893ioa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 16:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8zLquZzs24iQjQC4Eaf2dLTzvdVr5K8bViakf/mMOaI=;
 b=kv1u5ZYg776ndeEU+ERi/P4xWfao/xyifsnXNd6vd0PjjQj6YfGBG054WD5AXigBWg
 GofqDX1eF4snfQCNUDkT9oY1Il66VX9FHDiH1xQHNoQXF4s3kaveMXx+i1Kb6crl5kOB
 /EaOXTPzgjEUns83ux1D0Dt9A3I00EvK6vg30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8zLquZzs24iQjQC4Eaf2dLTzvdVr5K8bViakf/mMOaI=;
 b=YpgBZh6bGLwY4dbCv/lPfYFrL86RZyGq85HPEXWwzNscdmi8vA+Rx/3EgrDFm5Zr9B
 4A7cQIAia0sPqLF56q8CGQ/ckyYIQGadX4g1J9GD05GmeEpDdWVRt+E+DRU6hyfW8SsT
 pxlR3N8PP5N86c3lkxXcYvuMbYyR2qBbKyhd40Lj+UMFWtiO5GA/JRoFwwZClJTMtYdR
 c7/1EnZhrjt5H6+nm1IZFPrpjgjFVj3GtHZNW5UW/YCVxFq6yvHybucXW9xQc6K5ef+E
 SQJkJL1OBu5jVcNI7DCUmdIZkDgTOSV1rNupWrgBgqiVlYujJ2E1GX9Myua4VLMzP6C6
 PnHw==
X-Gm-Message-State: AOAM5330XgaefARGL5FSHyOzrJ2ieZLPTBDqj+el6gr3zaVF3kMQKKDa
 Ve0ePwPlD4qtgzCX16FDhWxCBem0tSGqQA==
X-Google-Smtp-Source: ABdhPJxYJ1qw5SqEQFEvJPcafMj4JSl5gQZL0xjeh63EyQpIHGqXhXJo6G3sALCLIH9f8+gMEL6UNw==
X-Received: by 2002:a05:6638:dc3:: with SMTP id
 m3mr31863436jaj.106.1637367716765; 
 Fri, 19 Nov 2021 16:21:56 -0800 (PST)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com.
 [209.85.166.170])
 by smtp.gmail.com with ESMTPSA id s5sm912360ild.14.2021.11.19.16.21.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 16:21:56 -0800 (PST)
Received: by mail-il1-f170.google.com with SMTP id w15so11878780ill.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 16:21:56 -0800 (PST)
X-Received: by 2002:a05:6e02:18ce:: with SMTP id
 s14mr7289654ilu.142.1637367715969; 
 Fri, 19 Nov 2021 16:21:55 -0800 (PST)
MIME-Version: 1.0
References: <20211119225157.984706-1-robdclark@gmail.com>
 <20211119225157.984706-2-robdclark@gmail.com>
In-Reply-To: <20211119225157.984706-2-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 19 Nov 2021 16:21:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UraStftJyUDHp5=iKoh4tnCQiTgBZJBNF3-q=HDZUPZw@mail.gmail.com>
Message-ID: <CAD=FV=UraStftJyUDHp5=iKoh4tnCQiTgBZJBNF3-q=HDZUPZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/gpu: Respect PM QoS constraints
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 19, 2021 at 2:47 PM Rob Clark <robdclark@gmail.com> wrote:
>
> +void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor)
> +{
> +       struct msm_gpu_devfreq *df = &gpu->devfreq;
> +       unsigned long freq;
> +
> +       freq = get_freq(gpu);
> +       freq *= factor;
> +       freq /= HZ_PER_KHZ;

Should it do the divide first? I don't know for sure, but it feels
like GPU frequency could conceivably be near-ish the u32 overflow? (~4
GHz). Better to be safe and do the / 1000 first?


> @@ -201,26 +217,14 @@ static void msm_devfreq_idle_work(struct kthread_work *work)
>         struct msm_gpu_devfreq *df = container_of(work,
>                         struct msm_gpu_devfreq, idle_work.work);
>         struct msm_gpu *gpu = container_of(df, struct msm_gpu, devfreq);
> -       unsigned long idle_freq, target_freq = 0;
>
>         if (!df->devfreq)
>                 return;

Why does the msm_devfreq_idle_work() need a check for "!df->devfreq"
but the boost work doesn't? Maybe you don't need it anymore now that
you're not reaching into the mutex? ...or maybe the boost work does
need it?

...and if "df->devfreq" is NULL then doesn't it mean that
msm_hrtimer_work_init() was never called? That seems bad...


-Doug
