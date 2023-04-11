Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9116DDDB4
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 16:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094BC10E344;
	Tue, 11 Apr 2023 14:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B91410E33D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 14:25:28 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f0769b0699so247085e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 07:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681223127;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nPl52zwZFqxFoLbQW3KmJiSTSJqHgYxpwyxrA8GGUVI=;
 b=aou7CDIrnNiNpRZ9vrXCkgg9JQSL8DyPPKGiBu7gOtvSFEu3i1aIK7uo7jYY9nu5PL
 QViPwUe67gMScvFwVG6h0pAT1DdDtr4aiabj0CRfwzxcoNGWEfqyeYQUWcFMZOpdvnT1
 2/EqP3ka6kgSyVhAt0WKyAEB41yaTZN+aerf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681223127;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nPl52zwZFqxFoLbQW3KmJiSTSJqHgYxpwyxrA8GGUVI=;
 b=boYJ13i+gB3QtbqZrHjZ48Zfqr8ftHvBGQfU/M6L8KkbHPi1ohMe1+JRJSih39eGR6
 AWJuggLYicLp8PGvBFCrkEdWaWhCQPeruUYD0fTFYI6ZDvbm/g2UAr6SBR57PjnbaDPo
 tKNbV8cVTZLp3EUh8ndyvYemFUTHfzex2be+W1myxZjgnrpE7VOvCqcPw6/XQkE0Hpr9
 LpU3ZjtzXA/0Fpyy863ibRyl7h+uSiMu1zgGOxFz8ar/zn6+YXUQuUS24CMK3J0SuAvE
 JfP9K6M+sz3r3GKzM+DziR5ecHPOQVXW2uCSSkmvdHt2kA8WyhvIot5gKmC0thSPDw21
 xzrQ==
X-Gm-Message-State: AAQBX9d3inNsHdRH1nwG134xRkpPiVv8aE/WTZHKlUq98Z53C1bQ01Oq
 KplIxJOFpoS5b32p4wblgRl01A==
X-Google-Smtp-Source: AKy350bVqa3FiK6rDx8e6zZqGaQGSFUXTkbWlEiv8uT/S5y7XR09QNJJqNpC+LA2Z2yQSacn3USH9w==
X-Received: by 2002:a05:600c:4709:b0:3f0:84b7:22cf with SMTP id
 v9-20020a05600c470900b003f084b722cfmr6036840wmo.2.1681223126745; 
 Tue, 11 Apr 2023 07:25:26 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b003edc4788fa0sm21560834wmq.2.2023.04.11.07.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 07:25:26 -0700 (PDT)
Date: Tue, 11 Apr 2023 16:25:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] fbmem: Reject FB_ACTIVATE_KD_TEXT from userspace
Message-ID: <ZDVt1Koi39w7aQE8@phenom.ffwll.local>
References: <20230404193934.472457-1-daniel.vetter@ffwll.ch>
 <874jpmtt1v.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874jpmtt1v.fsf@minerva.mail-host-address-is-not-set>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Shigeru Yoshida <syoshida@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 shlomo@fastmail.com, Nathan Chancellor <natechancellor@gmail.com>,
 stable@vger.kernel.org, Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Peter Rosin <peda@axentia.se>,
 Qiujun Huang <hqjagain@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 04:03:24PM +0200, Javier Martinez Canillas wrote:
> Daniel Vetter <daniel.vetter@ffwll.ch> writes:
> 
> > This is an oversight from dc5bdb68b5b3 ("drm/fb-helper: Fix vt
> > restore") - I failed to realize that nasty userspace could set this.
> >
> > It's not pretty to mix up kernel-internal and userspace uapi flags
> > like this, but since the entire fb_var_screeninfo structure is uapi
> > we'd need to either add a new parameter to the ->fb_set_par callback
> > and fb_set_par() function, which has a _lot_ of users. Or some other
> > fairly ugly side-channel int fb_info. Neither is a pretty prospect.
> >
> > Instead just correct the issue at hand by filtering out this
> > kernel-internal flag in the ioctl handling code.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Fixes: dc5bdb68b5b3 ("drm/fb-helper: Fix vt restore")
> 
> [..]
> 
> > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > index 875541ff185b..3fd95a79e4c3 100644
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -1116,6 +1116,8 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> >  	case FBIOPUT_VSCREENINFO:
> >  		if (copy_from_user(&var, argp, sizeof(var)))
> >  			return -EFAULT;
> > +		/* only for kernel-internal use */
> > +		var.activate &= ~FB_ACTIVATE_KD_TEXT;
> >  		console_lock();
> 
> I don't have a better idea on how to fix this and as you said the whole
> struct fb_var_screeninfo is an uAPI anyways...
> 
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for taking a look, merged to drm-misc-fixes.

> 
> -- 
> Best regards,
> 
> Javier Martinez Canillas
> Core Platforms
> Red Hat
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
