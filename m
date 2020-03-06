Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928FC17C8D3
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 00:46:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17636ED9F;
	Fri,  6 Mar 2020 23:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608926ED9A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 23:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583538394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lTUrg/boY4FBmBAf+w0ggxQJvpm8pYpnAaBMDLRjV3g=;
 b=cL46zcpKYVySu98XAxP61C0PXIUgemBv4HtDEgiMq/zife8NqatBGc+wC4yDmUvcZz89+T
 MGPMka00yv94OeYEvw5fQ0VA9RDI1R9SUFJXwNC0q0x+/GzPEKjiF661p9i+cX+XBA3wwD
 C+73upsziGVqX4WhRoLdHn3P3zkhcDw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-Nvi-WvJDP-Wy3L08tQTKLw-1; Fri, 06 Mar 2020 18:46:32 -0500
X-MC-Unique: Nvi-WvJDP-Wy3L08tQTKLw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21CE713F7;
 Fri,  6 Mar 2020 23:46:31 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1BCF73873;
 Fri,  6 Mar 2020 23:46:29 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/dp_mst: Rename drm_dp_mst_is_dp_mst_end_device()
 to be less redundant
Date: Fri,  6 Mar 2020 18:46:19 -0500
Message-Id: <20200306234623.547525-2-lyude@redhat.com>
In-Reply-To: <20200306234623.547525-1-lyude@redhat.com>
References: <20200306234623.547525-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's already prefixed by dp_mst, so we don't really need to repeat
ourselves here. One of the changes I should have picked up originally
when reviewing MST DSC support.

There should be no functional changes here

Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Sean Paul <seanpaul@google.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 6c62ad8f4414..6714d8a5c558 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -1937,7 +1937,7 @@ static u8 drm_dp_calculate_rad(struct drm_dp_mst_port *port,
 	return parent_lct + 1;
 }
 
-static bool drm_dp_mst_is_dp_mst_end_device(u8 pdt, bool mcs)
+static bool drm_dp_mst_is_end_device(u8 pdt, bool mcs)
 {
 	switch (pdt) {
 	case DP_PEER_DEVICE_DP_LEGACY_CONV:
@@ -1967,13 +1967,13 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt,
 
 	/* Teardown the old pdt, if there is one */
 	if (port->pdt != DP_PEER_DEVICE_NONE) {
-		if (drm_dp_mst_is_dp_mst_end_device(port->pdt, port->mcs)) {
+		if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
 			/*
 			 * If the new PDT would also have an i2c bus,
 			 * don't bother with reregistering it
 			 */
 			if (new_pdt != DP_PEER_DEVICE_NONE &&
-			    drm_dp_mst_is_dp_mst_end_device(new_pdt, new_mcs)) {
+			    drm_dp_mst_is_end_device(new_pdt, new_mcs)) {
 				port->pdt = new_pdt;
 				port->mcs = new_mcs;
 				return 0;
@@ -1993,7 +1993,7 @@ drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt,
 	port->mcs = new_mcs;
 
 	if (port->pdt != DP_PEER_DEVICE_NONE) {
-		if (drm_dp_mst_is_dp_mst_end_device(port->pdt, port->mcs)) {
+		if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
 			/* add i2c over sideband */
 			ret = drm_dp_mst_register_i2c_bus(&port->aux);
 		} else {
@@ -2169,7 +2169,7 @@ drm_dp_mst_port_add_connector(struct drm_dp_mst_branch *mstb,
 	}
 
 	if (port->pdt != DP_PEER_DEVICE_NONE &&
-	    drm_dp_mst_is_dp_mst_end_device(port->pdt, port->mcs)) {
+	    drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
 		port->cached_edid = drm_get_edid(port->connector,
 						 &port->aux.ddc);
 		drm_connector_set_tile_property(port->connector);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
