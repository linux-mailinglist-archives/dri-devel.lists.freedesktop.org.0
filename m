Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC89D5AA990
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 10:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CF110E78A;
	Fri,  2 Sep 2022 08:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7120610E78A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 08:12:10 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id w2so1204103pld.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Sep 2022 01:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Sp6uHF5Iwvu00Tbj0ZOEc8ZB60lUbaBAN+8ZZ79Xoug=;
 b=A6F63bK7HuYUTHZh1eppDTtnh1ZFOzfBh3saxCb2SKKPs7fBu3CdSWfk/Arg/V3f7Q
 9SmP4JRE56f0w+5xIrPjQyuqDDSMUd3hlqDaApWjOLNUFIfPT6qDUILmb/+fEdw9MSQG
 F2ZRFaAu95IQ4ueeHQRzV3Ae6WHh6oionqyVy3mJnE8LIXcw+ZJhNmXsLh2GOTrrQlXu
 bd+ub7Rb/AptqI+yxDlkIcIjPeceWNocciUkVHoOXWXGJksMyJGmEiDFpTi7INytCBRw
 hRmhzEXnyH7d534du13VS6TJ/tQNzFdB1DPubpm0uOXpy09qOaYNmLON4qH5glrWFYb+
 8ENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Sp6uHF5Iwvu00Tbj0ZOEc8ZB60lUbaBAN+8ZZ79Xoug=;
 b=jnU+8AyVTI3TLhgrAkn8xn0tZXrC3HGoW51mVofywZtme0fWjaz47mnq5gG6c/LxRF
 scCufzfaqsuUgT5YJK5W432Wk2rynm/RUQ2QHt9G0KoiTlI1OBaRf3omdjCvNdoTRwJp
 MGRHA65qfjUgBf4JIfj0e1NmK4JrUNhabhI2yQeRPxyspve6aQi4sthU1GiA1dpCIyw4
 6aND0c+Ny8iW5X5MghLsv3vgx7apd0zLcXoi9OOtze/yjGBASACOeEstNbr1YMJ4K6Jz
 sZT4TW+UpxOKD30ib4OsMViA/B2Rp7v622fe53sgaNqqq08lLI9+bXBM9ovEQGB9rqUJ
 PzZQ==
X-Gm-Message-State: ACgBeo2RoasnDaG6UGFtskyBFZh12z+tlwgMwTkplxz47A3FG3fROer7
 VAoteR8vngPyKMr4rcrLO+s=
X-Google-Smtp-Source: AA6agR7tT9ErYh2E5Np94U1vZlfLy+m04TJYCSxWQ5NWkn48/4IAiJ5neS7k/0wnjmYs8aHsR23Jqw==
X-Received: by 2002:a17:902:d509:b0:16f:1e1:2063 with SMTP id
 b9-20020a170902d50900b0016f01e12063mr34155758plg.131.1662106330062; 
 Fri, 02 Sep 2022 01:12:10 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a170902d50800b0017550eaa3eesm978052plg.71.2022.09.02.01.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Sep 2022 01:12:09 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: zhang.songyi@zte.com.cn
To: airlied@linux.ie
Subject: [PATCH linux-next] drm/dp_helper: Remove the unneeded result variable
Date: Fri,  2 Sep 2022 08:12:03 +0000
Message-Id: <20220902081203.320165-1-zhang.songyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Zeal Robot <zealci@zte.com.cn>, zhang songyi <zhang.songyi@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: zhang songyi <zhang.songyi@zte.com.cn>

Return the drm_dp_dpcd_writeb() directly instead of storing it in another
redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: zhang songyi <zhang.songyi@zte.com.cn>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 92990a3d577a..09b282b704fa 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2925,16 +2925,13 @@ EXPORT_SYMBOL(drm_dp_get_pcon_max_frl_bw);
  */
 int drm_dp_pcon_frl_prepare(struct drm_dp_aux *aux, bool enable_frl_ready_hpd)
 {
-	int ret;
 	u8 buf = DP_PCON_ENABLE_SOURCE_CTL_MODE |
 		 DP_PCON_ENABLE_LINK_FRL_MODE;
 
 	if (enable_frl_ready_hpd)
 		buf |= DP_PCON_ENABLE_HPD_READY;
 
-	ret = drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
-
-	return ret;
+	return drm_dp_dpcd_writeb(aux, DP_PCON_HDMI_LINK_CONFIG_1, buf);
 }
 EXPORT_SYMBOL(drm_dp_pcon_frl_prepare);
 
-- 
2.25.1


