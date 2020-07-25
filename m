Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EA422D964
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jul 2020 20:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9A76E2B0;
	Sat, 25 Jul 2020 18:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F906E2A8
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 18:49:28 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f18so11145947wrs.0
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 11:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=W8lRVIkUTgeqTvp3UujQH2CLRGy3B8K8y/uoE5gbRlE=;
 b=ULHvKbkhi7u6GyL6dsHdsJLizj6PpA/lHtWNuiuyTv3keDPK5rzXWMNyk9yBzx3IA5
 BgGasWin/kRvQNL2Jx6Ao9FXmwbwHeAjvqF2ZIo5HlXpuJFtBO7l6VLgVAGBc5v7ZTyA
 KjuIQ6TdZhy8dNz/iBdR9rLAZX/3gX+sl0fYCUIPQ5GwGQkvlqBdpK+LXFPSD/avqxXR
 I1z9dl6zvIoACTqGDLXL8EJZdyjA8IbsSekCsGZMzmEzM3sz0VmTMHpwEEUy0IZqLHO+
 lghO7ETtKYXwkbRV8pvWO5Yc+UADZYAKtn0xVFBVu7HpBBmx2xJL0U65ytqn+kVgsvqx
 OJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W8lRVIkUTgeqTvp3UujQH2CLRGy3B8K8y/uoE5gbRlE=;
 b=YOIwFEgIEdOhhmG5LkgvLZQaS30VbDAtO2aehAJWr+LMfVJBSkblTA3mB3hueGwcng
 39NT/iW9WcWOYqhXQ+qbWWpqjzYMSLTZw5YPS/aqHoaMr+KI9uvKnhCozFe0XOccfTAb
 myrl7sz5bcpgcBsw10gZMZ+aabIo4GBmbwEgddhArT7WvL+3AHGeTqTKjDJarITdmdlC
 rShCayroX3Icu26D3jUsFUZnh4lZA/ZTaa11QE92o5dQR18SnvVgnJAOPVbAxvidIKvf
 Cex/T+Urgo5CT1ab3s6DnB3RGiLWMfbnDsDZYrYhxuUUWo910QYvjueXQhKzeExgj+ki
 4lFg==
X-Gm-Message-State: AOAM531JoXbakPadrOJpeCdEqOiYOQruFB9GW7ufMG6jlYqJaNHSmz6K
 2VZOjAsUQqD19HaEGPF3M3I=
X-Google-Smtp-Source: ABdhPJyNbFuwXbFYGr09peaiTmIbU5nqlrtE2mcbXf8t2So++w/2R04DRO96ntKKg4N/60twFJuuiw==
X-Received: by 2002:adf:aace:: with SMTP id i14mr13249548wrc.236.1595702966728; 
 Sat, 25 Jul 2020 11:49:26 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id o3sm4676463wru.64.2020.07.25.11.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 11:49:26 -0700 (PDT)
Date: Sat, 25 Jul 2020 15:49:18 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/vkms: add missing drm_crtc_vblank_put to the get/put
 pair on flush
Message-ID: <20200725184918.togb54bxuifrq77c@smtp.gmail.com>
References: <20200722110411.ebkv6knvc6mzw5uf@smtp.gmail.com>
 <20200722120502.GK6419@phenom.ffwll.local>
 <20200722140604.27dfzfnzug5vb75r@smtp.gmail.com>
 <CAKMK7uHWCnJ+3YnP2FwVGH6cEDkmPnH9ALjY_1R51QVs0HPG0Q@mail.gmail.com>
 <20200725011737.GA2851@realwakka>
 <CAKMK7uEWPCzx+K=+nJsLT5HRBVJ+s8tqx30Ljkr4BCBDComyWQ@mail.gmail.com>
 <20200725174514.esh4gqek6oddizvh@smtp.gmail.com>
 <CAKMK7uEi0UFSwYTO7h6_YKN+UykOuVcmhMSG_ySy9uyo_7Pz-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEi0UFSwYTO7h6_YKN+UykOuVcmhMSG_ySy9uyo_7Pz-g@mail.gmail.com>
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

On 07/25, Daniel Vetter wrote:
> On Sat, Jul 25, 2020 at 7:45 PM Melissa Wen <melissa.srw@gmail.com> wrote:
> >
> > On 07/25, Daniel Vetter wrote:
> > > On Sat, Jul 25, 2020 at 5:12 AM Sidong Yang <realwakka@gmail.com> wrote:
> > > >
> > > > On Wed, Jul 22, 2020 at 05:17:05PM +0200, Daniel Vetter wrote:
> > > > > On Wed, Jul 22, 2020 at 4:06 PM Melissa Wen <melissa.srw@gmail.com> wrote:
> > > > > >
> > > > > > On 07/22, daniel@ffwll.ch wrote:
> > > > > > > On Wed, Jul 22, 2020 at 08:04:11AM -0300, Melissa Wen wrote:
> > > > > > > > This patch adds a missing drm_crtc_vblank_put op to the pair
> > > > > > > > drm_crtc_vblank_get/put (inc/decrement counter to guarantee vblanks).
> > > > > > > >
> > > > > > > > It clears the execution of the following kms_cursor_crc subtests:
> > > > > > > > 1. pipe-A-cursor-[size,alpha-opaque, NxN-(on-screen, off-screen, sliding,
> > > > > > > >    random, fast-moving])] - successful when running individually.
> > > > > > > > 2. pipe-A-cursor-dpms passes again
> > > > > > > > 3. pipe-A-cursor-suspend also passes
> > > > > > > >
> > > > > > > > The issue was initially tracked in the sequential execution of IGT
> > > > > > > > kms_cursor_crc subtest: when running the test sequence or one of its
> > > > > > > > subtests twice, the odd execs complete and the pairs get stuck in an
> > > > > > > > endless wait. In the IGT code, calling a wait_for_vblank before the start
> > > > > > > > of CRC capture prevented the busy-wait. But the problem persisted in the
> > > > > > > > pipe-A-cursor-dpms and -suspend subtests.
> > > > > > > >
> > > > > > > > Checking the history, the pipe-A-cursor-dpms subtest was successful when,
> > > > > > > > in vkms_atomic_commit_tail, instead of using the flip_done op, it used
> > > > > > > > wait_for_vblanks. Another way to prevent blocking was wait_one_vblank when
> > > > > > > > enabling crtc. However, in both cases, pipe-A-cursor-suspend persisted
> > > > > > > > blocking in the 2nd start of CRC capture, which may indicate that
> > > > > > > > something got stuck in the step of CRC setup. Indeed, wait_one_vblank in
> > > > > > > > the crc setup was able to sync things and free all kms_cursor_crc
> > > > > > > > subtests.
> > > > > > > >
> > > > > > > > Tracing and comparing a clean run with a blocked one:
> > > > > > > > - in a clean one, vkms_crtc_atomic_flush enables vblanks;
> > > > > > > > - when blocked, only in next op, vkms_crtc_atomic_enable, the vblanks
> > > > > > > > started. Moreover, a series of vkms_vblank_simulate flow out until
> > > > > > > > disabling vblanks.
> > > > > > > > Also watching the steps of vkms_crtc_atomic_flush, when the very first
> > > > > > > > drm_crtc_vblank_get returned an error, the subtest crashed. On the other
> > > > > > > > hand, when vblank_get succeeded, the subtest completed. Finally, checking
> > > > > > > > the flush steps: it increases counter to hold a vblank reference (get),
> > > > > > > > but there isn't a op to decreased it and release vblanks (put).
> > > > > > > >
> > > > > > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > > > > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > > > > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > > > > > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/vkms/vkms_crtc.c | 1 +
> > > > > > > >  1 file changed, 1 insertion(+)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > > > > > index ac85e17428f8..a99d6b4a92dd 100644
> > > > > > > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > > > > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > > > > > @@ -246,6 +246,7 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
> > > > > > > >
> > > > > > > >             spin_unlock(&crtc->dev->event_lock);
> > > > > > > >
> > > > > > > > +           drm_crtc_vblank_put(crtc);
> > > > > > >
> > > > > > > Uh so I reviewed this a bit more carefully now, and I dont think this is
> > > > > > > the correct bugfix. From the kerneldoc of drm_crtc_arm_vblank_event():
> > > > > > >
> > > > > > >  * Caller must hold a vblank reference for the event @e acquired by a
> > > > > > >  * drm_crtc_vblank_get(), which will be dropped when the next vblank arrives.
> > > > > > >
> > > > > > > So when we call drm_crtc_arm_vblank_event then the vblank_put gets called
> > > > > > > for us. And that's the only case where we successfully acquired a vblank
> > > > > > > interrupt reference since on failure of drm_crtc_vblank_get (0 indicates
> > > > > > > success for that function, failure negative error number) we directly send
> > > > > > > out the event.
> > > > > > >
> > > > > > > So something else fishy is going on, and now I'm totally confused why this
> > > > > > > even happens.
> > > > > > >
> > > > > > > We also have a pile of WARN_ON checks in drm_crtc_vblank_put to make sure
> > > > > > > we don't underflow the refcount, so it's also not that I think (except if
> > > > > > > this patch creates more WARNING backtraces).
> > > > > > >
> > > > > > > But clearly it changes behaviour somehow ... can you try to figure out
> > > > > > > what changes? Maybe print out the vblank->refcount at various points in
> > > > > > > the driver, and maybe also trace when exactly the fake vkms vblank hrtimer
> > > > > > > is enabled/disabled ...
> > > > > >
> > > > > > :(
> > > > > >
> > > > > > I can check these, but I also have other suspicions. When I place the
> > > > > > drm_crct_vblank_put out of the if (at the end of flush), it not only solve
> > > > > > the issue of blocking on kms_cursor_crc, but also the WARN_ON on kms_flip
> > > > > > doesn't appear anymore (a total cleanup). Just after:
> > > > > >
> > > > > > vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
> > > > > >
> > > > > > looks like there is something stuck around here.
> > > > >
> > > > > Hm do you have the full WARNING for this? Maybe this gives me an idea
> > > > > what's going wrong.
> > > > >
> > > > > > Besides, there is a lock at atomic_begin:
> > > > > >
> > > > > >   /* This lock is held across the atomic commit to block vblank timer
> > > > > >    * from scheduling vkms_composer_worker until the composer is updated
> > > > > >    */
> > > > > >   spin_lock_irq(&vkms_output->lock);
> > > > > >
> > > > > > that seems to be released on atomic_flush and make me suspect something
> > > > > > missing on the composer update.
> > > > >
> > > > > atomic_begin/atomic_flush are symmetric functions an always called
> > > > > around all the plane updates. So having the spin_lock in _begin and
> > > > > the spin_unlock in _flush should be symmetric and correct.
> > > > >
> > > > > If you want to make sure, recompile with CONFIG_PROVE_LOCKING, which
> > > > > should immmediately give you a huge splat in dmesg if there's anything
> > > > > unbalanced with locking.
> > > > >
> > > > > > I'll check all these things and come back with news (hope) :)
> > > > >
> > > > > Have fun chasing stuff :-)
> > > > >
> > > > > Cheers, Daniel
> > > > >
> > > > >
> > > > > >
> > > > > > Thanks,
> > > > > >
> > > > > > Melissa
> > > > > > >
> > > > > > > I'm totally confused about what's going on here now.
> > > > > > > -Daniel
> > > >
> > > > Hi Daniel, Melissa.
> > > > I found something about this problem.
> > > > I traced vblank->refcount that it's important in the problem.
> > > > In normal case, first test run calls commit_tail() and enable vblank in
> > > > atomic_flush(). in drm_vblank_get(), it enable vblank when refcount was zero.
> > > >
> > > > in first test run, it disable crtc for cleanup test. drm_crtc_vblank_off() was
> > > > called by atomic_disable. in this function vblank's refcount was increased for
> > > > prevent subsequent drm_vblank_get() from re-enabling the vblank interrupt.
> > > > and refcount goes one not zero for next test run.
> > > >
> > > > and next test run, drm_vblank_get() was called but it didn't enable vblank
> > > > because refcount was already one. drm_crtc_vblank_on() was called in next. but
> > > > it didn't enable vblank but just increase refcount only.
> > > >
> > > > I think this is why this problem happen. don't know how to fix this correctly.
> > > > should we force to enable vblank after enabling crtc?
> > >
> > > Hm, between drm_crtc_vblank_off and drm_crtc_vblank_on
> > > drm_crtc_vblank_get should fail (and leave the refcount unchanged).
> > > It's convoluted logic, but the check for vblank->enabled should catch
> > > that and return -EINVAL for this case. Does that not happen?
> > >
> > > It would indeed explain the bug (I think, I've been wrong way too many
> > > times with this).
> > > -Daniel
> > >
> > Hi Daniel and Sidong,
> >
> > I don't know if it will be confusing, but I will try to explain in a
> > little more detail (and newbie way) what I saw in this behavior of the
> > refcount (similar to what Sidong evaluated).
> >
> > 1. Starting with the loading of vkms is:
> > In vkms_init:
> > After drm_vblank_init (refcount=0), it calls:
> > vkms_modeset_init
> > --> vkms_output_init
> > ----> drm_mode_config_reset
> > -------> vkms_atomic_crtc_reset
> > (even more inside)--> drm_crtc_vblank_reset that bumps the refcount to
> > prevent vblank_get to enable vblank (refcount=1)
> >
> > 2. So, when we start a subtest, vblank is still disabled and in
> > commit_tail, commit_planes triggers a atomic_begin/flush->vblank_get that
> > return -EINVAL because !vblank->enabled (refcount ends 1) and send_vblank;
> > however the test fails before atomic_enable decrements refcount to 0 and
> > reset timestamp.
> > ** This warning also appears in this very first running:
> > WARNING: CPU: 0 PID: 708 at drivers/gpu/drm/vkms/vkms_crtc.c:91 vkms_get_vblank_timestamp+0x41/0x50 [vkms]
> 
> Hm yeah I guess that's something we should paper over a bit, but maybe
> the bugfix will take care of that.
> 
> > In the end, this sequence modeset_disable -> atomic_begin ->
> > atomic_flush: refcount going from 0 to 1 and than drm_vblank_enable
> > prepares to everything going well in the next subtest (because
> > atomic_disable is not called).
> >
> > 3. It could be nice, but in the next subtest (with success), as refcount +
> > vblank_enabled ok, after doind its job, it calls
> > atomic_disable->vblank_off and here refcount ends 1 and vblank disabled
> > (the problem returns).
> > So, we have a kind of good turn and bad turn.
> >
> > I tried different things, but the only relatively stable result was
> > putting the sequence modeset_disable + modeset_enables + commit_planes in
> > the commit_tail. That didn't convince me and then I keep trying things.
> 
> This actually sounds like a good idea, I had the same one. Doing it
> this way should also resolve the WARNING you've pointed out I think?
> 
No, this very first warning continues (only once) :(
From here (drm_crtc_vblank_on):
	if (atomic_read(&vblank->refcount) != 0 || drm_vblank_offdelay == 0)
		drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));

> But I'm still wondering why after step 3 we don't get -EINVAL from
> vblank_get() - after vblank_off() vblank->enabled should be false
> again, getting us back to the same state as after 1. Is that not
> happening?

Yes (sorry if it got confused), we got -EINVAL after setp 3:

In step 3, at the end of the 2nd running, we have:
atomic_disable
--> vblank_off [!vblank->inmodeset + refcount going 0->1 + inmodeset=1]
and then in next vblank_get: -EINVAL (!vblank->enabled + refcount ends 1)
as in the first step.

Melissa

> -Daniel
> 
> >
> > > >
> > > > Thanks
> > > > -Sidong
> > > >
> > > > > > >
> > > > > > > >             crtc->state->event = NULL;
> > > > > > > >     }
> > > > > > > >
> > > > > > > > --
> > > > > > > > 2.27.0
> > > > > > > >
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
> > > > > _______________________________________________
> > > > > dri-devel mailing list
> > > > > dri-devel@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
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
