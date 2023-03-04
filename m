Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237636AAAB0
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 16:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268F910E182;
	Sat,  4 Mar 2023 15:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E3210E180
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Mar 2023 15:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677943615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/UDCKfL+7KAewaP80OA62WS4MzOdBiesWSnnrtlTFvY=;
 b=I4K+zIbmVy4AacmP7a8EtHGgxnZkyfbqMQNUHoaS45mv6Nn/wQhZ4lLLaIUJ1BA1lMLtaK
 VX5ouck2lthn4ufNl5q+XG8WRbJ21zktT0Ny7ttyDK6oJdTYgVa2ZjCVbQmMlDdduuyNZZ
 RLw0M8XR3+MQkHvNfwF2q9d2ALV8kf4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-eKlGys4kMIymiLQv4f50Wg-1; Sat, 04 Mar 2023 10:26:50 -0500
X-MC-Unique: eKlGys4kMIymiLQv4f50Wg-1
Received: by mail-qt1-f199.google.com with SMTP id
 t22-20020ac86a16000000b003bd1c0f74cfso3015149qtr.20
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Mar 2023 07:26:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677943609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/UDCKfL+7KAewaP80OA62WS4MzOdBiesWSnnrtlTFvY=;
 b=v92wsKkb3ejPg4UxzfWQDlACN0VBjGLUwauz6/kvRUMrHlk9Wmh/avQq+hbZ4Uxn+c
 rrxfHOCVjCyTePPfvNgGOF6onQ38pW2Y6ns9NU9ZlO6XBNq7CmTOYrhWM6M2u8Clq8Sd
 DUb+4B7kDM6OBKQPqWc63v7Zyh/AWCAlv/qjQZbWmmJcUxyDAbD5B9EOvYwmAJ9/MnFv
 2De8ARmjixHwFGlVR0ewSMwOWXGFCsGYy8WPRCQa5nVgIYzBlRb0AFS/6eolLG9vJsbz
 XpZbs7qdzz8pG2fIe23mZCEVNCADErfiCLhq8ILmJZFQ7WICI4uSP0hnG3SadKMQIQPk
 Zhcw==
X-Gm-Message-State: AO0yUKU7PVFB0mbjxrl/bp1amhq/GQdRoM2KQ05Xc0MUM6V3zt3rVYJi
 uUExHWyAXDpyXhIx81l5y1odxi3FodXtEPU/fLFGM6G124OGx70NxXgolc7iTcCzLGDJAjlKGQi
 ZkVaUGGbmYh9ZBdUQ5Lg3dteHIuT1
X-Received: by 2002:a05:622a:91:b0:3bf:e320:ba5d with SMTP id
 o17-20020a05622a009100b003bfe320ba5dmr9306181qtw.17.1677943609600; 
 Sat, 04 Mar 2023 07:26:49 -0800 (PST)
X-Google-Smtp-Source: AK7set/MOHotq65z85YoYXsl+9GxKlOMDwDiVF39R9D7RfzOLxzdvuuX5Qo/4zrs6kDMXmPcM2L2fg==
X-Received: by 2002:a05:622a:91:b0:3bf:e320:ba5d with SMTP id
 o17-20020a05622a009100b003bfe320ba5dmr9306142qtw.17.1677943609343; 
 Sat, 04 Mar 2023 07:26:49 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 j26-20020ac874da000000b003b82489d8acsm3884477qtr.21.2023.03.04.07.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 07:26:48 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, jiapeng.chong@linux.alibaba.com,
 Pavle.Kotarac@amd.com, oliver.logush@amd.com, alex.hung@amd.com,
 aurabindo.pillai@amd.com, HaoPing.Liu@amd.com
Subject: [PATCH] drm/amd/display: change several dcn201 variables
 storage-class-specifier to static
Date: Sat,  4 Mar 2023 10:26:40 -0500
Message-Id: <20230304152640.1938302-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch reports these similar problems in dcn201
drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c:165:22:
  warning: symbol 'dcn201_funcs' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_resource.c:77:30:
  warning: symbol 'dcn201_ip' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_resource.c:139:37:
  warning: symbol 'dcn201_soc' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_mpc.c:79:24:
  warning: symbol 'dcn201_mpc_funcs' was not declared. Should it be static?

All of these are only used in their definition file, so they should be static

Signed-off-by: Tom Rix <trix@redhat.com>
---
 .../gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c    | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_mpc.c            | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c       | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c
index f0577dcd1af6..811720749faf 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c
@@ -162,7 +162,7 @@ static void dcn201_update_clocks(struct clk_mgr *clk_mgr_base,
 	}
 }
 
-struct clk_mgr_funcs dcn201_funcs = {
+static struct clk_mgr_funcs dcn201_funcs = {
 	.get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
 	.update_clocks = dcn201_update_clocks,
 	.init_clocks = dcn201_init_clocks,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_mpc.c
index 95c4c55f067c..1af03a86ec9b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_mpc.c
@@ -76,7 +76,7 @@ static void mpc201_init_mpcc(struct mpcc *mpcc, int mpcc_inst)
 	mpcc->shared_bottom = false;
 }
 
-const struct mpc_funcs dcn201_mpc_funcs = {
+static const struct mpc_funcs dcn201_mpc_funcs = {
 	.read_mpcc_state = mpc1_read_mpcc_state,
 	.insert_plane = mpc1_insert_plane,
 	.remove_mpcc = mpc1_remove_mpcc,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
index 407d995bfa99..cd46701398d9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_resource.c
@@ -74,7 +74,7 @@
 #define MIN_DISP_CLK_KHZ 100000
 #define MIN_DPP_CLK_KHZ 100000
 
-struct _vcs_dpi_ip_params_st dcn201_ip = {
+static struct _vcs_dpi_ip_params_st dcn201_ip = {
 	.gpuvm_enable = 0,
 	.hostvm_enable = 0,
 	.gpuvm_max_page_table_levels = 4,
@@ -136,7 +136,7 @@ struct _vcs_dpi_ip_params_st dcn201_ip = {
 	.number_of_cursors = 1,
 };
 
-struct _vcs_dpi_soc_bounding_box_st dcn201_soc = {
+static struct _vcs_dpi_soc_bounding_box_st dcn201_soc = {
 	.clock_limits = {
 			{
 				.state = 0,
-- 
2.27.0

