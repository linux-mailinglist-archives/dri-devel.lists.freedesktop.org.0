Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB0977F825
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 15:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A5B10E49E;
	Thu, 17 Aug 2023 13:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 354 seconds by postgrey-1.36 at gabe;
 Thu, 17 Aug 2023 12:16:21 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9877D10E463;
 Thu, 17 Aug 2023 12:16:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1692274217; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=V3im4kf011q1E734m5bL/KHGWkY/OIuPxzoiGEp52s74/zo3tHLziCOCWsxk8Ent3L
 Hz/IlEPSKWgCpExpRA7KMjbmHwb4EAGareY0TqldmcgN7qnqj7ChRpZY2v5arDk77u+h
 QJEaeqw0zteK6AjTSwHiX5mZaAxrIcxLQipGEbgx6bWSUwxxDhJN89kgho7OjTITHcoZ
 gIgsKPKPu/PpkfO7I1lsbXs8IsyL9TvHfenGFjG6RSvUblL5ZhDa0ueGwx9tf71mN9Hd
 BOgBpk+vrBqgEY6VAeIkW8xnUJANmuYue9iXovAP37dj2WdZ3NiirkDWs4A3fvoFR6n8
 Xgfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1692274217;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Cc:To:Subject:Date:From:References:In-Reply-To:Cc:Date:
 From:Subject:Sender;
 bh=MnBVzEde0adBA/6W2C3hcOzEUtCCZaDoMyeEtZmOm08=;
 b=OaEuYlJaqQoKRtOEyWi+YKr3buR8mYicSs+o5fE3dKS3onqRzSiI0iLMBCXzwaJGtX
 Rn2ftUtDuNHRxWEMyC+hCWM91zhyvI+HU19ldmdFtJyQBWZc+MVsIf217zvDruvHNwj0
 AYWxRUMkJOGgm7gTBsZ2qAYvq2ZTD/WE/BAFI+q/fwhw1wbHIpzWErO3VoPcxVeb7PEo
 mxr1C+UWHW7yS15zEGuPKMElowb4K1sFLOXJeVWhqVceou+41JKahc0AOrWN4ay9tznz
 5MU5psZskjfLeRf/DFoC8/vdLCSEbFpMRwDOKlT8UUfWutbGufeGNA7E5w+q2a0pUrqm
 AnlA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1692274217;
 s=strato-dkim-0002; d=dj-l.de;
 h=Message-Id:Cc:To:Subject:Date:From:References:In-Reply-To:Cc:Date:
 From:Subject:Sender;
 bh=MnBVzEde0adBA/6W2C3hcOzEUtCCZaDoMyeEtZmOm08=;
 b=kqStaSV/7alNtcCSUALpyG4coR7S3DjxD06A+F5e5Ou0cqfcdAlVmjiUeyGw9Wmsqn
 y8dUYZh+cJryHSrgJFqHhQoxd8h5ylc46ZesXLTsWCc6+G+OLmx8Pkji3Fvykf3HdfKg
 sD6/nd68lJPvPlDqH0WiyE8WYhdO+usxSa3aYmjfyjzacGfzQ1+tIfW6y0Cw+9GjtI6b
 ksL31Gai3Hc6cqDtwqW36IO6KcSj072LX9KYvlJWvfvb3Sqh7UFmdicgRWzI7qgcU+O8
 4cUF535YQEF6St9PdX/B6mD0VDBdmNNMk8ALT98gQ6qujiFriaJzX+FmwZvnqZGv3QFW
 dX7A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1692274217;
 s=strato-dkim-0003; d=dj-l.de;
 h=Message-Id:Cc:To:Subject:Date:From:References:In-Reply-To:Cc:Date:
 From:Subject:Sender;
 bh=MnBVzEde0adBA/6W2C3hcOzEUtCCZaDoMyeEtZmOm08=;
 b=cpqMsx/s6bwBobEovgvlD6zGnG0VrDEtEdWTlmLmq9VzBmeOCZCWLskpjDlyyEV6AV
 aPbHgO26SLvmXsfsnbAA==
X-RZG-AUTH: ":KXQNeGCscbKoBnIM8/qR6vmtauhqEyl791IykafLdFE3+tIIOaXyX73mJPT2bA=="
Received: from djlnb.local by smtp.strato.de (RZmta 49.6.6 DYNA|AUTH)
 with ESMTPSA id ja88a5z7HCAH2zI
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 17 Aug 2023 14:10:17 +0200 (CEST)
Received: from dirk by djlnb.local with local (Exim 4.96)
 (envelope-from <18b5e09612c677fd14e0d6ee3c2def159b6c49f1@djlnb.dj-l.de>)
 id 1qWbpR-0007ey-0B; Thu, 17 Aug 2023 14:10:17 +0200
In-Reply-To: <20230815101907.2900768-1-jani.nikula@intel.com>
References: <20230815101907.2900768-1-jani.nikula@intel.com>
From: Dirk Lehmann <develop@dj-l.de>
Date: Thu, 17 Aug 2023 11:44:52 +0200
Subject: [PATCH v2 2/2] drm/edid: Fix "Analog composite sync!" for current eDP
 display panels
To: <stable@vger.kernel.org>
Message-Id: <E1qWbpR-0007ey-0B@djlnb.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 17 Aug 2023 13:57:08 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Dirk Lehmann <develop@dj-l.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VESA Enhanced EDID Standard does not clearly describe how display
panel vendors should setup the Sync Signal Defintions (bit 4 & 3) in
the Detailed Timing Definition (relative offset 17, absolute offset
47h[+18]) for Digital Video Signal Interfaces (bit 7 at offset 14h).

In practice many eDP panels which using a Digital Video Signal
Interfaces (bit 7 at offset 14h == 1) are leaving the Sync Signal
Defintions at offset 47h[+18] blank 0x00, which would mean concerned
with the VESA Standard [1] that they are using "Analog Composite
Sync".

Fix: Just detect Analog Sync Signal if an Analog Video Signal
     Interface (bit 7 at offset 14h == 0) is in use.  Just detect
     Digital Sync Signal if an Digital Video Signal Interface is in
     use.

Reference: [1] VESA Enhanced EDID Standard, Release A, Rev.2, Page 35

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8789
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8146
Signed-off-by: Dirk Lehmann <develop@dj-l.de>
---
 drivers/gpu/drm/drm_edid.c | 74 ++++++++++++++++++++++++++++++++------
 include/drm/drm_edid.h     | 12 +++++--
 2 files changed, 73 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 1f470968ed14..6afdc34e55ce 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3437,6 +3437,7 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 	const struct drm_display_info *info = &connector->display_info;
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *mode;
+	const struct edid *edid = drm_edid->edid;
 	const struct detailed_pixel_timing *pt = &timing->data.pixel_data;
 	unsigned hactive = (pt->hactive_hblank_hi & 0xf0) << 4 | pt->hactive_lo;
 	unsigned vactive = (pt->vactive_vblank_hi & 0xf0) << 4 | pt->vactive_lo;
@@ -3456,10 +3457,6 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 			    connector->base.id, connector->name);
 		return NULL;
 	}
-	if (!(pt->misc & DRM_EDID_PT_SEPARATE_SYNC)) {
-		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Composite sync not supported\n",
-			    connector->base.id, connector->name);
-	}
 
 	/* it is incorrect if hsync/vsync width is zero */
 	if (!hsync_pulse_width || !vsync_pulse_width) {
@@ -3505,11 +3502,68 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 
 	if (info->quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
 		mode->flags |= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
+	} else if (edid->input & DRM_EDID_INPUT_DIGITAL) {
+		/* !info->quirks && edid->input == DIGITAL  */
+		switch (pt->misc & DRM_EDID_PT_SYNC_MASK) {
+		/* VESA Enhanced EDID Standard, Release A, Rev.2, Page 35
+		 *
+		 * CASE DRM_EDID_PT_ANALOG_CSYNC:
+		 *
+		 * (pt->misc & DRM_EDID_PT_SYNC_MASK == 0x00) means
+		 * "Analog Composite Sync" as described in VESA
+		 * Standard.  But many digital display panels without
+		 * composite sync are also using 0x00 here.
+		 *
+		 * Therefore use DEFAULT: as we are currently on an
+		 * digital video signal interface.
+		 */
+		case DRM_EDID_PT_DIGITAL_CSYNC:
+			drm_dbg_kms(dev,
+				"[CONNECTOR:%d:%s] Digital composite sync!\n",
+				connector->base.id, connector->name);
+			mode->flags |= DRM_MODE_FLAG_CSYNC;
+			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
+				DRM_MODE_FLAG_PCSYNC : DRM_MODE_FLAG_NCSYNC;
+			break;
+		case DRM_EDID_PT_DIGITAL_SEPARATE_SYNC:
+			drm_dbg_kms(dev,
+				"[CONNECTOR:%d:%s] Digital seperate sync!\n",
+				connector->base.id, connector->name);
+			goto digital_default;
+			break; /* Missing BREAK throws a compiler warning  */
+		default:
+digital_default:
+			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
+				DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
+			mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
+				DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
+			break;
+		}
 	} else {
-		mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
-			DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
-		mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
-			DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
+		/* !info->quirks && edid->input == ANALOG  */
+		switch (pt->misc & DRM_EDID_PT_SYNC_MASK) {
+		/* VESA Enhanced EDID Standard, Release A, Rev.2, Page 35
+		 *
+		 * CASE DRM_EDID_PT_ANALOG_CSYNC:
+		 *
+		 * (pt->misc & DRM_EDID_PT_SYNC_MASK == 0x00) for
+		 * "Analog Composite Sync" is possible here, as we are
+		 * currently on an analog video signal interface.
+		 */
+		case DRM_EDID_PT_ANALOG_CSYNC:
+		case DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC:
+			drm_dbg_kms(dev,
+				"[CONNECTOR:%d:%s] Analog composite sync!\n",
+				connector->base.id, connector->name);
+			mode->flags |= DRM_MODE_FLAG_CSYNC | DRM_MODE_FLAG_NCSYNC;
+			break;
+		default:
+			mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
+				DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
+			mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
+				DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
+			break;
+		}
 	}
 
 set_size:
@@ -3522,8 +3576,8 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_connector *connecto
 	}
 
 	if (info->quirks & EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE) {
-		mode->width_mm = drm_edid->edid->width_cm * 10;
-		mode->height_mm = drm_edid->edid->height_cm * 10;
+		mode->width_mm = edid->width_cm * 10;
+		mode->height_mm = edid->height_cm * 10;
 	}
 
 	mode->type = DRM_MODE_TYPE_DRIVER;
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 48e93f909ef6..169755d3de19 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -61,9 +61,15 @@ struct std_timing {
 	u8 vfreq_aspect;
 } __attribute__((packed));
 
-#define DRM_EDID_PT_HSYNC_POSITIVE (1 << 1)
-#define DRM_EDID_PT_VSYNC_POSITIVE (1 << 2)
-#define DRM_EDID_PT_SEPARATE_SYNC  (3 << 3)
+#define DRM_EDID_PT_SYNC_MASK              (3 << 3)
+# define DRM_EDID_PT_ANALOG_CSYNC          (0 << 3)
+# define DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC  (1 << 3)
+# define DRM_EDID_PT_DIGITAL_CSYNC         (2 << 3)
+#  define DRM_EDID_PT_CSYNC_ON_RGB         (1 << 1) /* analog csync only */
+#  define DRM_EDID_PT_CSYNC_SERRATE        (1 << 2)
+# define DRM_EDID_PT_DIGITAL_SEPARATE_SYNC (3 << 3)
+#  define DRM_EDID_PT_HSYNC_POSITIVE       (1 << 1) /* also digital csync */
+#  define DRM_EDID_PT_VSYNC_POSITIVE       (1 << 2)
 #define DRM_EDID_PT_STEREO         (1 << 5)
 #define DRM_EDID_PT_INTERLACED     (1 << 7)
 
-- 
2.40.1

