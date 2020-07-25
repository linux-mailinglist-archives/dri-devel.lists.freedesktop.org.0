Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDBA22D993
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jul 2020 21:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ABF56E16B;
	Sat, 25 Jul 2020 19:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7636E16B
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 19:29:48 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id q6so13255744ljp.4
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 12:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QRn/o7p7Dr6ct7GVq8d3H/58B25NpUh0o8HDRDgbelU=;
 b=rPFIK4uzBFnqaegkZ+ahCYgrdrkZNiv3wYqRuQzpEKS3OiuC5VNfZMggQTw7ZE6ITP
 zJK6sTJfQD9XiBbsvXpCHALUrBKqPEP3n7UQVwTqnAajLsH7kt56nylrgTBQEx7EKG+U
 O7SZ5oR4GHNUj+mEwpYPD6k5y3deSn868L4pXgBsrb4bIXK5uAT/WRTfGjHrlGYUytdL
 sgQa+8AeGJU633TIgtzEjONDWz+ho+glG3ug/FvX7xowRGKrfjg1/l1HHkyU3N7RS/Zu
 /e1p/NdzwV3hYL2PwRn3HDYlZA/fTrW3lWcLxGHiWr9PgKzHgHj2ED/R5BrqH00ovfuF
 8yqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QRn/o7p7Dr6ct7GVq8d3H/58B25NpUh0o8HDRDgbelU=;
 b=mYpkHqZput8iHnKTv+H08KSbNtj/4558zA/BuTYJ756F/BKsygU220z2Jr5ynnI958
 YlwvSvJHqA2RJdNf2dWaTPA9qgsPL2olKWhvy1tMt0CcTdnxsEAOS8XTX2BNjFCGUcEO
 NyC8LK5CkHHTPC849WJ2GBHUabPKVQj8/f/hWpvTTbsgd5DiAKuZBIz2j0kXW26ZnazT
 B4pxYiJ/z+IPsvCZUNQKjNuTWcTO+AI3lNN5XwbQy5Z5+Yli/2MsahSxaxRUBSxCu3oC
 vQsnfCpyVS0QiNtDQnKIzYsJvZgNn6WxT8g6CTS4xuXGbfXzh+yy664muGYH45jx5Yte
 Wx0A==
X-Gm-Message-State: AOAM5301HNbWDB4DWWXe6hD3zVsIMGuzyZgCBHgmAOoPNEzzIDP1VZMY
 5/DuGl7Y6jzbQ1t6upt4ZixdnSaYCMCTVU/BvTQ=
X-Google-Smtp-Source: ABdhPJy4nIkdNHCtvK1N9MfD51qsqqFMMgFVTsb9MPToJUX4nGtOLa7aZokCkKC+sUqPYXpTnCK4esEz99fi8gSqe0M=
X-Received: by 2002:a2e:8858:: with SMTP id z24mr6885159ljj.425.1595705386442; 
 Sat, 25 Jul 2020 12:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200722110411.ebkv6knvc6mzw5uf@smtp.gmail.com>
 <20200722120502.GK6419@phenom.ffwll.local>
 <20200722140604.27dfzfnzug5vb75r@smtp.gmail.com>
 <CAKMK7uHWCnJ+3YnP2FwVGH6cEDkmPnH9ALjY_1R51QVs0HPG0Q@mail.gmail.com>
 <20200725011737.GA2851@realwakka>
 <CAKMK7uEWPCzx+K=+nJsLT5HRBVJ+s8tqx30Ljkr4BCBDComyWQ@mail.gmail.com>
 <20200725174514.esh4gqek6oddizvh@smtp.gmail.com>
 <CAKMK7uEi0UFSwYTO7h6_YKN+UykOuVcmhMSG_ySy9uyo_7Pz-g@mail.gmail.com>
 <20200725184918.togb54bxuifrq77c@smtp.gmail.com>
 <CAJeY4oEr1mDASzdjfyeXqfqUmM6n1ULgnedM7dif6db6Qk-r2g@mail.gmail.com>
In-Reply-To: <CAJeY4oEr1mDASzdjfyeXqfqUmM6n1ULgnedM7dif6db6Qk-r2g@mail.gmail.com>
From: Melissa Wen <melissa.srw@gmail.com>
Date: Sat, 25 Jul 2020 16:29:35 -0300
Message-ID: <CAJeY4oHzL2q1yRDQweSK5CM5WdHrWqqPVhkNc5DPzP1ayJLw+A@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: add missing drm_crtc_vblank_put to the get/put
 pair on flush
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kernel-usp@googlegroups.com,
 Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 25, 2020 at 4:19 PM Melissa Wen <melissa.srw@gmail.com> wrote:
>
> > No, this very first warning continues (only once) :(
> > From here (drm_crtc_vblank_on):
> >         if (atomic_read(&vblank->refcount) != 0 || drm_vblank_offdelay == 0)
> >                 drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
>
> Sorry, not sure when this warning is triggered.

Again, I just had to look at the trace:
[   52.299388]  drm_get_last_vbltimestamp+0xaa/0xc0 [drm]
[   52.299389]  drm_reset_vblank_timestamp+0x5b/0xd0 [drm]
[   52.299389]  drm_crtc_vblank_on.cold+0x37/0x103 [drm]
[   52.299390]  drm_atomic_helper_commit_modeset_enable

>
> >
> > > But I'm still wondering why after step 3 we don't get -EINVAL from
> > > vblank_get() - after vblank_off() vblank->enabled should be false
> > > again, getting us back to the same state as after 1. Is that not
> > > happening?
> >
> > Yes (sorry if it got confused), we got -EINVAL after setp 3:
> >
> > In step 3, at the end of the 2nd running, we have:
> > atomic_disable
> > --> vblank_off [!vblank->inmodeset + refcount going 0->1 + inmodeset=1]
> > and then in next vblank_get: -EINVAL (!vblank->enabled + refcount ends 1)
> > as in the first step.
> >
> > Melissa
> >
> > > -Daniel
> > >
> > > >
> > > > > >
> > > > > > Thanks
> > > > > > -Sidong
> > > > > >
> > > > > > > > >
> > > > > > > > > >             crtc->state->event = NULL;
> > > > > > > > > >     }
> > > > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > 2.27.0
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > Daniel Vetter
> > > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > > http://blog.ffwll.ch
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Daniel Vetter
> > > > > > > Software Engineer, Intel Corporation
> > > > > > > http://blog.ffwll.ch
> > > > > > > _______________________________________________
> > > > > > > dri-devel mailing list
> > > > > > > dri-devel@lists.freedesktop.org
> > > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
