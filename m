Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5590729BCD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 15:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B01E10E133;
	Fri,  9 Jun 2023 13:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF9B10E133
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 13:44:42 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:a1e2:1b31:cba3:390d])
 by baptiste.telenet-ops.be with bizsmtp
 id 71kZ2A00512zQ4r011kZdr; Fri, 09 Jun 2023 15:44:39 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q7cPS-008La7-38;
 Fri, 09 Jun 2023 15:44:33 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1q7cPp-00GCTT-43;
 Fri, 09 Jun 2023 15:44:33 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomba@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2 2/4] drm/todo: Convert list of fbconv links to footnotes
Date: Fri,  9 Jun 2023 15:44:28 +0200
Message-Id: <be8d2886f50485c86f74a3c1a117abb1b8718a07.1686318012.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert the references to fbconv links to footnotes, so they can be
navigated.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 Documentation/gpu/todo.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 6c328613c049fc1d..ce1d4e22c327063b 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -753,16 +753,16 @@ existing hardware. The new driver's call-back functions are filled from
 existing fbdev code.
 
 More complex fbdev drivers can be refactored step-by-step into a DRM
-driver with the help of the DRM fbconv helpers. [1] These helpers provide
+driver with the help of the DRM fbconv helpers [4]_. These helpers provide
 the transition layer between the DRM core infrastructure and the fbdev
 driver interface. Create a new DRM driver on top of the fbconv helpers,
 copy over the fbdev driver, and hook it up to the DRM code. Examples for
-several fbdev drivers are available at [1] and a tutorial of this process
-available at [2]. The result is a primitive DRM driver that can run X11
+several fbdev drivers are available at [4]_ and a tutorial of this process
+available at [5]_. The result is a primitive DRM driver that can run X11
 and Weston.
 
- - [1] https://gitlab.freedesktop.org/tzimmermann/linux/tree/fbconv
- - [2] https://gitlab.freedesktop.org/tzimmermann/linux/blob/fbconv/drivers/gpu/drm/drm_fbconv_helper.c
+ .. [4] https://gitlab.freedesktop.org/tzimmermann/linux/tree/fbconv
+ .. [5] https://gitlab.freedesktop.org/tzimmermann/linux/blob/fbconv/drivers/gpu/drm/drm_fbconv_helper.c
 
 Contact: Thomas Zimmermann <tzimmermann@suse.de>
 
-- 
2.34.1

