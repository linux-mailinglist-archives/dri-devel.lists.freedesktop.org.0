Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 959C023B7C5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 11:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418306E02F;
	Tue,  4 Aug 2020 09:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749DE6E02F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 09:33:55 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g8so2036964wmk.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 02:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=NFwnBuUV6bVAwnm6zIwLZz6xFgzPWKISMQC0BJF3oys=;
 b=UoPVoVRzcsw6cieJIVlsnj/wuU9LmN3VfVRrZ+MKwKQQxr+9xLbRnacDmgsrLkpFk8
 OLqylsQVWdcyLNjSoixDW1lfZwEglNY276klOaFmuPYng2Iu/NInbg46Xd78hATFLAYi
 8Mx23cu3tS+0KXJx89zbDDgmGsZE2Hm/gm9LA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=NFwnBuUV6bVAwnm6zIwLZz6xFgzPWKISMQC0BJF3oys=;
 b=Hcpu9rqLHGRxMNlWdm+/pqd9VCr9B/w5ITa6z1VNsrAgMfZXWUHjUTEhYIuxZqnF+f
 SPZ+QpcBk4g1jtxI1QH6E4naaC4FG2BGsiMGV27Bqy3W48IjJ6B+84mjBivHFGFRxk+a
 N7LH8OSDA6fHnm3xhjtpDpOy5EYaotoLOYfIUrvPk2ltDYJQfL/odxc/X41Z5hHPpYos
 Jlt2mIgA3A8wJAlC3KjqjXQluUgamzQob9iTAmVR8TOIMKnbm4Eqzdvj8Y96hSxd1L89
 WfUda0nov+4FiVCdgaX7n2bwekP4fLRtcgcMwxaVBEe1CsNcE0rcKdRoqv16U/wgSr5H
 73Gg==
X-Gm-Message-State: AOAM530vqVwuZ4ESV02zUGvWrAoNLaA6dI9HYguRWs2JB/gx53CdTsfb
 ++sQNn6rfbLCuzLZG6/83FGtGw==
X-Google-Smtp-Source: ABdhPJxrrGidzQhwfTb1jWqCDcxs0YR82vstHBGZpvbp2FYaqscg6VnidhLropJSAgj/04fpqf7IWg==
X-Received: by 2002:a1c:ba83:: with SMTP id k125mr3240823wmf.160.1596533634127; 
 Tue, 04 Aug 2020 02:33:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q5sm28336286wrp.60.2020.08.04.02.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 02:33:53 -0700 (PDT)
Date: Tue, 4 Aug 2020 11:33:51 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH] drm/vkms: modify sequence disable/plane/enable in
 commit_tail
Message-ID: <20200804093351.GI6419@phenom.ffwll.local>
Mail-Followup-To: Melissa Wen <melissa.srw@gmail.com>,
 Sidong Yang <realwakka@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200729152231.13249-1-realwakka@gmail.com>
 <CAJeY4oEAHmY5icF_EPpojW5U+ryt3-guuvGQfj_S=XskO_xyRA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJeY4oEAHmY5icF_EPpojW5U+ryt3-guuvGQfj_S=XskO_xyRA@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 01, 2020 at 04:30:23PM -0300, Melissa Wen wrote:
> On Wed, Jul 29, 2020 at 12:22 PM Sidong Yang <realwakka@gmail.com> wrote:
> >
> > This patch modifies function call sequence in commit tail. This is for
> > the problem that raised when kms_cursor_crc test is tested repeatedly.
> > In second test, there is an bug that crtc commit doesn't start vblank e=
vents.
> > Because there is some error about vblank's refcount. in commit_flush() =
that
> > called from commit_plane, drm_vblank_get() is called and vblank is enab=
led
> > in normal case. But in second test, vblank isn't enable for vblank->ref=
count
> > is already increased in previous test. Increased refcount will be decre=
ased
> > in drm_atomic_helper_commit_modeset_enables() after commit_plane.
> > Therefore, commit_plane should be called after commit_modeset_enable.
> >
> > In this situation, there is a warning raised in get_vblank_timestamp().
> > hrtimer.node.expires and vblank->time are zero for no vblank events bef=
ore.
> > This patch returns current time when vblank is not enabled.
> >
> Hi Sidong,
> =

> I think this patch tries to solve two different issues.
> =

> I am not a maintainer, but I believe you can split it.
> =

> Everything indicates that changing the commit tail sequence does not
> ideally solve the problem of subtests getting stuck (as we have dicussed);
> however, for me, the treatment of the warning is valid and it is also rel=
ated
> to other IGT tests using VKMS.

Yeah I think (but haven't tested, definitely need to confirm that) that
the vblank get/put fix from Melissa is the correct fix for all these
issues.

> One option is to send a patch that only treats the warning. I believe that
> in the body of the commit message, it would be nice to have the warning
> that this patch addresses, and when it appears by running an IGT test.
> Also, say why it should be done this way in vkms.
> This info could help future debugging.

Yeah I think splitting out the warning fix is the right thing to do here.
-Daniel

> =

> Off-topic: I removed the group's mailing list of the University of S=E3o
> Paulo (kernel-usp) from the cc, since I believe you had no intention of
> sending the patch to them.
> =

> Best regards,
> =

> Melissa
> =

> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> >
> > Signed-off-by: Sidong Yang <realwakka@gmail.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_crtc.c | 5 +++++
> >  drivers/gpu/drm/vkms/vkms_drv.c  | 4 ++--
> >  2 files changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vk=
ms_crtc.c
> > index ac85e17428f8..09c012d54d58 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -86,6 +86,11 @@ static bool vkms_get_vblank_timestamp(struct drm_crt=
c *crtc,
> >         struct vkms_output *output =3D &vkmsdev->output;
> >         struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> >
> > +       if (!READ_ONCE(vblank->enabled)) {
> > +               *vblank_time =3D ktime_get();
> > +               return true;
> > +       }
> > +
> >         *vblank_time =3D READ_ONCE(output->vblank_hrtimer.node.expires);
> >
> >         if (WARN_ON(*vblank_time =3D=3D vblank->time))
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkm=
s_drv.c
> > index 1e8b2169d834..c2c83a01d4a7 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -76,10 +76,10 @@ static void vkms_atomic_commit_tail(struct drm_atom=
ic_state *old_state)
> >
> >         drm_atomic_helper_commit_modeset_disables(dev, old_state);
> >
> > -       drm_atomic_helper_commit_planes(dev, old_state, 0);
> > -
> >         drm_atomic_helper_commit_modeset_enables(dev, old_state);
> >
> > +       drm_atomic_helper_commit_planes(dev, old_state, 0);
> > +
> >         drm_atomic_helper_fake_vblank(old_state);
> >
> >         drm_atomic_helper_commit_hw_done(old_state);
> > --
> > 2.17.1
> >
> > --
> > You received this message because you are subscribed to the Google Grou=
ps "Kernel USP" group.
> > To unsubscribe from this group and stop receiving emails from it, send =
an email to kernel-usp+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/ms=
gid/kernel-usp/20200729152231.13249-1-realwakka%40gmail.com.

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
