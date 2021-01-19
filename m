Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E6A2FB239
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 08:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B3D6E827;
	Tue, 19 Jan 2021 07:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A936E6E827
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 07:00:31 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id f6so9627763ots.9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 23:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TB6FTIfittFs99dug22EPlbke7plMpi7fTZPZrg+0CE=;
 b=UfFuyUq4YZunDhcSrPRGQWTcnz0pmPg4Uvk+3+WFFn8kejqKwQngot05xy/ZfWXo1n
 tQjn3xm0qNwH0VJ/lrvp20l5Gp/ncfSUrdFS8uGr+KpTxUhp+hodDqDjkHZTeAJ8lJDT
 FbGa3LddeIelpkFa8UvSjmvPx/nRiDgj3/r/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TB6FTIfittFs99dug22EPlbke7plMpi7fTZPZrg+0CE=;
 b=ii75LKn9VuxHpgGMIEY1GmgL3bcr+TSDhYu9EMye1dY0dOrn8ik/PTk/N86d0j7H3X
 1kUKJ5By0nH/60jEyQZ1yY4B132OOe+qEPsO193tkJya979qr5kaoTXDnZSvcD4tfrNT
 yY4a2quPLVzuQPUtjucc4gHFgtYdfIdwD7znWiAv9Ofyxw64HKknRXCu2x4uUEemf9xk
 kk2K64w2Sc5taZVyEe1rxoNWlUTdiqWJic+ZSb7Zlss6G26l84bQvED3WJ6AvSZ76WI4
 U32gWDBK55OfKa0Fu7xj2fgx6FjyT7Xxpkx8ee50tGgEv2/O20B7KkSuJWTUox4SMSMf
 mLHQ==
X-Gm-Message-State: AOAM532TCD4YInx2JwyL+ENoMn8dHRJuz2BLu6qQ5kyYMd6rk9cGwb6P
 MZUTLzRkjgLhdX+mtc3ysaarH9ViPJV5TQvC5WwFBw==
X-Google-Smtp-Source: ABdhPJxXid5tfYESEzvOWaKE8HbioQrlcSyKOGoWm/5iR/86kHI6lj4Dy2chyY/WDn6CPSrHjhUv7s+NFTpNllHybSw=
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr2452410otj.188.1611039631002;
 Mon, 18 Jan 2021 23:00:31 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5D_dDTOgDZNy-NkQSPTiKhmrNKjEiqFWGX4rbZr2grDxQ@mail.gmail.com>
 <CAOMZO5DbgM6kPbNsu2XJcZsRauwey9UttSomquY8L4eyDLtZgw@mail.gmail.com>
 <CAOMZO5CP=xW8kFZpQxb35odUBs_9+-EDawENHeCLmVoMEYOnMA@mail.gmail.com>
In-Reply-To: <CAOMZO5CP=xW8kFZpQxb35odUBs_9+-EDawENHeCLmVoMEYOnMA@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 19 Jan 2021 08:00:19 +0100
Message-ID: <CAKMK7uFmY7u84QOSrWy_qRDQQAzEP-97ALmP2e9N+9mXiwWA8Q@mail.gmail.com>
Subject: Re: Reboot crash at msm_atomic_commit_tail
To: Fabio Estevam <festevam@gmail.com>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Sean Paul <sean@poorly.run>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 11:00 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Mon, Jan 18, 2021 at 6:44 PM Fabio Estevam <festevam@gmail.com> wrote:
> >
> > Adding some more folks in case anyone has any suggestions to fix this
> > reboot hang.
>
> Not sure if this is a valid fix, but the change below makes reboot
> works correctly.
>
> kmscube still works.
>
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -207,8 +207,12 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>         struct msm_kms *kms = priv->kms;
>         struct drm_crtc *async_crtc = NULL;
>         unsigned crtc_mask = get_crtc_mask(state);
> -       bool async = kms->funcs->vsync_time &&
> -                       can_do_async(state, &async_crtc);
> +       bool async;
> +
> +       if (!kms)
> +               return;

That looks a bit like a hack papering over the real issue.

From your report it sounds like earlier kernels worked, did you
attempt bisecting? Also for regressions put regressions into the
subject, it's the magic work that gets much more attention.
-Daniel

> +
> +       async = kms->funcs->vsync_time && can_do_async(state, &async_crtc);
>
>         trace_msm_atomic_commit_tail_start(async, crtc_mask);
>
> Any comments?
>
> Thanks
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
