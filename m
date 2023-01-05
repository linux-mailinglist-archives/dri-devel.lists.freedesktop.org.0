Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 984D865ED50
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342CA10E0C3;
	Thu,  5 Jan 2023 13:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C1410E0C3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 13:39:49 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so1323015wms.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 05:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=g/rd6nvQ6Pv+iBEM2By9Otjyq6JTSo2pc6HcEIJrEK4=;
 b=XwhpNCk2yJo6xn/4JrEQDCPUTVwO81caZKtpjlubWhoU02MO/OFl0duw1qJq4illGt
 jnSA8bTyG0hNzcwf//0lyWh9Eqf5mey2HSC97G276jrVY2zDgX5Vb9hh3pF/MDm00Byh
 Z5J4b8Qswk0KKMdkzTISoxQ/IKUa3pz15avzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g/rd6nvQ6Pv+iBEM2By9Otjyq6JTSo2pc6HcEIJrEK4=;
 b=qvAqHaf+59jLanVRUFQYdOfNCFCaq0Iv3azWj0wnzZtcg9CcN7r0JY9fzS9exroe+E
 9JaB6QKXALnfsmKmommh6tl6dDuFAn3GvAj9aERR9kng413dsbgjSFEHMqUz5QgoRH96
 o2lhmBNSH0b8VpYbaGoO+3+T9pnZoWMwcctaoNNjVGr7hLUyNlS5DZOTwCu97LhlLp8C
 BHluTcMK7hJzK+uOGeXHN5RP8ljkrIFZgncYAaS5GTvlSVsSSdV5JnnxjMZIy2Jg6/vf
 8ONVWe89yAdNBCu8L9y6bfTrNrkwwxCHARh+mAxWi8o5mCd664QHXdftSFFSfhBSvJhQ
 4Kww==
X-Gm-Message-State: AFqh2komA8sVrgu/6DSFOC8gUhrxGP9B9ixZVIeOqlUgTYRFnHf75bzr
 Mc/lfq6fG6JyNociAKrkUHdD+Q==
X-Google-Smtp-Source: AMrXdXscQMpynVxUUjK5MDlrZOIvW4hu7SgqU2KAOIZWQEY1XnCXRdIFFiAUOSWr/vLUyzkXQ04dwA==
X-Received: by 2002:a05:600c:4e51:b0:3cf:7b8b:6521 with SMTP id
 e17-20020a05600c4e5100b003cf7b8b6521mr35678939wmq.32.1672925987873; 
 Thu, 05 Jan 2023 05:39:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 fj15-20020a05600c0c8f00b003cf894dbc4fsm2464930wmb.25.2023.01.05.05.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 05:39:47 -0800 (PST)
Date: Thu, 5 Jan 2023 14:39:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm: document better that drivers shouldn't use
 drm_minor directly
Message-ID: <Y7bTIZz3CFnUxOnJ@phenom.ffwll.local>
References: <20230104211754.1967591-1-daniel.vetter@ffwll.ch>
 <87eds9w3ye.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87eds9w3ye.fsf@intel.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Maxime Ripard <maxime@cerno.tech>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 02:39:21PM +0200, Jani Nikula wrote:
> On Wed, 04 Jan 2023, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > The documentation for struct drm_minor already states this, but that's
> > not always that easy to find.
> >
> > Also due to historical reasons we still have the minor-centric (like
> > drm_debugfs_create_files), but since this is now getting fixed we can
> > put a few more pointers in place as to how this should be done
> > ideally.
> 
> Care to expand on the vague "this is now getting fixed" part a bit?
> 
> I've seen the "Introduce debugfs device-centered functions" series from
> Maíra, but that doesn't solve everything. Not everything can use
> drm_debugfs_add_file().

Yeah this is only step 1 of the entire project, there's still more in the
todo entry:

https://dri.freedesktop.org/docs/drm/gpu/todo.html#clean-up-the-debugfs-support

We need the same trick on the connector and crtc too. I think with those
we should have most things covered?
-Daniel

> 
> BR,
> Jani.
> 
> >
> > Motvated by some discussion with Rodrigo on irc about how drm/xe
> > should lay out its sysfs interfaces.
> >
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Wambui Karuga <wambui.karugax@gmail.com>
> > Cc: Maíra Canal <mcanal@igalia.com>
> > Cc: Maxime Ripard <maxime@cerno.tech>
> > Cc: Melissa Wen <mwen@igalia.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  include/drm/drm_device.h | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > index 9923c7a6885e..b40e07e004ee 100644
> > --- a/include/drm/drm_device.h
> > +++ b/include/drm/drm_device.h
> > @@ -87,10 +87,23 @@ struct drm_device {
> >  	 */
> >  	void *dev_private;
> >  
> > -	/** @primary: Primary node */
> > +	/**
> > +	 * @primary:
> > +	 *
> > +	 * Primary node. Drivers should not interact with this
> > +	 * directly. debugfs interface can be registered with
> > +	 * drm_debugfs_add_file(), and sysfs should be directly added on the
> > +	 * hardwire struct device @dev.
> > +	 */
> >  	struct drm_minor *primary;
> >  
> > -	/** @render: Render node */
> > +	/**
> > +	 * @render:
> > +	 *
> > +	 * Render node. Drivers should not interact with this directly ever.
> > +	 * Drivers should not expose any additional interfaces in debugfs or
> > +	 * sysfs on thise node.
> > +	 */
> >  	struct drm_minor *render;
> >  
> >  	/**
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
