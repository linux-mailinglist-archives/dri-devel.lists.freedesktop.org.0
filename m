Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E34AACABC
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 18:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DA010E362;
	Tue,  6 May 2025 16:20:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gO3uWIy4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD61610E362
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 16:20:10 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso51710835e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 09:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746548409; x=1747153209; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k3qc17DEFxTpF4iC04L3bgB11KvKUfwQcfBGjcC6vpU=;
 b=gO3uWIy41E7GiyCuTr1CqQbVsQjvrHeLDTuGlHeOWS/XxD9HOu+mlfPRjV+yoNehCo
 MvS2OJSQH8VrCpM+hmoZUtTugrfYl/ljR41XuIpFeqnsV2ek1dilfDpiXGbL4+Wm78xJ
 kdD2/h4BTgThRbPhQj52fYHSwq2rKqBznlvdhrxoAQrSgoSGt0ko5c6ax6hdYyneWaFz
 OalOBjnvlhav0k9IdBmQm9coWwX02dMxBjk5FNCpjE8TkLH9nTJhj7bczvfN1yYUWK81
 FwWJ8KtslzZcXWAMdKleVwG6Tj5YpiL+wpCNq8m0QnXxUvVt9BAfnynpx7TaXCtME0NV
 6Htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746548409; x=1747153209;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k3qc17DEFxTpF4iC04L3bgB11KvKUfwQcfBGjcC6vpU=;
 b=bVZcr9RBO1xEjF2WGzNHY5jWgO29alQ4daBKzEVU/5L0lGzzr3Vv1+Z75JvKa1vdej
 noutV6YoRcszBA0EqrdCLIMg91va+JceGuNf58h0p9DvQVqhgSkljx1WtBLFDmc2vzj2
 X1kxMsJ/uZgNSJRO6I7dbb9gTZwirPh/a9mXcsJHIi+4aE3SpIQywAekmhEwqP4ks7X8
 84dfh7SyX6eS21jPLDspYUUKEAD+m9VcHTj3Ns48H/Bz1qkRupBRXTFylNtouhAHkCZM
 gf3Pmz/4qJxFG/8D34ViD4nw+50ApJD89z1omglSpbOL6L/3W4wTsNASqEa7bdImUO8D
 x2Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUni4G6XZkECHaS/x/u2z6spEGLwtobfBVPqqhhPPJTMWtuy2OYJf21j5aA2Q8dtMPGjIvzXT/rT2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzyi8VxYh5QtwvIqht3MYZayLz/se9VX/WnKMb5GUL3sYAXrniV
 EM2VEcXfAITbB66Cqn7kfNqubTXcmuChQptISXZ2Tr0t6Cl39jDp
X-Gm-Gg: ASbGnctvb/ztqug/XC7J6ev17VFsq+wWJBBuipk3558lD55vFw/P/8JI3z5ogcV6net
 F+MRBuaDMZWheNQwzAO+hZ8mib4dSgaCdNSGZiC9tIXC/LqS5Ko4vl9SRNHoVioVal0ZvxxrbVC
 OhJbQOPFj7b4CFq7UnDRyUuVI+N9qljNkXkDF4HXJnONotqxGpzPU/HNicNswGCGWOb5Jzr1BSX
 /3yxNbwbi8ta2jq8G1xd80T/7B8cxERG5cncJoNyCImS0aWVYI5wTiTNhL4NMB8x7Uk3/ZYHYqE
 9T8BmPbCAUA1s9RVbohG2uQfdSZWRwS/k7V1liXNtg==
X-Google-Smtp-Source: AGHT+IEl9AAm++w6tszNiHiWfiBZgIN92Q256sIYVAF0+OGgNQafoTkoaDQDck7lPyH/qHfgISwETw==
X-Received: by 2002:a05:600c:4e48:b0:43d:98e7:38dc with SMTP id
 5b1f17b1804b1-441c48aa36bmr109604715e9.5.1746548408780; 
 Tue, 06 May 2025 09:20:08 -0700 (PDT)
Received: from localhost ([194.120.133.25])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441d11b4c1dsm19852075e9.0.2025.05.06.09.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:20:08 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/display: remove redundant ternary operator
Date: Tue,  6 May 2025 17:19:57 +0100
Message-ID: <20250506161957.149194-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
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

The ternary operator is checking if ret is less than zero inside an
if block that also checks if ret is less than zero. Since the nested
ternary statement is always true then the -EIO return is never
executed and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 56c7e3318f01..155b4baf6ab5 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4192,7 +4192,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight mode: %d\n",
 			    aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	*current_mode = (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);
-- 
2.49.0

