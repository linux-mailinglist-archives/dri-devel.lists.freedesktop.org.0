Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F5D8FE736
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 15:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565F510E145;
	Thu,  6 Jun 2024 13:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VRsM++o4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D6510E145
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 13:10:30 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a626919d19dso382815066b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2024 06:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717679428; x=1718284228; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LLTo6IN//CUfT633Q+EgtwxBk4Zhgr8yvAaTHaRrJKc=;
 b=VRsM++o4cGIww0cujOgoP1aG+jiwhGEABzbpTseB7pXGscH1CeG+oPImAVFk23OMo7
 uVTRigvLlh6fQVlJNu5L7YVzdBTDMNWXOTV18qU9WP5mB7YRT+F7Gx9aQZHsGwv/2Mwg
 qmZOjjWkD6ZrynWgudffU9ZPXBohzzfaBTEG6A8aM/bz+SKPXpXX6cneguTowSQIRXMk
 W+3FFlsBMllEMjf9yvFG/JtrnRxzREW+oTNmMYr8tpxvl7w4VV/VoJO2H1T/wKbVSipC
 6ddfjLssseVnPU2YLcIn0dfn20pIx+b2bAyAvVDcvQkPQ9uhKBId1dmz2KvfsEboSwmL
 S5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717679428; x=1718284228;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LLTo6IN//CUfT633Q+EgtwxBk4Zhgr8yvAaTHaRrJKc=;
 b=AZ8USKomBCEVg8gRHwtAWmKfGM/8qA+FrmMeoZJ2zv6+P9dlHCNF8+XHzQb8NGe06+
 8EzujYTsG8Ns0f6jKVMklxDlH/gX75Q+tjBtclK52WV+yJorQAw3haeTOtf/fOBisCRo
 W/nZAVk5Il8mmoye97u4sktoY3JGOtWwsKAFXlTjjgdbGSk9n+dL1PdCKRjQpi5xx0mm
 3gXtItlmxMo1t/dEal1Xh1w9T8t+/eBKRjeVRNk/97ctaE1g0EjtmuMaqTW/n3gezHrE
 dltREzkFzQ8VQLXI/pReup0lPSONQ5nqWliwLWUW1uo7V92VOrOYYf4sgUnf3AxG85IL
 6qVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1PVFWQV19LEpbGWgr8oU/qa6zGV5m3CSGUoCgWCvhjfO3buZ1kGpBTqZOUd/ZK6vo1nvPWPt0MsQq1qJeXPUnm7X0oj0PyA6EdKhetgbA
X-Gm-Message-State: AOJu0YxAm2WdwlMWmj2qgINfWrUGSqeXMNx9S/vClRdYu7z1eOPZyOEs
 S4D33KAqhfHzTUbUlmMpbRBtCDCNFGSVMjFUMOgTwkSMnFQG0/VQK35C7QD978I=
X-Google-Smtp-Source: AGHT+IE/O3Z7xTXrhanwtiiAy00RvXG9RUOoWD1wIob6c3DU4S0+HjI1sOf6DL7JHERx+RQuhoT5dg==
X-Received: by 2002:a17:906:e218:b0:a68:a476:6957 with SMTP id
 a640c23a62f3a-a6c7650a2ffmr216652566b.24.1717679428406; 
 Thu, 06 Jun 2024 06:10:28 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6c8070e82esm94963466b.161.2024.06.06.06.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 06:10:27 -0700 (PDT)
Date: Thu, 6 Jun 2024 16:10:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrick Gansterer <paroga@paroga.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] backlight: lm3509_bl: Fix NULL vs IS_ERR() check in
 register() function
Message-ID: <187b5bc5-a010-46c2-8ead-980df9efae79@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The devm_backlight_device_register() doesn't return NULL, it returns
error pointers.  Update the error checking to match.

Fixes: b72755f5b577 ("backlight: Add new lm3509 backlight driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/video/backlight/lm3509_bl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/backlight/lm3509_bl.c b/drivers/video/backlight/lm3509_bl.c
index ab57f79ffe23..c93cdedff5ad 100644
--- a/drivers/video/backlight/lm3509_bl.c
+++ b/drivers/video/backlight/lm3509_bl.c
@@ -114,9 +114,10 @@ lm3509_backlight_register(struct device *dev, const char *name_suffix,
 	}
 
 	bd = devm_backlight_device_register(dev, label, dev, data, ops, &props);
-	if (bd)
-		backlight_update_status(bd);
+	if (IS_ERR(bd))
+		return bd;
 
+	backlight_update_status(bd);
 	return bd;
 }
 
-- 
2.43.0

