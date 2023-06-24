Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C8273CCC5
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 23:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308AC10E0CE;
	Sat, 24 Jun 2023 21:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8839910E0CE
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 21:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 4F68241DB2;
 Sat, 24 Jun 2023 23:29:54 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aA3TgF6WSy86; Sat, 24 Jun 2023 23:29:53 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1687642192; bh=LFWKEGzgUshm8I0gBAeQeY03CS3shD8gXA+iCxcMyF4=;
 h=From:To:Cc:Subject:Date;
 b=djDl3kzV864NRvPUQVpeoIJAso6K/oZSReZNlbycX6hqxzfs7YbqyszF/ZzEqq+5c
 0bEmN7b7R1VQZN3NXlzIcCsreFKLzjtXOPJRgGJhZ7SfR3j7gRSJ6gLniBz9hecD6K
 gZ8Bgr970rg8IJAffpVlrWQpk/yBkbndXVkhN4izyV76K0iZqrqprWX0O9HpmPzwMA
 IVXT+rkT+o5L5bwNDLHD0RmgBePXZEo1hvyRGu9tgaonBm2SWk4fByI6uoxTxUDB1j
 6fKkpHmuOarB4V+nHuzM7Aox0X58pZWMv6EgM/uYKB+s2ovtoe7o6AQWP6ERSCwNur
 fQDjdhAGndMJg==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/tests: Fix swapped drm_framebuffer tests parameter
 names
Date: Sat, 24 Jun 2023 18:29:05 -0300
Message-Id: <20230624212905.21338-1-gcarlos@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: michal.winiarski@intel.com, tales.aparecida@gmail.com, dlatypov@google.com,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>, javierm@redhat.com,
 mairacanal@riseup.net, andrealmeid@igalia.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Swap tests parameters names so they actually reflect what is being tested.

v1: https://lore.kernel.org/all/20230623152518.8603-1-gcarlos@disroot.org/
v2: Simplified commit message.

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Reviewed-by: André Almeida <andrealmeid@igalia.com>
Reviewed-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_framebuffer_test.c b/drivers/gpu/drm/tests/drm_framebuffer_test.c
index df235b7fdaa5..f759d9f3b76e 100644
--- a/drivers/gpu/drm/tests/drm_framebuffer_test.c
+++ b/drivers/gpu/drm/tests/drm_framebuffer_test.c
@@ -178,13 +178,13 @@ static const struct drm_framebuffer_test drm_framebuffer_create_cases[] = {
 		 .handles = { 1, 1, 1 }, .pitches = { 600, 600, 600 },
 	}
 },
-{ .buffer_created = 1, .name = "YVU420 Normal sizes",
+{ .buffer_created = 1, .name = "YVU420 DRM_MODE_FB_MODIFIERS set without modifier",
 	.cmd = { .width = 600, .height = 600, .pixel_format = DRM_FORMAT_YVU420,
 		 .handles = { 1, 1, 1 }, .flags = DRM_MODE_FB_MODIFIERS,
 		 .pitches = { 600, 300, 300 },
 	}
 },
-{ .buffer_created = 1, .name = "YVU420 DRM_MODE_FB_MODIFIERS set without modifier",
+{ .buffer_created = 1, .name = "YVU420 Normal sizes",
 	.cmd = { .width = 600, .height = 600, .pixel_format = DRM_FORMAT_YVU420,
 		 .handles = { 1, 1, 1 }, .pitches = { 600, 300, 300 },
 	}
-- 
2.39.3

