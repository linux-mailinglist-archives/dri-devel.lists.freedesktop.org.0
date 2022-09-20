Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7645BDD5A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 08:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DDC10E2AD;
	Tue, 20 Sep 2022 06:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE05310E2A5;
 Tue, 20 Sep 2022 06:35:09 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id c24so1431538plo.3;
 Mon, 19 Sep 2022 23:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=1w2FoXD/D84E4uId7V6otTfMc/siOHJMEbdjZCWmVQE=;
 b=nX6kX11S3z8+LJuWsnbGzwCHtLr3LAeddNwLT7EL/R0GRHzdaTd7qe62REc6g/5IiR
 2oUhvpfXk5SpcOeTONQXWO2or6rRg6AUj8oriXlGCWcDhwYi2IUrO1IxIepjKdcg94Mi
 U4qHTCkhmcXnZ6QJsjBeOqVvJgPazGwdhEcVmVj1aBBtEmIuWS9GNR/pkYofYKimRctg
 riqi/I6SQlOxaeMuLdlEz644KshLgB4aRdf9bNvhNbDrSVGJZAOw9h5GjobDC4TWO/CQ
 ETrBBRFyP5WYUBft6Syyw3oC4hiA/7zOzPLHCHoEPWJI0BqiXLbiGqiP5SlD6ShTZD5l
 Asdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=1w2FoXD/D84E4uId7V6otTfMc/siOHJMEbdjZCWmVQE=;
 b=nBtghvjjtafggFAHhFFpdLOyt/G1KymEqx+i8TJVPyP3mKGerTJqZGUH04MZS1Kpev
 rFkPUhLlgjeqJc2CkP9nB9/4Z7TmFpL2D0xFkRIIxFPCWdGN2kxRLXVew1H9Dwb8g4Dp
 AupQJMAxfx3a+DSQVUCwlnXU9oFHLgo1fTQ6wB6G3BqrQ7wOoM/rqEwAVHS87teyW043
 7fGMdHYRxTyzdwiwLvamYL3fd+VUiBVxBl6DCC9xaTwLX24XUe4cnyhSyBmJPo6LAl4n
 gOrLYixjEPO4ePkIcq5/gImRb5Goe3cJXH5Ofo/kdoDgLNkpefkCC0pUIPND2uNSPCg5
 aF5w==
X-Gm-Message-State: ACrzQf0v3ScQo/UditCOh78Nr9x7g8/mPVyu3iUHO8oUf8lXISRrlGJW
 HMtee7FFMP/8BqWXRUGjLPk=
X-Google-Smtp-Source: AMsMyM51Pi43Dc1ZYoqtfTvn38npskOu+AoDg7unRGej6tmsmu2fJmbEtLy3dbmnwg8bDqJ5dnogWg==
X-Received: by 2002:a17:902:db0a:b0:178:2636:b6de with SMTP id
 m10-20020a170902db0a00b001782636b6demr3434799plx.58.1663655709167; 
 Mon, 19 Sep 2022 23:35:09 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 k3-20020aa79983000000b005409c9d2d41sm629444pfh.62.2022.09.19.23.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 23:35:08 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: alexander.deucher@amd.com
Subject: [PATCH linux-next] drm/amd/pm: Remove the unneeded result variable
Date: Tue, 20 Sep 2022 06:35:03 +0000
Message-Id: <20220920063503.215199-1-ye.xingchen@zte.com.cn>
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
Cc: airlied@linux.ie, ye xingchen <ye.xingchen@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, evan.quan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value append_vbios_pptable() directly instead of storing it in
another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c  | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
index 1e79baab753e..bd54fbd393b9 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
@@ -195,7 +195,6 @@ static int init_powerplay_table_information(
 	struct phm_ppt_v3_information *pptable_information =
 		(struct phm_ppt_v3_information *)hwmgr->pptable;
 	uint32_t disable_power_control = 0;
-	int result;
 
 	hwmgr->thermal_controller.ucType = powerplay_table->ucThermalControllerType;
 	pptable_information->uc_thermal_controller_type = powerplay_table->ucThermalControllerType;
@@ -257,9 +256,7 @@ static int init_powerplay_table_information(
 	if (pptable_information->smc_pptable == NULL)
 		return -ENOMEM;
 
-	result = append_vbios_pptable(hwmgr, (pptable_information->smc_pptable));
-
-	return result;
+	return append_vbios_pptable(hwmgr, (pptable_information->smc_pptable));
 }
 
 static int vega12_pp_tables_initialize(struct pp_hwmgr *hwmgr)
-- 
2.25.1
