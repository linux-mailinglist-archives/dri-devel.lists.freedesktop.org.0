Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259D713888D
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 23:48:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD0F89916;
	Sun, 12 Jan 2020 22:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E4389916
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2020 22:48:31 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id n96so3343288pjc.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2020 14:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=m00+JFtx0F5Dn+QU1onhVVva113ya7ONGht6wxKkj1Q=;
 b=IG3ORHS2Q6CepRzyqTmubTmsJND0iniUiWe0k2A+0DHgzeuQwDcy5XNr1gIS4alezn
 y6kXy45ESyCWRTMC9ZXiDhcRtXE79yXHd5UryOG2rW+M8uVePNYgzqnMNJ37hRGLcYe2
 vqgZm8L13bAkXtvEx++euqU8bsFKWMCPGppP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m00+JFtx0F5Dn+QU1onhVVva113ya7ONGht6wxKkj1Q=;
 b=PV8iw64daB14T8osflPpYMqVvrJ0oqeBGUtY5FhQeDltwJKsHE1J/ymRr/pLHxCquR
 mpNNT5xnN0XdJb3yTcE5UByu5BY9MWN4OTgdsNJz8Efy9P+13Tz0kFh4Go+s4/UUJrP6
 LjDOE8aA6zNABiSOuSX55Ei2JLHOPvO7DVwhH26joNP2RoD/7SIEcA4GlQ5ga7oqRZ9T
 hVl5lbw9rIKR5i8Rf+CG8D+bUHcD6k1eSyea6vqo3UiVw3UXWs+94KjqXlMFdqcgaOak
 Y7dlJoN4hY51OlckpOzhbZZBJxGonjtXQq0t7P/E2f7LUFqSna6wN7tMBDDuEmRa77f+
 uokg==
X-Gm-Message-State: APjAAAXruGVrenbusfWstHQ8OVL3AxGbwImwF42vrdVMy89Y+tZZkSaO
 MOeQl3Q9/Ptz4LD0azUvG+jypA==
X-Google-Smtp-Source: APXvYqxLock9GxP/2msi8cZNiiK7GRKX+6CLYoVtBL7r5ZlaqlLRqn/Q84saS/1trH+bHOqngrugUg==
X-Received: by 2002:a17:902:8a83:: with SMTP id
 p3mr17933180plo.56.1578869310580; 
 Sun, 12 Jan 2020 14:48:30 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([138.44.248.126])
 by smtp.gmail.com with ESMTPSA id b21sm12007483pfp.0.2020.01.12.14.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2020 14:48:29 -0800 (PST)
Date: Sun, 12 Jan 2020 23:48:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 2/2] drm/print: document DRM_ logging functions
Message-ID: <20200112224823.GB5340@dvetter-linux.ger.corp.intel.com>
References: <20200102221519.31037-1-sam@ravnborg.org>
 <20200102221519.31037-3-sam@ravnborg.org>
 <20200107160852.GD43062@phenom.ffwll.local>
 <20200107181752.GA20555@ravnborg.org>
 <20200108184920.GI43062@phenom.ffwll.local>
 <20200108200416.GA32453@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108200416.GA32453@ravnborg.org>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Joe Perches <joe@perches.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 08, 2020 at 09:04:16PM +0100, Sam Ravnborg wrote:
> Hi Daniel.
> > > > 
> > > > I'd replace the entire block with a "This stuff is deprecated" warning. We
> > > > have at least a corresponding todo.rst entry.
> > > 
> > > We have many situations where no drm_device is available.
> > > At least when you a buried in drm_panel patches.
> > > 
> > > So it is either DRM_DEV_ERROR() or drv_err().
> > > Which is why I have pushed for nicer drm_ variants of these...
> > 
> > Huh, drm_panel indeed has no drm_device. And I guess we don't have a
> > convenient excuse to add it ...
> > 
> > > The todo entry only covers the nice new macros that Jani added
> > > where we have a drm_device.
> > 
> > I wonder whether for those cases we shouldn't just directly use the
> > various dev_* macros?
> 
> We would miss the nice [drm] marker in the logging.
> So [drm] will be added by the drivers and the core - but not the panels.
> That is the only drawback I see right now.
> 
> Which was enough justification for me to add the drm_dev_ variants.
> Feel free to convince me that this is not justification to add these
> variants.

tbh I don't mind, I just don't want to have a massive proliferation of drm
debugging functions, all kinda alike but not the same. If we can settle on
some color choice for this bikeshed and actually reduce the not-longer
favoured version, I'm pretty much ok with anything.

> In drm/panel/* there is no use of DRM_DEBUG* - and there is no
> reason to introduce the variants we can filer with drm.debug.
> 
> There is a single DRM_DEBUG() user, which does not count here.
> 
> 
> We could introduce only:
> 
> drm_dev_(err|warn|info|debug) - and not the more specialized variants.
> 
> Then we avoid that people make shortcuts and use drm_dev_dbg_kms() when
> they are supposed to use drm_dbg_kms().
> This was one of the very valid argumest against the patch that
> introduced all the drm_dev_* variants.

Hm, if you want something for panels, what about a drm_panel_* set of
functions? Plus ofc patches to just roll them out everywhere (it should be
a simple sed/cocci job, drm/panel/* isn't that big). Some churn, but yay!
for consisteny at least.

If we have another set of generic drm debug/logging functions then I think
consistency is going to take a big toll, and we're already bad with this.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
