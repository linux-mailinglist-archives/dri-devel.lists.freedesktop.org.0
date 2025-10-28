Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03616C1314C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 07:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1C410E58B;
	Tue, 28 Oct 2025 06:09:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ewKEmkQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAFE10E58B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 06:09:33 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7a1603a098eso3299232b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 23:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761631773; x=1762236573; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZxCaZgetgi7vR+cOn85gSzckFRkwOHE6DdvavzMKaQo=;
 b=ewKEmkQ1nSC9MniTKx/fI9xJnu/bN2WvdZ58Jmc4DfKz6LlEVJhs5R7kwtpkdono88
 1KwgnR+CtT5m1kxmK0jeU5xk/MfEFlyXMptj25qUqbJkj9dUI2qWYOS894cIDtCVhtJz
 e2FhudAD15GHDyZ3Vx/iR3ACSfSBmiRdUWcmI/1NJmsaE81P4mpv1jlxs9R0MfVgApQv
 Of/4P29uwB0lY5o0/p7IQNm/zPY/q8qP44La/V1d4WQjWcy8SN6dxF2OoDiF8cW1jHti
 fPWS9OX7aJ4ksyDObrq/T4Kpap3kmREiVKL9OuKfD8aHfkfbI2t/IjoKH89rnkITOwAg
 vRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761631773; x=1762236573;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZxCaZgetgi7vR+cOn85gSzckFRkwOHE6DdvavzMKaQo=;
 b=Lk2OQFuw5bQb5mEXbHsIaF+kHZ2giIeWbZUz3V6SG+SWCp1/ZrrDr5NrzPKIHN+Vdk
 hAvnWAL8rhrnBQWdyzXfkoB83dZGUp1bXpukLKH0spEIz+5bGOxcO5UwumrEKbvPFCXN
 bFCFQlU5haMZ5pCPLSVVqsbE98MMuTCx72KgvZSPkJAmLvppwu0ryC/JUtBZX3LTaXqL
 jZO+Cfc0X51DRBDHwJamQCiAZ9bChljqzT0NOC+e2vLlPEETO+dXmazE4PvwNUlDBQY4
 W9tFutcaMalNxdegLSppSys1zzn4LsJyaTIXIriXSDHOUXeECRwvfX2EZ7KkELnbHrQT
 f6Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/JF2ykDvk6zK0Gdrq4GOfq6SeaD/YSsdsSvuJ8kGiONLV87a//VBh2q4TcLSnvEINvnuizLYXMq8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA9nxebm8Y2CJ62ckfTUNp0PlcgHoYT3wgGj/4v3dcRjGtzTA4
 hDQlhWRVw/AYc1jE5ZZOAqsCpZF0fFwb5sPNWKG7i6SRe6N+es6X/yJM
X-Gm-Gg: ASbGncvgSYZfTarp0iULgiGW5fsVJ8vg2jHVVNXKlHjAru9OnTmApdg8M/XmsOHvfJe
 c8/ERtycYS6erjxBIpY/xoW+oyE7qaF1zTrfyjmX3/6gRPYeYQzkij8ilAAeS1OjimUHsMmqzQd
 X3O5fwxWdlIfHeN7UcLkXQALyRIVihLHFrqAWmkWrMtAKp1D6Jr02HgtMgIxL/B5AaKTqaxab0y
 gCfVwcyG1rq96dI5tX2JbFX29gE/0EWlN2MCnhp9u64i0G+2p2Zb79Wfc57veE+1koLxuXJhB7l
 TqgMlOwUV+XEWiouZmTs7pRHHX5ZY7DlpVayW15qeIjbJiIGfc9gKiHgwVq0ygvGEYOygHa2rqW
 Zk80xi/p5opAvRV4FEuwj0uuU4eIV+9wZ3yzOR66wFKE/sJcnnK+7G9se3fOcb+VVbsHEiXVeX0
 YcwhKUrv0FrnATsNz9SE3dhw==
X-Google-Smtp-Source: AGHT+IH1+F3wRNfLwu/JVjiQE8TzFdjDfCqQgZpgSMYvuq3FzyuWy/Ro1wdBKzwG6QcCND8qtflldg==
X-Received: by 2002:a05:6a20:158a:b0:341:c255:7148 with SMTP id
 adf61e73a8af0-344d345618bmr3246377637.28.1761631773211; 
 Mon, 27 Oct 2025 23:09:33 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-b71268bd810sm9382533a12.6.2025.10.27.23.09.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 23:09:32 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/of: Fix device node reference leak in
 drm_of_panel_bridge_remove
Date: Tue, 28 Oct 2025 14:09:18 +0800
Message-Id: <20251028060918.65688-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

of_graph_get_remote_node() returns a device node
with its reference count incremented. The caller is responsible for
releasing this reference when the node is no longer needed.

Add of_node_put(remote) to fix the reference leak.

Found via static analysis.

Fixes: c70087e8f16f ("drm/drm_of: add drm_of_panel_bridge_remove function")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 include/drm/drm_of.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 7f0256dae3f1..5940b1cd542b 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -171,6 +171,7 @@ static inline int drm_of_panel_bridge_remove(const struct device_node *np,
 		return -ENODEV;
 
 	bridge = of_drm_find_bridge(remote);
+	of_node_put(remote);
 	drm_panel_bridge_remove(bridge);
 
 	return 0;
-- 
2.39.5 (Apple Git-154)

