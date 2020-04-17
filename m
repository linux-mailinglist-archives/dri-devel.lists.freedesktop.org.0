Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 140D21AE705
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 22:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8167E6EB0B;
	Fri, 17 Apr 2020 20:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D9E6EB08
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 20:56:48 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id g184so2074031vsc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 13:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nTPDJ1FZx21ZUdm/rZe6vuNjgKbQ4V6e3Md/8z5QSYQ=;
 b=NTiOrafaduGKDmVfB6vAvc2mWdTspMay2fHcWX+kFb/9rqtwB1ixoAxjzkdoDWotNU
 cJPXhjrUZPXQpMjnVmPFTyNGXTFPAxaFIEJ+J06zvtyOEqhWnIlMm7m494gCUii9ggCA
 1t8AcHugDOTujupYSZCzSQt7zsOSByyoz29Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nTPDJ1FZx21ZUdm/rZe6vuNjgKbQ4V6e3Md/8z5QSYQ=;
 b=rpAs0g5LQ65eWy1PQH9lXmqj9gKgFOlyUUlB/q8aSgLyrGLF7NAXXc19p0PTuL7Zdn
 AnD548ZUyg/PxwwNG87ADMfyFRNJNa2y6NIHXBZUyx/FriehThUTwu64vtF6qWX27Agd
 lKlR8gcRo5JEyWbhw8XVSW/fRgOWtt+O9uiEr5s63Pwnuaiu9Q1nd8ksLUkNsLV/A6+J
 upIduRz3fkmb0MjO4m+VY+mPm9iK34iS40Vdbu4000hRHNt44wXGJ29m86XdEDjEHbcy
 6AIhdKGEOMyyisf0fDyu/eFLw3zrQGq8CvE2rb4LuxbpZ0g1n7hYJB5fNezxYpQBg6O3
 IODA==
X-Gm-Message-State: AGi0PuY3XrXQ80E1z3GEXjUKt8toXj+9Sch+7SG6kR1JZmn3pA50zUa4
 OCTqsg2RjLek+sKfZ9PRYQYDAGA75tk=
X-Google-Smtp-Source: APiQypL23qq17QvzpdUGPOfjN9rtR/5suVPymym/FMa392Cc5X5pLxgkJ/3sK4XfHvakDLw62Ssq+g==
X-Received: by 2002:a67:f597:: with SMTP id i23mr4000637vso.137.1587157007450; 
 Fri, 17 Apr 2020 13:56:47 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52])
 by smtp.gmail.com with ESMTPSA id x66sm7152106vkx.18.2020.04.17.13.56.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2020 13:56:46 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id j65so2034119vsd.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 13:56:46 -0700 (PDT)
X-Received: by 2002:a67:1e46:: with SMTP id e67mr4201742vse.106.1587157005954; 
 Fri, 17 Apr 2020 13:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <1587107546-7379-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1587107546-7379-1-git-send-email-kalyan_t@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Apr 2020 13:56:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WmiXRJF77Nd0JEr-6WDGpJvxt4as6YJJUZdKo6c0NuvQ@mail.gmail.com>
Message-ID: <CAD=FV=WmiXRJF77Nd0JEr-6WDGpJvxt4as6YJJUZdKo6c0NuvQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: ensure device suspend happens during PM sleep
To: Kalyan Thota <kalyan_t@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, travitej@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 17, 2020 at 12:13 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> "The PM core always increments the runtime usage counter
> before calling the ->suspend() callback and decrements it
> after calling the ->resume() callback"
>
> DPU and DSI are managed as runtime devices. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend was not getting called
> and it kept the clocks on which resulted in target not
> entering into XO shutdown.
>
> Add changes to force suspend on runtime devices during pm sleep.
>
> Changes in v1:
>  - Remove unnecessary checks in the function
>     _dpu_kms_disable_dpu (Rob Clark).
>
> Changes in v2:
>  - Avoid using suspend_late to reset the usagecount
>    as suspend_late might not be called during suspend
>    call failures (Doug).
>
> Changes in v3:
>  - Use force suspend instead of managing device usage_count
>    via runtime put and get API's to trigger callbacks (Doug).
>
> Changes in v4:
>  - Check the return values of pm_runtime_force_suspend and
>    pm_runtime_force_resume API's and pass appropriately (Doug).
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  2 ++
>  drivers/gpu/drm/msm/dsi/dsi.c           |  2 ++
>  drivers/gpu/drm/msm/msm_drv.c           | 14 +++++++++++++-
>  3 files changed, 17 insertions(+), 1 deletion(-)

I am most certainly not an expert in this code, but as far as I can
tell it looks sane.  Thus:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
