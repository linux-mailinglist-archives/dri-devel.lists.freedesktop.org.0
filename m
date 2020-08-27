Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D89253B75
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 03:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D606EB19;
	Thu, 27 Aug 2020 01:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32526EB19
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 01:36:00 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id 2so1764679pjx.5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 18:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tlC/+/SpJq/gEyHfo2diqDILfgKApvrsh0PsGIBMc+4=;
 b=F0gMkuReGQbSx65xtT4sb74tnxPGH/0BVFg2AZf4lSQVrysQhb1IX88Ox9HHzy4tBf
 PFYJ2DW28gRPElrbOcE4g//XLmWtK6gGaalvAo3K1CWnNtBIeGGw4coAC3oY5AmkMckb
 bnmNnFG7nsa7f42mS97qvSR4FVSQOZcT7V8gDAGPlE9x4JeyZLa/RsU1auMgLRHZWqbj
 /aAg974ovm9pSzybKIQZtGW15F9Z55Ehq/fjKCiEq8BIjskA/3Ddv6EWoG6JreHwWrdz
 OglXYPqScrzp11EQL5zHLMLO+W7rT0pJccaNIkK6gH+y8GKkPSuroLqR0Q5nfWElKoxM
 Nkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tlC/+/SpJq/gEyHfo2diqDILfgKApvrsh0PsGIBMc+4=;
 b=ce9i7O6oQG5gX81dVlkKzRAEy/ICHLHjfxP4KmwqkFEVKRDKRWQ4ElLFyaX4FXnRyd
 HKxKcycVlNaCUMBg3phIwrjP7TqdzjEOD4wyrOzBq66oai1RcPMIJE+Eok8ATjGy22C5
 ds3CqihyvXWGtIFLTQqnVC94n2iC8XJUTAQbwi4byMKEHbcmDwDj6vWuckMPL2y9wTeS
 agd740ofqAWFTAhiIlZGh1SDqYCWmN2sgQ9+T8xk8OdtnkkkhSJ3s5nxuTfX6x2bH4zW
 xpMbCyRzu20irU0myS+Qh79rXzuezHJegKlgVyrsphHrwqzEwY3l+B87NfViMuCH/AvY
 6acg==
X-Gm-Message-State: AOAM530jAIXbyUPUn9EdzN7Dz8ttFHOpky4imYIIn5dLEbZ2ygDy7hh0
 B4vrHIjDqHTJgTsMDA5eWtQ=
X-Google-Smtp-Source: ABdhPJwmfF/+ExDZk3eCccDn5bgvikjAKZRja9OXGsCPSa+dT2D347I5xZsEHHg5+cYvZZxqC5mxXQ==
X-Received: by 2002:a17:90a:a883:: with SMTP id
 h3mr8446079pjq.127.1598492160519; 
 Wed, 26 Aug 2020 18:36:00 -0700 (PDT)
Received: from realwakka ([61.83.141.80])
 by smtp.gmail.com with ESMTPSA id x9sm259043pgi.87.2020.08.26.18.35.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 26 Aug 2020 18:35:59 -0700 (PDT)
Date: Thu, 27 Aug 2020 01:35:49 +0000
From: Sidong Yang <realwakka@gmail.com>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH] drm/vkms: fix warning in vkms_get_vblank_timestamp
Message-ID: <20200827013549.GA7953@realwakka>
References: <20200825144248.1751-1-realwakka@gmail.com>
 <20200826204954.u6aqwcmwpsudrkh4@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826204954.u6aqwcmwpsudrkh4@smtp.gmail.com>
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
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 26, 2020 at 05:49:54PM -0300, Melissa Wen wrote:

Hi Melissa!
Thanks for review.

> Hi Sidong,
> 
> Thanks for this patch.
> 
> The code looks good to me; however, I see some issues in the patch
> format and commit message. Please, see inline comments.
> 
> On 08/25, Sidong Yang wrote:
> > From: Sidong Yang <realwakka@gmail.com>, Haneen Mohammed <hamohammed.sa@gmail.com>
> 
> You need to fix the Author name.

Oops. 

> > 
> > When vkms_get_vblank_timestamp() is called very first time without
> > enabling vblank before, vblank time has just intial value and it makes
> > warning message. this patch prevents warning message by setting vblank
> > time to current time.
> 
> I consider *fix* a somewhat strong term to this change. In my opinion,
> it would be better to choose another term in the commit message like
> *avoid* timestamp warning when vblanks aren't enabled.

It's good to me. Next patch need to be more explicit.

> 
> In the body of the commit message, I think interesting to include the
> exactly warning message that this patch addresses. You could also
> describe the initial values that triggers this warning and why this
> approach is reasonable, as VKMS has fake clocks.

Yeah, It will be more comprehensive patch if there is description in detail.
I'll work for next patch!

Thanks.
-Sidong

> 
> > 
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Cc: Melissa Wen <melissa.srw@gmail.com>
> > 
> > Signed-off-by: Sidong Yang <realwakka@gmail.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_crtc.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > index ac85e17428f8..09c012d54d58 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -86,6 +86,11 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
> >  	struct vkms_output *output = &vkmsdev->output;
> >  	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
> >  
> > +	if (!READ_ONCE(vblank->enabled)) {
> > +		*vblank_time = ktime_get();
> > +		return true;
> > +	}
> > +
> 
> Apart from issues in commit message and format, I checked the code and it
> works fine.
> 
> Reviewed-by: Melissa Wen <melissa.srw@gmail.com>
> 
> >  	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
> >  
> >  	if (WARN_ON(*vblank_time == vblank->time))
> > -- 
> > 2.17.1
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
