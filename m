Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5CE4C3598
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E016110E8C0;
	Thu, 24 Feb 2022 19:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9096210E8B0;
 Thu, 24 Feb 2022 19:16:49 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id j24so4317851oii.11;
 Thu, 24 Feb 2022 11:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7IUvVKF5Pch8a16lx0MT86rwIlpqNss44lNM/kW3WVs=;
 b=ne21DyBH+0ZWEGvMo7Kz56PYmwP1GgCVw3i0R6NVkPQJMYyrc8sPuQItlSuHxv9VRc
 TXB7pCjba4j8XT/WvxjkN5JbZ1sdP2juBJu7YA/ESnLTa6kEBA+4SmpalQ92HXMMye1F
 4MGZrYTIq1WdT977vBFe17BmposVWu8IjvsLstrHzkC6RtNDiizXLvU2JJmv/a2ZOnSv
 6E4A/Z5M/vw965DFZA5o7kFCzhF56hgh4aeI2bscy2u0xjPAuhU7qy2gCRwDTZKwYDkC
 kr92WaJmPK7uTAOkB7Qdp3Cb739BrYnK8/uIhE9jrM30wlrmccSBM61ZnYAtOUSDvnWG
 wyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7IUvVKF5Pch8a16lx0MT86rwIlpqNss44lNM/kW3WVs=;
 b=OytLfId7ySkp3ITgMyYlAaAldtwO4AmbP/E7UoUR36azkDN7X3eoxhWU0ZkfzL7Rza
 QnoGpSPwNzqrAVs28GgXEpLs4kk2TzJ2r/SpcHYb6Lru2a5/x/uJMGlUjHygrZxX1dWQ
 lksKQ8FUAkcWBKQrCibpncatlJgYtFJW0O/BAYk0FB2XniswqnjSB1qKe9cI/c/4/dl6
 MBrWtlbF1Z4ZpXaz1hUPRNvfqDB7/SogwMC4mw+RKyILEMvAL7UDti6lJUrFFcrb8W9D
 SNHIFT59UyVbN5hPm7wGBi6o0uQssKYSOgX6qw9QYYykZVAAaYa358lMLVRvLgC76s5Q
 cPGg==
X-Gm-Message-State: AOAM530UQZ315fMZkg+W9jE2ekB9cSlHutVRKwtfY6YUv3tir/Cd+BMW
 cPN/N3HU4vCYqO6fcDuWXBg=
X-Google-Smtp-Source: ABdhPJxoXP+tSpCWcygc2lcQGw4uSvebv9aB+dvrgCiioebX38US3T6IU0aiiIwLKSTXbzn8q6EPgw==
X-Received: by 2002:a05:6870:d1ca:b0:d6:87d5:4ab7 with SMTP id
 b10-20020a056870d1ca00b000d687d54ab7mr5944097oac.331.1645730208809; 
 Thu, 24 Feb 2022 11:16:48 -0800 (PST)
Received: from localhost.localdomain (189-47-54-110.dsl.telesp.net.br.
 [189.47.54.110]) by smtp.gmail.com with ESMTPSA id
 w3-20020a056830110300b005af14392276sm79509otq.62.2022.02.24.11.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 11:16:48 -0800 (PST)
From: Magali Lemes <magalilemes00@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 4/4] drm/amd/display: Turn functions into static
Date: Thu, 24 Feb 2022 16:15:51 -0300
Message-Id: <20220224191551.69103-5-magalilemes00@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224191551.69103-1-magalilemes00@gmail.com>
References: <20220224191551.69103-1-magalilemes00@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: kernel test robot <lkp@intel.com>, siqueirajordao@riseup.net,
 Magali Lemes <magalilemes00@gmail.com>, maira.canal@usp.br,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, isabbasso@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Silence [-Wmissing-prototypes] sparse warnings from the display folder
such as:

../drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn315/dcn315_smu.c:126:5: warning: no previous prototype for ‘dcn315_smu_send_msg_with_param’ [-Wmissing-prototypes]
  126 | int dcn315_smu_send_msg_with_param(
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Cc: Qingqing Zhuo (Lillian) <qingqing.zhuo@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
---
 .../gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c    | 2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c    | 4 ++--
 .../gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
index d66633bef2b3..357f89b4a8e0 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
@@ -430,7 +430,7 @@ static unsigned int find_clk_for_voltage(
 	return 0;
 }
 
-void dcn315_clk_mgr_helper_populate_bw_params(
+static void dcn315_clk_mgr_helper_populate_bw_params(
 		struct clk_mgr_internal *clk_mgr,
 		struct integrated_info *bios_info,
 		const DpmClocks_315_t *clock_table)
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c
index a60543258a5b..831fd1494d60 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c
@@ -123,7 +123,7 @@ static uint32_t dcn315_smu_wait_for_response(struct clk_mgr_internal *clk_mgr, u
 	return res_val;
 }
 
-int dcn315_smu_send_msg_with_param(
+static int dcn315_smu_send_msg_with_param(
 		struct clk_mgr_internal *clk_mgr,
 		unsigned int msg_id, unsigned int param)
 {
@@ -181,7 +181,7 @@ int dcn315_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispc
 
 	return actual_dispclk_set_mhz * 1000;
 }
-int dcn315_smu_set_voltage_via_phyclk(struct clk_mgr_internal *clk_mgr, int requested_phyclk_khz)
+static int dcn315_smu_set_voltage_via_phyclk(struct clk_mgr_internal *clk_mgr, int requested_phyclk_khz)
 {
 	int actual_phypclk_set_mhz = -1;
 
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c b/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
index 33367773699b..e722171f0d2d 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
@@ -42,7 +42,7 @@
 #define DCN_BASE__INST0_SEG4                       0x02403C00
 #define DCN_BASE__INST0_SEG5                       0
 
-enum dc_irq_source to_dal_irq_source_dcn315(
+static enum dc_irq_source to_dal_irq_source_dcn315(
 		struct irq_service *irq_service,
 		uint32_t src_id,
 		uint32_t ext_id)
-- 
2.25.1

