Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B38230F05
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 18:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E6B6E211;
	Tue, 28 Jul 2020 16:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DC96E211
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 16:16:44 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id 74so2935758pfx.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 09:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5hAHQVdK1eMNUgeTGoP5P2N6Dh+EChlHcZOZmgXqG/Q=;
 b=M1yeDf7BTYx/Jxik0hy/9QfnJMYJS/Nh2k/SXflonvJZRmbAtSK3BFYAjfbHsxXp5n
 yX5MN3dW5QcrAtv/pibUOyQ2571GiPa9rPkbzQ3vIEPGdQcNORg/FN2ouhGWl70h5z0M
 jmdeBUcLoZklFI2rdC6+aKvAK7w8uYR0YuKARzJV37dsBy4RK3uSio/8Cq/Y8li8BFmj
 HCCzULjMnWnmpevXFi6zFt1ZQOCfNbCY+ZDGcXFvVnYhXZSj1+cV2PtXzpFkkDYKa1mS
 VNXQn0wPsnVVuYQKOtz+s633rjd/DCTMw2zItBkkM23sAvGvoAYeSUVNkdIr7914/0e2
 mQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5hAHQVdK1eMNUgeTGoP5P2N6Dh+EChlHcZOZmgXqG/Q=;
 b=VAhS1QV/64UCIIFiQKxp+CHYwlbqMHB0tbhgS7AmTqwi3+kyEuq4BcSYqjzF63EFsz
 o5TzxZLa4fdv6YCOvAu32x3t60fZyHCY2F5Y+zb7VA+yNt/+EzenIvmQphfMpAzQFwD8
 tJp7DF3BAH2xiE0xsOsYitmG5jL7aYZ6V0qaH2bLyy40tDrf46257Q1Gf7CvxDKGs+q2
 BGqSFvMwURV5AJE7iewqs6WLofvuyKBxcKDLOFXZtvfaT8b/9mwO5IqjzPdu/QEz0aou
 Y7izuE5lA0zZn1pL+mGPm9yw/cgIk8854imEtXpqCpCL1Fg4hXosdYzQ/dotM7Js538c
 Z9nA==
X-Gm-Message-State: AOAM533Lt0jrp2ze9iCVoAZ02zUBtH4SwxXyMkLTvYQEydX/lU5G694H
 Z0il0fa/dLHSXMWInl3DV9E=
X-Google-Smtp-Source: ABdhPJxhejyu5AbxgF3YkqfRK4QH2QX7YB9cC0GlaQ2jo23a48FzF5AQzVrjvciwFVW37AklN9eT3g==
X-Received: by 2002:a63:8ec8:: with SMTP id
 k191mr25085677pge.154.1595953003584; 
 Tue, 28 Jul 2020 09:16:43 -0700 (PDT)
Received: from realwakka ([61.83.141.80])
 by smtp.gmail.com with ESMTPSA id m6sm8654592pfk.36.2020.07.28.09.16.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 28 Jul 2020 09:16:43 -0700 (PDT)
Date: Tue, 28 Jul 2020 16:16:34 +0000
From: Sidong Yang <realwakka@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH] drm/vkms: add missing drm_crtc_vblank_put to the get/put
 pair on flush
Message-ID: <20200728161634.GA6555@realwakka>
References: <20200722140604.27dfzfnzug5vb75r@smtp.gmail.com>
 <CAKMK7uHWCnJ+3YnP2FwVGH6cEDkmPnH9ALjY_1R51QVs0HPG0Q@mail.gmail.com>
 <20200725011737.GA2851@realwakka>
 <CAKMK7uEWPCzx+K=+nJsLT5HRBVJ+s8tqx30Ljkr4BCBDComyWQ@mail.gmail.com>
 <20200725174514.esh4gqek6oddizvh@smtp.gmail.com>
 <CAKMK7uEi0UFSwYTO7h6_YKN+UykOuVcmhMSG_ySy9uyo_7Pz-g@mail.gmail.com>
 <20200725184918.togb54bxuifrq77c@smtp.gmail.com>
 <CAJeY4oEr1mDASzdjfyeXqfqUmM6n1ULgnedM7dif6db6Qk-r2g@mail.gmail.com>
 <CAJeY4oHzL2q1yRDQweSK5CM5WdHrWqqPVhkNc5DPzP1ayJLw+A@mail.gmail.com>
 <CAKMK7uGQXXDhYGOwYdorKECgNW2Ydq=Mxu_Tm-GrOY8SHftB+g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uGQXXDhYGOwYdorKECgNW2Ydq=Mxu_Tm-GrOY8SHftB+g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 Melissa Wen <melissa.srw@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 26, 2020 at 12:26:08PM +0200, Daniel Vetter wrote:
> On Sat, Jul 25, 2020 at 9:29 PM Melissa Wen <melissa.srw@gmail.com> wrote:
> >
> > On Sat, Jul 25, 2020 at 4:19 PM Melissa Wen <melissa.srw@gmail.com> wrote:
> > >
> > > > No, this very first warning continues (only once) :(
> > > > From here (drm_crtc_vblank_on):
> > > >         if (atomic_read(&vblank->refcount) != 0 || drm_vblank_offdelay == 0)
> > > >                 drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
> > >
> > > Sorry, not sure when this warning is triggered.
> >
> > Again, I just had to look at the trace:
> > [   52.299388]  drm_get_last_vbltimestamp+0xaa/0xc0 [drm]
> > [   52.299389]  drm_reset_vblank_timestamp+0x5b/0xd0 [drm]
> > [   52.299389]  drm_crtc_vblank_on.cold+0x37/0x103 [drm]
> > [   52.299390]  drm_atomic_helper_commit_modeset_enable
> 
> Yeah I think vkms can't generate a reasonable timestamp when the
> hrtimer is off. I thought the warning comes from a different
> callchain, but seems to be a general problem.
> 
> I guess in the vkms timestamp function we should check whether the
> timer is running, and if it's not running, then we just grab the
> current time and done.

I tried some test about this scenario that commit_tail calls in sequence disable 
- enable - commit.
In a first test. there was a warning and found out that it raised from 
vkms_get_vblank_timestamp() the code checking vblank_hrtimer's expire time and 
vblank_time. In first run, vblank_time and hrtimer's expire time was both zero.  
because vblank wasn't happened yet. this warning wasn't happend since second run 
that vblank time was set from first run. 

I don't know it's good way to solve the problem. Is there no problem in other 
drm modules?

-Sidong

> -Daniel
> 
> > >
> > > >
> > > > > But I'm still wondering why after step 3 we don't get -EINVAL from
> > > > > vblank_get() - after vblank_off() vblank->enabled should be false
> > > > > again, getting us back to the same state as after 1. Is that not
> > > > > happening?
> > > >
> > > > Yes (sorry if it got confused), we got -EINVAL after setp 3:
> > > >
> > > > In step 3, at the end of the 2nd running, we have:
> > > > atomic_disable
> > > > --> vblank_off [!vblank->inmodeset + refcount going 0->1 + inmodeset=1]
> > > > and then in next vblank_get: -EINVAL (!vblank->enabled + refcount ends 1)
> > > > as in the first step.
> > > >
> > > > Melissa
> > > >
> > > > > -Daniel
> > > > >
> > > > > >
> > > > > > > >
> > > > > > > > Thanks
> > > > > > > > -Sidong
> > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > >             crtc->state->event = NULL;
> > > > > > > > > > > >     }
> > > > > > > > > > > >
> > > > > > > > > > > > --
> > > > > > > > > > > > 2.27.0
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > --
> > > > > > > > > > > Daniel Vetter
> > > > > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > > > > http://blog.ffwll.ch
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > Daniel Vetter
> > > > > > > > > Software Engineer, Intel Corporation
> > > > > > > > > http://blog.ffwll.ch
> > > > > > > > > _______________________________________________
> > > > > > > > > dri-devel mailing list
> > > > > > > > > dri-devel@lists.freedesktop.org
> > > > > > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Daniel Vetter
> > > > > > > Software Engineer, Intel Corporation
> > > > > > > http://blog.ffwll.ch
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Daniel Vetter
> > > > > Software Engineer, Intel Corporation
> > > > > http://blog.ffwll.ch
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
