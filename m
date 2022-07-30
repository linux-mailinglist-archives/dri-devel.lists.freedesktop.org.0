Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4E35857BA
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 03:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED2799045;
	Sat, 30 Jul 2022 01:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3283A991B8;
 Sat, 30 Jul 2022 01:10:48 +0000 (UTC)
Received: by mail-vk1-xa2f.google.com with SMTP id e3so975447vkg.4;
 Fri, 29 Jul 2022 18:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=EXcx83ZCGKGC5SWB/05DKVL5trtEdgyIefeqFTLbxmU=;
 b=nqH35WOEqeaaV3rWES5oh+tbu7iyeSzn+7k3m/1+JY0iGtZefI8/K9Peak3GWeNiZM
 AeObWBj4g8Ms5Cz71F80tn5h2CVFAqakCW/V2H6XfWbo9x+qnMz9k3BvFu8rUgO4azuL
 oLYha79NrEwGXTARdVmxjSCv8WXOMDczq9tNdL4gL8sZYOcqP/qcvtPtafK+kQY4cZ0H
 ivqAxBY3hv+d/OWQ/ZhsvGqwhCvMbMhjkkX3H+Bsd52rj+mLdLGiHlR/iyzcGQrT6V7X
 Z5++dMtt6pdDKSB1Sl+TdgiT2EOcOak50jjtyvDHgtb6cey4BDIH4KpOu3qb/S7xo6tV
 ASuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=EXcx83ZCGKGC5SWB/05DKVL5trtEdgyIefeqFTLbxmU=;
 b=yX6F5q5h2ptmrWPCwW8P96kmohf45mYEzPzhS9/ETa9HxGRHmN5Njzo3FONlmvORTp
 GT3hqdlzRdv8PPhj7uilfRpLyyMxDat454kaQk+EtHm45ywJDnaL6t6gujBt6Aow8Jkz
 wJIDAAaXslpg3XM7a8YaCso2IGMv89GWlyKUhzVWIGsmhc0wg5wq6WJsaT+nNm3c8cif
 WjepMFTRjDCtFhhFq4l2b+xlARVRNqZu5J7GsbiXo0wkgoGIFKB23Cr7QF3OAlFDKArX
 JTJseGbTA+g6n/lL05My2YgwpKTnP+XUmqPMySoMjlYt1MLrV/zsMUwUSXZHrdO03vLp
 +W8Q==
X-Gm-Message-State: AJIora9BkGhgfixrBJEMsKLS6vdHafsv8nMwRcNZGsBQzhwSA5FUMO9p
 AxL2N75iv/QqcdiPQY0I+10=
X-Google-Smtp-Source: AGRyM1uJ1ktVWvmgN8VnXITJwjJwAVAlzQaQIMt2sto+TIUlZd7N/VUYhdchN0Cp4mnwauIz2Rqwjg==
X-Received: by 2002:a1f:df41:0:b0:376:ecd7:4930 with SMTP id
 w62-20020a1fdf41000000b00376ecd74930mr2615048vkg.11.1659143447011; 
 Fri, 29 Jul 2022 18:10:47 -0700 (PDT)
Received: from fedora.. ([2804:14c:bbe3:4370:95da:f07f:e927:6958])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a67b30b000000b0035860d6caf8sm1708047vsm.2.2022.07.29.18.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 18:10:46 -0700 (PDT)
From: Magali Lemes <magalilemes00@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, mwen@igalia.com, mairacanal@riseup.net,
 alex.hung@amd.com
Subject: [PATCH v2 3/3] drm/amd/display: include missing headers
Date: Fri, 29 Jul 2022 22:07:02 -0300
Message-Id: <20220730010700.1824647-3-magalilemes00@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220730010700.1824647-1-magalilemes00@gmail.com>
References: <20220730010700.1824647-1-magalilemes00@gmail.com>
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
Cc: siqueirajordao@riseup.net, Magali Lemes <magalilemes00@gmail.com>,
 tales.aparecida@gmail.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 isabbasso@riseup.net, andrealmeid@riseup.net
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
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.c:197:30: warning: symbol 'dcn3_15_ip' was not declared. Should it be static?
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/dcn31_fpu.c:293:30: warning: symbol 'dcn3_16_ip' was not declared. Should it be static?

Fixes: 490d2bc889f1 ("drm/amd/display: move FPU code on dcn21 clk_mgr")
Fixes: 83916f9a32a4 ("drm/amd/display: move FPU code from dcn301 clk mgr to DML folder")
Fixes: 26f4712aedbd ("drm/amd/display: move FPU related code from dcn31 to dml/dcn31 folder")
Fixes: fa896297b31b ("drm/amd/display: move FPU related code from dcn315 to dml/dcn31 folder")
Fixes: 3f8951cc123f ("drm/amd/display: move FPU related code from dcn316 to dml/dcn31 folder")
Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
Reviewed-by: Maíra Canal <mairacanal@riseup.net>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
Changes in v2:
  - split commit (Melissa)
  - update the commit message accordingly
  - add Fixes and Reviewed-by tags.

 drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   | 1 +
 drivers/gpu/drm/amd/display/dc/dml/dcn301/dcn301_fpu.c | 1 +
 drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c   | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index ca44df4fca74..d34e0f1314d9 100644
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
index 5664653ba5ac..149a1b17cdf3 100644
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

