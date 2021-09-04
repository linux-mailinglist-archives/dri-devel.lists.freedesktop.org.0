Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3898E400A73
	for <lists+dri-devel@lfdr.de>; Sat,  4 Sep 2021 11:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBAB6E900;
	Sat,  4 Sep 2021 09:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFBE6E8FC
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Sep 2021 08:09:23 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id x19so1341213pfu.4
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Sep 2021 01:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FM13umhiUZ5Y1cUzG3acpmqo6yaDvf6xGiDzXDodIV4=;
 b=D0uiAgyFHTZSJ4/mZMzCUe+Jr2nKhjSLljLCR+masb9b9IJGho5k7blEZ1czjm5rdu
 nCNNYHTB8l3Pl47jvWNNjjAY/e+j660nE25+7fcj9vOAg191PVM7eiMAWx5jdXd5U8FJ
 Qu3B8SBmkuezbXMEijcA3FoWGXOGJ+6tqEaRwHS/B9QEpdc2OvAu72ORHNHUyRpPfBaY
 lGUJ5441GZRBape+BPLrCjTyKCccIAoGqKfc8jl3NQiCxPk/sMXq5KkV/aSvtVLF+8nI
 sCBRWe7mKtFAcS7uW7faPNazuW9lYnqig0m/MRU/P36SnSQ5cV6hPRRZ0aYGJHuKnrzO
 FJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FM13umhiUZ5Y1cUzG3acpmqo6yaDvf6xGiDzXDodIV4=;
 b=NIvNNGQfjbDtCgscljAtzllMghGOLj+Qa1TkoadR/Sw5IQM5Ke21fVzsNMLxEKZjO+
 vjHGY1y5s73fBiB0J3LIEaOFhFLAkH4RINqbwRrbAdqU0qoo1U0owLYdH3L4aYNQo4xx
 6h6YwF5PcPWg5b3mpcJ8qvyNc7iAG7FmRtgbH5RPkqETx0iqzY5LCbOR2INBX97lf/eX
 1+ewDHPg/t4TkboPHSPk9GGcDxWVgkCXtTwLiAFVBQabrLJQTK7dKn6Zz1ECM/OM938n
 mDx+/VUv7v/xm/osiARS7KlOZmd/sNzanEFXXRQhaGRPnFQiU4Aggha18xDplXx1ZA/G
 Se9Q==
X-Gm-Message-State: AOAM531SY90ugSYtOCobqe9+9KWgel0YJBX6KBLLPGnMpEf71ANplmqV
 4+4qXkM054+sW+TZzVQAk60=
X-Google-Smtp-Source: ABdhPJyWZDgzCINK92xB/oRyNQ1gtNbqN/d0OGjoJcpsnAW/olWibQZxe3s8v9+NLAWK4kHylgXOCA==
X-Received: by 2002:a62:a203:0:b0:3ea:eeb7:fdd with SMTP id
 m3-20020a62a203000000b003eaeeb70fddmr2558895pff.59.1630742963493; 
 Sat, 04 Sep 2021 01:09:23 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:1c26:4b2d:32ce:9155:7c42:8667])
 by smtp.gmail.com with ESMTPSA id v8sm1445652pjh.24.2021.09.04.01.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 01:09:22 -0700 (PDT)
From: Srivathsa Dara <srivathsa729.8@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Srivathsa Dara <srivathsa729.8@gmail.com>
Subject: [PATCH] staging: fbtft: fbtft-core: fix 'trailing statements should
 be on next line' coding style error
Date: Sat,  4 Sep 2021 13:39:16 +0530
Message-Id: <20210904080916.15476-1-srivathsa729.8@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 04 Sep 2021 09:31:08 +0000
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

Fix coding style error 'trailing statements should be on next line'

Signed-off-by: Srivathsa Dara <srivathsa729.8@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index ed992ca605eb..65de1c02e7dc 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -1038,7 +1038,8 @@ int fbtft_init_display(struct fbtft_par *par)
 			i++;
 
 			/* make debug message */
-			for (j = 0; par->init_sequence[i + 1 + j] >= 0; j++);
+			for (j = 0; par->init_sequence[i + 1 + j] >= 0; j++)
+				;
 
 			fbtft_par_dbg(DEBUG_INIT_DISPLAY, par,
 				      "init: write(0x%02X) %*ph\n",
-- 
2.25.1

