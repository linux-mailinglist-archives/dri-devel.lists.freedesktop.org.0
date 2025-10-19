Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A4DBEEB9B
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 20:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C0210E159;
	Sun, 19 Oct 2025 18:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="KN9ArAVq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic304-24.consmr.mail.gq1.yahoo.com
 (sonic304-24.consmr.mail.gq1.yahoo.com [98.137.68.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37D610E159
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 18:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1760900389; bh=YHPBx3499LOsnw+xWczKHUVNbwb3wogW8BPwpY/euag=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=KN9ArAVqNCsu3x6LiLEeHbVLTmBXwlWWrHD51pybj73SWUp7UtJJTBCir6IgFJ8Gg7NCPTt74gxiVlgFeDigx4JB3RTBwNRAMlJJGRj2M9QVYBjDTy2DhDmELTjFCFZiSNeCmVqgfQe8Okt4y69Uzzj2PAS/2zjrmVv+psL7BHdqFvbaEdlNFkhVs+8sK9C5iplto9SCaTBqgymA1/s2l2nqTG2qb0EwhFYawzB3QDJlvt+AbYtOpphisgtU9okE9ao9sBiVNq+f9qBH0N/nDvVGWMiwFsH+ZiUxQ7sDu6n4AXfpHqA5ADoURF/OoZ/Dl3onmlXLe05lI8wRZX2QqA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1760900389; bh=3N+gsrhmkUW0IQdhSRqBibDvSEX3bZTyQbxFRxu3/Qs=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=EpouwoS1tLCu7EBV4AqYpemYeP6YjViPOkPsu7yUi2AtDnQRJ9C7A8jmbD+AvY2a8A+sC4RiJNLezwtSwgrj6lW9CDCAlPaOWZQuyDz7Yf17Wu2b3vo8SGJY1yS0fabIEazTxmxh13TlmaFdeZ1U91ncUQvuGwoD+gxSJYj4vi5BkFBXgg3ZMKsxwYnkRRDIMqptotblDjK6h+o3YVn1eOvtvUdzhngknen7Srb0K9sPpOd/36Hqc4oVWxJSKKzjrxeW2ZkCZUHbbW0ifZBZ2FMxe3r/vWRFkMrtdOr+hboZTu8gwvLDLgD8WiPviS30l3T0l3bbjkqHftgfbXWe/w==
X-YMail-OSG: LgNV5DMVM1kH1cp.M3z9M91NI6p6fSKvh5UAqHiF3sjAl7W4P_KRG0tdCc.mknU
 5IeK6.rnKjrpkfA3eJ_wxDJM3pGkIwubweVAN1knQOKOLHO9DqgOxUGgHcHe2E2RllbmgQ5RCUB_
 HLEMIXZuHgAIWoNhSFmXNot1WvUfoce3W5aKfe7HrbdmKeMd8AkrV8UvBlGcwYV_s44tFe6_hlGR
 IUw2mM5ht3kqKDafZIt28tLTS1_8WtQb9dSpFO4rYJQ0V9XvuJq2lHTuQ5GMHZTTczItQKkJXjr5
 Z6NysMPwC_9TOeVvi4s3JpsvPNesHed3EQ7AwTHBfMYBmRcM4H1WMFDMlvOE.nfvO3tWER0yaIQ.
 urOSlCAWT3PmMybg25.GugffkZqnZaCaAX8CNjI0enX6Vmq3mNE6oPjRyLe7mBsavXqzrWjkHrLV
 E1.FcxwKXkBq3jeoPgdxcJ5tbMotNb0MVEZ7AeD1qmjSUDWtIurJr9bCS0vmq_p48VPiUNVXzZxg
 VNX6YyeFYiMzQ7Pmj0JDAS4eSzRJ8P0YJvDymClhSeLxfJ4h1K_OacdOckc4ZpjsHC_xmEozuSOo
 R81P4NaNo2VFhqXGDd1obZtK6EaqOewdArRswAHKBGnS62PWiJu_Xq_.Av2qtZyz4z_969nacDhM
 .EJE7n2L9yl3Ydr.7UOufDda7tYZVvzLoMik1Tk9ndrILa6L41fbMK3fdqsNRhz4OqP11Y.LqdQQ
 e7Fsbq8ImkEBgLlPn1t0lpIQOU74rQYnF0dKiNnxPDFrXI_61N72jDC08Zwzy9.dKCVFHBXZzBkz
 CQiUUcb7dHC8yIcY.ZuVtKeqrdTfudOB69wb_iW_EQMckqHK0ID9dFwWHRSA6H0XvY_c.sIPrrou
 JNiKnNXWJKE6wFCTZBW.oBb5hJ6Nz7yhhZfiZcNmoRHmdaimHuCN3EZuj5lsFlGinH8ZX_vdTOQ4
 8bczbFoPJ_kZ__tEQfPtXNo4KQQJWR._jvU_1.Awp0TYYU8I8vdgsXslM_ZRImPgsKY66wBdvwyv
 Ub13p0T_xUjdRaJDpR_ZtJsS5FWBNer8_YSloFZ6B0FzuQB.dS893gL2zzdhWpqnTHvWIMEazm_G
 iJ3llmlLIlx2y9VSf8JtTav3IE7L4qbEJelIJUymG7ZKOtp1J6OyMBSMkVMV0hE_lXcsU2NcU56P
 zdfs9GEJaLxe15e4myRly7wH.WOBWnxFqyUz4CREs.YjaOYkUmEAwNRwuymdIRBvRRN49o.fGau2
 zjqtb9jdMzjUb2lMXQg74ZdX2Frx.4HTll7Ja9HM2vLL5479r_HU.R0QJ120cxpw.EpymYKSZJ92
 Fz3DnWqln.6yoCZyN8EMH7_DNCVqL3Td6tDsFhiB9wGutFjq6h8CT0WXpPuH5pyZEV.RMllz8MvM
 B7xRKi7mdhDs.isDAS9wkSFDwug0d3TZftFeCsgDTxOUS3LjcGR5H9CnrQ7Jn2m8tfDuQcNL3DAM
 KRI79AhMHt4GVirKZvvYhPU7yQAvQFD_esmaBDB2hxTHv8AEy2_hCRZubXsxLjXDbmsrD0oGQVWG
 AXY3nOfzVRIOKUVK5x8hKxJ_n4fCurEoFaBIQs.Es2HzpRFTZBgDZej_xL8wGFcVSaWxk92vryDY
 uXV4FvZEHeLoHubpn.7y6ZZWgIJXORi5vHO8iLqKCY3xn9WHgI1_76TUeFc.YU.S_UKmnLjwxdMm
 dJd_P6POH0a6XlCjxklIhh.7loxNlUabdflh6yXRncokiyCvyGyHbE1mVqL9fPfSikgaKxRgOtDG
 LMheq5hryVDrzmSxCGUqaaqN1aenZ4.huEbXdxw53C1bBXfub8vSbjimECzCEaiD0UVzjVFJaYzj
 v8Yvvnm_QG6h24SGanWadNCIjOupSh6GfvZl8jRHZjeHUh1pLwib263iwHu0gl28reMaN0w3r0mz
 PUOB6vJY7bNYtAsFgIbIaAOi8UceIlzF_ar9cFTIetQzRrCp3vVhukRAOGCYQoG8YP_TGrZM5VyA
 a5EJfjlwetINU8kwcT7HpKjiDOpHk1tgsNT.PVY2OT4JsylrRQmmuAB7cqwRI49DyoAxFMP5HnGA
 hSqTU01tZwQMyKHuoStAYoEnNFKw_hk2WOkfewNmLWCnnFaOewtjAcoeIzRXXwdSYrHYEieAQBtL
 IKE3cWvJ.frjN00nPInwcNOLj7DbWGkI5xn6.SRen.xV8OCtQLUfbZnN8uHYO0iq2fttfHuwVrbH
 jiajLwin5kSJI4cecHTIhoZl00iSnGxPY1UM_qkGd
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: d59c9510-0251-42a6-92ae-8953e64a1015
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.gq1.yahoo.com with HTTP; Sun, 19 Oct 2025 18:59:49 +0000
Received: by hermes--production-ir2-cdb597784-phg5h (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID b23e1a914437bdc8f5bc6926d5f840c3; 
 Sun, 19 Oct 2025 18:59:46 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Ruben Wauters <rubenru09@aol.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/gud: rearrange gud_probe() to prepare for function
 splitting
Date: Sun, 19 Oct 2025 19:53:48 +0100
Message-ID: <20251019185642.14266-2-rubenru09@aol.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20251019185642.14266-2-rubenru09.ref@aol.com>
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

gud_prove() is currently very large and does many things, including
pipeline setup and feature detection, as well as having USB functions.

This patch re-orders the code in gud_probe() to make it more organised
and easier to split apart in the future.

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
I wanted to move mode config to just before pipeline init, however mode
config is edited in feature detection so I was unsure how to go about it
exactly.
Further untangling of this may be required before splitting it out
---
 drivers/gpu/drm/gud/gud_drv.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index b7345c8d823d..583f7f8f4c00 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -463,10 +463,6 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		return PTR_ERR(gdrm);
 
 	drm = &gdrm->drm;
-	drm->mode_config.funcs = &gud_mode_config_funcs;
-	ret = drmm_mode_config_init(drm);
-	if (ret)
-		return ret;
 
 	gdrm->flags = le32_to_cpu(desc.flags);
 	gdrm->compression = desc.compression & GUD_COMPRESSION_LZ4;
@@ -483,11 +479,18 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	if (ret)
 		return ret;
 
+	/* Mode config init*/
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
 	drm->mode_config.min_width = le32_to_cpu(desc.min_width);
 	drm->mode_config.max_width = le32_to_cpu(desc.max_width);
 	drm->mode_config.min_height = le32_to_cpu(desc.min_height);
 	drm->mode_config.max_height = le32_to_cpu(desc.max_height);
+	drm->mode_config.funcs = &gud_mode_config_funcs;
 
+	/*Format init*/
 	formats_dev = devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
 	/* Add room for emulated XRGB8888 */
 	formats = devm_kmalloc_array(dev, GUD_FORMATS_MAX_NUM + 1, sizeof(*formats), GFP_KERNEL);
@@ -587,6 +590,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 			return -ENOMEM;
 	}
 
+	/*Pipeline init*/
 	ret = drm_universal_plane_init(drm, &gdrm->plane, 0,
 				       &gud_plane_funcs,
 				       formats, num_formats,
@@ -598,15 +602,6 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	drm_plane_helper_add(&gdrm->plane, &gud_plane_helper_funcs);
 	drm_plane_enable_fb_damage_clips(&gdrm->plane);
 
-	devm_kfree(dev, formats);
-	devm_kfree(dev, formats_dev);
-
-	ret = gud_get_properties(gdrm);
-	if (ret) {
-		dev_err(dev, "Failed to get properties (error=%d)\n", ret);
-		return ret;
-	}
-
 	ret = drm_crtc_init_with_planes(drm, &gdrm->crtc, &gdrm->plane, NULL,
 					&gud_crtc_funcs, NULL);
 	if (ret)
@@ -621,6 +616,13 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	}
 
 	drm_mode_config_reset(drm);
+	drm_kms_helper_poll_init(drm);
+
+	ret = gud_get_properties(gdrm);
+	if (ret) {
+		dev_err(dev, "Failed to get properties (error=%d)\n", ret);
+		return ret;
+	}
 
 	usb_set_intfdata(intf, gdrm);
 
@@ -638,7 +640,8 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	if (ret)
 		return ret;
 
-	drm_kms_helper_poll_init(drm);
+	devm_kfree(dev, formats);
+	devm_kfree(dev, formats_dev);
 
 	drm_client_setup(drm, NULL);
 
-- 
2.51.0

