Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A3365458C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 18:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8D710E167;
	Thu, 22 Dec 2022 17:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78D810E167
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 17:20:55 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id bx10so2362325wrb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 09:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=k0FoTFEwPbHS38tnlQkZqCUXav2AP7lFDDJSUK+RY80=;
 b=br2h+ZHC3mA4kHHuByrdwRUONHvWV30tn7OlHyGljaCr6k1Af1osCauBro3YitEhf2
 uyD8Lhq7VPlyFvuVcw5hRPWeGUSmZAN3b9SCpKqYxOCG7R4Z/qpfaPiZI/4+gW5PrRii
 XEYpFwb7G4+KAB134Gk07e8C73WiQk/X3mHhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k0FoTFEwPbHS38tnlQkZqCUXav2AP7lFDDJSUK+RY80=;
 b=Yum4b8RBOOzF/ZFlEdwGOmp+kX/1fQjFKyllj0HbmAk/cu/zdHGPvB2X97utvt1ACm
 BUkibSgwEG45UVpII4QsCKniXde6q31pVTA98K5EGBxKZHhcUMLbsTyRsC/cFR3eFMnd
 tWx3SEXDv4oDToltBeCXSRtCYzFhGTRSG98aB8GG+DWxJAxhGC07HLc+a4sG+gDUazSC
 8sSFYslQ57MLl/0gz2y3bK6cS2amZtoB27qtWwyyCysnG9WJEAxK+rqdcVccjnb71DR9
 BBm5T4x8vvjl47J5cwcQJmcmM6ZYnmiVpwT5owU0aFcjwCZyX3C4Pqzgwe4YjZbXUxPh
 AN/A==
X-Gm-Message-State: AFqh2kpt//wIqrUBzpIviKO7VQTGuyXhdDwGLehZIC//hUDaGEFTjYbh
 147DHTi34mANs537H4MkfHYwJQ==
X-Google-Smtp-Source: AMrXdXtgeEHhvfZ7mKv+Tp4bHG01VoHd3EzZwRnQinmIOYZAnKs5C5XGLRxerTim96samVGEKTycLw==
X-Received: by 2002:a05:6000:606:b0:242:d4f:96c with SMTP id
 bn6-20020a056000060600b002420d4f096cmr4200175wrb.0.1671729653560; 
 Thu, 22 Dec 2022 09:20:53 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 v26-20020a5d591a000000b0025d9d13c7e1sm986116wrd.105.2022.12.22.09.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 09:20:52 -0800 (PST)
Date: Thu, 22 Dec 2022 18:20:50 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH v4 0/7] Introduce debugfs device-centered functions
Message-ID: <Y6SR8iRMHyhDQ4JZ@phenom.ffwll.local>
Mail-Followup-To: Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Oded Gabbay <ogabbay@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Wambui Karuga <wambui@karuga.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20221219120621.15086-1-mcanal@igalia.com>
 <20221219124947.vk5y3o2tdxhqu7s5@mail.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221219124947.vk5y3o2tdxhqu7s5@mail.igalia.com>
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
Cc: dri-devel@lists.freedesktop.org,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Oded Gabbay <ogabbay@kernel.org>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, Wambui Karuga <wambui@karuga.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 19, 2022 at 11:49:47AM -0100, Melissa Wen wrote:
> On 12/19, Maíra Canal wrote:
> > This series introduces the initial structure to make DRM debugfs more
> > device-centered and it is the first step to drop the
> > drm_driver->debugfs_init hooks in the future [1].
> > 
> > Currently, DRM debugfs files are created using drm_debugfs_create_files()
> > on request. The first patch of this series makes it possible for DRM devices
> > for creating debugfs files during drm_dev_register(). For it, it introduces
> > two new functions that can be used by the drivers: drm_debugfs_add_files()
> > and drm_debugfs_add_file(). The requests are added to a list and are created
> > all at once during drm_dev_register(). Moreover, the first patch was based on
> > this RFC series [2].
> > 
> > The main difference between the RFC series and the current series is the
> > creation of a new fops structure to accommodate the new structs and, also,
> > the creation of a new drm_debugfs_open. Moreover, the new series uses
> > device-managed allocation, returns memory allocation errors, and converts
> > more drivers to the new structure.
> > 
> > Moreover, since v3, the ability to create debugfs files at late_register hooks was
> > added. In previous versions, modeset components weren't able to create debugfs
> > files at late_register hooks as the registration of drm_minor happens before the
> > registration of the modeset abstractions. So, the third patch fixes this problem
> > by adding a drm_debugfs_late_register() function. Thanks to Melissa Wen for
> > catching this problem!
> > 
> > Apart from the third patch, the series looks similiar from its last version.
> > 
> > [1] https://cgit.freedesktop.org/drm/drm/tree/Documentation/gpu/todo.rst#n506
> > [2] https://lore.kernel.org/dri-devel/20200513114130.28641-2-wambui.karugax@gmail.com/
> > 
> > Best Regards,
> > - Maíra Canal
> > 
> > ---
> > 
> > v1 -> v2: https://lore.kernel.org/dri-devel/20221122190314.185015-1-mcanal@igalia.com/T/#t
> > 
> > - Fix compilation errors in the second patch (kernel test robot).
> > - Drop debugfs_init hook from vkms (Maíra Canal).
> > - Remove return values and error handling to debugfs related
> > functions (Jani Nikula).
> > - Remove entry from list after the file is created, so that drm_debugfs_init
> > can be called more than once (Maíra Canal).
> > 
> > v2 -> v3: https://lore.kernel.org/dri-devel/20221123220725.1272155-1-mcanal@igalia.com/
> > 
> > - Rebase on top of drm-misc-next
> > 
> > v3 -> v4: https://lore.kernel.org/dri-devel/20221207132325.140393-1-mcanal@igalia.com/
> > 
> > - Add Maxime's Reviewed-by tags
> > - Add the ability to create debugfs files at late_register hooks (Melissa Wen).
> 
> Hi Maíra,
> 
> Thanks for addressing all comments.
> 
> Maybe Danvet has some inputs for the late_register approach.

I think as a stop-gap (really need to get this stuff landed so people can
start to use it) this is ok, but long term I think the right fix is to
roll out the same pre-register infrastructure for connector and crtc too.
That way drivers don't need to split their setup code into init and
register anymore, which is the point of this entire rework.

If you want, you can adjust the todo accordingly, but we do already have
the paragraph about connector/crtc.

But we can do that later on, because this is definitely a great way
forward. Thanks a lot for pushing this forward!

> Anyway, LGTM and the entire series is:
> 
> Reviewed-by: Melissa Wen <mwen@igalia.com>

On the series: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> > 
> > ---
> > 
> > Maíra Canal (7):
> >   drm/debugfs: create device-centered debugfs functions
> >   drm: use new debugfs device-centered functions on DRM core files
> >   drm/debugfs: create debugfs late register functions
> >   drm/vc4: use new debugfs device-centered functions
> >   drm/v3d: use new debugfs device-centered functions
> >   drm/vkms: use new debugfs device-centered functions
> >   drm/todo: update the debugfs clean up task
> > 
> >  Documentation/gpu/todo.rst            |   9 +--
> >  drivers/gpu/drm/drm_atomic.c          |  11 ++-
> >  drivers/gpu/drm/drm_client.c          |  11 ++-
> >  drivers/gpu/drm/drm_debugfs.c         | 102 +++++++++++++++++++++++---
> >  drivers/gpu/drm/drm_drv.c             |   3 +
> >  drivers/gpu/drm/drm_framebuffer.c     |  11 ++-
> >  drivers/gpu/drm/drm_gem_vram_helper.c |  11 ++-
> >  drivers/gpu/drm/drm_internal.h        |   5 ++
> >  drivers/gpu/drm/drm_mode_config.c     |   2 +
> >  drivers/gpu/drm/v3d/v3d_debugfs.c     |  22 +++---
> >  drivers/gpu/drm/vc4/vc4_bo.c          |  10 +--
> >  drivers/gpu/drm/vc4/vc4_crtc.c        |   7 +-
> >  drivers/gpu/drm/vc4/vc4_debugfs.c     |  36 ++-------
> >  drivers/gpu/drm/vc4/vc4_dpi.c         |   5 +-
> >  drivers/gpu/drm/vc4/vc4_drv.c         |   1 -
> >  drivers/gpu/drm/vc4/vc4_drv.h         |  32 ++------
> >  drivers/gpu/drm/vc4/vc4_dsi.c         |   6 +-
> >  drivers/gpu/drm/vc4/vc4_hdmi.c        |  12 +--
> >  drivers/gpu/drm/vc4/vc4_hvs.c         |  24 ++----
> >  drivers/gpu/drm/vc4/vc4_v3d.c         |  14 +---
> >  drivers/gpu/drm/vc4/vc4_vec.c         |   6 +-
> >  drivers/gpu/drm/vkms/vkms_drv.c       |  17 ++---
> >  include/drm/drm_debugfs.h             |  41 +++++++++++
> >  include/drm/drm_device.h              |  15 ++++
> >  24 files changed, 233 insertions(+), 180 deletions(-)
> > 
> > -- 
> > 2.38.1
> > 



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
