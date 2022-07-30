Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDB35857B8
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 03:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CB699951;
	Sat, 30 Jul 2022 01:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44743991EB;
 Sat, 30 Jul 2022 01:10:21 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id t28so6163408vsr.11;
 Fri, 29 Jul 2022 18:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3Sz2rolMVv0cdP4ostXteQeLyc14aNYq/ZCxOFD4XiM=;
 b=VP+ID6vLjTJHOLcQEZvpz/7ErDjng1bhyuCfCC5R1jQVkEijl2P7TAClNxXRskI5ls
 8a5wzfhLwgQxHN41hTDnkGx7VtosqGN0XsCJ9Exb1Lz+ERfnTgl/RxcN4q0PWxWAmlxi
 qHjTkg8H8+6TQGmTz/XK1MiFjKwPzeMej2k9RgA4T3a4K8gXBNIHx4WD5lGVPESTt0L+
 v8g+wuvy2byGJCHPsmLanQEMWoRqXTqZU70NoJpOfDnK7XFIg6jHDgF4dnzXRcyQqJPX
 FRUliBWODW9pn9oLV3dsGzZfK4LSzXvux+25UoA6UriMcSqLgyj4UzAfKWCFXoGyo2NS
 0x9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3Sz2rolMVv0cdP4ostXteQeLyc14aNYq/ZCxOFD4XiM=;
 b=cs13jjz/2bJ0VfJqptm9VcmKooG3AMy9XciIXVOlN1uMLe0D5Dkkzs9KpMDSm+99MY
 vaEUPAaUjL9tOU2NwlL61ZFX2perGpvN7al2YpERSn3s3+gdMwnr5y6txN2Ph+g2rPBW
 dD6MUlUOzmyRM4seE/G2hlfcDy330C4VUYWnbJByqNldIX/xLDQcTkZDqHXkOvPs20Ip
 aLm6tbBinKZrTC04w6IeYyErLZe/sfrwTL8iArQo/kDR2VJhCeQ0waEWm73ofSTE+SG7
 6kfWN7t5+UZSzTs9xoRR3h/lf0hsQfyw656nAwavPtft8FXaI3f5ZQf8ifjv0zItwtK3
 9Asg==
X-Gm-Message-State: AJIora8+ihvHVfLY+VzQl9SqbRqfqO2TmGi7D1F/gotj/yJoKlenbW1v
 3iU21ZXTmo7n4/abwL2OzDQ=
X-Google-Smtp-Source: AGRyM1uewnPKiyg7SneKT+OvpGqlbZdRlix+UMbcuDNXx3y0wOk1FNpXVlBV+1imyExWtxmwu0wjPA==
X-Received: by 2002:a67:c902:0:b0:358:743b:d0e3 with SMTP id
 w2-20020a67c902000000b00358743bd0e3mr2602562vsk.68.1659143420270; 
 Fri, 29 Jul 2022 18:10:20 -0700 (PDT)
Received: from fedora.. ([2804:14c:bbe3:4370:95da:f07f:e927:6958])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a67b30b000000b0035860d6caf8sm1708047vsm.2.2022.07.29.18.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 18:10:19 -0700 (PDT)
From: Magali Lemes <magalilemes00@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 2/3] drm/amd/display: remove header from source file
Date: Fri, 29 Jul 2022 22:07:00 -0300
Message-Id: <20220730010700.1824647-2-magalilemes00@gmail.com>
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
 amd-gfx@lists.freedesktop.org, mwen@igalia.com, mairacanal@riseup.net,
 dri-devel@lists.freedesktop.org, isabbasso@riseup.net, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since "rn_clk_mgr.h" needs ‘struct clk_mgr_internal’ which is declared
in "clk_mgr_internal.h", include "clk_mgr_internal.h" in "rn_clk_mgr.h"
instead of in its source file.
Because of the change above, change the order of '#include
"rn_clk_mgr.h"', so that the necessary structs are visible to
dcn20_clk_mgr.h.

Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
Reviewed-by: Maíra Canal <mairacanal@riseup.net>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
Changes in v2:
  - split commit (Melissa).

 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c | 3 +--
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.h | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
index 0202dc682682..ca6dfd2d7561 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
@@ -24,10 +24,9 @@
  */
 
 #include "dccg.h"
-#include "clk_mgr_internal.h"
+#include "rn_clk_mgr.h"
 
 #include "dcn20/dcn20_clk_mgr.h"
-#include "rn_clk_mgr.h"
 #include "dml/dcn20/dcn20_fpu.h"
 
 #include "dce100/dce_clk_mgr.h"
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
-- 
2.37.1

