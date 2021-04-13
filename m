Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 021B635D954
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 09:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D366E214;
	Tue, 13 Apr 2021 07:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D516E214
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 07:52:02 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h4so6377034wrt.12
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 00:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=Wx+rnBpOyhI7udB+hmMJpeFZjXJ750byYz2KCzEnWDA=;
 b=ePPL8Oj5zTEQM/lrCzIIGKZOZ0vsDP0zgzdWl2eZ6NWXL2tSoMjTA0ywaFDqQR3qv3
 9tS4qf3gH0Wf30J3hl80rKByCzXQi3BPdNeOCO36HL5RyNeoKbm/NXSKTV6JPXvPtAWj
 nICdgdKuE+4YUt5oiaRP6KxvmiEeqt7rRhXcw3sT6hh3L64X7cZexvEB/bZVQAnn5k5X
 oauX6BN14guyXPphxlKy8KH9Kdficc2dQ9RB9k4OhZHiVD2ETNOJ5kc0aKPXaX0e5LLY
 L+dS7TTopWLYl3VtkewhQpkBUMp6izkQBBMWE6AboF+WbK+U10Fr5BB5Tr91upBw03IG
 nIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Wx+rnBpOyhI7udB+hmMJpeFZjXJ750byYz2KCzEnWDA=;
 b=CJVB2QWa6/BvKJIVKlXzjdUeBz06W4WffCiVxH2wnf3S6nqh+p9059CYZFPK5nAy+3
 eYaZhXnsGNULlOBgIxPxijSMWy97ACacMhhK5iyt/sX/P1HFsejbi8L3TnuRC09pCV+A
 QEA1fEDHCs4KuHLMSThnv2Z+ukWyR9jQuKn5zaM6vNIwgq1xmsv+zhjIy/8q4ifMwmM1
 fuguBCFBrOpsUfb1CjJgi7liKaiPuIidFE1j5wk0WPkK1ePmUNdoKJ/a3w+D0XP6qG+z
 TvAymuV7G+0D3DUr5SRAOKoDZ37OjypUhAoBxOID1mRDZTzzZb1CObCON5GnmzmiZmIZ
 JYcw==
X-Gm-Message-State: AOAM532q3BjqTU61C51PL+UKL35SPwJolPhJQ/0OuSMS8C2zVu+8b3/Z
 nfccO6V4SXNimokb/G7hsw7qzlQN7rryng==
X-Google-Smtp-Source: ABdhPJyeuf2qx6zTcYpvpdnatGf59CDyeetXokxuS5KdxKqCV1a/ZG0jbkn7JU6pySn9KfvzL5KE8A==
X-Received: by 2002:adf:e747:: with SMTP id c7mr59640wrn.220.1618300321414;
 Tue, 13 Apr 2021 00:52:01 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id o2sm1602907wmc.23.2021.04.13.00.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 00:52:01 -0700 (PDT)
Date: Tue, 13 Apr 2021 04:51:55 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/4] drm/vkms: add overlay plane support
Message-ID: <cover.1618299945.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adding support to overlay type in addition to primary and cursor plane.
The planes composition relies on the z order of the active planes and
only occurs if there is a primary plane (as in the current behavior).

The first patch switches the function of initializing planes from
drm_universal_plane_init to drmm_universal_plane_alloc. It aims to
improve aspects of allocation and cleanup operations, leaving it to the
DRM infrastructure.

The second patch generalizes variables and functions names to refer to
any kind of plane, not only cursor. The goal is to reuse them for
blending overlay and cursor planes to primary.

The third patch enables the plane composition to selct the correct pixel
blending operation according to the plane format (XRGB8888 or ARGB8888).

The last patch creates a module option to enable overlay, and includes
overlay to supported types of plane. When the overlay option is enabled,
one overlay plane is initialized (plus primary and cursor) and it is
included in the planes composition.

This work preserves the current results of IGT tests: kms_cursor_crc;
kms_flip and kms_writeback. In addition, subtests related to overlay in
kms_atomic and kms_plane_cursor start to pass (pointed out in the commit
message).

---
v2:

- Drop unnecessary changes that init crtc without cursor (Daniel)
- Replace function to initialize planes (Daniel)
- Add proper pixel blending op according to the plane format (Daniel)

v3:

- Proper use of the variable funcs (kernel bot)
- Adjust the patch series format

Melissa Wen (4):
  drm/vkms: init plane using drmm_universal_plane_alloc
  drm/vkms: rename cursor to plane on ops of planes composition
  drm/vkms: add XRGB planes composition
  drm/vkms: add overlay support

 drivers/gpu/drm/vkms/vkms_composer.c | 67 ++++++++++++++++++----------
 drivers/gpu/drm/vkms/vkms_drv.c      |  5 +++
 drivers/gpu/drm/vkms/vkms_drv.h      |  9 +++-
 drivers/gpu/drm/vkms/vkms_output.c   | 28 ++++++------
 drivers/gpu/drm/vkms/vkms_plane.c    | 50 +++++++++++----------
 5 files changed, 96 insertions(+), 63 deletions(-)

-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
