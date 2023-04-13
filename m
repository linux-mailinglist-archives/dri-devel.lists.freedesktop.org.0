Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE876E0B13
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 12:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F77B10EAAA;
	Thu, 13 Apr 2023 10:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE1810EAA4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 10:09:56 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id b33so10504567ljf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 03:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681380594; x=1683972594;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EKbG0++H3xbVFVaOPyRrEAbbHRNYZ849A4wa8ugtNII=;
 b=ThO1LzD5GUl5+TgJbsoVcKM/qNLCB/hqoha+v0ORbBzy1YDDbKE8aMFehj3J9adsTK
 qVdtpAbstd1R6qNnunfTJlGwxOb+MhGcfiEwIHvrXSCw4UauAdYkxlFBCUU1sd75M0pq
 v2KmiV6DEVPpOEJgmzCHgh29f0EbJ/wS/85TcunFSh1ekjlibM99nIo2KcTbxvrSAnh+
 ddulP/WvLkAcUw+iRMgvs89tiKzKiEl1s4K+pNO0psyKCBJ7rB+8FtmtKI61us6kfKR7
 bhKyh7IuDextmjYVbzaftyA21T6Qw1sRqyFF4zzB7nN1tDlE3I00lOk37hiAgXoR1tAT
 XJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681380594; x=1683972594;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EKbG0++H3xbVFVaOPyRrEAbbHRNYZ849A4wa8ugtNII=;
 b=kdUR/4X45aRcWGfKtoFZwoaLOhYllDuWTKgFZ1uOKsMX1drjIdZzj9KB+dsG7GonXN
 b9KZ93/xANgookaHu3q6CzH26VhuRXo/wcQ62SUAHEzs/ak4hh8u0ai2v/LNx3oxreVc
 ftTP5Yb1eqR1Pn1X8kf8ZHNKPYASZ2XGsSjSWxFo41474I9rVXmdhnQZe4kTpl29Xz/I
 HkKxWxisPilEBkgEjYO6vVAae7JwvpSMZDGODgTL1lUzQOso5UBEO0bw7wAhsDWvZfdw
 IxrYenR0uC69siuEyzyaVzqTBWv0+a1LmpBjen6Bn7QFJ3b/y+W6kWPJNtInDBOHFYcl
 FYLg==
X-Gm-Message-State: AAQBX9fAcm8yPsZxQwOn2FvXCj+mXyMdI98huRcjyscWgQqEXNOoDjLE
 E83GOjfByr0WFKa1ucJbdmQopw==
X-Google-Smtp-Source: AKy350b42GDYnVhw2CmyLCK8DYMC6jVDMfzA4N2X4+qbw2p5e5RsIjjuNI+6tnJn8lc3iN6XZzdTnA==
X-Received: by 2002:a2e:b173:0:b0:2a2:d541:5d34 with SMTP id
 a19-20020a2eb173000000b002a2d5415d34mr477068ljm.17.1681380594000; 
 Thu, 13 Apr 2023 03:09:54 -0700 (PDT)
Received: from [192.168.1.101] (abyl123.neoplus.adsl.tpnet.pl. [83.9.31.123])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a2e9d14000000b002a2e931fc48sm200482lji.140.2023.04.13.03.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 03:09:53 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 13 Apr 2023 12:09:39 +0200
Subject: [PATCH v2 5/5] drm/panel: nt36523: Add Lenovo J606F panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230412-topic-lenovopanel-v2-5-055c3649788e@linaro.org>
References: <20230412-topic-lenovopanel-v2-0-055c3649788e@linaro.org>
In-Reply-To: <20230412-topic-lenovopanel-v2-0-055c3649788e@linaro.org>
To: Jianhua Lu <lujianhua000@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681380585; l=22582;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=a+KroKy76h4Z+iWZU936x+V3O3+qF0O8kFg1bcYLy8k=;
 b=5UhufzRL+Mw2BPxERcEopM+ykXt8KXnuM/h+5eueYbv/mFXmhsetOixMyZIcBN3rWcwmjMFI0mdA
 f3dp/vwUAqdhE8ONDujDv7q4afGc5S/UBtUK1E64vTPFW27sjsWN
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some Lenovo J606F tablets come with a 2K (2000x1200) 60Hz 11" 5:3
video mode display. Add support for these panels.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Jianhua Lu <lujianhua000@gmail.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 486 ++++++++++++++++++++++++++
 1 file changed, 486 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
index 2c5712ac3037..c3befa7f253d 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
@@ -13,6 +13,8 @@
 #include <linux/of_graph.h>
 #include <linux/regulator/consumer.h>
 
+#include <video/mipi_display.h>
+
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_mipi_dsi.h>
@@ -481,6 +483,456 @@ static int elish_csot_init_sequence(struct panel_info *pinfo)
 	return 0;
 }
 
+static int j606f_boe_init_sequence(struct panel_info *pinfo)
+{
+	struct mipi_dsi_device *dsi = pinfo->dsi[0];
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x20);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x05, 0xd9);
+	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x78);
+	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x5a);
+	mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x63);
+	mipi_dsi_dcs_write_seq(dsi, 0x0e, 0x91);
+	mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x73);
+	mipi_dsi_dcs_write_seq(dsi, 0x95, 0xeb);
+	mipi_dsi_dcs_write_seq(dsi, 0x96, 0xeb);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x11);
+	mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x66);
+	mipi_dsi_dcs_write_seq(dsi, 0x75, 0xa2);
+	mipi_dsi_dcs_write_seq(dsi, 0x77, 0xb3);
+	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d, 0x00,
+			       0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
+	mipi_dsi_dcs_write_seq(dsi, 0xb1, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e, 0x01,
+			       0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08, 0x03,
+			       0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
+	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7, 0x03,
+			       0xfd, 0x03, 0xff);
+	mipi_dsi_dcs_write_seq(dsi, 0xb4, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d, 0x00,
+			       0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
+	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e, 0x01,
+			       0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08, 0x03,
+			       0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
+	mipi_dsi_dcs_write_seq(dsi, 0xb7, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7, 0x03,
+			       0xfd, 0x03, 0xff);
+	mipi_dsi_dcs_write_seq(dsi, 0xb8, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d, 0x00,
+			       0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
+	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e, 0x01,
+			       0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq(dsi, 0xba, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08, 0x03,
+			       0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
+	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7, 0x03,
+			       0xfd, 0x03, 0xff);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x21);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65, 0x00,
+			       0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
+	mipi_dsi_dcs_write_seq(dsi, 0xb1, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76, 0x01,
+			       0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
+	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00, 0x03,
+			       0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
+	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf, 0x03,
+			       0xf5, 0x03, 0xf7);
+	mipi_dsi_dcs_write_seq(dsi, 0xb4, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65, 0x00,
+			       0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
+	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76, 0x01,
+			       0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
+	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00, 0x03,
+			       0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
+	mipi_dsi_dcs_write_seq(dsi, 0xb7, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf, 0x03,
+			       0xf5, 0x03, 0xf7);
+	mipi_dsi_dcs_write_seq(dsi, 0xb8, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65, 0x00,
+			       0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
+	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76, 0x01,
+			       0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
+	mipi_dsi_dcs_write_seq(dsi, 0xba, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00, 0x03,
+			       0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
+	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf, 0x03,
+			       0xf5, 0x03, 0xf7);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x23);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x80);
+	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x77);
+	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x07);
+	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x07);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x24);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x01, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x1c);
+	mipi_dsi_dcs_write_seq(dsi, 0x03, 0x1c);
+	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x1d);
+	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x1d);
+	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x04);
+	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x04);
+	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x0f);
+	mipi_dsi_dcs_write_seq(dsi, 0x09, 0x0f);
+	mipi_dsi_dcs_write_seq(dsi, 0x0a, 0x0e);
+	mipi_dsi_dcs_write_seq(dsi, 0x0b, 0x0e);
+	mipi_dsi_dcs_write_seq(dsi, 0x0c, 0x0d);
+	mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x0d);
+	mipi_dsi_dcs_write_seq(dsi, 0x0e, 0x0c);
+	mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x0c);
+	mipi_dsi_dcs_write_seq(dsi, 0x10, 0x08);
+	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x08);
+	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x13, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x1c);
+	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x1c);
+	mipi_dsi_dcs_write_seq(dsi, 0x1a, 0x1d);
+	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x1d);
+	mipi_dsi_dcs_write_seq(dsi, 0x1c, 0x04);
+	mipi_dsi_dcs_write_seq(dsi, 0x1d, 0x04);
+	mipi_dsi_dcs_write_seq(dsi, 0x1e, 0x0f);
+	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0x0f);
+	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x0e);
+	mipi_dsi_dcs_write_seq(dsi, 0x21, 0x0e);
+	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x0d);
+	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x0d);
+	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x0c);
+	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x0c);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0x08);
+	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x08);
+	mipi_dsi_dcs_write_seq(dsi, 0x28, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_LUT, 0x20);
+	mipi_dsi_dcs_write_seq(dsi, 0x2f, 0x0a);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x44);
+	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x0c);
+	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x32);
+	mipi_dsi_dcs_write_seq(dsi, 0x37, 0x44);
+	mipi_dsi_dcs_write_seq(dsi, 0x38, 0x40);
+	mipi_dsi_dcs_write_seq(dsi, 0x39, 0x00);
+
+	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x9a);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set pixel format: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_dcs_write_seq(dsi, 0x3b, 0xa0);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x42);
+	mipi_dsi_dcs_write_seq(dsi, 0x3f, 0x06);
+	mipi_dsi_dcs_write_seq(dsi, 0x43, 0x06);
+	mipi_dsi_dcs_write_seq(dsi, 0x47, 0x66);
+	mipi_dsi_dcs_write_seq(dsi, 0x4a, 0x9a);
+	mipi_dsi_dcs_write_seq(dsi, 0x4b, 0xa0);
+	mipi_dsi_dcs_write_seq(dsi, 0x4c, 0x91);
+	mipi_dsi_dcs_write_seq(dsi, 0x4d, 0x21);
+	mipi_dsi_dcs_write_seq(dsi, 0x4e, 0x43);
+
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, 18);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display brightness: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_dcs_write_seq(dsi, 0x52, 0x34);
+	mipi_dsi_dcs_write_seq(dsi, 0x55, 0x82, 0x02);
+	mipi_dsi_dcs_write_seq(dsi, 0x56, 0x04);
+	mipi_dsi_dcs_write_seq(dsi, 0x58, 0x21);
+	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x30);
+	mipi_dsi_dcs_write_seq(dsi, 0x5a, 0xba);
+	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0xa0);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00, 0x06);
+	mipi_dsi_dcs_write_seq(dsi, 0x5f, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x82);
+	mipi_dsi_dcs_write_seq(dsi, 0x7e, 0x20);
+	mipi_dsi_dcs_write_seq(dsi, 0x7f, 0x3c);
+	mipi_dsi_dcs_write_seq(dsi, 0x82, 0x04);
+	mipi_dsi_dcs_write_seq(dsi, 0x97, 0xc0);
+	mipi_dsi_dcs_write_seq(dsi, 0xb6,
+			       0x05, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05,
+			       0x05, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x92, 0xc4);
+	mipi_dsi_dcs_write_seq(dsi, 0x93, 0x1a);
+	mipi_dsi_dcs_write_seq(dsi, 0x94, 0x5f);
+	mipi_dsi_dcs_write_seq(dsi, 0xd7, 0x55);
+	mipi_dsi_dcs_write_seq(dsi, 0xda, 0x0a);
+	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x08);
+	mipi_dsi_dcs_write_seq(dsi, 0xdb, 0x05);
+	mipi_dsi_dcs_write_seq(dsi, 0xdc, 0xc4);
+	mipi_dsi_dcs_write_seq(dsi, 0xdd, 0x22);
+	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x05);
+	mipi_dsi_dcs_write_seq(dsi, 0xe0, 0xc4);
+	mipi_dsi_dcs_write_seq(dsi, 0xe1, 0x05);
+	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0xc4);
+	mipi_dsi_dcs_write_seq(dsi, 0xe3, 0x05);
+	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0xc4);
+	mipi_dsi_dcs_write_seq(dsi, 0xe5, 0x05);
+	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0xc4);
+	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x88);
+	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x08);
+	mipi_dsi_dcs_write_seq(dsi, 0x8d, 0x88);
+	mipi_dsi_dcs_write_seq(dsi, 0x8e, 0x08);
+	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x90);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x25);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x07);
+	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0xba);
+	mipi_dsi_dcs_write_seq(dsi, 0x20, 0xa0);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0xba);
+	mipi_dsi_dcs_write_seq(dsi, 0x27, 0xa0);
+	mipi_dsi_dcs_write_seq(dsi, 0x33, 0xba);
+	mipi_dsi_dcs_write_seq(dsi, 0x34, 0xa0);
+	mipi_dsi_dcs_write_seq(dsi, 0x3f, 0xe0);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_VSYNC_TIMING, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x44, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_GET_SCANLINE, 0x40);
+	mipi_dsi_dcs_write_seq(dsi, 0x48, 0xba);
+	mipi_dsi_dcs_write_seq(dsi, 0x49, 0xa0);
+	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0xd0);
+	mipi_dsi_dcs_write_seq(dsi, 0x61, 0xba);
+	mipi_dsi_dcs_write_seq(dsi, 0x62, 0xa0);
+	mipi_dsi_dcs_write_seq(dsi, 0xf1, 0x10);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2a);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x64, 0x16);
+	mipi_dsi_dcs_write_seq(dsi, 0x67, 0x16);
+	mipi_dsi_dcs_write_seq(dsi, 0x6a, 0x16);
+	mipi_dsi_dcs_write_seq(dsi, 0x70, 0x30);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_READ_PPS_START, 0xf3);
+	mipi_dsi_dcs_write_seq(dsi, 0xa3, 0xff);
+	mipi_dsi_dcs_write_seq(dsi, 0xa4, 0xff);
+	mipi_dsi_dcs_write_seq(dsi, 0xa5, 0xff);
+	mipi_dsi_dcs_write_seq(dsi, 0xd6, 0x08);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x26);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x00, 0xa1);
+	mipi_dsi_dcs_write_seq(dsi, 0x0a, 0xf2);
+	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x28);
+	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x30);
+	mipi_dsi_dcs_write_seq(dsi, 0x0c, 0x13);
+	mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x0a);
+	mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x0a);
+	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x50);
+	mipi_dsi_dcs_write_seq(dsi, 0x13, 0x51);
+	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x65);
+	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x10);
+	mipi_dsi_dcs_write_seq(dsi, 0x17, 0xa0);
+	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x86);
+	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x11);
+	mipi_dsi_dcs_write_seq(dsi, 0x1a, 0x7b);
+	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x10);
+	mipi_dsi_dcs_write_seq(dsi, 0x1c, 0xbb);
+	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x11);
+	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x7b);
+	mipi_dsi_dcs_write_seq(dsi, 0x1d, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x1e, 0xc3);
+	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0xc3);
+	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x25, 0xc3);
+	mipi_dsi_dcs_write_seq(dsi, 0x2f, 0x05);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0xc3);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_COLUMNS, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x32, 0xc3);
+	mipi_dsi_dcs_write_seq(dsi, 0x39, 0x00);
+
+	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0xc3);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set pixel format: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x11);
+	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x78);
+	mipi_dsi_dcs_write_seq(dsi, 0x35, 0x16);
+	mipi_dsi_dcs_write_seq(dsi, 0xc8, 0x04);
+	mipi_dsi_dcs_write_seq(dsi, 0xc9, 0x82);
+	mipi_dsi_dcs_write_seq(dsi, 0xca, 0x4e);
+	mipi_dsi_dcs_write_seq(dsi, 0xcb, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_READ_PPS_CONTINUE, 0x4c);
+	mipi_dsi_dcs_write_seq(dsi, 0xaa, 0x47);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x27);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x56, 0x06);
+	mipi_dsi_dcs_write_seq(dsi, 0x58, 0x80);
+	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x53);
+	mipi_dsi_dcs_write_seq(dsi, 0x5a, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x14);
+	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x20);
+	mipi_dsi_dcs_write_seq(dsi, 0x5f, 0x10);
+	mipi_dsi_dcs_write_seq(dsi, 0x60, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x61, 0x1d);
+	mipi_dsi_dcs_write_seq(dsi, 0x62, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x63, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x64, 0x24);
+	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x1c);
+	mipi_dsi_dcs_write_seq(dsi, 0x66, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x67, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x68, 0x25);
+	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x78, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xc3, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xd1, 0x24);
+	mipi_dsi_dcs_write_seq(dsi, 0xd2, 0x30);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2a);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x2f);
+	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x08);
+	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x25, 0xc3);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0xf8);
+	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x28, 0x1a);
+	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x1a);
+	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_LUT, 0x1a);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0xe0);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x60);
+	mipi_dsi_dcs_write_seq(dsi, 0x16, 0xc0);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0xf0);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+
+	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x08);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set pixel format: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x24);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+
+	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x5d);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set pixel format: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_dcs_write_seq(dsi, 0x3b, 0x60);
+	mipi_dsi_dcs_write_seq(dsi, 0x4a, 0x5d);
+	mipi_dsi_dcs_write_seq(dsi, 0x4b, 0x60);
+	mipi_dsi_dcs_write_seq(dsi, 0x5a, 0x70);
+	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x60);
+	mipi_dsi_dcs_write_seq(dsi, 0x91, 0x44);
+	mipi_dsi_dcs_write_seq(dsi, 0x92, 0x75);
+	mipi_dsi_dcs_write_seq(dsi, 0xdb, 0x05);
+	mipi_dsi_dcs_write_seq(dsi, 0xdc, 0x75);
+	mipi_dsi_dcs_write_seq(dsi, 0xdd, 0x22);
+	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x05);
+	mipi_dsi_dcs_write_seq(dsi, 0xe0, 0x75);
+	mipi_dsi_dcs_write_seq(dsi, 0xe1, 0x05);
+	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0x75);
+	mipi_dsi_dcs_write_seq(dsi, 0xe3, 0x05);
+	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x75);
+	mipi_dsi_dcs_write_seq(dsi, 0xe5, 0x05);
+	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x75);
+	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x8d, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x8e, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x25);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0x70);
+	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x60);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0x70);
+	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x60);
+	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x70);
+	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x60);
+	mipi_dsi_dcs_write_seq(dsi, 0x48, 0x70);
+	mipi_dsi_dcs_write_seq(dsi, 0x49, 0x60);
+	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x61, 0x70);
+	mipi_dsi_dcs_write_seq(dsi, 0x62, 0x60);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x26);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x0a);
+	mipi_dsi_dcs_write_seq(dsi, 0x1a, 0x7f);
+	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x0a);
+	mipi_dsi_dcs_write_seq(dsi, 0x1c, 0x0c);
+	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x0a);
+	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x7f);
+	mipi_dsi_dcs_write_seq(dsi, 0x1e, 0x75);
+	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0x75);
+	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x75);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x75);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_COLUMNS, 0x05);
+	mipi_dsi_dcs_write_seq(dsi, 0x32, 0x8d);
+
+	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x75);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set pixel format: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2a);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x75);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x20);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x40);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x02);
+
+	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set tear on: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x13);
+	mipi_dsi_dcs_write_seq(dsi, 0x3b, 0x03, 0x5f, 0x1a, 0x04, 0x04);
+	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
+	usleep_range(10000, 11000);
+	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+
+	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display brightness: %d\n", ret);
+		return ret;
+	}
+
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x2c);
+	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
+	mipi_dsi_dcs_write_seq(dsi, 0x68, 0x05, 0x01);
+
+	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
+		return ret;
+	}
+	msleep(100);
+
+	ret = mipi_dsi_dcs_set_display_on(dsi);
+	if (ret < 0) {
+		dev_err(dev, "Failed to set display on: %d\n", ret);
+		return ret;
+	}
+	msleep(30);
+
+	return 0;
+}
+
 static const struct drm_display_mode elish_boe_modes[] = {
 	{
 		/* There is only one 120 Hz timing, but it doesn't work perfectly, 104 Hz preferred */
@@ -511,6 +963,22 @@ static const struct drm_display_mode elish_csot_modes[] = {
 	},
 };
 
+static const struct drm_display_mode j606f_boe_modes[] = {
+	{
+		.clock = (1200 + 58 + 2 + 60) * (2000 + 26 + 2 + 93) * 60 / 1000,
+		.hdisplay = 1200,
+		.hsync_start = 1200 + 58,
+		.hsync_end = 1200 + 58 + 2,
+		.htotal = 1200 + 58 + 2 + 60,
+		.vdisplay = 2000,
+		.vsync_start = 2000 + 26,
+		.vsync_end = 2000 + 26 + 2,
+		.vtotal = 2000 + 26 + 2 + 93,
+		.width_mm = 143,
+		.height_mm = 235,
+	},
+};
+
 static const struct panel_desc elish_boe_desc = {
 	.modes = elish_boe_modes,
 	.num_modes = ARRAY_SIZE(elish_boe_modes),
@@ -547,6 +1015,20 @@ static const struct panel_desc elish_csot_desc = {
 	.is_dual_dsi = true,
 };
 
+static const struct panel_desc j606f_boe_desc = {
+	.modes = j606f_boe_modes,
+	.num_modes = ARRAY_SIZE(j606f_boe_modes),
+	.width_mm = 143,
+	.height_mm = 235,
+	.bpc = 8,
+	.lanes = 4,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
+		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
+	.init_sequence = j606f_boe_init_sequence,
+	.has_dcs_backlight = true,
+};
+
 static void nt36523_reset(struct panel_info *pinfo)
 {
 	gpiod_set_value_cansleep(pinfo->reset_gpio, 1);
@@ -827,6 +1309,10 @@ static int nt36523_probe(struct mipi_dsi_device *dsi)
 }
 
 static const struct of_device_id nt36523_of_match[] = {
+	{
+		.compatible = "lenovo,j606f-boe-nt36523w",
+		.data = &j606f_boe_desc,
+	},
 	{
 		.compatible = "xiaomi,elish-boe-nt36523",
 		.data = &elish_boe_desc,

-- 
2.40.0

