Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8FD3E839A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 21:23:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 374BA6E06D;
	Tue, 10 Aug 2021 19:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7A86E05C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 19:23:36 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id y18so681067oiv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 12:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=gbNCzQEoZzdqhswDFYAzHfEyUYgfJuQIU33EIgWMMXo=;
 b=kFL5rzZpadirkAhLE2tGfeO6LjQTce17lnPNSp+BWQyeiRDkxIegGLus53E5JV+x5H
 TzYRWaiDzQtfy+PKm4IswLi3Bg93FquYoAacozMVz14/wyMVZQ2Qv+gcZX6o2p69dG7A
 Z5521vOWj+Dl4HA/CVvYlDl40nN6iZ6YgXF8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=gbNCzQEoZzdqhswDFYAzHfEyUYgfJuQIU33EIgWMMXo=;
 b=UamHsP+Ol825n+T1UWtFa5ReM9a1cak86GKUUsHly7Zsp/IXktnNCb21gzvh3iKIn/
 gHW1dYwqlPN8KEJhpgfbUYrQyXNGRHLFC57XFKCZh0Y7rPKDxYGhaE5csp+bCv6WJDOq
 BNotNqrfdTJWM9Ua6BIro03TU37TKMN8esE0YZf5agfyhsvr00/W50DxHgU5sx5GS1+u
 noZXFfyeloxf0kzA2BM+wvsA1FWljHfqPh3FysOfadODvz1zaHmSERh3BopCwPUCmZSG
 tlzqR4OIspsoki8/nYDTK6DZYQgUmt7o31eMfPC7f0kxyIQlK+6b1hvuWCvVMzbms9Pl
 NB7Q==
X-Gm-Message-State: AOAM530qVdYEls0yvYrKibiEMKNWGxtRGqUVB8BfGxQU4EMH6uGnJKVR
 Z6YR8pTZIKSsLSDindNk8F1US8K0vjfTcxhY/Kqzlw==
X-Google-Smtp-Source: ABdhPJzMsxkOmMEvS4X7L5p033iIi+R8pUAaMXRbTWMCFKsky5WKLkf7f7xLj0/wZhPuKNLFX+3Xvli4+2iPGOdYA5A=
X-Received: by 2002:a05:6808:984:: with SMTP id
 a4mr4938223oic.166.1628623415364; 
 Tue, 10 Aug 2021 12:23:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 12:23:35 -0700
MIME-Version: 1.0
In-Reply-To: <abd00c9d395473875c31379ca0288116@codeaurora.org>
References: <1628609362-2109-1-git-send-email-khsieh@codeaurora.org>
 <CAE-0n52a8i-2oNxtqKaS+XGBE0+wcp0Jx05VgL2KnHoQLW-vDQ@mail.gmail.com>
 <abd00c9d395473875c31379ca0288116@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 10 Aug 2021 12:23:34 -0700
Message-ID: <CAE-0n51NsjfT62anGiQ7FaBgs=bThVq89j3UMp4rNj9raGkwOw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: add drm debug logs to dp_pm_resume/suspend
To: khsieh@codeaurora.org
Cc: agross@kernel.org, bjorn.andersson@linaro.org, robdclark@gmail.com, 
 sean@poorly.run, vkoul@kernel.org, abhinavk@codeaurora.org, 
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
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

Quoting khsieh@codeaurora.org (2021-08-10 12:18:02)
> On 2021-08-10 11:33, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2021-08-10 08:29:22)
> >> Changes in V2:
> >> -- correct Fixes text
> >> -- drop commit text
> >>
> >> Fixes: 601f0479c583 ("drm/msm/dp: add logs across DP driver for ease
> >> of debugging")
> >> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> >> ---
> >>  drivers/gpu/drm/msm/dp/dp_display.c | 13 +++++++++++++
> >>  1 file changed, 13 insertions(+)
> >
> > BTW, this conflicts with commit
> > e8a767e04dbc7b201cb17ab99dca723a3488b6d4
> > in msm-next. The resolution is trivial but just wanted to mention it.
>
> I Just fetched msm-next and cherry-pick this patch over, no conflict
> seen.
> Is this conflict need to be fixed?
>

Oh sorry, I mean commit afc9b8b6bab8 ("drm/msm/dp: signal audio plugged
change at dp_pm_resume") which doesn't seem to be in msm-next. Maybe Rob
will resolve the conflict directly.
