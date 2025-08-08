Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D117FB20015
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 09:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73BA10E37B;
	Mon, 11 Aug 2025 07:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=listout.xyz header.i=@listout.xyz header.b="rKce//7J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 311 seconds by postgrey-1.36 at gabe;
 Fri, 08 Aug 2025 22:58:00 UTC
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C46510E204;
 Fri,  8 Aug 2025 22:58:00 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bzK7154cSz9sVv;
 Sat,  9 Aug 2025 00:52:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
 t=1754693565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Pfnki0oaDIoV3aLT0Kq4K2/8BC7/9JT3kxz8y1+UALE=;
 b=rKce//7J/OORdAR9bQcJXUfqZySO1sBjZ/9mJtNUKCHsR9PBa8SiOZ5SJzqM5lV23jR5to
 MSDd+IZgLJXXktfBk31tYrubvhhOoGWENmUzLQY822n8uzWSGb7eKuTMqvCaUv8uVxszsW
 14KO78/HRieuuGkyODg2XUWSswt+7pndPqeHsZCPAMnOiOxwRhwbGaylJQrLC7IHpuJCud
 e3FBw5MxiaFakRDmr+mebcB0WP6tpl3iSIQk2mXX8Qdb5re4g3Wj8HjJ54kh1xq/CU3aED
 Bl6Ru9gQo2x5/O0XINBwyDCohH7TlFeyebbqbCzkVO6nYUjxTEJmaG8rNBR6zQ==
From: Brahmajit Das <listout@listout.xyz>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, simona@ffwll.ch
Subject: [RFC PATCH 0/2] use new debugfs device-centered functions
Date: Sat,  9 Aug 2025 04:22:24 +0530
Message-ID: <20250808225226.30465-1-listout@listout.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 Aug 2025 07:12:55 +0000
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

Replace the use of drm_debugfs_create_files() with the new
drm_debugfs_add_files() function, which centers the debugfs files
management on the drm_device instead of drm_minor.

Refer:
https://docs.kernel.org/gpu/todo.html#clean-up-the-debugfs-support

Brahmajit Das (2):
  drm/i915/debugfs: use new debugfs device-centered functions
  drm/i915: use new debugfs device-centered functions

 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 5 ++---
 drivers/gpu/drm/i915/i915_debugfs.c                  | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

-- 
2.50.1

