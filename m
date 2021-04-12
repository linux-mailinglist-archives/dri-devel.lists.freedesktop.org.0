Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7933235D36A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 00:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CA36E092;
	Mon, 12 Apr 2021 22:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5EC6E092
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 22:47:30 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id c15so5552154wro.13
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 15:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=0naniOFdPM5PdGnJkp2f0jO5+9UTavttrnmkivahNw4=;
 b=sPxvn9ph2lGwUJPOyV4Gl+dOmGUue3BbS/PtcValeFtvzh0i+Ldmu22+Uhcdm0KvCf
 o533qc3t4pVy2AUXrB2AT3jKfLjAdaTf5PDBPF9lbBfevaoRtXToPpIzR4yDeejca0ov
 ZYSnI/MfQF1XO2pAo3Xc/S7jhICB5H/E2PXe8apwth/PS4NaCwJXQ6gWq88o9EVYx9cx
 WI8buBZFix4+N8bf6mMcp3V2wKMYoQjoazlHNnyYXCZc3r7R0BCjFE6FzWyg/KPHvuu2
 aa93Uld7A4G1v+AXUBcWEWm2IS0bJK7V4kC5SrQttb6sWXbcXeCRGWNUyOXbM6MLRAuH
 bsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=0naniOFdPM5PdGnJkp2f0jO5+9UTavttrnmkivahNw4=;
 b=cfjHXPZyY5ams7s0s2hRmGcDKSFZi0EgTUjaIvQ7bmMQOWYsEg5cvRoJ3K+crwKAuo
 tHA2dfylsfIVyZTO63+R7KrSJtBI/AZNKjXmRhFrPzkUvNtdDdMlZaRG3EGJMaYCh+ZA
 kk4qWxHFLJ/xacC0DJPGIsN4W78L+HZtRloDbeoghRr2hxQgkKSLbUcdz5ibcfKbUTr1
 U1osJOEJL9K8mOmjEY6bDxCYYGboptWliwzkXCiKrOLCSc8UWx43jJZqWUz2AiJYMCG2
 7DGmNUEK71+2u7KqCa+bLm911yPylJsyFyI1F6wdcoFz6tT4kKIfSn55998gkJfJ7tHE
 xhog==
X-Gm-Message-State: AOAM531g8HaeWsgK1dNq89IC9clQxd0rX3jnZAZJld5iG8rJrGh6Y5/u
 y3JhsXGzRw99ZdtMJ9tQR2g=
X-Google-Smtp-Source: ABdhPJxiSiZViWfWmyiIAFSyaDVHXuEEOTx1626/BTklpJNXLxT8IJTiwMb355phQcEZb99BeFhcbg==
X-Received: by 2002:adf:fb0e:: with SMTP id c14mr34491215wrr.140.1618267649158; 
 Mon, 12 Apr 2021 15:47:29 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id q5sm14317798wrv.17.2021.04.12.15.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 15:47:28 -0700 (PDT)
Date: Mon, 12 Apr 2021 19:47:22 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Simon Ser <contact@emersion.fr>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: [PATCH v2 0/4] drm/vkms: add overlay plane support
Message-ID: <20210412224722.pbgc7xxk3u42n3sj@smtp.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
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

The third patch enables the plane composition to select the correct pixel
blending operation according to the plane format (XRGB8888 or ARGB8888).

The last patch creates a module option to enable overlay, and includes
overlay to supported types of plane. When the overlay option is enabled,
one overlay plane is initialized (plus primary and cursor) and it is
included in the planes composition.

This work preserves the current results of IGT tests: kms_cursor_crc;
kms_flip and kms_writeback. In addition, subtests related to overlay in
kms_atomic and kms_plane_cursor start to pass (pointed out in the commit
message).

---------
v2:

- Drop unnecessary changes that init crtc without cursor (Daniel)
- Replace function to initialize planes (Daniel)
- Add proper pixel blending op according to the plane format (Daniel)

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
