Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8619D1983CA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 20:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6A689E2A;
	Mon, 30 Mar 2020 18:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EFB89E2A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 18:57:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7B4D8804BE;
 Mon, 30 Mar 2020 20:57:47 +0200 (CEST)
Date: Mon, 30 Mar 2020 20:57:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/6] drm/vblank: Add intro to documentation
Message-ID: <20200330185746.GB7594@ravnborg.org>
References: <20200328132025.19910-1-sam@ravnborg.org>
 <20200328132025.19910-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200328132025.19910-2-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=7gkXJVJtAAAA:8 a=QyXUC8HyAAAA:8 a=WRkunCdgfpjp0NbOq-wA:9
 a=6RyHdP9wf0s6W1bbVaoE2bQoMl4=:19 a=CjuIK1q_8ugA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=jd6J4Gguk5HxikPWLKER:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Mikita Lipski <mikita.lipski@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 David Francis <David.Francis@amd.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Nirmoy Das <nirmoy.das@amd.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 James Qian Wang <james.qian.wang@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lyude Paul wrote a very good intro to vblank here:
https://lore.kernel.org/dri-devel/faf63d8a9ed23c16af69762f59d0dca6b2bf085f.camel@redhat.com/T/#mce6480be738160e9d07c5d023e88fd78d7a06d27

Add this to the intro chapter in drm_vblank.c so others
can benefit from it too.

v2:
  - Reworded to improve readability (Thomas)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Co-developed-by: Lyude Paul <lyude@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
---
 drivers/gpu/drm/drm_vblank.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index bcf346b3e486..ec2c2083b186 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -41,6 +41,23 @@
 /**
  * DOC: vblank handling
  *
+ * From the computer's perspective, every time the monitor displays
+ * a new frame the scanout engine have "scanned out" the display image
+ * from top to bottom, one row of pixels at a time.
+ * The current row of pixels is referred to as the current scanline.
+ *
+ * In addition to the display's visible area, there's usually a couple of
+ * extra scanlines which aren't actually displayed on the screen
+ * (the extra scanlines are sometimes used by HDMI audio and friends).
+ * The period where the extra scanlines are "scanned out" is referred
+ * to as the vertical blanking period (vblank for short).
+ *
+ * On a lot of display hardware, programming needs to take effect during the
+ * vertical blanking period so that settings like gamma, what frame being
+ * scanned out, etc. can be safely changed without showing visual tearing
+ * on the screen. In some unforgiving hardware, some of this programming has
+ * to both start and end in the same vblank - vertical blanking period.
+ *
  * Vertical blanking plays a major role in graphics rendering. To achieve
  * tear-free display, users must synchronize page flips and/or rendering to
  * vertical blanking. The DRM API offers ioctls to perform page flips
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
