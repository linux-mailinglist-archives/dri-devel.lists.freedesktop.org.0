Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4A2A23B71
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 10:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5277B10EA5B;
	Fri, 31 Jan 2025 09:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZyQSwlWV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EE210EA7A
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 09:31:06 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-385ef8b64b3so1568032f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 01:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738315865; x=1738920665; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1kxhzuUeglb9nFORXt7iPwS4YLKVU/NOi7k6DS6FShc=;
 b=ZyQSwlWVKGs6qKJkiZfjeErvqQGk064loKRsIm7UkXuVHiWW0bNa377EQmkMSKLBsb
 1BkaFQHsMQX5puml08AIXZCM1HKLki2Dm0zfXw7bvYYTBIAwr/2PR5brBHgnXnc33h87
 2KTJrMPQRySHndqvGjyBQb4VnZUSZ8HMxulDlxZPnvZlDbSUPA9bQIlQ95jzC/9dSs0f
 V6xz0xhLEh8LAKwALXhZXG4S8hERyOmR4Jtb9STQb3n/5ACa5AebljgeIKVk+eEHxPAQ
 as+24lSbjxaSVs79Zsulg4eZDwBD0He0tvP9NAPH1vwe5ysjR6iXsz4tbCrkCET8CQ8c
 40tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738315865; x=1738920665;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1kxhzuUeglb9nFORXt7iPwS4YLKVU/NOi7k6DS6FShc=;
 b=fPt/uqjUWY7+yOGplXXVnxg7fcRW5h9VyzyCx9+jF1ce3xK9ABWhnPqrEJo2ZhelvQ
 tBoC7ySWBehIWX+7eY7wNemjnUvcvKlaCSWU/5bknjJgUj375EE1uNLTPEHl/GQ+BqeN
 ux8YwUnLYIbDu7jn/bzwju5NuXP0W27cl4zfMGjVBN1NT5Xbg8sPRmT3UG+dL7UrK4x+
 DX3TylVXf3aab7Z9bKrdnyF2tFtYidz3kM4EXZMBqUjjoNCEVcwYP+4tvGzzOA1GUq8E
 INQK+2CWdDx0J8KxRu7/801oC9r0/X/2REikdohtHq00ysQ0DjJChKfVKocHXL752LaX
 fEfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBQnVtDLplLkniC7En9HVnsBtxFhrLSLq3L0/teoN1tKEKQOz6ij7g4z68v6u/zCTuPQmzJIKuH90=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjrfqvnlRLUMEJXbTjq55ZJUp9zmki75wOLvH7MC3J1BEeBZWj
 180lMynE1TPEHEWKbw1MXFjq+QOxsB3CPUl6q7KOjqjuB582vmA4
X-Gm-Gg: ASbGncv8O6YO2NzHDDmH+v6WvnjtCaJGm8/jVtR9bDCY8SGUhQTG/p4VDOYSw7rtl4i
 gOBF0Mw0RldfA+9ILVXkY29oyVRUkSzUyLsd+w6urYZVsZr06HCFz29kyajcOWenkxt5RcQaizH
 J7h7wHBdUL/42RwBN7STB9hvBdEgKxD53oHrBD612jqJaUNGPLWl3g0bTBNMj2H8XxSfQ5Nilck
 VDB5bKiNFphnHRFyUKM3NpLfL+zZGpGbGtyngzF4UmDanrswZANUivE4lr/lN9VGu78ZyhvZ1W4
 o6qzgi/auMFjkw==
X-Google-Smtp-Source: AGHT+IHs4EJTjlgvHff8M6ItcijQQShzwQxvg3UpEeMc06NagqBZCDdIDmq3gNcF/MGKtJx8mML5Bw==
X-Received: by 2002:adf:e6cf:0:b0:38b:f04c:25e6 with SMTP id
 ffacd0b85a97d-38c519447bdmr7328486f8f.14.1738315864499; 
 Fri, 31 Jan 2025 01:31:04 -0800 (PST)
Received: from fedora ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc26d6fsm83654125e9.14.2025.01.31.01.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 01:31:03 -0800 (PST)
Date: Fri, 31 Jan 2025 10:31:02 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] drm/vkms: Allow to configure device
Message-ID: <Z5yYVov9_z6CDU46@fedora>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <Z5uDGr445jEfdt5L@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5uDGr445jEfdt5L@louis-chauvet-laptop>
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

On Thu, Jan 30, 2025 at 02:48:10PM +0100, Louis Chauvet wrote:
> On 29/01/25 - 12:00, José Expósito wrote:
> > Hi everyone,
> > 
> > In preparation for ConfigFS support, a flexible way to configure VKMS device(s)
> > is required.
> > This series adds the required APIs to create a configuration, the code changes
> > required to apply it and KUnit test validating the changes.
> 
> Hi José,

Hi Louis,

Thanks a lot for the quick review!

> Thanks a lot!
> 
> This series is amazing and better than mine on many points. I have few 
> comments:
> - a "strange" naming pair: add/destroy (I expect add/remove or 
>   create/destroy like other function in DRM)

I used "add" because the function creates and adds a display pipeline
items and "destroy" because the opposite function removes it and frees
its memory, so I wanted to emphasize that the action was destructive.

However, I don't have a strong preference about the naming. If you
prefer another pair of verbs, I'll be happy to change the function
names.

> - usage of "complex" list accessors, can't we just create iterators?

Yes, on the first iteration, I used the underlying structure: list
iterators for planes/CRTCs/encoders/connectors and xa_for_each for
the possible_* items.

However, I found 2 main issues that made me rewrite this code:

The first one is that, if in the future, we change the internal data
type, we'll have to change all the code using it. On this way, like
I did with all the other vkms_config_*_get_*() functions, the data is
encapsulated.

The second one is vkms_config_get_connectors(). Unlike the other
functions, this one filters by connector enabled status. If we let the
caller do the filtering, we'll duplicate that logic.

Because of these two reasons, I decided to add a getter for lists.

> - should we use pr_err in vkms_config_valid?

I think it is great to show to the user a reason why their device couldn't
be enabled in dmesg... But I'm not sure if there is a better way to do it.

> > Louis Chauvet and I are working on ConfigFS support. In this series I tried to
> > merge his changes [1] with mine [2].
> > I kept his Signed-off-by to reflect that, even if I show up as the author of
> > some/most of the patches, this was a joint effort.
> 
> To avoid confusion, you should add the Co-developped-by tag, so it will be 
> clear that we worked together on this.

Good point, I'll change it.

> > I'm still polishing the ConfigFS code [3] and its IGT tests [4] (connector
> > hot-add/remove bugs) but the IGT tests also exercise this series and can be used
> > for additional test coverage.
> 
> I will take a look at those series. For the connector hot-add/remove, do 
> you have any example of usage in the kernel? I did not found anything in 
> the documentation explaining they are hot-addable.

I pushed a couple of WIP commits to the kernel and IGT so you can see/test
the crashes and hopefully share some ideas.

About the documentation: I didn't find much information other than a few
mentions to hot-add/remove. However, in one of my rebases, two new functions, 
drm_connector_dynamic_init() and drm_connector_dynamic_register(), were added:
https://patchwork.freedesktop.org/patch/628418/

I'm still trying to make them work, but I think they are what we need.

Part of the crashes happen on the cleanup of drm_client_setup(). Adding a
connector adds modes in the DRM client, but removing the connector doesn't
remove them and, on cleanup, I get a NULL pointer.

I'm a bit stuck, so help or tips are very welcome :)

> Thanks again for this series,
> Louis Chauvet

I'll look with more time into your comments in the other patches next week.

Thanks,
Jose

> > Best wishes,
> > José Expósito
> > 
> > [1] https://patchwork.kernel.org/project/dri-devel/cover/20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com/
> > [2] https://patchwork.kernel.org/project/dri-devel/cover/20240813105134.17439-1-jose.exposito89@gmail.com/
> > [3] https://github.com/JoseExposito/linux/commits/patch-vkms-configfs/
> > [4] https://gitlab.freedesktop.org/jexposit/igt-gpu-tools/-/commits/vkms-configfs
> > 
> > José Expósito (12):
> >   drm/vkms: Extract vkms_connector header
> >   drm/vkms: Add KUnit test scaffolding
> >   drm/vkms: Extract vkms_config header
> >   drm/vkms: Move default_config creation to its own function
> >   drm/vkms: Set device name from vkms_config
> >   drm/vkms: Allow to configure multiple planes
> >   drm/vkms: Allow to configure multiple CRTCs
> >   drm/vkms: Allow to attach planes and CRTCs
> >   drm/vkms: Allow to configure multiple encoders
> >   drm/vkms: Allow to attach encoders and CRTCs
> >   drm/vkms: Allow to configure multiple connectors
> >   drm/vkms: Allow to attach connectors and encoders
> > 
> > Louis Chauvet (1):
> >   drm/vkms: Add a validation function for VKMS configuration
> > 
> >  drivers/gpu/drm/vkms/Kconfig                  |  15 +
> >  drivers/gpu/drm/vkms/Makefile                 |   5 +-
> >  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
> >  drivers/gpu/drm/vkms/tests/Makefile           |   3 +
> >  drivers/gpu/drm/vkms/tests/vkms_config_test.c | 782 +++++++++++++++++
> >  drivers/gpu/drm/vkms/vkms_config.c            | 784 ++++++++++++++++++
> >  drivers/gpu/drm/vkms/vkms_config.h            | 479 +++++++++++
> >  drivers/gpu/drm/vkms/vkms_connector.c         |  61 ++
> >  drivers/gpu/drm/vkms/vkms_connector.h         |  26 +
> >  drivers/gpu/drm/vkms/vkms_drv.c               |  45 +-
> >  drivers/gpu/drm/vkms/vkms_drv.h               |  17 +-
> >  drivers/gpu/drm/vkms/vkms_output.c            | 255 ++++--
> >  12 files changed, 2337 insertions(+), 139 deletions(-)
> >  create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
> >  create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
> >  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_config_test.c
> >  create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
> >  create mode 100644 drivers/gpu/drm/vkms/vkms_config.h
> >  create mode 100644 drivers/gpu/drm/vkms/vkms_connector.c
> >  create mode 100644 drivers/gpu/drm/vkms/vkms_connector.h
> > 
> > -- 
> > 2.48.1
> > 
