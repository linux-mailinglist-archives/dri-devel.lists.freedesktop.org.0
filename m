Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A496458534D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B4A10E0C3;
	Fri, 29 Jul 2022 16:16:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D1510E059;
 Fri, 29 Jul 2022 16:16:22 +0000 (UTC)
Received: from sobremesa.fritz.box (unknown
 [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 443696601B7F;
 Fri, 29 Jul 2022 17:16:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1659111381;
 bh=tShQvMUOywtMapRI/j2Xf9FllB8cM2lIjsJ5JLs0hrQ=;
 h=From:To:Cc:Subject:Date:From;
 b=f0fddM60cjBshmfAsOf8rbwLineoW4o58mtG9jlnVE4vXGNuB/o8Y3O9K/tojXC0M
 x0rJENU6rdp8f3Su2csZrjVmYdSkX59quD4RGaasjVvwuE4JzjM/VJs3R9/4kJ2X4o
 snLsP94VVv0M7JWMjU9vI452F30E32cCBH0kunA1lQ/zZZlAYogOTqQ8fB4FZe4id7
 bSjoygnk0FqqNcuNkyvbIPxVCvH8Dyx3GaM5hbGCIQAgTi1gMkklLbWzMylfSeSDiY
 wRVDTl/NUew/BR+ZBds1lU6yV6pV9JfnHUDFu+/N7wRPiTHNKyy2tEJq+AQcdu1S6y
 7YiMRP42rxfAQ==
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] Context isolation uAPI fixes
Date: Fri, 29 Jul 2022 17:16:10 +0100
Message-Id: <20220729161612.2212512-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.37.0
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
Cc: bob.beckett@collabora.com, adrian.larumbe@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series addresses the concerns in
https://gitlab.freedesktop.org/drm/intel/-/issues/4264

Parallel work has be done on IGT to test changes in the kernel driver:
https://lists.freedesktop.org/archives/igt-dev/2022-May/041600.html

Test-with: 20220516205000.2960491-1-adrian.larumbe@collabora.com

Adrian Larumbe (2):
  drm/i915: Change semantics of context isolation reporting to UM
  drm/i915: force getparam ioctl return bool for HAS_CONTEXT_ISOLATION

 drivers/gpu/drm/i915/gt/intel_engine_user.c | 14 ++++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_user.h |  1 +
 drivers/gpu/drm/i915/i915_getparam.c        |  2 +-
 include/uapi/drm/i915_drm.h                 |  4 ----
 4 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.37.0

