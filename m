Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24043398CE4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B768914A;
	Wed,  2 Jun 2021 14:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971086ECBB
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:19 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 h12-20020a05600c350cb029019fae7a26cdso1788289wmq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GHanPGk1uQOVUKO22D7xcyQQ9/A6KPvFy4YVhuM9AVY=;
 b=weSv2bllCF3e1ehlxVmp/Vvyzjp3E0FY5fNrrrpD3iURB5k45Pm9TcA8+Js6WKxf9x
 GBOz3TS5syfRjralVfYe6JUyG4b+LJpNVkDMHsCTnZljPC/qsrTJ0zxNpBYRoSPEBmKp
 M+2ltZkccnBPhUHs4STlukcGb6tbBJLnlox2mb5rCUdn+x7DmFYRXrAZvkZAkSNxXvGK
 r5zgx29duwCL6x9FTP5DkBZJYxX7cwxdb8yKSXv/z3LKd4xcIyyfY2deucptM8t8Z9oH
 SI60mk5cLgN0+nk56E9pB0KMNPyWgJlApL/Gf3Rdi1rhs84sWsjxUXNj1YSfwC48Vi3E
 bE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GHanPGk1uQOVUKO22D7xcyQQ9/A6KPvFy4YVhuM9AVY=;
 b=uMa14Xz/rFWwZvB7HjklM5WjT4F6Dfonya6eoUEChsjlccWnzhoZP5olXZG+h5Un3K
 /8QoRQuWuxylTTRfzrVaF8YqqcTUVM1B1HrjUUKbkze5AKfYQDdcHKiId/PtcqxputQ2
 ipBLbPkpVFM1K6sET+aZdiIjI4HLGSdqyddP+38xcIX8OIJO3kdZgmGICMqsv6ph22P0
 3VXugx7iSFdBuZU+90AnB3sJquOMJ/bktz9/NXC3dizEwtXguKrHmMDtLGAxtVn4s+rE
 VBlgV6lZw4UWAdY/V1A5il4U/N+9oopltWC/Y9HlrOp9BoOahxxHgFxyzJQ5T9cNK943
 Ye7w==
X-Gm-Message-State: AOAM5328TOhVWtyWR1EcxsltwIyICLiwSAJXmE8dMqPjtdQ3ZTvTBR62
 P/srKct4gOThn+E47r9jDwoypQ==
X-Google-Smtp-Source: ABdhPJxN9ta9qy0R5f/5vOwNfZet9pXrYS0G+jE+L4Zlx+LNSFezFCkj20cY+A42n9v7q6yu3KHE2Q==
X-Received: by 2002:a1c:1f4a:: with SMTP id f71mr5593727wmf.146.1622644398348; 
 Wed, 02 Jun 2021 07:33:18 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:17 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 08/26] drm/sti/sti_hqvdp: Fix incorrectly named function
 'sti_hqvdp_vtg_cb()'
Date: Wed,  2 Jun 2021 15:32:42 +0100
Message-Id: <20210602143300.2330146-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
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
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/sti/sti_hqvdp.c:796: warning: expecting prototype for sti_vdp_vtg_cb(). Prototype was for sti_hqvdp_vtg_cb() instead

Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fabien Dessenne <fabien.dessenne@st.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/sti/sti_hqvdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index edbb99f53de19..d09b08995b12a 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -782,7 +782,7 @@ static void sti_hqvdp_disable(struct sti_hqvdp *hqvdp)
 }
 
 /**
- * sti_vdp_vtg_cb
+ * sti_hqvdp_vtg_cb
  * @nb: notifier block
  * @evt: event message
  * @data: private data
-- 
2.31.1

