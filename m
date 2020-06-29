Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EF620EF75
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74F889D30;
	Tue, 30 Jun 2020 07:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A55A89FC3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 20:45:25 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id e3so5779062uan.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 13:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w7kFF6I/7tjyYaS1rtr5oIMqxgnM+l1sJPudiJl+Cto=;
 b=np8GQKHletK7G3CJusLVB9GC+G7QJF/kREt9GxLJ1t3Hlt3hdOPYI7AnTqvqvfjjOh
 XTfgB9NlwsFFJPFFY/3WXO2tvqKQyGWdikLrXJA5twdfvWv6WqsfZ8fbSnJ761heXjn9
 vHh9j+YN5HmSWr/N6yqL9vCMgNC/cINJ2irupbhcqOWIFiVYa2coSiBY23Qs4cG4b/ie
 cUcy4Xxu/2VK8s6dDPcsm9MWe4pGDUccuyqfsEfwzQSOtHKWPVj5rEL732Fq4SCxwmox
 8LSPZSwt63n11b2S6g6OLJdtEXt+dK5kugr9Rn/1xTEMZV2pqm/UsihoKln3VyxotYET
 UjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w7kFF6I/7tjyYaS1rtr5oIMqxgnM+l1sJPudiJl+Cto=;
 b=ZSlFor/v+gemWp4KEbsdIKIQ+CcRsF4wyXMrKPY1u3ZdVIR9gXALz9Qz6tRrtXkX/d
 MTd+Hvn2FcUDuESTdmktK6fA3rVbj8VoNEaRFn9TWYkj4Doy++/Ub7tN0TkXXgf8tJI2
 iqeW5/AB67daobcMfb/zjt4A1xQ/p2ty2MFKua+u/26UgzsTzL4SC9Z0ZOw3PX/uxK8n
 8AVuMhPgR3Ibr+vzESc91UXPzOqJocPd9rQucY1F6GC6dzwBWaZNgykfe8gsYGRnIplM
 1wBrspQsT7guSmAPeGQyWNB7B2X9Vn65zbBxbVtO+E2NO40C10lNz6F/2gvqXSj6SwS5
 ZLsw==
X-Gm-Message-State: AOAM532HlXfbQxW2GaF3ocylnHTA0FcshcA/V7FrXX5RAw+NqqlKffCY
 yKSyvrFqcZXAlIw0fyXhkD4F+//r+NcB+ZVwPYjhig==
X-Google-Smtp-Source: ABdhPJxJKIf8c61d6Sxw032JzZeDqSjWcveZhm6ih/0vZLyM07fRcVrc1Lj+/k5p5DI0zMqvLZYhwCd5VnyTNVlYSEQ=
X-Received: by 2002:a9f:3b18:: with SMTP id i24mr12193440uah.52.1593463524191; 
 Mon, 29 Jun 2020 13:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <1593087419-903-1-git-send-email-kalyan_t@codeaurora.org>
 <CAD=FV=VXAQagbM-dn7MWGm08DdBxefc4jHNbkvHzuBjSM_jWnw@mail.gmail.com>
In-Reply-To: <CAD=FV=VXAQagbM-dn7MWGm08DdBxefc4jHNbkvHzuBjSM_jWnw@mail.gmail.com>
From: Kristian Kristensen <hoegsberg@google.com>
Date: Mon, 29 Jun 2020 13:45:13 -0700
Message-ID: <CAOPc6T=E68D8NG+hkRH6WTnYBcCzq=-H6q1M_NVoU9S6eGkxFg@mail.gmail.com>
Subject: Re: [v2] drm/msm/dpu: add support for dither block in display
To: Doug Anderson <dianders@chromium.org>
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:54 +0000
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
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yes, this is a big improvement for the display I have here. Thanks Kalyan.

Tested-by: Kristian H. Kristensen <hoegsberg@google.com>

On Thu, Jun 25, 2020 at 3:21 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Jun 25, 2020 at 5:17 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
> >
> > This change enables dither block for primary interface
> > in display.
> >
> > Enabled for 6bpc in the current version.
> >
> > Changes in v1:
> >  - Remove redundant error checks (Rob).
> >
> > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c     | 39 +++++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 63 +++++++++++++++++++++----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h | 28 +++++++++++
> >  3 files changed, 121 insertions(+), 9 deletions(-)
>
> Tested-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
