Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BFB75998D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 17:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F216110E4D2;
	Wed, 19 Jul 2023 15:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6677910E4CD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 15:23:50 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:51f7:4083:c317:cdf])
 by albert.telenet-ops.be with bizsmtp
 id P3Pg2A00E2xuRWb063Pg27; Wed, 19 Jul 2023 17:23:47 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qM91W-001tY0-5d;
 Wed, 19 Jul 2023 17:23:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qM91g-001Bjl-60;
 Wed, 19 Jul 2023 17:23:40 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v3 2/4] drm/todo: Convert list of fbconv links to footnotes
Date: Wed, 19 Jul 2023 17:23:35 +0200
Message-Id: <0761f98d3b6f8df9eea977eae063e35b450fda9e.1689779916.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689779916.git.geert+renesas@glider.be>
References: <cover.1689779916.git.geert+renesas@glider.be>
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

Convert the references to fbconv links to footnotes, so they can be
navigated.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Make main text read correctly when ignoring the footnotes,

v2:
  - New.
---
 Documentation/gpu/todo.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index b93059e384128904..f2a4f6f90c54eefe 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -756,16 +756,16 @@ existing hardware. The new driver's call-back functions are filled from
 existing fbdev code.
 
 More complex fbdev drivers can be refactored step-by-step into a DRM
-driver with the help of the DRM fbconv helpers. [1] These helpers provide
+driver with the help of the DRM fbconv helpers [4]_. These helpers provide
 the transition layer between the DRM core infrastructure and the fbdev
 driver interface. Create a new DRM driver on top of the fbconv helpers,
 copy over the fbdev driver, and hook it up to the DRM code. Examples for
-several fbdev drivers are available at [1] and a tutorial of this process
-available at [2]. The result is a primitive DRM driver that can run X11
-and Weston.
+several fbdev drivers are available in Thomas Zimmermann's fbconv tree
+[4]_, as well as a tutorial of this process [5]_. The result is a primitive
+DRM driver that can run X11 and Weston.
 
- - [1] https://gitlab.freedesktop.org/tzimmermann/linux/tree/fbconv
- - [2] https://gitlab.freedesktop.org/tzimmermann/linux/blob/fbconv/drivers/gpu/drm/drm_fbconv_helper.c
+ .. [4] https://gitlab.freedesktop.org/tzimmermann/linux/tree/fbconv
+ .. [5] https://gitlab.freedesktop.org/tzimmermann/linux/blob/fbconv/drivers/gpu/drm/drm_fbconv_helper.c
 
 Contact: Thomas Zimmermann <tzimmermann@suse.de>
 
-- 
2.34.1

