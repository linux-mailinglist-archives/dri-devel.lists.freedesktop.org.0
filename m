Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C16400A74
	for <lists+dri-devel@lfdr.de>; Sat,  4 Sep 2021 11:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0466E902;
	Sat,  4 Sep 2021 09:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CD96E8FA
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Sep 2021 06:31:40 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 z24-20020a17090acb1800b0018e87a24300so1027489pjt.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 23:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1uz0oGH2peoXwoViq7ISy7dnv7QydlkNRkRbvHanRv4=;
 b=RAzfx9ZbzUl7+CFMq0YA99u/jBVlx0xAFoDQ2uq9SPGKcXCE2+Q2vR2gWB6JAYMuqQ
 MTGDDdoK8qKWA+vqpmJOEaw0lNPiQseAra9NdeULs/2vhQgOrSLeDLLrFmTBMzz1LghF
 /GD7qLHU/q4KrGboP47vLzgj0cNRHLW2SBxtpzpNAF+OmKtbD8J/yJUNtVpfg/yq2Jqm
 hE3lYVv3Po8vCIE2DYjbwKTk7sq47wqMRnSeSGII+7Vw31r8VB+D5tE1CwSfWatQnmmw
 /9Ddaz35OJUq3A581q5LUQqFK9uy+vLNA9W0l59W+KTB6FhEd2q+7pZmIVLy/o0LFkHA
 m+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1uz0oGH2peoXwoViq7ISy7dnv7QydlkNRkRbvHanRv4=;
 b=rRLRXfrN29ZasPYyENmB89DnTqyz9Zwwrj3EdAL89AIbcydLbFHsGthQwg4LNz7DuF
 puDf6y1HxWZagw6MAoYNrK6gKbHULYO1SvfhEwVieN2jvtTDpCQoBL9sodEythGAM1v5
 XVrvmDXF8ztBUnw92iqo3zI3MMnTpyH92l5Zv46hCezOesBp3kSTIuc3Ce/mnMMYvjuh
 cBYVA9KBLWtU7MVjdzOt5UnIQ0+6GHUDlAHMUuCw/F1XWEAik/Ixl3pjtKVezgOMAju1
 yJpMno09Nh2/C24J14WaOxM+SIyQpS9zAGEEviqdwGRD181W1asLttpezCaFxLTdOrRj
 iX+Q==
X-Gm-Message-State: AOAM531TrJLmh6aP39RHCv8onsL2LUMqD8RGmEqIzU5cDW28kldM1u8j
 ALKp4rE7xnSjnuVtonaFCm/F7XzzG782Ig==
X-Google-Smtp-Source: ABdhPJyuZpl9wW4ps+FAaEdQj7Q0fyN344v3p+LFNSy1+2G2NRjD4gsEKPT8X3Keja90XKvEm0DFKA==
X-Received: by 2002:a17:902:6b49:b0:136:3f21:7a9 with SMTP id
 g9-20020a1709026b4900b001363f2107a9mr2196578plt.81.1630737099883; 
 Fri, 03 Sep 2021 23:31:39 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:1c26:4b2d:32ce:9155:7c42:8667])
 by smtp.gmail.com with ESMTPSA id p24sm1408256pgm.54.2021.09.03.23.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 23:31:39 -0700 (PDT)
From: srivathsa <srivathsa729.8@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 srivathsa <srivathsa729.8@gmail.com>
Subject: [PATCH] Fix ERROR: trailing statements should be on next line
Date: Sat,  4 Sep 2021 12:01:27 +0530
Message-Id: <20210904063127.11142-1-srivathsa729.8@gmail.com>
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

