Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34E24C0E0D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 09:09:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8ECA10EF52;
	Wed, 23 Feb 2022 08:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055E410E509;
 Tue, 22 Feb 2022 12:03:26 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e14so350197wrc.2;
 Tue, 22 Feb 2022 04:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QbmY80ocxNOiijSbsV19VPgVTJ6ROSn9KA0LYKbj2Ss=;
 b=MwbETFFEcrGhyG+LH1t68UsAe53GCSf6urVxWoBvDVlCGfAcvUfapW8Uxq2bXd6Bw+
 aNVFsaEE9mCxY2/8v7SKrARfQWLVCFjZ1NWsZB6kbfSTPt7zurbCxv8a4q9oe/gQZ7zU
 DoUAEqETC2nTzi6H82/0Mxti9k2vVGD6zRNO4+59/m9VP/krtr62munaBLFtEX74wHc3
 cNTOniX5rpos3Liz/tyu+dimFrg/XCPhg3LEimTqM8RyCA8wU7uG4CnZV0MY+zaWug6X
 9QTWE+/aBMPOrBVboZ8H4+CC2tWeoWnbV0UrdobfF1KybUnzJNh5n4os6+JHJquE2Qj2
 57Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QbmY80ocxNOiijSbsV19VPgVTJ6ROSn9KA0LYKbj2Ss=;
 b=w9iXPtwwy8G0xfWDaNcg+QrHqLZY0TwHKa85OvN2vPuNb5k782U32AuQjD0Mmigqh2
 Bhm6OhlZvoo51Wzas3o3C+cPkCyPJDZLtYVVEeSQQqptqqxMLPip7IvqJIJAG5l901sy
 EpUyaCx9mQcjoWtJpXalvzllZ51pSCMJcTrkMtoFDBc489qpcAYA+PjafNSeYfC3q7Q4
 rBx9x8HYOXLNOAnJYBoa3ck8emSTj5wT9uf62IKqXw6EF6TCoAmXpJWw7a1pfNo5jLsb
 a4zYHJZZ25bGt7X/yJ4TxOKjDd9uGERNLnPb+SA3OyV+WrhNOwtghCbzEtfsUipJxXKJ
 cn7A==
X-Gm-Message-State: AOAM533h0tRncwNXk5lLU3m/PBTi/zYCMPCaVimo9wMDCDP6P2uDDOaG
 vV13xQj29MMHdn1+8jmwZdg=
X-Google-Smtp-Source: ABdhPJz+y6HNF/vXrsjO1hB+4KCEYzs7HiueM6A9qCnX0USE6K7ZbYhvnQYVzFCmpLKSxqerxRCFGA==
X-Received: by 2002:adf:f846:0:b0:1d9:3079:a02f with SMTP id
 d6-20020adff846000000b001d93079a02fmr19192537wrq.62.1645531404467; 
 Tue, 22 Feb 2022 04:03:24 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id t16sm3178500wrg.99.2022.02.22.04.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 04:03:24 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: make a handful of read-only arrays static const
Date: Tue, 22 Feb 2022 12:03:23 +0000
Message-Id: <20220222120323.86480-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Feb 2022 08:09:33 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't populate the read-only arrays on the stack but instead make
them static const. Also makes the object code a little smaller.
Reformat the statements to clear up checkpatch warning.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 3faea903b9ae..d49f66237ec3 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -378,10 +378,18 @@ calculate_rc_params(struct rc_parameters *rc,
 {
 	int bpc = vdsc_cfg->bits_per_component;
 	int bpp = vdsc_cfg->bits_per_pixel >> 4;
-	int ofs_und6[] = { 0, -2, -2, -4, -6, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12 };
-	int ofs_und8[] = { 2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12 };
-	int ofs_und12[] = { 2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12 };
-	int ofs_und15[] = { 10, 8, 6, 4, 2, 0, -2, -4, -6, -8, -10, -10, -12, -12, -12 };
+	static const int ofs_und6[] = {
+		0, -2, -2, -4, -6, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
+	};
+	static const int ofs_und8[] = {
+		2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12
+	};
+	static const int ofs_und12[] = {
+		2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12
+	};
+	static const int ofs_und15[] = {
+		10, 8, 6, 4, 2, 0, -2, -4, -6, -8, -10, -10, -12, -12, -12
+	};
 	int qp_bpc_modifier = (bpc - 8) * 2;
 	u32 res, buf_i, bpp_i;
 
-- 
2.34.1

