Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B126FB48C
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 17:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EA410E205;
	Mon,  8 May 2023 15:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05C510E205
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 15:59:45 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-75131c2997bso1837227885a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 08:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google; t=1683561584; x=1686153584;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J/ZpRXp+tyyW61bluq8jzhzVmv5ziDlCK2FZwP/rfww=;
 b=Ab75K8Md9PJbO9WcR/aW6ONtkH6/6/t53W6Kl5wb9AtxmR56J6lAFcGqK+rQt2XL0E
 SPbtUgRP6DE8xSpmB5DR1yocoTepGeB4zU/a2hxlg7ze4AVsfoMJ9qKgS+//BkFUoZd8
 jo8rkPwRPjBRDaqfHUWGKARBF7vjcwGmucQbhu8fqSPyXiqX4/DL66HSGLBTiJCE9hK6
 QhwGpU1XUqQ+dApjs/f7QWdylL93sLpWwPqgfdK9F5S2lXrL6577KhnNVojz/VYXucsQ
 kz8dRa2mVmPqSRw73Xit5fTS4ifz8LT9EOtm4Khoc6n2uh+baB6hH+K2QgiHPfvzxDy/
 C5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683561584; x=1686153584;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J/ZpRXp+tyyW61bluq8jzhzVmv5ziDlCK2FZwP/rfww=;
 b=NlVlk1yuQf5xvEAnCGzikCMeCNO4eJxQNJi3RwHgiBi1Fn5RuOxEwgrE2gWQ6sVhxa
 xsBWPE/ffy7ijuWW5yvwG1jtJliHypyJa/Tvx+0JPBU6xm6+UZLWkgGWHOE6xP66H/st
 u4T7HYSWIaySaZrNKvucjHyMwbteZtVvTDGb3pvCMl9dYKxoULIpJWI24Ek7rAp4q27B
 8aspkEYb5p6Jhh+iYLUo4NNar/TQ0Mlfk7oZi+5xSY03sZU4QFNcw4GE0ZfH1T/nFrnu
 30/90kWljznYdYaE0uxiwodi4fuH18UutzkZ2VMy9vo0Ir1bAnh98adtIQhZ3hQYfGAZ
 De6A==
X-Gm-Message-State: AC+VfDwOmFQnZvxDneHafoU3CyFN3yMQwFe+BmKbI0zPaoOC6UfUkTY4
 g+5Xc/qHrrirhhuGNpDTUuPHjw==
X-Google-Smtp-Source: ACHHUZ4px1L54We/nGhvJgspKy5gIPsRkDi8iXRYdKXqniaI2S9jQAh8dmqTz4t2awCxI6Bd0aiN7g==
X-Received: by 2002:ac8:5b88:0:b0:3ef:54c9:16d9 with SMTP id
 a8-20020ac85b88000000b003ef54c916d9mr25621227qta.28.1683561584275; 
 Mon, 08 May 2023 08:59:44 -0700 (PDT)
Received: from localhost (164.146.150.34.bc.googleusercontent.com.
 [34.150.146.164]) by smtp.gmail.com with ESMTPSA id
 6-20020a05620a078600b007578622c861sm525861qka.108.2023.05.08.08.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 May 2023 08:59:43 -0700 (PDT)
Date: Mon, 8 May 2023 15:59:42 +0000
From: Sean Paul <sean@poorly.run>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] Documentation: vkms: clarify devres managed refernce
 cleanup
Message-ID: <ZFkcbqpefJenykqU@art_vandelay>
References: <20230425080240.3582324-1-brpol@chromium.org>
 <ZEpIKnDwy/XNEnfY@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZEpIKnDwy/XNEnfY@phenom.ffwll.local>
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
Cc: Brandon Pollack <brpol@chromium.org>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 27, 2023 at 12:02:18PM +0200, Daniel Vetter wrote:
> On Tue, Apr 25, 2023 at 08:02:40AM +0000, Brandon Pollack wrote:
> > added documentation to drm_dev_unregister clarifying that devres managed
> > devices allocated with devm_drm_dev_alloc do not require calls to
> > drm_dev_put.
> > 
> > Signed-off-by: Brandon Pollack <brpol@chromium.org>
> > 
> > ---
> > 
> > This is my first patch to any tree.  I've tried my best to read as many
> > kernel docs etc as possible (wip). This took me a moment to realize so I
> > figured it was as good a candidate as any for a first patch (at the very
> > least to make sure I have the whole patching process figured out).  I
> > hope to make more janitorial changes as I continue to learn leading up
> > to the work I hope to do.
> > 
> > We're hoping to add multiple display hotplug output support to VKMS for
> > testing purposes.  Some work has been done already, but we'll be taking
> > over moving forward.  Our intent is to remain involved and assist in
> > maintaining these changes.
> > 
> > Looking forward to your comments/advice (now and henceforth!)
> 
> Looking good!
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Since you're @chromium.org I'm assuming that one of the cros committers
> will push this to drm-misc-next. If not please holler.

Applied to drm-misc-next, thank you for the review.

Sean


> -Daniel
> 
> > ---
> >  drivers/gpu/drm/drm_drv.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index cee0cc522ed9..12687dd9e1ac 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -969,7 +969,9 @@ EXPORT_SYMBOL(drm_dev_register);
> >   *
> >   * Unregister the DRM device from the system. This does the reverse of
> >   * drm_dev_register() but does not deallocate the device. The caller must call
> > - * drm_dev_put() to drop their final reference.
> > + * drm_dev_put() to drop their final reference, unless it is managed with devres
> > + * (as devices allocated with devm_drm_dev_alloc() are), in which case there is
> > + * already an unwind action registered.
> >   *
> >   * A special form of unregistering for hotpluggable devices is drm_dev_unplug(),
> >   * which can be called while there are still open users of @dev.
> > -- 
> > 2.40.0.634.g4ca3ef3211-goog
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Sean Paul, Software Engineer, Google / Chromium OS
