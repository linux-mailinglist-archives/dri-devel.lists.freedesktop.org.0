Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B572935D944
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 09:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14986E1B7;
	Tue, 13 Apr 2021 07:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0AE6E1B7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 07:48:38 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id f12so15440375wro.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 00:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=Wx+rnBpOyhI7udB+hmMJpeFZjXJ750byYz2KCzEnWDA=;
 b=oGZ1aZY3joHcQq8fAaeTwwCW/HnnN/+DNgqE2X6tvWGMFnXeJaANY4BYzy3Z4Af7xt
 L5qAZj6zSb+rdu8aBXNGBOLkIrkRje7qostpFBFRuEaom1dkjP0ey7jop+BHiWRWfzAT
 aKqa7uCEO76H/mKjtuVhLR75p5I6xT62emeuV14pACXi4GaZHfOOMSck8S0V5t2UEXYp
 /hCgPo8EWMZvyf5+0SNsZJBgppgiLgxkXVGxJNSt/EwAgi8F5q5tWbeIfrPMrBkmoJiF
 odyovrwV2zLSHEl7K7H8tvc7T7sXKssUcgcnru6KuBMsSGUE6TRabRvpEoFtmMTIN59Z
 oduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Wx+rnBpOyhI7udB+hmMJpeFZjXJ750byYz2KCzEnWDA=;
 b=cAM87S2ZljiyA8FM21BS056Awpk3PCNK7dtxgNKv0ksilz3ODqJ5SbsIxar3s0UAZG
 /cvhS9MbMR4eFWbYVcWkjSMLMp55TsfonOTKDzmJe0xgumiOk1dQrS4NnPiF4HPGlFcm
 DRLZOv0qUmmWC65+6hcrU4h2bTVHyqxM9jvFV0N9Lcfo6QEY1C5nIiIUDOEdWxOWh6fp
 OAOX3M7MCeMqWAFjMzBWf/T9t/CvKbZL9E1B/3ew9vZee+Zvn5Rz2mzqu5vUlA+VvfxI
 zjoFMO+YneCZQTLY5lfraa6wdD6yjfB6xiwSqkbtvU9wn5ChSW677GkkPUBDO1AoDdrW
 /uhA==
X-Gm-Message-State: AOAM5310cfQdGwG99+PtlyXd1tuP22Q2zvbc5zrqm0eT4c3GQwsCqEbm
 aJd06fpHwFyWSO9VsnT7/mf6esUCNvsrLw==
X-Google-Smtp-Source: ABdhPJxXT+dH7/99Qp2UN5Tr7Q9EOB/PqQz2+KiB0VTXAqaXtdKHBZ7iaxsDHc64XbDaj8VJtlckBQ==
X-Received: by 2002:a5d:55cd:: with SMTP id i13mr4055367wrw.393.1618300116742; 
 Tue, 13 Apr 2021 00:48:36 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id o15sm1618675wmh.19.2021.04.13.00.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 00:48:36 -0700 (PDT)
Date: Tue, 13 Apr 2021 04:48:29 -0300
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
