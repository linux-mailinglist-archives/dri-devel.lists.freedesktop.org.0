Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A36E543B13E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 13:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83E96E41A;
	Tue, 26 Oct 2021 11:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6B06E41A
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 11:28:01 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o14so1339212wra.12
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 04:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nGTPimRUuQbXsjAfFE7Aj9Gc6Sbu9jVHcvTKPzpMRu4=;
 b=IuviMdSjZoRXW1PJrQe9UBhSVcEm7ke1qGcg1WIWDjEbTHDYTdNUMIgd0OlPxyO3Ep
 hZsa3KIE/HlJeKw7BlbBbdUEFJfFWOvCIVQp+5PBDhT7GqEt3b6jU+w3En0/9LKmeoAs
 1MZdqvlmhJhaRhZWb7ZApWiNMkebcM3P9nfSy3poHtRzOUjbeBcbprLIHQK6FZRNoFFd
 6dP6G+wcPGAF2sMXkZumMiZFOzMV9fzrRF7vqC2G2bgmh9wYfQhQED0qpRGtPmr4AtC4
 2aQ/oQRbe1dSJWL2OPQpwJAEEweW+2HldSxZLBTO7gzVnnHyh6SbQUwjRhOlgI0XK63A
 G+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nGTPimRUuQbXsjAfFE7Aj9Gc6Sbu9jVHcvTKPzpMRu4=;
 b=2MpSFctw3waQ7wGYBSac8DoNum7nPmfHoPD8tNlSxS6U/7LpcMersixRYNA7dvfRQG
 n5kDT1Cqn+6oHtj5Z2ZxUXRc1GPkPNWV0zctMLc7VW9kU89dcZIf9/NuL+FJPQ1F0pvO
 S2REa0QIJU8PazB/OZXSe29j3itUpgKK6ZsI4Fl1Z6Dgt6A/pzb3wuzJiYn+aMcY4Xuv
 vDw7Mf8BljhppAj1E2QmSMIrjvbQkSEmH+x0pUqjD98EeqTvrkuKlJTYy56H19TbB8FI
 1drKQ3o+02o7ehh1AnKdjjQlmxjSvHbA11Ir2i8lfEeahRoniHGugBW/UWtikksS/Jdj
 L7BQ==
X-Gm-Message-State: AOAM531/7qd51euA5yiKaXmWKsezhZORB/splxuVzWSIIfSlcfHfXfCT
 y5ZZ1CauHf6Xn/ceu5JT+Yo=
X-Google-Smtp-Source: ABdhPJz32JLoL1jJ6kI3SgRClrG3OUb/6s1YV6t+rLNL+YuvzOPoEnuWWLafwZCAs1iX5qvQuCF1Rw==
X-Received: by 2002:adf:9b84:: with SMTP id d4mr29199200wrc.393.1635247680130; 
 Tue, 26 Oct 2021 04:28:00 -0700 (PDT)
Received: from cerbero.fritz.box (93-41-150-160.ip82.fastwebnet.it.
 [93.41.150.160])
 by smtp.gmail.com with ESMTPSA id n11sm9288810wrs.14.2021.10.26.04.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 04:27:59 -0700 (PDT)
From: Mario <awxkrnl@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Mario <awxkrnl@gmail.com>
Subject: [PATCH v2] drm: panel-orientation-quirks: Add quirk for GPD Win3
Date: Tue, 26 Oct 2021 13:27:37 +0200
Message-Id: <20211026112737.9181-1-awxkrnl@gmail.com>
X-Mailer: git-send-email 2.33.1
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

Fixes screen orientation for GPD Win 3 handheld gaming console.

Signed-off-by: Mario Risoldi <awxkrnl@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index f6bdec7fa925..f6177c1d9872 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -185,6 +185,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
 		},
 		.driver_data = (void *)&gpd_win2,
+	}, {	/* GPD Win 3 */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "GPD"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G1618-03")
+		},
+		.driver_data = (void *)&lcd720x1280_rightside_up,
 	}, {	/* I.T.Works TW891 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),
-- 
2.33.1

