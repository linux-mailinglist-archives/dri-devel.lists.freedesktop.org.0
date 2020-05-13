Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A021D4645
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2596EBE2;
	Fri, 15 May 2020 06:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B19A6E155
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 11:42:26 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g12so28102895wmh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 04:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eTkY+j+6GTabMKNS4Ht855+gzZTKymsTLBvZdWCVoas=;
 b=uDAPOP+M7Yi+o7mHhwsXmOxS3LIX0uL4TTQ9frjgQy87Hb53KA9q9EzhEbKqjpm7+4
 SuGlmyRrJPKBNQtumvsjZHBQJLAev9ODOlczLVdR09BqtXZREy9lcPCgZNhJO9L6Outq
 BJNSkqgby6es7SLVkRk/Rbj+7m+krgfvcGduf+jTF0VN0bTewTBLelWHXGFR1e09dRRo
 c0MBEnQccME0vt4TydnhJnAgiXUWXh4ZjfMbzDMi+dxrYBk2dE6aPUXOTcfnPDJnE+Wa
 jcF/ZGHaQxY6siJMnhU/h28LDYVaWtoI8G+63o8pjuG0rq8dtuw4La+YCJsaj65UtYgJ
 Riug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eTkY+j+6GTabMKNS4Ht855+gzZTKymsTLBvZdWCVoas=;
 b=oE3y3zFfJXYZwgWYGJNbVlk6Aix3FtZt8nqDfctxXpLVsd9kCfKYjAofcTH+hTZpEt
 i9y5HyheAQoV+oF1GPFkauD+QVDsFjXoyKOnRDM73RT+e5P394SWHTvADFtWEvN4EIjR
 8JhtA0ncNgOOill7s7H3OiK6zDxvPjqrVg8yvfr8BlswG3Az15BeY6cLfvo6xxGzqbIq
 sSQ6L1ydo1uWCTwsmv2zHzrn8LKSwg++AWw4SSgFwGHBoj27A8+KXoJmJcImb+FCiEZJ
 FGHQdSI0Qh4Dv4YD+MRAeRmYOke9xDe+yPMSlvjwJu9zBrEHMVSKanYB/clc84Y/A/xN
 d9vw==
X-Gm-Message-State: AGi0PuYLZaayRhx5HoYCJv//wUFF2KmRb0D1bJXEFx6xH8j3dK5445iP
 Vg9BOVR4SQzqO9PbJ2cqBMs=
X-Google-Smtp-Source: APiQypIm7YhC98as/7YeUxKj3sJfUd8kfKY8od4PzE1OLjipYDg9JmLrai+orf7Yw03sFpj+s2aMxw==
X-Received: by 2002:a1c:7c0b:: with SMTP id x11mr15225880wmc.149.1589370145086; 
 Wed, 13 May 2020 04:42:25 -0700 (PDT)
Received: from wambui.zuku.co.ke ([197.237.182.195])
 by smtp.googlemail.com with ESMTPSA id j2sm27484540wrp.47.2020.05.13.04.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 04:42:24 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [RFC PATCH 0/3] drm: introduce new method of creating debugfs files.
Date: Wed, 13 May 2020 14:41:26 +0300
Message-Id: <20200513114130.28641-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Currently drm debugfs files are created using drm_debugfs_create_files()
on request.
This series introduces new functions and infrastructure that will enable
the mass creation of debugfs files during drm_dev_register(). Drivers can
request for the creation of debugfs files at any time using two new
functions: drm_debugfs_add_files()/drm_debugfs_add_file(). The file
requests are added to a list and tracked until drm_dev_register() when
the files are created all at once.

This concept was already in use by the drm/vc4 driver and this series
tries to introduce the same infrastructure in drm core.
Patch 2 removes vc4's functions doing the same, and replaces it
with the new drm core functions.
Patch 3 is an example of how the new functions and structs can replace
the existing drm_info_list and drm_debugfs_create_files() usage.

Hoping to get some feedback or comments on the current progress of this
series.

Thanks,
wambui karuga

Wambui Karuga (3):
  drm/debugfs: create debugfs files during drm_dev_register().
  drm/vc4: use new debugfs functions for file creation.
  drm: use new debugfs functions for various files.

 drivers/gpu/drm/drm_atomic.c      | 11 +++---
 drivers/gpu/drm/drm_client.c      | 11 +++---
 drivers/gpu/drm/drm_debugfs.c     | 59 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/drm_drv.c         |  2 ++
 drivers/gpu/drm/drm_framebuffer.c | 11 +++---
 drivers/gpu/drm/vc4/vc4_bo.c      |  4 +--
 drivers/gpu/drm/vc4/vc4_debugfs.c | 38 +++++---------------
 drivers/gpu/drm/vc4/vc4_hdmi.c    |  4 +--
 drivers/gpu/drm/vc4/vc4_hvs.c     |  4 +--
 drivers/gpu/drm/vc4/vc4_v3d.c     |  4 +--
 include/drm/drm_debugfs.h         | 38 ++++++++++++++++++++
 include/drm/drm_device.h          | 12 +++++++
 12 files changed, 138 insertions(+), 60 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
