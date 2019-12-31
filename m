Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E309B12DBE9
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 22:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B0089F5F;
	Tue, 31 Dec 2019 21:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7EA89C94;
 Tue, 31 Dec 2019 20:56:12 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id bx28so35965064edb.11;
 Tue, 31 Dec 2019 12:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=Z+jvCslck9jvZyqIDORlvWYlx3m5W/qD1J93hFFm1XI=;
 b=vTVkJzzZyTHRnHwXoQ+eaVI3+LJyxV952KBN+N+Q/ZpyUXtN/8gNFsObt12NPIwVo4
 uZRpH8xALxFjZQKvaSGKY3I2tfoT73sv+Lqes0GyJjlJkfh5ZH3ckmHEfnJyWvDTFuUa
 f+BgxgScMy8o1UaqUz6y943UUrImEa7YrILZITWYD7glhutNyPO4MSNw2qYkmnZlqhhh
 tao2d9IOAcF238DT0AegtIKHWs2+moRepni8WZS2g/1M+PLIx+LkkZXkKMzA64o7atbb
 uGXqQOOB4R9PftsHT44ao8N/+mmH25ApN4MS4UXykKwVqW2dpLUeouVrmUCg9gs9qRWD
 sJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=Z+jvCslck9jvZyqIDORlvWYlx3m5W/qD1J93hFFm1XI=;
 b=VOi4ae8GBkzhcRrk2TLMCPNcw87PKhtzEsesxQu1zxB3upQ5IsjHSqp5KTKpUScC8K
 1G6m0NCqB/NyHS4tw6F3mL407bFSmIc6kuTh/vG6dYqBdLO0gcp3CjtW9lNYhYWhPmq1
 lt4ecjR34yy09s03xu6LZXpPECgv8QuUU1q1ot5ymUXGgDZTvaoSlPg8WuZajDLVGiFr
 x6pGBGdURY01CnORFmteBslAoIzYziPAFwTdscrTQOsPVTwzVkp6bz+ltN/UDkl3cct+
 6je5QbNyVUSHnv2fAjunV0qDrNgxMWd8BHfcgiOSQsUJiS9rQ1yoD44tgWeJNJIelXj2
 NKFQ==
X-Gm-Message-State: APjAAAV4FNwNj4oQ1HTEcVFKH9zvOzHh0L9vAaNmR9sAhbLfofQF3zcG
 yWUrQ7CCGBJlkBfZo1XeguU=
X-Google-Smtp-Source: APXvYqxJ3dpj0n5GpU6dZRMCRgNpsDhzBQryxTk7/n7qJ79bFKRe5XPY0TwPd5dLwuEVv4yJNJ7lhQ==
X-Received: by 2002:a05:6402:609:: with SMTP id
 n9mr79544990edv.305.1577825771379; 
 Tue, 31 Dec 2019 12:56:11 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id r9sm6341288ejx.31.2019.12.31.12.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2019 12:56:10 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: remove set but unused variable.
Date: Tue, 31 Dec 2019 23:56:07 +0300
Message-Id: <20191231205607.1005-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 31 Dec 2019 21:04:21 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The local variable `pclks` is defined and set but not used and can
therefore be removed.
Issue found by coccinelle.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv04/arb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/nouveau/dispnv04/arb.c
index 362495535e69..f607a04d262d 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
@@ -54,7 +54,7 @@ static void
 nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 {
 	int pagemiss, cas, width, bpp;
-	int nvclks, mclks, pclks, crtpagemiss;
+	int nvclks, mclks, crtpagemiss;
 	int found, mclk_extra, mclk_loop, cbs, m1, p1;
 	int mclk_freq, pclk_freq, nvclk_freq;
 	int us_m, us_n, us_p, crtc_drain_rate;
@@ -69,7 +69,6 @@ nv04_calc_arb(struct nv_fifo_info *fifo, struct nv_sim_state *arb)
 	bpp = arb->bpp;
 	cbs = 128;
 
-	pclks = 2;
 	nvclks = 10;
 	mclks = 13 + cas;
 	mclk_extra = 3;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
