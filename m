Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 502B4890DD3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 23:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD0B10E5F7;
	Thu, 28 Mar 2024 22:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UVXhIXzv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1948F10E6C2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 22:50:14 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dc74e33fe1bso1448647276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 15:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711666214; x=1712271014; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jaQuR2VabRjZ0oAgjAGPW//AvQ63fYK7rByYxplN6rc=;
 b=UVXhIXzvMcTw4SQWv/ycvXPyztZSSlFWoqB9QuDi8ok4cVE/pPWzKS1pHkn35mdcg1
 pQfAcE4uGlovwGHI6cFst0a1y7KbvcgviLz1WctAecxRWFaKoMVlieQI8R9osHOtmSO5
 mnrWXashGScKw17j2EagVZkP7oUIFk6dq4tGTplPwHhv+KRg+qe4fjdzBCRWPS4lfL3w
 9ZnHgV6eP1jR0ewdQkXuZxsi7iiZRVWca+STOvywzdTmVV/BKMJy4bZslwgu5aD7vxWm
 7IvFfNigpn8nUfVlFVOeOZwkGc38Y956y2vthiPfAsOrDnvCT8roUR4E4N6JMmFQE9qs
 ebbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711666214; x=1712271014;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jaQuR2VabRjZ0oAgjAGPW//AvQ63fYK7rByYxplN6rc=;
 b=WSnyoIV5x2FLOyTQ9jssarx3e056KSqYgs99iKZWzpT/HxOqcccjpoycdLQu2LLckm
 Jqah0MXHG98HAxavSvSPqwPwYUHVtH7+EnQkI6tEHkTeKz0OxVa7C54lrboUfTyLTYnV
 QH4nvKnrl7ieU/9oUtjw5uvx+jLDLAC0nGxdUZbgUMvXvle8HR/X72pFWKXdJXgdt7AZ
 0kwDWnB+6TF4MnxVurnkZ8N5BZnC0yoRzLxkMSsYczA9/z+SZ92gOqhnYF/2qC4AIYlb
 P2oGdprzSXzVpru2UOGRz0giZsFl7iyAmsCdVQslPcjmu5MdqAieXXAIEFo+xSCYcBoT
 9sRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDkweygkGmOT3Ey5AxW0jiXRenG+N70PfXzKzxLc2ajrDc2MhI0a1T+d88pVuak27skB8QBAqXLhahbvwH0qE2KiSyInZKJaREWMl6MJDs
X-Gm-Message-State: AOJu0YxvmVtusge6uNCJjTqgNJZU+7wHKjjVCCVn5sQ7MiY3SiqgI3CQ
 S2u5K5ajig6l92soaioUZOch5i3LsxlUKbcI+PykpaH+n3xsW4Bed/aTqzu8/KwGqhok8/IXqzF
 HthjNRlI651aK+Lu58frReio3bBKMDt6EiFBFNA==
X-Google-Smtp-Source: AGHT+IHUMLL2iU8wC/AsSPxTtWu9xIrlrjkxQvLqc80IB8CQp05SICYUOEAvO++CEa4YtWB8E6zViYeXbYy3jssQEtQ=
X-Received: by 2002:a25:2188:0:b0:dda:bf8c:f278 with SMTP id
 h130-20020a252188000000b00ddabf8cf278mr702978ybh.47.1711666213923; Thu, 28
 Mar 2024 15:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <1711656246-3483-1-git-send-email-quic_khsieh@quicinc.com>
 <1711656246-3483-2-git-send-email-quic_khsieh@quicinc.com>
 <55debb0a-c7af-ef71-c49a-414c7ab4f59d@quicinc.com>
 <CAE-0n503FwcwreZ14MMKgdzu8QybWYtMdLOKasiCwmE8pCJOSw@mail.gmail.com>
 <23de89e9-3ef3-c52d-7abf-93dc2dbb51a4@quicinc.com>
In-Reply-To: <23de89e9-3ef3-c52d-7abf-93dc2dbb51a4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 00:50:02 +0200
Message-ID: <CAA8EJppEWXnsQzDD1tdNuMb1ijEVtE7LQct9jt1fwVwMd8ch_Q@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm/dp: use dp_hpd_plug_handle() and
 dp_hpd_unplug_handle() directly
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Bjorn Andersson <andersson@kernel.org>,
 Johan Hovold <johan@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 abel.vesa@linaro.org, 
 agross@kernel.org, airlied@gmail.com, daniel@ffwll.ch, dianders@chromium.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org, quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com, 
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Thu, 28 Mar 2024 at 23:21, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/28/2024 1:58 PM, Stephen Boyd wrote:
> > Quoting Abhinav Kumar (2024-03-28 13:24:34)
> >> + Johan and Bjorn for FYI
> >>
> >> On 3/28/2024 1:04 PM, Kuogee Hsieh wrote:
> >>> For internal HPD case, hpd_event_thread is created to handle HPD
> >>> interrupts generated by HPD block of DP controller. It converts
> >>> HPD interrupts into events and executed them under hpd_event_thread
> >>> context. For external HPD case, HPD events is delivered by way of
> >>> dp_bridge_hpd_notify() under thread context. Since they are executed
> >>> under thread context already, there is no reason to hand over those
> >>> events to hpd_event_thread. Hence dp_hpd_plug_handle() and
> >>> dp_hpd_unplug_hanlde() are called directly at dp_bridge_hpd_notify().
> >>>
> >>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>> ---
> >>>    drivers/gpu/drm/msm/dp/dp_display.c | 5 +++--
> >>>    1 file changed, 3 insertions(+), 2 deletions(-)
> >>>
> >>
> >> Fixes: 542b37efc20e ("drm/msm/dp: Implement hpd_notify()")
> >
> > Is this a bug fix or an optimization? The commit text doesn't tell me.
> >
>
> I would say both.
>
> optimization as it avoids the need to go through the hpd_event thread
> processing.
>
> bug fix because once you go through the hpd event thread processing it
> exposes and often breaks the already fragile hpd handling state machine
> which can be avoided in this case.

Please add a description for the particular issue that was observed
and how it is fixed by the patch.

Otherwise consider there to be an implicit NAK for all HPD-related
patches unless it is a series that moves link training to the enable
path and drops the HPD state machine completely.

I really mean it. We should stop beating a dead horse unless there is
a grave bug that must be fixed.

>
> >>
> >> Looks right to me,
> >>
> >> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



-- 
With best wishes
Dmitry
