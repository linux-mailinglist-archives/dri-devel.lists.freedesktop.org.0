Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1A57BCD1D
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 09:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E08410E097;
	Sun,  8 Oct 2023 07:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2A610E076
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 22:22:50 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5384975e34cso5946584a12.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Oct 2023 15:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696717368; x=1697322168; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GO9pyv976h/9S8gorIMhEgb5zOHhcco+YLW7BrIty0s=;
 b=N/lZRHrFZsbJc2LLtbtE73JdLiwgDg5TaGI1yJNu8xZIo24mDGjUubUwLmVwzZ+FDo
 4KXhvcjOsAcWg7plrK8aRsyvLpOArmKAMWfS+0WRvNM9AefNK8mUW513S2NRcBXeMzCl
 bW/a3NTP9XNAvStKT6gn/0gz5F1gieCc6sDCd1RvAT3DzoIo13C6MH7pKnpSuUQBIbFD
 WK6sRkqx6SNfr/dcm+qOvXqQlZB8dOWr8QvfFjfvIKAipk/Cgjmm3kGoc99rOkIgv2ca
 BfpvrNai4wteRgoSRzQDQhDOwtMhfRc0jhcO5jwE0FVyPCa0mcb4OhyxwZdGN80IleMn
 dXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696717368; x=1697322168;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GO9pyv976h/9S8gorIMhEgb5zOHhcco+YLW7BrIty0s=;
 b=BOkqKJzQsGzW406yJBBuYKRdD/VwTpkWVL9APRzGp3nwfygAGKhO/FqgaWw3wHiTHd
 4F7EYsxfiGbJdxI/oSywb+GovLqbRXoRLpfwfkrbfcmygSAaWAAOtyHrmfeJ2qhH56hD
 AKhB26aHTT824rlEvKKEyXVnOXR38GO+e5FEyejnRUbzHusbeeHGzc6s11qeOLBQZ2oa
 m+wTmJRAPNxu65Nk9jra2xhxI8FViRgvwu6KNHIaQoRBmGKwMVVGiNVQEPiZLQP+cucB
 9Mx7b+8hcE1YTdu3/JZgEREe6GiIUVggGNl+rOgV7mJFyx29Vmjq7Dkbr67F0hyPilTC
 fsDg==
X-Gm-Message-State: AOJu0YwcLkMcZj7L1CjhEm7rZ9m/KuYu2FtzdvWAEE7XJhatKEIoxmj5
 BndKOJb77ZBa2aY3IL4dk9s=
X-Google-Smtp-Source: AGHT+IGdq5dIDjHMSpBY9R+UTam87sGHsEfph2UKnCXlBgN8QygP/VfkEkyJer83iK+mdYOBQ9QSgQ==
X-Received: by 2002:a05:6402:1b06:b0:530:8488:b9bb with SMTP id
 by6-20020a0564021b0600b005308488b9bbmr9606367edb.15.1696717368578; 
 Sat, 07 Oct 2023 15:22:48 -0700 (PDT)
Received: from Slimbook.. (181-251-201-31.ftth.glasoperator.nl.
 [31.201.251.181]) by smtp.gmail.com with ESMTPSA id
 p7-20020a056402074700b0052f3471ccf6sm4315631edy.6.2023.10.07.15.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 15:22:48 -0700 (PDT)
From: Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH 1/2] drm: panel-orientation-quirks: Add quirk for Ayn Loki Zero
Date: Sun,  8 Oct 2023 00:22:05 +0200
Message-ID: <20231007222205.316032-3-boukehaarsma23@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231007222205.316032-2-boukehaarsma23@gmail.com>
References: <20231007222205.316032-2-boukehaarsma23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 Oct 2023 07:57:55 +0000
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mripard@kernel.org, boukehaarsma23@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add quirk orientation for the Ayn Loki Zero.

This also has been tested/used by the JELOS team.

Signed-off-by: Bouke Sybren Haarsma <boukehaarsma23@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index d5c15292ae93..7466354c7e5b 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -196,6 +196,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_MATCH(DMI_BOARD_NAME, "NEXT"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYN Loki Zero */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ayn"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Loki Zero"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* Chuwi HiBook (CWI514) */
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
-- 
2.41.0

