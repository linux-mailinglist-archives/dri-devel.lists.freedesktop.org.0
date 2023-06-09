Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D872729BD8
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 15:44:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0922A10E6AA;
	Fri,  9 Jun 2023 13:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1AE10E133
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 13:44:43 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:a1e2:1b31:cba3:390d])
 by michel.telenet-ops.be with bizsmtp
 id 71kZ2A00512zQ4r061kZpM; Fri, 09 Jun 2023 15:44:42 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q7cPS-008La3-2T;
 Fri, 09 Jun 2023 15:44:33 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q7cPp-00GCTQ-3L;
 Fri, 09 Jun 2023 15:44:33 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomba@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2 1/4] drm/todo: Add atomic modesetting references
Date: Fri,  9 Jun 2023 15:44:27 +0200
Message-Id: <e1ee05ea2a13aa3942b8e3d085ef7e98c1f34983.1686318012.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686318012.git.geert+renesas@glider.be>
References: <cover.1686318012.git.geert+renesas@glider.be>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The section about converting existing KMS drivers to atomic modesetting
mentions the existence of a conversion guide, but does not reference it.
While the guide is old and rusty, it still contains useful information,
so add a link to it.  Also link to the LWN.net articles that give an
overview about the atomic mode setting design.

While at it, remove the reference to unconverted virtual HW drivers, as
they've been converted.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2:
  - Add Reviewed-by,
  - Drop double space after full stop,
  - Use footnotes for references,
  - Remore reference to unconverted virtual HW drivers.
---
 Documentation/gpu/todo.rst | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 68bdafa0284f55f6..6c328613c049fc1d 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -49,14 +49,18 @@ converted over. Modern compositors like Wayland or Surfaceflinger on Android
 really want an atomic modeset interface, so this is all about the bright
 future.
 
-There is a conversion guide for atomic and all you need is a GPU for a
-non-converted driver (again virtual HW drivers for KVM are still all
-suitable).
+There is a conversion guide for atomic [1]_ and all you need is a GPU for a
+non-converted driver.  The "Atomic mode setting design overview" series [2]_
+[3]_ at LWN.net can also be helpful.
 
 As part of this drivers also need to convert to universal plane (which means
 exposing primary & cursor as proper plane objects). But that's much easier to
 do by directly using the new atomic helper driver callbacks.
 
+  .. [1] https://blog.ffwll.ch/2014/11/atomic-modeset-support-for-kms-drivers.html
+  .. [2] https://lwn.net/Articles/653071/
+  .. [3] https://lwn.net/Articles/653466/
+
 Contact: Daniel Vetter, respective driver maintainers
 
 Level: Advanced
-- 
2.34.1

