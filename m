Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 741691893BC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 02:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72FFE6E853;
	Wed, 18 Mar 2020 01:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCB589D7C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 22:29:13 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id v3so22844574iom.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 15:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+bEIoiMS77J8OafdTSe8ka9CicGNma8msO19PpTMGGU=;
 b=XsH2EWdlmo2FWYBvtVzOdR0HVND74GUX1SiRcRc2SzJBbtTrGbjYewhWERHT/9VuYy
 A4XNY27GZ1DVtb9WRskC+VR05HY0eczzAetwxDGll+aZksKxI+TWbg9aX1VWhkpqpfsH
 m6gidwY8k1vpxeamp1ZZcJD6NUuk+8sCIUkRDPu+r3RemGAoJZjuHSKST3v730/AWWFC
 K9x+A4dB7auiUS6/lQtdr7jg4wboz4ax4v7qxCuFcf9ipmsLLV4+KaQjSzEpcLPohI7h
 LUFX+r7dRDYMBqgdgxgz4P7DCg3piPX685dY1iSXONS0d7/Jr+NOTax5HoUTvl0lqIWo
 nsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+bEIoiMS77J8OafdTSe8ka9CicGNma8msO19PpTMGGU=;
 b=Rm49g+hzoYvfn2V/ZMtkRL3DHv2N5uSxCVE3XWSa4Rm1D2ws4AZw3AP2wtThe9sM57
 4YejvJk4kODOiXguDDvoZDfe1IjvQH/PZZCD1Bd9Yq6qIXUe59tmpAX1A3C8TQRBrRoC
 hi31tO/FJhyXT7kE1Kdnw+HINO9Mu+25fN37ZrxoKYJH2khr0BUV6eV+Qw4bG4hRKZtp
 gxy5bd5z9rZMCkyhLMqkN8PhC25wWIjC/jHz1YGWYtGVoSzWPSKaSxH2V1TbSWrGGmM9
 icesquBxOG2yfrBVQtMAg3Y6T+KryF1qROTzDKwXHdwc3JHPZTv5IkoKoLCqscR9qHdw
 DsXQ==
X-Gm-Message-State: ANhLgQ2HBVg6NwLknLCnrNp5XUlkyGZktyCo3FDV9PLHE8R6b/12JLok
 Jo65LWUmm+cIHhI5O9uwLlMkJpq4QzB1nFLghwo=
X-Google-Smtp-Source: ADFU+vtNbNfEr3+QnFalp8JMjl/uIHuqwXCiBCpCEK2xYevFvN/okNzd5s4kPzmvSxDuzzEFr+gjCKEqyEH7G34pjaA=
X-Received: by 2002:a02:9f90:: with SMTP id a16mr1501965jam.61.1584484152847; 
 Tue, 17 Mar 2020 15:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <1584329768-16119-1-git-send-email-hqjagain@gmail.com>
 <20200317165729.GQ2363188@phenom.ffwll.local>
In-Reply-To: <20200317165729.GQ2363188@phenom.ffwll.local>
From: Qiujun Huang <hqjagain@gmail.com>
Date: Wed, 18 Mar 2020 06:29:02 +0800
Message-ID: <CAJRQjod6JD8AGtBRxpsGJV3ACd0QLO_UvNDeM1rMuZPioAqB4A@mail.gmail.com>
Subject: Re: [PATCH] drm/lease: fix WARNING in idr_destroy
To: Qiujun Huang <hqjagain@gmail.com>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, 
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Approved-At: Wed, 18 Mar 2020 01:38:24 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 12:57 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Mar 16, 2020 at 11:36:08AM +0800, Qiujun Huang wrote:
> > leases has been destroyed:
> > drm_master_put
> >     ->drm_master_destroy
> >             ->idr_destroy
> >
> > so the "out_lessee" needn't to call idr_destroy again.
> >
> > Reported-and-tested-by: syzbot+05835159fe322770fe3d@syzkaller.appspotmail.com
> > Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_lease.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> > index b481caf..54506c2 100644
> > --- a/drivers/gpu/drm/drm_lease.c
> > +++ b/drivers/gpu/drm/drm_lease.c
> > @@ -577,11 +577,14 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
> >
> >  out_lessee:
> >       drm_master_put(&lessee);
> > +     goto err_exit;
>
> I think this is correct, but also confusioning and inconsistent with the
> existing style. Most error cases before drm_lease_create explicit destroy
> the idr, except the one for drm_lease_create.
Yeah, it is.

>
> Instead of your patch I'd
> - remove the idr_destry from the error unrolling here
> - add it the to drm_lease_create error case
> - add a comment above the call to drm_lease_crete that it takes ownership
>   of the lease idr
>
> Can you pls respin and retest to make sure that patch is still correct?
I get that, thanks.

>
> Thanks, Daniel
>
> >
> >  out_leases:
> > -     put_unused_fd(fd);
> >       idr_destroy(&leases);
> >
> > +err_exit:
> > +     put_unused_fd(fd);
> > +
> >       DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl failed: %d\n", ret);
> >       return ret;
> >  }
> > --
> > 1.8.3.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
