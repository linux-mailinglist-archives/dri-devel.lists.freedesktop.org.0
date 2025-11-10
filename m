Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25985C47C1D
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F2510E426;
	Mon, 10 Nov 2025 16:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="RPqvduyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic308-55.consmr.mail.gq1.yahoo.com
 (sonic308-55.consmr.mail.gq1.yahoo.com [98.137.68.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14F310E426
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 16:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1762790681; bh=Pyxxz3sJeIKzQj7AY7hI1qzmmPZh5XlDzRXwvWT7J00=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=RPqvduytdK2Lp8OXw17TPsjWoEO3B+xBJ5Gj+f//MOlGiNwm8xj7OAaglcfAwtvxkDo5SBaJ4JQOwzMJTrEZW07d9goZStbN4Ff43piT5eGtDUyU8Hg+tbZZJOlhXkogIqeaGervPy4hbBXqEgs7fGMU6lyzvgrOwNuL9v9rxIdD/T5RO3LtQlcqprEPm7V2206k8kcAoi2ro8hhaYL+oW0Uefq9IjGuzIOVGbaLwyvpa3bAuzPZGarGMCWFrfIRfJFG08ql49z0rUmTr87lhA9wBfSySnfTYsPlH44ZvlWZADsPh/fsOE3+ryEDJ0LdTTolMFHRWx/Xp1fwoyt5Aw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1762790681; bh=lWlMtPp2szLmmF8Q76XS9Zs2866k12VmQKcj6HbM8Fv=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=uLef4tFbadm7ccBhigsaqfDWCkvdFSWj2kSXDmAbWoiUSRrlkTRW6tXWIl3uF7Ycuz3iGQDwkw3pGh+5/+/CqmxgBS7PbdT8FQJI3Jdp8oI3BEWUMwPnoVmA0+deqhd6ZvkC4iFf+UzuNy2sf6pbePZcNzYlhaghC5HUyS3EJxFP026O0mEo98nPF5szJtg+F+/A9vtQH0cxZPjYp+mL4UzQ3Bu4y4FRNW3N+7rD7Gjxenc+Aj/D42P6nrHln48Xi7I4EB49IUkfOCKNeqAjX/Lpdtj1JpR8Rru4feqlfxdcJRZbxx/jDvje2zSRLNPsdCFU2GF0rcf+y2gvD+B5qQ==
X-YMail-OSG: uNTLnVoVM1nsWakd2XuyHpGFBC6ztzpWSBNdJRreqGnJOsBH9jse7eHPBCNm77R
 O8UTT4vWu9y4Pzvo8BqIPA_77VEu27QepYG0Ka1RwMeeL78WcO2SsWM_UW99E1tYoDLKRx.1FLCc
 FpF4eCRyjm2BJ3HjN2lKi7pCvjGDqKawoAS0sR4giBKEA0m8WBH3.p86QX_d7SkecTbCnDKsD7WN
 KflVp2kFJiZRoodJujnfMUADwGoW86gmgArtJDJYTst_bY6N4IoKDQYNm1a1g_uy28khPAUxfMAp
 2FcQgODZeAMJaAtFJ2ZvdwUfHpdIaWufncKu.Xakjv3lYcRKas_T7KtB8hMI_g.4IxCFcFEAXTVB
 jkM2KvdzZ8qzxXTsri5ceWIIve18Qrwcur4cRxqZN.ExivZIE30btTlMFVrxgFZjtkOqkacj3Y6N
 eC5mdZCYqMm3nRWNZctlk0M0qG59MiXDOSCBv_0IoHj2nxCrVum3j3J3ohk_zhhPu4xZ.eP0N7z9
 LZNTzR4gb3M2wqJ6ls0OXNXdpfpQrDWjlVElnLFWTmdEs6hb39hs.wLm2sbzoR8oVgnPAbNtgZ8V
 x5b.PJcGBuXuH2sjSZDGcZfFdSCd_GgTUMPmMhEF2dbVJiaX5jiox8GwxIYQacYBIt8QoYxrIXkA
 R8nRhpDaxsKYLIoPXKnyUqMVWo3L1yGou8zciZzkLJQGFUAnQfL4gGAkIO0m66clcFQ6HNgI.Eae
 GYUjwpTrOHY8rgtWQl83E.kuB737phlg_uvriLRXuwWx4qhYkj1lnTaZt0GinDfnp_IEUY5IddkV
 inGqmMAzRW7PAF.hNkF6qTTxaunDT.TywAK2gyWln1LTRJpcbaQ4eURz8LMCty5fGzMS_gQllyts
 IK14DVxu6rDWGtCZ8udlTsRRAX_kGpxlQilmDIUojOV1CVipzUjLs5RfnP4nkARcUjwNZcjoF6BF
 Nh73U6oeaydHJtbSZGfq.DiRc.ioIR8B7XgUgP.cJ_nnkPIZJtIjsN7Y8NmqIvKq9CaY3nQjvaj4
 a808vaBeQ4RTvTJ_TtpPZqwMWiRxsN8jXvC4hK2gAc5_U4EAIN6zkHSSGJdgvWJKusJuszCyW577
 Neg3Paezhxp_aY8NvNEvIcgCeaChOF4z8DOfB.CDyFeyrvuMNFGCUi3X8RbglS2aNyzlDEwFoVXb
 1YhZkQI5yg5dbDHoYkzAVsvpbQrkm0sbHVXnPHIFEmyCQlYRVPifvELPhFwevNH_Z8C8D448umPL
 KCvto73Rn4NmAq7dbVBqsjUERuCfsG5hFFX9Duqzy0Ggk2WEh4eJd89qEPXhAE0WIasqR5PPHkZH
 E1YWu7yUIHmGCUtfWQUJTwc3smxCs08.zFJq6zImli87dsQEJ5b7iERaMJFJ3UJZoenuJmB3arH8
 UisPYhwu5yGFM6.d38LMfrJDy.AnoF1ZHoUyYAm.GNSmamkq6XIjf9B70uR.6tdP2.1Elpp16HfV
 FiyPOqcOAY2cF64DNbVuOUwAmCMxyJz1NS52VuK9kDV_hx1.EkF0mIdYMivAPJ9ycYqzcuzP0Dm4
 Xf8K.Z8bpXz5nnOtlG8EdlLSAgmJ1zsr0S43fIQntrXySALKXxgmNlvlKBVZHTrgDNEBEytaK7eu
 uhaBuky.VWeSVg5XZ3f4ZRbTs7J_ns_mzQvDcemx.tJJI6AivVXOj0SoPY4o.CKcEzyYu8ocZR6f
 sgtK70_WwpsG4UYLcd7jp9.MLS680vHNUUQwyZ9Ei3yPuioHD4JDyNqaFMCk5m4ModhdeHFQx_uo
 6.M_S9ULaZNwdMpE7K1pfIAa2e6P5e50zGFf8oXG2LhthzYTnniPB_H7cPKqIiBevgcHjHW_0wbX
 LjCK6h7.hvk_1Voq.Dd1erEtrNpvTHVRO.9Gc9BsQKO8z5PvozOdSheql8xUoEqYdk4OdOmy2lFu
 QEw9KYy9Ue0Ofa3YNV_VwNoEI9qE2Gsep77NvBq.tScFb9w74Uu8sxuJAwFgW1HSEZdzfz38nINA
 ZQvHnqNe5rqJTLYO_Cipcpv.BY.ZDdOj_eX.4a0dsG_jygp3ZIpBvhpi3Rrygep5xu3RcAq_jE4R
 MBwLsTEgABcGer0A_Bn.iPxTvKly6ngaYYwbmNVrxR4EHebwS6WFAanzCU83_nL5gycxtciP8tqg
 fXa3hAhEo1dylplykY0hb9DTHiQEhlkVwfxaywRB_bMEJZQNJiJlAHy1Xr.UNk3N2V6TNQQSCQlg
 ytfzzX524gYB5JRO4M7e8xxjSJiPCLZ1IJxfKCJSosx0C
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 6325990e-a261-47d8-8bb7-be8ee11a054d
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Mon, 10 Nov 2025 16:04:41 +0000
Received: by hermes--production-ir2-5fcfdd8d7f-lcc2j (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 5ea617d40ce08f4b80d4ea87648baf4a; 
 Mon, 10 Nov 2025 16:04:35 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Ruben Wauters <rubenru09@aol.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/gud: move format init from gud_probe()
Date: Mon, 10 Nov 2025 16:03:00 +0000
Message-ID: <20251110160428.2456-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20251110160428.2456-1-rubenru09.ref@aol.com>
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

As part of the cleanup of gud_probe(), this patch splits off format init
code from gud_probe into it's own function. This makes the code more
compartmentalised and easier to follow, and makes gud_probe() smaller
and also easier to read.

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
 drivers/gpu/drm/gud/gud_drv.c | 167 +++++++++++++++++++---------------
 1 file changed, 93 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index 42135a48d92e..22524601d463 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -427,84 +427,18 @@ static void gud_free_buffers_and_mutex(void *data)
 	mutex_destroy(&gdrm->ctrl_lock);
 }
 
-static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
+static int gud_get_formats(struct gud_device *gdrm, struct device *usb_device, u32 *formats,
+			   size_t *max_buffer_size, unsigned int *num_formats_ret)
 {
 	const struct drm_format_info *xrgb8888_emulation_format = NULL;
 	bool rgb565_supported = false, xrgb8888_supported = false;
 	unsigned int num_formats_dev, num_formats = 0;
-	struct usb_endpoint_descriptor *bulk_out;
-	struct gud_display_descriptor_req desc;
-	struct device *dev = &intf->dev;
-	size_t max_buffer_size = 0;
-	struct gud_device *gdrm;
-	struct drm_device *drm;
-	struct device *dma_dev;
 	u8 *formats_dev;
-	u32 *formats;
+	struct drm_device *drm = &gdrm->drm;
 	int ret, i;
 
-	ret = usb_find_bulk_out_endpoint(intf->cur_altsetting, &bulk_out);
-	if (ret)
-		return ret;
-
-	ret = gud_get_display_descriptor(intf, &desc);
-	if (ret) {
-		DRM_DEV_DEBUG_DRIVER(dev, "Not a display interface: ret=%d\n", ret);
-		return -ENODEV;
-	}
-
-	if (desc.version > 1) {
-		dev_err(dev, "Protocol version %u is not supported\n", desc.version);
-		return -ENODEV;
-	}
-
-	gdrm = devm_drm_dev_alloc(dev, &gud_drm_driver, struct gud_device, drm);
-	if (IS_ERR(gdrm))
-		return PTR_ERR(gdrm);
-
-	drm = &gdrm->drm;
-
-	gdrm->flags = le32_to_cpu(desc.flags);
-	gdrm->compression = desc.compression & GUD_COMPRESSION_LZ4;
-
-	if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE && gdrm->compression)
-		return -EINVAL;
-
-	mutex_init(&gdrm->ctrl_lock);
-	mutex_init(&gdrm->damage_lock);
-	INIT_WORK(&gdrm->work, gud_flush_work);
-	gud_clear_damage(gdrm);
-
-	ret = devm_add_action(dev, gud_free_buffers_and_mutex, gdrm);
-	if (ret)
-		return ret;
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
-
-	/* Mode config init */
-	ret = drmm_mode_config_init(drm);
-	if (ret)
-		return ret;
-
-	drm->mode_config.min_width = le32_to_cpu(desc.min_width);
-	drm->mode_config.max_width = le32_to_cpu(desc.max_width);
-	drm->mode_config.min_height = le32_to_cpu(desc.min_height);
-	drm->mode_config.max_height = le32_to_cpu(desc.max_height);
-	drm->mode_config.funcs = &gud_mode_config_funcs;
-
-	/* Format init */
-	formats_dev = devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
-	/* Add room for emulated XRGB8888 */
-	formats = devm_kmalloc_array(dev, GUD_FORMATS_MAX_NUM + 1, sizeof(*formats), GFP_KERNEL);
-	if (!formats_dev || !formats)
+	formats_dev = devm_kmalloc(usb_device, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
+	if (!formats_dev)
 		return -ENOMEM;
 
 	ret = gud_usb_get(gdrm, GUD_REQ_GET_FORMATS, 0, formats_dev, GUD_FORMATS_MAX_NUM);
@@ -555,7 +489,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 
 		fmt_buf_size = drm_format_info_min_pitch(info, 0, drm->mode_config.max_width) *
 			       drm->mode_config.max_height;
-		max_buffer_size = max(max_buffer_size, fmt_buf_size);
+		*max_buffer_size = max(*max_buffer_size, fmt_buf_size);
 
 		if (format == GUD_DRM_FORMAT_R1 || format == GUD_DRM_FORMAT_XRGB1111)
 			continue; /* Internal not for userspace */
@@ -564,7 +498,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	}
 
 	if (!num_formats && !xrgb8888_emulation_format) {
-		dev_err(dev, "No supported pixel formats found\n");
+		dev_err(usb_device, "No supported pixel formats found\n");
 		return -EINVAL;
 	}
 
@@ -577,6 +511,92 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		formats[num_formats++] = DRM_FORMAT_XRGB8888;
 	}
 
+	devm_kfree(usb_device, formats_dev);
+	*num_formats_ret = num_formats;
+
+	return 0;
+}
+
+static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
+{
+	unsigned int num_formats = 0;
+	struct usb_endpoint_descriptor *bulk_out;
+	struct gud_display_descriptor_req desc;
+	struct device *dev = &intf->dev;
+	size_t max_buffer_size = 0;
+	struct gud_device *gdrm;
+	struct drm_device *drm;
+	struct device *dma_dev;
+	u32 *formats;
+	int ret;
+
+	ret = usb_find_bulk_out_endpoint(intf->cur_altsetting, &bulk_out);
+	if (ret)
+		return ret;
+
+	ret = gud_get_display_descriptor(intf, &desc);
+	if (ret) {
+		DRM_DEV_DEBUG_DRIVER(dev, "Not a display interface: ret=%d\n", ret);
+		return -ENODEV;
+	}
+
+	if (desc.version > 1) {
+		dev_err(dev, "Protocol version %u is not supported\n", desc.version);
+		return -ENODEV;
+	}
+
+	gdrm = devm_drm_dev_alloc(dev, &gud_drm_driver, struct gud_device, drm);
+	if (IS_ERR(gdrm))
+		return PTR_ERR(gdrm);
+
+	drm = &gdrm->drm;
+
+	gdrm->flags = le32_to_cpu(desc.flags);
+	gdrm->compression = desc.compression & GUD_COMPRESSION_LZ4;
+
+	if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE && gdrm->compression)
+		return -EINVAL;
+
+	mutex_init(&gdrm->ctrl_lock);
+	mutex_init(&gdrm->damage_lock);
+	INIT_WORK(&gdrm->work, gud_flush_work);
+	gud_clear_damage(gdrm);
+
+	ret = devm_add_action(dev, gud_free_buffers_and_mutex, gdrm);
+	if (ret)
+		return ret;
+
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
+	drm->mode_config.min_width = le32_to_cpu(desc.min_width);
+	drm->mode_config.max_width = le32_to_cpu(desc.max_width);
+	drm->mode_config.min_height = le32_to_cpu(desc.min_height);
+	drm->mode_config.max_height = le32_to_cpu(desc.max_height);
+	drm->mode_config.funcs = &gud_mode_config_funcs;
+
+	/* Format init */
+	/* Add room for emulated XRGB8888 */
+	formats = devm_kmalloc_array(dev, GUD_FORMATS_MAX_NUM + 1, sizeof(*formats), GFP_KERNEL);
+	if (!formats)
+		return -ENOMEM;
+
+	ret = gud_get_formats(gdrm, dev, formats, &max_buffer_size, &num_formats);
+	if (ret)
+		return ret;
+
 	if (desc.max_buffer_size)
 		max_buffer_size = le32_to_cpu(desc.max_buffer_size);
 	/* Prevent a misbehaving device from allocating loads of RAM. 4096x4096@XRGB8888 = 64 MB */
@@ -641,7 +661,6 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		return ret;
 
 	devm_kfree(dev, formats);
-	devm_kfree(dev, formats_dev);
 
 	drm_client_setup(drm, NULL);
 
-- 
2.51.0

