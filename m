Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHiVOVZSjmmYBgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 23:21:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE28131802
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 23:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60E910E2B7;
	Thu, 12 Feb 2026 22:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="EKVegII2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC8210E2B2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 22:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-953a8a3ca9;
 t=1770934865; bh=h/KQP1W2xBojGRSvIriUMX//C4oXkUFCwk6impK46Vc=;
 b=EKVegII2x1yx8PPvX0FWr1ze6cOWWvvRYfnrduW8BgcB1uWn1f2SHxbOTluRgb24RtAVim73p
 f1mbY9pHFFj1Bv78Uxx5z5Wc9XCPf9wG7pmgdwhqN6+MXicvt8/0gxvdyszFg4YwrrUCOUwJUKH
 xz17LjifqyqLLyQI3rh/hoVjxBh5tK6wZAfh3EmO+Ak55xcH0dXOY0m55xZAzezA22zI0y3P0zY
 VqWWCXg3d4dJUp473FNaYDYGfYKXgE+y+puyl5J8HCqhnWeFPR0XA7qat6cMvBPMA6wR+FUUDH7
 D/JS+b9qOYKaEJs0PQ26icOpnSljoJ15AnXlMn7hJ1BQ==
X-Forward-Email-ID: 698e524f1cff1f790f79782b
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.6.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Joshua Peisach <jpeisach@ubuntu.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com,
 Joshua Peisach <jpeisach@ubuntu.com>
Subject: [PATCH 2/2] drm/amdgpu/amdgpu_connectors: remove
 amdgpu_connector_free_edid
Date: Thu, 12 Feb 2026 17:20:29 -0500
Message-ID: <20260212222029.15777-3-jpeisach@ubuntu.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260212222029.15777-1-jpeisach@ubuntu.com>
References: <20260212222029.15777-1-jpeisach@ubuntu.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:jpeisach@ubuntu.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:mid,ubuntu.com:dkim,ubuntu.com:email]
X-Rspamd-Queue-Id: 9DE28131802
X-Rspamd-Action: no action

Now that we are using struct drm_edid, we can just call drm_edid_free
directly. Remove the function and update calls to drm_edid_free.

Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    | 22 ++++++-------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index ab83b3a87..04842e3f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -297,14 +297,6 @@ static void amdgpu_connector_get_edid(struct drm_connector *connector)
 	}
 }
 
-static void amdgpu_connector_free_edid(struct drm_connector *connector)
-{
-	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
-
-	kfree(amdgpu_connector->edid);
-	amdgpu_connector->edid = NULL;
-}
-
 static int amdgpu_connector_ddc_get_modes(struct drm_connector *connector)
 {
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
@@ -754,7 +746,7 @@ static void amdgpu_connector_destroy(struct drm_connector *connector)
 {
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 
-	amdgpu_connector_free_edid(connector);
+	drm_edid_free(amdgpu_connector->edid);
 	kfree(amdgpu_connector->con_priv);
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
@@ -873,7 +865,7 @@ amdgpu_connector_vga_detect(struct drm_connector *connector, bool force)
 		dret = amdgpu_display_ddc_probe(amdgpu_connector, false);
 	if (dret) {
 		amdgpu_connector->detected_by_load = false;
-		amdgpu_connector_free_edid(connector);
+		drm_edid_free(amdgpu_connector->edid);
 		amdgpu_connector_get_edid(connector);
 
 		if (!amdgpu_connector->edid) {
@@ -889,7 +881,7 @@ amdgpu_connector_vga_detect(struct drm_connector *connector, bool force)
 			 * with a shared ddc line (often vga + hdmi)
 			 */
 			if (amdgpu_connector->use_digital && amdgpu_connector->shared_ddc) {
-				amdgpu_connector_free_edid(connector);
+				drm_edid_free(amdgpu_connector->edid);
 				ret = connector_status_disconnected;
 			} else {
 				ret = connector_status_connected;
@@ -984,7 +976,7 @@ static void amdgpu_connector_shared_ddc(enum drm_connector_status *status,
 					/* hpd is our only option in this case */
 					if (!amdgpu_display_hpd_sense(adev,
 								      amdgpu_connector->hpd.hpd)) {
-						amdgpu_connector_free_edid(connector);
+						drm_edid_free(amdgpu_connector->edid);
 						*status = connector_status_disconnected;
 					}
 				}
@@ -1053,7 +1045,7 @@ amdgpu_connector_dvi_detect(struct drm_connector *connector, bool force)
 	}
 	if (dret) {
 		amdgpu_connector->detected_by_load = false;
-		amdgpu_connector_free_edid(connector);
+		drm_edid_free(amdgpu_connector->edid);
 		amdgpu_connector_get_edid(connector);
 
 		if (!amdgpu_connector->edid) {
@@ -1069,7 +1061,7 @@ amdgpu_connector_dvi_detect(struct drm_connector *connector, bool force)
 			 * with a shared ddc line (often vga + hdmi)
 			 */
 			if ((!amdgpu_connector->use_digital) && amdgpu_connector->shared_ddc) {
-				amdgpu_connector_free_edid(connector);
+				drm_edid_free(amdgpu_connector->edid);
 				ret = connector_status_disconnected;
 			} else {
 				ret = connector_status_connected;
@@ -1417,7 +1409,7 @@ amdgpu_connector_dp_detect(struct drm_connector *connector, bool force)
 		goto out;
 	}
 
-	amdgpu_connector_free_edid(connector);
+	drm_edid_free(amdgpu_connector->edid);
 
 	if ((connector->connector_type == DRM_MODE_CONNECTOR_eDP) ||
 	    (connector->connector_type == DRM_MODE_CONNECTOR_LVDS)) {
-- 
2.51.0

