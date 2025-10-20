Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A843BBF1B21
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D054B10E449;
	Mon, 20 Oct 2025 14:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="dwutskja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic317-20.consmr.mail.gq1.yahoo.com
 (sonic317-20.consmr.mail.gq1.yahoo.com [98.137.66.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A1D10E449
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1760968920; bh=pFLYA2YQt6LoYcfiWureQPG0b5378+W1bpApadzNODc=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=dwutskjaN0fIry6cSjmb/OzeKY3UByWG5UZFei3p9LyzqM0Yf/ceelODqF2upmxSCCVJ+tA9oVV49yeDG2KAnd9xfVbFF0eaol1dpSRpvm4rr+jIoVzkSp0P8NbQZRnheh5AzGICZg8ZxCnHuXKtHZ7zAThyZHnYERyEIe0tvyZcKVU7bSBJIHHcbMEkVVsCG4BUIUnL7OA75T5ycgCzLa1kd9xPaYXFUlV3sOkxSDiyMt+Bf8KaEqIBWRsPyGF0y0AdtnQgBXdC9KBfKZ1e/CfmRavMtxmnxFIrsIMZqfYxzcKMt6LXf2ZbTaTQRxBAHFFSeWjXbjj05Ye0pYV2Cw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1760968920; bh=sLJ+lJW0Bl6aVihorOIPfe2FarlkOTJ3kiJZYZkrW1i=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=Sscaw318wL5P6sAoCAKmahRIZ9ltYxVSaZZspDOZxN2GXqtNQlEUyNIcxc7UPFwRBrRaSgGS9z96gQOx+8VAIL/HHj+Iiw2tKIgWlq9a9Hr2eiz9zGh1PwwM62+CDYYZ9bvflF50hKx7IRTaY1lUN1VC0M2xldF8rsQLKI+RBuUruSd7u3CYv+51hMmdJ4Sc4Az4jhSl5OIfULbQO0+N+VGfFuyJkCjGJx4pbG7ZptFTuIWNFgg0e0YogtD+JyBAaX/88mcsKd4yUq0W6wbzO539Y4em+nap+FVYkc5p7h9x9y3SxHw2cDGk9kCyZ/hwK1Kk7MxhWbDLt0B7W8RW3g==
X-YMail-OSG: ba_ULjoVM1mYBlcGgLq4hO2OWzUHqmLZmTSrHIWU2XjIRunWTXQnhvhPa0ZhKIi
 0j3HzQeRDkIHRzSMWQIsjDPvFIZsdHJ_koOJM6LsunZrfiOIIfz01ug4W.RbKv_v51cFIX.GaaOX
 9hoJiuzBGpOtdWqHNpViDljeZSSuAscpT1NgPzKtEs1DiAAFCxyiLk5nECeb2kW8l4FJP.aYrwIj
 71X8JI1jQkbLWQ4CKtzyjcVA37rhsvI9x4CDC7.YGyipboepywFtTcBQX8u2hzGIRra1mQE9_Vd2
 Y5DJHGYlVTZ4YaGVQqgBOmO_gw7_b5YEf9aHBSeykBcotI__bQU3FDT6Pa.E8iSrfhZm9Dcx0oTu
 nsIuomuYEMiNVTy.N_X5yMKIeonR2USNkTtbbRYnJXfx8zRVQk6KYOuqI_ck.DQITrk3bVS8_LKo
 hAJJZ11sMVom9AGs7PtkXVKAdsopKnn13UObmqO5IPNE93beS_sd8E2LzyIxOaXpVAO8gabqUxga
 asLHihHu5ksFcEEehq7L9GC5YhLSnHpmA9ZHCKgUN4zFferCm1zbFDnpQ982c9CCF2t0.osNZvHw
 L0TT_GbQ29bZLeabSfzanOOMrR0LyBdi6ILMNwP3UYt9fLVdnzURdMxTguDhyy.ZwfQH7cBH9xG0
 dIRZaK_StOHjHIlEhFqddxzE7QBkZ9o8MCO3yYlbsy42a07BG2XoM1i474N7j01A8R.0zsfzsWIZ
 hhnALGxjRPMOVFu2OaoJoaBCRdHofxPmgdCpHmvXu0VSkciCm_o1AWWXd4Xv4hBNGptalmNUfUZY
 QIabUcQGG.EQ2EkQaTfWN5SwjX0cwNMimUCnXWylmTd422nl70qHeLRDmdCdL_vdxfjykaxhPJAR
 ykM.V792xL_KDjB83j3VDBAi7f1_zQO5Zy2uTn59IwZc4pK3Iem7xIdoivqYB1u4oI5apQiwnnWX
 RhveGUPQ9cOd692bvu5rHWyeHoSP9K6r60bKqO6ne1N5fVDlvr6XVoiEUsIFWcxiRFjmwAJRu8j6
 asgCtNTNIIK318qWMsmt4Yp2NO4eOIBmxfnPLGluNeUk04rbaHeTpU1ticBcEfegy9lIvnVWuVro
 WzBk02f0CcTXJz39MSP.KQyibwQJgpZhSMCJilBl.mTjIA8MWymcbgkUj5J1bgaAG3SYffUoTFAD
 UF5td730D0VtVf5_.ubG8sru5H7FrfPQrove3WP41iEpV_9EGLGZO5qKxnriRfp6JYJwTNADHZ5K
 Em6.4pjrI4YSOdiZdkmtPyqzrItUgdUdFk.6KXjTJVtXSA1gYqq7bZbDu0tFjJBuzSW7I6__XOLA
 vSZeLu82ut1NRSrML0BVFHIKD.YRBEio11Z0cdnAYM.cXfwxMhnkFB2AzZVyRcAadFeDuOmW5O.m
 g4G6BZDCZVcXGPZaQrmjL2Yy6T0Wn5slUu4tj3E8IIY45PONKaw88wF3vm2HF3BrnpmV2IIEKz9v
 NWLRYTyL_4R36hBqFGN8GhPBC7C.x7ut9qElkUDOZFGpx5HCmTcUJ1PValtlEnb3TpaWNiHjtnsz
 3qKEfsw6xKhy9BrZG9q4bsOMurg7qL3a4iEFf2Z6DjmGyafIhfm2bt.QWpKZfYlzDaKFQ04Ffdbb
 EOjj5WLFpTqAmR4dOlLmaau7uejmo_FtjBm_KpQgbMHnrFIVwT1G4R3bSn38UASgGYhSYeYH3XvU
 l0jS4fz4F5AIIXx7gK3BATz0GJsD0rRDcLJdyWZ4qgpBrtCS6SQHrBsDd7hc__6Kouy_rH5Z73W7
 sRTx6jWDeXE5Wdr0XOvFajezUHOsQxbfD6pecL7YxXMJdTvjxZq1T3S7oQC.gAOe08P2Bq4euECp
 GX2XND4FseMG2Ue6O6uTGkukxlaVzEZ.Njf2iiaEe4LWS_mDrZ2V2ljeibIfkF7hBytpQzapBQb8
 WmF73DbZyjk58eBksNvX1rj4J8QTb1mpXXpjFTcYM8Y6hnRi.1Cye1pIBDSzScCy_xu1Co2jWLuI
 aJE3uJddJbRC_F_E877WVg.HO1SA2JUReZP0mArAQ2AmK1WoXhWABBgOqU6qs4Jx3IkDxzafhDp1
 A0QugVBR.z0hixBKgtCD.0mi7bmpMTA3luIMWLmx64FOZiZh94_Uxk6cUqCJBWWRqp48k80fwiL8
 1W9pedBgG53RUjg_HTXoCAMRJgw5lpj3DVfDY8ESfom73hCkY8NIVUWqad0casEI3Ix51tm4._3A
 sBkKxkoK9i2Kwv8qjuWqEXBC4OiSAEpTINeVG.lcXi4acSj6HWINL
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 7059ca9b-e0e7-42f8-be81-8e1f8b89ef92
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Mon, 20 Oct 2025 14:02:00 +0000
Received: by hermes--production-ir2-cdb597784-q5vnj (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID c2ad94a46301785748ed7ea5463a1645; 
 Mon, 20 Oct 2025 14:01:55 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Ruben Wauters <rubenru09@aol.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/gud: rearrange gud_probe() to prepare for function
 splitting
Date: Mon, 20 Oct 2025 14:56:04 +0100
Message-ID: <20251020140147.5017-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20251020140147.5017-1-rubenru09.ref@aol.com>
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

gud_probe() is currently very large and does many things, including
pipeline setup and feature detection, as well as having USB functions.

This patch re-orders the code in gud_probe() to make it more organised
and easier to split apart in the future.

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
Changelog:

v2
- rename gud_get_properties to gud_plane_add_properties and move
  function call to proper location
- move usb_set_intfdata and block with dma setup to just under gdrm init
- add proper spacing for init comments
---
 drivers/gpu/drm/gud/gud_drv.c | 45 +++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index b7345c8d823d..42135a48d92e 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -249,7 +249,7 @@ int gud_usb_set_u8(struct gud_device *gdrm, u8 request, u8 val)
 	return gud_usb_set(gdrm, request, 0, &val, sizeof(val));
 }
 
-static int gud_get_properties(struct gud_device *gdrm)
+static int gud_plane_add_properties(struct gud_device *gdrm)
 {
 	struct gud_property_req *properties;
 	unsigned int i, num_properties;
@@ -463,10 +463,6 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		return PTR_ERR(gdrm);
 
 	drm = &gdrm->drm;
-	drm->mode_config.funcs = &gud_mode_config_funcs;
-	ret = drmm_mode_config_init(drm);
-	if (ret)
-		return ret;
 
 	gdrm->flags = le32_to_cpu(desc.flags);
 	gdrm->compression = desc.compression & GUD_COMPRESSION_LZ4;
@@ -483,11 +479,28 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	if (ret)
 		return ret;
 
+	usb_set_intfdata(intf, gdrm);
+
+	dma_dev = usb_intf_get_dma_device(intf);
+	if (dma_dev) {
+		drm_dev_set_dma_dev(drm, dma_dev);
+		put_device(dma_dev);
+	} else {
+		dev_warn(dev, "buffer sharing not supported"); /* not an error */
+	}
+
+	/* Mode config init */
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
 	drm->mode_config.min_width = le32_to_cpu(desc.min_width);
 	drm->mode_config.max_width = le32_to_cpu(desc.max_width);
 	drm->mode_config.min_height = le32_to_cpu(desc.min_height);
 	drm->mode_config.max_height = le32_to_cpu(desc.max_height);
+	drm->mode_config.funcs = &gud_mode_config_funcs;
 
+	/* Format init */
 	formats_dev = devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
 	/* Add room for emulated XRGB8888 */
 	formats = devm_kmalloc_array(dev, GUD_FORMATS_MAX_NUM + 1, sizeof(*formats), GFP_KERNEL);
@@ -587,6 +600,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 			return -ENOMEM;
 	}
 
+	/* Pipeline init */
 	ret = drm_universal_plane_init(drm, &gdrm->plane, 0,
 				       &gud_plane_funcs,
 				       formats, num_formats,
@@ -598,12 +612,9 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	drm_plane_helper_add(&gdrm->plane, &gud_plane_helper_funcs);
 	drm_plane_enable_fb_damage_clips(&gdrm->plane);
 
-	devm_kfree(dev, formats);
-	devm_kfree(dev, formats_dev);
-
-	ret = gud_get_properties(gdrm);
+	ret = gud_plane_add_properties(gdrm);
 	if (ret) {
-		dev_err(dev, "Failed to get properties (error=%d)\n", ret);
+		dev_err(dev, "Failed to add properties (error=%d)\n", ret);
 		return ret;
 	}
 
@@ -621,16 +632,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	}
 
 	drm_mode_config_reset(drm);
-
-	usb_set_intfdata(intf, gdrm);
-
-	dma_dev = usb_intf_get_dma_device(intf);
-	if (dma_dev) {
-		drm_dev_set_dma_dev(drm, dma_dev);
-		put_device(dma_dev);
-	} else {
-		dev_warn(dev, "buffer sharing not supported"); /* not an error */
-	}
+	drm_kms_helper_poll_init(drm);
 
 	drm_debugfs_add_file(drm, "stats", gud_stats_debugfs, NULL);
 
@@ -638,7 +640,8 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	if (ret)
 		return ret;
 
-	drm_kms_helper_poll_init(drm);
+	devm_kfree(dev, formats);
+	devm_kfree(dev, formats_dev);
 
 	drm_client_setup(drm, NULL);
 
-- 
2.51.0

