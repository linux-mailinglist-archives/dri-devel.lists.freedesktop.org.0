Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4D141FA68
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 10:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D876E836;
	Sat,  2 Oct 2021 08:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EE26E593
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 22:17:05 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7EAB55C00F2;
 Fri,  1 Oct 2021 18:17:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 01 Oct 2021 18:17:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mai.rs; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=jAllNif2I5CRiUQDbbU3DrWC3p
 7Ie/Gmw9XoXQerPqI=; b=DwGCTNAMQ1zzW+5QUtcb1x9kgWTLuNY8GLqZbzLqHf
 irzP9sCNAfaCA1LrVrE3vG1hE7zpQ3FvfxgzRKZbZ1EbRWfSPPFe7xqb4SFtHe/n
 64KOxv7awOAspKiv6sKW6jWe344OUWfRS13ndgZT7mVQhugFysb9GZ5HE3lSpaTZ
 KiO3AdZJcQA6hNL+aK16DuReSkAEQKEim0FuzUeEO5vHamB9ZLuotNMykk536YXx
 Tcl+6AWRGFqhUHinmuY0iKo3SIr06GWtA0ajLttgJD6nnF19Jhs8Z+AhI06HyqCl
 ir/2FGHrXf5Rmp4ybdVjMnrUJ23y/BGQ0MXUnx4ubdXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jAllNif2I5CRiUQDb
 bU3DrWC3p7Ie/Gmw9XoXQerPqI=; b=u4yjpS6qm5sEeo1L0I0CsaP/d7nHg/syx
 c2mQpork/mE0ZDr0BzCr34U4CV2Q7wx7HizpJo+WcatmkNFaPVr29GF0ejod0joP
 fPOKJIUUQ/eqF7JpDc+xu16PncOa1UY/FQ8I24BpBqT147ol8aHmV6empBZN6sl7
 fFwxZVam8p4QxcvD/KqS69ePYzd+ve30drAr5iymBfdGmjbCJMBsQe0gxWRwOmFd
 4kO9d/fRNDLIlGLK2N3iaB59VrwI0c/d3Fca+4yAoAC6TFvJSEoqDJen/rNYeM+P
 FOJ40xZ/m6318gJrsgieT6fVd2GRtoEy44NBvCYou+/yEpv/0ke4A==
X-ME-Sender: <xms:34hXYZMQK_CCLbAmau31EdTDWd-eG_Xe_bfpqKnlCfNDse2XFfkmmA>
 <xme:34hXYb88tPx_aMMTcamIZ9FbdEi0jWCn4ySo_ozZYzZ2tmC-Uq9KEqoIASGq4fQA7
 3AszIeRlBsTyDCO5g>
X-ME-Received: <xmr:34hXYYTPxSBGg0iR7WBK-FuN6R6jIm-G1mpM8FXkiNt_Bq1pJKzRbnVEV74pTF6tf9ek4kexbgNXrrfquhJjybeAPRopRAa3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekjedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucdnkfhovfculdeitddmnecujfgurhephffvufffkf
 foggfgsedtkeertdertddtnecuhfhrohhmpeeurhihrghnthcuofgrihhrshcuoegsrhih
 rghnthesmhgrihdrrhhsqeenucggtffrrghtthgvrhhnpeejffeigfeivdettedutdefie
 ehgeevuefhgfejgfefffevgeejjeevgfffveevffenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhihrghnthesmhgrihdrrhhs
X-ME-Proxy: <xmx:34hXYVtfPbdNhh4GNfh3iVaurVgAOSpG5Z0uqUMYVKQvM1mx7j9skQ>
 <xmx:34hXYRcg9TYmnGNDUGD7-cjkDfNNARg3C2ZmL3m7SJUQ-aa15Ld0AQ>
 <xmx:34hXYR3wTanTWviAs2Q1_lxR5u8Fm-xc2qE2usoWGI6Kyw9HhIzJCO1-Kg>
 <xmx:34hXYRnZwzcvaxX8qBDD-VJSG-mWmsOocW4kmCW-bA-43qjvZqdm_w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Oct 2021 18:17:02 -0400 (EDT)
From: Bryant Mairs <bryant@mai.rs>
To: dri-devel@lists.freedesktop.org
Cc: Bryant Mairs <bryant@mai.rs>
Subject: [PATCH] drm: panel-orientation-quirks: Add quirk for Aya Neo 2021
Date: Fri,  1 Oct 2021 15:16:18 -0700
Message-Id: <20211001221618.29765-1-bryant@mai.rs>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 02 Oct 2021 08:29:48 +0000
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

