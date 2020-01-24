Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAD314965C
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 16:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51206E87C;
	Sat, 25 Jan 2020 15:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7089F720C1;
 Fri, 24 Jan 2020 10:18:56 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id m14so644989qvl.3;
 Fri, 24 Jan 2020 02:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g0veyCUqrTy58lbkF11Bet/SvIre531kekpYNQJUe2M=;
 b=g9QS/q0utfNTJTVotzHW2LuXRhtmHrDBaZ7INqs9fp0LdVBrqNtJGfG/mw0j78osZk
 6WCR6u7G6HydfuwzEIhK7mHJhRcTj3vTC87VaV5D3fy85bufhdvjOI7mhQ/6fN0Ly0W6
 YK+MpRw6o8mH31CL2cPNRCo+KPxh9YiGw0UMYawRPXidLjRsFXVflE77/nQEYQnalhzr
 iSg2edYXGHopQ8aBLufSs9rEEkAhklydmvpak8JLgGgNwjxo1oX+96L1UwAZPp69W9I0
 X+kgjFWfW3Jl0QYejYB2hEfx7jC9bfWzTdXDcogQ+DWfBfKymw/0HY65t89a8g+199u5
 QkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g0veyCUqrTy58lbkF11Bet/SvIre531kekpYNQJUe2M=;
 b=eMtbhnmqLzrKBvVWVVYw3zsuDqybv/HjgBiacJIxq9TVuFCIXCCgY0OFS70EplHJt0
 7UagDyv0RURM7hFjJGsBVqf/Jrby/AhIUBpsRQvYn9FzDk8sF77t1EtjntZ2gJ9VmMIA
 NGGbEC8XtmNYW+IgmxlkC8HJlWvlVw/j/fGjNefWKh7JvBACb+SdDOtXnix5jURUEer/
 G7sCqnBiZIGAx/jGn6kCLWZhf6tqX5QuefTsdfOyyZke1w/MOr053uDcnhdkF3/PpCN4
 AylnodzEpq9B7b/lshjwRQJo7nzqLBKoI0JNo09uanL6soJtIRE01Wk9RNt0YKzUv4zH
 E9lA==
X-Gm-Message-State: APjAAAUN/eXL4slcxw2S5TsFv8GYGeQOai8JzHbiCOzjUznczusGOZtR
 cZl4YbQsu5qnZZNhILbDFnQ+MXoiL2v5S3dX97x0WjRm
X-Google-Smtp-Source: APXvYqzwGZsd8oZGp5EYk5uHfEPCzrWjui4Vu6C6zY1OuIRUv30YR5wbUI5fw84EeGQSwfsfhW3pHlpT21GZKhi3g0s=
X-Received: by 2002:a05:6214:707:: with SMTP id
 b7mr1936520qvz.97.1579861135198; 
 Fri, 24 Jan 2020 02:18:55 -0800 (PST)
MIME-Version: 1.0
References: <20200104122217.148883-1-dor.askayo@gmail.com>
 <CAO80jNS795mgHCp3XedZQ1o1QHbwxb8DeuSqPtKHmKbAVYsfmg@mail.gmail.com>
In-Reply-To: <CAO80jNS795mgHCp3XedZQ1o1QHbwxb8DeuSqPtKHmKbAVYsfmg@mail.gmail.com>
From: Dor Askayo <dor.askayo@gmail.com>
Date: Fri, 24 Jan 2020 12:18:43 +0200
Message-ID: <CAO80jNS6fV+8s1R5CH9swbkDB+-RmZADFvA0UkBmWG2bEQioPw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: do not allocate display_mode_lib
 unnecessarily
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Sat, 25 Jan 2020 15:47:14 +0000
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
Cc: Leo Li <sunpeng.li@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 17, 2020 at 12:59 PM Dor Askayo <dor.askayo@gmail.com> wrote:
>
> On Sat, Jan 4, 2020 at 2:23 PM Dor Askayo <dor.askayo@gmail.com> wrote:
> >
> > This allocation isn't required and can fail when resuming from suspend.
> >
> > Bug: https://gitlab.freedesktop.org/drm/amd/issues/1009
> > Signed-off-by: Dor Askayo <dor.askayo@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> > index dd4731ab935c..83ebb716166b 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> > @@ -2179,12 +2179,7 @@ void dc_set_power_state(
> >         enum dc_acpi_cm_power_state power_state)
> >  {
> >         struct kref refcount;
> > -       struct display_mode_lib *dml = kzalloc(sizeof(struct display_mode_lib),
> > -                                               GFP_KERNEL);
> > -
> > -       ASSERT(dml);
> > -       if (!dml)
> > -               return;
> > +       struct display_mode_lib *dml;
> >
> >         switch (power_state) {
> >         case DC_ACPI_CM_POWER_STATE_D0:
> > @@ -2206,6 +2201,12 @@ void dc_set_power_state(
> >                  * clean state, and dc hw programming optimizations will not
> >                  * cause any trouble.
> >                  */
> > +               dml = kzalloc(sizeof(struct display_mode_lib),
> > +                               GFP_KERNEL);
> > +
> > +               ASSERT(dml);
> > +               if (!dml)
> > +                       return;
> >
> >                 /* Preserve refcount */
> >                 refcount = dc->current_state->refcount;
> > @@ -2219,10 +2220,10 @@ void dc_set_power_state(
> >                 dc->current_state->refcount = refcount;
> >                 dc->current_state->bw_ctx.dml = *dml;
> >
> > +               kfree(dml);
> > +
> >                 break;
> >         }
> > -
> > -       kfree(dml);
> >  }
> >
> >  void dc_resume(struct dc *dc)
> > --
> > 2.24.1
> >
>
> I've been running with this fix applied on top of Fedora's
> 5.3.16-300.fc31.x86_64 kernel for the past two weeks, suspending
> and resuming often. This the first time since I bought my RX 580 8GB
> more than a year ago that I can suspend and resume reliably.
>
> I'd appreciate a quick review for the above, it really is a trivial change.
>
> Thanks,
> Dor

Bumping this up again. I've been running with this change for the past
20 days without issues.

Thanks,
Dor

On Fri, Jan 17, 2020 at 12:59 PM Dor Askayo <dor.askayo@gmail.com> wrote:
>
> On Sat, Jan 4, 2020 at 2:23 PM Dor Askayo <dor.askayo@gmail.com> wrote:
> >
> > This allocation isn't required and can fail when resuming from suspend.
> >
> > Bug: https://gitlab.freedesktop.org/drm/amd/issues/1009
> > Signed-off-by: Dor Askayo <dor.askayo@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> > index dd4731ab935c..83ebb716166b 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> > @@ -2179,12 +2179,7 @@ void dc_set_power_state(
> >         enum dc_acpi_cm_power_state power_state)
> >  {
> >         struct kref refcount;
> > -       struct display_mode_lib *dml = kzalloc(sizeof(struct display_mode_lib),
> > -                                               GFP_KERNEL);
> > -
> > -       ASSERT(dml);
> > -       if (!dml)
> > -               return;
> > +       struct display_mode_lib *dml;
> >
> >         switch (power_state) {
> >         case DC_ACPI_CM_POWER_STATE_D0:
> > @@ -2206,6 +2201,12 @@ void dc_set_power_state(
> >                  * clean state, and dc hw programming optimizations will not
> >                  * cause any trouble.
> >                  */
> > +               dml = kzalloc(sizeof(struct display_mode_lib),
> > +                               GFP_KERNEL);
> > +
> > +               ASSERT(dml);
> > +               if (!dml)
> > +                       return;
> >
> >                 /* Preserve refcount */
> >                 refcount = dc->current_state->refcount;
> > @@ -2219,10 +2220,10 @@ void dc_set_power_state(
> >                 dc->current_state->refcount = refcount;
> >                 dc->current_state->bw_ctx.dml = *dml;
> >
> > +               kfree(dml);
> > +
> >                 break;
> >         }
> > -
> > -       kfree(dml);
> >  }
> >
> >  void dc_resume(struct dc *dc)
> > --
> > 2.24.1
> >
>
> I've been running with this fix applied on top of Fedora's
> 5.3.16-300.fc31.x86_64 kernel for
> the past two weeks, suspending and resuming often. This the first time
> since I bought my
> RX 580 8GB more than a year ago that I can suspend and resume reliably.
>
> I'd appreciate a quick review for the above, it really is a trivial change.
>
> Thanks,
> Dor
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
