Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2A19C6290
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 21:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9406210E00E;
	Tue, 12 Nov 2024 20:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PE4zFK/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0259510E00E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 20:28:40 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-71e4c2e36daso37623b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 12:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731443320; x=1732048120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v2FT/0mZJivL0ZZoqfs7CNBIJ1ZIhmKypOpf5tX8Zgw=;
 b=PE4zFK/bCPVb1fRupme/8Yw9M71QxVFgwZpvYI7Te6o5/khu2u9uKaFLCWtdD4TV/w
 1IjIRv+hixwZqP+oY97A+pCj6lJyQLl+1850uRq6FkLdrEUjd126Z/Y1AKrupWCqrBzX
 PH8Zay6aHUY6DODU3BjiJTMV6EQ36mTdmrmkO3g1Xfc5+79sRJDBXP+hSVA9OY5slSW8
 51EYwurPjahfjAxH1L4+2cHtUlVD60BMN305fDcVg49+rjkXvWEx0SgHOAmROU5NymZx
 eaZMTnlZMAC/NCnyMyo1+eUrO1MYDAbVvl9INBzZPExuOeXIRZ0EG3PO2xLiGfxj2033
 zCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731443320; x=1732048120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v2FT/0mZJivL0ZZoqfs7CNBIJ1ZIhmKypOpf5tX8Zgw=;
 b=oW5Eec/FUfZ/rnyC6cukdSGRI5OBn1TFNUlV2Y1AqsmwDEhrt8F6RYDmdEjO8u5gVz
 MUzzWCrRL2sRhtjZ0S6lSjU+MH7wMcy1iHF7QNXbZdVFO+OyJ05lV8l1KNUMni4O3Gkb
 pRNy9gGFM20oI0UhDlJKbuqpDGZkaGCBPiaCf9JgPmlAhjbD2BFi7CmzdWTVk7PjALnd
 08D8SPQ5TVzuyW4YEwYWqYR6+zMSwp8RE3AInd5leb76/LAfiE0RkUtSmDUM8PVTPtQW
 6GSOT0FKG/JImfU/5hjUuyc0Tpf2Q1dr0Nf5DDYlgje4sM9qVSygv3Ler0+QxYOVs0dW
 qviw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl2Ofy/IaGw6XRHJgoZx8WFW2n+8lemJoAJ0gWKkADLlIvfP00InLsxzkAhlKYxRMez0uZVIWjKOw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2BkhRdPD+YA3zxHw67dWbN91ReBKhrN/pI4pUNGo3WXUDUaR7
 ydHaDN+MbMm+3AsZ5nX9k/wGyltvdvEcLeMoVhd6L4VVnh5A1fy5
X-Google-Smtp-Source: AGHT+IFZE05j4koXdnVIsrWlQDXjIzpfwdaEM8dGhyz6pcxXqnrNsq+2+3l8Q0qtJRIUELTLwv5EbA==
X-Received: by 2002:a05:6a21:3290:b0:1db:e327:dd82 with SMTP id
 adf61e73a8af0-1dc232d87f4mr27396788637.5.1731443320448; 
 Tue, 12 Nov 2024 12:28:40 -0800 (PST)
Received: from purva-IdeaPad-Gaming-3-15IHU6.lan
 ([2409:40c0:23d:98b3:efff:2469:dece:37c7])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7240785ff9csm11767600b3a.8.2024.11.12.12.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 12:28:38 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH] video: fbdev: metronomefb: Fix buffer overflow in
 load_waveform()
Date: Wed, 13 Nov 2024 01:58:25 +0530
Message-Id: <20241112202825.17322-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Fix an error detected by the Smatch tool:

drivers/video/fbdev/metronomefb.c:220 load_waveform() error:
buffer overflow 'wfm_hdr->stuff2a' 2 <= 4
drivers/video/fbdev/metronomefb.c:220 load_waveform() error:
buffer overflow 'wfm_hdr->stuff2a' 2 <= 4

The access to wfm_hdr->stuff2a in the loop can lead to a buffer
overflow if stuff2a is not large enough. To fix this, a check was
added to ensure that stuff2a has sufficient space before accessing
it. This prevents the overflow and improves the safety of the code.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 drivers/video/fbdev/metronomefb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index 6f0942c6e..9da55cef2 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -210,6 +210,12 @@ static int load_waveform(u8 *mem, size_t size, int m, int t,
 	}
 	wfm_hdr->mc += 1;
 	wfm_hdr->trc += 1;
+
+	if (sizeof(wfm_hdr->stuff2a) < 5) {
+		dev_err(dev, "Error: insufficient space in stuff2a\n");
+		return -EINVAL;
+	}
+
 	for (i = 0; i < 5; i++) {
 		if (*(wfm_hdr->stuff2a + i) != 0) {
 			dev_err(dev, "Error: unexpected value in padding\n");
-- 
2.34.1

