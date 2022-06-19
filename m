Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8922C550A19
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 13:20:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD7D10E333;
	Sun, 19 Jun 2022 11:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781C110E333
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 11:20:10 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id e17so10334488lfq.8
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 04:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YOIemqa3xLxDPgSIq+6JCIgvmCAUQLVD4NTDCfwUgvg=;
 b=bQdczVTmeCBRRml/qJ3pgDPNKFd5DnupXxnTM4OjaPQgUF2aGS1EStz3yq0iJVSQvM
 sKxzUMyGJssePtKOzMAZzuZxgW/hgM14GyceFu+HJCSd3rtPmAQVffjiY/kwEY8VE6zi
 457qpYlewZzIBwRCff+0if+Qb2umvW+ou0vpwyZiPXi2ISTtCdhUo+sqXM6WehvV+oNl
 t1vDLNNvXYhBVRkRMfblZJjeeQpoSoLcmDr7LCEWzsnodjgsSNev+j0AWggH063pZ8OH
 H2MCqwbl/vr9A81fOhyMLHDfjEWM5gy0strMeERLsB2kRQ/BNUE8PNB3LYCqMWOc3BhE
 MUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YOIemqa3xLxDPgSIq+6JCIgvmCAUQLVD4NTDCfwUgvg=;
 b=nXIRWjjenp8lK59cLjz4boo8VKbbqACKO23fZPJTLeObFLXs17fRtvA07JoPmkRGN3
 pHp2MEns3VYKFJbmvDviUbZ9HSLUFC/fXrcrUM7JBrARW9WniU4EFGdVlwCDTfDaaJm9
 JBXrTpbreEldH80lRqnukEsgv4zxqyr4XvAtSc47CPOwQM/9J44sCqTyLEliUY81h4/9
 WM7jb9gk2kHIzrXq5JWSUsrd+QhIncSc3/MZ4yETlajGtnJ7KXJvS582et4pu5qmoS7q
 azh1vJWClylZKfsUOSZi1oLoea/HevjIaz6BZSsuJq9FmTeR/Eo1ctxOaogecpJfntL2
 IuFw==
X-Gm-Message-State: AJIora9DsXr2nYrOZRa0Mi7ziW6MR0C764E9k3eYxwRL/MuVgLVcZAsX
 qqf+F+4sHkr2PjDT/u7rtwk=
X-Google-Smtp-Source: AGRyM1uuRURbU68lqDoRqXT3mGHNAsxKeG9k4FUUNkHrrrYJI692bLRl/QrmvUtiVDXYNpA6FrCLIA==
X-Received: by 2002:ac2:4e08:0:b0:47d:c408:5565 with SMTP id
 e8-20020ac24e08000000b0047dc4085565mr10861585lfr.633.1655637608670; 
 Sun, 19 Jun 2022 04:20:08 -0700 (PDT)
Received: from ayaneo.lan (79.191.3.219.ipv4.supernova.orange.pl.
 [79.191.3.219]) by smtp.gmail.com with ESMTPSA id
 x21-20020a056512047500b00478f2a09100sm1326311lfd.184.2022.06.19.04.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 04:20:08 -0700 (PDT)
From: Maccraft123 <maccraft123mc@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm: panel-orientation-quirks: Add quirk for Aya Neo Next
Date: Sun, 19 Jun 2022 13:19:52 +0200
Message-Id: <20220619111952.8487-1-maccraft123mc@gmail.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maya Matuszczyk <maccraft123mc@gmail.com>

The device is identified by "NEXT" in board name, however there are
different versions of it, "Next Advance" and "Next Pro", that have
different DMI board names.
Due to a production error a batch or two have their board names prefixed
by "AYANEO", this makes it 6 different DMI board names. To save some
space in final kernel image DMI_MATCH is used instead of
DMI_EXACT_MATCH.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>

---
Changes from v1:
- Changed it to use only one entry, with less exact match, as requested
  by Hans de Goede

---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 4e853acfd1e8..df87ba99a87c 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -152,6 +152,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYA NEO 2021"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO NEXT */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+		  DMI_MATCH(DMI_BOARD_NAME, "NEXT"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* Chuwi HiBook (CWI514) */
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
-- 
2.36.1

