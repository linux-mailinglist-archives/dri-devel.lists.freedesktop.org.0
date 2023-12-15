Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ED78143C7
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 09:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524C410E338;
	Fri, 15 Dec 2023 08:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFED10E055;
 Fri, 15 Dec 2023 05:21:19 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6cea5548eb2so263481b3a.0; 
 Thu, 14 Dec 2023 21:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702617678; x=1703222478; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=s+5lBSVYnqDcPFtwn8gCQhYwDjCzvbLiJIKd8Yzo52s=;
 b=GTtIM8vMdBPCQEjYgPJ7UlNHD3zlbjHtFHwCRAV/mQOVUFi743LNrHl4UzlOJLo1O+
 BdGQ53nI4l3yfvGoTljJtNdw83z9QwR0lr5GtVCLkhwph1JwRffK6dbTFsSyrfySFhNv
 Kxtn9ufRAfZGD3N4Tqj9LndwpX0266zhyU/RDdnzSjvBKosEZU9zVOIj22dhZ0MohddK
 y1nUbAKF7y8uIMDseFIeNJd91TL2/u/VaUgVi27IfMk/JFEVsI4fP8z1g6hY58BNspQY
 +8WM373CbGI7JCh4Of7Bxu/jyHLcVhTwRGnmyoLcMuex8Al0ib7gJPVKion1QYqa5wUV
 c+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702617678; x=1703222478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s+5lBSVYnqDcPFtwn8gCQhYwDjCzvbLiJIKd8Yzo52s=;
 b=dFlUDFvRbxhsqlBzp6TA3cdSx1MyqdXFAnBncAf09jHOqlBNELxsnztCqFkDcsDALF
 +5QT29+TvS30WDpzhPvwVunfc4dl4wvK/LXHMltWIDoTzHUWd8iNRyS2ySiHzmU3E2w0
 dLwmYLFFmflKxR6oqnk8tVaFWrOXRz9nBA7oFghG7XoZowCY6lKaxzN1+IvG2CMsiwpH
 LFpTTRwSMTgfCf+RZt3BwJTNc47aVP4KKSK+rjhFHommKlO4SwyIFKOURn6YwB7V6MkK
 AFtnXI59n/rvveOZsR4OQwpfQ5iMhto6KH9p0w2Kjj+vuLRteuzMOO2IBYeoXbBBVvaC
 qhXg==
X-Gm-Message-State: AOJu0YxTe+KPKbLpNtuVSiStAWSc7jxO7dWmEJwYFMRQCs9rjj/DUn16
 bTd4gwrThzwsjVzSYyNL8Ls=
X-Google-Smtp-Source: AGHT+IFht6jswMwabNafHJ7W/vy2mXm7pcUSJHVjGcuN971hwNVXm68KGLw+XrOGkEqilBvD4XKa5Q==
X-Received: by 2002:a05:6a00:2e10:b0:6d0:9913:3363 with SMTP id
 fc16-20020a056a002e1000b006d099133363mr8892948pfb.46.1702617678480; 
 Thu, 14 Dec 2023 21:21:18 -0800 (PST)
Received: from localhost.localdomain ([202.137.218.19])
 by smtp.gmail.com with ESMTPSA id
 y20-20020a056a00191400b00688435a9915sm12608593pfi.189.2023.12.14.21.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 21:21:18 -0800 (PST)
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, Hawking.Zhang@amd.com,
 candice.li@amd.com, Le.Ma@amd.com, lijo.lazar@amd.com
Subject: [PATCH] gpu: drm: amd: fixed typos
Date: Fri, 15 Dec 2023 10:50:33 +0530
Message-Id: <20231215052033.550509-1-ghanshyam1898@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 15 Dec 2023 08:39:42 +0000
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
Cc: Ghanshyam Agrawal <ghanshyam1898@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixed multiple typos in atomfirmware.h

Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
---
 drivers/gpu/drm/amd/include/atomfirmware.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
index fa7d6ced786f..41d553921adf 100644
--- a/drivers/gpu/drm/amd/include/atomfirmware.h
+++ b/drivers/gpu/drm/amd/include/atomfirmware.h
@@ -210,7 +210,7 @@ atom_bios_string          = "ATOM"
 };
 */
 
-#pragma pack(1)                          /* BIOS data must use byte aligment*/
+#pragma pack(1)                          /* BIOS data must use byte alignment */
 
 enum atombios_image_offset{
   OFFSET_TO_ATOM_ROM_HEADER_POINTER          = 0x00000048,
@@ -452,7 +452,7 @@ struct atom_dtd_format
   uint8_t   refreshrate;
 };
 
-/* atom_dtd_format.modemiscinfo defintion */
+/* atom_dtd_format.modemiscinfo definition */
 enum atom_dtd_format_modemiscinfo{
   ATOM_HSYNC_POLARITY    = 0x0002,
   ATOM_VSYNC_POLARITY    = 0x0004,
@@ -645,7 +645,7 @@ struct lcd_info_v2_1
   uint32_t reserved1[8];
 };
 
-/* lcd_info_v2_1.panel_misc defintion */
+/* lcd_info_v2_1.panel_misc definition */
 enum atom_lcd_info_panel_misc{
   ATOM_PANEL_MISC_FPDI            =0x0002,
 };
@@ -683,7 +683,7 @@ enum atom_gpio_pin_assignment_gpio_id {
   /* gpio_id pre-define id for multiple usage */
   /* GPIO use to control PCIE_VDDC in certain SLT board */
   PCIE_VDDC_CONTROL_GPIO_PINID = 56,
-  /* if PP_AC_DC_SWITCH_GPIO_PINID in Gpio_Pin_LutTable, AC/DC swithing feature is enable */
+  /* if PP_AC_DC_SWITCH_GPIO_PINID in Gpio_Pin_LutTable, AC/DC switching feature is enable */
   PP_AC_DC_SWITCH_GPIO_PINID = 60,
   /* VDDC_REGULATOR_VRHOT_GPIO_PINID in Gpio_Pin_LutTable, VRHot feature is enable */
   VDDC_VRHOT_GPIO_PINID = 61,
-- 
2.25.1

