Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18576491196
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 23:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0003110FF96;
	Mon, 17 Jan 2022 22:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7358B10E27D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 12:42:14 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id j7so16597138edr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 04:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yRp5vpEEm1SXVjL4+SJZ21TEtlFhW6hGRwF3O5ylJ6A=;
 b=JItvRrMVIHhvO2LFJaZ4eOf4AxABQ4ht/N4A/hWafgObEDCsTX57F3ODs5Y6wxepFx
 s/iKEMv7n9HMpUGy/aHd+OW8cqSh3uFG4VN2AL71PMW5T0wJppZqykRxjTYGIKY9Iyyo
 MamTUwQioE8ES10cEAYn3vKnspSB2bkQTazVxRHBJj1IjLi9qtWpDJ289JUd2Hjp66SC
 ndf4Axffz4ZjHm+CZai0orPAgi8s0dkxdI01HM5yWI2yJ3eIImJpfBmKXADocLhusBH6
 7WV5S16HsVif0aDcG4KLzAT1wfTAem8fSrVLH3fmlMUb0jFkKU20mmVXYcGCYUfsQKCC
 +NFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yRp5vpEEm1SXVjL4+SJZ21TEtlFhW6hGRwF3O5ylJ6A=;
 b=1paxOTlJohjBiE6AImi/ycdqOPbAFO/kvxr/d90XHudEV0LlSvoko2w58nkE7OTOBb
 qZ+4rdyIanPn0fmn4H67TJPkLgTLzTKKt52R07prqv21R2VV5gprBxielGX6vmvLOgSH
 gOItgE7OIKkwSmVXMdxGDAFAmEc3bcpOb+1rk/eWU0Vu4fl9Jv6e6NzDfZEgeorAGwb+
 HkDtsKzdVoeRAlSCkViciJo1gJZublw4lgHyQJLx8sW3Mg9UQnni2jxllSMXKwEDwhuX
 Ndz+5i5EOLVoDoPmscPEPDuPdKuUftB4KeLcLW+HAtYL5DkaAuS9/Jvot0LcUM6q+j0O
 f0mA==
X-Gm-Message-State: AOAM531479Ni01kIpo+CUCYOf5m7yxINZXoogUr9XC0isKgFiXF2URRc
 FRy4KMnqmzQiO0fhkhDSVN2Izn3QL9r9RA==
X-Google-Smtp-Source: ABdhPJwPVWabEGI3gqrVJC/+kDmkQKLefZ2IJxKYieQjQW1g2rGzrk0/gajE0cYHtqh+putVDQRPdQ==
X-Received: by 2002:a17:906:954f:: with SMTP id
 g15mr10751187ejy.755.1642423332996; 
 Mon, 17 Jan 2022 04:42:12 -0800 (PST)
Received: from tablet-gentoo.djselbeck.de
 (ip5f5a8f7e.dynamic.kabel-deutschland.de. [95.90.143.126])
 by smtp.googlemail.com with ESMTPSA id mp5sm4412708ejc.46.2022.01.17.04.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 04:42:12 -0800 (PST)
From: Hendrik Borghorst <hendrikborghorst@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel-orientation-quirks: add Lenovo Ideapad Duet 3i
Date: Mon, 17 Jan 2022 13:41:54 +0100
Message-Id: <20220117124154.5689-1-hendrikborghorst@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Jan 2022 22:07:45 +0000
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
Cc: Hendrik Borghorst <hendrikborghorst@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Lenovo Ideapad Duet 3i has a 1200x1920 panel.

Non-exact match is used because a non-LTE and LTE version
exists with string "10IGL5" and "10IGL5-LTE". The patch is only tested
on the non-LTE version.

Signed-off-by: Hendrik Borghorst <hendrikborghorst@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 042bb80383c9..a69caf423b48 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -262,6 +262,13 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
+	}, {	/* Lenovo IdeaPad Duet 3 10IGL5 */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		  /* Non exact match to match all versions */
+		  DMI_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Duet 3 10IGL5"),
+		},
+		.driver_data = (void *)&lcd1200x1920_rightside_up,
 	}, {	/* Lenovo Yoga Book X90F / X91F / X91L */
 		.matches = {
 		  /* Non exact match to match all versions */
-- 
2.34.1

