Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 455EB21BBBF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 19:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF366E209;
	Fri, 10 Jul 2020 17:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DBF6E209
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 17:05:41 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o11so6699269wrv.9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 10:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=93AVI2QoBAEmAqBGfFTWCA/a6MgEBTx5yqqj7c1xOd0=;
 b=SGZ+JtJlaFBv11yuKiq6semZUeibR6h4e8fA7pdOBGjb3+J8yqRTJFURAMksjcK6+n
 urnCtDBpZiZynCbSW1OcKUoM6jK13muadzTTFvzTbPdsQ6B8K2HdnHEj6hrSHXQ0HpjG
 mQt1ZepaXEMarLUXc2AHGSobIMLA8g1rWJPFwJ+P2Ewfz4T4nOne8l0ELVg1d/dYDxJt
 jyA/2a7q/rDSyiMayTWHMnxli1uUqXdmhiU69K9D1o3+pxkRRw0DJYhfF2XU7UrEqfhu
 naiLeqa8fkDsXD4Of9roNMA7a7i/wj5h71jyDCLK+s8uEXafKl4ZrdgF3jpykmyXQtlu
 PiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=93AVI2QoBAEmAqBGfFTWCA/a6MgEBTx5yqqj7c1xOd0=;
 b=M1rd1HX2dcXrcg6kMkIgo9uHX6LKU53OMO8LfV+YUp85pm2qgwRsBQVYgXslvtIMid
 D6LQq3P+aKWXml9I4afvFakE33dRZYZxw2zjIy40t/dJOogBq61VfHJ8hCy7z2wm+cNQ
 v+WUD8vdTrpwWrS3LP77E8YkqXdI8dWMO1oxc33K3qfR8BPZ+3BXQIuRpxlBRMKJTKwl
 d38xphMB28LBQaL3saS1KR/EOgezdgcboXc3pY/qPVEW2xfGfxw/dOJ3ux+yJaWmdKOJ
 ypjrqK9k8LfB/Ri++/kmaxTHJdNTxQXJdngFxHzLuGt7yNUJ4Yibs4L2SfFWR/yDHZdZ
 8nYw==
X-Gm-Message-State: AOAM532xV1xgR6PMpDiOzh8ZgRanug9DKX8bDfovxSUfWqg3KS7pZJRg
 b+VOrd1fvJFRhrmGaNJiEmU=
X-Google-Smtp-Source: ABdhPJx1UxxkLEdprdW3mDWVo+KqPIchfniOsIMY3EYh0jN3bRqGm0+KSSjajUGLHSDx1ePvHdanQQ==
X-Received: by 2002:adf:f608:: with SMTP id t8mr70444597wrp.308.1594400739927; 
 Fri, 10 Jul 2020 10:05:39 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id o29sm11825132wra.5.2020.07.10.10.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 10:05:39 -0700 (PDT)
Date: Fri, 10 Jul 2020 14:05:33 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/vkms: add wait_for_vblanks in atomic_commit_tail
Message-ID: <20200710170533.xn2ar2cpekom6i2n@smtp.gmail.com>
References: <20200701153134.4187-1-realwakka@gmail.com>
 <20200702131355.GX3278063@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702131355.GX3278063@phenom.ffwll.local>
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
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02, Daniel Vetter wrote:
> On Wed, Jul 01, 2020 at 03:31:34PM +0000, Sidong Yang wrote:
> > there is an error when igt test is run continuously. vkms_atomic_commit_tail()
> > need to call drm_atomic_helper_wait_for_vblanks() for give up ownership of
> > vblank events. without this code, next atomic commit will not enable vblank
> > and raise timeout error.
> > 
> > Signed-off-by: Sidong Yang <realwakka@gmail.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > index 1e8b2169d834..10b9be67a068 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -93,6 +93,8 @@ static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
> >  		flush_work(&vkms_state->composer_work);
> >  	}
> >  
> > +	drm_atomic_helper_wait_for_vblanks(dev, old_state);
> 
> Uh, we have a wait_for_flip_done right above, which should be doing
> exactly the same, but more precisely: Instead of just waiting for any
> vblank to happen, we wait for exactly the vblank corresponding to this
> atomic commit. So no races possible. If this is papering over some issue,
> then I think more debugging is needed.
> 
> What exactly is going wrong here for you?

Hi Daniel and Sidong,

I noticed a similar issue when running the IGT test kms_cursor_crc. For
example, a subtest that passes on the first run (alpha-opaque) fails on
the second due to a kind of busy waiting in subtest preparation (the
subtest fails before actually running).

In addition, in the same test, the dpms subtest started to fail since
the commit that change from wait_for_vblanks to wait_for_flip_done. By
reverting this commit, the dpms subtest passes again and the sequential
subtests return to normal.

I am trying to figure out what's missing from using flip_done op on
vkms, since I am also interested in solving this problem and I
understand that the change for flip_done has been discussed in the past.

Do you have any idea?

Melissa

> -Daniel
> 
> > +
> >  	drm_atomic_helper_cleanup_planes(dev, old_state);
> >  }
> >  
> > -- 
> > 2.17.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
