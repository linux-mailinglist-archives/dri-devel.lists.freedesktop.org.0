Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D701E428417
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 00:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD876E3F9;
	Sun, 10 Oct 2021 22:45:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF1C6E3F9
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 22:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=zZJzETgz2Wp+qRmqRUpxUZm0BAho4on48nu/OSIk334=; b=11zW+hiUCpSZ0z1hb110i4+45n
 MXuJ0y67uf/qT6dumZ+To8l5fPhbj20BUDzt+v9da6bgr1EoLLFoSrgOYDs2Ykuc5df7cXbgc7XoU
 JmuJ+kfmElyt7z8YH/N1l7RzRRJS0bQgIhV6ebsPawaqq9TyhcblR1kt4x/d/WL4fRwE+UdGKEnai
 JVAFyLAH+Iw1NEq+iUWu9mpbF5VlwARngcL7Uq8sqXki+ecpIhRv7xZjiAAIhBbjNhhtlZg5LCBig
 rB8hPT//SqHeysyUZZ0/8eBWpiry1sBmHi5L5PWmpQ7nzkijVY5AEouOG1k5AU5R0vHolrs1GGQB2
 lokkf4sg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZhYz-007Rf9-DY; Sun, 10 Oct 2021 22:45:01 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Derek Basehore <dbasehore@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH -next v2] drm/connector: fix all kernel-doc warnings
Date: Sun, 10 Oct 2021 15:44:59 -0700
Message-Id: <20211010224459.3603-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clean up all of the kernel-doc issues in drm_connector.c:

drivers/gpu/drm/drm_connector.c:2611: warning: Excess function parameter 'connector' description in 'drm_connector_oob_hotplug_event'
drivers/gpu/drm/drm_connector.c:2611: warning: Function parameter or member 'connector_fwnode' not described in 'drm_connector_oob_hotplug_event'

drm_connector.c:630: warning: No description found for return value of 'drm_get_connector_status_name'
drm_connector.c:715: warning: No description found for return value of 'drm_connector_list_iter_next'
drm_connector.c:785: warning: No description found for return value of 'drm_get_subpixel_order_name'
drm_connector.c:816: warning: No description found for return value of 'drm_display_info_set_bus_formats'
drm_connector.c:1331: warning: No description found for return value of 'drm_mode_create_dvi_i_properties'
drm_connector.c:1412: warning: No description found for return value of 'drm_connector_attach_content_type_property'
drm_connector.c:1492: warning: No description found for return value of 'drm_mode_create_tv_margin_properties'
drm_connector.c:1534: warning: No description found for return value of 'drm_mode_create_tv_properties'
drm_connector.c:1627: warning: No description found for return value of 'drm_mode_create_scaling_mode_property'
drm_connector.c:1944: warning: No description found for return value of 'drm_mode_create_suggested_offset_properties'

drm_connector.c:2315: warning: missing initial short description on line:
 * drm_connector_set_panel_orientation_with_quirk -

[The last warning listed is probably a quirk/bug in scripts/kernel-doc.]

Fixes: 613051dac40d ("drm: locking&new iterators for connector_list")
Fixes: 522171951761 ("drm: Extract drm_connector.[hc]")
Fixes: b3c6c8bfe378 ("drm: document drm_display_info")
Fixes: 50525c332b55 ("drm: content-type property for HDMI connector")
Fixes: 6c4f52dca36f ("drm/connector: Allow creation of margin props alone")
Fixes: 69654c632d80 ("drm/connector: Split out orientation quirk detection (v2)")
Fixes: 72ad49682dde ("drm/connector: Add support for out-of-band hotplug notification (v3)")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Derek Basehore <dbasehore@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
v2: drop Cc: Boris Brezillon <boris.brezillon@bootlin.com> [bounced]
    Address Sam's comment on Returns:

72ad49682dde ("drm/connector: Add support for out-of-band hotplug notification (v3)")
  is only in linux-next. The others are in mainline.

 drivers/gpu/drm/drm_connector.c |   30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

--- linux-next-20211007.orig/drivers/gpu/drm/drm_connector.c
+++ linux-next-20211007/drivers/gpu/drm/drm_connector.c
@@ -625,6 +625,8 @@ int drm_connector_register_all(struct dr
  *
  * In contrast to the other drm_get_*_name functions this one here returns a
  * const pointer and hence is threadsafe.
+ *
+ * Returns: connector status string
  */
 const char *drm_get_connector_status_name(enum drm_connector_status status)
 {
@@ -707,7 +709,7 @@ __drm_connector_put_safe(struct drm_conn
  * drm_connector_list_iter_next - return next connector
  * @iter: connector_list iterator
  *
- * Returns the next connector for @iter, or NULL when the list walk has
+ * Returns: the next connector for @iter, or NULL when the list walk has
  * completed.
  */
 struct drm_connector *
@@ -780,6 +782,8 @@ static const struct drm_prop_enum_list d
  *
  * Note you could abuse this and return something out of bounds, but that
  * would be a caller error.  No unscrubbed user data should make it here.
+ *
+ * Returns: string describing an enumerated subpixel property
  */
 const char *drm_get_subpixel_order_name(enum subpixel_order order)
 {
@@ -809,6 +813,9 @@ static const struct drm_prop_enum_list d
  * Store the supported bus formats in display info structure.
  * See MEDIA_BUS_FMT_* definitions in include/uapi/linux/media-bus-format.h for
  * a full list of available formats.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
  */
 int drm_display_info_set_bus_formats(struct drm_display_info *info,
 				     const u32 *formats,
@@ -1326,6 +1333,8 @@ int drm_connector_create_standard_proper
  * @dev: DRM device
  *
  * Called by a driver the first time a DVI-I connector is made.
+ *
+ * Returns: %0
  */
 int drm_mode_create_dvi_i_properties(struct drm_device *dev)
 {
@@ -1407,6 +1416,8 @@ EXPORT_SYMBOL(drm_connector_attach_dp_su
  * @connector: connector to attach content type property on.
  *
  * Called by a driver the first time a HDMI connector is made.
+ *
+ * Returns: %0
  */
 int drm_connector_attach_content_type_property(struct drm_connector *connector)
 {
@@ -1487,6 +1498,9 @@ EXPORT_SYMBOL(drm_connector_attach_tv_ma
  * creates the TV margin properties for a given device. No need to call this
  * function for an SDTV connector, it's already called from
  * drm_mode_create_tv_properties().
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
  */
 int drm_mode_create_tv_margin_properties(struct drm_device *dev)
 {
@@ -1527,6 +1541,9 @@ EXPORT_SYMBOL(drm_mode_create_tv_margin_
  * the TV specific connector properties for a given device.  Caller is
  * responsible for allocating a list of format names and passing them to
  * this routine.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
  */
 int drm_mode_create_tv_properties(struct drm_device *dev,
 				  unsigned int num_modes,
@@ -1622,6 +1639,8 @@ EXPORT_SYMBOL(drm_mode_create_tv_propert
  * Atomic drivers should use drm_connector_attach_scaling_mode_property()
  * instead to correctly assign &drm_connector_state.scaling_mode
  * in the atomic state.
+ *
+ * Returns: %0
  */
 int drm_mode_create_scaling_mode_property(struct drm_device *dev)
 {
@@ -1939,6 +1958,9 @@ EXPORT_SYMBOL(drm_mode_create_content_ty
  * @dev: DRM device
  *
  * Create the suggested x/y offset property for connectors.
+ *
+ * Returns:
+ * 0 on success or a negative error code on failure.
  */
 int drm_mode_create_suggested_offset_properties(struct drm_device *dev)
 {
@@ -2312,8 +2334,8 @@ int drm_connector_set_panel_orientation(
 EXPORT_SYMBOL(drm_connector_set_panel_orientation);
 
 /**
- * drm_connector_set_panel_orientation_with_quirk -
- *	set the connector's panel_orientation after checking for quirks
+ * drm_connector_set_panel_orientation_with_quirk - set the
+ *	connector's panel_orientation after checking for quirks
  * @connector: connector for which to init the panel-orientation property.
  * @panel_orientation: drm_panel_orientation value to set
  * @width: width in pixels of the panel, used for panel quirk detection
@@ -2597,7 +2619,7 @@ struct drm_connector *drm_connector_find
 
 /**
  * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
- * @connector: connector to report the event on
+ * @connector_fwnode: fwnode_handle to report the event on
  *
  * On some hardware a hotplug event notification may come from outside the display
  * driver / device. An example of this is some USB Type-C setups where the hardware
