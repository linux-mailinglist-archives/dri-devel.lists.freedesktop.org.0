Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B0B5473D2
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 12:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB9710E1CE;
	Sat, 11 Jun 2022 10:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BF510E1CE
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 10:39:36 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id y29so1528224ljd.7
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 03:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PSmhOA3r9XyRYzBKjCH2Kao+K8IX9uC3IcFF0Lf9du4=;
 b=UVdCz1cRw00gFG0o7Z9KvsY4zOXCJpIrsyUhlHWPLN7qGH0x5uuRUk8Bl0W3ZQQBb8
 aXHrNhmcVNqhACY+K+d1q8lOXI5CHf1HwHBp07jSd+mlR8Vbclk3QA5sb+exrg0TverK
 WIUlZX6IKxNaXE77DQkq1On5POniUfZAMvHU4H4WMneESEbIb4kDsDPCB1tknh/8OX+t
 1zwIzbGK6rfeYdUPXQPPVZ3bBF3ehNsY4prE67645cVaCF6jHJyub2+JqrOfpfpsWUHu
 2Diw7hYABz4XOsb9qPmj2g08GoPfnVd31v/42YpM2jmpRtbtTb3Ke7LySftdf08D2Uui
 cmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PSmhOA3r9XyRYzBKjCH2Kao+K8IX9uC3IcFF0Lf9du4=;
 b=I4gDOis7r7+txDzPbawXdBt0ARLD2e33pTYcXokoOhTpi67Lno0UQ3KPV7FcX9VjwD
 EJb9Gg33YnDmKiu+GoH4Fs/5uwJjbjfiosndO4uuWjDGof+EUM7qst6TfOQqtzmPzzQT
 Yl5cx7kKWco2h7bglkOklpxiLNRm84C41FPZtJjCe5VkgmEC/CSWOYbR+COzPK63+K3q
 7GmSFbsu1rRjQkUcjgMuRN1JVc9BAZUZyW99peJmmHkCBKIvyZz/CihrcrRpKXQvhV4T
 DhaP86vIyCBo20idOOS5HDmafK47dHDgrjQAsfCJtrNRzNhkwVJsf/Gt4TZyqV6cE+pK
 mDUA==
X-Gm-Message-State: AOAM531f5q2LLZcgivpoxKt5OUKbOTISLV1pYFs/zKah9Mobn1ZiuEAK
 Z1yyphF8yDK3XLWwLMXfqho2T4xKNSlhag==
X-Google-Smtp-Source: ABdhPJwaadABBe0VDwWSREeO48gWlgmlEibN3m9x2hsvu4dsW+r9PJFXLUVUf7rhF/MvbUCAROyAFg==
X-Received: by 2002:a2e:a88a:0:b0:258:df66:4ff5 with SMTP id
 m10-20020a2ea88a000000b00258df664ff5mr5731784ljq.415.1654943975059; 
 Sat, 11 Jun 2022 03:39:35 -0700 (PDT)
Received: from ayaneo.lan (79.191.10.122.ipv4.supernova.orange.pl.
 [79.191.10.122]) by smtp.gmail.com with ESMTPSA id
 f13-20020a19380d000000b0047255d21179sm212104lfa.168.2022.06.11.03.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 03:39:34 -0700 (PDT)
From: Maccraft123 <maccraft123mc@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: panel-orientation-quirks: Add quirk for Aya Neo Next
Date: Sat, 11 Jun 2022 12:39:12 +0200
Message-Id: <20220611103911.9417-1-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.36.1
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
Cc: tzimmermann@suse.de, airlied@linux.ie, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maya Matuszczyk <maccraft123mc@gmail.com>

The device is identified by "NEXT" in board name, however there are
different versions of it, "Next Advance" and "Next Pro", that have
different DMI board names.
Due to a production error a batch or two have their board names prefixed
by "AYANEO" and that's how we ended up with 6 different entries for
what's basically one device with different hardware specifications.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 .../gpu/drm/drm_panel_orientation_quirks.c    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 4e853acfd1e8..62fc7eb69341 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -152,6 +152,42 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYA NEO 2021"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO NEXT */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO NEXT Advance */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Advance"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO NEXT Pro */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Pro"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO NEXT (Batch with different board name) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO NEXT"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO NEXT Advance (Batch with different board name) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO NEXT Advance"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO NEXT Pro (Batch with different board name) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO NEXT Pro"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* Chuwi HiBook (CWI514) */
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
-- 
2.36.1

