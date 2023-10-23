Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE047D2BB7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 09:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6946B10E16E;
	Mon, 23 Oct 2023 07:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5764510E16A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698047233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E/xZBjexym1u5u7aqp8YN9N1r+zl4sR8DvaJhc8d5/Q=;
 b=aJoOS+e1aEDJz6F06+AiUUf5CeBQq89JkvsR4Fr71GxU4uPej+smSWSzT1F4N3Wjxd28J9
 xl9OPfGBVlPewlCuxeivG1gqhrlJ8zzXL//1l14CDkjzw3PaJ3+udPRuOdOBWbpMz3BhBR
 frNmXq0Fse4DO4MkMV8Ts2mjoRZhVhE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-107-bTJwXCK1NS-XcT0GMFLIfQ-1; Mon,
 23 Oct 2023 03:47:07 -0400
X-MC-Unique: bTJwXCK1NS-XcT0GMFLIfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84BC21C06E28;
 Mon, 23 Oct 2023 07:47:06 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.225.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE89817312;
 Mon, 23 Oct 2023 07:47:01 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 9/9] drm: Introduce documentation for hotspot properties
Date: Mon, 23 Oct 2023 09:46:13 +0200
Message-ID: <20231023074613.41327-10-aesteve@redhat.com>
In-Reply-To: <20231023074613.41327-1-aesteve@redhat.com>
References: <20231023074613.41327-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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
Cc: linux-doc@vger.kernel.org, banackm@vmware.com,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 mombasawalam@vmware.com, iforbes@vmware.com, Jonathan Corbet <corbet@lwn.net>,
 javierm@redhat.com,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 David Airlie <airlied@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Matt Roper <matthew.d.roper@intel.com>, linux-kernel@vger.kernel.org,
 krastevm@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Banack <banackm@vmware.com>

To clarify the intent and reasoning behind the hotspot properties
introduce userspace documentation that goes over cursor handling
in para-virtualized environments.

The documentation is generic enough to not special case for any
specific hypervisor and should apply equally to all.

Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 Documentation/gpu/drm-kms.rst |  6 ++++
 drivers/gpu/drm/drm_plane.c   | 58 ++++++++++++++++++++++++++++++++++-
 2 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index a0c83fc481264..158cdcc9351f9 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -577,6 +577,12 @@ Variable Refresh Properties
 .. kernel-doc:: drivers/gpu/drm/drm_connector.c
    :doc: Variable refresh properties
 
+Cursor Hotspot Properties
+---------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_plane.c
+   :doc: hotspot properties
+
 Existing KMS Properties
 -----------------------
 
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 1dc00ad4c33c3..f3f2eae83cca8 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -230,6 +230,61 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 	return 0;
 }
 
+/**
+ * DOC: hotspot properties
+ *
+ * HOTSPOT_X: property to set mouse hotspot x offset.
+ * HOTSPOT_Y: property to set mouse hotspot y offset.
+ *
+ * When the plane is being used as a cursor image to display a mouse pointer,
+ * the "hotspot" is the offset within the cursor image where mouse events
+ * are expected to go.
+ *
+ * Positive values move the hotspot from the top-left corner of the cursor
+ * plane towards the right and bottom.
+ *
+ * Most display drivers do not need this information because the
+ * hotspot is not actually connected to anything visible on screen.
+ * However, this is necessary for display drivers like the para-virtualized
+ * drivers (eg qxl, vbox, virtio, vmwgfx), that are attached to a user console
+ * with a mouse pointer.  Since these consoles are often being remoted over a
+ * network, they would otherwise have to wait to display the pointer movement to
+ * the user until a full network round-trip has occurred.  New mouse events have
+ * to be sent from the user's console, over the network to the virtual input
+ * devices, forwarded to the desktop for processing, and then the cursor plane's
+ * position can be updated and sent back to the user's console over the network.
+ * Instead, with the hotspot information, the console can anticipate the new
+ * location, and draw the mouse cursor there before the confirmation comes in.
+ * To do that correctly, the user's console must be able predict how the
+ * desktop will process mouse events, which normally requires the desktop's
+ * mouse topology information, ie where each CRTC sits in the mouse coordinate
+ * space.  This is typically sent to the para-virtualized drivers using some
+ * driver-specific method, and the driver then forwards it to the console by
+ * way of the virtual display device or hypervisor.
+ *
+ * The assumption is generally made that there is only one cursor plane being
+ * used this way at a time, and that the desktop is feeding all mouse devices
+ * into the same global pointer.  Para-virtualized drivers that require this
+ * should only be exposing a single cursor plane, or find some other way
+ * to coordinate with a userspace desktop that supports multiple pointers.
+ * If the hotspot properties are set, the cursor plane is therefore assumed to be
+ * used only for displaying a mouse cursor image, and the position of the combined
+ * cursor plane + offset can therefore be used for coordinating with input from a
+ * mouse device.
+ *
+ * The cursor will then be drawn either at the location of the plane in the CRTC
+ * console, or as a free-floating cursor plane on the user's console
+ * corresponding to their desktop mouse position.
+ *
+ * DRM clients which would like to work correctly on drivers which expose
+ * hotspot properties should advertise DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT.
+ * Setting this property on drivers which do not special case
+ * cursor planes will return EOPNOTSUPP, which can be used by userspace to
+ * gauge requirements of the hardware/drivers they're running on. Advertising
+ * DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT implies that the userspace client will be
+ * correctly setting the hotspot properties.
+ */
+
 /**
  * drm_plane_create_hotspot_properties - creates the mouse hotspot
  * properties and attaches them to the given cursor plane
@@ -237,7 +292,8 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
  * @plane: drm cursor plane
  *
  * This function enables the mouse hotspot property on a given
- * cursor plane.
+ * cursor plane. Look at the documentation for hotspot properties
+ * to get a better understanding for what they're used for.
  *
  * RETURNS:
  * Zero for success or -errno
-- 
2.41.0

