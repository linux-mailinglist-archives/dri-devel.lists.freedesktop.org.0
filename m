Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0965D36B684
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 18:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3016E848;
	Mon, 26 Apr 2021 16:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026246E848
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 16:11:14 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q9so2310999wrs.6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=COfRB9S9Epg523VzoNjct6swwUl4EfNoWYZEirhIH04=;
 b=MiDkRr/rkNKRfaQtL50KFSPZKLpT0NhbhwtBhYkR2RSnjtDT6G61esZv8CNzL77XDY
 mVfpYu/tlaPY5ROaHkt0IWK41Wp0s3Zr9PgunG6K4e6xeYffvhCoO2CVWB2VQGpcLfjc
 jb72ezY6GB4QlyCA1faK9XBxoPkRT+CQXaeqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=COfRB9S9Epg523VzoNjct6swwUl4EfNoWYZEirhIH04=;
 b=MTy++LAKsZrgEGGhL8xxzScghHQyMXS1iT7gb8IN8tov4jlgbegsaeddMaaMnD8c7j
 ckWQd0YYFKqliz8JgDocFHoBhzm7FTVhyURspnsnDisGTlR0b3f3QeC2cJyppwpt8DWC
 emn3+4du9z86itEe7q6y+QF69SWCCSxXIt5t6DCsZkauKMaYw7+0/DYE3tA6TSQlXDjY
 +PkBO5Xtfo3KvanU0JQ0RaUZGHDWZhrdl3xsq2A5Af+FaUtuYxRfMt/cAftWeuMMdQlg
 O3xeeoXNbJ0Jg780pHnBEWdrk+hvDqeZu5T0rD6ow6fpaZhctRsPicBrYgQG01caoUFn
 t+aA==
X-Gm-Message-State: AOAM5309LAYHurE72iiJNL8KmTRK3yaAdI4V3Ih/Ld4J2q7UxLzLjuVe
 BgcljMSjUL3hJCFZoQU6uF5Xkg==
X-Google-Smtp-Source: ABdhPJwc2rpA7kGyS3M7vk2qgdJVbXMQosgHqQrAzeT6Rp26wRUrSfuptzZZj0Tse9aMDCU15m/v4w==
X-Received: by 2002:adf:e602:: with SMTP id p2mr10001538wrm.119.1619453473712; 
 Mon, 26 Apr 2021 09:11:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u9sm18469548wmc.38.2021.04.26.09.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 09:11:13 -0700 (PDT)
Date: Mon, 26 Apr 2021 18:11:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [Outreachy kernel] Re: [PATCH] drm/amd/amdgpu/amdgpu_drv.c:
 Replace drm_modeset_lock_all with drm_modeset_lock
Message-ID: <YIbmH4LXzIej62su@phenom.ffwll.local>
References: <20210422155951.6314-1-fmdefrancesco@gmail.com>
 <20210422165034.GP3596236@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210422165034.GP3596236@casper.infradead.org>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: David Airlie <airlied@linux.ie>, Melissa Wen <melissa.srw@gmail.com>,
 outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 22, 2021 at 05:50:34PM +0100, Matthew Wilcox wrote:
> On Thu, Apr 22, 2021 at 05:59:51PM +0200, Fabio M. De Francesco wrote:
> > -		drm_modeset_lock_all(drm_dev);
> > -
> >  		drm_for_each_crtc(crtc, drm_dev) {
> > +			drm_modeset_lock(&crtc->mutex, NULL);
> >  			if (crtc->state->active) {
> >  				ret = -EBUSY;
> > -				break;
> >  			}
> > +			drm_modeset_unlock(&crtc->mutex);
> > +			if (ret < 0)
> > +				break;
> >  		}
> >  
> > -		drm_modeset_unlock_all(drm_dev);
> > -
> 
> I might remove the {} around ret = -EBUSY, but this is good.
> 
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Yup patch looks good, but it's not cc'ed to drm/amdgpu maintainers/m-l, so
likely won't get picked up. Can you pls check scripts/get_maintainers for
anything you've missed, add those and resend with Willy's r-b tag
included?

Then Alex can pick it up for merging.

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
