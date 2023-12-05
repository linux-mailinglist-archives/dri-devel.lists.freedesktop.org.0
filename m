Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFC5805F33
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 21:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224BE10E58F;
	Tue,  5 Dec 2023 20:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CE710E55F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 20:13:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 83828B81C97;
 Tue,  5 Dec 2023 20:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D50C433C8;
 Tue,  5 Dec 2023 20:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701807226;
 bh=dIROEkvo2Gg0VYeHSqM2xywwQJJxQH5RhW1JkLyvtWA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JQCLrElWpENPuaglK0pVPSbbFIJ0pOeO16T9QAE1VwuFVEbpVcqPj4hwaSKkLsb+V
 T7MN2D2V22KXDI8UUu91p1I6eDSOPwaPFkAgvMG9yUGcIPKHf4Zby0Moa8/lNa4s3H
 ZSt62UwqKjv7xF56lXZKMZPdEb+5rHRmqpVmT3JQvlrueq4/T960ctl3eRftok89HJ
 8FF7Mjzn2Sd0D+92Uap16Nek1LihQVhYITLtZ1sC26I8BVg7obDUTp3UTI06o/u8Ai
 h7eFcIRz85wb0m+Q8w9ivO1xKoRkeFTfqWuvZt8JPQzksiI+74HydRzmd7DVtb834H
 Y46JmPyKRtlkg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 05 Dec 2023 13:13:36 -0700
Subject: [PATCH 3/3] drm/bridge: Return NULL instead of plain 0 in
 drm_dp_hpd_bridge_register() stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231205-drm_aux_bridge-fixes-v1-3-d242a0ae9df4@kernel.org>
References: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
In-Reply-To: <20231205-drm_aux_bridge-fixes-v1-0-d242a0ae9df4@kernel.org>
To: dmitry.baryshkov@linaro.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151; i=nathan@kernel.org;
 h=from:subject:message-id; bh=dIROEkvo2Gg0VYeHSqM2xywwQJJxQH5RhW1JkLyvtWA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKn5LeVpGnVr72+cF7xbef/BhYHuWU6J3Gwthed+rXc3F
 C0wOafVUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACYSKsTIsGOtzpY2/rxVV3LO
 1G79Vq8mV+XoHFt9es+FO5k3FWq+1TIyPJ17Pl37quq+9Qu8A67PufrJ4mpJ3Tm7nw5d73QcvH8
 HcwAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: neil.armstrong@linaro.org, heikki.krogerus@linux.intel.com,
 kernel test robot <lkp@intel.com>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 bryan.odonoghue@linaro.org, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sparse complains:

  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c: note: in included file:
  include/drm/bridge/aux-bridge.h:29:16: sparse: sparse: Using plain integer as NULL pointer

Return NULL to clear up the warning.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312060025.BdeqZrWx-lkp@intel.com/
Fixes: e560518a6c2e ("drm/bridge: implement generic DP HPD bridge")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 include/drm/bridge/aux-bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index 66249ff0858e..c4c423e97f06 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -26,7 +26,7 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 							struct device_node *np)
 {
-	return 0;
+	return NULL;
 }
 
 static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)

-- 
2.43.0

