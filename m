Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DB73F3998
	for <lists+dri-devel@lfdr.de>; Sat, 21 Aug 2021 10:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DE26EB53;
	Sat, 21 Aug 2021 08:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4F76EB3D;
 Sat, 21 Aug 2021 02:08:58 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id b1so9065721qtx.0;
 Fri, 20 Aug 2021 19:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5rmZq2jCxAvIhofkzACUjKttO0y4HbkUv8rY8k6EePI=;
 b=uZK0SHNBb/k1ROgKuOH0g24HQB7ulXr67Dq7Q+umzl6RdC0vL+Q5uedspbq/LL8vOq
 PG4M/kUYXWpF61g0jh4a3RNBNMo+8yGUu+wv0i+De7OMcKYv5AnFQPEnlDQ70oXYB7MH
 aeb8dQ0wzRbyyQdXelwmaf/AzfMqQTBLzeVVVPRFuTatrFLCdMKa8kzdvLlEtbvbfw/T
 63gCyEpll1pNNWEuIRrefSzYrXZgiY39lYTXAC0VK9o0A8yNonmB4v/LtawrJ7UGOENb
 cLEmvSdxRZkFAFuD+ykdvvRaagTQVJB4ZObt3mQoXx8bbMxfDmsHj8FNfKoYjz4ke0Tx
 x8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5rmZq2jCxAvIhofkzACUjKttO0y4HbkUv8rY8k6EePI=;
 b=nVbpMptoYUtFxg2c/VqxaNCKAVrvtc26sSROiQkb6WFY37O12x9wW7EmeaI29N7It9
 h6kusH9XI7vOdoesbPIxEvj6cBSJYM1TLtmQ1QiZv7z580CkkZbvKjTkdKuEK1YVP4Cc
 LjOZ2VJkVt+eZ4BNyTTXiR+8lE5kO0NJa1AUCXkj49AS6OAv5PEoOfqfNSH2DFVkXA63
 KPKD8UbEP6h7dqmnC30K3nSZ7y3ArwIevXpOJgEKhVEI9VOC+DR6/aQPoGiNh5PFaxsC
 9TNt+Lu5xEJOwyePhu+BjN/6lkZoVpiAVYiw5QUr+LQb3FGt8RdtTigxxqRT06dKYTx5
 OYAA==
X-Gm-Message-State: AOAM531v7TLjzCV3CpthhrGxn7Qr/dxr6sBXz9Wx2rW/qqMZvI2wKmUU
 bd/42P6KPGN+v91GJbF5qqA=
X-Google-Smtp-Source: ABdhPJwCMnko/lPDWDq9yleBzmkHdqGBnR/meG6zUXRzZjSzTXmjUqKBv4DILXWIuJgX0J8DG+2P+Q==
X-Received: by 2002:ac8:5744:: with SMTP id 4mr20939078qtx.326.1629511737627; 
 Fri, 20 Aug 2021 19:08:57 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id g12sm3221652qtq.92.2021.08.20.19.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 19:08:57 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <luo.penghao@zte.com.cn>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Pan Xinhui <Xinhui.Pan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Luo penghao <luo.penghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] drm: drop unneeded assignment in the
 fx_v6_0_enable_mgcg()
Date: Fri, 20 Aug 2021 19:08:44 -0700
Message-Id: <20210821020844.26864-1-luo.penghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 21 Aug 2021 08:46:30 +0000
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

From: Luo penghao <luo.penghao@zte.com.cn>

The first assignment is not used. In order to keep the code style
consistency of the whole file, the first 'data' assignment should be
deleted.

The clang_analyzer complains as follows:

drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c:2608:10: warning:
Although the value storedto 'offset' is used in the enclosing expression,
the value is never actually read from 'offset'.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Luo penghao <luo.penghao@zte.com.cn>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
index 6a8dade..84a5f22 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
@@ -2605,7 +2605,7 @@ static void gfx_v6_0_enable_mgcg(struct amdgpu_device *adev, bool enable)
 	u32 data, orig, tmp = 0;
 
 	if (enable && (adev->cg_flags & AMD_CG_SUPPORT_GFX_MGCG)) {
-		orig = data = RREG32(mmCGTS_SM_CTRL_REG);
+		orig = RREG32(mmCGTS_SM_CTRL_REG);
 		data = 0x96940200;
 		if (orig != data)
 			WREG32(mmCGTS_SM_CTRL_REG, data);
@@ -2617,7 +2617,7 @@ static void gfx_v6_0_enable_mgcg(struct amdgpu_device *adev, bool enable)
 				WREG32(mmCP_MEM_SLP_CNTL, data);
 		}
 
-		orig = data = RREG32(mmRLC_CGTT_MGCG_OVERRIDE);
+		orig = RREG32(mmRLC_CGTT_MGCG_OVERRIDE);
 		data &= 0xffffffc0;
 		if (orig != data)
 			WREG32(mmRLC_CGTT_MGCG_OVERRIDE, data);
-- 
2.15.2


