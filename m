Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4578B2A9176
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E146EA7C;
	Fri,  6 Nov 2020 08:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A026ED64
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 17:40:55 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id x23so1121949plr.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 09:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=M9ihP9we/zZDj1bRQBGaWng2JQ4juZGWzyhKriRhb/c=;
 b=i1HADtwImSCJ0eNMPOeOuYQZZSp3gxw07xNwRbTgMlWN18IbrOQBjFaeNrWIoTxCzO
 TEk+8mphIK5upO0csZf6bbXFrIKJe0sGKep4NHtOJzcI/xu6ThXpGtpBsUJXue+AY5IU
 Ib/RpWT2bOE66N3XjmtfED/fX/XrCmzp+S8nhhpkBduSn2eh4/YHFrr9E3G+kKGBf5x6
 jd5LCYpXZtgbljcgme26T2qQJnfI5Wl8qbTCT3VRqww1NteqsYFUth22vPhZlbqoKvBh
 XbHVkuqFe/uzBDXTm2BVZaa2O85OqQLird/QrbNHEoBWDAW6qMqB1bSdV5zQVyp2V1v+
 3Hvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M9ihP9we/zZDj1bRQBGaWng2JQ4juZGWzyhKriRhb/c=;
 b=BqHzIcetVsCwpgG6FfIOMCgnQkICXXUgkH97JjAhJclTHFT0SlZHPliqkW68EqDdcc
 tg8eh3qcvT7WM+/CJojQURHlxG7DkGhK5JwzgoKiFdBmi7uFRMgA4HX4NGVXH0K0/i4h
 kq0EIbv9xSwbNOp9nWmWj3BhNfade8/i8hZJuTSs88iShmb4Hnhbsofs1BEw3N+l1uOB
 fpWzoj8TcObfMuziJyh4QM0It56x5XQ3gE6xYTMYohwa1GP4xlQAecV3BP2XsGv/qJ6d
 m21h505FqpErFd7nz00nii8Z9p7HIeGTqtQntMD08VuKwlh4qhN3d+c9AnAKS48hyYE8
 59ug==
X-Gm-Message-State: AOAM533+ReVx3btqCVEWM+dzwEfcfuUWSwc09o/mTYEE7Hv2/IERCNMr
 58k3EYFhlfckcCdDXe3NRWk=
X-Google-Smtp-Source: ABdhPJwiu6z6dYW6rbmjufMJoVFUNrZfv0xXtUieOqcdG+bof+LS4G4dnlUfXfA72/6/pUZ7RzGEDA==
X-Received: by 2002:a17:90a:5d17:: with SMTP id
 s23mr3529740pji.103.1604598054856; 
 Thu, 05 Nov 2020 09:40:54 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id l7sm2742527pjg.29.2020.11.05.09.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 09:40:54 -0800 (PST)
Date: Thu, 5 Nov 2020 23:10:45 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/vgm: replace idr_init() by idr_init_base()
Message-ID: <20201105174045.GA41810@localhost>
References: <20201104112338.GA29271@localhost>
 <20201105094215.GT401619@phenom.ffwll.local>
 <20201105103116.GA29881@localhost>
 <CAKMK7uF0buRA-FfoY2=FbZQO-cqgSwZXRWwNQ2xkBdZAS=JuRA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uF0buRA-FfoY2=FbZQO-cqgSwZXRWwNQ2xkBdZAS=JuRA@mail.gmail.com>
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 12:16:34PM +0100, Daniel Vetter wrote:
> On Thu, Nov 5, 2020 at 11:31 AM Deepak R Varma <mh12gx2825@gmail.com> wrote:
> >
> > On Thu, Nov 05, 2020 at 10:42:15AM +0100, Daniel Vetter wrote:
> > > On Wed, Nov 04, 2020 at 04:53:38PM +0530, Deepak R Varma wrote:
> > > > idr_init() uses base 0 which is an invalid identifier. The new function
> > > > idr_init_base allows IDR to set the ID lookup from base 1. This avoids
> > > > all lookups that otherwise starts from 0 since 0 is always unused.
> > > >
> > > > References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")
> > > >
> > > > Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> > >
> > > Tiny typo in the commit message summary: s/vgm/vgem/
> > >
> > > Also can you pls resbumit this with intel-gfx mailing list on cc (like for
> > > i915)? There's a CI bot there which runs a few vgem tests, would be good
> > > to confirm nothing has been broken.
> >
> > Hi Daniel,
> > sure. I will correct the summary typo and also feed it to the CI bot.
> >
> > Also, according to Felix Kuehling's comment on a similar patch for
> > drm/amdkfd driver, an ID can be 0. The change I am proposing is more
> > efficient for conditions that do not want to use ID as 0. Otherwise,
> > id = 0 is an acceptable possibility. So, my statement that "Id 0 is an invalid
> > identifier" is not true.
> >
> > Can you please comment if this is accurate and I should reword my log
> > message as well?
> 
> You need to review the vgem code to see whether we're using id 0 as
> invalid identifier or not. That's part of the work that needs to be
> done here. Best would be to explain the evidence you've found in the
> commit message, why id 0 is invalid for this specific code. Since yes
> in general that's not true, it depends how the idr is used.
> -Daniel
> 
You are correct. For the vgem driver, id 0 is not used. The patch
should then apply to this driver.

Thank you very much Daniel. I have just sent v2 of the patch with your
suggestions.

./drv

> >
> > Thank you.
> > ./drv
> >
> > >
> > > Otherwise lgtm.
> > >
> > > Thanks, Daniel
> > >
> > > > ---
> > > >  drivers/gpu/drm/vgem/vgem_fence.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
> > > > index 17f32f550dd9..2902dc6e64fa 100644
> > > > --- a/drivers/gpu/drm/vgem/vgem_fence.c
> > > > +++ b/drivers/gpu/drm/vgem/vgem_fence.c
> > > > @@ -233,7 +233,7 @@ int vgem_fence_signal_ioctl(struct drm_device *dev,
> > > >  int vgem_fence_open(struct vgem_file *vfile)
> > > >  {
> > > >     mutex_init(&vfile->fence_mutex);
> > > > -   idr_init(&vfile->fence_idr);
> > > > +   idr_init_base(&vfile->fence_idr, 1);
> > > >
> > > >     return 0;
> > > >  }
> > > > --
> > > > 2.25.1
> > > >
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
