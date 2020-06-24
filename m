Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E401C20768B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 17:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EFD6EB6F;
	Wed, 24 Jun 2020 15:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD076E133
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:04:45 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l2so1373489wmf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 08:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZjEPJ8/mm+wq5v36TYnyxcBS/a58z/cHHdKeFkfsfDE=;
 b=zPM0JoTekc3JwBTNgIwFO0P3svCMqz6zlvJHpDXyqSoLZJPlvT/40LKl7KnfnXmcOt
 qzD/hMl0Xi1GGBucNTt7iR4B4Xu1v04fUHYnRuvCkawtPjRw8DidaYzoxiJu6TZLLrOr
 Z5F3E2NaRAqvya3W1eGzceaDjDFLn/S08pifh4nAlO3JVcKUm5EOTsr3xiIuocLLSsTd
 /xyUNzkGVlysC/Y0PAaGQhWXhrhlJgo3T0Y83UmpYsnTZd6zUE+GCCuRwdATo1kAt5nc
 NljRyk6f15Lt1rFcApUW2wX5Kdbn9BDptRox73TfhNF0TsdTMSIopA8pPN/+fwS71EaG
 SURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZjEPJ8/mm+wq5v36TYnyxcBS/a58z/cHHdKeFkfsfDE=;
 b=XU8BjJyddjt76n848JEc2WeehYUfrTs1cY//toapg9A/u6ZC3Hz3mfuQw5vHVSZvkZ
 4hxSHASY2RBCfFgsIJG+l2gyl442vlZweWg77PhDVZQQ8KmVO4ygMSstbVqjy3LoVhFO
 aSv2K1ifT5U+a8X+pzU0hTNebXKj2gTmsCSqBNx/rADcH0ZRCGsv/B3LNvWJWodPaTTg
 uKaQ/Ng6BVK0m0JovHYzPJbz24PlI85FbzmhJT4n9KbxGzJI5pUXFFk082vxLRBzQ1/q
 aopRu4XyFogT8msK9PDZpXMp0Oaac1LemPVPSeb1G/SiErRusaR1V1oOozAV3HZrybPV
 9BTw==
X-Gm-Message-State: AOAM531w/lnCXR1lEABs+yiGj7OxISxIbsqiihutMyJSQMeuDgcCEbiN
 Kkslq+XhcqoxeD3tkbGu19WFcw==
X-Google-Smtp-Source: ABdhPJyBpq4p7XjDew8RzlYmMmVACRb7x1fhGgY5R/YmeMhjkFjmrwgSZSWjfeVp7THuMLPsMbh1fA==
X-Received: by 2002:a7b:c30a:: with SMTP id k10mr25791251wmj.44.1593011084237; 
 Wed, 24 Jun 2020 08:04:44 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id f186sm8200319wmf.29.2020.06.24.08.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 08:04:43 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: daniel.thompson@linaro.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 3/8] backlight: ili922x: Add missing kerneldoc descriptions
 for CHECK_FREQ_REG() args
Date: Wed, 24 Jun 2020 15:57:16 +0100
Message-Id: <20200624145721.2590327-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200624145721.2590327-1-lee.jones@linaro.org>
References: <20200624145721.2590327-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Software Engineering <sbabic@denx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Kerneldoc syntax is used, but not complete.  Descriptions required.

Prevents warnings like:

 drivers/video/backlight/ili922x.c:116: warning: Function parameter or member 's' not described in 'CHECK_FREQ_REG'
 drivers/video/backlight/ili922x.c:116: warning: Function parameter or member 'x' not described in 'CHECK_FREQ_REG'

Cc: <stable@vger.kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Software Engineering <sbabic@denx.de>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/backlight/ili922x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/backlight/ili922x.c b/drivers/video/backlight/ili922x.c
index 9c5aa3fbb2842..8cb4b9d3c3bba 100644
--- a/drivers/video/backlight/ili922x.c
+++ b/drivers/video/backlight/ili922x.c
@@ -107,6 +107,8 @@
  *	lower frequency when the registers are read/written.
  *	The macro sets the frequency in the spi_transfer structure if
  *	the frequency exceeds the maximum value.
+ * @s: pointer to controller side proxy for an SPI slave device
+ * @x: pointer to the read/write buffer pair
  */
 #define CHECK_FREQ_REG(s, x)	\
 	do {			\
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
