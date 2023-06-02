Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D10F071FD3B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 11:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2D510E641;
	Fri,  2 Jun 2023 09:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DC710E63D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 09:11:49 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:158c:2ccf:1f70:e136])
 by andre.telenet-ops.be with bizsmtp
 id 49Bg2A0061tRZS8019BgaW; Fri, 02 Jun 2023 11:11:46 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q50ob-00BvaL-2W;
 Fri, 02 Jun 2023 11:11:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q50ou-00ASIJ-6O;
 Fri, 02 Jun 2023 11:11:40 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomba@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 1/3] drm/todo: Add atomic modesetting references
Date: Fri,  2 Jun 2023 11:11:34 +0200
Message-Id: <7cea42cd09540657875a210cd16421125497d690.1685696114.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685696114.git.geert+renesas@glider.be>
References: <cover.1685696114.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The section about converting existing KMS drivers to atomic modesetting
mentions the existence of a conversion guide, but does not reference it.
While the guide is old and rusty, it still contains useful information,
so add a link to it.  Also link to the LWN.net articles that give an
overview about the atomic mode setting design.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/gpu/todo.rst | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 68bdafa0284f55f6..51eb67f5268c5ec1 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -49,14 +49,19 @@ converted over. Modern compositors like Wayland or Surfaceflinger on Android
 really want an atomic modeset interface, so this is all about the bright
 future.
 
-There is a conversion guide for atomic and all you need is a GPU for a
+There is a conversion guide for atomic[1] and all you need is a GPU for a
 non-converted driver (again virtual HW drivers for KVM are still all
-suitable).
+suitable).  The "Atomic mode setting design overview" series [2][3] at
+LWN.net can also be helpful.
 
 As part of this drivers also need to convert to universal plane (which means
 exposing primary & cursor as proper plane objects). But that's much easier to
 do by directly using the new atomic helper driver callbacks.
 
+  - [1] https://blog.ffwll.ch/2014/11/atomic-modeset-support-for-kms-drivers.html
+  - [2] https://lwn.net/Articles/653071/
+  - [3] https://lwn.net/Articles/653466/
+
 Contact: Daniel Vetter, respective driver maintainers
 
 Level: Advanced
-- 
2.34.1

