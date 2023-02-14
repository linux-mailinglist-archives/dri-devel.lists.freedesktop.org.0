Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38606696A2A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 17:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C937510E20D;
	Tue, 14 Feb 2023 16:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D0110E20D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 16:46:55 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id fi26so18275622edb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 08:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RUbLPgi2dNsllznROZ4dKtoDtrRzTirDMz0BsSrCPqs=;
 b=SApLGGTzyDYQ6kOq2BAifGaxwvhWRLdfSDwMnbYVkb+UectZvUFeak23OE5+c4OFGe
 65YON4i1RNm0mp8VvvDIKCO5A6kE+3y38qtUDD5BmzcUNYgH8Ba2XFk4pr6DeiwHPlY6
 5QGIqLHCyMcmCTbKGH+AW1ZPiFyKPLdrD/mlOm4XUpxcoB90HHlDzhouS7X7wbfympEn
 HOTaixcsyzANUDpxtvrVX7y2sj5FSTKzmSZjpNJJZ30qxffY9qUZr146LfcdkazsAAlx
 pPOjZMuSZjyAH0Jdfd4frR0yEe85tRGCHjef6qae6MqrZ7PHnmUtI5vI0KuDpGOLz1/Z
 F0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RUbLPgi2dNsllznROZ4dKtoDtrRzTirDMz0BsSrCPqs=;
 b=yiXlWETFBR7+7RGx5M0Cx1I3unledd9G0Mc0NQQOqrK9KHGDxDyEzJ3X/mZi5lcR+K
 Thk+XWog4QAuJ5qFaf9qmMAwmeAzlppj4P4f1zFXN3uYN0gkpCq8w4BCL/JtOEtC3gMQ
 N9X9j+obFb+wcj/zjrGrppzjbSZYcHsTP0bB+yaHICF6Ul+B8hlRY0MHHAUVJ6rywgu+
 mFgi8sMF4A/ErGz2YU33r/pnCcKILkivhTkzWpF90twbPi+GZXpbhtn1iAmqo4dmjhlW
 ZCB61bsnj6bvZ+shuitOcTkAopS3h8xQlhCIQbwR6/WKxlnAnu9NmC0A5UM2v/BbKOzQ
 a7xw==
X-Gm-Message-State: AO0yUKX/QhxBUMlWxek0pt4gatrGP+bu14/syVkGMTc1JRio2CA1lJCA
 VUTPRtaBY5UO4Sg6y1P6x2U+4JlcJmU=
X-Google-Smtp-Source: AK7set9rswCj3j1AouaoBSQCstYqnvYpExNMhVFMVgsHssIBl2pVYX6lkKYmzMV1WhkgaqkbO6s4Sw==
X-Received: by 2002:a50:cdc9:0:b0:4ac:c12b:8ef1 with SMTP id
 h9-20020a50cdc9000000b004acc12b8ef1mr3336913edj.17.1676393212978; 
 Tue, 14 Feb 2023 08:46:52 -0800 (PST)
Received: from darrell-Z570.home (dapali.plus.com. [80.229.150.88])
 by smtp.gmail.com with ESMTPSA id
 kt5-20020a170906aac500b007c1633cea13sm8552858ejb.12.2023.02.14.08.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:46:52 -0800 (PST)
From: Darrell Kavanagh <darrell.kavanagh@gmail.com>
To: dri-devel@lists.freedesktop.org,
	hdegoede@redhat.com
Subject: [PATCH v2] drm: panel-orientation-quirks: Add quirk for Lenovo
 IdeaPad Duet 3 10IGL5
Date: Tue, 14 Feb 2023 16:46:59 +0000
Message-Id: <20230214164659.3583-1-darrell.kavanagh@gmail.com>
X-Mailer: git-send-email 2.39.1
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
Cc: Darrell Kavanagh <darrell.kavanagh@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Another Lenovo convertable where the panel is installed landscape but is
reported to the kernel as portrait.

Signed-off-by: Darrell Kavanagh <darrell.kavanagh@gmail.com>

---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index b409fe256fd0..5522d610c5cf 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -322,6 +322,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGL"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* Lenovo IdeaPad Duet 3 10IGL5 */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Duet 3 10IGL5"),
+		},
+		.driver_data = (void *)&lcd1200x1920_rightside_up,
 	}, {	/* Lenovo Yoga Book X90F / X91F / X91L */
 		.matches = {
 		  /* Non exact match to match all versions */
-- 
2.39.1

