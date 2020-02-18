Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E2A163ECA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE666E45F;
	Wed, 19 Feb 2020 08:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E5A6E320
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 16:08:43 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id y8so8240144pll.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 08:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=/PWlIRrux36Z8YXu1c6rYJDQ0dR+HkQHRAcmTGfpRHA=;
 b=Wgikwh8/fq9qwIWTMaJkaQThHgvxfDWhHENraP0DiIzzSAj35YjR+DZaMV2WEQg67v
 JCmyiY4bh+10crmZGGwVT5CgYfpW190885U7uL6UAmLbwDC2Zm9vY7wNHnsryOZN/zop
 2k/831O1h3NE7MgvJb2DqelTL//+p6B3dNlyrTN0mIrcaceW0MjdSYroz8zc9FeIJMoV
 oCpyOf3f4asPzYEWn1RxRcGajYYQ09A8mb3hT9wkqIDHwnVWTJybmnh+WdXwf3TTqxxz
 9ibr0nmuoeQdvagcy8IKje9E6lBy75/n34mv2YVmchT75KVwkmU/SIfI2s+3nRMRuEZ0
 c3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/PWlIRrux36Z8YXu1c6rYJDQ0dR+HkQHRAcmTGfpRHA=;
 b=RxHXS9CtnKbMyID/oQ4iFJNbjpnRasfzJRBPMeTqorsX3zJLiePlHLIhnI6W7+0cFs
 N7auHMSAUVfh2SMd7Qvi/qmWQTF8iThJw9kaKq8dN+ydbEXyqkLY999hIz1LVejpJ17i
 j9GDVFQmggJOR+yN1MH7qy7f6encQl+BhhqTYbSp1YVluDV7OMTiqf+SabMCQ9D3Lol8
 nrl6is6/x8852OdKNN/rNTcDLjJxKqvIzgWwh3qC68r1bZl5nGis608kKF+nxDubxi/h
 O7UVFzNITj/PrsXvihI7X0tzSVdQQTns7AtaZbQ5oosOjNnmFM6gnUiis+KCX7u0DRzM
 Nj1A==
X-Gm-Message-State: APjAAAVAIXVIm2iyMLrDgCImxIxrU8L0x/5vG5YQiq/y9yWbpDtbsiPw
 RMKMFWKOxl799QvSIfc/3llnbe8Q
X-Google-Smtp-Source: APXvYqwq30136YrcBJPF6QwgqCw02zX8wuOYcx6L1EtvZLWymcIhi+ooZhvqNMzsFO3Arf/VYTO5VA==
X-Received: by 2002:a17:902:bc88:: with SMTP id
 bb8mr20297850plb.274.1582042123021; 
 Tue, 18 Feb 2020 08:08:43 -0800 (PST)
Received: from localhost.localdomain ([1.39.134.248])
 by smtp.gmail.com with ESMTPSA id 7sm4866755pfc.21.2020.02.18.08.08.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 18 Feb 2020 08:08:41 -0800 (PST)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: benh@kernel.crashing.org,
	b.zolnierkie@samsung.com
Subject: [PATCH] video: fbdev: radeon: Remove dead code
Date: Tue, 18 Feb 2020 21:45:56 +0530
Message-Id: <1582042556-21555-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Souptick Joarder <jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is dead code since 3.15 and can be removed if not
going to be useful further.

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/video/fbdev/aty/radeon_base.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index 3af00e3..ccf888e 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -849,12 +849,6 @@ static int radeonfb_check_var (struct fb_var_screeninfo *var, struct fb_info *in
 		case 9 ... 16:
 			v.bits_per_pixel = 16;
 			break;
-		case 17 ... 24:
-#if 0 /* Doesn't seem to work */
-			v.bits_per_pixel = 24;
-			break;
-#endif			
-			return -EINVAL;
 		case 25 ... 32:
 			v.bits_per_pixel = 32;
 			break;
@@ -2548,16 +2542,6 @@ static void radeonfb_pci_unregister(struct pci_dev *pdev)
 	if (rinfo->mon2_EDID)
 		sysfs_remove_bin_file(&rinfo->pdev->dev.kobj, &edid2_attr);
 
-#if 0
-	/* restore original state
-	 * 
-	 * Doesn't quite work yet, I suspect if we come from a legacy
-	 * VGA mode (or worse, text mode), we need to do some VGA black
-	 * magic here that I know nothing about. --BenH
-	 */
-        radeon_write_mode (rinfo, &rinfo->init_state, 1);
- #endif
-
 	del_timer_sync(&rinfo->lvds_timer);
 	arch_phys_wc_del(rinfo->wc_cookie);
         unregister_framebuffer(info);
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
