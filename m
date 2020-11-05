Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 334582A9158
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BE16EA7A;
	Fri,  6 Nov 2020 08:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3991A6EA04
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 10:31:22 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id z24so1133370pgk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 02:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VGBAVhOjF+1BxiCG/QGd19p6o0KRA/Zwhk/3kLtyC0c=;
 b=lenVPGBmSJhTb/UugRXW30QVkwiYJB2VZBF7yqxIZcxabmZ5KHJNswuG+t72ZdlM6O
 PAAOueXzrJeQ+J/N4yfUOkXbTLEGZ2zObqHv9JiuVABfy+D6gepDEumNuSHI9FrwXCbU
 TaUyVfFG1OCY+V4o2iZVJZOFQl39F0pQjwYK5FlYBOj+s+rTSRSAsKKl6wSPYazxDK4l
 2xUUCfK9XH8KMeiJWuhkfMsC43jI5pyyF8p02IEC+JEQUJ45Y30sy0k5bFrGGVrItBkP
 HNCv3C/hZnizjUfJFEm3uCc5KsdCjPMrhG5C4xZ/Eq4dzhOWya2q+US6VxP2AKl4mcQ3
 RCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VGBAVhOjF+1BxiCG/QGd19p6o0KRA/Zwhk/3kLtyC0c=;
 b=EyLrYvJzoS594ynqV8AvwIhCE8i0ZdbOxRXMjRU7ldUO1z5lJq/hwIpNgKF4IvGpXe
 u0cZqIbzLT+hGH2JwHholki1iNoPNrqPUM/qA10HUipWn2Yf2x3Y6JkMhUBMJsAFvTS/
 DzknoqNcptU090w0s2R/+SpizNvnn9uv0fFwKKFHf4XzHXZmgVpRtwYZFG3awYgc19hL
 2DMIIOOhr5eNQoUT3K0ELOqddWrkbkG6+Xscs0p/qVlCJ2PtgslRvSQ9Ok1oArD6GSmh
 IfPfzPhppXXwbEzhpmCQNyAUNAr9kwQvP8yTG4ieCWFzw29f0/0TDXb57xlgbkKgtlf0
 jVfg==
X-Gm-Message-State: AOAM531S9Ebwq/zi6BudjctBIX6HVv/xfvA//xlBd9jYWFBp3Op2ND80
 1A6ZS+Falu+Hxk0yZ1Chz38=
X-Google-Smtp-Source: ABdhPJwStwAjBGuTGKkmIgB0euUBZ1GO72dQX2OO75O1JkDC15NMT+JqeburedC0i5Tq4w/Got6s6Q==
X-Received: by 2002:a63:cf15:: with SMTP id j21mr1745244pgg.116.1604572281886; 
 Thu, 05 Nov 2020 02:31:21 -0800 (PST)
Received: from localhost ([160.202.157.3])
 by smtp.gmail.com with ESMTPSA id z10sm1924092pff.218.2020.11.05.02.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 02:31:21 -0800 (PST)
Date: Thu, 5 Nov 2020 16:01:16 +0530
From: Deepak R Varma <mh12gx2825@gmail.com>
To: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vgm: replace idr_init() by idr_init_base()
Message-ID: <20201105103116.GA29881@localhost>
References: <20201104112338.GA29271@localhost>
 <20201105094215.GT401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105094215.GT401619@phenom.ffwll.local>
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
Cc: mh12gx2825@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 10:42:15AM +0100, Daniel Vetter wrote:
> On Wed, Nov 04, 2020 at 04:53:38PM +0530, Deepak R Varma wrote:
> > idr_init() uses base 0 which is an invalid identifier. The new function
> > idr_init_base allows IDR to set the ID lookup from base 1. This avoids
> > all lookups that otherwise starts from 0 since 0 is always unused.
> > 
> > References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")
> > 
> > Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
> 
> Tiny typo in the commit message summary: s/vgm/vgem/
> 
> Also can you pls resbumit this with intel-gfx mailing list on cc (like for
> i915)? There's a CI bot there which runs a few vgem tests, would be good
> to confirm nothing has been broken.

Hi Daniel,
sure. I will correct the summary typo and also feed it to the CI bot.

Also, according to Felix Kuehling's comment on a similar patch for
drm/amdkfd driver, an ID can be 0. The change I am proposing is more
efficient for conditions that do not want to use ID as 0. Otherwise,
id = 0 is an acceptable possibility. So, my statement that "Id 0 is an invalid
identifier" is not true.

Can you please comment if this is accurate and I should reword my log
message as well?

Thank you.
./drv

> 
> Otherwise lgtm.
> 
> Thanks, Daniel
> 
> > ---
> >  drivers/gpu/drm/vgem/vgem_fence.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
> > index 17f32f550dd9..2902dc6e64fa 100644
> > --- a/drivers/gpu/drm/vgem/vgem_fence.c
> > +++ b/drivers/gpu/drm/vgem/vgem_fence.c
> > @@ -233,7 +233,7 @@ int vgem_fence_signal_ioctl(struct drm_device *dev,
> >  int vgem_fence_open(struct vgem_file *vfile)
> >  {
> >  	mutex_init(&vfile->fence_mutex);
> > -	idr_init(&vfile->fence_idr);
> > +	idr_init_base(&vfile->fence_idr, 1);
> >  
> >  	return 0;
> >  }
> > -- 
> > 2.25.1
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
