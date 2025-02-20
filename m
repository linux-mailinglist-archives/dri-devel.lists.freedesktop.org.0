Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C93A3D5B4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A7E10E902;
	Thu, 20 Feb 2025 10:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="S3knFB8T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACF610E902
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 10:00:32 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-439a4dec9d5so4352895e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 02:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1740045631; x=1740650431; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7gSnEulNPHGW59kN5NlhcVPq1odJotXpIwPfOlH4gXc=;
 b=S3knFB8T4eP6lKUsPhz10JKwbO8pl1ONqjSWd1mvZv9wzBMHkOrjsBnZnsLAqOOQYc
 6IG055qZMwqDrCYw7tXUMcObqhYBzzyiHIXVM+uXyxmRy7xwerX9AS9OHJ4ipm4+dTDK
 3C1tRPOaBwe+33Na3B7voTPR7qmWSGFvEYSDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740045631; x=1740650431;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7gSnEulNPHGW59kN5NlhcVPq1odJotXpIwPfOlH4gXc=;
 b=aed5K/TbNnaQEhzI0DigsRwV8DKs6wsZ3dQqqFRz5bXatjnQVUoUsKzpaz+7OSCc0M
 LLHSO6fQq33s95PmggoAv2p+AKyUFvOqNCThJrsKUXuGfXpc7koqf7WKnVEyWrrZ3hyi
 r7h5r0tNWk4x/z8PzNNZjIQ7xg5uctNfPMs+AOiqycSvgh6oSY5JuNL8LvIsvfzjpBaA
 MtKlBtQ7ib6vVzUViOp7npgtVY0T0be70UYcYhNZA75WAElG5UBciuyC/bvp815IVevN
 ZE2OW3UTrStUEEycUpaeqegqRKKKCWUnWKzsWJIbN5dStHCB9oJwoK7/HX6v5SHwf83F
 o4Lg==
X-Gm-Message-State: AOJu0YzmwF34VxMvqH52N9n5wr9+Xm+0G+KbOauAnc/LHrkYEKlDx2mT
 R2zpvq20G3PsO4/iZXbEvWXZZnt4y+FvziKkj/iyyld9ralfDf+JwzDaVZvEyHuUDWRpOaeNKXT
 C
X-Gm-Gg: ASbGnctb/TX4cfLrHygCcFq9uBhDxW0YR3wczT+svBp9o04xgnn5NyCX+KMcV/YApc1
 pkfP2YhccRfjSV/68DuOR3E3r9FkgCiIqzcViSJC+YBtZBbVcoyeY3aOGOkB32mWq9rtBxZirH5
 kEkFwJO9IayNBEQfxiJSby9SWs+kmwTu5gvLEnx9o3AeYiKb/8+B2JMzfIwp02rJZDTLqbYNA+l
 ipGlhTdaagYjzmwCKJCD87VhizYHa6g5ncpVbb2VGH2iNMhZxQtP7lXmQ2WJAigNOuAAV/GoPcG
 NhzNZMqcvzDqcZ1xiu511KTXq6U=
X-Google-Smtp-Source: AGHT+IH6VXFG7I7YI20n9sEVCzM1EqLuDUUlC7OOJg5EJY1l1IPCAZhZ9KqyfSoBugjctrkmj3Gb/w==
X-Received: by 2002:a05:600c:4e87:b0:439:9274:81cd with SMTP id
 5b1f17b1804b1-439927484b2mr113239115e9.4.1740045631154; 
 Thu, 20 Feb 2025 02:00:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4399d55fc1asm38775925e9.35.2025.02.20.02.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:00:30 -0800 (PST)
Date: Thu, 20 Feb 2025 11:00:28 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/atomic: Filter out redundant DPMS calls
Message-ID: <Z7b9PD2o6XhfdjWf@phenom.ffwll.local>
References: <20250219160239.17502-1-ville.syrjala@linux.intel.com>
 <Z7b7tSabXeLe1ovT@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7b7tSabXeLe1ovT@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.12.11-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2025 at 10:53:57AM +0100, Simona Vetter wrote:
> On Wed, Feb 19, 2025 at 06:02:39PM +0200, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Video players (eg. mpv) do periodic XResetScreenSaver() calls to
> > keep the screen on while the video playing. The modesetting ddx
> > plumbs these straight through into the kernel as DPMS setproperty
> > ioctls, without any filtering whatsoever. When implemented via
> > atomic these end up as full commits on the crtc, which leads to a
> > dropped frame every time XResetScreenSaver() is called.
> 
> I think you should add here that it's just an empty commit, because we do
> filter out redundant commits where crtc->active_changed does nothing.
> Except we still run the entire machinery with timestamps and drm_event and
> everything.
> 
> And I don't think it's worth to filter that out at the atomic level,
> because it's really only legacy ioctl that had this "complete noop"
> behaviour.
> 
> With the commit message augmented:
> 
> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

Ok, one more thing: Please also augment the dpms property uapi doc text
with a note that we make this guarantee. Otherwise this feels a bit too
much opaque magic. Maybe even a one-liner comment in the code that this is
uapi?
-Sima

> 
> Might also be nice to have a igt for this? Plus also wondering whether we
> should cc: stable it.
> 
> Cheers, Sima
> 
> > Let's just filter out redundant DPMS property changes in the
> > kernel to avoid this issue.
> > 
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_uapi.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> > index 2765ba90ad8f..c2726af6698e 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -957,6 +957,10 @@ int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
> >  
> >  	if (mode != DRM_MODE_DPMS_ON)
> >  		mode = DRM_MODE_DPMS_OFF;
> > +
> > +	if (connector->dpms == mode)
> > +		goto out;
> > +
> >  	connector->dpms = mode;
> >  
> >  	crtc = connector->state->crtc;
> > -- 
> > 2.45.3
> > 
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
