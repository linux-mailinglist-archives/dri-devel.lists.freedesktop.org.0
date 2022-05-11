Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B187552316A
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 13:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2651410ECA2;
	Wed, 11 May 2022 11:24:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801D010ECA2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 11:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652268296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=74g0bmnivF1+sjdv/ldmbPuCRqvKL9LcvXu85lOOZDc=;
 b=MiD8gOKMH/SWfGR7LRWXxam+tYWSGjK8krm+RNYT/DYtdL8hyzyWh5DhTbKa+pLWh4BMTU
 o5yg5PRhguvsKS43tCKW/fRqbK41iWUSmApMA+Aa8OAQMt+W0iW2dOfCfJklNSForeuR9r
 nvEfoMPSgVaRXnC47Hoju3VxSrIw8p0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-RYRfklAfOJ-aaGsvVkuUow-1; Wed, 11 May 2022 07:24:55 -0400
X-MC-Unique: RYRfklAfOJ-aaGsvVkuUow-1
Received: by mail-wr1-f70.google.com with SMTP id
 m8-20020adfc588000000b0020c4edd8a57so724393wrg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 04:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=74g0bmnivF1+sjdv/ldmbPuCRqvKL9LcvXu85lOOZDc=;
 b=ZlgHPI5/MHeIof4L8pcgU40PuY3Dfjh62RW55njS3+Gpy+vLhHBpNdaHV3YNg0J5IJ
 APt97PR3t2qe2/VfnT7kKGBaPWHYo2djFgtAAfNVT9GtW+lwpSHSAe03lbmNZE9xKOQX
 G4w7dUggvCFEZfR7DcDvvjjye3UKVXongQPrVI31qnNBJ+2Am7ZJZcogDGJJLfodJ2/l
 nWD1SFhqijW2ERTXoW7EBeTF99oUt+RwPFcfHP1lDSEg9+N3KemAX3gr5vnPREhEO7EM
 NShgJA5Z8FZ85E0mbNhqRmg45ZLMVM+op0jyk2tQqvnL3vU63y0ZbB8eEaZS/yY7ttYn
 iLqw==
X-Gm-Message-State: AOAM532AtAU73uBDBXYZB6bY8KtH/4tPRmneMsUz0TyacZQzMYFW+Tti
 uvoquSC2o6CasgA2J5H+IkZMtq2JgRskLxUYAWvRwd50P/0drK021MbDkSilw/rbIgIxKoyH1rJ
 tpkX6M7bveg2+2Iu895r/C9o9GAB/
X-Received: by 2002:a05:6000:1841:b0:20c:788b:9306 with SMTP id
 c1-20020a056000184100b0020c788b9306mr21500990wri.369.1652268294288; 
 Wed, 11 May 2022 04:24:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqiIDFQEwbgjQPCLimkTEcDNRsKPVMAysuPiAMG2NOuNeRfcXzFKnVvUYrhq6SaYWWb2umNQ==
X-Received: by 2002:a05:6000:1841:b0:20c:788b:9306 with SMTP id
 c1-20020a056000184100b0020c788b9306mr21500957wri.369.1652268294033; 
 Wed, 11 May 2022 04:24:54 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j1-20020a5d4481000000b0020c5253d8d3sm1429174wrq.31.2022.05.11.04.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 04:24:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] Fix some races between sysfb device registration and
 drivers probe
Date: Wed, 11 May 2022 13:24:31 +0200
Message-Id: <20220511112438.1251024-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-doc@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

The patches in this series contain mostly changes suggested by Daniel Vetter
Thomas Zimmermann. They aim to fix existing races between the Generic System
Framebuffer (sysfb) infrastructure and the fbdev and DRM device registration.

For example, it is currently possible for sysfb to register a platform
device after a real DRM driver was registered and requested to remove the
conflicting framebuffers. Or is possible for a simple{fb,drm} to match with
a device previously registered by sysfb, even after a real driver is present.

A symptom of this issue, was worked around with the commit fb561bf9abde
("fbdev: Prevent probing generic drivers if a FB is already registered")
but that's really a hack and should be reverted instead.

This series attempt to fix it more correctly and revert the mentioned hack.
That will also allow to make the num_registered_fb variable not visible to
drivers anymore, since that's internal to fbdev core.

Pach 1 is just a simple cleanup in preparation for later patches.

Patch 2 add a sysfb_disable() and sysfb_try_unregister() helpers to allow
disabling sysfb and attempt to unregister registered devices respectively.

Patch 3 changes how is dealt with conflicting framebuffers unregistering,
rather than having a variable to determine if a lock should be take, it
just drops the lock before unregistering the platform device.

Patch 4 changes the fbdev core to not attempt to unregister devices that
were registered by sysfb, let the same code doing the registration to also
handle the unregistration.

Patch 5 fixes the race that exists between sysfb devices registration and
fbdev framebuffer devices registration, by disabling the sysfb when a DRM
or fbdev driver requests to remove conflicting framebuffers.

Patch 6 is the revert patch that was posted by Daniel before but dropped
from his set and finally patch 7 is the one that makes num_registered_fb
private to fbmem.c, to not allow drivers to use it anymore.

The patches were tested on a rpi4 with the vc4, simpledrm and simplefb
drivers, using different combinations of built-in and as a module.

For example, having simpledrm as a module and loading it after the vc4
driver probed would not register a DRM device, which happens now without
the patches from this series.

Best regards,
Javier

Changes in v5:
- Move the sysfb_disable() call at conflicting framebuffers again to
  avoid the need of a DRIVER_FIRMWARE capability flag.
- Add Daniel Vetter's Reviewed-by tag again since reverted to the old
  patch that he already reviewed in v2.
- Drop patches that added a DRM_FIRMWARE capability and use them
  since the case those prevented could be ignored (Daniel Vetter).

Changes in v4:
- Make sysfb_disable() to also attempt to unregister a device.
- Drop call to sysfb_disable() in fbmem since is done in other places now.
- Add patch to make registered_fb[] private.
- Add patches that introduce the DRM_FIRMWARE capability and usage.

Changes in v3:
- Add Thomas Zimmermann's Reviewed-by tag to patch #1.
- Call sysfb_disable() when a DRM dev and a fbdev are registered rather
  than when conflicting framebuffers are removed (Thomas Zimmermann).
- Call sysfb_disable() when a fbdev framebuffer is registered rather
  than when conflicting framebuffers are removed (Thomas Zimmermann).
- Drop Daniel Vetter's Reviewed-by tag since patch changed a lot.
- Rebase on top of latest drm-misc-next branch.

Changes in v2:
- Rebase on top of latest drm-misc-next and fix conflicts (Daniel Vetter).
- Add kernel-doc comments and include in other_interfaces.rst (Daniel Vetter).
- Explain in the commit message that fbmem has to unregister the device
  as fallback if a driver registered the device itself (Daniel Vetter).
- Also explain that fallback in a comment in the code (Daniel Vetter).
- Don't encode in fbmem the assumption that sysfb will always register
  platform devices (Daniel Vetter).
- Add a FIXME comment about drivers registering devices (Daniel Vetter).
- Explain in the commit message that fbmem has to unregister the device
  as fallback if a driver registered the device itself (Daniel Vetter).
- Also explain that fallback in a comment in the code (Daniel Vetter).
- Don't encode in fbmem the assumption that sysfb will always register
  platform devices (Daniel Vetter).
- Add a FIXME comment about drivers registering devices (Daniel Vetter).
- Drop RFC prefix since patches were already reviewed by Daniel Vetter.
- Add Daniel Reviewed-by tags to the patches.

Daniel Vetter (2):
  Revert "fbdev: Prevent probing generic drivers if a FB is already
    registered"
  fbdev: Make registered_fb[] private to fbmem.c

Javier Martinez Canillas (5):
  firmware: sysfb: Make sysfb_create_simplefb() return a pdev pointer
  firmware: sysfb: Add helpers to unregister a pdev and disable
    registration
  fbdev: Restart conflicting fb removal loop when unregistering devices
  fbdev: Make sysfb to unregister its own registered devices
  fbdev: Disable sysfb device registration when removing conflicting FBs

 .../driver-api/firmware/other_interfaces.rst  |  6 ++
 drivers/firmware/sysfb.c                      | 91 +++++++++++++++++--
 drivers/firmware/sysfb_simplefb.c             | 16 ++--
 drivers/video/fbdev/core/fbmem.c              | 67 +++++++++++---
 drivers/video/fbdev/efifb.c                   | 11 ---
 drivers/video/fbdev/simplefb.c                | 11 ---
 include/linux/fb.h                            |  8 +-
 include/linux/sysfb.h                         | 29 +++++-
 8 files changed, 178 insertions(+), 61 deletions(-)

-- 
2.35.1

