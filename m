Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A216147B8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 11:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98B010E372;
	Tue,  1 Nov 2022 10:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1077F10E372
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 10:29:50 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id j15so19505386wrq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Nov 2022 03:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N2+PF9plcSy2ATWJiPecwWooFcxaUwfoTFa4mF3SLg4=;
 b=o7VSw37luCk1txJUxzqGQMkFhWqPrkJ/Xe4dZxvAF9K2NLZee08637+m3uU3zEBMD8
 bFO4nxwVEdbyrKqJly8BfZ4hWbE3+grDvZdJlZ3q9qPOcgAUJ59XiFJ3BbU149QiwV/7
 P6oI8ORxdxlYwPKtwapsFoBp/qyk00T9LJq9ctjEF87jRgCoMec0FV3ZFXt3rNp6ANKp
 UTLiY1KkIG6lcSKnnBfk95DYCakxEpX58/xK7SZgBaLPB0R6qV3LehugPLa+KaAv/7LJ
 LsDY6ETq96leRawKoZTv4IjoR86J5X00p7uloSGefTQn2z3a+f60lCUKVmeRVCiwUzo8
 t8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N2+PF9plcSy2ATWJiPecwWooFcxaUwfoTFa4mF3SLg4=;
 b=V7tuUu+WvaQkweXxGvg4MwEMigbTcpKoj75EFJzXILU2pUuTQB0j4yvMrzLGNKGVIH
 9Ih8NnC4GHLRPEcdQ7uFu2/pnPsrJOG3pwWrvngoDNLIm8mUctU0PbJt+J0Qbv7kh04w
 eC13k7AQD4pqZZOIHH71HuuskYgRqgAq341YRuAc5OFoogYW2oe+mJFMfNjaYrTxU4C6
 WndrperjpwuU/VdSUusQQkkOHOFq+NYbP6sgM+XXDSyrZdx9NNh1yyGCqIBL7HVtoWwk
 l9l8O1h37TzYFKkcBdcCsKS86ETv3GbEjVZwiK3BcQ3xsSK9Umhhby7CuOFkjHWCrji+
 RGDA==
X-Gm-Message-State: ACrzQf3d986ZvTBtBiOW/uSyWl6pW7nk/IHYkFVVQmmxKSDs/4dAoaCT
 VBBpZa6nL1JrBjbL0CcTn8Y=
X-Google-Smtp-Source: AMsMyM6AaaZkGwEBkHo0F9rE7Xc/JyFXaDjj/Nj1mXN0rOHNFWvZVdKnRcqhCbJgXxu8mE3QnxWurg==
X-Received: by 2002:a5d:4ecb:0:b0:236:be56:1a6 with SMTP id
 s11-20020a5d4ecb000000b00236be5601a6mr8691097wrv.252.1667298589374; 
 Tue, 01 Nov 2022 03:29:49 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 n44-20020a05600c502c00b003cf537ec2efsm132921wmr.36.2022.11.01.03.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 03:29:48 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Helge Deller <deller@gmx.de>, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] video: fbdev: omapfb: remove redundant variable checksum
Date: Tue,  1 Nov 2022 10:29:47 +0000
Message-Id: <20221101102947.27524-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Variable checksum is being used to accumulate values however
it is never read or used afterwards. It is redundant and can
be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
index cb63bc0e92ca..b33f62c5cb22 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c
@@ -129,7 +129,6 @@ static int hdmi_core_ddc_edid(struct hdmi_core_data *core, u8 *pedid, u8 ext)
 {
 	void __iomem *base = core->base;
 	u8 cur_addr;
-	char checksum = 0;
 	const int retries = 1000;
 	u8 seg_ptr = ext / 2;
 	u8 edidbase = ((ext % 2) * 0x80);
@@ -178,7 +177,6 @@ static int hdmi_core_ddc_edid(struct hdmi_core_data *core, u8 *pedid, u8 ext)
 		}
 
 		pedid[cur_addr] = REG_GET(base, HDMI_CORE_I2CM_DATAI, 7, 0);
-		checksum += pedid[cur_addr];
 	}
 
 	return 0;
-- 
2.37.3

