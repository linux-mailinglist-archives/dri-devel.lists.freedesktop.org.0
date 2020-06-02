Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B001EB900
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 11:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF4C6E12C;
	Tue,  2 Jun 2020 09:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB40D6E12C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 09:58:45 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c3so2693239wru.12
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 02:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=juism/P9w425eJ+pbYgk66cO66ZcIWuVQV7X4/Z8DxY=;
 b=WbZEwoZYu4n4jTUcPtgsHdGnmASgMo2SKWD9mhCz+eMH8lob/VcGvQfz+j+L9LfID/
 Zn+LLUrh/l6QrCWEP8icB7qK1Z2zDIuoS309jxGTaOlZq5rlLqIMhCaUvYm+b/R3+wtV
 K+4dDjY8X+WsdQwA1qpssNsymq6ZEde8iAvkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=juism/P9w425eJ+pbYgk66cO66ZcIWuVQV7X4/Z8DxY=;
 b=lMuC48jPcH8qDzAz1NncGo4S9BtMuc4S8CRTZ6kQZgHZzb+HK+iR92oRpzZNmQ/HW5
 xe9BZPRhX+VXznIgp4sGc/0K9McnH8JR0q3G1dFB7/lPL2D2UTgz+GlvcdjtJffW5AnR
 6c62NK/LnfeBhABjwxpLZ2ji2dKSctaqBBXEbZjUj0A3fD/YyX+K9Wii2y/AFFlG1ZDL
 nFyga2RhosZ74RmPK85fsWFwSW8DV8BKXtWKm7giUSb/VsrL/xsxlmdf5wVXAc8jO7HH
 XGFd/AzNpav0/NrIR9ChhYFD67I3vZfXrA4Lz5/XMkaqHqX/YocN/Oww5eIBJ+lVLq6p
 o6YA==
X-Gm-Message-State: AOAM531Q/s/WB37Qsph1LoPbHZjBFdH0hecLslp0sx/xWa7WBY6qV+L2
 /dujLNceqzADneAhkQUtoCrGPA==
X-Google-Smtp-Source: ABdhPJxsY7KbfTOi9Aq3LFskTtpOJ1fzwA2VVpivyiYPzqaD/55ZPjZbTGWe4tMuZoCPCDLOBX6sgA==
X-Received: by 2002:adf:f611:: with SMTP id t17mr24636100wrp.69.1591091924530; 
 Tue, 02 Jun 2020 02:58:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s7sm2903400wrr.60.2020.06.02.02.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 02:58:43 -0700 (PDT)
Date: Tue, 2 Jun 2020 11:58:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH] drm: document how user-space should use link-status
Message-ID: <20200602095836.GB20149@phenom.ffwll.local>
References: <krnCwRP0UCcVJbY-8ILP_gEFf4EaUdKPSuuHisFkphFaoOl2EAnU032oOWAeJi2xlsFsA7qeR8lypXs71-SoULZnd2gP5C7ohDEfsWTB5-A=@emersion.fr>
 <20200602103846.5c38d080@eldfell.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602103846.5c38d080@eldfell.localdomain>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Manasi Navare <manasi.d.navare@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 02, 2020 at 10:38:46AM +0300, Pekka Paalanen wrote:
> On Mon, 01 Jun 2020 14:48:58 +0000
> Simon Ser <contact@emersion.fr> wrote:
> 
> > Describe what a "BAD" link-status means for user-space and how it should
> > handle it. The logic described has been implemented in igt [1].
> > 
> > [1]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/fbe61f529737191d0920521946a575bd55f00fbe
> > 
> > Signed-off-by: Simon Ser <contact@emersion.fr>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Manasi Navare <manasi.d.navare@intel.com>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_connector.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index f2b20fd66319..08ba84f9787a 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -994,6 +994,12 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
> >   *      after modeset, the kernel driver may set this to "BAD" and issue a
> >   *      hotplug uevent. Drivers should update this value using
> >   *      drm_connector_set_link_status_property().
> > + *
> > + *      When user-space receives the hotplug uevent and detects a "BAD"
> > + *      link-status, the connector is no longer enabled. The list of available

"no longer enabled" is kinda wrong, you can keep doing pageflip. It's just
that the pixels aren't getting to the screen anymore.

"enabled" wrt an output has a different meaning in kms, the internal
drm_crtc_state->enabled state is very much still set. Including what that
all means for the uapi.

Also I think we need some words here on what automatically happens when
you do an atomic commit with the connector with the bad link status
(auto-reset to good, which might make the atomic modeset fail). On irc we
had some discussions that we should only do this if ALLOW_MODESET is set,
but that's atm not the case.
-Daniel

> > + *      modes may have changed. User-space is expected to pick a new mode if
> > + *      the current one has disappeared and perform a new modeset with
> > + *      link-status set to "GOOD" to re-enable the connector.
> >   * non_desktop:
> >   * 	Indicates the output should be ignored for purposes of displaying a
> >   * 	standard desktop environment or console. This is most likely because
> 
> Hi,
> 
> makes sense to me. Can it happen that there will be no modes left in
> the list?
> 
> What if userspace is driving two connectors from the same CRTC, and only
> one connector gets link-status bad, what does it mean? Is the other
> connector still running as normal, as if the failed connector didn't
> even exist?
> 
> That is mostly a question about what happens if userspace does not fix
> up the link-status=bad connector and does not detach it from the CRTC,
> but keeps on flipping or modesetting as if the failure never happened.
> I guess I could ask it about both a CRTC that has another connector
> still good, and a CRTC where the failed connector was the only one.
> 
> Can I trust that if the other connector is in any way affected, it too
> will get link-status bad?
> 
> 
> Thanks,
> pq



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
