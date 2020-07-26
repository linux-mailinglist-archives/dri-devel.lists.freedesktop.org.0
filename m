Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E9322DDF2
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 12:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9922F89F3B;
	Sun, 26 Jul 2020 10:26:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B6E89F3B
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 10:26:20 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id v21so2953280otj.9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 03:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k2Fq4D+MVaPvOwyYejkASFNE/Fbxf9pO3/22f+1eVLs=;
 b=PHf0VFLDhl6XKmXhQHgwoYrMD2qxUGTx/e7U1VrDSzvUSNGyFfFVxoNihxoInyIPuw
 Su6+h1XQunxpBb9kezEWJX+oB5gKajxzh71pifMnMo7PgJ13V276+jHKCiZvJ4nbe3DC
 WhxaaPD2cSTrMa0YukAZhZl3//fYQPKxx9X+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k2Fq4D+MVaPvOwyYejkASFNE/Fbxf9pO3/22f+1eVLs=;
 b=c54MskrbfikAl+dplLduzxa/l1pOHELSi7BxVUSWFskz4Sk0nAM36ocv5lLSVh4oY8
 LZ5tMXkI/7RMqbTgcagJMlctbU+UUs9TArCPCkM1GAmxMcO7OxCESnKusE8tO2JZYmnT
 /klBvJoFRsxSBXr/O1neMbaniOAX1VbIEJwnnNWaApsF5b+jdq7+GT53RcLtgAEpT9Vf
 V7l0kZBETWD+biD4AvJIS7/cmhEe6qZCJRN0JdWMD8IJXpqmRGDY7TY0pr/+8AcQoNK2
 pe7VUEErb6uakf9J0qWxvyN/j5lyoL6kx1MBX/PUVynNzoqGEtT2B0nrZN+NHR+5K3za
 VSHA==
X-Gm-Message-State: AOAM531Y6FNZYAXO3TSmR73ihZMK4hsKUPHAagNDKuEpr9qIB5m3q1pm
 QPmschI887TqyOPQxfWEUcTf7a8jdsK3QiJ6DjhhHw==
X-Google-Smtp-Source: ABdhPJyZhUQ4Fh4nXvfvrvS+6faPmS0iTsYPW5EqoFSiJT1LIF7mkGiZ0BnwJrnHpkOv/j9qN/tXoeCLJ3hT0Evvxos=
X-Received: by 2002:a05:6830:1613:: with SMTP id
 g19mr15498856otr.303.1595759179525; 
 Sun, 26 Jul 2020 03:26:19 -0700 (PDT)
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
 <CAJeY4oHzL2q1yRDQweSK5CM5WdHrWqqPVhkNc5DPzP1ayJLw+A@mail.gmail.com>
In-Reply-To: <CAJeY4oHzL2q1yRDQweSK5CM5WdHrWqqPVhkNc5DPzP1ayJLw+A@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 26 Jul 2020 12:26:08 +0200
Message-ID: <CAKMK7uGQXXDhYGOwYdorKECgNW2Ydq=Mxu_Tm-GrOY8SHftB+g@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: add missing drm_crtc_vblank_put to the get/put
 pair on flush
To: Melissa Wen <melissa.srw@gmail.com>
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

On Sat, Jul 25, 2020 at 9:29 PM Melissa Wen <melissa.srw@gmail.com> wrote:
>
> On Sat, Jul 25, 2020 at 4:19 PM Melissa Wen <melissa.srw@gmail.com> wrote:
> >
> > > No, this very first warning continues (only once) :(
> > > From here (drm_crtc_vblank_on):
> > >         if (atomic_read(&vblank->refcount) != 0 || drm_vblank_offdelay == 0)
> > >                 drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
> >
> > Sorry, not sure when this warning is triggered.
>
> Again, I just had to look at the trace:
> [   52.299388]  drm_get_last_vbltimestamp+0xaa/0xc0 [drm]
> [   52.299389]  drm_reset_vblank_timestamp+0x5b/0xd0 [drm]
> [   52.299389]  drm_crtc_vblank_on.cold+0x37/0x103 [drm]
> [   52.299390]  drm_atomic_helper_commit_modeset_enable

Yeah I think vkms can't generate a reasonable timestamp when the
hrtimer is off. I thought the warning comes from a different
callchain, but seems to be a general problem.

I guess in the vkms timestamp function we should check whether the
timer is running, and if it's not running, then we just grab the
current time and done.
-Daniel

> >
> > >
> > > > But I'm still wondering why after step 3 we don't get -EINVAL from
> > > > vblank_get() - after vblank_off() vblank->enabled should be false
> > > > again, getting us back to the same state as after 1. Is that not
> > > > happening?
> > >
> > > Yes (sorry if it got confused), we got -EINVAL after setp 3:
> > >
> > > In step 3, at the end of the 2nd running, we have:
> > > atomic_disable
> > > --> vblank_off [!vblank->inmodeset + refcount going 0->1 + inmodeset=1]
> > > and then in next vblank_get: -EINVAL (!vblank->enabled + refcount ends 1)
> > > as in the first step.
> > >
> > > Melissa
> > >
> > > > -Daniel
> > > >
> > > > >
> > > > > > >
> > > > > > > Thanks
> > > > > > > -Sidong
> > > > > > >
> > > > > > > > > >
> > > > > > > > > > >             crtc->state->event = NULL;
> > > > > > > > > > >     }
> > > > > > > > > > >
> > > > > > > > > > > --
> > > > > > > > > > > 2.27.0
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > Daniel Vetter
> > > > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > > > http://blog.ffwll.ch
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > --
> > > > > > > > Daniel Vetter
> > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > http://blog.ffwll.ch
> > > > > > > > _______________________________________________
> > > > > > > > dri-devel mailing list
> > > > > > > > dri-devel@lists.freedesktop.org
> > > > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > Daniel Vetter
> > > > > > Software Engineer, Intel Corporation
> > > > > > http://blog.ffwll.ch
> > > >
> > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
