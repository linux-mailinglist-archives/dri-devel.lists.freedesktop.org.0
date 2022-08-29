Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 445B75A4B44
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 14:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC99110F181;
	Mon, 29 Aug 2022 12:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A3210F181;
 Mon, 29 Aug 2022 12:13:28 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id jm11so7755866plb.13;
 Mon, 29 Aug 2022 05:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=JDJaZLLijcqBMwlRc9kgfCyfcSIJN0CihduhDouY51s=;
 b=OKJiyNZjYzCoT7bMy8Fdnn8lp2fbY6FWngivXh3cy7DsGqJ2TU5Yd04nM507M9L7Sa
 JdIlrgCJqpSmw4d7jcvBzU5hVsQoDW6A7PbY+wYuPxkXN5l9Jz4IyQL9sFK9bIpwN3hv
 pFoRhQ59kAqAWKSqXiWd8CJfGqK8iYLt8gTu6dJRQde2CjidsWrG3Nb+VgzZJ+Gt86SH
 SSCKJq51P1bQlkvQfQu58LCW5Cv4QGBK+Yz48EVlmufxpY6XqUnsUTaPoiVnLIP7y9Bs
 TVOPuYwqSMZ7jh72S0yC6F7bn3haIlljJP8Li6loaMalOVqESYT1BXMyljbzEWSDAA8P
 6/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=JDJaZLLijcqBMwlRc9kgfCyfcSIJN0CihduhDouY51s=;
 b=315HTnQ3/DySc0fBxA2AHpKE3i+CK5b9amlTyZZaII043EOcailGzRb9m81u2QBwba
 nSqmqJ0fD0/sEa1l6UV+MlqAziV7aH1QeHhwZIkm/TF/eylmOduCwnCWavm9LsK9smq3
 OGCuSTL8PYFGNfsd9bkvQCAGdU/64LcetcExbz8c4YerFNHjAHlh4XdWYjgRxvN/J75J
 omvPe6WCXXe29KcAV1wAimowt7Yx7R47kzePhhRjEZDCG29CS6gvg89S78qy/99bcocj
 mrVtpLS7/vhhTkJ9x12SSErj4P/2F2JXUCMvFhz0Wl7s4LDtw7UBQRFKInxBwAg7QQXf
 3aLg==
X-Gm-Message-State: ACgBeo1MGRcdlVrjcxykABqfQke9+Qg7ApNVLBDxgAmhxPKLxM0+3LB+
 A1OeFlzKMLj1/04vN5gM378=
X-Google-Smtp-Source: AA6agR6SkSObjijf9vIjaEd3qEzGK9u8YDkKPh5wnfACtNxhBX00XhsdDyJPTQIos9p3nqAyKJH1fQ==
X-Received: by 2002:a17:90b:17ce:b0:1f4:d068:5722 with SMTP id
 me14-20020a17090b17ce00b001f4d0685722mr17863461pjb.28.1661775208159; 
 Mon, 29 Aug 2022 05:13:28 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 nt15-20020a17090b248f00b001fd84a8cfc6sm4504561pjb.39.2022.08.29.05.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 05:13:27 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: cui.jinpeng2@zte.com.cn
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, Anthony.Koo@amd.com, alex.hung@amd.com,
 Roman.Li@amd.com, Yi-Ling.Chen2@amd.com, hanghong.ma@amd.com,
 mwen@igalia.com, dingchen.zhang@amd.com
Subject: [PATCH linux-next] drm/amd/display: remove redundant
 vertical_line_start variable
Date: Mon, 29 Aug 2022 12:13:20 +0000
Message-Id: <20220829121320.267892-1-cui.jinpeng2@zte.com.cn>
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
Cc: dale.zhao@amd.com, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Jerry.Zuo@amd.com,
 dri-devel@lists.freedesktop.org, isabbasso@riseup.net,
 Jinpeng Cui <cui.jinpeng2@zte.com.cn>, agustin.gutierrez@amd.com,
 Sungjoon.Kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jinpeng Cui <cui.jinpeng2@zte.com.cn>

Return value from expression directly instead of
taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index 37246e965457..8f4f1ea447a7 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -3741,7 +3741,6 @@ int dcn10_get_vupdate_offset_from_vsync(struct pipe_ctx *pipe_ctx)
 	int vesa_sync_start;
 	int asic_blank_end;
 	int interlace_factor;
-	int vertical_line_start;
 
 	patched_crtc_timing = *dc_crtc_timing;
 	apply_front_porch_workaround(&patched_crtc_timing);
@@ -3757,10 +3756,8 @@ int dcn10_get_vupdate_offset_from_vsync(struct pipe_ctx *pipe_ctx)
 			patched_crtc_timing.v_border_top)
 			* interlace_factor;
 
-	vertical_line_start = asic_blank_end -
+	return asic_blank_end -
 			pipe_ctx->pipe_dlg_param.vstartup_start + 1;
-
-	return vertical_line_start;
 }
 
 void dcn10_calc_vupdate_position(
-- 
2.25.1

