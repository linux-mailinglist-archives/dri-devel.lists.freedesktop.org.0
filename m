Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E50A343385D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 16:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93306E160;
	Tue, 19 Oct 2021 14:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A31DE6E160
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 14:25:06 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D8A805C02C9;
 Tue, 19 Oct 2021 10:25:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 19 Oct 2021 10:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mai.rs; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=af9E54i9xjq+Re1iYan+L+eAru
 eMMBRZHZ34ABhfSVM=; b=ZSMhKGRoirTf6ZmcfFxbTGNgn7584G3uKhIvGPis/a
 4UcJpY3/cqfLsB2wg3iUvEUCSuKsXAlCB4kC8LKcYVWZOqEFsquG3XSo+mrEq530
 xA16gyy/rXcHvDpo6r62wdZ6uJRRFEqOZo+I8bOzQbsEEBDs8tCTnhFF/OmtRvU3
 o1LsVNz7xQzGraa9sWgoOWsuOZhsdqXKmTW68n/gzogLDq0j6bxjAZsfZtxsyf+3
 vA6Lzp7W6UYNAf403CnuwTDJZV0piISZB2fjvUE0rouVGFW83/d7woL8pG/jcU8Q
 NEsgbKO0oFxHu0FNDqXiIPlk/bbVmboNH8fPjcu2OnBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=af9E54i9xjq+Re1iY
 an+L+eArueMMBRZHZ34ABhfSVM=; b=RRhAcbFXuoAfuUIKq1on9NoXM8Zz35exO
 euzqvFqo9bmCc2TmTz/QyxrGezWdVicFrlqn7a9w7wmva93JRfqojMwZX/j16X0h
 Vr32FYwI1cNrEBIuY1OvUQFLpoGrL20PVLyHnjaH7CQBCn3K+l5Wf7uiidObOdGI
 xblYuqexNCOO1Du9uNfzDIXlFPAj5HGJMQHZmlpYCzyOmzbx60zyup5UdGfSzlpF
 871D3OYtEWVSwEJaClyT/S3gWKxfJ5oTiWBluzLlt8OjzWNfgQdaNxCzeY42JTMQ
 DVKrPuoesVJXQ23xxxffXTCJt4xoAXqrWQ9iQHihnxunK+WbLtTyQ==
X-ME-Sender: <xms:QdVuYaqlzT8N_cGWazCmL0zs5og_ejHG_Jqb0CzLxo1YbaGUV3aVVQ>
 <xme:QdVuYYphFFo4QEsoSrEZLp1lrHExasGfE6mCptyGy5RLe5d6StCLBlB3AW87hy7XC
 uJ2-ppgUZ8a_4AVrw>
X-ME-Received: <xmr:QdVuYfPb5zhCtn6G363IWwk6dowkvk8wuW46llobcgGQhujltBmtOOk8uAvH3iO4OzynfUXxlb710bv4vs7dGhviLNHH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvvddgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucdnkfhovfculdeitddmnecujfgurhephffvufffkf
 foggfgsedtkeertdertddtnecuhfhrohhmpeeurhihrghnthcuofgrihhrshcuoegsrhih
 rghnthesmhgrihdrrhhsqeenucggtffrrghtthgvrhhnpeejffeigfeivdettedutdefie
 ehgeevuefhgfejgfefffevgeejjeevgfffveevffenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhihrghnthesmhgrihdrrhhs
X-ME-Proxy: <xmx:QdVuYZ5kPE3tnd4tovV2HY52vq_HN0yEt7rbGPUE_7sT91MGcKmkxg>
 <xmx:QdVuYZ6PCCdKSJ4pHOKXg_ofutOdkgSLRiI1si9FfDqKHtjYG9BQrQ>
 <xmx:QdVuYZi2OzojzxaYK07eTD53hk4ZZewie5WwVddlE29kqZFpxZgtsCqkhw>
 <xmx:QdVuYWhk6zYK6Frt6sgS36SnqUM-2RT7NKaaIPIJduCqQHxi-vwDKA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Oct 2021 10:25:05 -0400 (EDT)
From: Bryant Mairs <bryant@mai.rs>
To: dri-devel@lists.freedesktop.org
Cc: Bryant Mairs <bryant@mai.rs>
Subject: [PATCH v2] drm: panel-orientation-quirks: Add quirk for Aya Neo 2021
Date: Tue, 19 Oct 2021 09:24:33 -0500
Message-Id: <20211019142433.4295-1-bryant@mai.rs>
X-Mailer: git-send-email 2.31.1
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

Fixes screen orientation for the Aya Neo 2021 handheld gaming console.

Signed-off-by: Bryant Mairs <bryant@mai.rs>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index f6bdec7fa925..30c17a76f49a 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -134,6 +134,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T103HAF"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* AYA NEO 2021 */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "AYADEVICE"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYA NEO 2021"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* GPD MicroPC (generic strings, also match on bios date) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
-- 
2.31.1

