Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF88B96DA44
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 15:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2113D10E8A6;
	Thu,  5 Sep 2024 13:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="keHLNpp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032C110E8A6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 13:27:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC82A2000B;
 Thu,  5 Sep 2024 13:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1725542840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=I7Nl5BPCerC4TRzZtuxPznq8lIdgPFtcwnnFQ8ypP5c=;
 b=keHLNpp4XldTlvP63127GPPUzIFDbU/Y750C2ZlpGX+mYJlIjkuMgWPlUrtjSgA83Madnz
 5SQDxi6PorOZYcMv+U22lLEVXmyNauIWVIHYbQuyS0Ww7hLsyGMaN5ezvlIN8jFKOHNTgC
 m18NKxpHrEEPnJDZidnAh27flY0sRF/iUIXgFAt0ZAvPlWMn22OS//Kgl1oJRmdXMfCbLh
 CEIE14uLwzxYLKWYFAQIK4d7EXDUiGINfNGFvfDsBhfzyM4V3e6tBKIP9+C1rDMy6Ju5tl
 fto/Ja2Pf8IVdaBaJPWa5cLBWIceX3OGbBPxBdmShe1Tc4XZ29/K+7COktX9iw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 05 Sep 2024 15:27:06 +0200
Subject: [PATCH v4] drm/vkms: Add documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240905-google-clarifications-v4-1-e43c1f2e3d87@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAKmx2WYC/3XOTW6DMBAF4KsgrzutbcBAVr1H1YV/BjIS4NR2U
 aqIu9d1VClVxc7P0vvm3VjEQBjZqbqxgBtF8msOzVPF7FmvEwK5nJnksuGt5DB5P80IdtaBRrI
 65UIEhw57Zw3WvWa5ewk40rW4b+/3HPDjM/Pp/smMjlnxy0LpVLmwwELRvvw+YMVrYj/NM8Xkw
 1cZuIlSLVt60Rxs2QRwqBE75TrHrexfjfdppvU5nyvmJh8cqY4cCQJk2zWqbQ03g/jv1I/OcOT
 U2RmV4g3KUcmh++vs+/4NvBMcNYYBAAA=
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=15973;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=msik5h240JcqSQciB7xA4YJ7nQLtbLgH19cwADMJmLs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBm2bGsfpIGfnYfvM9EWTaOuE7cWqLRDU9FDFW9N
 6ab11/zbfOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZtmxrAAKCRAgrS7GWxAs
 4kBQEACC3/8RfrQIzgHzDwDW2RxXl7wr6yXQxrLXECHrrUl8tcG/Xng/DmMkuoHYjMvemjvjMHF
 3a7S3gl67fLJme3O6IXeWOd0bwvsCezAiXahj8is4JA4MUlD03XWNYPD6Q+zcG7Oi8mn4LS06JN
 NOcbY184TQ5Z1F4k1C/w49AjoPXdoo+pAEto0D0al/YNHvDley+SYExfc6yiSSU9uUb7s1NOjDa
 qJ2dGmZ2vwL3M5Y20PB3l6s6JgjVIZdQ4jOMxSIPm2LkBSeJynd0Zp8i3ceU2Ki1778LjJT3XM0
 WDotvyvO1ZSQQSoku5HuCICQZjZYrsXe6KKlKt+8E1Dbfxn3oMsKeIPtzRL8Q//xh3l2pHhaCIT
 10Tzsagk4iYHGosjO80tEtChe3NWmiWLqhJ5bZ9No5Fn7anzUjdXtoApzsfFrTsSLrjnLIBK/Su
 O69vhcxY7NG5Pi49hM+XNIFHyL3ImvkCVknmPzx1ToB28l5LPwOqM5SY6xo6N9CVTayPrIhZx6H
 Md4FKcSbtnpXo2Qfdj6qrtR581agLbOycWlN9axvwA7W+Lsp3WYGic+DhUCVyElpdG+S+EuNHUB
 3leOWUZRWGbWSr2oeqGlRGPgVgiglBeOD3jk4wbkOBQXKSVNBvJ9Krvl/AoJw/1K5Q/aMr0xBA+
 NyDTbEMwMhIMy+A==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Add documentation around vkms_output and its initialization.
Add some documentation on pixel conversion functions.
Update of outdated comments for pixel_write functions.

Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
This series does not introduce functionnal changes, only some
documentation and renaming to clarify the code.
---
Changes in v4:
- Applied comments from José
- Link to v3: https://lore.kernel.org/r/20240829-google-clarifications-v3-1-f6604e2f6297@bootlin.com

Changes in v3:
- Merged https://lore.kernel.org/all/20240802-yuv-v9-3-08a706669e16@bootlin.com/
  as it also add documentation
- Apply José's comments, sorry
- Replace =1 by =BIT(0) for possible_crtc value
- Link to v2: https://lore.kernel.org/r/20240826-google-clarifications-v2-1-2574655b0b91@bootlin.com

Changes in v2:
- Dropped already applied patches
- Dropped useless patch as its content is deleted later
- Remove dependency on previous series
- Apply Maíra's comments
- Link to v1: https://lore.kernel.org/r/20240814-google-clarifications-v1-0-3ee76d7d0c28@bootlin.com
---
 drivers/gpu/drm/vkms/vkms_composer.c |   7 +++
 drivers/gpu/drm/vkms/vkms_drv.h      | 101 ++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_formats.c  |  62 +++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_output.c   |  14 ++++-
 4 files changed, 161 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index e7441b227b3c..57a5769fc994 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -189,6 +189,13 @@ static void blend(struct vkms_writeback_job *wb,
 
 	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
 
+	/*
+	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
+	 * complexity to avoid poor blending performance.
+	 *
+	 * The function vkms_compose_row() is used to read a line, pixel-by-pixel, into the staging
+	 * buffer.
+	 */
 	for (size_t y = 0; y < crtc_y_limit; y++) {
 		fill_background(&background_color, output_buffer);
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 5e46ea5b96dc..672fe191e239 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -25,6 +25,17 @@
 
 #define VKMS_LUT_SIZE 256
 
+/**
+ * struct vkms_frame_info - Structure to store the state of a frame
+ *
+ * @fb: backing drm framebuffer
+ * @src: source rectangle of this frame in the source framebuffer, stored in 16.16 fixed-point form
+ * @dst: destination rectangle in the crtc buffer, stored in whole pixel units
+ * @map: see @drm_shadow_plane_state.data
+ * @rotation: rotation applied to the source.
+ *
+ * @src and @dst should have the same size modulo the rotation.
+ */
 struct vkms_frame_info {
 	struct drm_framebuffer *fb;
 	struct drm_rect src, dst;
@@ -52,9 +63,11 @@ struct vkms_writeback_job {
 };
 
 /**
- * vkms_plane_state - Driver specific plane state
+ * struct vkms_plane_state - Driver specific plane state
  * @base: base plane state
  * @frame_info: data required for composing computation
+ * @pixel_read: function to read a pixel in this plane. The creator of a struct vkms_plane_state
+ *	        must ensure that this pointer is valid
  */
 struct vkms_plane_state {
 	struct drm_shadow_plane_state base;
@@ -73,29 +86,56 @@ struct vkms_color_lut {
 };
 
 /**
- * vkms_crtc_state - Driver specific CRTC state
+ * struct vkms_crtc_state - Driver specific CRTC state
+ *
  * @base: base CRTC state
  * @composer_work: work struct to compose and add CRC entries
- * @n_frame_start: start frame number for computed CRC
- * @n_frame_end: end frame number for computed CRC
+ *
+ * @num_active_planes: Number of active planes
+ * @active_planes: List containing all the active planes (counted by
+ *		   @num_active_planes). They should be stored in z-order.
+ * @active_writeback: Current active writeback job
+ * @gamma_lut: Look up table for gamma used in this CRTC
+ * @crc_pending: Protected by @vkms_output.composer_lock, true when the frame CRC is not computed
+ *		 yet. Used by vblank to detect if the composer is too slow.
+ * @wb_pending: Protected by @vkms_output.composer_lock, true when a writeback frame is requested.
+ * @frame_start: Protected by @vkms_output.composer_lock, saves the frame number before the start
+ *		 of the composition process.
+ * @frame_end: Protected by @vkms_output.composer_lock, saves the last requested frame number.
+ *	       This is used to generate enough CRC entries when the composition worker is too slow.
  */
 struct vkms_crtc_state {
 	struct drm_crtc_state base;
 	struct work_struct composer_work;
 
 	int num_active_planes;
-	/* stack of active planes for crc computation, should be in z order */
 	struct vkms_plane_state **active_planes;
 	struct vkms_writeback_job *active_writeback;
 	struct vkms_color_lut gamma_lut;
 
-	/* below four are protected by vkms_output.composer_lock */
 	bool crc_pending;
 	bool wb_pending;
 	u64 frame_start;
 	u64 frame_end;
 };
 
+/**
+ * struct vkms_output - Internal representation of all output components in VKMS
+ *
+ * @crtc: Base CRTC in DRM
+ * @encoder: DRM encoder used for this output
+ * @connector: DRM connector used for this output
+ * @wb_connecter: DRM writeback connector used for this output
+ * @vblank_hrtimer: Timer used to trigger the vblank
+ * @period_ns: vblank period, in nanoseconds, used to configure @vblank_hrtimer and to compute
+ *	       vblank timestamps
+ * @composer_workq: Ordered workqueue for @composer_state.composer_work.
+ * @lock: Lock used to protect concurrent access to the composer
+ * @composer_enabled: Protected by @lock, true when the VKMS composer is active (crc needed or
+ *		      writeback)
+ * @composer_state: Protected by @lock, current state of this VKMS output
+ * @composer_lock: Lock used internally to protect @composer_state members
+ */
 struct vkms_output {
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
@@ -103,28 +143,38 @@ struct vkms_output {
 	struct drm_writeback_connector wb_connector;
 	struct hrtimer vblank_hrtimer;
 	ktime_t period_ns;
-	/* ordered wq for composer_work */
 	struct workqueue_struct *composer_workq;
-	/* protects concurrent access to composer */
 	spinlock_t lock;
 
-	/* protected by @lock */
 	bool composer_enabled;
 	struct vkms_crtc_state *composer_state;
 
 	spinlock_t composer_lock;
 };
 
-struct vkms_device;
-
+/**
+ * struct vkms_config - General configuration for VKMS driver
+ *
+ * @writeback: If true, a writeback buffer can be attached to the CRTC
+ * @cursor: If true, a cursor plane is created in the VKMS device
+ * @overlay: If true, NUM_OVERLAY_PLANES will be created for the VKMS device
+ * @dev: Used to store the current VKMS device. Only set when the device is instantiated.
+ */
 struct vkms_config {
 	bool writeback;
 	bool cursor;
 	bool overlay;
-	/* only set when instantiated */
 	struct vkms_device *dev;
 };
 
+/**
+ * struct vkms_device - Description of a VKMS device
+ *
+ * @drm - Base device in DRM
+ * @platform - Associated platform device
+ * @output - Configuration and sub-components of the VKMS device
+ * @config: Configuration used in this VKMS device
+ */
 struct vkms_device {
 	struct drm_device drm;
 	struct platform_device *platform;
@@ -132,6 +182,10 @@ struct vkms_device {
 	const struct vkms_config *config;
 };
 
+/*
+ * The following helpers are used to convert a member of a struct into its parent.
+ */
+
 #define drm_crtc_to_vkms_output(target) \
 	container_of(target, struct vkms_output, crtc)
 
@@ -144,12 +198,33 @@ struct vkms_device {
 #define to_vkms_plane_state(target)\
 	container_of(target, struct vkms_plane_state, base.base)
 
-/* CRTC */
+/**
+ * vkms_crtc_init() - Initialize a CRTC for VKMS
+ * @dev: DRM device associated with the VKMS buffer
+ * @crtc: uninitialized CRTC device
+ * @primary: primary plane to attach to the CRTC
+ * @cursor: plane to attach to the CRTC
+ */
 int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 		   struct drm_plane *primary, struct drm_plane *cursor);
 
+/**
+ * vkms_output_init() - Initialize all sub-components needed for a VKMS device.
+ *
+ * @vkmsdev: VKMS device to initialize
+ * @index: CRTC which can be attached to the planes. The caller must ensure that
+ *	   @index is positive and less or equals to 31.
+ */
 int vkms_output_init(struct vkms_device *vkmsdev, int index);
 
+/**
+ * vkms_plane_init() - Initialize a plane
+ *
+ * @vkmsdev: VKMS device containing the plane
+ * @type: type of plane to initialize
+ * @index: CRTC which can be attached to the plane. The caller must ensure that
+ *	   @index is positive and less or equals to 31.
+ */
 struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 				   enum drm_plane_type type, int index);
 
diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 040b7f113a3b..e8a5cc235ebb 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -9,24 +9,40 @@
 
 #include "vkms_formats.h"
 
+/**
+ * pixel_offset() - Get the offset of the pixel at coordinates x/y in the first plane
+ *
+ * @frame_info: Buffer metadata
+ * @x: The x coordinate of the wanted pixel in the buffer
+ * @y: The y coordinate of the wanted pixel in the buffer
+ *
+ * The caller must ensure that the framebuffer associated with this request uses a pixel format
+ * where block_h == block_w == 1.
+ * If this requirement is not fulfilled, the resulting offset can point to an other pixel or
+ * outside of the buffer.
+ */
 static size_t pixel_offset(const struct vkms_frame_info *frame_info, int x, int y)
 {
 	return frame_info->offset + (y * frame_info->pitch)
 				  + (x * frame_info->cpp);
 }
 
-/*
- * packed_pixels_addr - Get the pointer to pixel of a given pair of coordinates
+/**
+ * packed_pixels_addr() - Get the pointer to the block containing the pixel at the given
+ * coordinates
  *
  * @frame_info: Buffer metadata
- * @x: The x(width) coordinate of the 2D buffer
- * @y: The y(Heigth) coordinate of the 2D buffer
+ * @x: The x (width) coordinate inside the plane
+ * @y: The y (height) coordinate inside the plane
  *
  * Takes the information stored in the frame_info, a pair of coordinates, and
  * returns the address of the first color channel.
  * This function assumes the channels are packed together, i.e. a color channel
  * comes immediately after another in the memory. And therefore, this function
  * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
+ *
+ * The caller must ensure that the framebuffer associated with this request uses a pixel format
+ * where block_h == block_w == 1, otherwise the returned pointer can be outside the buffer.
  */
 static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
 				int x, int y)
@@ -51,6 +67,13 @@ static int get_x_position(const struct vkms_frame_info *frame_info, int limit, i
 	return x;
 }
 
+/*
+ * The following functions take pixel data from the buffer and convert them to the format
+ * ARGB16161616 in @out_pixel.
+ *
+ * They are used in the vkms_compose_row() function to handle multiple formats.
+ */
+
 static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u16 *out_pixel)
 {
 	/*
@@ -143,12 +166,11 @@ void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_plane_state
 }
 
 /*
- * The following  functions take an line of argb_u16 pixels from the
- * src_buffer, convert them to a specific format, and store them in the
- * destination.
+ * The following functions take one &struct pixel_argb_u16 and convert it to a specific format.
+ * The result is stored in @dst_pixels.
  *
- * They are used in the `compose_active_planes` to convert and store a line
- * from the src_buffer to the writeback buffer.
+ * They are used in vkms_writeback_row() to convert and store a pixel from the src_buffer to
+ * the writeback buffer.
  */
 static void argb_u16_to_ARGB8888(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 {
@@ -214,6 +236,14 @@ static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
 	*pixels = cpu_to_le16(r << 11 | g << 5 | b);
 }
 
+/**
+ * vkms_writeback_row() - Generic loop for all supported writeback format. It is executed just
+ * after the blending to write a line in the writeback buffer.
+ *
+ * @wb: Job where to insert the final image
+ * @src_buffer: Line to write
+ * @y: Row to write in the writeback buffer
+ */
 void vkms_writeback_row(struct vkms_writeback_job *wb,
 			const struct line_buffer *src_buffer, int y)
 {
@@ -227,6 +257,13 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
 		wb->pixel_write(dst_pixels, &in_pixels[x]);
 }
 
+/**
+ * get_pixel_conversion_function() - Retrieve the correct read_pixel function for a specific
+ * format. The returned pointer is NULL for unsupported pixel formats. The caller must ensure that
+ * the pointer is valid before using it in a vkms_plane_state.
+ *
+ * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
+ */
 void *get_pixel_conversion_function(u32 format)
 {
 	switch (format) {
@@ -245,6 +282,13 @@ void *get_pixel_conversion_function(u32 format)
 	}
 }
 
+/**
+ * get_pixel_write_function() - Retrieve the correct write_pixel function for a specific format.
+ * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
+ * pointer is valid before using it in a vkms_writeback_job.
+ *
+ * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
+ */
 void *get_pixel_write_function(u32 format)
 {
 	switch (format) {
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 5ce70dd946aa..0a5a185aa0b0 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -21,6 +21,7 @@ static int vkms_conn_get_modes(struct drm_connector *connector)
 {
 	int count;
 
+	/* Use the default modes list from DRM */
 	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
 	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
 
@@ -58,6 +59,12 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 	int writeback;
 	unsigned int n;
 
+	/*
+	 * Initialize used plane. One primary plane is required to perform the composition.
+	 *
+	 * The overlay and cursor planes are not mandatory, but can be used to perform complex
+	 * composition.
+	 */
 	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
@@ -76,6 +83,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 			return PTR_ERR(cursor);
 	}
 
+	/* [1]: Allocation of a CRTC, its index will be BIT(0) = 1 */
 	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
 	if (ret)
 		return ret;
@@ -95,7 +103,11 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
 		DRM_ERROR("Failed to init encoder\n");
 		goto err_encoder;
 	}
-	encoder->possible_crtcs = 1;
+	/*
+	 * This is a hardcoded value to select crtc for the encoder.
+	 * BIT(0) here designate the first registered CRTC, the one allocated in [1]
+	 */
+	encoder->possible_crtcs = BIT(0);
 
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret) {

---
base-commit: 84addde447fd9d713e101437db0d4924855eff4f
change-id: 20240520-google-clarifications-dede8dcbe38a

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

