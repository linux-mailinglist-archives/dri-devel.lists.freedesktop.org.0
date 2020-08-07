Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B52723F42C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 23:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F9F6E127;
	Fri,  7 Aug 2020 21:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9FD6E127
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 21:17:18 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id s15so1597284pgc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 14:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=mTi25uKDeno+kjIGWxKtG9bnSzwH+0hK7ejqxU/R1EA=;
 b=PWwhGBchg2tJbjQiYkAtlcJdXTvewWyYBMHTHHrKFz2Px+GJ5NXCZfJ7x5pG3p5K8c
 6FhQTKgwg48cZFRfGsdGe6mYPYH2dLTU+qCzpRfJXDHU5jT/bH8VyQUZ0ngvIIGG13my
 ZUjFuSEKUTRIoUtwlx+fekBRDEZLzvdAKhTPtX25rUOj36ZEdkgbf4Q4wCEDvVJFIaNr
 dlUloyzVjagzcCYchfILiAavp7KC7EMg7VwsKSCC1mQxULEK8ELFy6kIyyAi3DvhwDw7
 PS8cGJVHwjXzWUpcVHd2RLZK19nTPA/gSYq50xrZM2aQAAWBDiWFrgxiWaq2F/OXVfoV
 uYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=mTi25uKDeno+kjIGWxKtG9bnSzwH+0hK7ejqxU/R1EA=;
 b=FdHrUCp88DBWJk4mYK64GLxq2jtKr1N5/SzAbMKfpBtl3IMhuYJFbybryST6P14K12
 t3p8qA/uLR4Gnc07nP/FffQoSnh1xAHD3iCuYaSTAWCByOFJtIelJtjimtJA8POldQvG
 Zxi+RfsVPLDMfiwukm881Z4vNwZGPvgPZ+nw3y1sR3wtZcSRVmuw8bc66VDqGtIGfYe/
 EYAGkJu9mxFdTFl/CUnvD6FzL0MpiVhuxEYRIflLwip1QzVGu+w5XlEX8l1ThzsWvFLb
 5nYNmgfMYMvNVrlPxjY52H48u2Fyud8Mo9WyqrhpKHw+R92qlM31NF9941eLJNYC1rm1
 zZ2Q==
X-Gm-Message-State: AOAM531hpZJckFtB9GIlh8nMWW9G+QDsA9XF5dnSXoouh2aweQrX8PD7
 hAsg194O7mE6n7dHIUtAZ9ADnGge
X-Google-Smtp-Source: ABdhPJyX8dokEBECvrJtr/HspUEzUCXoXJ2w+iu74hAdocV4J9yYNtCOIKOnx/uQYxfab10QHJTsWw==
X-Received: by 2002:a62:62c5:: with SMTP id
 w188mr15527675pfb.133.1596835037973; 
 Fri, 07 Aug 2020 14:17:17 -0700 (PDT)
Received: from realwakka ([61.83.141.80])
 by smtp.gmail.com with ESMTPSA id i185sm4358478pgd.28.2020.08.07.14.17.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Aug 2020 14:17:17 -0700 (PDT)
Date: Fri, 7 Aug 2020 21:17:00 +0000
From: Sidong Yang <realwakka@gmail.com>
To: Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/vkms: modify sequence disable/plane/enable in
 commit_tail
Message-ID: <20200807211700.GA30117@realwakka>
References: <20200729152231.13249-1-realwakka@gmail.com>
 <CAJeY4oEAHmY5icF_EPpojW5U+ryt3-guuvGQfj_S=XskO_xyRA@mail.gmail.com>
 <20200804093351.GI6419@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804093351.GI6419@phenom.ffwll.local>
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
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 04, 2020 at 11:33:51AM +0200, daniel@ffwll.ch wrote:
> On Sat, Aug 01, 2020 at 04:30:23PM -0300, Melissa Wen wrote:
> > On Wed, Jul 29, 2020 at 12:22 PM Sidong Yang <realwakka@gmail.com> wrot=
e:
> > >
> > > This patch modifies function call sequence in commit tail. This is for
> > > the problem that raised when kms_cursor_crc test is tested repeatedly.
> > > In second test, there is an bug that crtc commit doesn't start vblank=
 events.
> > > Because there is some error about vblank's refcount. in commit_flush(=
) that
> > > called from commit_plane, drm_vblank_get() is called and vblank is en=
abled
> > > in normal case. But in second test, vblank isn't enable for vblank->r=
efcount
> > > is already increased in previous test. Increased refcount will be dec=
reased
> > > in drm_atomic_helper_commit_modeset_enables() after commit_plane.
> > > Therefore, commit_plane should be called after commit_modeset_enable.
> > >
> > > In this situation, there is a warning raised in get_vblank_timestamp(=
).
> > > hrtimer.node.expires and vblank->time are zero for no vblank events b=
efore.
> > > This patch returns current time when vblank is not enabled.
> > >
> > Hi Sidong,
> > =

> > I think this patch tries to solve two different issues.
> > =

> > I am not a maintainer, but I believe you can split it.
> > =

> > Everything indicates that changing the commit tail sequence does not
> > ideally solve the problem of subtests getting stuck (as we have dicusse=
d);
> > however, for me, the treatment of the warning is valid and it is also r=
elated
> > to other IGT tests using VKMS.
> =

> Yeah I think (but haven't tested, definitely need to confirm that) that
> the vblank get/put fix from Melissa is the correct fix for all these
> issues.
> =

> > One option is to send a patch that only treats the warning. I believe t=
hat
> > in the body of the commit message, it would be nice to have the warning
> > that this patch addresses, and when it appears by running an IGT test.
> > Also, say why it should be done this way in vkms.
> > This info could help future debugging.
> =

> Yeah I think splitting out the warning fix is the right thing to do here.

Okay, I'll write another patch about the warning.
Thanks.

-Sidong

> -Daniel
> =

> > =

> > Off-topic: I removed the group's mailing list of the University of S=E3o
> > Paulo (kernel-usp) from the cc, since I believe you had no intention of
> > sending the patch to them.
> > =

> > Best regards,
> > =

> > Melissa
> > =

> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > >
> > > Signed-off-by: Sidong Yang <realwakka@gmail.com>
> > > ---
> > >  drivers/gpu/drm/vkms/vkms_crtc.c | 5 +++++
> > >  drivers/gpu/drm/vkms/vkms_drv.c  | 4 ++--
> > >  2 files changed, 7 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/=
vkms_crtc.c
> > > index ac85e17428f8..09c012d54d58 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > @@ -86,6 +86,11 @@ static bool vkms_get_vblank_timestamp(struct drm_c=
rtc *crtc,
> > >         struct vkms_output *output =3D &vkmsdev->output;
> > >         struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> > >
> > > +       if (!READ_ONCE(vblank->enabled)) {
> > > +               *vblank_time =3D ktime_get();
> > > +               return true;
> > > +       }
> > > +
> > >         *vblank_time =3D READ_ONCE(output->vblank_hrtimer.node.expire=
s);
> > >
> > >         if (WARN_ON(*vblank_time =3D=3D vblank->time))
> > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/v=
kms_drv.c
> > > index 1e8b2169d834..c2c83a01d4a7 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > @@ -76,10 +76,10 @@ static void vkms_atomic_commit_tail(struct drm_at=
omic_state *old_state)
> > >
> > >         drm_atomic_helper_commit_modeset_disables(dev, old_state);
> > >
> > > -       drm_atomic_helper_commit_planes(dev, old_state, 0);
> > > -
> > >         drm_atomic_helper_commit_modeset_enables(dev, old_state);
> > >
> > > +       drm_atomic_helper_commit_planes(dev, old_state, 0);
> > > +
> > >         drm_atomic_helper_fake_vblank(old_state);
> > >
> > >         drm_atomic_helper_commit_hw_done(old_state);
> > > --
> > > 2.17.1
> > >
> > > --
> > > You received this message because you are subscribed to the Google Gr=
oups "Kernel USP" group.
> > > To unsubscribe from this group and stop receiving emails from it, sen=
d an email to kernel-usp+unsubscribe@googlegroups.com.
> > > To view this discussion on the web visit https://groups.google.com/d/=
msgid/kernel-usp/20200729152231.13249-1-realwakka%40gmail.com.
> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
