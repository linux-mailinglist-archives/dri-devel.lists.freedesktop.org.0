Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A86CC043D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 00:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E2910E198;
	Mon, 15 Dec 2025 23:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RZYdSMIZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com
 [74.125.224.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0058310E04E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 23:54:41 +0000 (UTC)
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-640d4f2f13dso4376638d50.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 15:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765842881; x=1766447681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qi1iA3gThMzNW0vwvQOq+i42JuDGcJBaX7DYkycH1V4=;
 b=RZYdSMIZ6+7e1g57wd9PorWB+4X/Q7vWwbKBAkc1NW8JghjrBGDdqUmrCMAAcOIMHe
 gEAPUCa1c+XYwpEPy0OK9JbZsWtZZ8cv7uLF3TDnZpPGZlqKfWfCD/x+a7d6/HYTUXGj
 Wxkf0VCozEXU9oajQDLxBleweZYOE20pFwZ/og+eGT7wK4nge6VsHIjhA1eWA5FI9c0b
 5lZYCSpYbwhQxf5gF5JRXCYtdGKOWfuLJzaeUCtp4r7w7khB15TZ55i5e6SMzLUY0hlr
 JpVte0AY1MJm0a9PxuxeqHB82kg+BqzxZ5w6xhO6mpyBOLOUNjYdKP8IwSsHLWDagaJG
 BpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765842881; x=1766447681;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qi1iA3gThMzNW0vwvQOq+i42JuDGcJBaX7DYkycH1V4=;
 b=PkoP9BGYAAKmD5mF+DV/IqbnhppEr6GeKPmTTrkDZ3CB10mYTJdgPgzY2ONA9bXuDG
 fPhl/cLujsdv0YHyRfjFyOtTid0yUnu87/t8079fB+bBKynRubDOCZTBgR725SvSadVw
 uggb9rn8IBmepHQNrqcgp0XBuNugcSAnZ9KywVV4K2XRZcqc4b9w7xVlS/WZwInB6Fo3
 jRLUyajZcn702FK7qT9OMzYgoRi1CAaxVyYdTmxVDumxzNnkXj9bMx4pKBVcmtFr3MVg
 ymVJu9msUdEc51bdlrhq/U8D97PtcnBDCxWNWDBRlTvgqUvgIlAxGcUQMBYA0N13h1os
 Zn/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuGN3o2nB1Y+q6oqWk1/aBnn8priZRlxllRMGbk4i9sHWfZ1XLuCMILY2GbP7eueJHpzxvtl0EGoo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0l6X7MBDJHqEqF+kFdUXg1FDMlkl0G5CfIscxsmDZaz0fIdCj
 t/DcTZob0HEPrO4uNWl3AiVXIEKziL2I7+D0Mkl3NrZoKYD14PB5bilj
X-Gm-Gg: AY/fxX4DI8lfJjRW2WRon0yJvjB5aRVtCLBz8lhkCI2RZPfFMgdgZ47wpCHiTHnehfO
 UunFxjKIEKsRMaXI0+wvGKVNHmhB163icsYMzfVkl5+I1BLxk5Fw3hjvscLU3TGDSuaj1mCs2Go
 oKWnSr2bQb1PBAHSdl+jymGcUUNP8qTTpmRzWyfcyUo9Ex/F2uVaJ1aMI3zlw91fWGkOecqVMWF
 0corU6SaMTGwnvNIGI7BCGWtL2+Osr8eQbO8G2025tialScNahESiax5dWJUN7Z6k1Tq1H7Wf9P
 xPGhAWLgdiQ6IfdiSx7qMcVIe9xr/L06HVfeJqRI0oyopoEIR5Xm2VONgx0J0s2sP/fiqyv8u18
 cleE1XV0qKdHN+AlTS2Qg1RgmPrZYHd3YCyG2d+D5akESFH2eGj+niZMI6ecfTaYNkV4ZpIGU42
 l6Kc2lEDIm0xfsCkK2
X-Google-Smtp-Source: AGHT+IGRC8RK5GGvwd89lteOSW/cKBszESs470jpMcci5izqE12F53ZF9gQk4OUHdFNNGNhLh3aShg==
X-Received: by 2002:a05:690e:4093:b0:644:28bb:fb53 with SMTP id
 956f58d0204a3-64555664cb0mr9353405d50.66.1765842880827; 
 Mon, 15 Dec 2025 15:54:40 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:6b0:1f10:bc87:9bd7])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-64477dc673asm6997136d50.25.2025.12.15.15.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 15:54:40 -0800 (PST)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Harish Chegondi <harish.chegondi@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH] drm/xe/eustall: use bitmap_empty() in
 xe_eu_stall_stream_read_locked()
Date: Mon, 15 Dec 2025 18:54:38 -0500
Message-ID: <20251215235439.330124-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bitmap_empty() is more verbose and efficient, as it stops traversing
data_drop mask as soon as the 1st set bit found.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/gpu/drm/xe/xe_eu_stall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
index 97dfb7945b7a..b896b7ff5900 100644
--- a/drivers/gpu/drm/xe/xe_eu_stall.c
+++ b/drivers/gpu/drm/xe/xe_eu_stall.c
@@ -544,7 +544,7 @@ static ssize_t xe_eu_stall_stream_read_locked(struct xe_eu_stall_data_stream *st
 	int ret = 0;
 
 	mutex_lock(&stream->xecore_buf_lock);
-	if (bitmap_weight(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
+	if (!bitmap_empty(stream->data_drop.mask, XE_MAX_DSS_FUSE_BITS)) {
 		if (!stream->data_drop.reported_to_user) {
 			stream->data_drop.reported_to_user = true;
 			xe_gt_dbg(gt, "EU stall data dropped in XeCores: %*pb\n",
-- 
2.43.0

