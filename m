Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E96B515790
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 00:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F06B10F0DC;
	Fri, 29 Apr 2022 22:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DCA10F0DC;
 Fri, 29 Apr 2022 22:00:14 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id x18so12446800wrc.0;
 Fri, 29 Apr 2022 15:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3YvJQ8AnVTjfxXBmIcp4SKnbUwO/iQ1O2/sNT7auhlc=;
 b=Mt/mI0/OBXBeNhi9sXshjI8jxnT5wdIT8DJ3pLbrSH5vmO4Cd5tRHisCYP9Szu+M+e
 1i0MOQGIeOEWLLM3DbI++ffIRdM44r//1bhYJnM6WYFAHuH3hMxgSCZorYLY4YIrIBxz
 yvbIRpUHCuKQUB09fySYM8xYFW9V6VOqhuQcuIN6uTngS6JELu22Q2qtRXnVoKAf0kHg
 hBThL82Tc+5LAJLkfrQVwIEPTlxUkGrbzDzmTFjMCJwy4Y37aDoiJg0ZKRVbjeKb1ZnO
 f/niq1HPBVrZPWO5rTcaDsnvzYy6UkSn5Umu4KvCn+aKuwQF4uk90AUGy+Hh2abxlefT
 B8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3YvJQ8AnVTjfxXBmIcp4SKnbUwO/iQ1O2/sNT7auhlc=;
 b=TTkRq7Jkun+Plk+BGzybaXFnCVt0tL1F6o61Z5KeGKt9xCxlIghjQCXxJxHsWnXD9P
 YaXA/hjO7FoTEktQKRvcSDBhtXhfK557OXVa4bb9hfGL/TB2YLYAuIDxCQCZNyCIGhm/
 XHVpUZOqfU08IGtDchFHCOO/R8U7s8p+UR2TpWU9BurISEHwwB45oZNFF1UOmPyf5B8I
 x85cd7VzvqdCfA7SYiRxBhIAchssElN+WShc6PkwcCLexUuB2Mz4RdiFNvPqgao0TN11
 KOdkdNuW0gmk0Z9N6RCHeVZmbw+Vjp/EsI15YtpZAaDmRVJ58rxh+CMrXH4s6GkaCeJz
 MNhg==
X-Gm-Message-State: AOAM533KZFQHBVlq4+djCF6/YUwD2kv6NtgyUJyQLKz9Bb4+7GDMVMyP
 NOGD5UTzk0ezwFlmpYOhUpctuDHRKQT4N6BhZJM=
X-Google-Smtp-Source: ABdhPJzfbZNuQ24oj/IbRhwz5VVFSzob3RDgay6MXgeZTuyPfwNUqu7QRyHY+WjpuSo4eoDsyxQebCkk3u3qwldIH24=
X-Received: by 2002:a05:6000:18c5:b0:207:ac0d:f32 with SMTP id
 w5-20020a05600018c500b00207ac0d0f32mr789629wrq.574.1651269612858; Fri, 29 Apr
 2022 15:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220429215324.3729441-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220429215324.3729441-1-dmitry.baryshkov@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 29 Apr 2022 15:00:02 -0700
Message-ID: <CAF6AEGu+Ve1i_WHwcyXkGZKnv0aOiQNW7NCv=ToDpoorsn=TgA@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Add Dmitry as MSM DRM driver co-maintainer
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 29, 2022 at 2:53 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> For the past several releases I have been assisting Rob by writing,
> collecting, testing and integrating patches for non-GPU and non-core
> parts of MSM DRM driver, while Rob is more interested in improving the
> GPU-related part. Let's note this in the MAINTAINERS file.
>
> While we are at it, per Rob's suggestion let's also promote Abhinav
> Kumar to M: (as he is actively working on the driver) and switch Sean
> Paul to R: (since he isn't doing much on msm these days).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Rob Clark <robdclark@gmail.com>

> ---
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 61d9f114c37f..782934f318d4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6254,8 +6254,9 @@ F:        drivers/gpu/drm/tiny/panel-mipi-dbi.c
>
>  DRM DRIVER FOR MSM ADRENO GPU
>  M:     Rob Clark <robdclark@gmail.com>
> -M:     Sean Paul <sean@poorly.run>
> -R:     Abhinav Kumar <quic_abhinavk@quicinc.com>
> +M:     Abhinav Kumar <quic_abhinavk@quicinc.com>
> +M:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +R:     Sean Paul <sean@poorly.run>
>  L:     linux-arm-msm@vger.kernel.org
>  L:     dri-devel@lists.freedesktop.org
>  L:     freedreno@lists.freedesktop.org
> --
> 2.35.1
>
