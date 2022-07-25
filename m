Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FCF5803E9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 20:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91426C15EE;
	Mon, 25 Jul 2022 18:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E3FC15F3;
 Mon, 25 Jul 2022 18:19:02 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id j70so14481588oih.10;
 Mon, 25 Jul 2022 11:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eTeP+TldfgkfAXSzy1V8ncfEUb4W/6ytY8GzN1ilhyI=;
 b=cFq5dak1CUNX5t6urCDWxM7ZYCWavLOdxJeq/nwiGtJlBWECHijpixPUXS9ponYGfv
 nQc4cR+dW7CSGXGzFUTykxBexz5pc71MGThj6SrtttalFwxIYw1gb07pQKiG/0xK99Rr
 UlIP9vpl7WN5po+O/Ff0fHeNoX1OY3heU8/LXKqNIz5IcgREE+zHMpt5qQfEDV0WrVQa
 cLY7Gm3WxfCW2EvZVckkeXwZtmaFpk6Ks2yGNLelBEXeYXHfQDRvUlIOj1+c5vC8vJOL
 Jl/zjSKp8hNB3Xat4dFSdGl+0pzkDq5CvNDqrOXgXut2vaSF86FTpvbNspETgaovvb/I
 3iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eTeP+TldfgkfAXSzy1V8ncfEUb4W/6ytY8GzN1ilhyI=;
 b=yO18vc2Hi4x6/J220cf0i24JwIkHwRthS2hpCUH8xl6zlyr7bB33ybb858hZrjPuh0
 dZeZucEC20MkfSAGKbMVrqYD0hhrHph5PBcQkzm+plN3t7+dyMSfxCYyLNqTsMd7YtpV
 ZoC81p2YFGBkuifjq6zMzxhHy85BF/k2m7Qk+pk4se5l/WSELBaAghgxGMepU+EtKme3
 Rig9mXmiIZlvEWKktMhZCT+0j942aB1jhbeKZXNsA3lhm8WELfUvlBQSxxygSKDa6yb9
 RMPhDxhYwjgt86A6Pxw7iQxgsQiwWkdq1IMgaOz/DHIfpP7/0M8qzKyEpMNtFwWGmyyF
 9OiQ==
X-Gm-Message-State: AJIora9F81M2TbONYNp7IX11WuKYlgmw0b3Dd3UjfQPEd2P/TMs2B3jm
 TtmKrxTcUpcxDXtaK5LMCrc=
X-Google-Smtp-Source: AGRyM1t/R0EJYk9zFPCsOAS7hFXsgzPJVaM9IdvIdDgvmoW/OXd6orEkxB+GNirUuPEQJSTVYncXqA==
X-Received: by 2002:a05:6808:120a:b0:333:54f1:351 with SMTP id
 a10-20020a056808120a00b0033354f10351mr6192878oil.70.1658773142222; 
 Mon, 25 Jul 2022 11:19:02 -0700 (PDT)
Received: from fedora.. ([2804:14c:bbe3:4370:95da:f07f:e927:6958])
 by smtp.gmail.com with ESMTPSA id
 m42-20020a056870562a00b0010db1a8d931sm5358484oao.28.2022.07.25.11.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 11:19:01 -0700 (PDT)
From: Magali Lemes <magalilemes00@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 2/2] drm/amd/display: include missing headers
Date: Mon, 25 Jul 2022 15:15:59 -0300
Message-Id: <20220725181559.250030-2-magalilemes00@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220725181559.250030-1-magalilemes00@gmail.com>
References: <20220725181559.250030-1-magalilemes00@gmail.com>
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
Cc: siqueirajordao@riseup.net, Magali Lemes <magalilemes00@gmail.com>,
 tales.aparecida@gmail.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com, mairacanal@riseup.net,
 dri-devel@lists.freedesktop.org, isabbasso@riseup.net, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing headers to solve the following warnings from sparse:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.c:656:17: warning: symbol 'ddr4_wm_table_gs' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.c:693:17: warning: symbol 'lpddr4_wm_table_gs' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.c:730:17: warning: symbol 'lpddr4_wm_table_with_disabled_ppt' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.c:767:17: warning: symbol 'ddr4_wm_table_rn' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.c:804:17: warning: symbol 'ddr4_1R_wm_table_rn' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/dcn20_fpu.c:841:17: warning: symbol 'lpddr4_wm_table_rn' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn301/dcn301_fpu.c:217:17: warning: symbol 'ddr4_wm_table' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn301/dcn301_fpu.c:254:17: warning: symbol 'lpddr5_wm_table' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.c:53:30: warning: symbol 'dcn3_1_ip' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.c:117:37: warning: symbol 'dcn3_1_soc' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.c:197:30: warning: symbol 'dcn3_15_ip' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.c:262:37: warning: symbol 'dcn3_15_soc' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.c:293:30: warning: symbol 'dcn3_16_ip' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.c:358:37: warning: symbol 'dcn3_16_soc' was not declared. Should it be static?

Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h | 1 +
 drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c      | 1 +
 drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c    | 1 +
 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c      | 3 +++
 4 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h
index 2e088c5171b2..f1319957e400 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h
@@ -28,6 +28,7 @@
 
 #include "clk_mgr.h"
 #include "dm_pp_smu.h"
+#include "clk_mgr_internal.h"
 
 extern struct wm_table ddr4_wm_table_gs;
 extern struct wm_table lpddr4_wm_table_gs;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index eeeae52fe6fc..45e9f4663abe 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -30,6 +30,7 @@
 #include "dchubbub.h"
 #include "dcn20/dcn20_resource.h"
 #include "dcn21/dcn21_resource.h"
+#include "clk_mgr/dcn21/rn_clk_mgr.h"
 
 #include "dcn20_fpu.h"
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
index 7ef66e511ec8..d211cf6d234c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c
@@ -26,6 +26,7 @@
 #include "clk_mgr.h"
 #include "dcn20/dcn20_resource.h"
 #include "dcn301/dcn301_resource.h"
+#include "clk_mgr/dcn301/vg_clk_mgr.h"
 
 #include "dml/dcn20/dcn20_fpu.h"
 #include "dcn301_fpu.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
index e36cfa5985ea..2d11a2c13345 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
@@ -25,6 +25,9 @@
 
 #include "resource.h"
 #include "clk_mgr.h"
+#include "dcn31/dcn31_resource.h"
+#include "dcn315/dcn315_resource.h"
+#include "dcn316/dcn316_resource.h"
 
 #include "dml/dcn20/dcn20_fpu.h"
 #include "dcn31_fpu.h"
-- 
2.37.1

