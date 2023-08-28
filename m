Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB21578A754
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 10:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C5A10E063;
	Mon, 28 Aug 2023 08:16:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6181A10E063
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 08:16:20 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1bf3a2f44ffso22538105ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 01:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693210580; x=1693815380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hD5oyc91zexss8iplnmDih5E3tUKOUqVxVKR2VyNeyI=;
 b=ftU2e2RdnDVfMD3FFMtiZay9w1igiZJvdLHjDzCZh2mDV2QjnqogxSUgA6/k6VGMhq
 EeCSYBef2LnimoHeQ5Lqv4gF/OkvVzBkDiQP1lux4TIzjYdg/cyozutpMmCBOA5zHA8O
 tpjXilUIrGqCYS6rPg1dfCtvezEQ4qRhoS1Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693210580; x=1693815380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hD5oyc91zexss8iplnmDih5E3tUKOUqVxVKR2VyNeyI=;
 b=ODpgxaaES/KZ6PETPpouxV/JstcJ4zU4mc9lBz18+ItkkyuzNrwzzQDUF9/7/wq+Gr
 4U3whBJtNu7sj4SKPYAjA/xGg7W3NIwk7dXoMq62Tj/py5X3S62nsWFvnHD21K8CgJ3V
 9GVOq+q6aJPUMqiVsbb8EBJPAUiTcPcHslMYWTZXCbpQaYpazkVEA5IJ8OVHvVtwTL8d
 C+Pz6rVGzHLmUds2fDFOiXParIhddg8VN2YMwPQHF0eF4K613CfID+dfcXNk0XekpLIb
 x2EC7XM4T/4hiSNHc8ibcu1wRFd9SrD30cZekTbF02Zgr8Vfa1M6ov/nSVI/qThYqrkB
 A19w==
X-Gm-Message-State: AOJu0Yy8+ZY30H2AnCXfVI9n8084l0bPNhTgTNtb39ud2ePnm3Zd8+iE
 6gYQ4i4K0xftLOxJpMxmNE9Tvw==
X-Google-Smtp-Source: AGHT+IHBCRkOdvz3bICLpxgNzt2TpU53Ks2o85GsbfP1PoYC+pS6KkoDT91ML3hyAlpG+R91OrKFyw==
X-Received: by 2002:a17:903:4c5:b0:1bd:ec9e:59fe with SMTP id
 jm5-20020a17090304c500b001bdec9e59femr23569151plb.68.1693210579906; 
 Mon, 28 Aug 2023 01:16:19 -0700 (PDT)
Received: from datalore.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 jh12-20020a170903328c00b001bf5c12e9fesm6676568plb.125.2023.08.28.01.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 01:16:19 -0700 (PDT)
From: Brandon Pollack <brpol@chromium.org>
To: marius.vlad@collabora.com,
	jshargo@chromium.org
Subject: [v5,0/7] Adds support for ConfigFS to VKMS!
Date: Mon, 28 Aug 2023 08:14:42 +0000
Message-ID: <20230828081609.3572937-1-brpol@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, hirono@chromium.org, mduggan@chromium.org,
 corbet@lwn.net, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 tzimmermann@suse.de, Brandon Pollack <brpol@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since Jim is busy with other work and I'm working on some things that
rely on this, I've taken up the task of doing the iterations.  I've
addressed the comments as best I can (those replies are to each
individual change) and here is the patch set to go with those.

I added my own signoff to each commit, but I've left jshargo@ as the
author of all the commits he wrote.  I'm sure there is still more to
address and the ICT tests that were writtein parallel to this may also
need some additions, but I'm hoping we're in a good enough state to get
this in and iterate from there soon.

Since V5:
========
Fixed some bad merge conflicts and locking behaviours as well as
clarified some documentation, should be good to go now :)

Since V4:
========
Fixed up some documentation as suggested by Marius
Fixed up some bad locking as suggested by Marius
Small fixes here and there (most have email responses to previous chain
emails)

Since V3:
========
I've added hotplug support in the latest patch.  This has been reviewed some
and the notes from that review are addressed here as well.

Relevant/Utilizing work:
=======================
I've built a while test framework based on this as proof it functions (though
I'm sure there may be lingering bugs!).  You can check that out on
crrev.com if you are interested and need to get started yourself (but be
aware of any licensing that may differ from the kernel itself!  Make
sure you understand the license:

https://source.chromium.org/chromiumos/chromiumos/codesearch/+/main:src/platform/tast-tests/LICENSE

That said, you can see the changes in review on the crrev gerrit:

https://chromium-review.googlesource.com/c/chromiumos/platform/tast-tests/+/4666669

Outro:
=====
I really appreciate everyone's input and tolerance in getting these
changes in.  Jim's first patch series was this, and other than some
small cleanups and documentation, taking over it is also mine.

Thank you everyone :)

Brandon Pollack (1):
  drm/vkms Add hotplug support via configfs to VKMS.

Jim Shargo (6):
  drm/vkms: Back VKMS with DRM memory management instead of static
    objects
  drm/vkms: Support multiple DRM objects (crtcs, etc.) per VKMS device
  drm/vkms: Provide platform data when creating VKMS devices
  drm/vkms: Add ConfigFS scaffolding to VKMS
  drm/vkms: Support enabling ConfigFS devices
  drm/vkms: Add a module param to enable/disable the default device

 Documentation/gpu/vkms.rst            |  20 +-
 drivers/gpu/drm/Kconfig               |   1 +
 drivers/gpu/drm/vkms/Makefile         |   1 +
 drivers/gpu/drm/vkms/vkms_composer.c  |  30 +-
 drivers/gpu/drm/vkms/vkms_configfs.c  | 721 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c      | 102 ++--
 drivers/gpu/drm/vkms/vkms_drv.c       | 206 +++++---
 drivers/gpu/drm/vkms/vkms_drv.h       | 182 +++++--
 drivers/gpu/drm/vkms/vkms_output.c    | 405 +++++++++++++--
 drivers/gpu/drm/vkms/vkms_plane.c     |  44 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |  31 +-
 11 files changed, 1508 insertions(+), 235 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c

-- 
2.42.0.rc1.204.g551eb34607-goog

