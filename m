Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HAbKN+8omkS5QQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 11:01:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2E61C1DB8
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 11:01:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9D710E002;
	Sat, 28 Feb 2026 10:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZnD7AHqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE6610E002
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 10:00:58 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-439aa2f8ebaso100765f8f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 02:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772272857; x=1772877657; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pi+GFLSwi3pjYjAmI89JNYKtrRFb4ualdoW7/2mbzi4=;
 b=ZnD7AHqNc7cbg+Z+YVkEYv47gUQ37WjMXDBsgXk3waZ2tcWI4J0RBoh1AiZAn/pkBD
 GS7U/dxexhDfW2+EhBLyMq5e1z/kjcKXlqUrSlIJBcbyEuMT/Mg9Piy0k8G74nWD2CJa
 FV4wi9WhnQdhnB9GOgi9whdA2QFwnpkIyh+8NhzC6fEyHJI9UGRCFAN2R9Zk56lvvhpx
 tUjRxSu49NzNtU2a32QIkJtZaxaQhAoJfqY4yUhPmRFe3lt57m9IwivM37I4uI9lSLjr
 zKEgS5yzBhRurVrd/I5pf7bJnL5j4/kwXDixWmwQrkgBnpyUzKPeLmN6SavbNhA1z7aW
 fMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772272857; x=1772877657;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pi+GFLSwi3pjYjAmI89JNYKtrRFb4ualdoW7/2mbzi4=;
 b=nUPiJiqVbg41sykl+ulXncotTu3YRCZh0/2h/oLzaZDacsBbAIRbKOb94I3zOiU1ul
 /2dzhd21i2uPKPqX/uJ/4PVerRqZvN4NGyuDC8lX3VvHQKWhcFMKIVUivK9/JdIWo/Oo
 aY45joC5zdoxzass0Je1kaT2sLS/MrXHLm6D5bAG+awchyiD+WTo3czG88r7+8Hl14AJ
 TrJe8RCOJKZgi8Bv8kTp5/4NBDkA+VEiWW0SNfCeiYhN11Gkiz6ayFHoRr8+fdEjGafF
 nwOY+G+yudWaYEL+U/f+D/b6Vibudi30swVMOPQACOnZD8GqvYSXWgH3zqzBJTSNTtJp
 pPRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOwJkVqoyyuwJE6HEt7LuJS15nzJM3DbB6lqQNXe70OX11Biy9HjuAvq9QCkRwq2TuvkHtiQSD4bI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeDihDthXt6StidIMxTlWIEuqr6g7rCCOzu7rkZXDK9FtGS5Ok
 dWlbciIMuHJ7OvcwLFHkHvIf0VMoh/cQoPc7f7j1iHUSgPNc3RqIWkRk
X-Gm-Gg: ATEYQzyzjb584hhB7qG9M6ADt2yeGTeYTOqS00ZJcaqROVuuLCoZaO9hdsJTQdjoawN
 X6Vgtp4IB5oNdZMXQ6BUcZVjZoDiq3j40wUwOt+q1NnG7EJo7Tp8EWvegbgGiv3GF0aujBKjzXX
 2dzrFIZ2GeisVSDgGA9Ik8jP9j4dPh99K7rgoCk4dsXF3lfgDF0/rLMnh/kRmsJQa7ly6YaYcab
 hWVhRNtA9CHo43qMA9sVDDu7YyJE7GIZDsqm/byVf4UBNldqoGaFSHstUac1tCzK21YvTZ9oavp
 07yhuaeB4dGsm9A86Vot5jvjmNdB+8D8iQQfWtanzyF0FiISWNvpbMwGd6UuvU5crSQGbYkf1SZ
 8IDCB9feFri0ESCVIkePAkfX4GwGCafYNyB15gaMGgyEHoeOCU8nX4b/DyJjS/MwAbIzihHTC2l
 59irwd6FM1jNL4prEPOTd89g==
X-Received: by 2002:a05:6000:288c:b0:435:b7ca:7521 with SMTP id
 ffacd0b85a97d-4399ddf211fmr10631779f8f.15.1772272856846; 
 Sat, 28 Feb 2026 02:00:56 -0800 (PST)
Received: from localhost ([87.254.0.129]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c75a523sm12770570f8f.19.2026.02.28.02.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 02:00:56 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: remove extra ;
 from statement, remove extra tabs
Date: Sat, 28 Feb 2026 09:59:38 +0000
Message-ID: <20260228095938.548728-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:alex.hung@amd.com,m:amd-gfx@lists.freedesktop.org,m:kernel-janitors@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[coliniking@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coliniking@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CD2E61C1DB8
X-Rspamd-Action: no action

There is a statement that has a ;; at the end, remove the extraneous ;
and remove extra tabs in the code block.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 71cfc623bc2d..f3fa8eb4bcce 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -1165,9 +1165,9 @@ void dm_helpers_override_panel_settings(
 		link->panel_config.dsc.disable_dsc_edp = true;
 
 	if (dc_get_edp_link_panel_inst(ctx->dc, link, &panel_inst) && panel_inst == 1) {
-			link->panel_config.psr.disable_psr = true;
-			link->panel_config.psr.disallow_psrsu = true;;
-			link->panel_config.psr.disallow_replay = true;
+		link->panel_config.psr.disable_psr = true;
+		link->panel_config.psr.disallow_psrsu = true;
+		link->panel_config.psr.disallow_replay = true;
 	}
 }
 
-- 
2.51.0

