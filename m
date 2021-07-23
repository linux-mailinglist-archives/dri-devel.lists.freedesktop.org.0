Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E313D3DA4
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 18:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966D76FB2D;
	Fri, 23 Jul 2021 16:32:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A898C6FB2D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 16:32:50 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id q6so2400539oiw.7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 09:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uD2GNkN3P0horNnh+JSCr7/ck5xlA1bV2NNdvr6qlgM=;
 b=TccjKSmJR+ZvQbRne3d9iCsSFGkXQfmbGLzRgtG1d6JllUgEpVwyXoz19pKnpmp6BQ
 PnFwNc61Jsk3btVEN81QLLfXPk6phB1lq2hjQX9uNjwCEL7wkZeyG6gIAJJyzqchrt5I
 534X/0jsNBWWxZadMB61kXQLJhewg4XsqNLic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uD2GNkN3P0horNnh+JSCr7/ck5xlA1bV2NNdvr6qlgM=;
 b=RIIWCHQ4HAxS5Re57ppMkppMTBbwVsHblKcNbhl+RvjrxDBmZlB1Wk1gFm2E21oDma
 K6ivi7NA0DWTDbTRo+eukATRPht8r022uoG8WKRZfP2N0g5rFoBcOWNrk79iqMZ+Vhf4
 Jv/kCwEvzP6AdIKHPI9/59XYh8tSkFdXy0KQk4ESqKxQcWosw3vZmatuPQa1GEyvbqlk
 IpQkeoETktQ0Lv9oqViq/zogeeXk0/bc0mJK+bcjx1PY4cu7xd5HGDxkZ5LaShi0j7sy
 i8VefXaNmplpkjHRFHBgLux1ITkfxzyH6/99Ol45piQPK5V86/NC4NExWJJBeYsRhWgr
 Eysg==
X-Gm-Message-State: AOAM53049TzNeieQP0yW6LhYjbX29SfT+HqdHiItSCkKe6rM68CF5xt4
 OGV4vPZqSaWZ37YiSxzhYbj1lPM9P/HlEi32r+ImOXpNbQo=
X-Google-Smtp-Source: ABdhPJx9UiBFHY8dMyVFo4by22KSgGFwnQqk/w/8R1iaCLOutaQJSRiTTYAQhP1x5IS4q79RarYKCNLykdc8fMGYan4=
X-Received: by 2002:aca:d682:: with SMTP id n124mr3659515oig.128.1627057970008; 
 Fri, 23 Jul 2021 09:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <xpuLEQstrPSZp6SF0CCWy59umtg3oW686DLB5VPai8w@cp4-web-037.plabs.ch>
In-Reply-To: <xpuLEQstrPSZp6SF0CCWy59umtg3oW686DLB5VPai8w@cp4-web-037.plabs.ch>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 23 Jul 2021 18:32:38 +0200
Message-ID: <CAKMK7uGmDgaLxeKM8L-UaP1qzQ8OKYPrZfjka=Gyc-811d7DgA@mail.gmail.com>
Subject: Re: [PATCH] drm: add logging for RMFB ioctl
To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 5:46 PM Simon Ser <contact@emersion.fr> wrote:
>
> We already have logging for ADDFB2. Add some logging for RMFB as
> well.
>
> This can be handy when trying to find out why a CRTC gets magically
> disabled.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_framebuffer.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_fram=
ebuffer.c
> index 4d01464b6f95..da77ceeb35e3 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -404,6 +404,7 @@ static void drm_mode_rmfb_work_fn(struct work_struct =
*w)
>                 struct drm_framebuffer *fb =3D
>                         list_first_entry(&arg->fbs, typeof(*fb), filp_hea=
d);
>
> +               drm_dbg_kms(fb->dev, "Removing [FB:%d]\n", fb->base.id);

I'd hammer more in what happens and why this happens. Maybe something like =
this?

"Disabling [FB:=C2=AFfrom all active usage due to RMFB IOCTL\n"

Also I wonder whether we could put some additional debug output into
drm_framebuffer_remove when we either disable just the plane or the
entire crtc as further clue. Like

"Disabling CRTC|PLANE because FB is being removed from all active use\n"

Also, because you're this great at typing docs: Kerneldoc for RMFB
would be nice, but there's not even a struct to attach it to :-/ Any
ideas for how to do that?
-Daniel

>                 list_del_init(&fb->filp_head);
>                 drm_framebuffer_remove(fb);
>         }
> --
> 2.32.0
>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
