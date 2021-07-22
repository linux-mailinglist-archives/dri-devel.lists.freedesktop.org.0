Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AB13D2CB5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 21:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4F46E888;
	Thu, 22 Jul 2021 19:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE6F6E89C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 19:24:42 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 b18-20020a0568303112b02904cf73f54f4bso3354078ots.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 12:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=KuoKHa70CsW4LrT7bcKs/jVjMpHneRrtGiMYYCoaWt4=;
 b=ODDEI+V9cWtMOLMoDoSf/Eso7AyIQN1IrQyHsmjBNLMM67HXTrSmNTGcMfzlvfF04I
 Xl0GxDCskVr2bMK95Z5NurgL24fO4chAe5Vd74Qwg5YeOWpxXdiu1++dzqNL26zur3JO
 bWJsxhH6u+8e4EaELYsJDemAduUlBjkWkzrl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=KuoKHa70CsW4LrT7bcKs/jVjMpHneRrtGiMYYCoaWt4=;
 b=NjoTuC2OZIYon97lXlZKEBeFHDhZeB6tybSFX5c/NkK+52+heY3H5zFCLDk7jaT4ZU
 /yt9kGZisCGg6hKvnIo63AZB7hOz+HyTxNPDHqPb3LqvtqX8Py+lbdF5Od3KXsHw6xYC
 0o2S/1eXS0iXScYVbGIp2sp3FyQXiBxfyKxi3W0ihwXK9t5HrWG28fqlEjQDBpE/3U6e
 5tjmMMxXIJDoemq0Gmyp7KmMn15Tlia/sajPnbrvcZA/9/ou6c+UfrqknG5VgT7yF5eI
 dMEUcsy4FxIU/vrX3SIi2URTUrwK0xj68utuBya3IY68ehuFFZmsYcYhCQgM+UJUFv91
 p7DQ==
X-Gm-Message-State: AOAM532YRMueR2jTbKgiDW3XZiE+BFIcmQ4WfEFpRXipgFvN15b+Jso3
 zjaIQmLQJ05KNhkaL+OQDFwRLhwKVzrLyvqQdn9O+A==
X-Google-Smtp-Source: ABdhPJxhpg6Vf9SRJDcvLibbgnzzwZMBFdPr2+2+u0dMH/k8tpteCCY8x1EBDEKXikNagWxWYufbywGdcpp1es+qvug=
X-Received: by 2002:a9d:1b6e:: with SMTP id l101mr896344otl.34.1626981881398; 
 Thu, 22 Jul 2021 12:24:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:24:40 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-5-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
 <1626191647-13901-5-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 19:24:40 +0000
Message-ID: <CAE-0n53v-5DynK5Y+8akMMBHSqHUD18pn+2AnBBL8uMKXHEDQw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] drm/msm/dp: replug event is converted into an
 unplug followed by an plug events
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-13 08:54:04)
> Remove special handling of replug interrupt and instead treat replug event
> as a sequential unplug followed by a plugin event. This is needed to meet
> the requirements of DP Link Layer CTS test case 4.2.1.3.
>
> Changes in V2:
> -- add fixes statement
>
> Fixes: f21c8a276c2d ("drm/msm/dp: handle irq_hpd with sink_count = 0 correctly")
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 78c5301..d089ada 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1146,9 +1146,6 @@ static int hpd_event_thread(void *data)
>                 case EV_IRQ_HPD_INT:
>                         dp_irq_hpd_handle(dp_priv, todo->data);
>                         break;
> -               case EV_HPD_REPLUG_INT:

Please remove the enum as well.

> -                       /* do nothing */
> -                       break;
>                 case EV_USER_NOTIFICATION:
>                         dp_display_send_hpd_notification(dp_priv,
>                                                 todo->data);
