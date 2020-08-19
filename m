Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73143249C58
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76D36E282;
	Wed, 19 Aug 2020 11:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71026E217
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBEC32184D;
 Wed, 19 Aug 2020 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=yAx7vx/Gi4OL5Z9jtDRLnQsTuTRI/zDB6IS6y66utzQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fb00/H/gQeFpSgzVGaxUh38gPmsXFxy3RSZLa1v2BjJJhQREsBbwXdrHANPc3FjZO
 +Fy9+VLr/sG3PW34VfF+au3s2gOpCo7YnOxz3Rn4eytb9HcLwzhkrx+UBKtKVfOYSL
 UgX70btQuvk4LmLDynYuzYRu7/mHR0TA70WBASqs=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXr-00EuaT-Td; Wed, 19 Aug 2020 13:46:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 13/49] staging: hikey9xx/gpu: rename the Kirin9xx namespace
Date: Wed, 19 Aug 2020 13:45:41 +0200
Message-Id: <f4c9e644ec5e3619153efc6b208b3bf910c61c17.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Wanchun Zheng <zhengwanchun@hisilicon.com>, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, Liuyao An <anliuyao@huawei.com>,
 mauro.chehab@huawei.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's already a driver with the same namespace
for an older Kirin chipset. Rename this one, in order
to make it clearer that this is the driver for
Kirin 960/970.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/hikey9xx/gpu/{kirin_dpe_reg.h => kirin9xx_dpe_reg.h}  | 0
 .../gpu/{kirin_drm_dpe_utils.c => kirin9xx_drm_dpe_utils.c}       | 0
 .../gpu/{kirin_drm_dpe_utils.h => kirin9xx_drm_dpe_utils.h}       | 0
 .../staging/hikey9xx/gpu/{kirin_drm_drv.c => kirin9xx_drm_drv.c}  | 0
 .../staging/hikey9xx/gpu/{kirin_drm_drv.h => kirin9xx_drm_drv.h}  | 0
 .../staging/hikey9xx/gpu/{kirin_drm_dss.c => kirin9xx_drm_dss.c}  | 0
 .../{kirin_drm_overlay_utils.c => kirin9xx_drm_overlay_utils.c}   | 0
 .../staging/hikey9xx/gpu/{dw_drm_dsi.c => kirin9xx_dw_drm_dsi.c}  | 0
 .../staging/hikey9xx/gpu/{dw_dsi_reg.h => kirin9xx_dw_dsi_reg.h}  | 0
 drivers/staging/hikey9xx/gpu/{kirin_fb.c => kirin9xx_fb.c}        | 0
 .../hikey9xx/gpu/{kirin_fb_panel.h => kirin9xx_fb_panel.h}        | 0
 drivers/staging/hikey9xx/gpu/{kirin_fbdev.c => kirin9xx_fbdev.c}  | 0
 drivers/staging/hikey9xx/gpu/{kirin_pwm.c => kirin9xx_pwm.c}      | 0
 13 files changed, 0 insertions(+), 0 deletions(-)
 rename drivers/staging/hikey9xx/gpu/{kirin_dpe_reg.h => kirin9xx_dpe_reg.h} (100%)
 rename drivers/staging/hikey9xx/gpu/{kirin_drm_dpe_utils.c => kirin9xx_drm_dpe_utils.c} (100%)
 rename drivers/staging/hikey9xx/gpu/{kirin_drm_dpe_utils.h => kirin9xx_drm_dpe_utils.h} (100%)
 rename drivers/staging/hikey9xx/gpu/{kirin_drm_drv.c => kirin9xx_drm_drv.c} (100%)
 rename drivers/staging/hikey9xx/gpu/{kirin_drm_drv.h => kirin9xx_drm_drv.h} (100%)
 rename drivers/staging/hikey9xx/gpu/{kirin_drm_dss.c => kirin9xx_drm_dss.c} (100%)
 rename drivers/staging/hikey9xx/gpu/{kirin_drm_overlay_utils.c => kirin9xx_drm_overlay_utils.c} (100%)
 rename drivers/staging/hikey9xx/gpu/{dw_drm_dsi.c => kirin9xx_dw_drm_dsi.c} (100%)
 rename drivers/staging/hikey9xx/gpu/{dw_dsi_reg.h => kirin9xx_dw_dsi_reg.h} (100%)
 rename drivers/staging/hikey9xx/gpu/{kirin_fb.c => kirin9xx_fb.c} (100%)
 rename drivers/staging/hikey9xx/gpu/{kirin_fb_panel.h => kirin9xx_fb_panel.h} (100%)
 rename drivers/staging/hikey9xx/gpu/{kirin_fbdev.c => kirin9xx_fbdev.c} (100%)
 rename drivers/staging/hikey9xx/gpu/{kirin_pwm.c => kirin9xx_pwm.c} (100%)

diff --git a/drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h b/drivers/staging/hikey9xx/gpu/kirin9xx_dpe_reg.h
similarity index 100%
rename from drivers/staging/hikey9xx/gpu/kirin_dpe_reg.h
rename to drivers/staging/hikey9xx/gpu/kirin9xx_dpe_reg.h
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
similarity index 100%
rename from drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.c
rename to drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.c
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
similarity index 100%
rename from drivers/staging/hikey9xx/gpu/kirin_drm_dpe_utils.h
rename to drivers/staging/hikey9xx/gpu/kirin9xx_drm_dpe_utils.h
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
similarity index 100%
rename from drivers/staging/hikey9xx/gpu/kirin_drm_drv.c
rename to drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.c
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_drv.h b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
similarity index 100%
rename from drivers/staging/hikey9xx/gpu/kirin_drm_drv.h
rename to drivers/staging/hikey9xx/gpu/kirin9xx_drm_drv.h
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_dss.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
similarity index 100%
rename from drivers/staging/hikey9xx/gpu/kirin_drm_dss.c
rename to drivers/staging/hikey9xx/gpu/kirin9xx_drm_dss.c
diff --git a/drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c b/drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
similarity index 100%
rename from drivers/staging/hikey9xx/gpu/kirin_drm_overlay_utils.c
rename to drivers/staging/hikey9xx/gpu/kirin9xx_drm_overlay_utils.c
diff --git a/drivers/staging/hikey9xx/gpu/dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
similarity index 100%
rename from drivers/staging/hikey9xx/gpu/dw_drm_dsi.c
rename to drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
diff --git a/drivers/staging/hikey9xx/gpu/dw_dsi_reg.h b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_dsi_reg.h
similarity index 100%
rename from drivers/staging/hikey9xx/gpu/dw_dsi_reg.h
rename to drivers/staging/hikey9xx/gpu/kirin9xx_dw_dsi_reg.h
diff --git a/drivers/staging/hikey9xx/gpu/kirin_fb.c b/drivers/staging/hikey9xx/gpu/kirin9xx_fb.c
similarity index 100%
rename from drivers/staging/hikey9xx/gpu/kirin_fb.c
rename to drivers/staging/hikey9xx/gpu/kirin9xx_fb.c
diff --git a/drivers/staging/hikey9xx/gpu/kirin_fb_panel.h b/drivers/staging/hikey9xx/gpu/kirin9xx_fb_panel.h
similarity index 100%
rename from drivers/staging/hikey9xx/gpu/kirin_fb_panel.h
rename to drivers/staging/hikey9xx/gpu/kirin9xx_fb_panel.h
diff --git a/drivers/staging/hikey9xx/gpu/kirin_fbdev.c b/drivers/staging/hikey9xx/gpu/kirin9xx_fbdev.c
similarity index 100%
rename from drivers/staging/hikey9xx/gpu/kirin_fbdev.c
rename to drivers/staging/hikey9xx/gpu/kirin9xx_fbdev.c
diff --git a/drivers/staging/hikey9xx/gpu/kirin_pwm.c b/drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
similarity index 100%
rename from drivers/staging/hikey9xx/gpu/kirin_pwm.c
rename to drivers/staging/hikey9xx/gpu/kirin9xx_pwm.c
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
