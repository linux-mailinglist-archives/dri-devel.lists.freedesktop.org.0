Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADA5402C35
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 17:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AEB6E03C;
	Tue,  7 Sep 2021 15:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic302-21.consmr.mail.gq1.yahoo.com
 (sonic302-21.consmr.mail.gq1.yahoo.com [98.137.68.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E236689F47
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 14:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1631023722; bh=Z9zQx6waEf/ujPUYmr8rGd6yJIYG33Wc+DNBT4U1n50=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=lD8uqCmEMqGzcplZo882RPFQeNJsCTWOG9ffeNgnlv4oDpIreqkA3PrrmTDI29wlI301rpP1B0HuGUfGzyjyCaOiocMW1py+lOJdtv1cM9l3R10AjK2tDMSkLovmDKaemLRw2aA2HVx1ve3vhu9dIYOkl43OHKu4paBoCkqdm7b2x0MHBBirtZYZJ0+ZveFR1Zi399Cf5lt/AFPijrUKDp0OLcjdpBG46sXJfQZXRE8n3h1cOJFMlwWpr9IMbWXqWHyZDuzMCcX6O/tdBJ/aH8cwHxgFmeWPtXoC9msqvJD1mfOXuoIl1DmOrsxXMCrkNv2CvNsiVALY1+AqOqH7Iw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1631023722; bh=fpd42H7duosmZRXSpKbiIFlCLvyfCo9cWQFzfVN3Tqo=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=HFg4KRpjJ3yf/ecxBKwmp6DeTgH/2PcsMnZG2TQsGaQ2TYeKG/me4mwEwI68DmnThvHPYzZYIyxuSKbVd5kB6/iUmVvPBLxnzznDB9AlyGWJ0d9QpXu0pLJoVVZ35Uqofrty87Ctds29pyXcM5GNRvJN7StVqqGUHBPoQYV5wX/xS7TXB+0LzCe7AkNCRT3JDLNqKDwBWhqcN5jtuw2+JtC+HAT5YHPiLuhgvrbPot48EF8PEcchdN4X3bvWV+n1xNWclBFveMIWc21fcRLMmy5Wq63cStIQt++6PPR9dNGMP0o/RPua9HImJBqyFTn3tDqwnFD6xz4Xx3pUxPcoRg==
X-YMail-OSG: WnasCEoVM1l67jJwpfyVUjsg3YQyuBB64YEnUn029KiyVF0bhbuVtRErTb6Gf1X
 im2NOHCXYmHXa9T5Kk6jka9Eo7edX2U6wvcsyejPN88z1E7hRnld_jYmsYMfuZMAOJRhVgFtt_Ir
 rOKiisFWdsuwsBTqu43AEbHN5jUxOi0ac3N1e0QZoeazZKhFROb7e1_BUFezeEmqE2gcvKxAITgJ
 bvQySPUkLj3k1XlBfW5RdronfAV_2_5zEiMzwluvTLWmzeplTGbJqD5vmBKr806IssmvSIUYAyUg
 N9zhH9raKOVnRXAK4KxcnjEgUeBV8R6kulFXauSrNBxKp51DPKRBvf05emk8IfhU4sLtTKX9j5A4
 RaKsyjZAkREBZGEtzBIvQcF019VjI.aTqpHS1OUGKTrFwfVikaIM8evETNbNLngWv2Z7VcJDrUnv
 0EqX_WHlq4Ca7cqhflFx99XMtp1H9smTiyAhCvKjY2oAyZJATm_tJTPjVq1XLYt5yEC9gTVTmGkW
 hgx1N1iMUNQP2ZqNToTKLg8bHRJLuOMe6OmNn6PBoV8.1zDT0IsuFlx2XG19KPquO.1.3Tr_nno0
 5nuV3_PcrTd.BaItCGCOGxqeEIxUMFK.ArpiEavcbsqtpAGlcvvIsZUntnPOpk.qm6jpgsD5yz5u
 7gSCjH2.YqLEN4_4veC1r7UcgyIFEc0iWqPcDfGLHAYHs_fcptVI8aPs2j3n9_7g3tum2njv9gIR
 VzI9MV58iyulFjAo7xgoNhqcSp7BDvmpafynQAU1eIAsitiJOOJa8cQYgF4SkRWVZubgK3YZakX_
 m1xggGmu27WGMhlHGj5mWeITJCgzZE7_xWIgrM3TvBSCtDKTOGJA6rXgs79xQqV7AsciXqeRHjTh
 La0pwpEngCoU7UVtqg.k6_.mZCY0aWXErh_b8YsVR18yhgqjABlzbhnqH0aE4xp1P2yzpuSx7XOL
 h1nEqRBaj6bLpRFsqZdXlnNyadG_lzugrH2pT5wbDrS9164nRhoZHh0IlSbd.6s1LUFFPdMK.HFT
 1Pe0Q21lXLg_YgoPno1IRp91JCXh9uN7hLQ1vbccV.e9jZ28I3hpXefq31tiN_hYYSMXfjy5mZii
 w0ElO4J9mcw1Blo4kFgOdiG8QbdLwWmvlX9J7OF3Xdes60arCyFJrLNbpXbRGoTG2UHegv6IGI7Y
 hdra5lIaJMUVW.bgraiZPmwksNGFN773hgIP0TB.Jr5lYnH__vXGcmZ3FrW093uix51RHjdCcoDB
 r9Peurcm2V3LvqofbuyNtfQjBs7juBVtq3.8TfAHwNMlbwBHUbw83osZGXnamcOPBDlDwZ11HiTf
 bakgD1y8Ai55d4c87qQLk83vopZZ25W.S29th1bR7ddHTls1SCGgCBwo131hdVB9axGkjzBS9Q6h
 pwWeu86toMygt2mycTjQCv.ta_ajQqT0pGQ48eAr_blKEX7kMLDZSS04N8LFhK8vRngl7AHdmI1y
 ZKxZBswAi6m_P9GFwttUp7TmwBcf8NVcMrtNXfMvnvpSruJ.mJMckcbSYEhtprSG3bFySLlhau98
 7eDjFLQvaxT5ooA2eEgE1ffetGh3PEogsoAxrX_3EIZ5qw77OIH4cp5WNtuOfA3Z0.PnPjL9DuJG
 bhyKR8uOoSp.GGDQdGZcm8il_q8ToTTinaXOFAZUMSukR6BpAMUQ2pGfhoGRGWIllF3cOFvfCIJG
 wgULz_ksy.daLR.QvOlohpdwMf5NvAQ7Qpb.3CXCwtNngHQe3qlxmBrZldyOxeKdoYG1cauqz56D
 zQs.nwV3cdxWcMD7P9Ut.8JNHCJUbjSTizW9UuFgP0cUYazBZGm4yaFBcyjjrIj8uTUKvWWhbON_
 IhIfCKbXaXURyFgFB.IEk1FUR9CVE49D2qCZX3qvxhQU6J95lac.f5YTb_BdoFEo7gffMTEjjqKh
 .36j0LQujOniFL3sTNDQkBYyw2byrFZNlDXDJNVfh1fq0RJ9pnS_c5s_dszXNOJmSSdgnZPv2WUQ
 hEKfgDTZ1qANl6rQ6YKrKDnpq7aRqfHWkbssNgPGKpOpiSw8UfQXNfFEzUUnsHTaKmfJOv6hyEXS
 d2E.gXwmpJmCgr_dsn160p6350VCpB_u8WwM8TTxOmS1sJAClUxjArMQDzQOFz.hDfibs_UBXQKY
 TU3rgPYFo3kqOP8c91HLGW2cmPsNAUwzrZpoZ3w_rZVWgC2jFBzGLSvoJC0j41IGSS4DXV0fcr4t
 OiINOuovEYR4GhRf3jGby5OP_hzMgYcrtUbfr5O34V1X_F1YUWv_L8i8z3XLfE8eik7h2BsaEMie
 MePEfWO_V7JqYzt9pugR2H2suAf5S0rA3Un8TnnAzDwA-
X-Sonic-MF: <alex_y_xu@yahoo.ca>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.gq1.yahoo.com with HTTP; Tue, 7 Sep 2021 14:08:42 +0000
Received: by kubenode510.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID b517298d82bc14160bf5b508c63db16f; 
 Tue, 07 Sep 2021 14:08:38 +0000 (UTC)
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
To: dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, linux-kernel@vger.kernel.org,
 "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: [PATCH] drm/plane-helper: fix uninitialized variable reference
Date: Tue,  7 Sep 2021 10:08:36 -0400
Message-Id: <20210907140836.323149-1-alex_y_xu@yahoo.ca>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20210907140836.323149-1-alex_y_xu.ref@yahoo.ca>
X-Mailman-Approved-At: Tue, 07 Sep 2021 15:56:07 +0000
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

drivers/gpu/drm/drm_plane_helper.c: In function 'drm_primary_helper_update':
drivers/gpu/drm/drm_plane_helper.c:113:32: error: 'visible' is used uninitialized [-Werror=uninitialized]
  113 |         struct drm_plane_state plane_state = {
      |                                ^~~~~~~~~~~
drivers/gpu/drm/drm_plane_helper.c:178:14: note: 'visible' was declared here
  178 |         bool visible;
      |              ^~~~~~~
cc1: all warnings being treated as errors

visible is an output, not an input. in practice this use might turn out
OK but it's still UB.

Fixes: df86af9133 ("drm/plane-helper: Add drm_plane_helper_check_state()")
---
 drivers/gpu/drm/drm_plane_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
index 5b2d0ca03705..838b32b70bce 100644
--- a/drivers/gpu/drm/drm_plane_helper.c
+++ b/drivers/gpu/drm/drm_plane_helper.c
@@ -123,7 +123,6 @@ static int drm_plane_helper_check_update(struct drm_plane *plane,
 		.crtc_w = drm_rect_width(dst),
 		.crtc_h = drm_rect_height(dst),
 		.rotation = rotation,
-		.visible = *visible,
 	};
 	struct drm_crtc_state crtc_state = {
 		.crtc = crtc,
-- 
2.33.0

